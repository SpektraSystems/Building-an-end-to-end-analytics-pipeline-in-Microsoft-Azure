## Exercise 4: Create Pipeline and PowerBI dataset.

### Task 1: Create the pipeline.

1. Create Pipeline **EXE2CopyDatatoSQL** by clicking on **Orchestrate**, then + Icon and click on Pipeline.

   ![pipeline](images/25.png)
  
2. Name the Pipeline **Exe2CopyDatatoSQL**

   ![pipeline copydata](images/26.png)
   
3. Browse to **C:\LabFiles\Building-an-end-to-end-analytics-pipeline-in-Microsoft-Azure-master\labfiles\EXE2CopyDatatoSQL.json**
   Open the file in the notepad and **copy the code** as you will be using it in the next step.
   
4. Now click on **Code** on the right corner of the page and paste the code that you copied in the previous step and click on **OK**. 
   Then click on **Validate** to check if there any errors and **Publish**

   ![code](images/27.png)
   
5. Don't run the pipeline now,You will be doing it in the further exercises.
   
### Task 2: Curate the  Yellow, Green Cab and FHV

1. Navigate to **Develop**->**Notebooks**

2. FHV SETUP ONLY,YellowCab SETUP ONLY and GreenCab SETUP ONLY are the notebooks which you imported in Exercise 2.

3. **FHV SETUP ONLY** notebook copies the data from **fhvbackup** folder to **fhv** whereas **YellowCab SETUP ONLY** copies the data from **yellow** folder to **yellowcuratedbackup** and **GreenCab SETUP ONLY** copies the data from **green** folder to **greencuratedbackup** respectively.

4. Follow the instructions in the notebook **replace the Storage account name in cell 1 and cell 3** , **replace the primary key in cell 1 with the key1 of the storage account** and Click on **Run** to execute the notebook **FHV SETUP ONLY**

5. Follow the instructions in the notebook **replace the Storage account name in cell 1 and cell 4** and Click on **Run** to execute the notebook **YellowCab SETUP ONLY**

6. Follow the instructions in the notebook **replace the Storage account name wherever required** and Click on **Run** to execute the notebook **GreenCab SETUP ONLY**

7. **Publish** to save the changes.

### Task 3: Create the PowerBI dataset.

1. Upload **Marketsharepbiview_PBI.csv** into the **tempdata** folder by clicking on **Data** on the Left Pane, then Select **tempdata**    container and then click on **Upload**.

   ![marketshare](images/28.png)

2. Browse for **Marketsharepbiview_PBI.csv** ,navigate to **C:\LabFiles\Building-an-end-to-end-analytics-pipeline-in-Microsoft-Azure master\labfiles\Marketsharepbiview_PBI.csv** and Select the file Marketsharepbiview_PBI.csv then select **upload** button followed by **Done**.

   ![marketsharepbi](images/29.png)

3. Click on **Develop->Notebooks** on the left Pane and then import the Notebook **PBIReadViewDataIntoSQLPool**

   ![pbi notebook](images/30.png)

4. Click on **Configure session** on the Right side of the page.

   ![session](images/31.png)

5. Configure the session as follows:

   ![configure session](images/32.png)

6. Open the notebook **PBIReadViewDataIntoSQLPool** and **Update the ADLS storage account name in Cell 1 and Cell 3** and Click on **Run All**.

   ![Run notebook](images/33.png)

7. Navigate to **Develop** on the left pane and click on **Power BI datasets** under the **Power BI Linked service**. Then Click on **+ New Power BI dataset.**

   ![pbi dataset](images/34.png)

8. Click on **Start** on the page that comes up.

   ![start](images/35.png)

9. Click on **sqlpool** and then click on Continue.

   ![sql pool](images/36.png)

10. Now click on **Download**

    ![download](images/37.png)

11. Open the downloaded file in the Power BI desktop and Log into the Power BI Desktop using Microsoft Account and **sign-in**. Then click on **Connect**

    ![connect](images/38.png)

12. Select **Marketsharepbiview_PBI** and then click on **Load Data**. Click on **Ok** if a dialog box of Connection Settings appears.

    ![load data](images/39.png)

13. Wait until the data loading process is completed and then Publish your PBI report to the Power BI workspace that is linked to your Synapse workspace.

    ![pbi publish](images/40.png)

14. Make sure you publish on the PBI Workspace created by you.Click on **Select**.

    ![pbi workpsace](images/041.png)

15. Go back to the Synapse Workspace and then click on Finish and refresh

    ![finish and refresh](images/42.png)
    
    Click **Next** to go to the next exercise.

   
