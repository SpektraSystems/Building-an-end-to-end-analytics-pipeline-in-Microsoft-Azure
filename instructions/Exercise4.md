## Exercise 4: Create Pipeline and PowerBI dataset.

### Task 1: Create the pipeline.

1. Create Pipeline **EXE2CopyDatatoSQL** by clicking on **Orchestrate**, then + Icon and click on Pipeline.

   ![pipeline](images/25.png)
  
2. Name the Pipeline **Exe2CopyDatatoSQL**

   ![pipeline copydata](images/26.png)
   
3. Now click on **Code** on the right corner of the page and paste the code provided and click on **OK**.

   ![code](images/27.png)
   
4. Paste the code from **EXE2CopyDatatoSQL.json** and click on **Validate** to check if there any errors.

### Task 2: Curate the  Yellow, Green Cab and FHV

1. Navigate to **Develop**->**Notebooks**

2. FHV SETUP ONLY,YellowCab SETUP ONLY and GreenCab SETUP ONLY are the notebooks which you imported in Exercise 2.

3. Follow the instructions(Replace the Stoarge account name) in the notebook and Click on **Run** to execute the Notebook **FHV SETUP ONLY**

4.  Follow the instructions and Run the Notebook **YellowCab SETUP ONLY**

5.  Follow the instructions and Run the Notebook **GreenCab SETUP ONLY**


### Task 3: Create the PowerBI dataset.

1. Upload **Marketsharepbiview_PBI.csv** into the **Tempdata** folder by clicking on **Data** on the Left Pane, then Select tempdata      container and then click on **Upload**.

   ![marketshare](images/28.png)

2. Browse for **Marketsharepbiview_PBI.csv** and then click on **Done**.

   ![marketsharepbi](images/29.png)

3. Click on **Develop** on the left Pane and then import the Notebook **PBIReadViewDataIntoSQLPool**

   ![pbi notebook](images/30.png)

4. Click on **Configure session** on the Right side of the page.

   ![session](images/31.png)

5. Configure the session as follows:

   ![configure session](images/32.png)

6. Open the notebook **PBIReadViewDataIntoSQLPool** and Update the ADLS account in Cell 1 and Cell 3 and Click on **Run All**.

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

12. Click on **Marketsharepbiview_PBI** (previously created in the step1) and then click on **Load Data**.  

    ![load data](images/39.png)

13. Publish your Desktop PBI to the Power BI workspace that you linked to your Synapse workspace.

    ![pbi publish](images/40.png)

14. Make sure you publish on the PBI Workspace created by you.Click on **Select**.

    ![pbi workpsace](images/41.png)

15. Go back to the Synapse Workspace and then click on Finish and refresh

    ![finish and refresh](images/42.png)
    
    Click **Next** to go to the next exercise.

   
