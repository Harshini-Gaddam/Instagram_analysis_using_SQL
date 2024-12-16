CREATE SCHEMA [dbo]
GO
-- Users table 
INSERT INTO users (name, email, password_hash, bio, profile_picture) VALUES
('John Doe', 'john.doe@example.com', 'hashed_password_1', 'Love photography and coding!', 'https://www.example.com/profile1.jpg'),
('Jane Smith', 'jane.smith@example.com', 'hashed_password_2', 'Travel blogger and foodie.', 'https://www.example.com/profile2.jpg'),
('Mike Johnson', 'mike.j@example.com', 'hashed_password_3', 'Fitness enthusiast.', 'https://www.example.com/profile3.jpg'),
('Emily Davis', 'emily.d@example.com', 'hashed_password_4', 'Pet lover and photographer.', 'https://www.example.com/profile4.jpg'),
('Sarah Williams', 'sarah.w@example.com', 'hashed_password_5', 'Digital artist and creative mind.', 'https://www.example.com/profile5.jpg'),
('David Brown', 'david.b@example.com', 'hashed_password_6', 'Tech geek and gamer.', 'https://www.example.com/profile6.jpg'),
('Olivia Martin', 'olivia.m@example.com', 'hashed_password_7', 'Nature lover and yoga enthusiast.', 'https://www.example.com/profile7.jpg'),
('Daniel White', 'daniel.w@example.com', 'hashed_password_8', 'Passionate chef and food critic.', 'https://www.example.com/profile8.jpg'),
('Sophia Harris', 'sophia.h@example.com', 'hashed_password_9', 'Fitness trainer and life coach.', 'https://www.example.com/profile9.jpg'),
('James Anderson', 'james.a@example.com', 'hashed_password_10', 'Photographer and traveler.', 'https://www.example.com/profile10.jpg');


select * from users;

-- Posts table 
INSERT INTO posts (post_id, user_id, caption, media_url, media_type) VALUES
(1, 1, 'Beautiful sunset at the beach!', 'https://www.example.com/sunset.jpg', 'image'),
(2, 1, 'Exploring the mountains today.', 'https://www.example.com/mountain.mp4', 'video'),
(3, 2, 'Morning workout routine', 'https://www.example.com/gym.png', 'image'),
(4, 3, 'Meet my new puppy, Bella!', 'https://www.example.com/bella.jpg', 'image'),
(5, 4, 'My latest digital artwork - thoughts?', 'https://www.example.com/artwork1.jpg', 'image'),
(6, 4, 'Finally hit the top score in my favorite game!', 'https://www.example.com/gameplay1.jpg', 'image'),
(7, 5, 'A peaceful morning yoga session in the mountains.', 'https://www.example.com/yoga_mountains.jpg', 'image'),
(8, 5, 'Cooking up a storm with my new pasta recipe', 'https://www.example.com/pasta_recipe.jpg', 'image'),
(9, 6, 'Early morning workout - no excuses!', 'https://www.example.com/workout.jpg', 'image'),
(10, 6, 'Sunset photography at its finest.', 'https://www.example.com/sunset_photography.jpg', 'image');

select * from posts;

-- Likes table
INSERT INTO likes (like_id, post_id, user_id) VALUES
(1, 1, 2), -- James liked John's post
(2, 2, 10), -- John liked Jane's post
(3, 3, 4), -- Emily liked Jane's post
(4, 4, 6), -- David liked Mike's post
(5, 1, 3), -- Mike liked John's post
(6, 5, 7), -- Olivia liked Emily's artwork
(7, 6, 8), -- Daniel liked Emily's game
(8, 9, 10), -- James liked David's workout post
(9, 3, 9), -- Sophia liked Jane's workout post
(10, 4, 7); -- Olivia liked Mike's puppy post

select * from likes;

-- Comments table
truncate table comments;

INSERT INTO comments (comment_id, post_id, user_id, comment_text) VALUES
(1, 1, 2, 'Absolutely stunning view!'),   -- Jane Smith commented on John Doe's post
(2, 2, 10, 'The mountains look amazing.'),  -- James commented on John's post
(3, 3, 4, 'You are so dedicated to fitness!'),  -- Emily on Janes's
(4, 4, 7, 'Bella is adorable 😍.'),  -- Olivia on Mike's
(5, 5, 6, 'This is amazing artwork! You are so talented.'),  -- David on Emily's
(6, 6, 5, 'Great gameplay! What game is this?'), -- Sarah on Emily's
(7, 7, 8, 'That view during yoga is breathtaking.'),  -- Daniel on sarah's
(8, 8, 9, 'I need this pasta recipe! Looks delicious.'), -- Sophia on Sarah's
(9, 9, 7, 'Inspirational workout! I’m motivated now.'),  -- Sophia on Jane's
(10, 10, 5, 'Stunning sunset capture - perfect shot!');  -- Sarah on David's

