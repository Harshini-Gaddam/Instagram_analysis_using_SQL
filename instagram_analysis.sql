CREATE SCHEMA [dbo]
GO

-- update caption in Posts table
UPDATE posts
SET caption = 'Sunrise Fitness Ritual'
where post_id = 3;

SELECT * FROM POSTS;

-- posts posted by user 1
select * from posts
where user_id=1;

-- counting no.of likes for each post
select * from likes;

select posts.post_id, count(likes.like_id) as like_count
from posts join likes on posts.post_id = likes.post_id
group by posts.post_id;

select count(*) from likes;

-- Finding all users who commented on post_id = 1
select * from comments;

select u.name
from comments c join users u on c.user_id = u.user_id
where post_id=1

-- Ranking posts based on no.of likes
with rank_cte AS (
    select post_id, count(like_id) as like_count,
    dense_rank() over(order by count(like_id) desc) as ranking
    from likes
    group by post_id
)

select * from rank_cte;

-- Finding all posts and comments
select p.post_id, p.caption, c.comment_text
from posts p left join comments c on p.post_id = c.comment_id

-- Categorizing based on no.of likes
with rank_cte AS (
    select post_id, count(like_id) as like_count
    from likes
    group by post_id
)

select *,
case when like_count > 1 then 'few_likes'
when like_count <=1 then 'very_less_likes'
ELSE 'no_category'
END AS 'like_category' 
from rank_cte
order by like_count desc;

--- Follower count (no.of followers)
select * from followers;

select followed_user_id, count(follower_user_id) as 'follower_count'
from followers
group by followed_user_id


--  Follower names for a particular user
SELECT 
    followed_user.name AS followed_user_name, 
    STRING_AGG(follower_user.name, ', ') AS follower_names
FROM 
    followers f
JOIN 
    users followed_user 
    ON f.followed_user_id = followed_user.user_id
JOIN 
    users follower_user 
    ON f.follower_user_id = follower_user.user_id
GROUP BY 
    followed_user.user_id, followed_user.name;


