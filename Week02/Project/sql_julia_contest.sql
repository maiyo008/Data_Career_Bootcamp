SELECT
  s.submission_date,
  COUNT(DISTINCT hacker_id) AS num_hackers,
  (
    SELECT
      hacker_id
    FROM
      submissions
    WHERE
      submissions.submission_date = s.submission_date
    GROUP BY
      hacker_id
    ORDER BY
      COUNT(*) DESC, hacker_id ASC
    LIMIT 1
  ) AS hacker_id,
  (
    SELECT
      name
    FROM
      hackers
    WHERE
      hackers.hacker_id = (
        SELECT
          hacker_id
        FROM
          submissions
        WHERE
          submissions.submission_date = s.submission_date
        GROUP BY
          hacker_id
        ORDER BY
          COUNT(*) DESC, hacker_id ASC
        LIMIT 1
      )
  ) AS hacker_name
FROM
  (
    SELECT
      DATE_ADD('2016-03-01', INTERVAL n DAY) AS submission_date
    FROM
      (
        SELECT
          a.N + b.N * 10 + 1 AS n
        FROM
          (
            SELECT 0 AS N
            UNION ALL SELECT 1
            UNION ALL SELECT 2
            UNION ALL SELECT 3
            UNION ALL SELECT 4
            UNION ALL SELECT 5
            UNION ALL SELECT 6
            UNION ALL SELECT 7
            UNION ALL SELECT 8
            UNION ALL SELECT 9
          ) a
          CROSS JOIN (
            SELECT 0 AS N
            UNION ALL SELECT 1
            UNION ALL SELECT 2
            UNION ALL SELECT 3
            UNION ALL SELECT 4
            UNION ALL SELECT 5
            UNION ALL SELECT 6
            UNION ALL SELECT 7
            UNION ALL SELECT 8
            UNION ALL SELECT 9
          ) b
        ORDER BY
          n
      ) AS nums
    WHERE
      DATE_ADD('2016-03-01', INTERVAL n DAY) <= '2016-03-15'
  ) AS s
  JOIN submissions ON s.submission_date = submissions.submission_date
GROUP BY
  s.submission_date
ORDER BY
  s.submission_date ASC;
