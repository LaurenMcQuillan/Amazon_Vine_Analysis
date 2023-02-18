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
WHERE total_votes >= 20;

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
	  ,COUNT(review_id) AS five_star_reviews
INTO five_star
FROM helpful_votes_percentage
WHERE star_rating = 5
GROUP BY vine;

SELECT P.vine
	  ,COUNT(P.review_id) AS total_reviews
	  ,F.five_star_reviews
	  ,CAST(F.five_star_reviews AS FLOAT) / CAST(COUNT(review_id) AS FLOAT) AS five_star_review_percentage
FROM helpful_votes_percentage P
JOIN five_star F
ON F.vine = P.vine
GROUP BY P.vine
		,F.five_star_reviews;