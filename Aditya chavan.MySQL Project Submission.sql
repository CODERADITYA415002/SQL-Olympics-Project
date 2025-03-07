use satara11pm;

-- Olympics project - Aditya Chavan

-- Use proper database
USE ravet3pm;

-- Olympics dataset project
SELECT * FROM athletes;
-- Total count
SELECT COUNT(*) from athletes;
-- Q1. Show how many medal counts present for entire data.
SELECT Medal, COUNT(Medal) as medal_count
FROM athletes
GROUP BY Medal;
-- Q2. Show count of unique Sports are present in olympics.
SELECT COUNT(DISTINCT(Sport)) as sports_count
FROM athletes;
-- Q3. Show how many different medals won by Team India in data.
SELECT NOC, COUNT(Medal) as medals_won
FROM athletes
WHERE NOC = "IND" AND Medal != "NoMedal";
SELECT NOC, Medal, COUNT(Medal) as medals_won
FROM athletes
WHERE NOC = "IND" AND Medal != "NoMedal"
GROUP BY NOC, Medal;
-- Q4. Show event wise medals won by india show from highest to lowest medals won in order.
SELECT event, NOC, COUNT(Medal) as medals_won
FROM athletes
WHERE NOC = "IND" AND Medal != "NoMedal"
GROUP BY event, NOC
ORDER BY medals_won DESC;
-- Q5. Show event and yearwise medals won by india in order of year.
SELECT year, event, NOC, COUNT(Medal) as medals_won
FROM athletes
WHERE NOC = "IND" AND medal != "NoMedal"
GROUP BY year, event, NOC
ORDER BY year;
-- Show the country with maximum medals won gold, silver, bronze
SELECT Team, COUNT(Medal) as medals_won
FROM athletes
WHERE Medal != "NoMedal"
GROUP BY Team
ORDER BY medals_won DESC
LIMIT 1;
-- Q7: Show the top 10 countries with respect to gold medals
SELECT Team, COUNT(Medal) as gold_medal_count
FROM athletes
WHERE Medal = "Gold"
GROUP BY Team
ORDER BY gold_medal_count DESC
LIMIT 10;
-- Q8. Show in which year did United States won most medals
SELECT Team, Year, COUNT(Medal) as medals_won
FROM athletes
WHERE Medal != "NoMedal" AND Team = "United States"
GROUP BY Team, Year
ORDER BY medals_won DESC
LIMIT 1;
-- Q9. In which sports United States has most medals
SELECT Team, sport, COUNT(Medal) as medals_won
FROM athletes
WHERE Team = "United States" AND Medal != "NoMedal"
GROUP BY Team, sport
ORDER BY medals_won DESC
LIMIT 1;
-- Q10. Find top 3 players who have won most medals along with their sports and country.
SELECT Name, Sport, Team, COUNT(Medal) as medals_won
FROM athletes
WHERE Medal != "NoMedal"
GROUP BY Name, Sport, Team
ORDER BY medals_won DESC
LIMIT 3;
-- Q11. Find player with most gold medals in cycling along with his country.
SELECT Name, sport, Team, COUNT(Medal) as gold_medals_won
FROM athletes
WHERE sport = "Cycling" AND Medal = "Gold"
GROUP BY Name, sport, Team
ORDER BY gold_medals_won DESC
LIMIT 1;
-- Q12. Find player with most medals (Gold + Silver + Bronze) in Basketball also show his country.
SELECT Name, Sport, Team, COUNT(Medal) as medals_won
FROM athletes
WHERE sport = "Basketball" and Medal != "NoMedal"
GROUP BY Name, Sport, Team
ORDER BY medals_won DESC
LIMIT 1;
-- Q13. Find out the count of different medals of the top basketball player
SELECT Name, Medal, COUNT(Medal) as medal_count
FROM athletes
WHERE Name = "Teresa Edwards" AND Medal != "No Medal"
GROUP BY Name, Medal;
-- Q14. Find out medals won by male, female each year . Export this data and plot graph in excel.
SELECT Year, Sex, COUNT(Medal) as medals_won
FROM athletes
WHERE Medal != "NoMedal"
GROUP BY Year, Sex
ORDER BY Year ASC;
-- Q15. Find out top athlete from India with most gold medals won
SELECT Name, Team, Sport, COUNT(Medal) as gold_medal_count
FROM athletes
WHERE Team = "India" and Medal = "Gold"
GROUP BY Name, Team, Sport
ORDER BY gold_medal_count DESC;