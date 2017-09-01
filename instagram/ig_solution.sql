-- first 5 users
SELECT * FROM users ORDER BY created_at LIMIT 5;

-- day of week with highest # of registrations
SELECT DAYNAME(created_at), COUNT(*) FROM users GROUP BY DAYNAME(created_at) ORDER BY 2 DESC;

-- target inactive users by 0 number of post
SELECT * FROM users LEFT JOIN photos ON users.id = photos.user_id WHERE photos.id IS NULL;

-- photo with the most likes
SELECT 
    photos.id,
    username,
    COUNT(*) AS total
FROM photos
JOIN likes ON photos.id = likes.photo_id
JOIN users ON photos.user_id = users.id
GROUP BY photos.id ORDER BY 3 DESC LIMIT 1;

-- average # of photos per users
SELECT (SELECT COUNT(*) FROM photos) / (SELECT COUNT(*) FROM users) AS ppu; 

-- 5 most commonly used hashtag
SELECT 
    tags.tag_name,
    COUNT(*) AS total
FROM tags 
JOIN photo_tags ON tags.id = photo_tags.tag_id
GROUP BY tags.tag_name ORDER BY 2 DESC LIMIT 5;

-- find bots (metric is users who liked every photos on the site)
SELECT 
    users.id, 
    likes.user_id,
    username,
    COUNT(*) AS total_likes
FROM users
JOIN likes ON users.id = likes.user_id
GROUP BY users.id HAVING total_likes = (SELECT COUNT(*) FROM photos) ORDER BY total_likes DESC;
