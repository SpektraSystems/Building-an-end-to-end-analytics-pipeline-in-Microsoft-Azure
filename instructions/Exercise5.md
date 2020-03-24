## Exercise 5: Explore the lake with SQL On-Demand and Spark

This section will highlight how you can explore data using the engine of your choice.
   
### Task 1: Explore the lake with SQL On-Demand
   
- In this task, you will browse your data lake. 
   
1. Go into the **YellowCab** folder, **select the year and month** folders of your choice, then **select a file**, right click and select **New SQL script**. A script is automatically generated. 

2. **Run** this script to see how SQL on demand queries the file and returns the first 100 rows of that file with the header allowing you to easily explore data in the file.

### Task 2: Explore the lake and create a table with Spark

1. Similarly, now go to the folder **holidaybackup/processed**. 

2. Select the file **part-00000-tid5126373485025311044-8121f1d6-4c9d-4e4c-8e78-fbe2733fc3a5-649-c000.snappy.parquet** and **New
Notebook**. This will generate a notebook with PySpark code to load the data in a dataframe and displays 10 rows with the header. 

3. Attach the notebook to a **Spark pool** and Click on **run** to execute the command.

   ![holiday backup](images/43.png)
