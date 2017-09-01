CREATE DATABASE ig_clone;
USE ig_clone;

CREATE TABLE users (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) UNIQUE,
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE photos (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    image_url VARCHAR(255) NOT NULL,
    user_id INT,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE comments (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    comment_text VARCHAR(255) NOT NULL,
    user_id INT NOT NULL,
    photo_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY(photo_id) REFERENCES photos(id) ON DELETE CASCADE
);

CREATE TABLE likes (
    user_id INT NOT NULL,
    photo_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY(photo_id) REFERENCES photos(id) ON DELETE CASCADE,
    PRIMARY KEY(user_id, photo_id)
);
-- in essence, for each photo, the user can only generate the like value once

CREATE TABLE follows (
    follower_id INT NOT NULL,
    followee_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(follower_id) REFERENCES users(id),
    FOREIGN KEY(followee_id) REFERENCES users(id),
    PRIMARY KEY(follower_id, followee_id)
);

CREATE TABLE tags (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tag_name VARCHAR(255) UNIQUE,
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE photo_tags (
    photo_id INT NOT NULL,
    tag_id INT NOT NULL,
    FOREIGN KEY(photo_id) REFERENCES photos(id),
    FOREIGN KEY(tag_id) REFERENCES tags(id),
    PRIMARY KEY(photo_id, tag_id)
);

INSERT INTO tags (tag_name) VALUES
('adorable'),
('cute'),
('sunrise');

INSERT INTO photo_tags (photo_id, tag_id) VALUES
(1,1),
(1,2),
(2,3),
(3,2);

INSERT INTO follows (follower_id, followee_id) VALUES
(1,2), (1,3), (3,1), (2,3);

INSERT INTO likes (user_id, photo_id)
VALUES (1,1), (2,1), (1, 2), (1, 3), (3, 3);

INSERT INTO users (username)
VALUES ('BlueTheCat'), ('CharlieBrown'), ('ColtSteele');

INSERT INTO photos (image_url, user_id)
VALUES ("/adasdadsd", 1), ("/alasdkwda", 2), ("/awfiawfo", 2);

INSERT INTO comments (comment_text, user_id, photo_id) VALUES
('meow', 1, 2),
('Amazing shot!', 3, 2),
('i <3 this', 2, 1);

SELECT username, image_url FROM users JOIN photos ON users.id = photos.user_id;