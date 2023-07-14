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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    asteroid text NOT NULL,
    name character varying,
    planet text,
    size numeric
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    galaxy character varying(20) NOT NULL,
    size integer,
    mass integer,
    celestials numeric,
    shape text,
    life boolean,
    name character varying(20)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    moon text NOT NULL,
    name character varying(20),
    planet text,
    size numeric,
    mass numeric
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    planet character varying(20) NOT NULL,
    name character varying(20),
    star text,
    mass integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    galaxy character varying(20) NOT NULL,
    star character varying(20) NOT NULL,
    life boolean,
    size numeric,
    mass numeric,
    gravity numeric,
    name character varying(20)
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'asteroid 1', NULL, NULL, NULL);
INSERT INTO public.asteroid VALUES (2, 'asteroid 2', NULL, NULL, NULL);
INSERT INTO public.asteroid VALUES (3, 'asteroid 3', NULL, NULL, NULL);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'andromeda', 1, 1, 1, 'spiral', false, NULL);
INSERT INTO public.galaxy VALUES (2, 'milky way', 2, 2, 2, 'spiral', true, NULL);
INSERT INTO public.galaxy VALUES (3, 'galaxy 221', 3, 3, 3, 'circle', false, NULL);
INSERT INTO public.galaxy VALUES (4, 'hello', 4, 4, 4, 'black hole', false, NULL);
INSERT INTO public.galaxy VALUES (5, 'pisces', 5, 5, 5, 'square', false, NULL);
INSERT INTO public.galaxy VALUES (6, 'aries', 5, 5, 5, 'square', false, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (25, 'moon', NULL, 'earth', NULL, NULL);
INSERT INTO public.moon VALUES (26, 'moon', NULL, 'earth', NULL, NULL);
INSERT INTO public.moon VALUES (27, 'moon', NULL, 'earth', NULL, NULL);
INSERT INTO public.moon VALUES (28, 'moon', NULL, 'earth', NULL, NULL);
INSERT INTO public.moon VALUES (29, 'moon', NULL, 'earth', NULL, NULL);
INSERT INTO public.moon VALUES (30, 'moon', NULL, 'earth', NULL, NULL);
INSERT INTO public.moon VALUES (31, 'moon', NULL, 'earth', NULL, NULL);
INSERT INTO public.moon VALUES (32, 'moon', NULL, 'earth', NULL, NULL);
INSERT INTO public.moon VALUES (33, 'moon', NULL, 'earth', NULL, NULL);
INSERT INTO public.moon VALUES (34, 'moon', NULL, 'earth', NULL, NULL);
INSERT INTO public.moon VALUES (35, 'moon', NULL, 'earth', NULL, NULL);
INSERT INTO public.moon VALUES (36, 'moon', NULL, 'earth', NULL, NULL);
INSERT INTO public.moon VALUES (37, 'moon', NULL, 'earth', NULL, NULL);
INSERT INTO public.moon VALUES (38, 'moon', NULL, 'earth', NULL, NULL);
INSERT INTO public.moon VALUES (39, 'moon', NULL, 'earth', NULL, NULL);
INSERT INTO public.moon VALUES (40, 'moon', NULL, 'earth', NULL, NULL);
INSERT INTO public.moon VALUES (41, 'moon', NULL, 'earth', NULL, NULL);
INSERT INTO public.moon VALUES (42, 'moon', NULL, 'earth', NULL, NULL);
INSERT INTO public.moon VALUES (43, 'moon', NULL, 'earth', NULL, NULL);
INSERT INTO public.moon VALUES (44, 'moon', NULL, 'earth', NULL, NULL);
INSERT INTO public.moon VALUES (45, 'moon', NULL, 'earth', NULL, NULL);
INSERT INTO public.moon VALUES (46, 'moon', NULL, 'earth', NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'earth', NULL, 'sun', NULL);
INSERT INTO public.planet VALUES (2, 'pluto', NULL, 'sun', NULL);
INSERT INTO public.planet VALUES (3, 'mercury', NULL, 'sun', NULL);
INSERT INTO public.planet VALUES (4, 'mars', NULL, 'sun', NULL);
INSERT INTO public.planet VALUES (5, 'neptune', NULL, 'sun', NULL);
INSERT INTO public.planet VALUES (6, 'zeus', NULL, 'sun', NULL);
INSERT INTO public.planet VALUES (7, 'hermes', NULL, 'sun', NULL);
INSERT INTO public.planet VALUES (8, 'hera', NULL, 'sun', NULL);
INSERT INTO public.planet VALUES (9, 'aries', NULL, 'sun', NULL);
INSERT INTO public.planet VALUES (10, 'planet 5', NULL, 'sun', NULL);
INSERT INTO public.planet VALUES (11, 'planet 6', NULL, 'sun', NULL);
INSERT INTO public.planet VALUES (12, 'planet 7', NULL, 'sun', NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'milky way', 'earth', true, 1, 1, NULL, NULL);
INSERT INTO public.star VALUES (2, 'milky way', 'jupiter', false, 1, 1, NULL, NULL);
INSERT INTO public.star VALUES (3, 'andromeda', 'alpha centauri', false, 3, 3, NULL, NULL);
INSERT INTO public.star VALUES (5, 'milky way', 'sun', true, 7, 7, 7, NULL);
INSERT INTO public.star VALUES (6, 'milky way', 'red star', false, 8, 8, 8, NULL);
INSERT INTO public.star VALUES (7, 'andromeda', 'blue star', false, 9, 9, 9, NULL);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 3, true);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 46, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: planet planet_planet_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_key UNIQUE (planet);


--
-- Name: planet set; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT set PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (star);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: asteroid unq_asteroid; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT unq_asteroid UNIQUE (asteroid);


--
-- Name: galaxy unq_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unq_name UNIQUE (galaxy);


--
-- Name: asteroid asteroid_planet_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_planet_fkey FOREIGN KEY (planet) REFERENCES public.planet(planet);


--
-- Name: moon moon_planet_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_fkey FOREIGN KEY (planet) REFERENCES public.planet(planet);


--
-- Name: planet planet_star_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_fkey FOREIGN KEY (star) REFERENCES public.star(star);


--
-- Name: star star_galaxy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_fkey FOREIGN KEY (galaxy) REFERENCES public.galaxy(galaxy);


--
-- PostgreSQL database dump complete
--
