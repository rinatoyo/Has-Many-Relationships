DROP TABLE IF EXISTS comments;
DROP TABLE IF EXISTS posts;
DROP TABLE IF EXISTS users;

CREATE TABLE IF NOT EXISTS users (
    id serial NOT NULL,
    username character varying(90) NOT NULL,
    first_name character varying(90),
    last_name character varying(90),
    created_at TIMESTAMP NOT NULL DEFAULT now(),
    updated_at TIMESTAMP NOT NULL DEFAULT now(),
    PRIMARY KEY (id)
);

CREATE INDEX idx_uname
ON users (first_name, last_name);

CREATE TABLE IF NOT EXISTS posts (
    id serial NOT NULL,
    title character varying(180),
    url character varying(510),
    content TEXT,
    created_at TIMESTAMP NOT NULL DEFAULT now(),
    updated_at TIMESTAMP NOT NULL DEFAULT now(),
    user_id INTEGER REFERENCES users(id),
    PRIMARY KEY (id)
);

CREATE INDEX idx_title
ON posts (title);

CREATE TABLE IF NOT EXISTS comments (
    id serial NOT NULL,
    body character varying(510),
    created_at TIMESTAMP NOT NULL DEFAULT now(),
    updated_at TIMESTAMP NOT NULL DEFAULT now(),
    user_id INTEGER REFERENCES users(id),
    post_id INTEGER REFERENCES posts(id),
    PRIMARY KEY (id)
);

