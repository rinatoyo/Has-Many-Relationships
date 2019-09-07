SELECT *
FROM users;

SELECT *
FROM posts
WHERE user_id = 100;

SELECT posts.*, users.first_name, users.last_name
FROM posts
INNER JOIN users on users.id = posts.user_id
WHERE users.id = 200;

SELECT posts.*, users.username
FROM posts
INNER JOIN users ON users.id = posts.user_id
WHERE users.first_name = 'Norene' AND users.last_name = 'Schmitt';

SELECT username
FROM users
WHERE created_at > '2015-01-01';

SELECT posts.title, posts.content, users.username
FROM posts
INNER JOIN users on users.id = posts.user_id
WHERE users.created_at < '2015-01-01';

SELECT posts.title AS "Post Title", comments.*
FROM comments
INNER JOIN posts ON comments.post_id = posts.id;

SELECT posts.title AS post_title, posts.url AS post_url, comments.body AS comment_body, comments.*
FROM comments
INNER JOIN posts ON comments.post_id = posts.id
WHERE posts.created_at < '2015-01-01';

SELECT posts.title AS post_title, posts.url AS post_url, comments.body AS comment_body, comments.*
FROM comments
INNER JOIN posts ON comments.post_id = posts.id
WHERE posts.created_at > '2015-01-01';

SELECT posts.title AS post_title, posts.url AS post_url, comments.body AS comment_body, comments.*
FROM comments
INNER JOIN posts ON comments.post_id = posts.id
WHERE comments.body LIKE '%USB%';

SELECT posts.title AS post_title, users.first_name, users.last_name, comments.body AS comment_body
FROM comments
INNER JOIN posts ON comments.post_id = posts.id
INNER JOIN users ON comments.user_id = users.id
WHERE comments.body LIKE '%matrix%';

SELECT users.first_name, users.last_name, comments.body AS comment_body
FROM comments
INNER JOIN posts ON comments.post_id = posts.id
INNER JOIN users ON comments.user_id = users.id
WHERE comments.body LIKE '%SSL%' AND posts.content LIKE '%dolorum%';

SELECT users.first_name AS post_author_first_name, users.last_name AS post_author_last_name, posts.title AS post_title, users.username AS comment_author_username, comments.body AS comment_body
FROM comments
INNER JOIN posts ON comments.post_id = posts.id
INNER JOIN users ON comments.user_id = users.id
WHERE (comments.body LIKE '%SSL%' OR comments.body LIKE '%firewall%') AND posts.content LIKE '%nemo%';