#  Building an end to end analytics pipeline in Microsoft Azure hands-on lab step-by-step

## Abstract and learning objectives

Driving Company provides payment processing services for businesses. It is designing and implementing a Proof of Concept (PoC) for a unified data analytics platform. Their soft goals is to bring siloed teams to work together on a single platform.

In this lab, you will play the role of various persona: a data engineer, a business analyst and a datascientist. The workspace is already setup in before the hands on part so you can focus on some of the core development capabilities of Azure Synapse Analytics.

By the end of this workshop, you will have performed a non-exhaustive list of operations that combine the strength of Big Data and SQL analytics into a single platform.

## Exercise 1: Create the Linked services in the Synapse Workspace

   - Before moving ahead, Verify that **SQL Pool and Spark Pool** are created.

     ![SQL Pool.](images/sqlandsparkpool.png)

### Task 1: Create the ADLS Gen2 linked service

1. Navigate to the Synapse Workspace and click on **Launch Synapse Studio**.

   ![Synapse studio.](images/synapsestudio.png)

2. Create **ADLS Gen 2** linked service by clicking on **Manage** on the Left Pane and then clicking on **+New** 

   ![Linked service](images/linked-service.png)

3. Select the **Azure Data Lake Storage Gen2** and click on **continue**.
 
   ![Azure Data Lake Storage Gen2](images/1.png)

4. Provide the following details :

   - Name : **CoreDataLakeStorageBackup**
   
   - Select the subscription where the ADLS storage account is deployed
   
   - Select the ADLS Storage account
   - Test the connection and then click on **create**

   ![Azure Data Lake Storage Gen2 linked service details](images/2.png)

### Task 2: Create the Azure Synapse Analytics linked service
	
 1. Click on **+New** & select **Azure Synapse Analytics** for creating Synapse Analytics linked service and click on **continue**.
 
    ![Azure Synapse analytics](images/3.png)

 2. Provide the following details:
    - Name : **CoreSQLPoolBackup**
    - Select Enter manually 
    - Fully qualified domain name: **labworkspaceXXXXXX.database.windows.net** where xxxxxx is the deployment id.Replace xxxxxx with the      deployment id.
    - Database name: sqlpool
    - Authentication type: SQL authentication
    - User name: sqladmin
    - Password: IgniteRocks!!7112019
    - Test the connection and click on **create**

    ![Azure Synapse analytics linked service](images/4.png)

### Task 3: Create the Azure Open Dataset linked service

1. Again, Click on +New and select **Azure Blob Storage** for creating Azure Open dataset Linked service.

   ![Azure blob storage](images/5.png)

2. Provide the following details
    - Name : **Azure OpenDataset**
    - Authentication Method : SAS URI
    - SAS URL : https://azureopendatastorage.blob.core.windows.net/
    - SAS Token :“”
    - Test the connection and click on **create**
    
   ![Azure blob storage linked service](images/6.png)
  
### Task 4: Create the Power BI linked service

   Inorder to create Power BI linked service firstly we need to create a PowerBI workspace.

1. Create a Power BI workspace
   - Login to http://app.powerbi.com/  using your AAD account.
   - Navigate to Workspaces -> Create a workspace
   
   ![Create workspace](images/7.png)

   - Create a PowerBI workspace and name it **labignitePBIxxxxxx** where xxxxxx is the deployment id.Replace xxxxxx with the deployment      id.
   - Click on **Save**
   
   ![Powerbi workspace](images/8.png)
     
2. Now create a PowerBI linked service

   - Click on **+New** under the Manage Section->Linked services and select **Power BI** for creating Power BI linked service.
       
   ![Powerbi](images/9.png)
   
 3. Provide the following details
 
     - Name : **labignitePBI**
     - Select your PBI workspace which you created in the previous step
     - Click on **create**
  
    ![Powerbi linked service ](images/010.png)
    
    Click **Next** to go to the next exercise.
