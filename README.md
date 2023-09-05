# Project_Airline_Passenger_Satisfaction
This project focuses on analyzing the level of airline passenger satisfaction using the Airline Passenger Satisfaction dataset available at https://www.kaggle.com/datasets/teejmahal20/airline-passenger-satisfaction.

# Data Cleaning
Excel:

1. Import CSV files to view column names and the amount of data.
2. Extract only 20,000 rows from each CSV file Review1 & Review2.
3. Adjust data types and column structures.
   
MySQL:

1. Import CSV files into the database and create two tables named review1 & review2.
2. Adjust data types and column structures as needed.
3. Perform data cleaning for empty, duplicate, or inaccurate data in specific columns.
4. Create a new column named Age_Category by interpreting the Age column to enhance data understanding.

Python:

1. Establish a connection to the MySQL database.
2. Review the data to ensure there are no missing, duplicate, or inaccurate entries.

# Data Exploration
MySQL:

1. Examine customer satisfaction levels between male and female passengers.
2. Compare satisfaction levels based on the type of travel.
3. Analyze differences in satisfaction levels among flight classes (Business, Economy, Economy Plus).
4. Investigate variations in satisfaction levels between loyal and non-loyal customers.

Python:

1. Compare ratings on Electronic Service of the airline between Loyal Customer and Disloyal Customer.
2. Identify services with the most significant impact on customer satisfaction.
3. Explore potential relationships between customer satisfaction and the quality of airline products.

# Data Visualization
For data visualization, I use Matplotlib and Seaborn. Please note that all visualizations are generated using Python and are based on the Python Data Exploration results only.
