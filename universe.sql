--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: explorer; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.explorer (
    explorer_id integer NOT NULL,
    name character varying(30) NOT NULL,
    team_size integer NOT NULL,
    planet_id integer
);


ALTER TABLE public.explorer OWNER TO freecodecamp;

--
-- Name: explorer_explorer_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.explorer_explorer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.explorer_explorer_id_seq OWNER TO freecodecamp;

--
-- Name: explorer_explorer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.explorer_explorer_id_seq OWNED BY public.explorer.explorer_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    has_life boolean NOT NULL,
    age_in_millions_of_years integer,
    galaxy_types integer,
    size numeric(4,1),
    is_spherical boolean,
    description text,
    color character varying(20)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30),
    size integer NOT NULL,
    is_spherical boolean NOT NULL,
    planet_id integer
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
    name character varying(30) NOT NULL,
    size numeric(4,1) NOT NULL,
    distance_from_sun integer,
    star_id integer
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
    name character varying(30) NOT NULL,
    size integer NOT NULL,
    "position" integer,
    is_spherical boolean,
    galaxy_id integer
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
-- Name: explorer explorer_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.explorer ALTER COLUMN explorer_id SET DEFAULT nextval('public.explorer_explorer_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


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
-- Data for Name: explorer; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.explorer VALUES (1, 'Lana Lang', 45, 1);
INSERT INTO public.explorer VALUES (2, 'Serling Archer', 3, 2);
INSERT INTO public.explorer VALUES (3, 'Cyril Figas', 5, 3);
INSERT INTO public.explorer VALUES (4, 'Mallory Archer', 53, 4);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Alcyoneus', false, 55, 2, 74.4, true, 'description of Alcyoneus', 'Blue');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', false, 100, 3, 54.3, false, 'description of Andromeda', 'Yellow');
INSERT INTO public.galaxy VALUES (3, 'Bear Paw', false, 23, 4, 34.6, true, 'description of Bear Paw galaxy', 'Brown');
INSERT INTO public.galaxy VALUES (4, 'Cigar', true, 430, 5, 124.5, false, 'description of the Cigar galaxy', 'Red');
INSERT INTO public.galaxy VALUES (5, 'Condor', false, 1500, 6, 321.4, false, 'description of the Condor galaxy', 'Purple');
INSERT INTO public.galaxy VALUES (6, 'Fireworks', false, 500, 2, 34.9, false, 'description of the Fireworks galaxy', 'Orange');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 3475, true, 1);
INSERT INTO public.moon VALUES (2, 'Deimos', 23460, true, 2);
INSERT INTO public.moon VALUES (3, 'Phobos', 9270, true, 3);
INSERT INTO public.moon VALUES (4, 'Adrastea', 128980, true, 4);
INSERT INTO public.moon VALUES (5, 'Carme', 1883000, true, 5);
INSERT INTO public.moon VALUES (6, 'Erinome', 23279000, true, 6);
INSERT INTO public.moon VALUES (7, 'Helike', 10972830, true, 7);
INSERT INTO public.moon VALUES (8, 'Kale', 23124000, true, 8);
INSERT INTO public.moon VALUES (9, 'Orthosie', 21168000, true, 1);
INSERT INTO public.moon VALUES (10, 'Praxidike', 2345, true, 4);
INSERT INTO public.moon VALUES (11, 'Mneme', 2345, true, 4);
INSERT INTO public.moon VALUES (12, 'Magaclite', 2345, true, 5);
INSERT INTO public.moon VALUES (13, 'Kore', 2345, true, 7);
INSERT INTO public.moon VALUES (14, 'Iocaste', 2000, false, 10);
INSERT INTO public.moon VALUES (15, 'Himala', 3245, true, 5);
INSERT INTO public.moon VALUES (16, 'Harpalyke', 346, false, 12);
INSERT INTO public.moon VALUES (17, 'Eurydome', 4567, true, 10);
INSERT INTO public.moon VALUES (18, 'Euanthe', 4567, false, 3);
INSERT INTO public.moon VALUES (19, 'Elara', 45667, false, 5);
INSERT INTO public.moon VALUES (20, 'Cyllene', 467, true, 7);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 330.2, 58, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 345.2, 60, 2);
INSERT INTO public.planet VALUES (3, 'Earth', 234.1, 23, 3);
INSERT INTO public.planet VALUES (4, 'Mars', 56.4, 21, 4);
INSERT INTO public.planet VALUES (5, 'Jupiter', 234.3, 234, 1);
INSERT INTO public.planet VALUES (6, 'Planet 6', 234.5, 56, 2);
INSERT INTO public.planet VALUES (7, 'Planet 7', 564.2, 34, 3);
INSERT INTO public.planet VALUES (8, 'Planet 8', 345.0, 223, 3);
INSERT INTO public.planet VALUES (9, 'Planet 9', 45.4, 23, 3);
INSERT INTO public.planet VALUES (10, 'Planet 10', 345.2, 45, 4);
INSERT INTO public.planet VALUES (11, 'Planet 11', 546.3, 45, 5);
INSERT INTO public.planet VALUES (12, 'Planet 12', 56.7, 456, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Ursa Major', 34, 3, true, 2);
INSERT INTO public.star VALUES (2, 'Eridanus', 45, 2, true, 1);
INSERT INTO public.star VALUES (3, 'Canis Major', 56, 1, false, 3);
INSERT INTO public.star VALUES (4, 'Aquarius', 76, 4, true, 4);
INSERT INTO public.star VALUES (5, 'Sagittarius', 76, 5, true, 5);
INSERT INTO public.star VALUES (6, 'Taurus', 123, 6, false, 6);


--
-- Name: explorer_explorer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.explorer_explorer_id_seq', 4, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: explorer explorer_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.explorer
    ADD CONSTRAINT explorer_name_key UNIQUE (name);


--
-- Name: explorer explorer_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.explorer
    ADD CONSTRAINT explorer_pkey PRIMARY KEY (explorer_id);


--
-- Name: galaxy galaxy_color_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_color_key UNIQUE (color);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


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
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_position_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_position_key UNIQUE ("position");


--
-- Name: explorer explorer_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.explorer
    ADD CONSTRAINT explorer_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

