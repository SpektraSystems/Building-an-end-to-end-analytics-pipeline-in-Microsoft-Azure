function PollUntilCompletion {
    Param (
        [string]$uri,
        [HashTable]$destHeaders
        )

        Write-Output "Waiting..."
        
        $response = Invoke-WebRequest -Method Get -Uri $uri -Headers $destHeaders
        if ($response.StatusCode -ne 200)
        {
            Start-Sleep -Seconds 1
            PollUntilCompletion $uri $destHeaders
        }
}

function ProcessResource {
    Param (
        [string]$resourceType,
        [string]$filePath,
        [string]$destArtifactsEndPoint,
        [HashTable]$destHeaders
        )

        Write-Output ""
        Write-Output ""
        Write-Output "Processing $resourceType"
        $srcArtifactsEndPoint = "$filePath\$($resourceType)"
        $files = Get-ChildItem -Path $srcArtifactsEndPoint -Recurse  

        Write-Output "Found $($files.Count) $resourceType"
        foreach ($file in $files){
            Write-Output $file.FullName
            $name = $file.Name -replace ".json" -replace ""
            $content = Get-Content $file.FullName -Force -Raw

            $uri = "$destArtifactsEndPoint/$($resourceType)/$($name)?api-version=2019-06-01-preview"
            #$jsonBody = ConvertTo-Json $_ -Depth 30
            $uri
            Write-Output ""
            Write-Output "Cloning $resourceType $($name)"
            
            $response = Invoke-WebRequest -Method Put -Uri $uri -Headers $destHeaders -ContentType "application/json" -Body $content
            if ($response.StatusCode -eq 202)
            {
                PollUntilCompletion $response.Headers.Location $destHeaders;
            }
            else
            {
                Write-Error "Creation failed for $($file.FullName). Error: $($response)";
            }
        }
}

function Cloneworkspace {
    Param (
        [string]$filePath,
        [string]$destWorkspaceId,
        [string]$destToken        
        )

        #$fileContent = Get-Content -Path $filePath/$resourceType

        #$srcWorkspace = Get-AzureRmResource -ResourceId $srcWorkspaceId
        $destWorkspace = Get-AzureRmResource -ResourceId $destWorkspaceId

        $destArtifactsEndPoint = $destWorkspace.Properties.connectivityEndpoints.dev
        $destHeaders = @{
            'Authorization' = "Bearer $destToken"
        }

        Write-Warning "Linked services should be pre created in dest workspace as in the source workspace"
        $allResources = "notebooks", "sqlScripts", "sparkJobDefinitions", "triggers", "datasets", "dataflows", "pipelines" # "linkedservices", "integrationRuntimes"
        $allResources | ForEach-Object -Process { ProcessResource $_ $filePath $destArtifactsEndPoint $destHeaders }
}

Connect-AzureRmAccount

#Replace the destination workspace ID within the quotes
$destWorkspaceId = "/subscriptions/4f77ba38-85ff-4bc2-8825-7f1f5d972a08/resourceGroups/synapse-174445/providers/Microsoft.Synapse/workspaces/labworkspace174445"

#Replace the destination token within the quotes
$destToken= "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsIng1dCI6IllNRUxIVDBndmIwbXhvU0RvWWZvbWpxZmpZVSIsImtpZCI6IllNRUxIVDBndmIwbXhvU0RvWWZvbWpxZmpZVSJ9.eyJhdWQiOiJodHRwczovL2Rldi5henVyZXN5bmFwc2UubmV0IiwiaXNzIjoiaHR0cHM6Ly9zdHMud2luZG93cy5uZXQvY2VmY2I4ZTctZWUzMC00OWI4LWIxOTAtMTMzZjFkYWFmZDg1LyIsImlhdCI6MTU4NzM5MDIyNCwibmJmIjoxNTg3MzkwMjI0LCJleHAiOjE1ODczOTQxMjQsImFjciI6IjEiLCJhaW8iOiJBU1FBMi84UEFBQUFPY3RzQWlBOVZ0dldJVnJVUUQvUno5NzA3bkZIclJtODZXQ3VSY0V3bUlnPSIsImFtciI6WyJwd2QiXSwiYXBwaWQiOiJlYzUyZDEzZC0yZTg1LTQxMGUtYTg5YS04Yzc5ZmI2YTMyYWMiLCJhcHBpZGFjciI6IjAiLCJmYW1pbHlfbmFtZSI6IjE3NDQ0NSIsImdpdmVuX25hbWUiOiJPRExfVXNlciIsImlwYWRkciI6IjE1Ny40NS43Mi4yMDQiLCJuYW1lIjoiT0RMX1VzZXIgMTc0NDQ1Iiwib2lkIjoiN2YxNDA4MzYtMTViZC00OWUyLThkODMtMmU3NWUzNjIwM2E4IiwicHVpZCI6IjEwMDMyMDAwQjQ5RkVFM0YiLCJzY3AiOiJ3b3Jrc3BhY2VhcnRpZmFjdHMubWFuYWdlbWVudCIsInN1YiI6InUtMGZMVEtBV3NQNkxueWNUTnBHSklUeHYzS3pxbllVRFB0WEplMm5kN1kiLCJ0aWQiOiJjZWZjYjhlNy1lZTMwLTQ5YjgtYjE5MC0xMzNmMWRhYWZkODUiLCJ1bmlxdWVfbmFtZSI6Im9kbF91c2VyXzE3NDQ0NUBtc2F6dXJlbGFicy5vbm1pY3Jvc29mdC5jb20iLCJ1cG4iOiJvZGxfdXNlcl8xNzQ0NDVAbXNhenVyZWxhYnMub25taWNyb3NvZnQuY29tIiwidXRpIjoiQnY2NFlzNWtFa2lLMkw1YVNoZ2RBQSIsInZlciI6IjEuMCJ9.QstiQbu8v_eJZnGs45kA6-EhjhYCN3dFMuDI6kZNX5FZeEO_cgKfQgokRwJUA6oaKF0JGZUdfNHpopl7zPWu_9QTSXzOX8fRUJSXHiFU8OSpyVh96CvTR-8N8CNXPYexlWNuDL2Wbi_SSN7HPqnJGk9P_OZ6yPlUa_z27tsMKA8YMXLouBLHkK3fwkAUBlR-LK7LvsWntSLknoGP8bfbtiIwuAdug_wuOsrVq3lYXXBze3426m_v6ljTkSE_JFGTYMQI6MXrG9Z6pptecZBonSn2oPNhEVxRPje4b-vYZNh7elHShkD8p2WbW1PgevMcw-DXdsJjXW6SRuxmpaPzBA"

$filePath = "C:\SynapseSampleFiles"

Cloneworkspace $filePath $destWorkspaceId $destToken 
Write-Output "Cloning done"

