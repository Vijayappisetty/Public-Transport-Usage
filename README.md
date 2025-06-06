Public Transport Ridership & Revenue Analysis

Overview
This project contains a SQL database schema and sample data designed to analyze public transportation ridership and fare revenue. It models transport lines, stations, daily ridership data, and fare transactions. The project includes useful queries to understand ridership patterns, revenue generation, and peak usage statistics.

Database Structure
transport_lines: Stores information about different transport lines (e.g., Metro, Bus, Train).

stations: Stores station details including the line they belong to and their location.

ridership: Tracks daily passenger counts at each station.

fare_transactions: Records fare payments by passengers for rides on different lines.

Sample Data
Sample data is provided for transport lines, stations, ridership over two days, and fare transactions to enable analysis and testing.

Analysis Queries
Included queries perform the following analyses:

Total Daily Ridership — Sum of passengers for each day.

Ridership by Line — Total passengers grouped by transport line.

Average Fare by Line — Average fare paid per transport line.

Peak Usage Station per Day — Stations with the highest passenger count each day.

Revenue per Day — Total fare revenue aggregated daily.

Total Revenue by Transport Mode — Fare revenue grouped by mode of transport (e.g., Metro, Bus, Train).

How to Use
Execute the SQL script to create tables and insert sample data.

Run the analysis queries to gain insights into ridership and revenue trends.

Tools Used
SQL (compatible with relational databases like MySQL, PostgreSQL, SQL Server, etc.)

Author
Vijay Appisetty
