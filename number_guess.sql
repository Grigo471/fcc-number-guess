--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    guesses integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (78, 807, 28);
INSERT INTO public.games VALUES (79, 765, 28);
INSERT INTO public.games VALUES (80, 541, 29);
INSERT INTO public.games VALUES (81, 693, 29);
INSERT INTO public.games VALUES (82, 878, 28);
INSERT INTO public.games VALUES (83, 236, 28);
INSERT INTO public.games VALUES (84, 145, 28);
INSERT INTO public.games VALUES (85, 227, 30);
INSERT INTO public.games VALUES (86, 615, 30);
INSERT INTO public.games VALUES (87, 719, 31);
INSERT INTO public.games VALUES (88, 384, 31);
INSERT INTO public.games VALUES (89, 557, 30);
INSERT INTO public.games VALUES (90, 280, 30);
INSERT INTO public.games VALUES (91, 842, 30);
INSERT INTO public.games VALUES (92, 791, 32);
INSERT INTO public.games VALUES (93, 41, 33);
INSERT INTO public.games VALUES (94, 365, 33);
INSERT INTO public.games VALUES (95, 71, 32);
INSERT INTO public.games VALUES (96, 375, 32);
INSERT INTO public.games VALUES (97, 111, 32);
INSERT INTO public.games VALUES (98, 471, 34);
INSERT INTO public.games VALUES (99, 382, 34);
INSERT INTO public.games VALUES (100, 43, 35);
INSERT INTO public.games VALUES (101, 988, 35);
INSERT INTO public.games VALUES (102, 969, 34);
INSERT INTO public.games VALUES (103, 352, 34);
INSERT INTO public.games VALUES (104, 412, 34);
INSERT INTO public.games VALUES (105, 980, 36);
INSERT INTO public.games VALUES (106, 93, 36);
INSERT INTO public.games VALUES (107, 49, 37);
INSERT INTO public.games VALUES (108, 235, 37);
INSERT INTO public.games VALUES (109, 957, 36);
INSERT INTO public.games VALUES (110, 479, 36);
INSERT INTO public.games VALUES (111, 957, 36);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (28, 'user_1685638666042');
INSERT INTO public.users VALUES (29, 'user_1685638666041');
INSERT INTO public.users VALUES (30, 'user_1685638683860');
INSERT INTO public.users VALUES (31, 'user_1685638683859');
INSERT INTO public.users VALUES (32, 'user_1685638699719');
INSERT INTO public.users VALUES (33, 'user_1685638699718');
INSERT INTO public.users VALUES (34, 'user_1685638722166');
INSERT INTO public.users VALUES (35, 'user_1685638722165');
INSERT INTO public.users VALUES (36, 'user_1685638751071');
INSERT INTO public.users VALUES (37, 'user_1685638751070');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 111, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 37, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

