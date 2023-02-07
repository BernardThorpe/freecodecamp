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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(60) NOT NULL,
    description text NOT NULL,
    zone integer NOT NULL,
    classification character varying(30) NOT NULL
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
    name character varying(60) NOT NULL,
    description text NOT NULL,
    moon_number integer,
    alternative_name character varying(60),
    approx_radius integer,
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
    name character varying(60) NOT NULL,
    description text NOT NULL,
    avg_max_temprature numeric(3,1) NOT NULL,
    avg_min_temprature numeric(3,1) NOT NULL,
    date_discovered date NOT NULL,
    can_support_life boolean,
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
-- Name: planned_missions; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planned_missions (
    planned_missions_id integer NOT NULL,
    name character varying(60) NOT NULL,
    description text NOT NULL,
    funding_secured boolean,
    estimated_costs numeric(10,2),
    planet_id integer
);


ALTER TABLE public.planned_missions OWNER TO freecodecamp;

--
-- Name: planned_missions_planned_missions_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planned_missions_planned_missions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planned_missions_planned_missions_id_seq OWNER TO freecodecamp;

--
-- Name: planned_missions_planned_missions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planned_missions_planned_missions_id_seq OWNED BY public.planned_missions.planned_missions_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(60) NOT NULL,
    description text NOT NULL,
    average_internal_temprature integer NOT NULL,
    date_discovered date NOT NULL,
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
-- Name: planned_missions planned_missions_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planned_missions ALTER COLUMN planned_missions_id SET DEFAULT nextval('public.planned_missions_planned_missions_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda Galaxy', 'Andromeda Galaxy, also called Andromeda Nebula, (catalog numbers NGC 224 and M31), great spiral galaxy in the constellation Andromeda, the nearest large galaxy.', 0, 'N/A');
INSERT INTO public.galaxy VALUES (2, 'Canis Major Dwarf Galaxy', 'Canis Major Dwarf Galaxy, member of the Local Group of galaxies (the group that includes the Milky Way Galaxy) named after the constellation Canis Major, in which it appears to lie.', 0, 'N/A');
INSERT INTO public.galaxy VALUES (3, 'Cygnus A', 'Cygnus A, most powerful cosmic source of radio waves known, lying in the northern constellation Cygnus about 500,000,000 light-years (4.8 × 1021 km) from Earth.', 0, 'N/A');
INSERT INTO public.galaxy VALUES (4, 'Virgo A', 'M87, in full Messier 87, also called Virgo A or NGC4486, giant elliptical galaxy in the constellation Virgo whose nucleus contains a black hole, the first ever to be directly imaged.', 0, 'N/A');
INSERT INTO public.galaxy VALUES (5, 'Magellanic Clouds', 'Magellanic Cloud, either of two satellite galaxies of the Milky Way Galaxy, the vast star system of which Earth is a minor component.', 0, 'N/A');
INSERT INTO public.galaxy VALUES (6, 'Milky Way Galaxy', 'Milky Way Galaxy, large spiral system consisting of several hundred billion stars, one of which is the Sun.', 0, 'N/A');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'moon 1', 'moon 1 description', 1, 'alternative 1', 5, 1);
INSERT INTO public.moon VALUES (2, 'moon 2', 'moon description', 2, 'alternative 1', 5, 1);
INSERT INTO public.moon VALUES (3, 'moon 3', 'moon description', 3, 'alternative 1', 5, 1);
INSERT INTO public.moon VALUES (4, 'moon 4', 'moon description', 4, 'alternative 1', 5, 1);
INSERT INTO public.moon VALUES (5, 'moon 5', 'moon description', 5, 'alternative 1', 5, 1);
INSERT INTO public.moon VALUES (6, 'moon 6', 'moon description', 6, 'alternative 1', 5, 1);
INSERT INTO public.moon VALUES (7, 'moon 7', 'moon description', 1, 'alternative 1', 5, 2);
INSERT INTO public.moon VALUES (8, 'moon 8', 'moon description', 1, 'alternative 1', 5, 3);
INSERT INTO public.moon VALUES (9, 'moon 9', 'moon description', 1, 'alternative 1', 5, 4);
INSERT INTO public.moon VALUES (10, 'moon 10', 'moon description', 3, 'alternative 1', 5, 5);
INSERT INTO public.moon VALUES (11, 'moon 11', 'moon description', 2, 'alternative 1', 5, 6);
INSERT INTO public.moon VALUES (12, 'moon 12', 'moon description', 4, 'alternative 1', 5, 7);
INSERT INTO public.moon VALUES (13, 'moon 13', 'moon description', 1, 'alternative 1', 5, 8);
INSERT INTO public.moon VALUES (14, 'moon 14', 'moon description', 1, 'alternative 1', 5, 9);
INSERT INTO public.moon VALUES (15, 'moon 15', 'moon description', 1, 'alternative 1', 5, 10);
INSERT INTO public.moon VALUES (16, 'moon 16', 'moon description', 7, 'alternative 1', 5, 1);
INSERT INTO public.moon VALUES (17, 'moon 17', 'moon description', 9, 'alternative 1', 5, 1);
INSERT INTO public.moon VALUES (18, 'moon 18', 'moon description', 10, 'alternative 1', 5, 1);
INSERT INTO public.moon VALUES (19, 'moon 19', 'moon description', 1, 'alternative 1', 5, 11);
INSERT INTO public.moon VALUES (20, 'moon 20', 'moon description', 1, 'alternative 1', 5, 12);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'planet 1', 'planet 1 description', 15.0, 10.0, '1987-03-24', true, 1);
INSERT INTO public.planet VALUES (2, 'planet 2', 'planet 2 description', 15.0, 10.0, '1987-03-24', true, 6);
INSERT INTO public.planet VALUES (3, 'planet 3', 'planet 3 description', 15.0, 10.0, '1987-03-24', true, 5);
INSERT INTO public.planet VALUES (4, 'planet 4', 'planet 4 description', 15.0, 10.0, '1987-03-24', true, 3);
INSERT INTO public.planet VALUES (5, 'planet 5', 'planet 5 description', 15.0, 10.0, '1987-03-24', true, 1);
INSERT INTO public.planet VALUES (6, 'planet 6', 'planet 6 description', 15.0, 10.0, '1987-03-24', true, 4);
INSERT INTO public.planet VALUES (7, 'planet 7', 'planet 7 description', 15.0, 10.0, '1987-03-24', true, 1);
INSERT INTO public.planet VALUES (8, 'planet 8', 'planet 8 description', 15.0, 10.0, '1987-03-24', true, 2);
INSERT INTO public.planet VALUES (9, 'planet 9', 'planet 9 description', 15.0, 10.0, '1987-03-24', true, 1);
INSERT INTO public.planet VALUES (10, 'planet 10', 'planet 10 description', 15.0, 10.0, '1987-03-24', true, 3);
INSERT INTO public.planet VALUES (11, 'planet 11', 'planet 11 description', 15.0, 10.0, '1987-03-24', true, 2);
INSERT INTO public.planet VALUES (12, 'planet 12', 'planet 12 description', 15.0, 10.0, '1987-03-24', true, 1);


