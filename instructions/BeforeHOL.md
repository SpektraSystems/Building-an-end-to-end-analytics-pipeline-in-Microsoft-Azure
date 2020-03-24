# Building an end-to-end analytics pipeline in Microsoft Azure

## Before the hands-on lab

Duration: 20 minutes

### Task 1: Deploy Lab Resources to Azure

1. Select the following **Deploy to Azure** button ,right click & copy the URL and open the copied URL in the virtual machine to deploy the ARM Template with the Lab resources for this lab. This link will deep link into the Azure Portal, passing in the ARM Template for deploying the resources for this lab.

    [![Deploy to Azure button.](images/azure-deploy-button-small.png "Deploy to Azure")](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FSpektraSystems%2FBuilding-an-end-to-end-analytics-pipeline-in-Microsoft-Azure%2Fmaster%2Finstructions%2Fscripts%2Ftemplate.json)

2. On the **Custom deployment** blade, select the existing resource group **synapse-XXXXXX** for the **Resource group** field.

3. Provide the **Deployment Id** ,you will find it at the right top corner of azure portal.

    ![Deployment Id.](images/deployment-id.png)

4. Check the **I agree to the terms and conditions stated above** checkbox.

5. Select **Purchase**.

6. The deployment will take around 15-20 minutes to complete.

    To view the progress, select the **Deployments** link, then select the **Microsoft.Template** deployment.

    ![View template deployment status.](images/deployment-status.png)

   Click **Next** to perform the Hands-on lab.
