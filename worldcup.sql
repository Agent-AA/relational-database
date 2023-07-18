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

DROP DATABASE worldcup;
--
-- Name: worldcup; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE worldcup WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE worldcup OWNER TO freecodecamp;

\connect worldcup

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
    year integer NOT NULL,
    round character varying(100) NOT NULL,
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL,
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL
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
-- Name: teams; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.teams OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_team_id_seq OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (65, 2018, 'Final', 379, 380, 4, 2);
INSERT INTO public.games VALUES (66, 2018, 'Third Place', 381, 382, 2, 0);
INSERT INTO public.games VALUES (67, 2018, 'Semi-Final', 380, 382, 2, 1);
INSERT INTO public.games VALUES (68, 2018, 'Semi-Final', 379, 381, 1, 0);
INSERT INTO public.games VALUES (69, 2018, 'Quarter-Final', 380, 383, 3, 2);
INSERT INTO public.games VALUES (70, 2018, 'Quarter-Final', 382, 384, 2, 0);
INSERT INTO public.games VALUES (71, 2018, 'Quarter-Final', 381, 385, 2, 1);
INSERT INTO public.games VALUES (72, 2018, 'Quarter-Final', 379, 386, 2, 0);
INSERT INTO public.games VALUES (73, 2018, 'Eighth-Final', 382, 387, 2, 1);
INSERT INTO public.games VALUES (74, 2018, 'Eighth-Final', 384, 388, 1, 0);
INSERT INTO public.games VALUES (75, 2018, 'Eighth-Final', 381, 389, 3, 2);
INSERT INTO public.games VALUES (76, 2018, 'Eighth-Final', 385, 390, 2, 0);
INSERT INTO public.games VALUES (77, 2018, 'Eighth-Final', 380, 391, 2, 1);
INSERT INTO public.games VALUES (78, 2018, 'Eighth-Final', 383, 392, 2, 1);
INSERT INTO public.games VALUES (79, 2018, 'Eighth-Final', 386, 393, 2, 1);
INSERT INTO public.games VALUES (80, 2018, 'Eighth-Final', 379, 394, 4, 3);
INSERT INTO public.games VALUES (81, 2014, 'Final', 395, 394, 1, 0);
INSERT INTO public.games VALUES (82, 2014, 'Third Place', 396, 385, 3, 0);
INSERT INTO public.games VALUES (83, 2014, 'Semi-Final', 394, 396, 1, 0);
INSERT INTO public.games VALUES (84, 2014, 'Semi-Final', 395, 385, 7, 1);
INSERT INTO public.games VALUES (85, 2014, 'Quarter-Final', 396, 397, 1, 0);
INSERT INTO public.games VALUES (86, 2014, 'Quarter-Final', 394, 381, 1, 0);
INSERT INTO public.games VALUES (87, 2014, 'Quarter-Final', 385, 387, 2, 1);
INSERT INTO public.games VALUES (88, 2014, 'Quarter-Final', 395, 379, 1, 0);
INSERT INTO public.games VALUES (89, 2014, 'Eighth-Final', 385, 398, 2, 1);
INSERT INTO public.games VALUES (90, 2014, 'Eighth-Final', 387, 386, 2, 0);
INSERT INTO public.games VALUES (91, 2014, 'Eighth-Final', 379, 399, 2, 0);
INSERT INTO public.games VALUES (92, 2014, 'Eighth-Final', 395, 400, 2, 1);
INSERT INTO public.games VALUES (93, 2014, 'Eighth-Final', 396, 390, 2, 1);
INSERT INTO public.games VALUES (94, 2014, 'Eighth-Final', 397, 401, 2, 1);
INSERT INTO public.games VALUES (95, 2014, 'Eighth-Final', 394, 388, 1, 0);
INSERT INTO public.games VALUES (96, 2014, 'Eighth-Final', 381, 402, 2, 1);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.teams VALUES (379, 'France');
INSERT INTO public.teams VALUES (380, 'Croatia');
INSERT INTO public.teams VALUES (381, 'Belgium');
INSERT INTO public.teams VALUES (382, 'England');
INSERT INTO public.teams VALUES (383, 'Russia');
INSERT INTO public.teams VALUES (384, 'Sweden');
INSERT INTO public.teams VALUES (385, 'Brazil');
INSERT INTO public.teams VALUES (386, 'Uruguay');
INSERT INTO public.teams VALUES (387, 'Colombia');
INSERT INTO public.teams VALUES (388, 'Switzerland');
INSERT INTO public.teams VALUES (389, 'Japan');
INSERT INTO public.teams VALUES (390, 'Mexico');
INSERT INTO public.teams VALUES (391, 'Denmark');
INSERT INTO public.teams VALUES (392, 'Spain');
INSERT INTO public.teams VALUES (393, 'Portugal');
INSERT INTO public.teams VALUES (394, 'Argentina');
INSERT INTO public.teams VALUES (395, 'Germany');
INSERT INTO public.teams VALUES (396, 'Netherlands');
INSERT INTO public.teams VALUES (397, 'Costa Rica');
INSERT INTO public.teams VALUES (398, 'Chile');
INSERT INTO public.teams VALUES (399, 'Nigeria');
INSERT INTO public.teams VALUES (400, 'Algeria');
INSERT INTO public.teams VALUES (401, 'Greece');
INSERT INTO public.teams VALUES (402, 'United States');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 96, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 402, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: teams teams_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_name_key UNIQUE (name);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- Name: games games_opponent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_opponent_id_fkey FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);


--
-- Name: games games_winner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_winner_id_fkey FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--

