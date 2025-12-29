# 1. Oracle

## 1. Defining TableSpace with Size of `2000MB` with 3 DATAFILEs
![](md/1.1.sql.md)
![](attachments/Pasted%20image%2020251228232316.png)
## 2. creating a profile with the flollowing policies:

   - max connection time of `60min`
   - changing password each `7days`
   - allow 3 parallel connection at the time
![](md/1.2.sql.md)
![](attachments/Pasted%20image%2020251228232407.png)
## 3. Creating a new User , and make its objects be stored in the `homeworkts` tablespace , and giving him PROFILE of `homeworkpf` , and giving him the fllowing Roles:

 * connect to the DB
 * creating new DB Objects

![](md/1.3.sql.md)
![](attachments/Pasted%20image%2020251228232615.png)
## 4. CREATING the schema of attached ERD

 * but here we added some extra fields required by the next tasks

![](md/1.4.sql.md)
![](attachments/Pasted%20image%2020251228232928.png)
---

# 2. PL SQL

## 1. Display the two most reserved locations ![](md/2.1.sql.md)![](attachments/Pasted%20image%2020251228233203.png)


##  2. Prevent adding reservations where the time is between 2:00 AM and 10:00 AM 
![](md/2.2.sql.md)
![](attachments/Pasted%20image%2020251228233223.png)
### Successfull Insert
![2.2.success.sql](md/2.2.success.sql.md)
![](attachments/Pasted%20image%2020251228233308.png)
### Failed  Insert 
![2.2.fail.sql](md/2.2.fail.sql.md)
![](attachments/Pasted%20image%2020251228233529.png)

## 3. Prevent Overlapping reservations for tables 
![](md/2.3.sql.md)
![](attachments/Pasted%20image%2020251228233552.png)
### Success
![2.3.success.sql](md/2.3.success.sql.md)
![](attachments/Pasted%20image%2020251228233651.png)
### Fail
![2.3.fail.sql](md/2.3.fail.sql.md)
![](attachments/Pasted%20image%2020251228233843.png)


## 4. Assuming the `Reservation` table includes columns for the `Reservation End Date` and `Time`, the requirement is to `automatically calculate` these values whenever a reservation is registered (inserted) or modified (updated) ![](md/2.4.sql.md)![](attachments/Pasted%20image%2020251228233922.png)

## 5. Display (List) the users currently connected to the database ![](md/2.5.sql.md)![](attachments/Pasted%20image%2020251228234015.png)


## 6.  Build an audit trail (tracking log) for the `Reservation` table in a separate "shadow" table (you must create this table). It should record the values of all fields `before and after` the operation in `JSON format`, along with the `operation type` and the `date/time` of the operation ![](md/2.6.sql.md)![](attachments/Pasted%20image%2020251228234043.png)
### populate the audit table with random data
![2.6.populate.sql](md/2.6.populate.sql.md)
![](attachments/Pasted%20image%2020251228234132.png)

## 7. Write a query that shows the values `before and after the modification` from the Reservations Audit (Follow-up) table ![](md/2.7.sql.md)![](attachments/Pasted%20image%2020251228234216.png)


---

# 3. Multidimensional Databases

Designing the appropriate `Multidimensional Schema` for a `Data Warehouse`, explaining the `Dimensions`, `Hierarchies`, and the `Type of Schema` used
![3.1.sql](md/3.1.sql.md)

![](attachments/Pasted%20image%2020251229002226.png)
### Populate the tables
![3.1.populate.sql](md/3.1.populate.sql.md)

![](attachments/Pasted%20image%2020251229003317.png)
![](md/3.1.call.sql.md)
![](attachments/Pasted%20image%2020251229003416.png)

## 2. `Partition` the Fact table
![3.2.range.sql](md/3.2.range.sql.md)
* ## Justification
	* ### Massive Performance Improvement
		- Data warehouse queries are almost always time-based , For a query analyzing a certain year like 2024 data, Oracle will **only read the `p_2024` partition**, completely ignoring the billions of rows that might exist in older partitions
	* ### Simplified Data Management
		* **Archiving/Deleting Old Data:**
		* **Loading New Data**
	* ### Improved Availability
		* Maintenance tasks, like rebuilding an index, can be performed on a single partition while the rest of the table remains online and available for queries
## also it is absolutely possible for the partitioning to be **composite**
![3.2.composite.sql](md/3.2.composite.sql.md)
### **How it Works**
- 1. **Level 1 (Range):** The data is first divided by `ReservationDate` into yearly partitions (`p_2023`, `p_2024`).
- 1. **Level 2 (List):** Within each year's partition, the data is then sub-divided based on a list of `LocationID` values. we have created specific subpartitions for high-traffic locations (1 and 2) and a default subpartition for all other locations.

## 4. Show the Number of Reservations grouped by `(Location, Occasion, Customer)`
![3.4.sql](md/3.4.sql.md)
![](attachments/Pasted%20image%2020251229230844.png)
## 5. `Rank` of every `Year` and every `Month` within that Year based on the Number of Reservations
![3.5.sql](md/3.5.sql.md)
![](attachments/Pasted%20image%2020251229231604.png)

## 6 
![3.6.sql](md/3.6.sql.md)
![](attachments/Pasted%20image%2020251229233741.png)
