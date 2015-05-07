-- 1:

SELECT s1.temp, s2.temp, s3.temp FROM sensors s1, sensors s2, sensors s3 WHERE s1.nodeid=1 AND s2.nodeid=2 AND s3.nodeid=3 AND (s1.epoch==s2.epoch) AND (s1.epoch==s3.epoch) AND (s2.epoch==s3.epoch);

-- 2:

SELECT epoch-i FROM sensors, (SELECT 1 as i UNION SELECT 2 as i UNION SELECT 3 as i UNION SELECT 4 as i) as t WHERE epoch-i > (SELECT MIN(epoch) FROM sensors) EXCEPT SELECT epoch FROM sensors;
