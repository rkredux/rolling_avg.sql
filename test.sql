 WITH transactions_by_day AS (
 SELECT
  	DATE(transaction_time) AS date, 
  	SUM(transaction_amount) AS amount
 FROM transactions
 GROUP BY DATE(transaction_time)
)

SELECT date, amount, 
AVG(amount) OVER (ORDER BY date ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS rolling_3_day_avg_amount
FROM transactions_by_day
ORDER BY date DESC;