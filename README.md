#SSD_LAB_2

**Name:** Kotha Chakradhar
**Roll No:** 2025201053


Named the Database as: ott_platform

**Steps to execute the scripts:**
1. For each procedure (q1.sql to q5.sql):
   - File → Open SQL Script → select the file → Execute.
   - After execution, the stored procedure will be created in the "ott_platform" database.
2. Test each procedure with the CALL command as shown below.

Explanation and how to test for each script:

- **q1.sql** → ListAllSubscribers()
  Purpose: Iterates through the Subscribers table using a cursor and displays all subscriber names.
  Execution: CALL ListAllSubscribers(); {No Arguments}

- **q2.sql** → GetWatchHistoryBySubscriber(IN sub_id INT)
  Purpose: Retrieves the list of shows and watch duration for the given subscriber ID.
  Execution: CALL GetWatchHistoryBySubscriber(1); {Argument type: integer}

- **q3.sql** → AddSubscriberIfNotExists(IN subName VARCHAR(100))
  Purpose: Inserts a new subscriber with the current date only if that subscriber name is not already present in the table.
  Execution: CALL AddSubscriberIfNotExists('Kim'); {Argument type: string}

- **q4.sql** → SendWatchTimeReport()
  Purpose: Generates a report by invoking Q2 for every subscriber who has watched at least one show.
  Execution: CALL SendWatchTimeReport(); {No Arguments}

- **q5.sql** → PrintAllWatchHistories()
  Purpose: Goes through each subscriber using a cursor and prints their complete watch history, including those who haven’t watched anything.
  Execution: CALL PrintAllWatchHistories(); {No Arguments}

**GitHub Repository Link:** 
