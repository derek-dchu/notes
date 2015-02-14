DROP TABLE IF EXISTS scores;

CREATE TABLE scores (
	id		INT				PRIMARY KEY,
	score 	REAL(3, 2)
);

INSERT INTO scores VALUES
	(1, 1.00), (2, 1.00), (3, 0.99), (4, 0.98);


-- Give positive scores a rank begin from 1. Same
-- scores have the same ranking
SELECT	score, rank
FROM	(
		SELECT	score, 
				@rank:=IF(@g=score, @rank, @rank+1) AS rank, 
				@g:=score
		FROM	scores, (SELECT @rank:=0, @g:=-1) init
		ORDER BY score DESC
		) rank;