select * from comments;

-- followers table
INSERT INTO followers (follow_id, follower_user_id, followed_user_id) VALUES
(1, 1, 2), -- John follows Jane
(2, 2, 1), -- Jane follows John
(3, 3, 4), -- Mike follows Emily
(4, 4, 3), -- Emily follows Mike
(5, 1, 3), -- John follows Mike
(6, 5, 1), -- Sarah follows John
(7, 6, 2), -- David follows Jane
(8, 7, 4), -- Olivia follows Emily
(9, 8, 9), -- Daniel follows Sophia
(10, 9, 10), -- Sophia follows James
(11, 10, 5), -- James follows Sarah
(12, 1, 10), -- John follows James
(13, 3, 8); -- Mike follows Daniel


-- Stories table
INSERT INTO stories (story_id, user_id, media_url, media_type, expires_at) VALUES
(1, 1, 'https://www.example.com/beach_story.jpg', 'image', DATEADD(HOUR, 24, GETDATE())),
(2, 2, 'https://www.example.com/hiking_story.mp4', 'video', DATEADD(HOUR, 24, GETDATE())),
(3, 3, 'https://www.example.com/morning_run.jpg', 'image', DATEADD(HOUR, 24, GETDATE())),
(4, 4, 'https://www.example.com/puppy_playing.mp4', 'video', DATEADD(HOUR, 24, GETDATE())),
(5, 5, 'https://www.example.com/artwork_story.jpg', 'image', DATEADD(HOUR, 24, GETDATE())),
(6, 6, 'https://www.example.com/gameplay_story.jpg', 'image', DATEADD(HOUR, 24, GETDATE())),
(7, 7, 'https://www.example.com/yoga_story.jpg', 'image', DATEADD(HOUR, 24, GETDATE())),
(8, 8, 'https://www.example.com/cooking_story.jpg', 'image', DATEADD(HOUR, 24, GETDATE())),
(9, 9, 'https://www.example.com/workout_story.jpg', 'image', DATEADD(HOUR, 24, GETDATE())),
(10, 10, 'https://www.example.com/photography_story.jpg', 'image', DATEADD(HOUR, 24, GETDATE()));

select * from stories;

-- messages table
INSERT INTO messages (message_id, sender_id, receiver_id, message_text, media_url) VALUES
(1, 1, 2, 'Hey Jane! Loved your recent post.', NULL),
(2, 2, 1, 'Thanks, John! Appreciate it.', NULL),
(3, 3, 4, 'Check this new workout video I found!', 'https://www.example.com/workout_link.mp4'),
(4, 4, 3, 'Bella says hi 🐾!', 'https://www.example.com/bella_hi.jpg'),
(5, 5, 6, 'Hey David, loved your latest post!', NULL),
(6, 6, 5, 'Thanks Sarah! Your artwork is incredible.', NULL),
(7, 7, 8, 'That pasta recipe looks delicious. Mind sharing?', NULL),
(8, 8, 9, 'Your morning workouts are super motivating!', NULL),
(9, 9, 10, 'Amazing shot of the sunset! You’re really talented.', 'https://www.example.com/sunset_feedback.jpg');

-- Hashtags table 
INSERT INTO hashtags (hashtag_id, hashtag_text) VALUES
(1, '#sunset'),
(2, '#travel'),
(3, '#fitness'),
(4, '#puppylove'),
(5, '#artwork'),
(6, '#gaming'),
(7, '#yoga'),
(8, '#cooking'),
(9, '#photography');

-- Post_hashtags table 
INSERT INTO post_hashtags (post_id, hashtag_id) VALUES
(1, 1), -- John's post with #sunset
(2, 2), -- Jane's post with #travel
(3, 3), -- Mike's post with #fitness
(4, 4), -- Emily's post with #puppylove
(5, 5), -- Sarah's artwork post with #artwork
(6, 6), -- David's gaming post with #gaming
(7, 7), -- Olivia's yoga post with #yoga
(8, 8), -- Daniel's cooking post with #cooking
(10, 9); -- James' post with #photography





