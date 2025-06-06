
-- -----------------------------
-- 1. Create Tables
-- -----------------------------

CREATE TABLE transport_lines (
    line_id INT PRIMARY KEY,
    line_name VARCHAR(100),
    mode VARCHAR(50)
);

CREATE TABLE stations (
    station_id INT PRIMARY KEY,
    name VARCHAR(100),
    line_id INT,
    location VARCHAR(255),
    FOREIGN KEY (line_id) REFERENCES transport_lines(line_id)
);

CREATE TABLE ridership (
    ridership_id INT PRIMARY KEY,
    station_id INT,
    ride_date DATE,
    passenger_count INT,
    FOREIGN KEY (station_id) REFERENCES stations(station_id)
);

CREATE TABLE fare_transactions (
    transaction_id INT PRIMARY KEY,
    ride_date DATE,
    passenger_id INT,
    line_id INT,
    fare DECIMAL(5,2)
);

-- -----------------------------
-- 2. Insert Sample Data
-- -----------------------------

INSERT INTO transport_lines VALUES
(1, 'Red Line', 'Metro'),
(2, 'Blue Line', 'Bus'),
(3, 'Green Line', 'Train');

INSERT INTO stations VALUES
(1, 'Central Station', 1, 'Downtown'),
(2, 'West End', 2, 'West City'),
(3, 'East Bay', 3, 'East District');

INSERT INTO ridership VALUES
(1, 1, '2025-06-01', 1200),
(2, 2, '2025-06-01', 850),
(3, 3, '2025-06-01', 530),
(4, 1, '2025-06-02', 1250),
(5, 2, '2025-06-02', 870),
(6, 3, '2025-06-02', 550);

INSERT INTO fare_transactions VALUES
(1, '2025-06-01', 101, 1, 2.50),
(2, '2025-06-01', 102, 2, 1.75),
(3, '2025-06-01', 103, 3, 3.00),
(4, '2025-06-02', 104, 1, 2.50),
(5, '2025-06-02', 105, 2, 1.75);

-- -----------------------------
-- 3. Analysis Queries
-- -----------------------------

-- 3.1 Total Daily Ridership
SELECT ride_date, SUM(passenger_count) AS total_ridership
FROM ridership
GROUP BY ride_date
ORDER BY ride_date;

-- 3.2 Ridership by Line
SELECT tl.line_name, SUM(r.passenger_count) AS total_passengers
FROM ridership r
JOIN stations s ON r.station_id = s.station_id
JOIN transport_lines tl ON s.line_id = tl.line_id
GROUP BY tl.line_name
ORDER BY total_passengers DESC;

-- 3.3 Average Fare by Line
SELECT tl.line_name, AVG(ft.fare) AS avg_fare
FROM fare_transactions ft
JOIN transport_lines tl ON ft.line_id = tl.line_id
GROUP BY tl.line_name
ORDER BY avg_fare DESC;

-- 3.4 Peak Usage Station per Day
SELECT r.ride_date, s.name AS station_name, r.passenger_count
FROM ridership r
JOIN stations s ON r.station_id = s.station_id
WHERE (r.ride_date, r.passenger_count) IN (
    SELECT ride_date, MAX(passenger_count)
    FROM ridership
    GROUP BY ride_date
)
ORDER BY r.ride_date;

-- 3.5 Revenue per Day
SELECT ride_date, SUM(fare) AS total_revenue
FROM fare_transactions
GROUP BY ride_date
ORDER BY ride_date;

-- 3.6 Total Revenue by Transport Mode
SELECT tl.mode, SUM(ft.fare) AS total_revenue
FROM fare_transactions ft
JOIN transport_lines tl ON ft.line_id = tl.line_id
GROUP BY tl.mode
ORDER BY total_revenue DESC;
