create database instagram;

drop table if exists post_hashtags;
drop table if exists hashtags;
drop table if exists messages;
drop table if exists stories;
drop table if exists followers;
drop table if exists comments;
drop table if exists likes;
drop table if exists posts;
drop table if exists users;


create table users(
    user_id int identity(1,1) primary key,
    name varchar(100) not null,
    email varchar(100) unique not null,
    password_hash varchar(100),
    bio text,
    profile_picture varchar(200),
    created_at DATETIME DEFAULT GETDATE(), -- Automatically sets current date and time
    updated_at DATETIME DEFAULT GETDATE()
);

create table posts(
    post_id int primary key,
    user_id int,
    caption text,
    media_url varchar(200),
    media_type varchar(200),
    created_at DATETIME DEFAULT GETDATE(), -- Automatically sets current date and time
    updated_at DATETIME DEFAULT GETDATE(),
    FOREIGN key (user_id) references users(user_id)
);

create table likes(
    like_id int primary key,
    post_id int,
    user_id int,
    created_at DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (post_id) REFERENCES posts(post_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

create table comments(
    comment_id int primary key,
    post_id int,
    user_id int,
    comment_text text,
    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (post_id) REFERENCES posts(post_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

create table followers(
    follow_id int PRIMARY KEY,
    follower_user_id int,
    followed_user_id int,
    created_at DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (follower_user_id) REFERENCES users(user_id),
    FOREIGN KEY (followed_user_id) REFERENCES users(user_id)
);

create table stories(
    story_id int primary key,
    user_id INT,
    media_url varchar(200),
    media_type varchar(200),
    created_at DATETIME DEFAULT GETDATE(),
    expires_at DATETIME DEFAULT GETDATE()
);

create table messages(
    message_id int primary key,
    sender_id int,
    receiver_id int,
    message_text text,
    media_url varchar(200),
    created_at DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (sender_id) REFERENCES users(user_id),
    FOREIGN KEY (receiver_id) REFERENCES users(user_id)
);

create table hashtags(
    hashtag_id int primary key,
    hashtag_text text
);

create table post_hashtags(
    post_id int,
    hashtag_id int,
    FOREIGN KEY (post_id) REFERENCES posts(post_id),
    FOREIGN KEY (hashtag_id) REFERENCES hashtags(hashtag_id)
);

select * from users;












