EXPLAIN SELECT name FROM bidders
WHERE EXISTS (SELECT 1 FROM bids WHERE bids.bidder_id = bidders.id);

ANALYZE SELECT name FROM bidders
WHERE EXISTS (SELECT 1 FROM bids WHERE bids.bidder_id = bidders.id);

--EXPLAIN on its own displays a performance prediction and a path its going to take to get to the results (without actually running the query).

--EXPLAIN ANALYZE displays both the prediction and actual results (ANALYZE runs the query to get the actual results).