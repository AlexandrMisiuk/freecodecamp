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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    age_in_million_years integer,
    distance_from_earth_mln_km numeric(10,2)
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
    name character varying(50) NOT NULL,
    description text,
    planet_id integer NOT NULL,
    age_in_million_years integer
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
    name character varying(50) NOT NULL,
    description text,
    star_id integer NOT NULL,
    age_in_million_years integer,
    is_earth_like boolean
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
-- Name: satelite; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.satelite (
    satelite_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    planet_id integer
);


ALTER TABLE public.satelite OWNER TO freecodecamp;

--
-- Name: satelite_satelite_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.satelite_satelite_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.satelite_satelite_id_seq OWNER TO freecodecamp;

--
-- Name: satelite_satelite_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.satelite_satelite_id_seq OWNED BY public.satelite.satelite_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    galaxy_id integer NOT NULL,
    age_in_million_years integer,
    is_red_giant boolean
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
-- Name: satelite satelite_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satelite ALTER COLUMN satelite_id SET DEFAULT nextval('public.satelite_satelite_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'The galaxy containing Earth and the Solar System.', 13600, 0.00);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'The nearest major galaxy to the Milky Way.', 10000, 23900000.00);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'A spiral galaxy in the Local Group.', 12000, 28500000.00);
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 'A dwarf irregular galaxy orbiting the Milky Way.', 13000, 1630000.00);
INSERT INTO public.galaxy VALUES (5, 'Small Magellanic Cloud', 'A dwarf galaxy near the Large Magellanic Cloud.', 7000, 2000000.00);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', 'A grand-design spiral galaxy interacting with a companion galaxy.', 400, 23000000.00);
INSERT INTO public.galaxy VALUES (7, 'Sombrero', 'A bright spiral galaxy known for its prominent dust lane.', 9000, 29000000.00);
INSERT INTO public.galaxy VALUES (8, 'Pinwheel', 'A face-on spiral galaxy with extensive star formation.', 10000, 21300000.00);
INSERT INTO public.galaxy VALUES (9, 'Black Eye', 'A spiral galaxy with a distinctive dark dust band.', 13000, 17200000.00);
INSERT INTO public.galaxy VALUES (10, 'Cartwheel', 'A ring galaxy shaped by a high-speed galactic collision.', 5000, 50000000.00);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Selene', 'A bright rocky moon with wide impact basins.', 1, 240);
INSERT INTO public.moon VALUES (2, 'Thalia', 'A small moon with a heavily cratered surface.', 1, 240);
INSERT INTO public.moon VALUES (3, 'Vesper', 'An icy moon with a thin reflective crust.', 2, 240);
INSERT INTO public.moon VALUES (4, 'Nerida', 'A dark moon orbiting a frozen planet.', 2, 240);
INSERT INTO public.moon VALUES (5, 'Calyx', 'A moon with shallow seas beneath a clouded sky.', 3, 9);
INSERT INTO public.moon VALUES (6, 'Ione', 'A rocky moon marked by ancient valleys.', 3, 9);
INSERT INTO public.moon VALUES (7, 'Rhea', 'A pale moon covered in bright surface ice.', 4, 9);
INSERT INTO public.moon VALUES (8, 'Dione', 'A small moon with a long equatorial ridge.', 4, 9);
INSERT INTO public.moon VALUES (9, 'Mira', 'A warm moon with a stable orbital climate.', 5, 640);
INSERT INTO public.moon VALUES (10, 'Elara', 'A distant moon with a rugged terrain.', 5, 640);
INSERT INTO public.moon VALUES (11, 'Nyx', 'A shadowed moon with deep polar craters.', 6, 11);
INSERT INTO public.moon VALUES (12, 'Asteria', 'A reflective moon surrounded by fine dust.', 6, 11);
INSERT INTO public.moon VALUES (13, 'Cressida', 'A mountain-ringed moon with frozen plains.', 7, 69);
INSERT INTO public.moon VALUES (14, 'Ophelia', 'A small moon shepherding a narrow ring.', 7, 69);
INSERT INTO public.moon VALUES (15, 'Leda', 'A quiet moon with a smooth ice shell.', 8, 69);
INSERT INTO public.moon VALUES (16, 'Phoebe', 'A distant irregular moon with a dark surface.', 8, 69);
INSERT INTO public.moon VALUES (17, 'Naiad', 'A tiny moon orbiting above a blue ocean world.', 9, 1690);
INSERT INTO public.moon VALUES (18, 'Larissa', 'A moon with deep canyons and fractured ice.', 9, 1690);
INSERT INTO public.moon VALUES (19, 'Themis', 'A moon with a thin atmosphere and bright poles.', 10, 1690);
INSERT INTO public.moon VALUES (20, 'Hestia', 'A rocky moon with ancient volcanic scars.', 10, 1690);
INSERT INTO public.moon VALUES (21, 'Artemis', 'A large moon with broad silver plains.', 11, 11);
INSERT INTO public.moon VALUES (22, 'Calypso', 'A small moon hidden among a planet''s outer rings.', 11, 11);
INSERT INTO public.moon VALUES (23, 'Eos', 'A dawn-colored moon with crystalline ridges.', 12, 11);
INSERT INTO public.moon VALUES (24, 'Maia', 'A blue-white moon with frozen surface lakes.', 12, 11);
INSERT INTO public.moon VALUES (25, 'Atlas', 'A compact moon with a flattened shape.', 13, 69);
INSERT INTO public.moon VALUES (26, 'Janus', 'A dual-lobed moon with a porous interior.', 14, 69);
INSERT INTO public.moon VALUES (27, 'Hyperion', 'A porous moon with deep irregular craters.', 15, 1690);
INSERT INTO public.moon VALUES (28, 'Mimas', 'A small moon with a prominent central crater.', 16, 1690);
INSERT INTO public.moon VALUES (29, 'Tethys', 'An icy moon crossed by a vast canyon.', 17, 9);
INSERT INTO public.moon VALUES (30, 'Enceladus', 'A bright moon with water plumes at its south pole.', 18, 9);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Aurelia', 'A warm rocky planet with shallow seas.', 1, 240, true);
INSERT INTO public.planet VALUES (2, 'Cinder', 'A small scorched planet close to its star.', 1, 240, false);
INSERT INTO public.planet VALUES (3, 'Elysia', 'A temperate world with broad green continents.', 2, 9, true);
INSERT INTO public.planet VALUES (4, 'Morrow', 'A cold planet with a thin atmosphere.', 2, 9, false);
INSERT INTO public.planet VALUES (5, 'Verdant', 'A lush planet covered by forests and wetlands.', 3, 450, true);
INSERT INTO public.planet VALUES (6, 'Ember', 'A volcanic world with glowing lava plains.', 3, 450, false);
INSERT INTO public.planet VALUES (7, 'Pelagia', 'An ocean planet with scattered island chains.', 4, 8, true);
INSERT INTO public.planet VALUES (8, 'Obsidian', 'A dark, airless planet with a rocky surface.', 4, 8, false);
INSERT INTO public.planet VALUES (9, 'Haven', 'A mild planet with liquid water and a stable climate.', 5, 640, true);
INSERT INTO public.planet VALUES (10, 'Frostfall', 'A frozen planet surrounded by reflective ice rings.', 5, 640, false);
INSERT INTO public.planet VALUES (11, 'Terrene', 'A rocky planet with a nitrogen-rich atmosphere.', 6, 11, true);
INSERT INTO public.planet VALUES (12, 'Pyra', 'A hot planet with extensive volcanic activity.', 6, 11, false);
INSERT INTO public.planet VALUES (13, 'Caldera', 'A mountainous planet with deep volcanic valleys.', 7, 69, false);
INSERT INTO public.planet VALUES (14, 'Lumen', 'A bright desert planet with underground water reserves.', 7, 69, true);
INSERT INTO public.planet VALUES (15, 'Orison', 'A calm world with wide plains and shallow seas.', 8, 1690, true);
INSERT INTO public.planet VALUES (16, 'Gale', 'A windy gas giant with a layered atmosphere.', 8, 1690, false);
INSERT INTO public.planet VALUES (17, 'Sylva', 'A forested planet with abundant surface life.', 9, 9, true);
INSERT INTO public.planet VALUES (18, 'Nox', 'A tidally locked planet with a frozen dark side.', 9, 9, false);
INSERT INTO public.planet VALUES (19, 'Maris', 'A blue planet with a dense network of oceans.', 10, 7090, true);
INSERT INTO public.planet VALUES (20, 'Titanor', 'A massive gas giant with several visible cloud bands.', 10, 7090, false);


