-- TYPE YOUR SQL QUERY BELOW

-- PART 1: Create a SQL query that maps out the daily average users before and after the feature change

-- BEFORE the feature change release
SELECT AVG(daily_login) AS average_daily_login
FROM (
  SELECT
  DATE(login_timestamp, 'unixepoch') login_date,
  COUNT(DISTINCT user_id) AS daily_login
  FROM login_history
  WHERE login_date BETWEEN '2018-05-02' AND '2018-05-16'
  GROUP BY login_date
);

-- AFTER the feature change release
SELECT AVG(daily_login) AS average_daily_login
FROM (
  SELECT
    DATE(login_timestamp, 'unixepoch') login_date,
    COUNT(DISTINCT user_id) AS daily_login
  FROM login_history
  WHERE login_date BETWEEN '2018-06-02' AND '2018-06-16'
  GROUP BY login_date
);


-- PART 2: Create a SQL query that indicates the number of status changes by card

SELECT COUNT(new_status_count)
FROM (
  SELECT
    COUNT(newStatus) AS new_status_count,
    DATE(timestamp, 'unixepoch') AS change_date,
    cardID
  FROM card_change_history
  WHERE change_date >= '2018-06-02'
  GROUP BY cardID
);
