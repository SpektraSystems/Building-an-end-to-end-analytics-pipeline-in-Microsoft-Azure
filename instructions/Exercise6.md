## Exercise 6: Build Modern Data Warehouse pipelines

This section is very important to create a pipeline with parallel activities to bring data into the lake,transform it and load it into the SQL Pool.

### Task 1: Create and run a Notebook for YellowCab

- In this notebook you will see the power of the AAD passthrough between compute and storage whether it’s a data lake or a database. You will see how simple it is to write into a SQL Pool table with Spark thanks to the connector. No need to create password, identity, external table, format sources. It’s all managed by the connector!

1. Go into the **Develop** section

2. Select the notebook section and click on the notebook **EXE2 YellowCab**

3. Configure and author your notebook:
   - Attach your **Spark Compute**
   - Select **Spark** as a language
   - Define the configuration of the session. Defining the configuration of a session enables you to increase the resources of running a notebook. Use **4 executors** of medium size for that notebook. You want to run it fast!

   ![configure session](images/80.png)

4. Click on **Publish**

   ![publish](images/44.png)

5. Click on **Run All**

   ![runall](images/45.png)

### Task 2: Create and run a Dataflow with GreenCab dataset

- In this task, we will be doing a similar as in task 1 but in a code-free environment on the green cab data. You will also learn the important concept of dataset by creating a new dataset.

1. Navigate to **Develop** then **+**Icon->Data flow

2. In Data Flow, create a **New data flow**

3. Name the Data Flow activity **GreenCabTransformation**

   ![dataflow](images/81.png)

4. Click on Data Flow Debug, select **AutoResolveIntegrationRuntime** and click **Ok**

5. Click on **Add Source**

   ![add source](images/46.png)

6. Select the dataset **GreenCab**

7. Call the output stream name **GreenCab**

8. Select **Enable** sampling

   ![enable](images/47.png)

9. In the Source Options:

  - Partition root path: **green**

    ![green](images/48.png)

10. On Source Settings Edit the **GreenCab** Dataset 

    ![greencab](images/49.png)

11. **Import schema** From connection/store

    ![schema](images/50.png)

12. Click on + next to the GreenCab activity

    ![greencab activityy](images/82.png)

13. Select the filter from row modifier 

14. Enter the following for **Output stream name: FilterByYear**

15. Click on **Filter on**

    ![filter](images/51.png)

16. Write the following in the box: in(['2015', '2016', '2017', '2018'],puYear)

    ![pu year](images/52.png)

17. Click on **Save and Finish**

18. Click on + next to the Filter activity

19. Select the **Select** Activity

    ![select](images/53.png)

20. Enter the following for **Output stream name: FilterColumns**

21. Click on **Filter on**

22. **Select Automapping**

    ![automapping](images/54.png)

23. Remove the columns: vendorID, lpepPickupDateTime, lpepDropoffDateTime, tripDistance,rateCodeId, storeAndFwdFlag, paymentType, fareAmount, extra, mtaTax,improvementSurcharge, tollsAmount, ehailFee, tripType.

    ![columns](images/55.png)

24. Click on + next to the Filter activity

25. Select the **Sink** destination

    ![sink](images/56.png)

26. Call the output stream name **GreenCabSink**

27. Select +New as dataset, Select +ADLSg2 as a storage layer

28. Select **Parquet**

29. Name it as **DataflowSink**

30. Select the linked service **CoreDataLakeStorageBackup**

31. For the File system in the file path, write **tempdata**

32. Click on **Finish**

33. If you preview the data of GreenCabSink, you should see the following:

    ![greencabsink](images/57.png)

34. Turn of the **Debug Session** and click on **Publish all**

    ![debug_publish](images/58.png)

35. Try to run the data flow in a pipeline by following the flow below (you will monitor that pipeline later on in task 5)

 - Click on **Orchestrate**

 - Add a new pipeline by clicking **+**

 - Drag and drop a data flow activity in the pipeline. Make sure that you select **GreenCabTransformation**.

 - **Publish** the pipeline

 - Click on Add and trigger and select **Trigger Now** (Do not wait for the result to finish (it will take 7 minutes – you will see the result in task 5))

   ![trigger](images/59.png)

### Task 3: Create Stored Procedures

- In this section, we will create stored procedures in the SQL Pool that will be triggered in the pipeline once
the curated data is loaded in the SQL Pool.

1. Open the SQL script in the **Develop section** called **EXE 2 StoredProceduresCabs**. This script will create four stored procedures that you will later integrate in your pipeline once the loadoperation in the SQL Pool happens.
 
2. Click on **Run** and it will run the entire SQL script

   ![run sql script](images/60.png)

3. Check that you can see the four stored procedures by browsing your SQL Pool:

   ![stored procedures ](images/61.png)

### Task 4: Understand a pipeline that contains all activities

- This pipeline had been run before the hands on lab. This pipeline copied curated data from the lake into a SQL Pool as staging table. A staging table is a table optimized for loading/writing data. Once the copy activity was complete, it triggered a stored procedure that transformed the staging table into a destination table whose goal is to provide strong read performance. 

1. Click into the **Orchestrate** section

2. Select the pipeline **EXE2CopyDatatoSQL** in the Pipelines

3. Check the various activities run in the pipeline

   ![activities](images/62.png)

### Task 5: Monitor the pipeline

- Synapse will offer a single pane of glass to monitor activities. We will first look at the pipeline that you
have triggered.

1. Click at the section **Monitoring**

2. Click into **Pipeline runs**, make sure that the time of filtering is set to Last 30 days

   ![pipeline runs](images/63.png)

3. Check the status of your pipeline. It should be in-progress

4. To understand at a more granular level, the status of the activities in the pipeline, click on the pipeline

   ![pipeline runs-activities](images/62.png)

   ![activity runs](images/64.png)

   ![activity runs status](images/65.png)

5. You can get the detail of an activity by clicking to the binocular icon. In this case, you can see the performance of a copy command activity. Check the various details based on the different
activities you ran. (Data Flow, notebook, SQL Script)

   ![performance](images/66.png)

### Task 6: Monitor Spark applications

- A Spark application consists of many activities that have run into a single session. A session is displayed as in-progress, failed or cancelled. When a user is done with her job, the application session ends as cancelled. It is by no mean a negative impact.

1. Click at the section **Monitoring**

2. Click into Spark Applications

   ![spark applications](images/67.png)

3. You can see the application name (and click into it for more details), see who submitted this job,
the time, the stats, which pool template was leveraged and the job type.

   ![spark applications stats](images/68.png)

4. Click into one application and check the picture below highlighting some of the monitoring functionalities

   ![log query](images/69.png)
