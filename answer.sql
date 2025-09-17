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

SELECT total_card_change
FROM (
  SELECT
    COUNT(DISTINCT cardID) as total_card_change,
    DATE(timestamp, 'unixepoch') AS card_change_date
  FROM card_change_history
  WHERE
    card_change_date > '2018-06-01' AND card_change_date <= '2018-06-16'
  GROUP BY card_change_date
);



We have the following tables:
1. user -> id, firstname, lastname
2. login_history -> id, user_id, login_timestamp
3. card -> id, name, status, priority
4. card_change_history -> id, cardID, oldStatus [nullable], newStatus, oldPriority, newPriority, timestampt
