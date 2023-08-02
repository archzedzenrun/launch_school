SELECT name
  FROM bidders
  WHERE EXISTS (SELECT * FROM bids WHERE bids.bidder_id = bidders.id);

--Further Exploration:

SELECT DISTINCT name
  FROM bidders INNER JOIN bids
  ON bidders.id = bids.bidder_id
  GROUP BY bidders.id
  ORDER BY bidders.id;