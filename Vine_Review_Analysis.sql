-- Create vine_table
CREATE TABLE vine_table (
  review_id TEXT PRIMARY KEY,
  star_rating INTEGER,
  helpful_votes INTEGER,
  total_votes INTEGER,
  vine TEXT,
  verified_purchase TEXT
);

-- Step 1: total_votes >= 20
SELECT *
INTO total_votes_20
FROM vine_table
WHERE total_votes>= 20;

-- Step 2: helpful_votes % >= 50%
SELECT *
INTO helpful_votes_percentage
FROM total_votes_20
WHERE CAST(helpful_votes AS FLOAT)/CAST(total_votes AS FLOAT) >= 0.5;

-- Step 3: paid votes
SELECT *
INTO paid_votes
FROM helpful_votes_percentage
WHERE vine ='Y';

-- Step 4: unpaid votes
SELECT *
INTO unpaid_votes
FROM helpful_votes_percentage
WHERE vine ='N';

-- Step 5: total reviews
SELECT vine
	  ,COUNT(review_id) AS total_reviews
	  ,(SELECT COUNT(review_id)
		FROM helpful_votes_percentage 
		WHERE star_rating = 5) AS five_star_reviews
	  ,CAST((SELECT COUNT(review_id)
			 FROM helpful_votes_percentage
			 WHERE star_rating = 5) AS FLOAT) / 
	   CAST(COUNT(review_id) AS FLOAT) AS five_star_review_percentage
FROM helpful_votes_percentage
GROUP BY vine;
