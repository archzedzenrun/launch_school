SELECT max(bid_counts.count)
  FROM (SELECT count(bidder_id) FROM bids GROUP BY bidder_id) AS bid_counts;