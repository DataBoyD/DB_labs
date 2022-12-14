PGDMP     6                	    z            lab_2    14.5 (Debian 14.5-1.pgdg110+1)    14.4 I    F           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            G           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            H           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            I           1262    16385    lab_2    DATABASE     Y   CREATE DATABASE lab_2 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';
    DROP DATABASE lab_2;
                test_db_user    false            ?            1259    16410    airline_companies    TABLE     m   CREATE TABLE public.airline_companies (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);
 %   DROP TABLE public.airline_companies;
       public         heap    test_db_user    false            J           0    0    TABLE airline_companies    ACL     E   GRANT SELECT,INSERT ON TABLE public.airline_companies TO usual_user;
          public          test_db_user    false    215            ?            1259    16409    airline_companies_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.airline_companies_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.airline_companies_id_seq;
       public          test_db_user    false    215            K           0    0    airline_companies_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.airline_companies_id_seq OWNED BY public.airline_companies.id;
          public          test_db_user    false    214            ?            1259    16470    airline_companies_tour_firms    TABLE     ?   CREATE TABLE public.airline_companies_tour_firms (
    id integer NOT NULL,
    airline_id integer,
    tour_firm_id integer
);
 0   DROP TABLE public.airline_companies_tour_firms;
       public         heap    test_db_user    false            ?            1259    16469 #   airline_companies_tour_firms_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.airline_companies_tour_firms_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.airline_companies_tour_firms_id_seq;
       public          test_db_user    false    223            L           0    0 #   airline_companies_tour_firms_id_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.airline_companies_tour_firms_id_seq OWNED BY public.airline_companies_tour_firms.id;
          public          test_db_user    false    222            ?            1259    16401    clients    TABLE       CREATE TABLE public.clients (
    id integer NOT NULL,
    first_name character varying(255) NOT NULL,
    middle_name character varying(255),
    last_name character varying(255) NOT NULL,
    phone_number character varying(11) NOT NULL,
    age integer NOT NULL
);
    DROP TABLE public.clients;
       public         heap    test_db_user    false            M           0    0    TABLE clients    ACL     ;   GRANT SELECT,INSERT ON TABLE public.clients TO usual_user;
          public          test_db_user    false    213            ?            1259    16400    clients_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.clients_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.clients_id_seq;
       public          test_db_user    false    213            N           0    0    clients_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.clients_id_seq OWNED BY public.clients.id;
          public          test_db_user    false    212            ?            1259    16394 	   countries    TABLE     e   CREATE TABLE public.countries (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);
    DROP TABLE public.countries;
       public         heap    test_db_user    false            ?            1259    16393    countries_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.countries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.countries_id_seq;
       public          test_db_user    false    211            O           0    0    countries_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.countries_id_seq OWNED BY public.countries.id;
          public          test_db_user    false    210            ?            1259    16386    schema_migrations    TABLE     c   CREATE TABLE public.schema_migrations (
    version bigint NOT NULL,
    dirty boolean NOT NULL
);
 %   DROP TABLE public.schema_migrations;
       public         heap    test_db_user    false            ?            1259    16417    statuses    TABLE     d   CREATE TABLE public.statuses (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);
    DROP TABLE public.statuses;
       public         heap    test_db_user    false            ?            1259    16416    statuses_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.statuses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.statuses_id_seq;
       public          test_db_user    false    217            P           0    0    statuses_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.statuses_id_seq OWNED BY public.statuses.id;
          public          test_db_user    false    216            ?            1259    16424 
   tour_firms    TABLE     ?   CREATE TABLE public.tour_firms (
    id integer NOT NULL,
    company_name character varying(255) NOT NULL,
    web_site character varying(255),
    address character varying(255),
    phone_number character varying(11) NOT NULL
);
    DROP TABLE public.tour_firms;
       public         heap    test_db_user    false            ?            1259    16423    tour_firms_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.tour_firms_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.tour_firms_id_seq;
       public          test_db_user    false    219            Q           0    0    tour_firms_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.tour_firms_id_seq OWNED BY public.tour_firms.id;
          public          test_db_user    false    218            ?            1259    16489 
   tournament    TABLE     T   CREATE TABLE public.tournament (
    id integer NOT NULL,
    name text NOT NULL
);
    DROP TABLE public.tournament;
       public         heap    test_db_user    false            ?            1259    16488    tournament_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.tournament_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.tournament_id_seq;
       public          test_db_user    false    225            R           0    0    tournament_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.tournament_id_seq OWNED BY public.tournament.id;
          public          test_db_user    false    224            ?            1259    16433    vouchers    TABLE       CREATE TABLE public.vouchers (
    id integer NOT NULL,
    country_id_in integer,
    country_id_out integer,
    client_id integer,
    firm_id integer,
    price integer NOT NULL,
    status_id integer,
    date_start date,
    date_finish date,
    airline_company_id integer
);
    DROP TABLE public.vouchers;
       public         heap    test_db_user    false            ?            1259    16432    vouchers_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.vouchers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.vouchers_id_seq;
       public          test_db_user    false    221            S           0    0    vouchers_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.vouchers_id_seq OWNED BY public.vouchers.id;
          public          test_db_user    false    220            ?           2604    16413    airline_companies id    DEFAULT     |   ALTER TABLE ONLY public.airline_companies ALTER COLUMN id SET DEFAULT nextval('public.airline_companies_id_seq'::regclass);
 C   ALTER TABLE public.airline_companies ALTER COLUMN id DROP DEFAULT;
       public          test_db_user    false    215    214    215            ?           2604    16473    airline_companies_tour_firms id    DEFAULT     ?   ALTER TABLE ONLY public.airline_companies_tour_firms ALTER COLUMN id SET DEFAULT nextval('public.airline_companies_tour_firms_id_seq'::regclass);
 N   ALTER TABLE public.airline_companies_tour_firms ALTER COLUMN id DROP DEFAULT;
       public          test_db_user    false    222    223    223            ?           2604    16404 
   clients id    DEFAULT     h   ALTER TABLE ONLY public.clients ALTER COLUMN id SET DEFAULT nextval('public.clients_id_seq'::regclass);
 9   ALTER TABLE public.clients ALTER COLUMN id DROP DEFAULT;
       public          test_db_user    false    212    213    213            ?           2604    16397    countries id    DEFAULT     l   ALTER TABLE ONLY public.countries ALTER COLUMN id SET DEFAULT nextval('public.countries_id_seq'::regclass);
 ;   ALTER TABLE public.countries ALTER COLUMN id DROP DEFAULT;
       public          test_db_user    false    211    210    211            ?           2604    16420    statuses id    DEFAULT     j   ALTER TABLE ONLY public.statuses ALTER COLUMN id SET DEFAULT nextval('public.statuses_id_seq'::regclass);
 :   ALTER TABLE public.statuses ALTER COLUMN id DROP DEFAULT;
       public          test_db_user    false    216    217    217            ?           2604    16427    tour_firms id    DEFAULT     n   ALTER TABLE ONLY public.tour_firms ALTER COLUMN id SET DEFAULT nextval('public.tour_firms_id_seq'::regclass);
 <   ALTER TABLE public.tour_firms ALTER COLUMN id DROP DEFAULT;
       public          test_db_user    false    218    219    219            ?           2604    16492    tournament id    DEFAULT     n   ALTER TABLE ONLY public.tournament ALTER COLUMN id SET DEFAULT nextval('public.tournament_id_seq'::regclass);
 <   ALTER TABLE public.tournament ALTER COLUMN id DROP DEFAULT;
       public          test_db_user    false    225    224    225            ?           2604    16436    vouchers id    DEFAULT     j   ALTER TABLE ONLY public.vouchers ALTER COLUMN id SET DEFAULT nextval('public.vouchers_id_seq'::regclass);
 :   ALTER TABLE public.vouchers ALTER COLUMN id DROP DEFAULT;
       public          test_db_user    false    220    221    221            9          0    16410    airline_companies 
   TABLE DATA           5   COPY public.airline_companies (id, name) FROM stdin;
    public          test_db_user    false    215   ?U       A          0    16470    airline_companies_tour_firms 
   TABLE DATA           T   COPY public.airline_companies_tour_firms (id, airline_id, tour_firm_id) FROM stdin;
    public          test_db_user    false    223   7V       7          0    16401    clients 
   TABLE DATA           \   COPY public.clients (id, first_name, middle_name, last_name, phone_number, age) FROM stdin;
    public          test_db_user    false    213   ?V       5          0    16394 	   countries 
   TABLE DATA           -   COPY public.countries (id, name) FROM stdin;
    public          test_db_user    false    211   rW       3          0    16386    schema_migrations 
   TABLE DATA           ;   COPY public.schema_migrations (version, dirty) FROM stdin;
    public          test_db_user    false    209   X       ;          0    16417    statuses 
   TABLE DATA           ,   COPY public.statuses (id, name) FROM stdin;
    public          test_db_user    false    217   =X       =          0    16424 
   tour_firms 
   TABLE DATA           W   COPY public.tour_firms (id, company_name, web_site, address, phone_number) FROM stdin;
    public          test_db_user    false    219   ?X       C          0    16489 
   tournament 
   TABLE DATA           .   COPY public.tournament (id, name) FROM stdin;
    public          test_db_user    false    225    Y       ?          0    16433    vouchers 
   TABLE DATA           ?   COPY public.vouchers (id, country_id_in, country_id_out, client_id, firm_id, price, status_id, date_start, date_finish, airline_company_id) FROM stdin;
    public          test_db_user    false    221   .Y       T           0    0    airline_companies_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.airline_companies_id_seq', 5, true);
          public          test_db_user    false    214            U           0    0 #   airline_companies_tour_firms_id_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.airline_companies_tour_firms_id_seq', 11, true);
          public          test_db_user    false    222            V           0    0    clients_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.clients_id_seq', 36926, true);
          public          test_db_user    false    212            W           0    0    countries_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.countries_id_seq', 10, true);
          public          test_db_user    false    210            X           0    0    statuses_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.statuses_id_seq', 3, true);
          public          test_db_user    false    216            Y           0    0    tour_firms_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.tour_firms_id_seq', 9, true);
          public          test_db_user    false    218            Z           0    0    tournament_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.tournament_id_seq', 4, true);
          public          test_db_user    false    224            [           0    0    vouchers_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.vouchers_id_seq', 5, true);
          public          test_db_user    false    220            ?           2606    16415 (   airline_companies airline_companies_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.airline_companies
    ADD CONSTRAINT airline_companies_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.airline_companies DROP CONSTRAINT airline_companies_pkey;
       public            test_db_user    false    215            ?           2606    16475 >   airline_companies_tour_firms airline_companies_tour_firms_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY public.airline_companies_tour_firms
    ADD CONSTRAINT airline_companies_tour_firms_pkey PRIMARY KEY (id);
 h   ALTER TABLE ONLY public.airline_companies_tour_firms DROP CONSTRAINT airline_companies_tour_firms_pkey;
       public            test_db_user    false    223            ?           2606    16408    clients clients_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.clients
    ADD CONSTRAINT clients_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.clients DROP CONSTRAINT clients_pkey;
       public            test_db_user    false    213            ?           2606    16399    countries countries_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.countries DROP CONSTRAINT countries_pkey;
       public            test_db_user    false    211            ?           2606    16390 (   schema_migrations schema_migrations_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);
 R   ALTER TABLE ONLY public.schema_migrations DROP CONSTRAINT schema_migrations_pkey;
       public            test_db_user    false    209            ?           2606    16422    statuses statuses_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.statuses
    ADD CONSTRAINT statuses_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.statuses DROP CONSTRAINT statuses_pkey;
       public            test_db_user    false    217            ?           2606    16431    tour_firms tour_firms_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.tour_firms
    ADD CONSTRAINT tour_firms_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.tour_firms DROP CONSTRAINT tour_firms_pkey;
       public            test_db_user    false    219            ?           2606    16496    tournament tournament_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.tournament
    ADD CONSTRAINT tournament_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.tournament DROP CONSTRAINT tournament_pkey;
       public            test_db_user    false    225            ?           2606    16438    vouchers vouchers_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.vouchers
    ADD CONSTRAINT vouchers_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.vouchers DROP CONSTRAINT vouchers_pkey;
       public            test_db_user    false    221            ?           2606    16476 I   airline_companies_tour_firms airline_companies_tour_firms_airline_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.airline_companies_tour_firms
    ADD CONSTRAINT airline_companies_tour_firms_airline_id_fkey FOREIGN KEY (airline_id) REFERENCES public.airline_companies(id) ON DELETE CASCADE;
 s   ALTER TABLE ONLY public.airline_companies_tour_firms DROP CONSTRAINT airline_companies_tour_firms_airline_id_fkey;
       public          test_db_user    false    215    223    3221            ?           2606    16481 K   airline_companies_tour_firms airline_companies_tour_firms_tour_firm_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.airline_companies_tour_firms
    ADD CONSTRAINT airline_companies_tour_firms_tour_firm_id_fkey FOREIGN KEY (tour_firm_id) REFERENCES public.tour_firms(id) ON DELETE CASCADE;
 u   ALTER TABLE ONLY public.airline_companies_tour_firms DROP CONSTRAINT airline_companies_tour_firms_tour_firm_id_fkey;
       public          test_db_user    false    223    219    3225            ?           2606    16464 )   vouchers vouchers_airline_company_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.vouchers
    ADD CONSTRAINT vouchers_airline_company_id_fkey FOREIGN KEY (airline_company_id) REFERENCES public.airline_companies(id) ON DELETE CASCADE;
 S   ALTER TABLE ONLY public.vouchers DROP CONSTRAINT vouchers_airline_company_id_fkey;
       public          test_db_user    false    215    3221    221            ?           2606    16449     vouchers vouchers_client_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.vouchers
    ADD CONSTRAINT vouchers_client_id_fkey FOREIGN KEY (client_id) REFERENCES public.clients(id) ON DELETE CASCADE;
 J   ALTER TABLE ONLY public.vouchers DROP CONSTRAINT vouchers_client_id_fkey;
       public          test_db_user    false    213    3219    221            ?           2606    16439 $   vouchers vouchers_country_id_in_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.vouchers
    ADD CONSTRAINT vouchers_country_id_in_fkey FOREIGN KEY (country_id_in) REFERENCES public.countries(id) ON DELETE CASCADE;
 N   ALTER TABLE ONLY public.vouchers DROP CONSTRAINT vouchers_country_id_in_fkey;
       public          test_db_user    false    221    3217    211            ?           2606    16444 %   vouchers vouchers_country_id_out_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.vouchers
    ADD CONSTRAINT vouchers_country_id_out_fkey FOREIGN KEY (country_id_out) REFERENCES public.countries(id) ON DELETE CASCADE;
 O   ALTER TABLE ONLY public.vouchers DROP CONSTRAINT vouchers_country_id_out_fkey;
       public          test_db_user    false    221    3217    211            ?           2606    16454    vouchers vouchers_firm_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.vouchers
    ADD CONSTRAINT vouchers_firm_id_fkey FOREIGN KEY (firm_id) REFERENCES public.tour_firms(id) ON DELETE CASCADE;
 H   ALTER TABLE ONLY public.vouchers DROP CONSTRAINT vouchers_firm_id_fkey;
       public          test_db_user    false    3225    221    219            ?           2606    16459     vouchers vouchers_status_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.vouchers
    ADD CONSTRAINT vouchers_status_id_fkey FOREIGN KEY (status_id) REFERENCES public.statuses(id) ON DELETE CASCADE;
 J   ALTER TABLE ONLY public.vouchers DROP CONSTRAINT vouchers_status_id_fkey;
       public          test_db_user    false    3223    221    217            9   K   x?3?6?2?)-??,?Pp?,???K-?2?t*?,A2??0?b?ņ?.?\?$??L9}J?J<???b???? n??      A   ;   x????@??PL????^??#Qz?L?Ԇ?ޚ?`?W?8???qT???c?Ll	      7   ?   x?=?An?@EמSp??IR????$??.ڪ?.?hWl)B??}?~R??G#???X??c?W]??&?o??yF??`??>㠍v?C,?ښ??K?Nߵ?F?eK0??L?'}????ڲ?C&??%)e???׆Z󬖂oj6?=????"???/??I[?(k1r?????د?F?-??l|R0?9??[G??\ճ?<?Y$?TEH>H?n5w??B???      5   ?   x?=?=
1???S????]<̮???S? ??e\W????9?B?|???L7??????\p%6???Ӟ???Rp׬nW?#???oLƂ?Q???f??m"r?3?ʞ?$?=?aq?8????????Nu՞?Ǚ?d?ND?9?~(Ë?      3      x?3?L?????? ?S      ;   X   x???	?0???StA]?a?=?'Qp?"DEW???ޒ?ڱ?*h?H???5h??"Y???<??<?Ի??zkk????G>??u???c?4      =   K   x?3??0?¾?]l????BF??e???_???㜟[??W	?66161?Zp????B?b?`d????? ~u$      C      x?3??H???W?2?1?a#F??? ?
      ?   c   x?M???0???K8?&MXA??C???=?b???I?dtUT??lv???#?????a????HY?Y՚{?։????A??;?L?&"[?     