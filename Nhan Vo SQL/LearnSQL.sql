CoolTshirts.com Capstone
Learn SQL from scratch
Tim Vo
July 21, 2018


Slide 3:

SELECT
COUNT(DISTINCT(utm_campaign)) AS ‘num_campaign,
COUNT(DISTINCT(utm_source)) AS ‘num_source’
FROM page_visits;

/*
Counting the number of distinct campaigns and sources
*/

SELECT DISTINCT(page_name)
FROM page_visits

/*
Distinct pages on the website
*/


Slide 4:

SELECT DISTINCT(utm_campaign),
       utm_source,
       page_name
FROM page_visits;

/*
Distinct campaigns and the sources associated with them
*/

Slide 5:

WITH first_touch AS (
    SELECT user_id,
        MIN(timestamp) as first_touch_at
    FROM page_visits
    GROUP BY user_id)
SELECT COUNT(ft.user_id) AS 'first_touch',
pv.utm_campaign
FROM first_touch ft
JOIN page_visits pv
    ON ft.user_id = pv.user_id
    AND ft.first_touch_at = pv.timestamp
GROUP BY pv.utm_campaign;

/*
first touches
*/

Slide 6:

WITH last_touch AS (
    SELECT user_id,
        MAX(timestamp) as last_touch_at
    FROM page_visits
    GROUP BY user_id)
SELECT COUNT(lt.user_id) AS 'last_touch',
		pv.utm_campaign
FROM last_touch lt
JOIN page_visits pv
    ON lt.user_id = pv.user_id
    AND lt.last_touch_at = pv.timestamp
GROUP BY pv.utm_campaign;

/*
last touches
*/

Slide 7:
SELECT COUNT(user_id)
AS ‘purchases’
FROM page_visits
WHERE page_name = '4 - purchase';


WITH last_touch AS (
    SELECT user_id,
        MAX(timestamp) as last_touch_at
    FROM page_visits
    GROUP BY user_id)
SELECT COUNT(lt.user_id) AS ‘purchases',
pv.utm_campaign AS ‘last_touch_campaign’
FROM last_touch lt
JOIN page_visits pv
    ON lt.user_id = pv.user_id
    AND lt.last_touch_at = pv.timestamp
WHERE page_name = '4 - purchase'
GROUP BY pv.utm_campaign;

/*
purchases and purchase by campaign breakdown
*/