--
-- Data for Name: planned_missions; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planned_missions VALUES (1, 'mission 1', 'let us explore the universe', true, 1231132.12, 6);
INSERT INTO public.planned_missions VALUES (2, 'mission 2', 'off off and away', false, 3465560.12, 1);
INSERT INTO public.planned_missions VALUES (3, 'mission 3', 'space ship says bye bye', false, 80980.12, 2);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Beta Andromedae', 'Beta Andromedae, Latinized from β Andromedae, and officially named Mirach, is a prominent star in the northern constellation of Andromeda.', 3842, '1521-01-01', 1);
INSERT INTO public.star VALUES (2, 'Sirius', 'Sirius is the brightest star in the night sky. Its name is derived from the Greek word Σείριος, or Seirios, meaning lit. "glowing" or "scorching".', 9940, '2001-01-01', 2);
INSERT INTO public.star VALUES (3, 'Antares', 'Antares, also called Alpha Scorpii, red, semiregular variable star, with apparent visual magnitude about 1.1, the brightest star in the zodiacal constellation Scorpius and one of the largest known stars.', 18500, '2001-01-01', 6);
INSERT INTO public.star VALUES (4, 'UY Scuti', 'Sample', 3842, '2001-01-01', 6);
INSERT INTO public.star VALUES (5, 'Mu Cephei', 'Sample', 3842, '2001-01-01', 6);
INSERT INTO public.star VALUES (6, 'Sun', 'Sample', 3842, '2001-01-01', 6);


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
-- Name: planned_missions_planned_missions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planned_missions_planned_missions_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


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
-- Name: planned_missions planned_missions_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planned_missions
    ADD CONSTRAINT planned_missions_name_key UNIQUE (name);


--
-- Name: planned_missions planned_missions_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planned_missions
    ADD CONSTRAINT planned_missions_pkey PRIMARY KEY (planned_missions_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


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
-- Name: planned_missions planned_missions_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planned_missions
    ADD CONSTRAINT planned_missions_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

