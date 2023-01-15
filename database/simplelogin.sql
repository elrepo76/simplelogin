CREATE TABLE login (
	id integer NOT NULL,
    username text NOT NULL,
    password character(6) NOT NULL
);

CREATE TABLE users (
	id integer NOT NULL,
	name text NOT NULL,
	address text NOT NULL,
	loginid integer
);

-- INSERT lines are for testing the script in pgAdmin
-- that does not recognize COPY

--INSERT INTO login (id, username, password)
--VALUES 
--	(1, 'rocio', '12345'),
--	(2, 'kenzy', '121212'),
--	(3, 'vella', '131313');

--INSERT INTO users (id, name, address, loginid)
--VALUES 
--	(1, 'Rocio Katsanis', '123 Penny Lane', 1),
--	(2, 'Kenzy Pooh', '34 Pup Drive', 2),
--	(3, 'Vella Woof', '34 Pup Drive', 3);

COPY login (id, username, password) FROM stdin;
1	rocio	123456
2	kenzy	121212
3	vella	131313
\.

COPY users (id, name, address, loginid) FROM stdin;
1	Rocio Katsanis	123 Penny Lane	1
2	Kenzy Pooh	34 Pup Drive	2
3	Vella Woof	34 Pup Drive	3
\.

ALTER TABLE ONLY login
    ADD CONSTRAINT login_pkey PRIMARY KEY (id);
	
ALTER TABLE ONLY users
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);	

ALTER TABLE ONLY users
    ADD CONSTRAINT users_loginid_fkey FOREIGN KEY (loginid) REFERENCES login(id);
