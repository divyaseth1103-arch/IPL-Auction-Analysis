Create database Auction 
Use Auction


--Q1: View the complete dataset
Select * from IPLauction

-- What is the total number of players in the dataset?
Select COUNT(Player) as Total_player from IPLauction

-- Who are the top 10 highest paid players?
SELECT TOP 10 Player, Team, Winning_bid
FROM IPLauction
ORDER BY Winning_bid DESC

--Who are the cheapest 10 players?
SELECT TOP 10 Player, Team, Winning_bid
FROM IPLauction
ORDER BY Winning_bid ASC

-- Which team spent the most money overall?
SELECT TOP 1 team, SUM(winning_bid) AS total_spent
FROM IPLauction
GROUP BY team
ORDER BY total_spent DESC

--What is the year-wise total spending?
SELECT Year, SUM(winning_bid) AS total_spent
FROM IPLauction
GROUP BY Year
ORDER BY total_spent DESC


--Which team has the highest winning bid?
Select Top 1 Team, Winning_bid 
from IPLauction
order by Winning_bid

--Which team has the highest average winning bid?
SELECT team,
       AVG(winning_bid) AS avg_bid,
       COUNT(player) AS total_players
FROM IPLauction
GROUP BY team
ORDER BY avg_bid DESC

--Which team bought the most overseas players?
Select COUNT(Player) AS Overseas_players, Team 
from IPLauction
WHERE country != 'India'
group by Team 
ORDER BY overseas_players DESC

--Which team has the best value (low spend, high players)
SELECT team,
       COUNT(player) AS total_players,
       SUM(winning_bid) AS total_spent,
       AVG(winning_bid) AS avg_per_player
FROM IPLauction
GROUP BY team
ORDER BY avg_per_player ASC

--Which players were sold exactly at their base price?
SELECT player, team, base_price, winning_bid, year
FROM IPLauction
WHERE base_price = winning_bid
ORDER BY year ASC

--Which team participated in most auction years?
SELECT team, 
       COUNT(DISTINCT year) AS years_active,
       SUM(winning_bid) AS total_spent_overall
FROM IPLauction
GROUP BY team
ORDER BY years_active DESC

--: What percentage of total auction money did each team spend?
SELECT team,
       SUM(winning_bid) AS total_spent,
       ROUND(SUM(winning_bid) * 100.0 / SUM(SUM(winning_bid)) OVER(), 2) AS percentage_spent
FROM IPLauction
GROUP BY team
ORDER BY percentage_spent DESC





