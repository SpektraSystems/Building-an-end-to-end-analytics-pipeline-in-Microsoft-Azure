CREATE USER [<AAD User ID>@CloudLabsAIoutlook.onmicrosoft.com] FROM EXTERNAL PROVIDER;
EXEC sp_addrolemember 'db_owner', '<AAD User ID>@CloudLabsAIoutlook.onmicrosoft.com'