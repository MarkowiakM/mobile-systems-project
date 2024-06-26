--
-- PostgreSQL database dump
--

-- Dumped from database version 13.1 (Debian 13.1-1.pgdg100+1)
-- Dumped by pg_dump version 13.1 (Debian 13.1-1.pgdg100+1)

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
-- Name: association_rules; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.association_rules (
    id bigint NOT NULL,
    antecedent character varying(255),
    confidence double precision NOT NULL,
    consequent character varying(255),
    lift double precision NOT NULL,
    support double precision NOT NULL
);


ALTER TABLE public.association_rules OWNER TO admin;

--
-- Name: association_rules_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.association_rules_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.association_rules_id_seq OWNER TO admin;

--
-- Name: association_rules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.association_rules_id_seq OWNED BY public.association_rules.id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.categories (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    name_pl character varying(255)
);


ALTER TABLE public.categories OWNER TO admin;

--
-- Name: categories_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.categories_seq
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_seq OWNER TO admin;

--
-- Name: email_logs; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.email_logs (
    id bigint NOT NULL,
    content character varying(50000),
    sending_time timestamp(6) without time zone,
    sent boolean NOT NULL,
    "timestamp" timestamp(6) without time zone,
    title character varying(255),
    receiver_id bigint,
    type_id bigint
);


ALTER TABLE public.email_logs OWNER TO admin;

--
-- Name: email_logs_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.email_logs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.email_logs_id_seq OWNER TO admin;

--
-- Name: email_logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.email_logs_id_seq OWNED BY public.email_logs.id;


--
-- Name: email_types; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.email_types (
    id bigint NOT NULL,
    type character varying(255) NOT NULL
);


ALTER TABLE public.email_types OWNER TO admin;

--
-- Name: email_types_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.email_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.email_types_id_seq OWNER TO admin;

--
-- Name: email_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.email_types_id_seq OWNED BY public.email_types.id;


--
-- Name: game_instance_images; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.game_instance_images (
    id bigint NOT NULL,
    image_link character varying(255),
    image_name character varying(255),
    game_instance_id bigint NOT NULL
);


ALTER TABLE public.game_instance_images OWNER TO admin;

--
-- Name: game_instance_images_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.game_instance_images_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.game_instance_images_id_seq OWNER TO admin;

--
-- Name: game_instance_images_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.game_instance_images_id_seq OWNED BY public.game_instance_images.id;


--
-- Name: game_instance_opinions; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.game_instance_opinions (
    id bigint NOT NULL,
    description character varying(511),
    stars integer NOT NULL,
    "timestamp" timestamp(6) without time zone,
    game_instance_id bigint,
    rating_user_id bigint,
    reservation_id bigint
);


ALTER TABLE public.game_instance_opinions OWNER TO admin;

--
-- Name: game_instance_opinions_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.game_instance_opinions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.game_instance_opinions_id_seq OWNER TO admin;

--
-- Name: game_instance_opinions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.game_instance_opinions_id_seq OWNED BY public.game_instance_opinions.id;


--
-- Name: game_instances; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.game_instances (
    id bigint NOT NULL,
    avg_rating double precision NOT NULL,
    description character varying(511),
    is_active boolean NOT NULL,
    opinions_amount integer NOT NULL,
    price_per_day double precision NOT NULL,
    uuid character varying(255) NOT NULL,
    game_id bigint,
    owner_id bigint
);


ALTER TABLE public.game_instances OWNER TO admin;

--
-- Name: game_instances_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.game_instances_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.game_instances_id_seq OWNER TO admin;

--
-- Name: game_instances_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.game_instances_id_seq OWNED BY public.game_instances.id;


--
-- Name: game_statuses; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.game_statuses (
    id bigint NOT NULL,
    status character varying(255) NOT NULL
);


ALTER TABLE public.game_statuses OWNER TO admin;

--
-- Name: game_statuses_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.game_statuses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.game_statuses_id_seq OWNER TO admin;

--
-- Name: game_statuses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.game_statuses_id_seq OWNED BY public.game_statuses.id;


--
-- Name: games; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.games (
    id bigint NOT NULL,
    age integer NOT NULL,
    image character varying(255),
    max_players integer NOT NULL,
    min_players integer NOT NULL,
    name character varying(255) NOT NULL,
    name_pl character varying(255),
    original_id bigint,
    playing_time integer NOT NULL,
    short_description character varying(10000) NOT NULL,
    short_description_pl character varying(10000),
    game_status_id bigint
);


ALTER TABLE public.games OWNER TO admin;

--
-- Name: games_categories; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.games_categories (
    game_id bigint NOT NULL,
    category_id bigint NOT NULL
);


ALTER TABLE public.games_categories OWNER TO admin;

--
-- Name: games_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.games_seq
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_seq OWNER TO admin;

--
-- Name: reservation_status; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.reservation_status (
    id bigint NOT NULL,
    status character varying(255) NOT NULL
);


ALTER TABLE public.reservation_status OWNER TO admin;

--
-- Name: reservation_status_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.reservation_status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reservation_status_id_seq OWNER TO admin;

--
-- Name: reservation_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.reservation_status_id_seq OWNED BY public.reservation_status.id;


--
-- Name: reservations; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.reservations (
    id bigint NOT NULL,
    end_date timestamp(6) without time zone NOT NULL,
    renter_comment character varying(500),
    reservation_id character varying(255),
    start_date timestamp(6) without time zone NOT NULL,
    "timestamp" timestamp(6) without time zone,
    game_instance_id bigint,
    renter_id bigint,
    status_id bigint
);


ALTER TABLE public.reservations OWNER TO admin;

--
-- Name: reservations_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.reservations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reservations_id_seq OWNER TO admin;

--
-- Name: reservations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.reservations_id_seq OWNED BY public.reservations.id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.roles (
    id bigint NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.roles OWNER TO admin;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roles_id_seq OWNER TO admin;

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- Name: user_opinions; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.user_opinions (
    id bigint NOT NULL,
    description character varying(500),
    is_rating_user_owner boolean,
    stars integer,
    "timestamp" timestamp(6) without time zone,
    rated_user_id bigint,
    rating_user_id bigint,
    reservation_id bigint
);


ALTER TABLE public.user_opinions OWNER TO admin;

--
-- Name: user_opinions_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.user_opinions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_opinions_id_seq OWNER TO admin;

--
-- Name: user_opinions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.user_opinions_id_seq OWNED BY public.user_opinions.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    avatar_link character varying(255),
    avg_rating double precision NOT NULL,
    email character varying(255) NOT NULL,
    first_name character varying(255),
    google_id character varying(255) NOT NULL,
    last_name character varying(255),
    location_latitude double precision NOT NULL,
    location_longitude double precision NOT NULL,
    opinions_amount integer NOT NULL,
    phone_number character varying(255),
    uuid character varying(255) NOT NULL,
    role_id bigint
);


ALTER TABLE public.users OWNER TO admin;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO admin;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: association_rules id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.association_rules ALTER COLUMN id SET DEFAULT nextval('public.association_rules_id_seq'::regclass);


--
-- Name: email_logs id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.email_logs ALTER COLUMN id SET DEFAULT nextval('public.email_logs_id_seq'::regclass);


--
-- Name: email_types id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.email_types ALTER COLUMN id SET DEFAULT nextval('public.email_types_id_seq'::regclass);


--
-- Name: game_instance_images id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.game_instance_images ALTER COLUMN id SET DEFAULT nextval('public.game_instance_images_id_seq'::regclass);


--
-- Name: game_instance_opinions id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.game_instance_opinions ALTER COLUMN id SET DEFAULT nextval('public.game_instance_opinions_id_seq'::regclass);


--
-- Name: game_instances id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.game_instances ALTER COLUMN id SET DEFAULT nextval('public.game_instances_id_seq'::regclass);


--
-- Name: game_statuses id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.game_statuses ALTER COLUMN id SET DEFAULT nextval('public.game_statuses_id_seq'::regclass);


--
-- Name: reservation_status id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.reservation_status ALTER COLUMN id SET DEFAULT nextval('public.reservation_status_id_seq'::regclass);


--
-- Name: reservations id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.reservations ALTER COLUMN id SET DEFAULT nextval('public.reservations_id_seq'::regclass);