--
-- Data for Name: satelite; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.satelite VALUES (1, 'Beacon-1', 'A communications satellite in low orbit.', 1);
INSERT INTO public.satelite VALUES (2, 'Surveyor-2', 'A mapping satellite that studies planetary terrain.', 2);
INSERT INTO public.satelite VALUES (3, 'Sentinel-3', 'A weather-monitoring satellite tracking storm systems.', 3);
INSERT INTO public.satelite VALUES (4, 'Aurora-4', 'A research satellite observing the upper atmosphere.', 4);
INSERT INTO public.satelite VALUES (5, 'Horizon-5', 'A navigation satellite supporting orbital traffic.', 5);
INSERT INTO public.satelite VALUES (6, 'Relay-6', 'A telecommunications satellite linking distant stations.', 6);
INSERT INTO public.satelite VALUES (7, 'Pioneer-7', 'An exploration satellite collecting geological data.', 7);
INSERT INTO public.satelite VALUES (8, 'Watchtower-8', 'A monitoring satellite scanning for incoming objects.', 8);
INSERT INTO public.satelite VALUES (9, 'Pathfinder-9', 'A guidance satellite charting safe flight corridors.', 9);
INSERT INTO public.satelite VALUES (10, 'Discovery-10', 'A science satellite measuring magnetic fields.', 10);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sirius', 'The brightest star in the night sky.', 1, 242, false);
INSERT INTO public.star VALUES (2, 'Betelgeuse', 'A red supergiant star in the constellation Orion.', 1, 10, true);
INSERT INTO public.star VALUES (3, 'Vega', 'A bright blue-white star in the constellation Lyra.', 1, 455, false);
INSERT INTO public.star VALUES (4, 'Rigel', 'A blue supergiant star in the constellation Orion.', 1, 8, false);
INSERT INTO public.star VALUES (5, 'Aldebaran', 'An orange giant star in the constellation Taurus.', 2, 650, true);
INSERT INTO public.star VALUES (6, 'Antares', 'A red supergiant star in the constellation Scorpius.', 3, 12, true);
INSERT INTO public.star VALUES (7, 'Polaris', 'The current North Star in the constellation Ursa Minor.', 4, 70, false);
INSERT INTO public.star VALUES (8, 'Procyon', 'A binary star system in the constellation Canis Minor.', 5, 1700, false);
INSERT INTO public.star VALUES (9, 'Deneb', 'A luminous blue-white supergiant in the constellation Cygnus.', 6, 10, false);
INSERT INTO public.star VALUES (10, 'Arcturus', 'An orange giant star in the constellation Boötes.', 7, 7100, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 10, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 30, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 20, true);


--
-- Name: satelite_satelite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.satelite_satelite_id_seq', 10, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 10, true);


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
-- Name: satelite satelite_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satelite
    ADD CONSTRAINT satelite_name_key UNIQUE (name);


--
-- Name: satelite satelite_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satelite
    ADD CONSTRAINT satelite_pkey PRIMARY KEY (satelite_id);


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
-- Name: satelite satelite_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satelite
    ADD CONSTRAINT satelite_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

