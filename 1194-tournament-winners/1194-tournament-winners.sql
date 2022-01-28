# Write your MySQL query statement below
WITH temp AS (
	SELECT match_id, first_player AS player, first_score AS score 
	FROM Matches 
	UNION 
		(SELECT match_id, second_player AS player, second_score AS score 
		 FROM Matches)
)

SELECT DISTINCT group_id, 
			  FIRST_VALUE(player) OVER(PARTITION BY group_id 
			  ORDER BY score_total DESC, player ASC) AS player_id 
FROM
	(SELECT player, SUM(score) AS score_total, group_id
	FROM temp t
	JOIN Players p
	ON t.player = p.player_id
	GROUP BY t.player) sub