--
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- Name: user_opinions id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_opinions ALTER COLUMN id SET DEFAULT nextval('public.user_opinions_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: association_rules; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.association_rules (id, antecedent, confidence, consequent, lift, support) FROM stdin;
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.categories (id, name, name_pl) FROM stdin;
0	Age of Reason	Wiek Pracy
1	Economic	gospodarczy
2	Industry / Manufacturing	Bran┼╝a / Produkcja
3	Post-Napoleonic	Post-Napoleo┼äski
4	Trains	Poci─àgi
5	Transportation	Transport
6	Environmental	┼Ürodowiskowy
7	Medical	Medyczny
8	Adventure	Przygoda
9	Exploration	Eksploracja
10	Fantasy	Fantazja
11	Fighting	Walka
12	Miniatures	Miniaturki
13	Animals	Zwierz─Öta
14	Civilization	Cywilizacja
15	Negotiation	Negocjacje
16	Political	Polityczny
17	Science Fiction	Fantastyka naukowa
18	Space Exploration	Eksploracja kosmiczna
19	Wargame	Gra wojenna
20	Territory Building	Budowa terytorium
21	Movies / TV / Radio theme	Filmy / TV / Radio Temat
22	Novel-based	Opieraj─àce si─Ö na powie┼¢ciach
23	Civil War	Wojna domowa
24	Mythology	Mitologia
25	Card Game	Gra karciana
26	Modern Warfare	Nowoczesna Wojna
27	American West	Dziki Zach├│d Ameryki
28	Dice	Kostki
29	Medieval	┼Üredniowiecze
30	Ancient	Staro┼╝ytny
31	City Building	Budowa miasta
32	Horror	Horror
33	Nautical	Morski
34	Farming	Rolnictwo
35	Puzzle	Gra logiczna
36	Educational	Edukacyjny
37	Collectible Components	Zbieralne komponenty
38	Travel	Podr├│┼╝e
39	Religious	Religijny
\.


--
-- Data for Name: email_logs; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.email_logs (id, content, sending_time, sent, "timestamp", title, receiver_id, type_id) FROM stdin;
1	\N	2023-11-30 20:12:06.44	t	2023-11-30 20:12:03.268	GameShare - Rejestracja	1	1
\.


--
-- Data for Name: email_types; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.email_types (id, type) FROM stdin;
1	REGISTRATION
2	RESERVATION_ACCEPTED
3	RESERVATION_REJECTED
4	RESERVATION_PENDING
5	RESERVATION_COMING_SOON
6	RESERVATION_CANCELED_BY_OWNER
7	RESERVATION_CANCELED_BY_RENTER
8	RESERVATION_FINISHED
9	RESERVATION_TODAY
10	RESERVATION_EXPIRED
11	NEW_GAME
\.


--
-- Data for Name: game_instance_images; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.game_instance_images (id, image_link, image_name, game_instance_id) FROM stdin;
\.


--
-- Data for Name: game_instance_opinions; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.game_instance_opinions (id, description, stars, "timestamp", game_instance_id, rating_user_id, reservation_id) FROM stdin;
\.


--
-- Data for Name: game_instances; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.game_instances (id, avg_rating, description, is_active, opinions_amount, price_per_day, uuid, game_id, owner_id) FROM stdin;
1	0	Wszystkie elementy s─à w dobrym stanie.	t	0	20	39d1c341-8014-40ba-be4f-eb92e3c31e38	2	1
2	0	Wszystkie elementy s─à w dobrym stanie.	t	0	20	4f65872e-b95c-4512-a6ec-fceba6ca4b8b	1	1
3	0	Wszystkie elementy s─à w dobrym stanie.	t	0	20	72e37a2a-2aca-4ac1-9466-8a2e9672ac4c	3	1
4	0	Wszystkie elementy s─à w dobrym stanie.	t	0	20	0217654d-79df-4d1c-917b-ef2b58e166ec	4	1
5	0	Wszystkie elementy s─à w dobrym stanie.	t	0	20	3e529668-b989-4538-8d68-3cf79c41d35d	5	1
\.


--
-- Data for Name: game_statuses; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.game_statuses (id, status) FROM stdin;
1	Accepted
2	Rejected
3	Pending
\.


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.games (id, age, image, max_players, min_players, name, name_pl, original_id, playing_time, short_description, short_description_pl, game_status_id) FROM stdin;
1	13	https://cf.geekdo-images.com/-Qer2BBPG7qGGDu6\nKcVDIw__original/img/PlzAH7swN1nsFxOXbfUvE3TkE5w=/0x0/filters:format(png)/pic2452831.png	4	2	Pandemic Legacy: Season 1	Pandemic Legacy: Sezon 1	161936	60	Pandemic Legacy is a co-operative campaign game where players\n work together to fight diseases and find cures. The game is played through 12-24 sessions with an overarching story-arc. Players travel around the world, taking actions to treat diseases, build structures, trade cards, and find\n cures, all while dealing with the threat of outbreaks and increasing panic levels. Throughout the game, new rules and components are introduced, and players may have to permanently alter the game components.	Pandemic Legacy \nto kooperacyjna gra kampanijna, w kt├│rej gracze wsp├│lnie walcz─à z chorobami i szukaj─à lekarstw. Gra jest rozgrywana w ci─àgu 12-24 sesji, z og├│lnym w─àtkiem fabularnym. Gracze podr├│┼╝uj─à po ┼¢wiecie podejmuj─àc dzia┼éania w celu lecze\nnia chor├│b, budowania struktur, handlu kartami i znajdowania lekarstw, a wszystko to przy jednoczesnym radzeniu sobie z zagro┼╝eniem wybuch├│w i rosn─àcych poziom├│w paniki. W trakcie gry wprowadzane s─à nowe zasady i komponenty, a g\nracze mog─à by─ç zmuszeni do trwa┼éej zmiany element├│w gry.	1
2	14	https://cf.geekdo-images.com/sZYp_3BTDGjh2una\nZfZmuA__original/img/7d-lj5Gd1e8PFnD97LYFah2c45M=/0x0/filters:format(jpeg)/pic2437871.jpg	4	1	Gloomhaven	Gloomhaven	174430	120	Gloomhaven is a tactical combat game set in a persistent world where players take on the\n role of adventurers exploring dungeons and ruins. It features a cooperative gameplay with a unique card system for determining actions. Players must strategize their card choices and make decisions that impact the evolving stor\nyline as they progress through the game.	Gloomhaven to taktyczna gra bitewna osadzona w trwa┼éym ┼¢wiecie, w kt├│rej gracze wcielaj─à si─Ö w rol─Ö poszukiwaczy przyg├│d eksploruj─àcych lochy i ruiny. Charakteryzuje si─Ö ona wsp├│┼épracu\nj─àcym trybem rozgrywki z unikalnym systemem kart do okre┼¢lania dzia┼éa┼ä. Gracze musz─à strategizowa─ç wyb├│r kart i podejmowa─ç decyzje, kt├│re wp┼éywaj─à na rozwijaj─àc─à si─Ö fabu┼é─Ö w miar─Ö post─Öp├│w w grze.	1
3	14	https://cf.geekdo-images.com/SoU8p28Sk1s8MSvo\nM4N8pQ__original/img/g4S18szTdrXCdIwVKzMKrZrYAcM=/0x0/filters:format(jpeg)/pic6293412.jpg	4	1	Ark Nova	Ark Nova would not be translated into Polish as it is a proper name.	342942	150	In Ark Nova, you will plan and d\nesign a modern zoo, aiming to become the most successful establishment. Build enclosures, accommodate animals, and support conservation projects worldwide with the help of specialists and unique buildings. Use action cards to ma\nnage gameplay, allowing you to gain new zoo cards, build structures, accommodate animals, carry out tasks, and play sponsor cards or raise money. With 255 cards featuring animals, specialists, enclosures, and conservation projec\nts, increase the appeal and scientific reputation of your zoo while collecting conservation points.	W Ark Noi, zaplanujesz i zaprojektujesz nowoczesne zoo, maj─àc na celu stanie si─Ö najbardziej udanym obiektem. Buduj wybiegi, \nzapewniaj zakwaterowanie zwierz─Ötom i wspieraj projekty ochrony na ca┼éym ┼¢wiecie przy pomocy specjalist├│w i unikalnych budynk├│w. U┼╝ywaj kart akcji do zarz─àdzania rozgrywk─à, pozwalaj─àc sobie na zdobycie nowych kart zoo, budowanie\n struktur, zapewnienie zakwaterowania zwierz─Ötom, wykonywanie zada┼ä oraz granie kart sponsor├│w lub zbieranie funduszy. Za pomoc─à 255 kart z udzia┼éem zwierz─àt, specjalist├│w, wybieg├│w i projekt├│w ochrony, zwi─Ökszaj atrakcyjno┼¢─ç i \nnaukow─à renom─Ö swojego zoo, jednocze┼¢nie zbieraj─àc punkty ochrony.	1
4	14	https://cf.geekdo-images.com/_Ppn5lssO5OaildS\nE-FgFA__original/img/kVpZ0Maa_LeQGWxOqsYKP3N4KUY=/0x0/filters:format(jpeg)/pic3727516.jpg	6	3	Twilight Imperium: Fourth Edition	Zmierzch Imperium: Czwarta Edycja	233078	480	Twilight Imperium (Fourth Edition) is a ga\nme of galactic conquest where players take on the role of one of seventeen factions. Players compete to achieve galactic domination through military strength, political maneuvering, and economic bargaining. With unique factions,\n a dynamic game board, and changing objectives, no two games of Twilight Imperium are ever the same.	Twilight Imperium (Czwarta Edycja) to gra o zdobyciu galaktyki, w kt├│rej gracze wcielaj─à si─Ö w jedn─à z siedemnastu frakcji. \nRywalizuj─à ze sob─à o osi─àgni─Öcie panowania nad galaktyk─à poprzez si┼é─Ö militarnej, manewry polityczne i negocjacje ekonomiczne. Z unikalnymi frakcjami, dynamiczn─à plansz─à gry i zmieniaj─àcymi si─Ö celami, ┼╝adne dwie gry w Twilight \nImperium nie s─à takie same.	1
5	12	https://cf.geekdo-images.com/wg9oOLcsKvDesSUd\nZQ4rxw__original/img/thIqWDnH9utKuoKVEUqveDixprI=/0x0/filters:format(jpeg)/pic3536616.jpg	5	1	Terraforming Mars	Terraformowanie Marsa	167791	120	In Terraforming Mars, players take on the role of corporations competi\nng to terraform the planet Mars. They must work together to raise the temperature, oxygen level, and ocean coverage while also earning victory points for advancing human infrastructure and achieving other commendable feats. By a\ncquiring unique project cards and strategically managing resources, players can increase their production and score while strategically placing city, ocean, and greenery tiles on the game board. The game ends when all three glob\nal parameters are reached, and the player with the highest Terraform Rating and victory points wins.	W grze Terraforming Mars gracze wcielaj─à si─Ö w role korporacji rywalizuj─àcych o terraformowanie planety Mars. Musz─à wsp├│lnie\n podnie┼¢─ç temperatur─Ö, poziom tlenu i pokrycie oceanu, jednocze┼¢nie zdobywaj─àc punkty zwyci─Östwa za rozwijanie infrastruktury dla ludzi i osi─àganie innych godnych uznania osi─àgni─Ö─ç. Poprzez zdobycie unikalnych kart projekt├│w i s\ntrategiczne zarz─àdzanie zasobami, gracze mog─à zwi─Öksza─ç swoj─à produkcj─Ö i zdobywa─ç punkty, jednocze┼¢nie strategicznie umieszczaj─àc kafelki miast, ocean├│w i zieleni na planszy gry. Gra ko┼äczy si─Ö, gdy osi─àgni─Öte zostan─à trzy glob\nalne parametry, a gracz z najwy┼╝szym ocenianiem terraformacji i punktami zwyci─Östwa wygrywa.	1
6	14	https://cf.geekdo-images.com/PhjygpWSo-0labGr\nPBMyyg__original/img/mZzaBAEEJpMlHWWmC0R6Su0OibQ=/0x0/filters:format(jpeg)/pic5666597.jpg	4	1	Dune: Imperium	Dune: Imperium: "Pustynia: Imperium"	316554	120	Dune: Imperium is a deck-building game that combines worke\nr placement with hidden information. Set in the Dune universe, players take on the roles of leaders of Great Houses, vying for control over the desert planet of Arrakis. As you acquire cards and build your deck, you must strateg\nically deploy your Agents to different spaces on the game board to gain an advantage militarily or politically. Defeat your rivals and acquire precious cards to lead your House to victory.	Dune: Imperium to gra budowania tali\ni, kt├│ra ┼é─àczy umieszczanie pracownik├│w z ukrytymi informacjami. Umieszczona w uniwersum Dune, gracze przejmuj─à role lider├│w Wielkich Dom├│w, rywalizuj─àcych o kontrol─Ö nad pustynn─à planet─à Arrakis. Podczas zdobywania kart i budow\ny talii, musisz strategicznie rozmieszcza─ç swoich Agent├│w na r├│┼╝nych przestrzeniach planszy, aby zdoby─ç przewag─Ö militarn─à lub polityczn─à. Pokonaj swoich rywali i zdob─àd┼║ cenne karty, aby poprowadzi─ç sw├│j Dom do zwyci─Östwa.	1
7	14	https://cf.geekdo-images.com/_HhIdavYW-hid20I\nq3hhmg__original/img/PBzsLRqNKQKJxGnzpb7o3qLWPQM=/0x0/filters:format(jpeg)/pic5055631.jpg	4	1	Gloomhaven: Jaws of the Lion	Gloomhaven: Szpony Lwa	291457	120	Gloomhaven: Jaws of the Lion is a standalone game set befo\nre the original Gloomhaven. It introduces four new characters and a new campaign with 25 scenarios. The game aims to appeal to a more casual audience by simplifying rules and providing a tutorial to ease new players into the exp\nerience.	Gloomhaven: Jaws of the Lion jest samodzieln─à gr─à osadzon─à przed pierwotnym Gloomhaven. Wprowadza czterech nowych bohater├│w i now─à kampani─Ö sk┼éadaj─àc─à si─Ö z 25 scenariuszy. Gra ma na celu przyci─àgni─Öcie bardziej casu\nalowej publiczno┼¢ci poprzez uproszczenie zasad i zapewnienie samouczka, kt├│ry u┼éatwi nowym graczom wej┼¢cie w do┼¢wiadczenie.	1
8	13	https://cf.geekdo-images.com/ImPgGag98W6gpV1K\nV812aA__original/img/38jB7fN07DwlrGKYAf-J0vsNdgs=/0x0/filters:format(jpeg)/pic1215633.jpg	4	2	War of the Ring: Second Edition	Wojna o Pier┼¢cie┼ä: Drugie wydanie	115746	180	War of the Ring is a strategy game where one\n player controls the Free Peoples and the other controls the Shadow Armies. Players can win through military victory or by the quest of the Ringbearer, while navigating political alliances and encountering numerous dangers along\n the way. The game revolves around the roll of Action Dice, which determine the actions players can take, and Event Cards, which can create unexpected turns in the game.	Wojna o Pier┼¢cie┼ä to gra strategiczna, w kt├│rej jeden g\nracz kontroluje Wolne Ludy, a drugi kontroluje Armie Cienia. Gracze mog─à zwyci─Ö┼╝y─ç poprzez militarn─à dominacj─Ö lub poprzez wykonanie zadania przez D┼║wigacza Pier┼¢cienia, nale┼╝y jednak bra─ç pod uwag─Ö polityczne sojusze oraz liczn\ne niebezpiecze┼ästwa, kt├│re napotykaj─à po drodze. Gra opiera si─Ö na rzutach Ko┼¢─çmi Akcji, kt├│re okre┼¢laj─à mo┼╝liwe do podj─Öcia dzia┼éania przez graczy, oraz Kartach Wydarze┼ä, kt├│re mog─à wprowadza─ç nieprzewidziane zwroty akcji w grz\ne.	1
9	14	https://cf.geekdo-images.com/7SrPNGBKg9IIsP4U\nQpOi8g__original/img/GKueTbkCk2Ramf6ai8mDj-BP6cI=/0x0/filters:format(jpeg)/pic4325841.jpg	4	2	Star Wars: Rebellion	Guerre stellari: Rebelia	187645	240	Star Wars: Rebellion is a board game where players take on the r\noles of the Galactic Empire or the Rebel Alliance in an epic conflict. Each side has different win conditions and players must command troops and starships, rally systems, and execute military strikes to achieve their objectives\n. With over 150 plastic miniatures and two game boards representing iconic Star Wars locations, Rebellion offers a grand and cinematic experience while also focusing on the individual efforts of notable characters from the franc\nhise.	Star Wars: Rebelia to gra planszowa, w kt├│rej gracze wcielaj─à si─Ö w rol─Ö Galaktycznej Imperium lub Sojuszu Rebeliant├│w w epickim konflikcie. Ka┼╝da strona ma inne warunki zwyci─Östwa, a gracze musz─à dowodzi─ç wojskiem i st\natkami kosmicznymi, zdobywa─ç systemy i przeprowadza─ç ataki militarne, aby osi─àgn─à─ç swoje cele. Z ponad 150 plastikowymi miniaturkami i dwoma planszami przedstawiaj─àcymi ikoniczne lokacje Gwiezdnych wojen, Rebelia oferuje wielkie\n i filmowe doznanie, skupiaj─àc si─Ö r├│wnie┼╝ na indywidualnych walorach znanych postaci z franczyzy.	1
10	13	https://cf.geekdo-images.com/kjCm4ZvPjIZxS-m\nYgSPy1g__original/img/9uLd9C3XAvInLCLhAoXqKVk56zs=/0x0/filters:format(jpeg)/pic7013651.jpg	4	1	Spirit Island	Wyspa Ducha	162886	120	Spirit Island is a cooperative game where players take on the role of different spi\nrits defending their island home from colonizing Invaders. Each spirit has unique elemental powers that they can use to combat the Invaders, but players must carefully plan and strategize their moves. The game escalates as the I\nnvaders expand and the spirits grow stronger, with victory requiring the destruction of all settlements and cities on the island.	"Duchowa Wyspa" to gra kooperacyjna, w kt├│rej gracze wcielaj─à si─Ö w r├│┼╝ne duchy, broni─àce swoje\nj wyspy przed kolonizatorami. Ka┼╝dy duch ma unikalne mocarstwa pierwiastkowe, kt├│rymi mo┼╝e walczy─ç z intruzami, ale gracze musz─à starannie planowa─ç i strategizowa─ç swoje ruchy. Gra eskaluje, gdy intruzi si─Ö rozprzestrzeniaj─à, a \nduchy staj─à si─Ö silniejsze, a zwyci─Östwo wymaga zniszczenia wszystkich osad i miast na wyspie.	1
11	12	https://cf.geekdo-images.com/hGWFm3hbMlCDsfC\nsauOQ4g__original/img/tjlflQtUPFiTpLpwk1NCVCS29Ic=/0x0/filters:format(png)/pic5375625.png	4	1	Gaia Project	Projekt Gaia	220308	150	Gaia Project is a sci-fi strategy game where players control factions competing to t\nerraform planets and develop advanced technology. Each faction has unique skills and abilities, and must navigate a playing area made up of ten sectors. The game offers variable set-up and high replay value, with the option for \na two-player game on seven sectors.	Gaia Project to gra strategiczna science-fiction, w kt├│rej gracze kontroluj─à frakcje rywalizuj─àce o terraformowanie planet i rozw├│j zaawansowanej technologii. Ka┼╝da frakcja posiada unikalne\n umiej─Ötno┼¢ci i zdolno┼¢ci oraz musi porusza─ç si─Ö po obszarze gry sk┼éadaj─àcym si─Ö z dziesi─Öciu sektor├│w. Gra oferuje zmienn─à konfiguracj─Ö i wysok─à warto┼¢─ç powtarzalno┼¢ci, a tak┼╝e mo┼╝liwo┼¢─ç rozgrywki dwuosobowej na siedmiu sektora\nch.	1
12	14	https://cf.geekdo-images.com/fVwPntkJKgaEo0r\nIC0RwpA__original/img/1jawNpljTXwnT4km_2CjGwoUPR8=/0x0/filters:format(jpeg)/pic2663291.jpg	4	2	Through the Ages: A New Story of Civilization	Przez Wieki: Nowa Historia Cywilizacji	182028	120	Through the Ages: A New \nStory of Civilization is a civilization building game where players strive to create the best civilization by managing resources, discovering technologies, electing leaders, and maintaining a strong military. The game spans mult\niple ages, from antiquity to modern times. Card drafting is a key mechanic, with technologies, wonders, and leaders becoming easier to acquire as the game progresses. The player with the highest cultural score at the end of the \nmodern age wins.	Poprzez wieki: Nowa historia cywilizacji to gra budowania cywilizacji, w kt├│rej gracze d─à┼╝─à do stworzenia najlepszej cywilizacji, zarz─àdzaj─àc zasobami, odkrywaj─àc technologie, wybieraj─àc lider├│w i utrzymuj─àc \nsilne wojsko. Gra obejmuje wiele epok, od staro┼╝ytno┼¢ci do wsp├│┼éczesno┼¢ci. Mechanizm wyboru kart jest kluczowy, a technologie, cuda i przyw├│dcy staj─à si─Ö coraz ┼éatwiejsze do zdobycia w miar─Ö post─Öp├│w gry. Gracz z najwy┼╝szym wyni\nkiem kulturowym na ko┼äcu epoki nowoczesnej wygrywa.	1
13	13	https://cf.geekdo-images.com/pNCiUUphnoeWOYf\nsWq0kng__original/img/Iae47UtAd_RXVd5tJ3YzbDHOv4E=/0x0/filters:format(jpeg)/pic3530661.jpg	2	2	Twilight Struggle	Zmro┼╝one zmagania	12333	180	Twilight Struggle is a two-player game that simulates the geopolitical con\nflict between the Soviet Union and the United States from 1945 to 1989. Players strategically maneuver units and exert influence on a world map to gain control and allies for their superpower. The game incorporates historical ev\nents and tensions, including the Space Race and the possibility of nuclear war.	Twilight Struggle to dwuosobowa gra, kt├│ra symuluje geopolityczny konflikt mi─Ödzy Zwi─àzkiem Radzieckim a Stanami Zjednoczonymi od 1945 do 1989 ro\nku. Gracze strategicznie manewruj─à jednostkami i wywieraj─à wp┼éyw na mapie ┼¢wiata, aby zdoby─ç kontrol─Ö i sojusznik├│w dla swojej supermocarstwa. Gra uwzgl─Ödnia historyczne wydarzenia i napi─Öcia, takie jak Wy┼¢cig Kosmiczny i mo┼╝liw\no┼¢─ç wojny nuklearnej.	1
14	12	https://cf.geekdo-images.com/u1l0gH7sb_vnvDv\noO_QHqA__original/img/2zv_XMQoPFWk9Dn0oS4JY1IeFzw=/0x0/filters:format(jpeg)/pic4887376.jpg	4	2	Great Western Trail	Wielki Zachodni Szlak	193738	150	In Great Western Trail, players take on the role of ranchers in 19t\nh century America. Their goal is to herd cattle from Texas to Kansas City, where they can be sent off by train to earn money and victory points. Players must strategically manage their herds, utilize various buildings, and hire \ncapable staff to come out on top and win the game.	W Great Western Trail gracze wcielaj─à si─Ö w rol─Ö hodowc├│w byd┼éa w XIX wiecznej Ameryce. Ich celem jest prowadzenie stad byd┼éa z Teksasu do Kansas City, gdzie mog─à je wys┼éa─ç p\noci─àgiem, aby zarobi─ç pieni─àdze i punkty zwyci─Östwa. Gracze musz─à strategicznie zarz─àdza─ç swoimi stadami, wykorzystywa─ç r├│┼╝ne budynki i zatrudnia─ç kompetentny personel, aby osi─àgn─à─ç sukces i wygra─ç gr─Ö.	1
15	14	https://cf.geekdo-images.com/7k_nOxpO9OGIjhL\nq2BUZdA__original/img/HlDb9F365w0tSP8uD1vf1pfniQE=/0x0/filters:format(jpeg)/pic3163924.jpg	5	1	Scythe	Kosa	169786	115	Scythe is an alternate-history 1920s engine-building game where players represent characters from\n Eastern Europe factions trying to claim their stake in the land surrounding a mysterious Factory. Players conquer territory, enlist recruits, gather resources, build structures, and activate mechs to progress in the game. Scyth\ne offers almost complete control over one's fate with minimal luck elements and a streamlined action-selection mechanism for quick gameplay.	Scythe to gra osadzona w alternatywnej historii lat 20. XX wieku, w kt├│rej gracze r\neprezentuj─à postacie z frakcji wschodnioeuropejskich, pr├│buj─àcych zdoby─ç swoje miejsce w ziemi otaczaj─àcej tajemnicz─à Fabryk─Ö. Gracze podbijaj─à terytoria, zwerbuj─à rekrut├│w, zbieraj─à surowce, buduj─à struktury i aktywuj─à mechy, a\nby rozwija─ç si─Ö w grze. Scythe oferuje prawie pe┼én─à kontrol─Ö nad swoim losem, minimalizuj─àc elementy losowe i stosuj─àc przep┼éyw akcji, zapewniaj─àcy szybk─à rozgrywk─Ö.	1
16	12	https://cf.geekdo-images.com/5CFwjd8zTcGYVUn\nkXh04hw__original/img/N8btACZrnEYK1amBNk26VBdcGwc=/0x0/filters:format(jpeg)/pic1176894.jpg	4	2	The Castles of Burgundy	Zamki Burgundii	84876	90	In The Castles of Burgundy, players take on the role of aristocrats in \nmedieval France, building settlements and castles, trading along the river, and mining for silver. The game is played over five phases and each player rolls dice to take actions such as placing settlement tiles, delivering goods\n, and acquiring worker tokens. Victory points are earned through various actions and the player with the most points at the end of the game wins.	W grze "Zamki w Burundy" gracze wcielaj─à si─Ö w arystokrat├│w we ┼¢redniowiecznej \nFrancji, buduj─à osady i zamki, handluj─à wzd┼éu┼╝ rzeki i wydobywaj─à srebro. Gra sk┼éada si─Ö z pi─Öciu faz, a ka┼╝dy gracz rzuca kostkami, aby podejmowa─ç dzia┼éania, takie jak umieszczanie p┼éytek osad, dostarczanie towar├│w i zdobywanie\n ┼╝eton├│w robotnik├│w. Punkty zwyci─Östwa zdobywa si─Ö poprzez r├│┼╝ne dzia┼éania, a gracz z najwi─Öksz─à liczb─à punkt├│w na koniec gry wygrywa.	1
17	10	https://cf.geekdo-images.com/zdagMskTF7wJBPj\nX74XsRw__original/img/Ju836WNSaW7Mab9Vjq2TJ_FqhWQ=/0x0/filters:format(jpeg)/pic2576399.jpg	2	2	7 Wonders Duel	Siedem Cud├│w ┼Üwiata: Duel	173346	30	In 7 Wonders Duel, players acquire cards over three ages to develop t\nheir civilization and complete wonders. Unlike the original game, this version is designed for two players and involves drafting cards from a display. Players can also purchase resources or gain cards to increase their dominance\n and win the game by achieving military or scientific dominance, or by having the most points at the end.	W grze 7 Cud├│w Duel, gracze zdobywaj─à karty na przestrzeni trzech epok, aby rozwija─ç swoj─à cywilizacj─Ö i uko┼äczy─ç cuda.\n W przeciwie┼ästwie do oryginalnej gry, ta wersja jest zaprojektowana dla dw├│ch graczy i obejmuje wybieranie kart z ekspozycji. Gracze mog─à r├│wnie┼╝ nabywa─ç surowce lub zdobywa─ç karty, aby zwi─Ökszy─ç swoj─à dominacj─Ö i wygra─ç gr─Ö, o\nsi─àgaj─àc dominacj─Ö militarystyczn─à lub naukow─à, lub maj─àc najwi─Öksz─à liczb─Ö punkt├│w na ko┼äcu.	1
18	14	https://cf.geekdo-images.com/Oh3kHw6lweg6ru7\n1Q16h2Q__original/img/yW7d4RNfU1ndISCaPlfGYUyxnRU=/0x0/filters:format(jpeg)/pic5235277.jpg	6	2	Eclipse: Second Dawn for the Galaxy	Eclipse: Drugi ┼Üwit dla Galaktyki	246900	200	In Eclipse, you take control of an inte\nrstellar civilization and compete with other players for success. Explore star systems, research technology, and build spaceships to wage war. With multiple paths to victory, strategize according to your species' strengths and \nweaknesses, while keeping an eye on the other civilizations. Improve your gaming experience with a revised and upgraded version, Eclipse: Second Dawn for the Galaxy, featuring new graphics, miniatures, customized components, and\n fine-tuned gameplay.	W grze Eclipse przejmujesz kontrol─Ö nad mi─Ödzygalaktyczn─à cywilizacj─à i rywalizujesz z innymi graczami o sukces. Odkrywaj uk┼éady gwiazd, badaj technologi─Ö i buduj statki kosmiczne, aby prowadzi─ç wojn─Ö. D\nzi─Öki wielu ┼¢cie┼╝kom do zwyci─Östwa, strategizuj zgodnie z mocnymi i s┼éabymi stronami twojego gatunku, jednocze┼¢nie zwracaj─àc uwag─Ö na inne cywilizacje. Popraw swoje do┼¢wiadczenie z gr─à dzi─Öki zrewidowanej i ulepszonej wersji, Ec\nlipse: Second Dawn for the Galaxy, kt├│ra oferuje nowe grafiki, figurki, spersonalizowane komponenty i dopracowan─à rozgrywk─Ö.	1
19	14	https://cf.geekdo-images.com/tHVtPzu82mBpeQb\nbZkV6EA__original/img/3ffdJj5Pz6HQrg09Kh8ecTen-TY=/0x0/filters:format(jpeg)/pic3469216.jpg	4	2	Brass: Lancashire	Mosi─àdz: Lancashire	28720	120	Brass: Lancashire is an economic strategy game set during the industrial\n revolution in Lancashire. Compete with other players to develop your industries and capitalize on the demand for iron, coal, and cotton. The game is played in two halves, with players taking turns to build industries, construct\n rail and canal networks, sell cotton, and more. Score victory points based on your canals, rails, and established industry tiles to win the game. The 2018 edition includes new artwork, components, and rules changes to enhance g\nameplay.	Brass: Lancashire to gra strategiczna ekonomiczna, osadzona podczas rewolucji przemys┼éowej w Lancashire. Rywalizuj z innymi graczami, rozwijaj swoje przemys┼éy i korzystaj z popytu na ┼╝elazo, w─Ögiel i bawe┼én─Ö. Gra sk┼é\nada si─Ö z dw├│ch cz─Ö┼¢ci, w kt├│rych gracze na przemian buduj─à przemys┼é, tworz─à sieci kolejowe i kana┼éowe, sprzedaj─à bawe┼én─Ö i wiele wi─Öcej. Punkty zwyci─Östwa zdobywa si─Ö na podstawie wybudowanych kana┼é├│w, linii kolejowych i utworz\nonych p┼éytek przemys┼éowych. W edycji z 2018 roku znalaz┼éy si─Ö nowe ilustracje, komponenty oraz zmiany w zasadach, aby zwi─Ökszy─ç przyjemno┼¢─ç z rozgrywki.	1
20	12	https://cf.geekdo-images.com/tAqLpWxQ0Oo3GaP\nP3MER1g__original/img/sA6r1p6BO_Tgyc3-xgIESC9Y-vg=/0x0/filters:format(jpeg)/pic5073276.jpg	5	1	Nemesis	Nemezis	167355	180	Nemesis is a sci-fi survival horror game where players must navigate a ship infested with hos\ntile organisms. Each player controls a crew member with unique skills and must complete objectives to win the game and return to Earth. The game is designed to be full of climactic moments, even if your plans fail and your chara\ncter meets a terrible fate.	Nemesis to gra science fiction z gatunku survival horror, w kt├│rej gracze musz─à porusza─ç si─Ö po statku opanowanym przez wrogie organizmy. Ka┼╝dy gracz kontroluje cz┼éonka za┼éogi o unikalnych umiej─Ötn\no┼¢ciach i musi wykona─ç zadania, aby wygra─ç gr─Ö i powr├│ci─ç na Ziemi─Ö. Gra zosta┼éa zaprojektowana tak, aby by┼éa pe┼éna klimatycznych moment├│w, nawet je┼¢li twoje plany zawiod─à i twoja posta─ç spotka straszny los.	1
21	13	https://cf.geekdo-images.com/CzwSm8i7tkLz6cB\nnrILZBg__original/img/BhJ3sB3uk-eSdR1iW4EP3cu0Wi0=/0x0/filters:format(jpeg)/pic3453267.jpg	5	2	Concordia	In Polish, the name "Concordia" is translated as "Konkordia".	124361	100	Concordia is a peaceful strategy game\n set in Roman times. Players guide a dynasty, sending colonists to expand their trade network and appeasing gods for favor. With no reliance on luck, players must use strategic abilities to outpace rivals and achieve victory.	Concordia to spokojna gra strategiczna osadzona w czasach rzymskich. Gracze prowadz─à dynasti─Ö, wysy┼éaj─àc osadnik├│w w celu rozszerzenia sieci handlowej i uk┼éadaj─àcych bog├│w, aby zyska─ç ich wzgl─Ödy. Bez polegania na szcz─Ö┼¢ciu, gr\nacze musz─à wykorzysta─ç umiej─Ötno┼¢ci strategiczne, aby wyprzedzi─ç rywali i osi─àgn─à─ç zwyci─Östwo.	1
22	12	https://cf.geekdo-images.com/s9oGMCo1fcfV4Dk\n3EnqLZw__original/img/N1X-0JB1GapFVhl98nP4tNFXMcM=/0x0/filters:format(png)/pic3146943.png	4	1	A Feast for Odin	Prza┼¢nik dla Odyna	177736	120	A Feast for Odin is a Viking-themed board game where players can relive th\ne cultural achievements and pillages of the Vikings. Players will raid, explore new territories, and collect goods to achieve financial success in society. The game involves worker placement, building an engine over time, and st\nrategically balancing risk and reward to accumulate the most valuable possessions and become the winner.	A Feast for Odin to gra planszowa o tematyce wiking├│w, w kt├│rej gracze mog─à odtworzy─ç osi─àgni─Öcia kulturowe oraz ┼éupie┼╝c\nze wyprawy wiking├│w. Gracze b─Öd─à dokonywa─ç ┼éupie┼╝y, odkrywa─ç nowe terytoria oraz zbiera─ç dobra, aby osi─àgn─à─ç finansowy sukces w spo┼éecze┼ästwie. Gra zak┼éada ustawienie robotnik├│w, budowanie silnika w czasie oraz strategiczne bala\nnsowanie ryzykiem i nagrod─à, aby zgromadzi─ç najcenniejsze posiad┼éo┼¢ci i sta─ç si─Ö zwyci─Özc─à.	1
23	13	https://cf.geekdo-images.com/hc2NDafu5c24iLJ\nh_IZmyg__original/img/1Fpyz7j7rTvMPRiDdPjn0Vf0m2k=/0x0/filters:format(png)/pic4885780.png	4	2	Clank! Legacy: Acquisitions Incorporated	Clank! Legacy: Acquisitions Incorporated\n\nTranslation in Polish: Clank! Legacy: Sp├│┼éka Akwizycyjna	266507	120	Clank! Legacy: Acquisitions Incorporated is a deck-building game with a legacy-style gameplay. Players create their own franchise of the adventuring compan\ny Acquisitions Incorporated and guide their treasure-hunters to corporate success throughout multiple games. The game board, deck, and world evolve as players progress, creating a personalized campaign for each adventuring party\n.	Clank! Legacy: Acquisitions Incorporated to gra budowania talii z rozgrywk─à w stylu legacy. Gracze tworz─à w┼éasn─à franczyz─Ö sp├│┼éki poszukiwaczy przyg├│d Acquisitions Incorporated i prowadz─à swoich ┼éowc├│w skarb├│w do korporacyj\nnego sukcesu podczas wielu gier. Plansza gry, talia i ┼¢wiat ewoluuj─à wraz post─Öpem graczy, tworz─àc spersonalizowan─à kampani─Ö dla ka┼╝dej przyg├│dki.	1
24	10	https://cf.geekdo-images.com/yLZJCVLlIx4c7eJ\nEWUNJ7w__original/img/cI782Zis9cT66j2MjSHKJGnFPNw=/0x0/filters:format(jpeg)/pic4458123.jpg	5	1	Wingspan	Rozpi─Öto┼¢─ç skrzyde┼é	266192	70	Wingspan is a competitive card-driven board game where players take on the role o\nf bird enthusiasts seeking to attract the best birds to their wildlife preserves. By utilizing powerful combinations, players can gain food tokens, lay eggs, and play from a variety of unique bird cards. The winner is determined\n by the player with the most points after four rounds.	Wingspan to konkurencyjna planszowa gra karciana, w kt├│rej gracze wcielaj─à si─Ö w mi┼éo┼¢nik├│w ptak├│w, staraj─àcych si─Ö przyci─àgn─à─ç najlepsze ptaki do swoich rezerwat├│w przyr\nody. Poprzez wykorzystywanie pot─Ö┼╝nych kombinacji, gracze mog─à zdobywa─ç ┼╝etony po┼╝ywienia, sk┼éada─ç jaja i gra─ç z r├│┼╝norodnych unikalnych kart ptak├│w. Zwyci─Özc─à jest gracz, kt├│ry zdob─Ödzie najwi─Öcej punkt├│w po czterech rundach.	1
25	12	https://cf.geekdo-images.com/bre12I1YiXkZr7e\nlvriz4A__original/img/_dZS7fVfdc4DhJPbqnDpwTT4uF0=/0x0/filters:format(jpeg)/pic5375624.jpg	5	2	Terra Mystica	Terra Mystica in Polish is "Terra Mystica".	120677	150	Terra Mystica is a strategic game where 14 differen\nt peoples compete to develop and grow in seven different landscapes. Each player governs one of the 14 groups and must strategically plan their actions to rule as much area as possible, develop skills, and progress through relig\nious cults. Players take turns executing actions on their available resources, upgrading buildings, and developing terraforming and seafaring skills. Proximity to other groups can be advantageous but also presents challenges in \nexpanding.	Terra Mystica to strategiczna gra, w kt├│rej 14 r├│┼╝nych narod├│w rywalizuje o rozw├│j i wzrost w siedmiu r├│┼╝nych krajobrazach. Ka┼╝dy gracz rz─àdzi jedn─à z 14 grup i musi strategicznie planowa─ç swoje dzia┼éania, aby pano\nwa─ç nad jak najwi─Ökszym obszarem, rozwija─ç umiej─Ötno┼¢ci i post─Öpowa─ç w ramach kult├│w religijnych. Gracze wykonuj─à ruchy na swoje dost─Öpne zasoby, ulepszaj─à budynki i rozwijaj─à umiej─Ötno┼¢ci terraformowania i ┼╝eglugi. Blisko┼¢─ç inn\nych grup mo┼╝e by─ç korzystna, ale stwarza tak┼╝e wyzwania zwi─àzane z ekspansj─à.	1
26	14	https://cf.geekdo-images.com/B5F5ulz0UivNgrI\n9Ky0euA__original/img/guEKCewM_2e5ugltSN3dTSwdZJI=/0x0/filters:format(jpeg)/pic3122349.jpg	2	1	Arkham Horror: The Card Game	Arkham Horror: Gra karciana	205637	120	Arkham Horror: The Card Game is a Lovecraftian Livin\ng Card Game that combines role-playing and card game elements. Players become characters in the town of Arkham, each with their own talents and flaws. As you uncover mysteries and encounter otherworldly evils, your choices and a\nctions will have consequences that carry over into the campaign and shape the future of the game.	Arkham Horror: Gra karciana jest Lovecraftowsk─à gr─à karcian─à na ┼╝ywo, kt├│ra ┼é─àczy w sobie elementy RPG oraz gry karcianej. Grac\nze staj─à si─Ö postaciami w miasteczku Arkham, z w┼éasnymi umiej─Ötno┼¢ciami i wadami. Kiedy odkrywaj─à tajemnice i spotykaj─à nadnaturalne z┼éo, ich wybory i dzia┼éania b─Öd─à mia┼éy konsekwencje, kt├│re przenosz─à si─Ö na kampani─Ö i kszta┼étu\nj─à przysz┼éo┼¢─ç gry.	1
27	12	https://cf.geekdo-images.com/6GqH14TJJhza86B\nX5HCLEQ__original/img/CXqwimJPonWy1oyXEMgPN_ZVmUI=/0x0/filters:format(jpeg)/pic5674958.jpg	4	1	Lost Ruins of Arnak	Zagubione Ruiny Arnaku	312484	120	Lost Ruins of Arnak is a deck-building and worker placement game s\net on an uninhabited island. Players must explore the island, find artifacts, and confront guardians in order to uncover its secrets. With limited actions and a strategic game board, players must carefully choose their actions a\nnd build a strong resource base to succeed in this unique and challenging game.	Zaginione Ruiny Arnak to gra deck-buildingowa i przydzielania pracownik├│w, osadzona na niezamieszka┼éej wyspie. Gracze musz─à eksplorowa─ç wysp─Ö, zn\najdowa─ç artefakty i stawa─ç w konfrontacji z opiekunami, aby odkry─ç jej sekrety. Ze wzgl─Ödu na ograniczon─à liczb─Ö dzia┼éa┼ä oraz strategiczn─à plansz─Ö, gracze musz─à rozwa┼╝nie wybiera─ç swoje dzia┼éania i budowa─ç silne podstawy zasob├│w\n, aby osi─àgn─à─ç sukces w tej unikalnej i wymagaj─àcej grze.	1
28	10	https://cf.geekdo-images.com/JUAUWaVUzeBgzir\nhZNmHHw__original/img/E0s2LvtFA1L5YKk-_44D4u2VD2s=/0x0/filters:format(jpeg)/pic4254509.jpg	4	2	Root	Korze┼ä	237182	90	Root is an adventure and war game for 2 to 4 players (expandable to 1 to 6 with the 'Riverfolk' \nexpansion). Set in a vast wilderness, each player has unique abilities and victory conditions, with the help of multi-use cards. Players can choose to be part of the Alliance, fighting against the rule of the Marquise de Cat, or\n join the Eyrie faction to reclaim their ancient birthright. The game offers a high level of interaction and replayability, allowing players to drive the narrative and explore the fantastic world of Root.	Root jest gr─à przygo\ndow─à i wojenn─à dla 2-4 graczy (rozszerzaln─à do 1-6 graczy dzi─Öki dodatkowi "Riverfolk"). Osadzona w rozleg┼éej dziczy, ka┼╝dy gracz ma unikalne zdolno┼¢ci i cele zwyci─Östwa, przy pomocy wielofunkcyjnych kart. Gracze mog─à wybra─ç prz\nynale┼╝no┼¢─ç do sojuszu, walcz─àc przeciwko rz─àdom Markizy de Kot, lub do┼é─àczy─ç do frakcji Eyrie, aby odzyska─ç swoje staro┼╝ytne przywileje. Gra oferuje wysoki poziom interakcji i mo┼╝liwo┼¢─ç wielokrotnego rozegrania, pozwalaj─àc gracz\nom prowadzi─ç narracj─Ö i odkrywa─ç fantastyczny ┼¢wiat Root.	1
29	12	https://cf.geekdo-images.com/nagl1li6kYt9elV\n9jbfVQw__original/img/Qn6vlBaTUaHNFsqohIUjd0EA4z0=/0x0/filters:format(jpeg)/pic6228507.jpg	5	2	Orl├⌐ans	Orl├⌐ans in Polish is Orl├⌐ans.	164928	90	In the medieval world of Orl├⌐ans, gather a diverse group of followers in\ncluding farmers, merchants, knights, monks, and more. Utilize their unique abilities to dominate through trade, construction, and science in medieval France. With limited actions and multiple paths to victory, strategically comb\nine all elements to achieve your desired outcome.	W ┼¢redniowiecznym ┼¢wiecie Orl├⌐ans zbierz zr├│┼╝nicowan─à grup─Ö zwolennik├│w, w tym rolnik├│w, kupc├│w, rycerzy, mnich├│w i wielu innych. Wykorzystaj ich unikalne zdolno┼¢ci, aby domin\nowa─ç poprzez handel, budow─Ö i nauk─Ö we francuskim ┼¢redniowieczu. Posiadaj─àc ograniczon─à liczb─Ö dzia┼éa┼ä i wiele ┼¢cie┼╝ek do zwyci─Östwa, strategicznie ┼é─àcz wszystkie elementy, aby osi─àgn─à─ç po┼╝─àdany rezultat.	1
1000	2	\N	2	2	test2123333	\N	\N	2	dupa	\N	1
0	14	https://cf.geekdo-images.com/x3zxjr-Vw5iU4yDP\ng70Jgw__original/img/FpyxH41Y6_ROoePAilPNEhXnzO8=/0x0/filters:format(jpeg)/pic3490053.jpg	4	2	Brass: Birmingham	Mosi─àdz: Birmingham	224517	120	Brass: Birmingham is an economic strategy game set in Birmingham during \nthe industrial revolution. Players compete to develop industries, build networks, and exploit market demands to score the most victory points. The game is played over two halves, the canal era and the rail era, and includes vari\nous actions such as building, networking, developing, selling, taking loans, and scouting for cards.	Brass: Birmingham to strategiczna gra ekonomiczna osadzona w Birmingham w czasach rewolucji przemys┼éowej. Gracze rywalizuj─à,\n ┼╝eby rozwija─ç przemys┼é, budowa─ç sieci oraz wykorzystywa─ç popyt na rynku, aby zdoby─ç jak najwi─Öcej punkt├│w zwyci─Östwa. Gra podzielona jest na dwie cz─Ö┼¢ci: er─Ö kana┼éow─à oraz er─Ö kolejow─à i obejmuje r├│┼╝ne akcje takie jak budowanie\n, tworzenie sieci, rozwijanie, sprzeda┼╝, zaci─àganie po┼╝yczek oraz szukanie kart.	3
\.


--
-- Data for Name: games_categories; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.games_categories (game_id, category_id) FROM stdin;
0	0
0	1
0	2
0	3
0	4
0	5
1	6
1	7
2	8
2	9
2	10
2	11
2	12
3	13
3	1
3	6
4	14
4	1
4	9
4	15
4	16
4	17
4	18
4	19
5	1
5	6
5	2
5	17
5	18
5	20
6	21
6	22
6	16
6	17
7	8
7	9
7	10
7	11
7	12
8	8
8	10
8	11
8	22
8	20
8	19
9	23
9	12
9	21
9	17
9	18
9	19
10	10
10	11
10	24
10	20
11	14
11	1
11	12
11	17
11	18
11	20
12	25
12	14
12	1
13	26
13	16
13	19
14	27
14	13
14	1
15	1
15	11
15	17
15	20
16	28
16	29
16	20
17	30
17	25
17	31
17	14
17	1
18	14
18	9
18	17
18	18
18	19
19	1
19	2
19	3
19	5
20	8
20	32
20	12
20	17
21	30
21	1
21	33
22	1
22	34
22	2
22	29
22	35
23	8
23	10
23	12
24	13
24	25
24	36
25	14
25	1
25	10
25	20
26	8
26	25
26	37
26	9
26	10
26	32
26	22
27	8
27	30
27	9
27	38
28	13
28	10
28	20
28	19
29	29
29	39
29	38
1000	2
\.


--
-- Data for Name: reservation_status; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.reservation_status (id, status) FROM stdin;
1	ACCEPTED_BY_OWNER
2	REJECTED_BY_OWNER
3	PENDING
4	CANCELED_BY_RENTER
5	CANCELED_BY_OWNER
6	RENTED
7	FINISHED
8	EXPIRED
\.


--
-- Data for Name: reservations; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.reservations (id, end_date, renter_comment, reservation_id, start_date, "timestamp", game_instance_id, renter_id, status_id) FROM stdin;
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.roles (id, name) FROM stdin;
1	user
2	admin
\.


--
-- Data for Name: user_opinions; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.user_opinions (id, description, is_rating_user_owner, stars, "timestamp", rated_user_id, rating_user_id, reservation_id) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.users (id, avatar_link, avg_rating, email, first_name, google_id, last_name, location_latitude, location_longitude, opinions_amount, phone_number, uuid, role_id) FROM stdin;
1	https://lh3.googleusercontent.com/a/ACg8ocKRrlaSciHvY9Ycm6ICu58kzkZb7LxKmqxiF6UV8PhR=s96-c	0	kubasamulski1@gmail.com	aa	102119590204296703536	22	51.11004803480332	17.058490735381543	0	+48222222222	e4473a19-d93f-4edf-8e70-1e41090647dc	2
\.


--
-- Name: association_rules_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.association_rules_id_seq', 1, false);


--
-- Name: categories_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.categories_seq', 1000, false);


--
-- Name: email_logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.email_logs_id_seq', 1, true);


--
-- Name: email_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.email_types_id_seq', 22, true);


--
-- Name: game_instance_images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.game_instance_images_id_seq', 1, false);


--
-- Name: game_instance_opinions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.game_instance_opinions_id_seq', 1, false);


--
-- Name: game_instances_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.game_instances_id_seq', 5, true);


--
-- Name: game_statuses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.game_statuses_id_seq', 6, true);


--
-- Name: games_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.games_seq', 1000, true);


--
-- Name: reservation_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.reservation_status_id_seq', 16, true);


--
-- Name: reservations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.reservations_id_seq', 1, false);


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.roles_id_seq', 4, true);


--
-- Name: user_opinions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.user_opinions_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.users_id_seq', 1, true);


--
-- Name: association_rules association_rules_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.association_rules
    ADD CONSTRAINT association_rules_pkey PRIMARY KEY (id);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: email_logs email_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.email_logs
    ADD CONSTRAINT email_logs_pkey PRIMARY KEY (id);


--
-- Name: email_types email_types_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.email_types
    ADD CONSTRAINT email_types_pkey PRIMARY KEY (id);


--
-- Name: game_instance_images game_instance_images_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.game_instance_images
    ADD CONSTRAINT game_instance_images_pkey PRIMARY KEY (id);


--
-- Name: game_instance_opinions game_instance_opinions_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.game_instance_opinions
    ADD CONSTRAINT game_instance_opinions_pkey PRIMARY KEY (id);


--
-- Name: game_instances game_instances_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.game_instances
    ADD CONSTRAINT game_instances_pkey PRIMARY KEY (id);


--
-- Name: game_statuses game_statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.game_statuses
    ADD CONSTRAINT game_statuses_pkey PRIMARY KEY (id);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (id);


--
-- Name: reservation_status reservation_status_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.reservation_status
    ADD CONSTRAINT reservation_status_pkey PRIMARY KEY (id);


--
-- Name: reservations reservations_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.reservations
    ADD CONSTRAINT reservations_pkey PRIMARY KEY (id);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: games uk_6j8nhq8xddmuwiw9ryglyyj1p; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT uk_6j8nhq8xddmuwiw9ryglyyj1p UNIQUE (original_id);


--
-- Name: users uk_6km2m9i3vjuy36rnvkgj1l61s; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT uk_6km2m9i3vjuy36rnvkgj1l61s UNIQUE (uuid);


--
-- Name: reservations uk_85p9h7y2hi7q0tmtd2qi1dt7; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.reservations
    ADD CONSTRAINT uk_85p9h7y2hi7q0tmtd2qi1dt7 UNIQUE (reservation_id);


--
-- Name: games uk_dp39yy9j9cn10v9vhyr2j1uaa; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT uk_dp39yy9j9cn10v9vhyr2j1uaa UNIQUE (name);


--
-- Name: game_instances uk_m4u1vo4di1plf1bk0i19npch5; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.game_instances
    ADD CONSTRAINT uk_m4u1vo4di1plf1bk0i19npch5 UNIQUE (uuid);


--
-- Name: game_statuses uk_o8d7pfngxg1ggx05etm52ci47; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.game_statuses
    ADD CONSTRAINT uk_o8d7pfngxg1ggx05etm52ci47 UNIQUE (status);


--
-- Name: roles uk_ofx66keruapi6vyqpv6f2or37; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT uk_ofx66keruapi6vyqpv6f2or37 UNIQUE (name);


--
-- Name: users uk_ovh8xmu9ac27t18m56gri58i1; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT uk_ovh8xmu9ac27t18m56gri58i1 UNIQUE (google_id);


--
-- Name: email_types uk_pu7jmh2nqxbkodiw3p892mlu; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.email_types
    ADD CONSTRAINT uk_pu7jmh2nqxbkodiw3p892mlu UNIQUE (type);


--
-- Name: reservation_status uk_s1th52jaog3tfvycb35fkigud; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.reservation_status
    ADD CONSTRAINT uk_s1th52jaog3tfvycb35fkigud UNIQUE (status);


--
-- Name: categories uk_t8o6pivur7nn124jehx7cygw5; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT uk_t8o6pivur7nn124jehx7cygw5 UNIQUE (name);


--
-- Name: games_categories uniquegameandcategory; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.games_categories
    ADD CONSTRAINT uniquegameandcategory UNIQUE (game_id, category_id);


--
-- Name: user_opinions user_opinions_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_opinions
    ADD CONSTRAINT user_opinions_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: reservations fk1jou41k6ha34y94krp0pbqgyj; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.reservations
    ADD CONSTRAINT fk1jou41k6ha34y94krp0pbqgyj FOREIGN KEY (status_id) REFERENCES public.reservation_status(id);


--
-- Name: games_categories fk1kgclfj9otsigqddcu03l7ek4; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.games_categories
    ADD CONSTRAINT fk1kgclfj9otsigqddcu03l7ek4 FOREIGN KEY (game_id) REFERENCES public.games(id);


--
-- Name: email_logs fk3fqk7k50q00b8f4xl978er681; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.email_logs
    ADD CONSTRAINT fk3fqk7k50q00b8f4xl978er681 FOREIGN KEY (type_id) REFERENCES public.email_types(id);


--
-- Name: game_instances fk41yml0ske7gio07c45nqabnyp; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.game_instances
    ADD CONSTRAINT fk41yml0ske7gio07c45nqabnyp FOREIGN KEY (owner_id) REFERENCES public.users(id);


--
-- Name: reservations fk6nftp7ami6qudl5csmiyw4i6v; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.reservations
    ADD CONSTRAINT fk6nftp7ami6qudl5csmiyw4i6v FOREIGN KEY (renter_id) REFERENCES public.users(id);


--
-- Name: game_instance_opinions fk6p4n6gv85bg7e59hjo2mvtpgc; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.game_instance_opinions
    ADD CONSTRAINT fk6p4n6gv85bg7e59hjo2mvtpgc FOREIGN KEY (rating_user_id) REFERENCES public.users(id);


--
-- Name: email_logs fk75wm6gcgcc1ktybddv3a5j2fv; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.email_logs
    ADD CONSTRAINT fk75wm6gcgcc1ktybddv3a5j2fv FOREIGN KEY (receiver_id) REFERENCES public.users(id);


--
-- Name: game_instance_images fk9bg0w7oa2nb1ene75vgbdirn; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.game_instance_images
    ADD CONSTRAINT fk9bg0w7oa2nb1ene75vgbdirn FOREIGN KEY (game_instance_id) REFERENCES public.game_instances(id);


--
-- Name: user_opinions fkaagiumwy6b7vl8tote4qs83dx; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_opinions
    ADD CONSTRAINT fkaagiumwy6b7vl8tote4qs83dx FOREIGN KEY (rated_user_id) REFERENCES public.users(id);


--
-- Name: user_opinions fkcfko4mki4o3vut5oubcoojgr5; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_opinions
    ADD CONSTRAINT fkcfko4mki4o3vut5oubcoojgr5 FOREIGN KEY (rating_user_id) REFERENCES public.users(id);


--
-- Name: game_instance_opinions fkif6v11mfst0d1uhln7oie6xp2; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.game_instance_opinions
    ADD CONSTRAINT fkif6v11mfst0d1uhln7oie6xp2 FOREIGN KEY (reservation_id) REFERENCES public.reservations(id);


--
-- Name: reservations fkmdi9tpmy70booo9lhwob01fw3; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.reservations
    ADD CONSTRAINT fkmdi9tpmy70booo9lhwob01fw3 FOREIGN KEY (game_instance_id) REFERENCES public.game_instances(id);


--
-- Name: game_instances fko9sx455ol8iq7ma1uo0wtgncg; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.game_instances
    ADD CONSTRAINT fko9sx455ol8iq7ma1uo0wtgncg FOREIGN KEY (game_id) REFERENCES public.games(id);


--
-- Name: users fkp56c1712k691lhsyewcssf40f; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT fkp56c1712k691lhsyewcssf40f FOREIGN KEY (role_id) REFERENCES public.roles(id);


--
-- Name: game_instance_opinions fkpbhq1vrnle4ka69rp51w4eds4; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.game_instance_opinions
    ADD CONSTRAINT fkpbhq1vrnle4ka69rp51w4eds4 FOREIGN KEY (game_instance_id) REFERENCES public.game_instances(id);


--
-- Name: games_categories fkqi1t09gnavc7jno6wsd8q1o5p; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.games_categories
    ADD CONSTRAINT fkqi1t09gnavc7jno6wsd8q1o5p FOREIGN KEY (category_id) REFERENCES public.categories(id);


--
-- Name: user_opinions fkqpyynqctpjii0v6207f8h1vd4; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.user_opinions
    ADD CONSTRAINT fkqpyynqctpjii0v6207f8h1vd4 FOREIGN KEY (reservation_id) REFERENCES public.reservations(id);


--
-- Name: games fks363v4jypjeofy9ue5t0v3h69; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT fks363v4jypjeofy9ue5t0v3h69 FOREIGN KEY (game_status_id) REFERENCES public.game_statuses(id);


--
-- PostgreSQL database dump complete
--

