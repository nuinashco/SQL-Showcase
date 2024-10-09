WITH session_start AS (
	SELECT
		*,
		IFNULL(TIMESTAMP_DIFF(event_time, LAG(event_time) OVER (user_ordered), MINUTE) > 30, TRUE) AS is_time_session_start,
		IFNULL(event_type <> LAG(event_type) OVER (user_ordered), TRUE) AS is_event_streak_start

	FROM
		 `iasa.user_events`

	WINDOW
		user_ordered AS (
				PARTITION BY user_id
				ORDER BY event_time
			)
)

,session AS (
	SELECT
		*,
		SUM(CAST(is_time_session_start AS INT64)) OVER (user_ordered) AS time_session_id,
		SUM(CAST(is_event_streak_start AS INT64)) OVER (user_ordered) AS event_streak_id,

	FROM
		session_start

	WINDOW
		user_ordered AS (
				PARTITION BY user_id
				ORDER BY event_time
			)
)

,event_streak_len AS (
	SELECT
		* EXCEPT (event_streak_id),
		COUNT(*) OVER (user_session_streak) AS streak_len

	FROM
		session
	
	WINDOW
		user_session_streak AS (
				PARTITION BY user_id, time_session_id, event_streak_id
			)
)


SELECT
	user_id,
	time_session_id AS session_id,
	MIN(event_time) AS session_start_time,
	MAX(event_time) AS session_end_time,
	MAX(IF(event_type = "purchase", streak_len, 0)) AS longest_purchase_streak

FROM
	event_streak_len

GROUP BY
	user_id, session_id

ORDER BY
	user_id, session_start_time