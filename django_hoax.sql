PGDMP     .    (                v            django_hoax    10.3    10.3 u    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            �           1262    16399    django_hoax    DATABASE     �   CREATE DATABASE django_hoax WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';
    DROP DATABASE django_hoax;
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3                        3079    12924    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            �           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1259    16431 
   auth_group    TABLE     e   CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);
    DROP TABLE public.auth_group;
       public         postgres    false    3            �            1259    16429    auth_group_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.auth_group_id_seq;
       public       postgres    false    203    3            �           0    0    auth_group_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;
            public       postgres    false    202            �            1259    16441    auth_group_permissions    TABLE     �   CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);
 *   DROP TABLE public.auth_group_permissions;
       public         postgres    false    3            �            1259    16439    auth_group_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.auth_group_permissions_id_seq;
       public       postgres    false    205    3            �           0    0    auth_group_permissions_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;
            public       postgres    false    204            �            1259    16423    auth_permission    TABLE     �   CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);
 #   DROP TABLE public.auth_permission;
       public         postgres    false    3            �            1259    16421    auth_permission_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.auth_permission_id_seq;
       public       postgres    false    201    3            �           0    0    auth_permission_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;
            public       postgres    false    200            �            1259    16449 	   auth_user    TABLE     �  CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);
    DROP TABLE public.auth_user;
       public         postgres    false    3            �            1259    16459    auth_user_groups    TABLE        CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);
 $   DROP TABLE public.auth_user_groups;
       public         postgres    false    3            �            1259    16457    auth_user_groups_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.auth_user_groups_id_seq;
       public       postgres    false    209    3            �           0    0    auth_user_groups_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;
            public       postgres    false    208            �            1259    16447    auth_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.auth_user_id_seq;
       public       postgres    false    207    3            �           0    0    auth_user_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;
            public       postgres    false    206            �            1259    16467    auth_user_user_permissions    TABLE     �   CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);
 .   DROP TABLE public.auth_user_user_permissions;
       public         postgres    false    3            �            1259    16465 !   auth_user_user_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.auth_user_user_permissions_id_seq;
       public       postgres    false    211    3            �           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;
            public       postgres    false    210            �            1259    16527    django_admin_log    TABLE     �  CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);
 $   DROP TABLE public.django_admin_log;
       public         postgres    false    3            �            1259    16525    django_admin_log_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.django_admin_log_id_seq;
       public       postgres    false    213    3            �           0    0    django_admin_log_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;
            public       postgres    false    212            �            1259    16413    django_content_type    TABLE     �   CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);
 '   DROP TABLE public.django_content_type;
       public         postgres    false    3            �            1259    16411    django_content_type_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.django_content_type_id_seq;
       public       postgres    false    199    3            �           0    0    django_content_type_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;
            public       postgres    false    198            �            1259    16402    django_migrations    TABLE     �   CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);
 %   DROP TABLE public.django_migrations;
       public         postgres    false    3            �            1259    16400    django_migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.django_migrations_id_seq;
       public       postgres    false    3    197            �           0    0    django_migrations_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;
            public       postgres    false    196            �            1259    16582    django_session    TABLE     �   CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);
 "   DROP TABLE public.django_session;
       public         postgres    false    3            �            1259    16562    hoax_corpus    TABLE     �   CREATE TABLE public.hoax_corpus (
    id integer NOT NULL,
    title text NOT NULL,
    corpus text NOT NULL,
    label text NOT NULL,
    created_at timestamp with time zone NOT NULL
);
    DROP TABLE public.hoax_corpus;
       public         postgres    false    3            �            1259    16560    hoax_corpus_id_seq    SEQUENCE     �   CREATE SEQUENCE public.hoax_corpus_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.hoax_corpus_id_seq;
       public       postgres    false    3    215            �           0    0    hoax_corpus_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.hoax_corpus_id_seq OWNED BY public.hoax_corpus.id;
            public       postgres    false    214            �            1259    16573    hoax_result    TABLE     �   CREATE TABLE public.hoax_result (
    id integer NOT NULL,
    label text NOT NULL,
    process text NOT NULL,
    method text NOT NULL,
    result_img text NOT NULL,
    result_txt text NOT NULL
);
    DROP TABLE public.hoax_result;
       public         postgres    false    3            �            1259    16571    hoax_result_id_seq    SEQUENCE     �   CREATE SEQUENCE public.hoax_result_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.hoax_result_id_seq;
       public       postgres    false    3    217            �           0    0    hoax_result_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.hoax_result_id_seq OWNED BY public.hoax_result.id;
            public       postgres    false    216            �
           2604    16434    auth_group id    DEFAULT     n   ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);
 <   ALTER TABLE public.auth_group ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    203    202    203            �
           2604    16444    auth_group_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);
 H   ALTER TABLE public.auth_group_permissions ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    204    205    205            �
           2604    16426    auth_permission id    DEFAULT     x   ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);
 A   ALTER TABLE public.auth_permission ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    201    200    201            �
           2604    16452    auth_user id    DEFAULT     l   ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);
 ;   ALTER TABLE public.auth_user ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    206    207    207            �
           2604    16462    auth_user_groups id    DEFAULT     z   ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);
 B   ALTER TABLE public.auth_user_groups ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    209    208    209            �
           2604    16470    auth_user_user_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);
 L   ALTER TABLE public.auth_user_user_permissions ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    211    210    211            �
           2604    16530    django_admin_log id    DEFAULT     z   ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);
 B   ALTER TABLE public.django_admin_log ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    213    212    213            �
           2604    16416    django_content_type id    DEFAULT     �   ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);
 E   ALTER TABLE public.django_content_type ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    198    199    199            �
           2604    16405    django_migrations id    DEFAULT     |   ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);
 C   ALTER TABLE public.django_migrations ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    196    197    197            �
           2604    16565    hoax_corpus id    DEFAULT     p   ALTER TABLE ONLY public.hoax_corpus ALTER COLUMN id SET DEFAULT nextval('public.hoax_corpus_id_seq'::regclass);
 =   ALTER TABLE public.hoax_corpus ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    215    214    215            �
           2604    16576    hoax_result id    DEFAULT     p   ALTER TABLE ONLY public.hoax_result ALTER COLUMN id SET DEFAULT nextval('public.hoax_result_id_seq'::regclass);
 =   ALTER TABLE public.hoax_result ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    217    216    217            |          0    16431 
   auth_group 
   TABLE DATA               .   COPY public.auth_group (id, name) FROM stdin;
    public       postgres    false    203   �       ~          0    16441    auth_group_permissions 
   TABLE DATA               M   COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
    public       postgres    false    205   %�       z          0    16423    auth_permission 
   TABLE DATA               N   COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
    public       postgres    false    201   B�       �          0    16449 	   auth_user 
   TABLE DATA               �   COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
    public       postgres    false    207   c�       �          0    16459    auth_user_groups 
   TABLE DATA               A   COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
    public       postgres    false    209   �       �          0    16467    auth_user_user_permissions 
   TABLE DATA               P   COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
    public       postgres    false    211   ;�       �          0    16527    django_admin_log 
   TABLE DATA               �   COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
    public       postgres    false    213   X�       x          0    16413    django_content_type 
   TABLE DATA               C   COPY public.django_content_type (id, app_label, model) FROM stdin;
    public       postgres    false    199   u�       v          0    16402    django_migrations 
   TABLE DATA               C   COPY public.django_migrations (id, app, name, applied) FROM stdin;
    public       postgres    false    197   �       �          0    16582    django_session 
   TABLE DATA               P   COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
    public       postgres    false    218   ��       �          0    16562    hoax_corpus 
   TABLE DATA               K   COPY public.hoax_corpus (id, title, corpus, label, created_at) FROM stdin;
    public       postgres    false    215   ��       �          0    16573    hoax_result 
   TABLE DATA               Y   COPY public.hoax_result (id, label, process, method, result_img, result_txt) FROM stdin;
    public       postgres    false    217   �      �           0    0    auth_group_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);
            public       postgres    false    202            �           0    0    auth_group_permissions_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);
            public       postgres    false    204            �           0    0    auth_permission_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.auth_permission_id_seq', 24, true);
            public       postgres    false    200            �           0    0    auth_user_groups_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);
            public       postgres    false    208            �           0    0    auth_user_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);
            public       postgres    false    206            �           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);
            public       postgres    false    210            �           0    0    django_admin_log_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);
            public       postgres    false    212            �           0    0    django_content_type_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.django_content_type_id_seq', 8, true);
            public       postgres    false    198            �           0    0    django_migrations_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.django_migrations_id_seq', 16, true);
            public       postgres    false    196            �           0    0    hoax_corpus_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.hoax_corpus_id_seq', 135, true);
            public       postgres    false    214            �           0    0    hoax_result_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.hoax_result_id_seq', 77, true);
            public       postgres    false    216            �
           2606    16438    auth_group auth_group_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);
 H   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_name_key;
       public         postgres    false    203            �
           2606    16493 R   auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);
 |   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
       public         postgres    false    205    205            �
           2606    16446 2   auth_group_permissions auth_group_permissions_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
       public         postgres    false    205            �
           2606    16436    auth_group auth_group_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_pkey;
       public         postgres    false    203            �
           2606    16479 F   auth_permission auth_permission_content_type_id_codename_01ab375a_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);
 p   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq;
       public         postgres    false    201    201            �
           2606    16428 $   auth_permission auth_permission_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_pkey;
       public         postgres    false    201            �
           2606    16464 &   auth_user_groups auth_user_groups_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_pkey;
       public         postgres    false    209            �
           2606    16508 @   auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);
 j   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq;
       public         postgres    false    209    209            �
           2606    16454    auth_user auth_user_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_pkey;
       public         postgres    false    207            �
           2606    16472 :   auth_user_user_permissions auth_user_user_permissions_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_pkey;
       public         postgres    false    211            �
           2606    16522 Y   auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq;
       public         postgres    false    211    211            �
           2606    16550     auth_user auth_user_username_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);
 J   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_username_key;
       public         postgres    false    207            �
           2606    16536 &   django_admin_log django_admin_log_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
       public         postgres    false    213            �
           2606    16420 E   django_content_type django_content_type_app_label_model_76bd3d3b_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);
 o   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq;
       public         postgres    false    199    199            �
           2606    16418 ,   django_content_type django_content_type_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_pkey;
       public         postgres    false    199            �
           2606    16410 (   django_migrations django_migrations_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.django_migrations DROP CONSTRAINT django_migrations_pkey;
       public         postgres    false    197            �
           2606    16589 "   django_session django_session_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);
 L   ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
       public         postgres    false    218            �
           2606    16570    hoax_corpus hoax_corpus_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.hoax_corpus
    ADD CONSTRAINT hoax_corpus_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.hoax_corpus DROP CONSTRAINT hoax_corpus_pkey;
       public         postgres    false    215            �
           2606    16581    hoax_result hoax_result_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.hoax_result
    ADD CONSTRAINT hoax_result_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.hoax_result DROP CONSTRAINT hoax_result_pkey;
       public         postgres    false    217            �
           1259    16481    auth_group_name_a6ea08ec_like    INDEX     h   CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);
 1   DROP INDEX public.auth_group_name_a6ea08ec_like;
       public         postgres    false    203            �
           1259    16494 (   auth_group_permissions_group_id_b120cbf9    INDEX     o   CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);
 <   DROP INDEX public.auth_group_permissions_group_id_b120cbf9;
       public         postgres    false    205            �
           1259    16495 -   auth_group_permissions_permission_id_84c5c92e    INDEX     y   CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);
 A   DROP INDEX public.auth_group_permissions_permission_id_84c5c92e;
       public         postgres    false    205            �
           1259    16480 (   auth_permission_content_type_id_2f476e4b    INDEX     o   CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);
 <   DROP INDEX public.auth_permission_content_type_id_2f476e4b;
       public         postgres    false    201            �
           1259    16510 "   auth_user_groups_group_id_97559544    INDEX     c   CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);
 6   DROP INDEX public.auth_user_groups_group_id_97559544;
       public         postgres    false    209            �
           1259    16509 !   auth_user_groups_user_id_6a12ed8b    INDEX     a   CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);
 5   DROP INDEX public.auth_user_groups_user_id_6a12ed8b;
       public         postgres    false    209            �
           1259    16524 1   auth_user_user_permissions_permission_id_1fbb5f2c    INDEX     �   CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);
 E   DROP INDEX public.auth_user_user_permissions_permission_id_1fbb5f2c;
       public         postgres    false    211            �
           1259    16523 +   auth_user_user_permissions_user_id_a95ead1b    INDEX     u   CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);
 ?   DROP INDEX public.auth_user_user_permissions_user_id_a95ead1b;
       public         postgres    false    211            �
           1259    16551     auth_user_username_6821ab7c_like    INDEX     n   CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);
 4   DROP INDEX public.auth_user_username_6821ab7c_like;
       public         postgres    false    207            �
           1259    16547 )   django_admin_log_content_type_id_c4bce8eb    INDEX     q   CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);
 =   DROP INDEX public.django_admin_log_content_type_id_c4bce8eb;
       public         postgres    false    213            �
           1259    16548 !   django_admin_log_user_id_c564eba6    INDEX     a   CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);
 5   DROP INDEX public.django_admin_log_user_id_c564eba6;
       public         postgres    false    213            �
           1259    16591 #   django_session_expire_date_a5c62663    INDEX     e   CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);
 7   DROP INDEX public.django_session_expire_date_a5c62663;
       public         postgres    false    218            �
           1259    16590 (   django_session_session_key_c0390e0f_like    INDEX     ~   CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);
 <   DROP INDEX public.django_session_session_key_c0390e0f_like;
       public         postgres    false    218            �
           2606    16487 O   auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
       public       postgres    false    2762    201    205            �
           2606    16482 P   auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
       public       postgres    false    205    2767    203            �
           2606    16473 E   auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co;
       public       postgres    false    201    2757    199            �
           2606    16502 D   auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 n   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id;
       public       postgres    false    203    209    2767            �
           2606    16497 B   auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id;
       public       postgres    false    209    207    2775            �
           2606    16516 S   auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm;
       public       postgres    false    211    201    2762            �
           2606    16511 V   auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id;
       public       postgres    false    211    207    2775            �
           2606    16537 G   django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
       public       postgres    false    199    2757    213            �
           2606    16555 5   django_admin_log django_admin_log_user_id_c564eba6_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 _   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_user_id_c564eba6_fk;
       public       postgres    false    213    207    2775            |      x������ � �      ~      x������ � �      z     x�U�M��0F��)8��	�]�5*�P��J���Pǘ/�|���ٚ�~.�a(�KX�h�9�O
������_@�'S23��o��|2�Z����ǖ�F�b�A�2b�U˴�����6%��̑:T!%6��CP�
ڛZW�^1���T��
d-�3R�;�g��.u�1,�jjv�l�ڳ/FAj���xiT�GLÆϓl����t8^ ���;���Zl�՛V�K�
�[~��G	��O3��@�w�I���;^B��q+V���Dyb�/"�{�.:      �   �   x�U�M�0 @�ۯ��M�}��A!�J�%��5�nE��~}v�����a��͍��V��9}q����r����9$�;;����4u��rm{�����"m�b�W2ʳI�K@�=x�.P����Q2E��]�lZa�i�  ��B~}�si�^���ȧ8	�d~��!� .]5F      �      x������ � �      �      x������ � �      �      x������ � �      x   i   x�M�K
�@��#�h�a��Ftz���G��^=��i����hí����S�l��*3����*�Ͳ��U��� �ӑ,~h�W����Oۮ�W��S.�      v   �  x����n� ����j� γTBh�R$۸����H���U����g��_�$������B�v�K�L#T=���������0��<��l�����8ʡT@g��-�%
���Y���/���C;���y��8���d��o-���}A�����P�3&���g�͔lЫ�������ټ��.���.%p�5>�(�S[�;7)@2#��������k���C#�LL%q�ۦ�{�r1(i��پm.�pk�D�oP5H�m����j&7��C,��m>���h.v�/.@�v�9�j7�C�=�r@Z%h��-��P��pY)޽z�~�T)��]�u�����������ø�u�z[s�v�&}1��Ls�R�mF_������$�      �     x�=�Ao�0 F��+v_4����.
�["���]h+R(J��������^�=Y��}5}�P���K%o�se��\�rB`��tc0�̎c΂9�C����ۣC�f�i cz�W:�Ɛ�["�U�'W�ϜGe�:����9m��Jŉ���#�����:�u�h�}ߒ��$c�P��[�ߓ�KL��*��F���F�z����aUIx��t1KjB�)~�_�����1=�����`Ȟ�� ���wi�.�c���w
�o`�p�.���yK�sfY��ih6      �      x���r�X�.8V?Ŷe)�B��ݓ<��eY2�(g��8P�I �V)��=���VO����� Ee]��ttt��,Y"�}Y{�u��v�7#w/Vu�.�U��f���%e�+7J�4�嗸��Ŏ|Q��S��2]L���͓�C<I�2���RF��dH|�L��|S��U*��c"s�tg�L�V��5��ֆ���0�LF�S�h�E�V��Wq�*��t�v���L�R��^��J� U/cW���U��<�\�U��<�w�d�,�>*��岖*^�د8�eN`�LR��as��x�壤(1�0�Əq�n���E��Ls�+��� /�	�a2���9`/2Xƭ�y:��m�:r���]��x�����ƫE�F�R&�W�z��ݣ����8I8�}��q�,��b�J�<�3��OޫW��)�
���C�b7K���ә���C-gR�.]�6���	\k�q�#�&��$���lP�l����2�yW����jE���E��~�w��=������^�m�(:������k����\�F �(7Hҋ��e[% �n&KHw.��E*��-����+�\���"Ofa;���E�2.��/S^'����� �b*�\�V�`U�
���ʎ\'��i+9�ն�/�I�ݧZ$�?�S��l���L`�fOS�ȡ��b�<"w.X�Ɂ���g˔�x^o�迺������������"��]���r%��; ߃̷���2m>�={�i��)	/^q_��OnY=��^�3�Ȝ�#�NG�+3����*��O�i�6��%CE�.^��.W��RP R� 򷩠�@kP<�U��	I2yt�4��'���z��簴��7�������O���z�}p�˫���i�v$}�#�$��YT�����%R�Y�5.r.�U.
/u5�룈�I�L (7o�q�����GG���1��)�� �\�o�Tv}9d��G
rt-�\�;CY�tS[�>��X�T��ˊy��[R��ȏ-;�R�]�{&�Y�;��;ha& �t��H�� JWo��XВ< �*c#�PR!�D��P/��V"7�۵��X.N)G�9�Kn��;ǟ�d򊳜�9& u��9�qk9��`���z9M�R�M� 5�O�~�p,�����
!�L]�R9Ѯb��^�f%nA�6��ƑF����ޑ�.�SK�"-;t�c�)^�Xi�asc��<@#K�5�����,ϥ�W6fv��G?֊H��^B٣nt|tt|�#Ξ�|,�	k��n(��r�jU&s �U��r�f���bV,#عP,c�q6K�F� �av���F��`���*�`t<_	�d���a��$Ɔ+lR�i=���}z-b�@8u��w[��ɟB��x����`�8��7PPj�a�W&�m�m�1�`ZW 4�-�{m��B�\0Hv�f��q�^P��f���	��7<�r���k��\�X
��T�X_D�<j�cƋ*"�Js������L�0a�_yĸ���X;II}W�]*O�����TN�vZr�p��ґm��K�ลL�e�1��eJ��gz������B$<[��3�!��Γ<���:G/2�^�V�`⌂c�Yݷ_�÷�^trz�?:�5�ww��9ɧ���rgr�p�\0�}��upy1�|wE�'+�u^�w^�+��{��h>�wP\郵<�J��ݒ�7Y"�����f3�=�j��:�Hq�чk��m�A�;n�]��z����']�I���A��g�ek�nm,w�.�_�u�d$߲�ֲ���2h�7TOnm0���T��p��HN�#-qי#�����:z��~'U*��	#O/���ݕ�>	�Ɏ^C��g�%����5E�w��¦IV��u�>��%Ӟ��5�)�HY�0�_��x�S��/U6��Y�wK�����2�Se�gQ�Z��H��<r�W� lfת`PW��ƻ%E !?��Z���zR�T�Tli�oD��dWi�������g��1���to�mW�����48ȑ����ȆdQ�3�֭�A�SNg�
5���<��������4�����C�Rm�O�p�jEJgb��8� �
l\y�4>9�	��X0w��C�\��vU���G"0��xn�Ӫ�������@*j�	u�,��zuU��t���L�?X�,���@�rU���<ǠJ *�	I�:Zb �%#�Zɱ?@�_L;n���y�ƍ:f�� *���*���g��\��,�A��OX����W��'��������YK��rqy�gXK�!ؼ
�|��]�|���8�����uV/	g�ꕻ���1ɨd�����.��Ǎ�!6y�g�v���W�?"5/e�yX�bZ,�z.o�S"�ߝ�����)>6xG���}���yU%Q�;��X5��nQN)��KaQ��uP}�8�C�ී䣷ݳ��;:<9#I��|�z���J��#F|�n)_���,{� �Dsa'���H/�xfV��~�`�u>W
�07nE��މP��DB3k@���{+�B�DF�s�3,9�"o'�s�h�W\<X�
��9w-K�жD�I�%Q�`�@��R�Ty���pZ��,�ϲ�*!Y��Fe;��5��K�5�㒋dIkq2�?�żV���Rȉ5�Bx_v���iΕ����)Ky�}½�).���(��" �q���i�����ߟ]�d�I��w�0<��������1�6V�:DgH�c�<hN�5q����~�\�i�����@<�l��C{;�����-��'�"_�"�}Od~(�+5 ��92J���T�[�����S@� ���_��"C�ɛN���ƃZ��jb�l���6PV�#_	Iyc�Ho��ۙ �j7����?&�&�p�e�f�C�>&3=IS���!��H��rN�2�)c�>����M,�S~I�Q2��%T;
@3�)�)r�k(XՓ��,S@�����Ԏ;��F��S�# Ym"仄��<Vs�L{��k?�
Ǖ밮⽚�^�L�zt9B�#n_�}|ɿ���u0�
b
���L�ԎE���W�(F���'���]���G>N� Y� ��X�M!&7ũ�#7�����v���O�S R���K$����d��?���+��RD�B�@(.dyr��D�Rv�)������3�~R���C�e�㧮M+�ft��4���j>� H�kPL<�*�u<E�G@0�
���r߉����D�Ye�Ijf7�p`'���%�FheF�L3�cаa�˫"�G�I���1���Nӊ�2�Hs����j��K��I���XbU@�"�!$ z��u�uc}�	����}� �
��zHGny`�`0L��H=i��0�a����&�(~+a���A8�i&4�,�Uy��u\]T�P�W� B�/��^@����|��㢎��{-�<��	 *�\�KŔ�C�.b]��P��r�)��l���*a����S.,��Kd4�r*ģ�ǔW���TQ���:��t)����ӣ���&}�m�W�=����hz]�I�����s!;f�]���=�0�	�˥��+A�L�J�\p�J�tL�
EUn����ǥ��p�ʦ\)wJQ��BT����
BOf�Sy�����0в%�4퉈�Uɧ�s��c�󔒐'�u��☪�)F�.�K\����(r�/�y��>L�������=)4�~��.'@8�(M��� !GR�]'Y&0i��	U��ޕF�U4�e�wI��S-I�Map"d�����GѫW#�?W����H�Em�&�!ۅ�lC�#�C�³�=��t�D���{��ߍz''g�P�v��"�܋�%�
��VE���]�<�(v "]�\�EE��z�{TÙb�7mS�~�>�D;�9��s��<�>��`�|"Zץ�<�:a�|/�#��� �t������V.v�D�y�W��⾸���F�L+$���Z2msujS�Hs�I�o	ڋboHj���q_���D������8�u#�`N�쥋̊k��a��!j�<^W���9D��s�a�{������    ��T( d�}�l[������׾���-�S��G9�q������@|lJ�o�=��As����}^��-�@�R<���I���F��N�X�����HB��*x}B��eU÷��M(�%�L����A�u�멈�F���@dg'��N)g2w���^�x���2��uR�&���������$�	(�� ��?�#�siClRMٽ�\L�E�#��+��C(�r���+�y�o��� F�$�����߮����;���p��3�Ey�{�z]wS��I@�?n��@�	��j�����Ya��؀�(b����d��F��� g����2~�^b��X]�.�����-|2����A���%�k�v���Txϝ�s��������p�Z
�z��ܢ��P�����UotW�G!�t½ "a='[��`�`�R�_ {�\&�< ��[��;k���lӷ�3���.C\#&`s(8��s�������msN��eP���cfqR�O�P����Y��?�>�.�z�G��0��&�뱜���*��k{-D�#m����������atttvv�'-;��`�@S�Z�/3�W �4������}%�Dʊv�)T_$���3���� ���)�.9�����!�Ǆγ�y������3�:9���cLi���jÉ�6%gU���UahX"8����g9+D�H��e�9]�7����ذ:>��f����}&.�x �"��{�cy�tl�9Iu���_mY����
2�*t*x�q(�$������ɞ�p�Y1.T�48����e;���᯴�[
�@z]dB��|PJU���`aۆ���|�"�.��	!vdK0����a��4?��v����u$Me���S���ڒ��J
B�f�P���V�ޢT<�Z�;��w���{�3}w���>Ks�70]�2z_��*W?�
�b�.�̄ȁ����*�	�_�D+�N�ӳށ�=�;�s�;��X�f������$k�M\c/f;�?�S��S�c\o���W�go�0y�*a8�1N6����������ܢ�U�U����Rm<S�q�����Ԃ7�|XǴ���<͂�p��ig0�쯧]^�1���ՙ����!n*r��!\��[�)/��*�	~�Fw�E
7��R� as
�(��9Iͪ�r� �S�q��4��B-��Ԁ-�]��V<n��!�s�: ��`�g]Wj+'%4�)�g��n��}��T��!��;8�i�OA����j��bT�j剘�D0��?����ù�
�gL����o��oE������$s��R�����}�Ƣχ7�"Y
�y����Q�n���nS��k
+/h�)�5����46�]�e7���v��ە�Q��B��A�x��]Y���q|͗�Hd�C�P<�����O-;�4�ou��1��.�8TA�vc��v{.8���qm�np�S�3��We2 ��,��ҩ:��� `q��dч(d՞��;�e��Е�w�n�k˿�A�O�C���U��
��������<u�\<�0/��W�<�!a.�u���t�eO:!�u��&/�3��T�x��ύS�H"wG�'{U���1]fV՗0��8��zG�������%����#XV�2�м$+W�����7i=y�����ؤK�A�5C����KQ&�T�7���Ӄ����������ݞ��>�U����<��~U�i��=K�b���t� 6f�Q%K�ǒLԈU	���y�C� 21����r��3��AE)J�߫�pY������:~l��z�PgY�ӳpSݓ��T�2-`����k	-Xĭ8$L|����]N5�����E���X�$���{N7��l0/u4Nh����S�_�b�1����E�l �|����ݗ�T��g�h���Чq�r�C�½oݱ^ `��c3_c|����I�@�،kMp۪^�6C<�#"aU2f|c����KUM��%j��Q���k�)��h^zޱa�kǡ~���ȶ��������wF����!���ƒE6̊�����X�D�*U���m�w]/���c|�ጲ'���翤^QC?�A�8b(��ś�9�H�����h4��zB�Z˺{Jk|�sL�����L���b�N.j��
�W ض�@�3�l�A�SB岲z\�Oc�[����� l �:�ߜ_�vH!g��C� ���|��&C�<7[��/�9�I��ͥ�V ���fMp3��.�s�`�e����y분O���B��%L��m~�A��|'*Ol����<D2.zM׷y�B����n&R��{�>X�Tϗ̢sޢQ�J ,@���	�n��,)ݼ�Kg}i��ڣ`AM�D�O��q�|n�-�5�\>�-2���BB ����!�F"�Z�<��h�A�F{�~d�)�!�3�
aK�����^	e��nj!����![�2�z�Se�z��Bvc j~����t2x�xx���u�߹.:����%!xq �!����	m��/`iș�B< �~���i�z��K�Ҥ�Q��\� ���t��m%�Y��2���3��E�'�"w�������׏�69H8�o=wC}ஊ��=o�LC�$�s*��P� �Ѥ�3MQ����}ĲOE�<�vώ���[��2 m��C�t�3,1AH���9�z"(�%Ǝ[;G�ei��h+����$E�\��H��Tnu�4��K�5�~YS���[t�2ܸ[�P��D"d��(��*ա�L���������vT;~��Gǽ��!s���xV�X{�Q�)��t����;PӺ���/���E��-��Zãv����m�&�i�L(5%��SAx�F�l/��32(�v����T�T�BF|w�m����L�h��(�'��v��3�L����HƆ !L�#�X	�o�Lu�4�V�x"��^�Lg\��gbϖ֌Tm�Բ���xZa������E��&L^@�~O.�i�䄨p�s�4Ö�=~��پ���/�������@3J|r~-} ���l0oF!I	���9/� � u�$
�h�9j��!K\�b���t�y��KHM��	�����a�>*d�9z(��Ԟ���~35�O�DoM6��!�
Ј�Z�k@_�RԩK��ö�������洚[<X,!Eu��{��,�:+A���G��?���}Yy]4�|ݾ�H�`��4֩@��l6�]p8\S�3FH��QٟK(2s�v��W�l|��r�	f�l�I-�R���[OO�P����8`�s$Zj��I)EQ������7�N���K����8����I�4:�*�������_n^����HX�YO/�Q06��ݻ�_�ve�[j<�1T�;��kV���F���x��F�N���U�Թ��Hr!zrϼ���0X.ーD�^�q{掮���U��{!�iB�C,�\�N\%�<�(�p�����8$�13�gT쭻����[�C����|�՗��3����s+�/La|k�*T~M�w���T1F���d_A�5���~2���-���o�!�U1!_�$�c��WC�E(7#�F����g9p�_~�;���i�a��Fڗ|���7�'	�w�#����Ɗ�M�=ˀp�[�{!2�5��J}/U���/,s`_��@��o��(�":������]X(�*&�X	���18=���j��+�ܐ/�˹�9�^sE�_	G�,W!����%,.k���t5_�8�R�Q�:�gE�j�Ь�2��=������l������V'�Ӭ�j-4wr�����"�=�����HEb�U�����d�e�j�#ͫ�Y�B53���4��"֧sP�ʹ�_�,
��v������_�Z�5��1~��y}�� Y�̌Ls��wf���UtQM�+�	k���%���$�8�7�Y��<�
�	�	t!�zM�Rlؤ �����0���%�
&HD��M��,\�+���Pi�s:nx�-_�լ���u��x]���P�,i���'��k�4I��3Eb��$j�dĕE\%�&�]O�"/��K_�!    V@D�{�ϼ(z�@9��r���(wr���;��	��Hl�4�kSIM��I�km�}��7r6��%f��׊4�{��v%�!F����`�~���b�yQ%������5D1����l����5z���N�FT��s*�ʩG}"�c���Ss����6�"j�H����f���ͥ;����|�0p�?� ��Ӑ���^�~�j1L$�i��,�����p�M>��?�o�N�����*��R�jT���#���I�#��`Ҫ���K�<�,#ճ��l��Q���l��������?�q�Q��䤯��$�~�.q���r'ݧd\��,������-s�8�7T�1�:���2ʚ���!n�D�n�=4#�NѲ
��EM�� :�a~]M�����%q�*�n��{>�~n�Ԑ���:w�n�=t�]�G��ᔹx�:I��d��0FB_�3�-
!�7р4,�S�m���;����"�\�}�;k�8��*{B��e�����oV?�}%�{���|l�����z�S]
�׏;�?S�����}���Zm��}� iu�"*�K����`�	#�ZH���oo���]i4�5�5��|�A+(�w�<;�P��S��1���2��Q���[���ԯ9�,~���g?Gݰ&�m3��L��M�e��(�N^'��:6����� |@�;��L�:̔|
���ha���W���A�����ϣ�P3��淂��jS�\���;���"#b9-�$�V�����s�\k�@����y�j&m�鸪�9��\��c��Qx�W;h��1�r�H�5���ӔF2͜[��8�rt:�g�2@>��u%|^���=�q-����yV�(��ZOV5��A{'��	!�@��&����f�	[#����V��`����8���%D�vl�Z����X�zOYƅH���˛����d,�~go��Q�wrt�~�S+j���s+!ワ�%�m�#����E5v����a�O��y�ݻ��=w^#�삮�j�T��d�4�Y��4�"�K�uH�L���й^b����e��Xa3����jR.4$�R�"&�-�;�N�P�����9�� �h�}��~F�7V���VY�_Q�ų�l�u^C�.̑�[gС�҉V�)r*�ʩĨQAn�så��8�����L+JQ5��a6���c���U�ܹ�bKY�2��-h�����6e����@��_7e-�}%`R_fD#9~�Z̄݊� n��k�C�L�=V;.���jF	�N����<�b	͔$MB�䟒[n�׼���J������d\���2#�5/��yjuam��Z�4)��+|ҘO�K"��ٸ
� j�� ��z���L{{�rS�F�9�rə�����ȣ��Q�-z��x	�^��y̍�����1IJ��!nE����FǧB:�et�}�Ž,/ ����T~���m�Ao��#��QJ�XF	U�;
�E��q��d@(�[YNV��2������P�h=��L8;:#��QSK�1$�/���*2o��2��4����)�Zr�����-ҦŽ4�CWD�Y�n���n@�U�R3e��חOq�� �J����5�~R���*jhq�*��%^я��!��I�ۼ!$T0�1ҵ���Ͷz�<v�g�e)*ԾT3k?�V4�Y��o������[7�ݦ�����=l��z�xh8�I]���Pr�׎+W?�����~�vQ�[Ӿ;�Wu<j>��"�	�'R���P̠�j�U���E������C�͂Ip��b�K%���3�e <LG
8�+�펯 w�-+� �y�	-J���U�� �R0?�k�T�#(�e��q�P˯�
��؞�b��!)�C}a�B��%#?s�(bB.I�ȫ)�V�3rՎt��Y�,WǛIPU�)d>��w�|#pǾ��	�� ��C�kEV�Fk���20z��]O��%,"��@h��8��Oi�w�Ь�oM9DT�S�Z��C�m3���bV'���<ݺ�U��]���kj�[�%��[X�k���Z�4�Q��>ن�U�mɈ�%2�����>F���N�R�����	T&o�P�jȫ
���F��k$���Ϛ�R~!��*�#��o���,���� Sr��N'"5O�VO_'����\�	��IT�׉��U\��Y`�p�@�b���c
UL���C��1U�3�K3FL��υ��VZ(����l���<X& &5`V1����LBL�^�:���g3�i����s�����2GY�d�
cQ+	�(�MCZ�Bz��uH�V$:)g�������	�����1G@�O���*c�v˰Mb�U�
8���[<�<.�xbOQ@%��Uݞ�R�$��[���$��^tz�?�J·ݝ;��m��:��r�w���($��{7�{��s��7�v�����3�����/hm=�2�>���ο^ߠ.�0�ic�BZJm�� ���X��aY|w���N��'!M(���b{l׫Pڛ��XZf�7�5�{����I��MeM��,�4W]Ne`уR���S��tRL
������ϫh\%H�^��Ԛdy{i%�X�:Q?N	)ڲ�l�=#�(�i�2��$�B��/l�᝜��؆w7����������C�y^j�hA��!%�2h[�q����{�*X�~��(	��*��,&u��S�&�S��\�O�%���4:��{t�Z\x�){ �$s�=���f�HB_�O�Y�f��$��L�kf�&��:��I�o�bx�4a���R[r6%�b�u��	?^�F(��|�g��fj<q��k�C�}z�k�R��^�����mup&-�q��}*S*�ky0+�1m�s��{ss%�����5���1k�Qۻb�W<J�@��]����7̷�<.�����A���}� -@�UflP7a���a<G�#�@ݰf[�����N�z�Zi밿3@~��/r�Eh�鄩�U�q�����U�t�ƨ
�����Gz7GIV&H��(�t�����,���JR|룛x6�a�u_��ƻ�q�>n��]K����ꖘ��N#l#G3���WM�b=�[�{���ݰ��Z-6����Օд�ђK��� ��F��7{�/�2� �`�{�� �̌`FX�*%:f�x^,
7X0��
����=�F�M��)�p�y���jQ<>?���*L�~EH��_5Dh��G ��M�ZF�Ӗ�ŏ�:M��2NkW�q|?_��
TpI��D|#�����b����:�#��|��T6���#Ů-FF8��x��j=b�>����$����]*z��Ʈ�V0tL�+�m�f��P0��	+��4�p�����ES\�Sy��l�D�@ܷ�p����Dg��g'�rvΡ9�f�f �h�V�2�� fT��ً4���*m^F���ì��|w���6DDl��� ��t�T�ժ��j�̞�����϶}iV��ꫭK#Nƚ�v�n��ܥ�2����v�D�d �-�Z,̉�9f�`r^�ӇD�v��RF�!�f�x�n��A�Q��ćၳ�#���G�Jׄ�XBO2/@�]�A�����.&,�k����9u���	Ҡ��Y�jҹQh�K�,f��c	�	Y�V��������ѥ��� �NS�,���hQ���۵,Z~\\+-�q998r@W�D��+Dn�C�4�I��j�f_��G�cW��_a����vC��0j�"���;a�U�����&�	>w����︠���'"c`��4fN��ATg4��8����QY��d{��&�H0�H�e�K�N�U����{͐��b���,쫍�%�Y9��U�v��&:M��6��,|��jB�#x�5U�S��ub	���j��
�J�k�A�S$e����GnUP���%���u���a_�h G�3P��8<Y����14���I��V�+ޗb�|����D���I��c�v.�����P����V����,����� ��C����Y4�ս.�_���?d0���w�y��i�v1h�$^�[����i�K    ���ot@�_�Cr�(w?&��[�2M@���%�_ƴ^ΰ+kS�~cnL�?��h:`���;�z�b3L`y�n)�G�4��	-�Zzψ�@K��yQ�S�=��
�E���`%i)�G~c�#RGV�<��C���g����j��5����AI�CVɴ�5++=�������v�V/U�	*�,a=��F��Zq4^5�d�
y`��������?�;��è���0����8WC�|a�i��[��eP��k#����c�N�W}5ӎ�����e��=�|n��a�J��_ ^�:�ĥ�"��v�P-�� �vo]G��	1XX��k�kPE�z���2�����)���Rd��H��H���Œ����o�_��"Pv����yK(���D���q��ţ�Gb>s���uI�<��%D[\��v��h��+��
�U�\nMn���~��g���Z��i�!?��C�_��>��ʎ[��2�J1�B�蘃�������Uh�!p��c�,:i�._�l���Fd����aMX��RF����ꪀP��)|��ȅF/��a׋'D����nxYư��ʎ(�\R"���s&�qw̗�s���3ıa����kZ�à}��u��А��	kA�Y�e�̽������r>���E��,�-�F�)���Hc`7Z:	�]Y+�WHE%>��`ga�Ĳ���Ѷ��tY�MK����0 7���tf���A��Zi	�H��I�PTY�3eՋ��&�z�KyY���d{���oktӝ ��Ў�z���"/6�������&f���q�-LHjm�v�3V�X���w�u�N<RQu��qW�u��HC=��Q۬?���E���~i*�#�(rҙ�V�c�.jáN�E4�DJ`!m���B�27�ɦ2 n�j2���E��Iܱ�{�4���¿Ʌ�5�W@Dyy:,�fٔV��G��ax/��������D��v)�V�w1ec`1{��Fr������#YT��5GT��i�b��[��p����U}9c�C�>�l��*��D�)tD��F���
��5;��H�"�[&�U�5�Y��j�CdS�+�G������5�uٳ�����]ъ�k�Rd
.¯��W��`��j �����~��m���I-Y�Ŭ�qa�S���=/#�t������֠F'�S��M�*m�lT�jx�*���􂓺@_m!��6�Z���"�"�pш9�8c�>&ϳQ͒N�ʣ\�u]�nӲw���CE2$G�%3�6A&jm��Q����)�`�Ԟ�k��z+Î�z�'X!�uǚ{����1T�%%��>bDĵ�d�> �a>{�l�!o},V(^P��X趠−�yB[Ț�((o��3�H�N�����z��wԤv1�[�+��J ��Ȣ����\�IWRka�;W��	����pr�y*@hz'h�����4�⾷ͷ�hh][5���cKk]>D��:��[�Js�����Ѯ�0�T��`3j�t��M��3#o_��Vk!T+�2Sw,��N��l�?x��Bq	��B�f-U�,eg���0ܥ�E��+X������P��c+e�����վ�N$[QNO�hjE�N�G�X1��k��b�Y�(����W}��Ɣ�&~V�N��#[��U��jRo�u�%�S�@�|�~u�w�Y8"w�S���*�{�%��RR�����[1"�-b�D�<O
�W-]��^�� r*[����
�`%~67H���Q�f�iU�������/��c�<��e�F�jXqhE��	�ė��!�C�L�g�:y1FAg��&�c-�C�{'��:����)zo��Z���}@��ŶoV3X��`�,�$<R&��44���Rٵ!�%�h���P���j��n��?6uM��n�k̟s��ۼD>>��`@�0�gtC|�
�n��K��L�vX��Q�}��^�v/#1�`AO�I^�2� �e8�`�K�SWrd)M.���h��t["[�d�����;���դt�3B�C�_w�I�Wj�>^i�р�CF�׍\!_��&Jw��0��uQ���*��$=d�J���Z�.���.����Y, ��g�I�6Wd���F�ŷ�*(�4dB��ʡ� �X�ŏ��T���- �K�zI]s>s���s�
�*�7̺�B�N�E�M�~�'�QK� �,@�ڂl@��� �
S��Z�F0 "�)��J2"Z��V �����PY�Y}���ZR�+#kB��5	�i=i�J�����v\�ǆn2��ޮid�Z��|vx5� �E�+s!5��A	Ez��i#�ğP�Am����Z�U�G���<[ǭ���C�#���B�`�X�U}��^�6�= ��$<y�I*(o����
n(�)�P+Y�U`'f7��H5�Bz�`��Wiqtrk��e�[')X�4�2@�QOj��^n��*Ҳ���*�8x�=,��֎牬�U�Hz%����C�+뙦o���I4�z	�@Ʉ�Ցb����
u����^��V���mtÚ�5�K|��V1L@j�.��aǊ5���E|��+��3�w�u{�c��8���*��R�f�**)�YroP�\�(��ۻ"w�z^�l��;7y-UU��t8-'��t�RˍQѨ�)޿.�n�.f��	���y�]^v|�Edȟm`��������ˢ?"pd�p23�(a�T�P�����h/,�P�67�N��<���M��⚂����!��bG����9��R$@7Bzm�r�(��*�����K7���'��h2K�)����d��G V�o�Lt'B�0�������'S�@U3�t����]
���4LA�:����9Pu,��MY�uAW�>�I�kY��H6���`���k�X�m��uڋ,�R]��s�7��7�xƎ�:M ����M�?.J��A}�u�ϳا�Z��(�kꩃ75l۲/ת��;Ҫ��4;�=Jd1�ۻ}As���-��8:�[�,A����F�xy���`�?F��8��]��6kRE��1��%#����f�v�{�`��7헑#�Y!&U��N1�:��=�-=��=[�e�E�G!��CЃX��A����W��B-���ܘ�}u��w�6�}T�^l�N�4����iĪi�Pw���k�ڲ��:-�=!�����w��Pb�������I�V��
�a����Vg0!�zt��H ׊�Z+z�(a���v�2�ꬳ��!Nl���J��h��讧.}�[sg�������f�ρPyW[aYT�%�/I*L�o���Mǖ�`�0h`�4^<c[�Ed��+�-��z���R����;�X�-�Zy5B/)�(/��T<J�L�����^�ro�ki;��E�85k�ꥍ�k�je~�c�*�Vxa�Zׂb�� �r��Uż��De��e�[��Z&��r�N�2W"�&����n\�u�m1H-��xe�n��)����	�����Ldhv���v�~����a���K�g����������^ǽ_L����K��A7�w��g�Qwg�C�>�,z�fѫ��/�w����!�P)]�حVDٝ+
�^�w�_t���gjfȚA���IS}R�W�ӑ[iS<�c&�l�+�E�;�nT|�A���^*�ˀi����sa&4�8��	i�d�ɞ���s���,��̅iR�B�ANEۚܓ��d���U2e�'R^":�d���S�KVS!�d� \v)�Q����W�"pO6[�ɔ~C�=�X",9g�V�}L��?�L��X��!*s�H�&3l�Uh�c~>VUZ�L�B� v��OI֞���ß��ha�eaBpJ�$c�"�zb�3����+o��̧�w���~;-�Kc�MC�5�����#)���Z�Lb�(�B���7K�챭��^�c��e���38M����y�7���Sa*�.WNa}���Aۢ]�ͬ��3�ViNcb5�[e8��Q-� X�Di��81$��/=�@��<<Ϟ��s���}��W�~R�VkT@��&P��k�zp#{�B�D 8x|�J5�^����    Aj����μ�@B-��\o
Y���n�d4*�(���ʰ��EҤ�V��c�ZwR�h`Ei�e��G>�{)�{\�/��qL�X��ퟄ����
v���z�	Id���ƫ����A
��R��n�� �Na@h�_T�P?����I�[$=ɽ���(e����&'�Lرk�Kg���<�����S��1X��@r���o�޴�X�G��c���,��˪X+:_*GoO�z��h9F�����BӆT"����P���=99c��QO�y��5�<F �YeJ�ؐQ���C�DN�r��Gv4��!���㖽h��|�D�4ϊl��ᅨ��ݦ�G���Ǧ�.�!�A�ll��=~���F:.d0��씕��r@?��tB�2�e\^���2u�k�>N���T�7d+��0�R��/쟊v7��}��`��^{	jO$ճ~,���uoN��0[�vC��s0w^���g���j��V� 9����7���vQ�j�򡘴_��%���=��	���ς�H��	�Ԩ�FZ��2��eZZ���`..��N"�#�:��3���O���tp% �5eŠ�<��YOH�x��%H�{>�4./Za+Fj�u�K�CC�����L����o�%�qp���.�G����i�/�Y����EZe���op4풏��/yG�7"0�W
j��77j��K���fЦ�[1~���:�0�5��2|q��҃�5�!�6 ���L�]_4��qmm������(&/*���n"��Ľ� I�"`LT��+o�NoV5�	Sw�kq3�BS7#Y��5J���B~��}�wp�ȇ��/-M	����
[Z�*���x�Kѭ�<}}�������j���&S���1K:��-WBD5D�
�ah@QC�3��B\ZY��j*��w����`ou�2k�YPHL]���a(����y�n3F��D�&L�b��T!T�g1��A�nڑ��gUv��ZM%��fZ�hrJ~��70�D��n
��4�r�����D������^⍯k�!.T�q)[2tִA`���4�K�\�KB��$x��;����wG�ۀV�L902l _��������ֱh�jW�� �v
������ó�c�8:��p����(�1��J�FE���c�PG����:����42��6#����^�5V��^n�PM�+���QO1X�/8ގ�_�g�'Ʒ����kd�?N��:���/bbS��_�Io�{�?����4"ٌ�.����i�q:�g�/�nߕ0OT�Gې�Zf�K=�&h+��l�#�d�+�p���"�[��ѽe�ZV�ų�� ��:�1.��r��Az�Ul(7�d�,���>8l 4W!c�f�Dڼ��7l@��#�h��U��h�0[����\�Cɒ�}k���ʩ.��E�ÐV�^x�"=:8����`8:����2���eN����TD��� ��>;g�������4Z��Q������,��޺������!�l�C4cH�kն�5��W���ߤW<�.�&�����6[���^��|��Jf���	ű�N�5Hl�߷�c�m8^�C�/�JC@���y5�9�����[�x�k5��l���,jg��4�Pd�M��
��w/5��i��R�#(���M,���y��ƽ5Ǌ��e���K5��5��_%��^j��ȴ�g˝�hN�TC�q��"LX�_��ưh%�hO����A��/gS.��g2'�6�Rk�e�/�A���a�ۘa���j]V���b��a��2\?�qWc��Ǽ��(�3d�%Z�d��#K�^\E�2�U��f_C.��6�����m�c3�{���c#��/lm��_�0��U��@�XMȞ��X��F��� 1���\&���N����Ν�={���_i��>~�#�Hn묰�'�N�i���������Pr+�g�]K�o2���5;�X��"\�\�q]%^@:G�T�./���-��[Z�� AZ��L6γ�g��r�&�z��,�Ǟ�V%���V���NF��Ђ�K �zI����k�M��6�V܂U9{���C�[Îۙ������2���+���<T�����:,�ĭ�m}�k���u⤻uQ�$�w�y�xA���EG����S�'�;�� B��i/�B�w� �.:wN�;
�S:������o��n�_Zo�cT�-����Dq�?PHrg�F��P��:]���I�4ֳėb���b��DjB�T�{vX�KJ�W� =U�`+����viӈ]g��4����|�-���w�d�Ј��!��*֘��ZJ������|��f�d�m���r	{'M�Z�Xw�k�y��J���o5�XZ����1q������A-AΫi�^�XΏ�b�c�}i��J�w�\>��w��O��2��qD#m+�x�}{p���i�ͣ��v 2�5�j�_fIN_܃��_�F<2�D��m��j1���8D�zǲ����Z��W iM�Y,�K7V"[le�-�X��q��3-�"�j�A��7!��5̾N��Y-�����0��56�c�	�@�����S���������P�r�mt2��k����`i��Ca~��X3�c��C��1O�i��GmR~1�6�������i�l{��=p�Ϸw���c���:l�)��K_���xl��X���<^��۞�[��(����-��HʖC�:���l����蓦*���|;CZ	���#���\g�2�,m�g��}�掿�TEr#�ë��l#��v<5�3I��EC)�1ˎ�kZ�'�Jwoщ
Zu=��|�5�Ϣ���N�\"��m
�e]ڋ�^(�j��qF6�д�����f��{W��5k�;9���Ώ��,D�����
32&]4� Y������c�0X���f���PA�IE�Z��"]��M���B"�4��СUG?��,��Yc��߃�<�;%�|Es�FV����uh�d."9Z_T��.Ꙛ`��i�#��l�u-�U����'^w�Mj���0E-�݋���n4�[K�����v���_�nt��Gb�ٸC��7h-軻&�ާJ-�fV�M�f:k�7��Y5��i�d�ٌ�;�֔E����-FWϑ��%��,H(p�y����?��^tzt�Y����zA��QR�����:��`b��M�C4b�nB�#��1�Nq�D�5�-X#(�E��+4B�+ΚB�����"Ml[ç�1`�B������Aj�O�<��G�{�*D��1j��f>��o���U��X��Ѳ�NkX��f�9��#?�����3���V��u?Y���X�9Gc�AO�Wڑ��[ҫ�yq�c���Ã����Z}�v�|�݃���ߎ��~�'�<���.�*@>��Gs,4+5�t�Y��]sW��+��k�B��wԍ䣳��O,�m��D�*��
�m�kB0�Z�L�����
���������X��h:���Դ�����<��8T{�Q(�"k���S�z�_/�V���~7��6u��j5�a��1�>�t�?[�Z~ќa�Զ�#K���2
Ѓܩ{������G��X�����Z{�A�K����y@W�*������ee�"��b,�f���a�װ�3������m�Z'���&?�Q_t�i��m4f�t�3�X!�ĵҳ.р
�fѷ���2�8^%��W���Ȉ����m��f&Z��=�=ӈ}�*N��k��T���ۭ���GS>��*Ѹ��B�~�7����p����smx�4��~5ױ5x�5L�Z��-l��k�yo�}�:��~ck8gT(�)n��f�������Q�.$6�eǩa��3�fd�Vr��u��$�7o�K̆�:<b�!5���UZ)QKG�l��}��'5*��_ �o����iW�O��X�;B�T���w���o�:t�z��(+*��ϋ1xP��!<�iY� +���8{F���~|z*�c��Y�����	B�̪��V!ӗ����Z��e���j����
�nڑ �ͨpIZ`�(�    ֪څ@�+��?Z^E�R��^�E��J�йiB��Eʼ��W: jl�P<�z�,���Uu^�!d�Xq����8���Ld�K�
��"��#��'�{p��`d�Ⱦ�7��X�=w�G^���?�k�l>;Coρ�g����u�[���b-���{݄'��Mh����A��0kD#��n#uh�-�%ܑ����#������.� ����'
�����A������f�
�/��"�z�x�R�[�?�4�������{}�-;@��Z����#�M��
�Oڙ@��c�F��lw8�Պ)�!�wۆT��G�;��*�X��z1���MC��O}�\���'R�X�)�aiP���N<ގkw9.�Y:�� �a�!�*�%j��d(W�8B�Q�r��<�/���ݣ蠋���C��u�0�0�Ut����'�t��BY���� ;�C����&�޲�>kd��ʷ����p�]b0?�ƍ<k�M���+M������K�M_��bт�Gm!��+���W@�CD8���^q'1jAS�ҧ	UA��:g,�P���?
��?	P�X$࿡��3��cV���	Oh�W�#%�^�����_��vj�C�������g�R�UD���h���|�@��p�坭pq������C�
��5X���ޢ��bx!4�q�2������4*���4H��r�����u��ڽ����E~�gg������b��U�T�]O��ȩ�k������e*u����qr���`��G�".anZß�bؐ��FZ�<�}��s�=�<��b����Z���+�]cB.!J��'�m��B�{��ztB�qf��<�ӫ2Q�zOCo_d�Y��1R���t=_�㜆��<b�^=���\�[A`�ח�C@'�A�I� t��ԟ2���nA$b�~�3�;�ܿ!�\0;�''�o�/��[�e�8�0��k0i�(�n����B�����d��\���unu+�94ʙ������r؊(�;��N�bDe����v�%2k���W��?����.��0 ^SN����8w^Oء�_�W{S��s��k�:Z�71�����(rg"e����9������ݿ����9����Z^��O��]��^#Ē��6B����s�<�K��ntp�����l�k�^�s[a_"��X/�ςcߥ�c��x�O5�~o�MӇ�ViBXX�<��q1�7����ƌ_QS��^k���&��-�5B������v�q�/k���ƫ1�=u\���u
b���zJ�G�e�fe>���eP�x��������(��T�x�q�j7dO��BKt�����M�}���gX�I�H�2�\��s���P�}���U��ᴵ���a�;�u��v��9!��PF�Y�9J� ��_���!5Fx���*c՜	�(������F��r�������Hh��+h'>`Wr��j�BP��qFEO
!L��G�Ȣ�g���ƪN{x�àx~��k�w�O]�F���7�iN\6oH�T��c���x��Wޟ�����E��K�`�W3�27u�߽�}~;�솃ϣoZ�YE��A�v���謀��w;�1�&^�|�-�ּ@� 3a��HH(r
4��V9|+t����1��s���w�&?~ǂ��=W%*ɞ�p�CTi���UH�@+4N��Q9�)i��_���ej�I��j������B�#�������L���$+ʱ���}��4 ���ϡ/���xYG���y!t��2�hl�k�}:81L�55���c�V����Va�ms�~�(=��v�50�����
���ϟ���^��!��|�*�"$���Th�u%�9C�Zp���}���u4n-7��L�FS���x�;��b�]/Ἳ�[�Üd�B��1�.���G��K�P��O�!��}c}�mE��}J�=�0����hސO@�9եq��?���G���(T^&���+&���O�����������ֱǒr��ʪ�hS���h���'+��Q��$�ڴ�0�d��Q(E������q'�L}r�B��t�z�:���� ���Y�ǥy2��oV�M�L�O��|7^;�p���m�-���������M1���yB(�E��e�k��>�p;���իW(A�Χ�e�����ᎏa��k����/q"���O��_o��������`������pSѯ�X������g���K�����}��f��˝���w×�h����!���8�b#'U���E�rk��<E�b��w4��IL��ߠ�nH�Ԛ`�*����ڲ��A~��ٷND
~&F���E�,S%H4e�C�ϔ��?��lԅ���h���E
�p��g9~D���ox����Ç-7���/��].�s4(E��-�bw�<�b���v������������r�����ٱ;8;躓ヾ683r���gwumc��O�;���m��#4�uO�����ί)���l��z��^A��Qmh8���ر����YG�Q�
�·t�)�c43G�H��tA;׃�"��KױI}�����cMB5�!g���P��X��9��|�:�����0exWjA�+���e~�uд,D����l6߅�OQ�5�N�}1���� ��èrz�W��pgd\肙S�׏h��VHD��L(ۃ�AG����xs�j;do51��X���Z)C�q�����O���Q�CUX2nZ��K�*��2��G��tݙ������1(�Z�Z4����ro��
Q����LEp�>���	o�ߣ��}�t��P��D�\���5����%Z`m�w�z��w�R@��Y1�آ���|U+�0ݖ��W�z�YI�+ͥuU�Ά.W@ԋהH��q/X���t�1�PNDtC��x:�[y�Z	G��oo)�H�����B3��(s�4��ɧ]��q6CϼΩE�</H#E���5�	(s�܎�nu��Q;^��k���nD�0��*�Q�v��m0�)h�nP�Ԫ����f9?{(��whZw�02�����gt�<��i�~�M�Z�`�B1*���y,�v��]�����wvxYd%ni��O=5IM��
S1�aX�u\M�e�H�dv���a�IV���Mz,�5}���[����_��T�d�Y�0�ۯ����i����7�f��������>طۚ�gFg�S�pm�'(xַ�K�~���n�
��/֘���SF�i� ׸�6�2�K�v��@.8�OЊhq8��g�,�8�1�o�?#����/q�^t����9휣3�p�_�oݯ#7�>�r�seUf�����}�F�zq%C��c�F��^֘�F�X��)X���`Z�L Eu�����ԕ+j0�3��~9���S�r����n'���]P4��������I�?;;>T��r��2�q�o��jB;zc�<�z��6Y�̊|bE<ch��K���ƳG��g>T�YZ%"���J�����0�AUF�O�a��w����}��v+(�q�����`ڃ�6��3��9�aD��{"Ǌ��.��j���H+i�fZ&���}��S����� >�F�ݳ�)�'�쨠�0���?F��J��J��8�YCA&����#J�J(_�1�U������-3�*�d3�S囖��͑=.:����;A���f��}��J�u�r���r��0��ɠT��\���$�G�C��a�}�{]A8��ؼ��c�t:M�=�~\�KME؄���c�g��o@�,:.D���
VcmJ�Z-D�F��j"̥�!�L7�=�b����0�sY���Z�U���Ԟ'�_�`_{8�ȩ�1f�����T�}i���kQ77�n>Wu&K�{"+�� ���`����gZ�����Ir� 7_��{Y��}��`c���co9�xd(�#3�����Y�� )��c D��x>�"�xz�Gy�Q8Q�'T���5���X�+B��w����G�+�s��ʣ)<�����̡�,��K%֡��P��>�Xoj|�����F~���[�H�H��O�!����R���@��H{@�^��5/Ϭ~��W/�    ��aG��|��r����}=�U��y��}^޸����K�
�
��Z&��)lI�"'�S��S��}ԧ"
=��}|�!&��(S9�{�KT<�r6��3)�8��β���$����\���FS�&�#׸,p�L�"���/��xt� `��������Р�_h8ۮ�97Ȅ�i9߷n���.��6F��]j_��T��3ʔ3�"���	��,�Oq(�ck��Ӷ�1���}���Z��#�,�U�^�ۥ
�|VO�?i�D�1cĚ\3��F�Xx{��WE����дG-9,-��|�E��F(��i�9�!�`�T���0�����4F\��������h#H`ɤ��Be-��A��K�s^SYa_���>N��׏������2e�'8��Bt- �_S+�[���=��ΘW`K��/h��'v���o4Yek6&K���`s��=cޮ����-e*��R�����-�#�$@�K����@�����ط�Vp��4]_޼w�Ͽ���?��oh[�v�����cgA5l�AD�Y��)�������h�քݨr���M�L���ۋ�+���0Ean8��g���*ߍ�1bZ����"!�����c�ZB��+�ښ ;�DwY+f�z�Uč�������������w�+�_�޾ܼ�a�:X�AF�א�[��	�h'��JTg;�eO��j��}^�p!��|`/a��7%�,墽�x�F�C���7Y�[YP�����σ���7|;�:@��m����?4;P$�T[*9�i޼q�9���Ap�C6�Lx���ǄBx���)�Y���`��!�x<��+�3~b3�(�('��=@g$';���'%]2�Lt��y�C���J� Dl��Eδk��p��2���j�����<�ݵ�2��W������J(��2��w�h/rU�'�j��ƌ�m���hX.�~���%���5��X�Y���83���fY�R�	`�s�Y5%�^�>L�hz��I�*�6-}��K�N5~�-���`,:��EF�
!s��渳��̼�L�&�M�ϬD���ͫ̕sc,	B�˂?�geN�]�@}�Du�{A�F ���'�}dͫ��oR<.�+xH�c
e�֬����(���eXL�4.a�0��j]���!����c�N0�3�F��ȕ�.'�x=,�����H��ώ���\0�ʭDqrB�e����ې%���."����������^�������i���\������K/�=7bRL��w>Mt��^1�da��SZ,�#�p<%�1����N�=n���d=:�y��k[�']��߃=���ޱ�k�9�
�����Wdĵma�j������R�]��n].��� �A�1g�B�bS���9�U�h�ް�7a�8,�n�����v�ϗWB"�l��s�:�+.g���>A˗OHv�C���Z��GN��΢����a|��4S���
����Vȗ4�^C8��XĤ+�4��p7妌;�0q+h�>6AcݳٽIn,_�:F�7�Xo2��*��2}�Ih5��y)�[��3gu��B���#�V�z0h�R�Sw!�rWf��Z�N�"��j\-	�����l�?�A�������fI����K��̰���l&Q��7H�(��<���g��������.@��c6-D�7o�[9����
� ��^�L�$�*��y�`�IQrê0e�u,�%F��d�U��ZS&ddeZfɒ�&uH�5���c�qnmvD�q.Q��VQO-{�)�^�VJ�����}y�^�ed���%$(+0�RX1-�)�}�ܪ<2<�p�Ӻ9���u�_k�V&��*�\�k&!��=!Hv� ��k�&����q�h��-d��ʅ���Ng�/�`W�i��n]��mF|V֖�X魱��2n�DAc�������;�צ��d��^+׼�Z��XK\������V��ֶZӷ��Z����t��j�P�� W17��ȳ�G��R���I��^�J�֌�W���򰮀�V1P�5-��T/	'��{9}�/C�մ(90�?����Q��6�h�LV�)��\\d�R��(�u����*a�͍Q��ԡkՌ���C�&���$�L�U�+���M��t�&����.N����E��f?Xh�(Nfd(m嘌 �����b���@C=�Z�1�
S�q���@��m���}p��w��hY<�4��T��tG�|,b(-��Y2KL��Ej�4��9Ql^p�12E�89�dӆ:�����,M�LV�Ʊ*�Fd�d�>=��߷��w�1ݫ�F(������Zd��PZZ[Wn��"' ��՟�J��������[�`�����=<7��W��r��R����v��,��oR?�		��*oU�<sw���q�B�y��h�����,
����B��c'l*��ӝ������-;�e����.ˍdI���a�-YA/� ��Yd�N���&��UR�c ��C0g2�)��������KF�Q�{��`DTW�bF:�*ܝ��C�^}=:*�*�R�
�<�
&c�eTb�����6o3�(�-]�0��A�f��jUMT��T��P�O��� �N���ab��,�/#s�o���|^�˖F�W� ��͋�f�5��"d!9<C[M���2�(�S�-�?Ī�A���<��a�.��h�qj��~3�Ɇk~E�|
BG����QM�}�tO}��LbhXPBO�<���N�W����,+ jd��3\��-c �,�����`���kBht��ޤ�n�wma�*/󧂖�0=�%�X��+L7}=�֟�wˬ"u2���*��� 9D7��n;bďu�־����uQ��]�b�������S瞎�H�Gc#�10��>��\H�\-ς�h�ƉHºz|�Mb�{�>�T��pjҨz�J�B�bnљ���|�V����2|��@�[�h�czVNh���O�udN���h����+�b�~Du��B�;lt>$nE_G,$�q����ً[c�!r�\�׿�8}���tN~>�&����U���|��=8>>:�t�gg2�aᕤ�"�qE�v�w�^B1�3	��2ە��֠�u������[f�b����*��71�#�vAW3�ߙ/�2�_׀[����u�
@�o���K?�Ӛ���48)�MOv��2´�����^ w�Y|a��ڧ'FԽ��9H7ׅ��S���q��A=��qYʃW-�p�nD���D6XM"1tx9�T;�jU.!�M�#���H;_�y��ֳ9?=�eG�
[L�?�4k��Vc�~�q]��w����A�w�#�����v,���\�1�>G�of؆�����Xoe����9rC.V�`03%�֟�t�)e�t�5[)��S������騍Y�T�kc�f�j9��4[!��_���Z��?�w��2rD��B���p�_��"p����>>�v���i�#�|�&
l2�sE�iV��G\O�����e2'V��/ɟ�2���u(�q���_�P����'2����T�	֠���� �"��&!��.� JM*7K4���� ��ؾ[��
��y�j7���׸��f�~��@�C�Q;�����74(E����&C��&E���jI&?�soR�J��$��q�6w�4�7�
@������a#]��*���Evzc�ץ���FX�>�^t�Qs�k�W�p�v��K�m�ƫ��� �d�ξ'_�A��,ֿ·��+�l��}W�o�^/޾y3k�O�,�|�f^<�h<|���霼�u����Go\4���{������-��/��\o�CR��n�2�<�0�sF*.����==p�c��+h/Oh�'�����j2P�F%�f��k�۔���b$�J�b�J�>�lT~�~����S���1�WKZ��;�&h�YB�]��6��^z�m�&"
�b9�I�D��3�y!�2�yC
�=��I�d�hh�D�P���x�*��çB�ƺ�=��;�J��i+�JPf�5X{���}u����$�e�'�ɮ�p]N�ˌ
/#��B[�`�y �T�p� F�]��    ����p�Zj����߳�E+������l���q�p
�Z�����:ԫ�C
�Ϭ^�Ԇx�J��CmJTOX��[8	�x�P��C�;\*9�*l�t�����b�,��@-]C)��r`^ȑߏ,Z)�]+�ۣ��%js��*j�պ�-R[�{Ÿ�X�W5�&J� yM��������>=!�<g)[�B�ߗ�����'g�����h����\�t		�P���Wr1�R߹ݢ��ă����K�&�hu���e�����;�M���И���&^�ha�%ܤ�q�4��O�Hq����6��c���*{��jX��D�[b}�q��
�@w0����b-�i:�-��e+k~�ռ�aBN�̰}C��햳�ݾh� �@xPfh7\���Ia �vZ�����Hx�ߥkŕ�#2J`�!����xs�����Qˠ��r��֊6�Ҙ.{_{=8�){p���jM�Fi�#h�
:����oHr�eq�,V�;Q�|�	��hh�� ���3�Qx�.����k3�M+@ �����^1�ނW/��������iGO��N_�#9�`�.��e�N&NM�Lo[^$Fx�P���aM��������� ��[ݪ�s�D������#cB�g�ܝ��J�N/6פ1����m/�6ҡ�L�tP�9�����h\ ��e���B�C�c�;���A&���z�:F�l!(P���|Uj��BnaC��CJg�*����
Q���;?�ӥa=�.�J7T�떬J:�ET���R� ��Nb!f�u2Pge�߷����&�E�^i
�2���ٙ
�3���ݷ��Z;G�clز���0Q�	}��D?��1�d��V\�w�T��ͧ��Z��;��D�.P@��Eq`�<!�43�*P8�^p������D�NNv.�;R���Hb�8Ҙ��;�r�|�GK�8���Z�L�b��� �Kt�U�5���3{Z3�6!�gMs�zZ���;�8�d]�=��"���Ċ�����͞yl���s-ӟW��jEa�X�+4G[��)���FX�#�E譬8=-�ZQ�[a�
��n�M�%\e#(���j�rw�=��e���3��:��ì�}�ui@<�;�~K�#r/0�2ƣ?nڊ_����Vv-�t�*�#�{��
��+9X��V*���	�7����凖��;U¦��muA$�2�>b�m�	}x��݀�$Xm��%�&B�����oR���:�f_�*g�L�~~ٔ���o'�R\8ꘟcX�삃'?���hd�x�|F4@;�hyL��O��M��@,�j�ưX�Lx)Q.�������	�ݝ�
L�g�7�:۵f��d�%[��wE������N���w�SC�k��������=����-����%P[]!g>j%[f�>���^2Y���ʊ�9k�%�bD����=l�s��<!�6}�wh���xeZI��u�b�j�m��a��^w	�DQ:A�[�P]·���������~�e�I�و�BW�x���k�������)��a?�i��]ɻ`��R���"}m�=�9G9s@;[OO��Z#d�ݮ���%��<�/	㢶��sb4�<;�hG W�����m�,��rv~~��3���،-���� j�O�o�� ,�Z�_ÿ�F<�?; ������Sh �ܡ�[yK?�]�p�+���D܍O@�䜆W@����ս����4�)dU_ڽ�#�T_r�=�/�+�6��8<��^�(��^��1Wk��. �b-�r�]�"�	��%�w��r%1,5�X����8r�y!��*�Ӟ�V���f�^hz�����(�s����M��-�,x�l�ቚ	1���\q�fB+O�_���4��)�P�n��k��GP\ ���}��v��z����*�?Kw�e���v�=�$�3f��>��r[=7i�q��KdHu������?�CG%Q�E�O��]Z�(Ʋn~F�^\"�b����&f��<Q�X�Zm�;_�Wސ�F�t
�w+���]��{G��u��I�s|xrL��`\����T�﷈K?�Nv��Wau�kv}�RO�����w���-+��E�r� v��OYc�DѣHE�g%A�`M�<��su}�5�$'��a����議����x�W�B��?��Ā��fwj�M堦�|Di�ޑ͑j�D�������@����F��g��Z�d���9*ng����T�V�ryzi���ª�y̬�JWR�R�\��AF�� ��6>��i�@��$�6�Ϣ�#�)y�рPG��C�<Y���Sz�v��_G�[��(���kس3�3���1�T��r��J��P��v�{�hFd��~M��5����7[��#��Mvy<1���-l�$�f �t�H5e�-ė�>	[�q���U��z�D`�g�:�-������~�2�V�׶�P#`k�7�M�D�-'a.'0,=�n��a3��M
����έ�c��y�*f��}��Z�����
�O��$�	W"7����m�`FusnbD���M��^��V�i�v�<��r��:�z�(�c0��+'[̆�e>�z�|D�vl�e9�a1�&l=΃%	�Ec�P�dV\Z��d x�y���g�N�o��)��]gɬ�R�Ym>G���L���r��� _jv{4^P��8�,���)MH�YZo�O��6f�##F�.T
�;�����D(ͽ�ʿp��rv��=Ы�p�K��G4�Y��
���I�w�'�'mA�w��œ��Nl�ʵ��sUP�磜�H{5���EZ��]�����c(�o�
D��*�����qG�8~�ژ�:��,v	���6�y��G<��ynĭ�f%��aU�� ����,�� }��뱡��V�.V]�oxxv��L����!g��g�!}��ݣ?��VŜ�`��Y�"VH������
�+9|��;���ԭ�=�����r����%~[��ސI��%2H�`ƒ˿zH�����ݾH�X�H4�} �s��>{�X.��뷿p�2AyͨL>��������ǿTC�����\	��$�����۟گ��xR�D�R�!��N�\���~��3���jy�^Q��
�B�v���9�:t���pL�Ũ�ʣ��g��9,8~v8����wиL�@_i͙� �4[��W<v�5T�������#�0�(�
Vg�O�ڗ��O*p��O[z��/z�x���I���R7�!V���פ^�%R	�����7�_8_�'M�6�H=ä;�}I���9�������ơ�� t�?�6'Ϯ��"eMs`{�M1U:C�����]o�3ؓ�g�'��8�N_��y�0�e���#��1�E�4�����D5h�2�Q�u=L=�Ņ�5�L���j꓏@�/���~D�Eoi���E�c�d��2��{�b�R�� �����J�	M���N�A�F�������E��i�k��h粚����Zha�-=4_� O卭��iA��w;z�������іW�D�-��i�������g&*Z����<3Ƣ�,��`���8�)K.'*=
��P<�۟܌��S�6�Ѳ��hr��)�(�^_^�ޜHI֢��d�5o��I©,���\S^��LQ�z�.YbO�ºP���(s����;�>5E�ѵ���o��m��5��\Yi{�n���6#ƴ��+F��n[���tÌ5��E��j]z��"�Vk^j9���Ʉjy&4�;饇�1��F �D?5/����K.������'�g��V�����C���Q�w����7q8X�'g�����Q�D�k]d��u瓘^����+���n�z	��a�`b�ʦ��T^�k�=Gzr5� ���xB���XPZ� �����\	���u1��|��+؆���ӳF���a�f��R�y6p�(/���K��Q&Z>�@.M����.@�#`R��L�j��p��ee�͡?�!��7��X�o�\�շ?$��Ⳛ�t����l-&~u��ǅ��q`5��F�U�������Xk,�Qo����$l�ס;���K�X$� ���N��    x�C=`��0��Y>*�����ZS�:����lM�8���|(�M�G���)��sh-���ND��E���:��&���cD� ��q�����SK�6(��C�@.�G�z�b	��&�m�xb�����:��b	U�J�#�k�c�ݎOO�Έ�8=ٹU�0y�I�kT������QN�F��$�k�&+���"iP��:����9�GBa\��L�`~���8�Y�_��'�}FK��mH+�����bQ��[�v��'f%�$�Y�5�*���վ�h������'�N�G�7����������ڟ�/��ݬ�ZOkj�/0`��[D=�{��5ϥx�H������;$���c�_�3+����_���Dd6�؏���22��3�	���l? �'�}�ܛ"#B�	�c�-�؎�;��t�������x	��HO"v$
~�4�lvn��CZ���	�IS���s}i�Ux�bxOÈA�G����!����w��7k�ŭ\*Ϲ0^�R5^iA���{SB�*'[��Uc��kQ�蠡˶
�,T9CQ����@͍��kAZ�٥i�o
��R*a�&e�f\�_kg�S<��j���f�nnqľY�ep}������Y�Q�B�G�d�\.��r«<&#���>uSD\A����`��LX22��U21��a:C�Z:a�E޼�����E��*%=������[�{����gn���v٢��8��ai��|��F�����\,v�?##+ѻs��V���&����U���	�@�3����,���++��l�u�~������:�����t����qM�V%�יH/����J�� +�� �s���!�ć�9mW�$�o
������3L<Ȗ�K}Z�4c�3�.{��J3�V r2q��̺�$/C��������p0ЏC?���,#�#�u,-����Y���ߺ�[D�{6�IN�н��i��M�o�LXp[������~:1ma#���|ʲ�g�Q.((��bY}g�V	��cB����V�e��7�ٲfZ1��}e~c����5ZG�ۈ����+#����w��b��U版�{�O�Z�� .K��7v&\�6;2��\2/�SN�!�����΁S'�ںY�F���8S��#8W!�;���#vK��J5��h�O�%[͓��R5�y�b���7pP�^��.GN�,�~��I{�Y5C��B/A���}M�_{]˱?�Ŧ��i{hw�
� �ca����I�ħw���zl���$]}��S(���Շlґ�� ���2k��w�rB� >_��b��簴�v��>}�6�?i��*���lM�{ �_˕�4Ϸ���P�4��Jmh�p.~� �E�����;�p�F)��1�J��է�SS#�6_V��@�)�h�BY��k]�R�{����뤛��1m�X���(��6ź�]9~�����B�-�֟� ɬ��f9�f����� ��#�+,�����}���L/b]OC��!!gK��r��7g{��.�`E$��c�}Нiٱ�K��\��;����4l�#��ք�T�[�e�J�t,\9��5��e��������H3|�1#o��(91Fp����^W�J�/ҥ����+��"�A뗊�n�y\:�P��幻���f�ص�D��j�qe�9�v�W2r�Ug0�����s���W֋�|ǎy ޖYGF6�j���z%�Č��qޏz=,
��0w� �P���O�mb"����j�]K�A�"��t���[*��X�<'h?{�tg!� �5S������W�L�q��ZW�3���hŝ}Q���OO;D{��t��@g���(,�%1���к������e����2��;'�C��	�
Pj
��Hj��-p�����_xSKcIZ\J��%� ]�ߎ���3�ryo����d�b�i���(q˕�>��ﷲ�j��mR��9��8��Ŀ����Z0u���}ttvp�\�Yw��D@�F�X�~�{~G�g��B���'T��ۖ�^��V[�����l>Z"!� �uv�k��O��0�eG�h��ŀ5�m�Y=6�c~OR�|-������I敆b��t[��dVEnL�zl/C;{{x�>��*!�����u#,"���� l�h�� �p��e�26�����`ͱ���F�È�-�_^ic��CB��/��_�����$ٺjX+h�F�㉔�J6���{��VZ�i���l+���1�����-�aB�c�S��Vyp�0��ew�b���d	�����eF��������I��KcX2�ݥ����+䰃����A����g������q�T�u��;x����s�sd�7�p��Z%��袄�cYڙ�M,��e\Z���M��0�%˪�G���`W9���x�F�(�QD%X\G��Յa�A ��ߥ�.���� ����	��љh0[*�Ѵl4�W���0$mk񶙱-ZeQ��N� ���݇�
�9�U�g����Wb�����9��en��!�����lZ}/�?��/��{};e���$;'�*-�d�L��c�����I9i�J�eR�ۧ����ep֐Aqv���V�0�Q���dK���>�_~��ߋ6���֡�̯>r��
y��U=�¹h�����wb�>��>�)J�C13F�A���צ���Z�-�������lU�m��# ��KJjh���FAX��x~08�J�5N��`��>�7t_[טW0WӉ�U�脎���� �=�$�:��:U`�Xa��zE�y�%��v~c$�c�ݻ�k��J�N4 �ݐ��I=���_�/�Iۺ�D���i"Ϯfy{s���Yh��^��JR�&�m3��IE��60.��˓
1z���h��4�b���M�e����vL����:0�����+}�oo$N�矲/��i��ݲiZG�ޖo�+�y%pu"�iAYD�U�� m�3v`ן#�Qa����|O��f�~��x_���|��Zf[��Cx5��)N�Nne��W������Y�w����V�j^�BC�OK��I1�4tI��<C�O  ױq�轃fn�R�b�j���e꺆�C�_-�NԷ��= ��ώMuj59��l�:	�Y����.ϕ�5�YO{)�B���3T�UA�45 ^x��+��{QO�ƳB�{S� ���؉���D�w^�ʕ{��I�K%ߟ���B(�ZPU4�Y$��4c3`����ˁ����ا���7�X4p4Qݰ1�i�T������ʥ���fU�V�Ʋ����L�&�a^��3���|Zrh-ah��~|Fc[��g���G���!$��c>h�4��ˈ��*�$�n򗋯=�V=�]௎Lɠ>�E���:\?�t��v_�]M���zt�Z�Oh��Hie��'Qhϟ�@�fujn7l?�������h�����$���Q��'��ݱ-�F�D�By��kM��B�ؚ���I�m�3�2��u!���4�(�� �j������^ P`�k�i���z�9����R]�Co�O��4U�<�ŀ��x��-Y�_�;r�^��cT�����X���%{K����7o��Eԫ���JtI�fJ]�9{��g���7iov7T[q��M_p�g��ӣۖ��|B��W��e_��"��������!��A��j3�o�����~ZW,���ˢVWl��ϗ����=�5���-pk�_##L"V�o��e����k�?-5C�q���<u�����W���+R�8���?��'lX�y��ӓ�5'��d?K:�ĩ|��'gSK�溘��G�X@�zɹ4MR1뵴�>��#�=|����떱'�4#��Z��Z�y�Ȭ7G��Ql��=���E�4�?"���Mhe�e1,������d�~��[Vz�Q�Q��D�dz.�
Ƙ"CS�|��������P'��X�I��Y�1"�Q���K՚QM�����9Y�>d�M�����\/������o��m�jc�[��:̘�F���q��A��Կ�./���_����hw��X�;r���2�A���Ѕ�Y=Im�`��_ǃ����E    �1fx�i�x�4������I�^�Mr��E�x�(���3�9�V)�f��[=}��@�uU��ư1d�=WY�w$�5�V{�����Za_����Nh	�=�VQ�N$-*ھv|�v��D�-���$����n�Zv��ڧ��rԜ���k	�V�/�U��zvIŠ����U�����Z�Z�C���,�O��Ბ�N�:�o"��ե�����0�T�{�ҥ�'=0m�(X��¥�M2�,OX�|�r�������u�P��@�zng��Bnta�]`雋I�.�-c��=�7�E)���qv�o�����l��gX�}�V���T�[�M0��x6��(5^��|�h�B��7�CM��ɒ�Yڱ�^1@bDpMP�����;
���wx�CJ�x���Z/k�m��Ʈ;~�)˞�/�x�Sw`I'��7��x<N�"�$��GqT��m�P�q�Ej�l�bD�7W9(V�d���/yQ��ڻlq�2mϣ�9-�3�K����f������$�v*�U�v�kT�u3tr��K)���lpY�vi�@֤��Z����|��JF"��1Gĕ	Cv,H+@�G�Z`X�ڄ���	r��I.+9ߒ���w��RS��19�v��[���0��!ȭ��}[�(/����NJ<[���%�b_3av �ӳ/T�v���_�[B���5�cȂJ��ڕ�:O��I��P�IUFv�M��-Gp)�x,@Y-�50D��\�[�֣9q��E�oՕo>����a,�!{����^��~u탱�s�zD������}@��ru��_�C��7@�����o(^袝��?����2=�z���>����f��A�32f+�nQ �QB�2��%*=���] [�j�^��(�ɽ��ͮ��(�'����c:��0�b�����e�?�ZI/�$��Q*kMiHG��:-C��D�}6��ϗW�u	�	��y���:�7�R�,
5�L��I�z3eH*��ʲ�:�<��|D�71fy���!)��xg���,loi��w��ʅ����|yIi��s(��4�����N x����=!������=��ZTh&%��>-A�L�0��¯��ri�1�׽�{7���>E*�_>�}Fz�&2� �1�
�{��P�%`N��:ʼة�b���m(��	�4ց�1W�ܖ3����Y£��jXM���d�+:9M�7�,��1_#phav��ݷue��HZ��9XF����L�[���,�D<��G*�WLdmH[�L�IKn�tȒ�'�ٚ1�7����"wv�߱ ڰ� Z�j龞N���a1� w�U�誩�qe�ɛLY;aU�{�Y�bb���o~���dY� L>�GQ[�%���cs�	�L�ۉ�X_��9R��}�s�_���1�n�����~����5����G���9�6����Q������N��Z��6Lq�D���W��7kf5,qC�����bo����x��B��p��Z���
K��pߋ{QcE��?��e,:Jun�kvsn9���<�=9��������2�E�D|b=�Y����B���_ �w��̙��as�N-�zm,k��\:��]�h�2{��hd��y�,�����;��w�]�0�㿾:�	S�%�&�}���M�
_-��16u�6��i�No+Saa�\���yWo�-G2&kE�[����t^��.�}D�	��e�+���7��Eň� ����h��\".���I�>��zQSȏ,ѼCg�lˢ�}#O�-U�Q��y������>9�����>�y�_9y�W��jR=�<�}��}qx㇜	+�(g���s6�~n� ����Q���ZQ���G���];L�8g><��PN�z��x3f+0�j�����5N� ȼ�(�0���rX)հ+�@�k=@l1�����ҙ �)�Y���rBu �N9	���S�Q{=���*�4�vNpö[�l[������;�U�͜��1Ez�{2�	\�PǤmVy�
�=���t6��C䍽c+o;���ge�$�̙��f�̀e�>���[�f�4'��F��Cѱl��N={�՚�+����"W�U-�	�wO�<q�ُ�`Y�{*)� g�+�6�� e�@�r��@Vǚk�Z��C���P��% ���ЄFR��&�عK��E&b��v���ǿ�/�������<z̼c��Y;^̭7�q!XH��.oIo�4����͞��@'p�����.�(�N���+�nm��r���}	iG1�sȕ��
m$;Q�G�����b����e�&�&J&��&G�����~�����$�9�$���Y�z�� �>�Ǚ+��Sq.Y׉��i*�KIcF�}E�4�m��YcC����S��<�٢�2�v&�5k=���b�µo
ퟸl�N����11�'*������䚙��aڂ֎L`B�4��?�9����<澴Z��j��734<a�LE)����Zj+紖�O	�վ��]��IX���_�&�V����դ"���~T��X�ɏ�ⱕ��W��- 3���]�м|�w�B���c�e�ps�f=�df�F�ϡ!ۃ����״3�b/R	,Ml��w5��
�ە�`���]��6sW�A��[V�M5�֯r���݄����6)r&o5R�fIv�c.��* r4`O�S9k��ѓk��Z��(�'Cu_����o��Z�x���|����bb�d��1ϵ�H���3��_��u1#�E��H�D��bYD��ٟ����%�<��9��������U���B��2���٩VZ����||Đ�j��¨w�^��\��;���4)�$�b烵�z��D���g��>T����,>�C�5�8Y&6����[/�;����ɟPM	�Q/$Ic���c�;��2��BЕ/�'��5����9	���$�Ě��)�#�h�2��4���{I�ś�U֟�9ژ��F��l�����*�_V"v�~w>#�8��l���B{�Y�儍�$�˟׫\+��:<Ԋ��.r��Nk=��X:�Ņ��
+����|�s��|�d�t��=S@aI�a� ��[joml��I�o�F*�V�Qŀa돬t��R?q�����r:l����7�Lyڐ��������^ Z|�3x��*T����&
?c^�By�E�bʗF�"v+��j�,*)sY��*�W�
$l�aZ�^{衱;���7�i8�v]J�u���#lS�]_��e�J���|��Lܱ ؤ��	@T�R,0
ɆH��R�$V���7B�@�����z�ܠ�S���:/���i��01���듧�I
�cn��"z�~'ʊ�y�*�g���I���s���e�"�n����Gx�>^+�����Z8:�FL����,b��,�M\RZ�41TS<�VD�4S�(�k]��^��b���Z�^1����JW*o�4u�}_DS�ƞ�>2�<���cp�8-�SQ�&�yP<Y���6r�#�<&yYc�J<�K�� r��d��+���@���=$�����,P�hf�I�'D�nP�Z7.<��d��+�����6�\�`��>]�T���N�雛��Q���|�A����8�	n�yN��9B:��<NC'�8�������Ƙ�=rR�#7H�UJ��{�%U~���{�+��WAK�u=t��xY��aIyc��ρ�j&����#�s���ڍmz���O�������Ɗ��_Y����{��Ϻ�>��=��x����?����� �U�a���s�/�w��9��w�
��wc������)���!���؛�,6]��?g{����ӡ�A�c����Q>����o��_�};ͳ?���|8�^\�}:�nwo�+���~3yɌ=:n�w�O�Z~������R5�|yWL��/����Ϳ �k'~d���|���"#S����Fǝ�_�2�������@�01񊐟��7���e��7�.�o�V;oɵ6�$�U�N�II8p���6e�g2��
�@cJ@5�0�@��Ԩ�HF�A��fW(E��!�I��wLs���.��.4�m	    #G��0�jj���
�R��a����~�m3�2�m�������:,�2ž_�Qi��)�~GMZ(���l�Y��b&��5��N��N�֟&ݣ�yT?Q;��7���>���F�*ćO�A>׾f�T��`fMI_��q{� ��(�#���u�k�5�[��u�����܅��x-$u�Z�R"�Xx�ϫכ\��+�u`q0�"�zc��}��iCV�Ŗq���z�U�� �Π�8���BSф��*d͖DTh$�Rʔ$T��r�&���k�����S�����Ic��nlF $���]���w�]��/u	F|�����X��bQd��7���+�\2�f½�D�U�dە�(�KC#9Y�
�)w�r��Җ��co�R~)���"`�΍�Ys��
4�_���Hvh�q�e�\��"e�����h�-c��Z-�h��.]S����e�R�$*�e�#6<l]�_l#1,��9~�Y7ThMoO���sC�������f&�sYn6��IR����<T�Z\a��x��<_�1�*=z���͍�]o(�VC���	���_X{JW�J�ta��>�����q��y�*5{�)�Q�V��)q.�(��n�
^n��<�)"�u �HѼ�B��]���mD�7,RU>�n��ŋ"�<�~w��x~�|}�2k .�����.�w� �CL��+�׌5݉�߸v��ݠ��;�z]̍���+YM0Wy32��E�m]�X���h��j�nد��EY��M�]j`���}��=� 	��v����6�c��C/�4{|�:�f������k\3���u���6�-g09Q����n�������R����`D� z8x�������=t;V�\0��k{�C{�~|W��4}�Y�p���X>�c���OZ��:�w�<�v�����>�Z�H�+A�eKT����T�n��!!-�t�K��Q�	0{�T����D��U>�u`y!�T`8B;J��PP�>�P2EP%�c��r˲b�6�=��Q�3ʋn��ך��I�s��f�x���3)�n�'���f��8m�B��#�{�W��v6R~ک�}�A��5>�>J�@�9-k� E�YB����a1��L�pk�jc������=]�p}�n=��g��`�~0R�J�;��ڈ���E���6�τ���ߓ/�i]P,{�lYq������� ;�������Q���?0�fi%mۤ� �k����������
�^mY[f�}�[�\�-��G�����g�<غp�.�l��D���}rE�-�)i�Y�s�>�]��[F�+�)�Ց��eaz
D���{����z]-*y��ʾ֣e5n��5�W�*��.W*���E�Y��"
/y�/i����a��踫��sSL*�1�%y�#J���.dAD#%�EU
bU�:�@^^_�zC��u�\���k)rPj��������i��TY_,F����"�ϲ9$y��"2�C��tEgv�\��u�)F�δT�^��%��)����"@���ݕ���q���t�3���+�a�NV����X��v�D74��B����T��OR�kf�K<���XJx��%[��T�����\9��x������	�!GF*��)��~j��,��X<�몼�5vl�;����2rY��y���+�����<�sk�*+e��w�E�`H�����>��_�#B�F�>A��|1�y��i��jh[�'�?���iwqNE{/��f���5m :⌻Q*ð&�B���e�d��MJZR������c�|ִ��yk�t�7��0 �D����{ux��iζ�ځ��.��k$�^}C2�@�Kr�6&��先pꡌ��}�E:�}�"��"]���fiHXL;��<\�A]N�{e��aA���tf6a+Rc]��d��6Hu���j
˞�������̙�s+P�5p�0#�7Q-�β��⻚4����X,�!�J�4m|�����A�8�n�Z�%�I�o��1���WKE[yXG�U���������4�Ӄ��,2���Q�Z��8�d�@�� x�J	GY��?9F�A��bv�4hbM#��毛�(�Lڮ��6�*�p���qx�>���Hm���w墤��=�L-d1���:NO�1v�Y�;n�ƞP��Z����$rY�ǐT7��V�Z��8�1���gGe�s��0�����2����]����cO�{|���aQS�>�kLf�+i%#1>}�������{�����<C��:{�����? 8
C�Đ�B.:-�@��;��;�l�]I�TY�U�o�n��l�y}��K$�=z�c����Ɯ�+$����N5�F�ཋ�L�Wh A3��8�-v�b�p�ŭ�j�8U�b��������)L˰˲���>����O�|L_�Ր��{�q��6v)}��`NN���8Jp�V�7eg�5�-!�����v��㓓óCջϣY�-�L۞[*,�=ġS9�9_a5_���}���#L�Y+���a����µ��u�^���I�d5m�Nڝ�l��w��O<��H؀�ѳGxd�Q���m��Ȗ�}�	��.���o���缶+�Z��NF�|�<�j�g~�h�k�Ni�L��u(�x b;�S��K�qf�����l�S�20�<Y�C�,��a���S86���;�$�z.-�Vp ����O>��I�0��<�2�=$�����m�~��Yf�ҭ�X߰.�{�)}����n4�(�B�i��(�Q	6���(���=2C�����`���*`|���f�m�����`hj�����6l��XPu2�Q�<3�|PJ��?2�ʮ�!⚨�o����f��}�9<��]s��eD����z� �(��&�d��k"Sv�7f0��f0P�ƽ����ZI1�������Z�P��G�O"Å�S��}AG�� V� ��_H)�#T�LeϞrf �x��Ȳ�������S��0̓Q~{�κ���?��7��j�&�_;���O�,�b+<'!*S��%l�	����}��z@'��9�8��A�|HT/��W"���h�.���u|\β�I��^��Tׯ<2�U�"��<�=�W�%ˏ��N�g����PB��ݮ&�D�>�м�'�/��z0YA#"�O��Q����D���?iUo���xR�-��1/���D��*s�?�X�X����V��LԄ����%�]���䬼�&yB�W�����r�������\E�g̭ͱ�����XX�2>�0+�k��S��*v��TNa`�O�4P�b&Pa_.@<<(�e!^��m���F��U�cz;�tlf�@��«�t�nd|��7�Í���"���5�U}Qq��Ύ;�cU�G;}�6��(g��V���Y�܏;�{_?��fW�/�~����7И~}�����*�}��d��.z���O�ŧ���R&߼�&��>|ʾ�?��?���o�������z��]�Ԓ	-����� R����%�+#�q�rw�N��h���k��[�)�H�^���M����%��$5AC2l&�
�&����t�>C���i�]˚-�B�Nhc�C�	�S�$��??�M�D���7�`�k�օ�H�U����;v8.��ǨG�l��m��>��6��~�����{��Y��V5N\	rԍ�SѺ֠vs�Z-�Y-��R�[n�
�kȞȴ�ll��J�5����A��%J{��)ZV�RX$���4n�?|{$���i����O�ZĀ�y�b9�I�(����ഓ�V��D��x���Ǒ&=�y����gc[Q�����e����L00Ҹ����*�:2�J5���N�m��gg�S���$��6�y(���U�͑>��M���'���&�Bi���ΔFv���	�)� 
;���>�jX��Ċ�ysY�qH�/�!삌�o�?3���B�&��e$�k@����C;��{7����s�ݻ�����/�/�^Xك��Y����LW�4Y��ݲ��Wks}Q�/��$Z�סL    f�_8˻w�A����CM]�:L`��d���'+~��ce�f�O��~�z�2�pXz�@��9��1���� ̆�y=�RS|�xĞ�>T+޳y%�(�0Q�U���J�o)v<�3x�͑��d�i�����:�e�];�g;7�jF˒%נH�fW��EV^��y�������I����!a�O@�K��3��j�V��Z�YZ���#1����X�o���g`[�6����Ys�/�POlz��*Y��<�Y�Cք�z1a�� �,ex+U�K�p�ԧ�Pi�Mo���ê0��ݍ���%��J� ���1���1X�����6��,��fcE(�	Q���2��Q��H>t���؋J �H��wߞ�(lŦV�ɺ��Qw?�Kv����_@�.�sk�����W���ʓ�n�O�:��������8�۬"�%���{C����T7"�hk�Yo�'j�PΒ-�K��|�
@��`l�j��}�����Q+�y�Q)������u���k��{ K��aWL�˂��+�~��QETW�V�-+��Sk��&}�{��6L�Ezc"�y��� �u�� 㑶�m8����X����M�Q|����<���]�}�H8��'��01��u�`�.ه�4E�L$	�q�dU���-�K���T�%�XR���1�ϩD:�F��C���4�e�yC~�_dݓ��ٙŌͷ��8�� ��B%�A�,�;B��ђ�>��G�(��������Ե7����7���!�Gݷ���Y���HU��>��_+M:%��]7�>��! �%e�GKA5+Խ]�ޏ��ND�c�j�"��y`��.���R1��a��_��b{"��M��N<��͢��Qͥ|���B1�eulHh��w��W�}��Z��z%����q�����z�֓�@��F�+�ʯF�ـ��[k�Y�|�d˰Ԯ��T��:�v�t΋�|'D��G��O��*�Slm@�&��p�kw5�+�)Z#����h/�F�JF0�1��5��b��4���Qtx��&�7�i���O�<����ͬ����E�'@)����I4�u@�ZM��6^ѳh�F��oMS�i&S<�$E��mIxx���l�l��y�BXN�Wa����n7b'�C��
Tr��eyͥ�ƧX��yP��D<�B��m�t�K;��F�l�wT.{�Kb�� ����	����a]����t�\V-���M �Y���E5��*�#j;��������A��j���Ф?�gǤ�12�������[��Zͣ��K�DC�݃`����u� NP�a�rm|���l�oP�@�S���1��a:��Ok�6�4��]�5�m-2�Ȥ�^� cO�����d���W�ށ�����������;��>8�Ϝw���N�e~�n��]|��&�
	�dq��d5��t���e��i�R8��b�UNc>�m�� wUZ=?j��ЭJS�|�F僵�4:���bQ���Ӟ�|�����)VJ�`�ZDz��[�ZZWX��C�$�8)4��m[F�e��g�4��=?UF��,��Oُb���+o�_�i�u5�Ʊu���g��"dz��d�K�v��}���綴NS�h��m=67�
D�T1̯P2�����yu���M��>y��c+��?�ryA�Pȋ��3O�y��g�ln[4���<��Μ�W��o�)�u�M���9lkz��(篯5�p�\\�YEjj�,���E���ϤX1��\�X���]5?)�"w�U5�O�y����wH�);���\���X��B`eр$��u���G�"i�����?8�V�ؾ86�c��9����ң�ֽ�Pv��b<� L0��G�#B�����+l���A=�z��ő����^�ߦ�;N©�q̆5~�����ɛeUo�qo;ݷ���Ã�љ��ݝk�|��Q���_C��+��zH�$`����Ţ��s�N�DY,]�}��Cs��M�C�lD>ZBmu�,�a�c�=|�x�Z��)��kd�&4�8�ܷ�2L�]#�?t���<����.�F� �e�n�{1�k����U�5F���(�U��(�b�Us�=Ǯ��QѲ�85��M.���$���l��4ԕ)���M��q�i�x���v2��{�0F���}����I��������MA�פ$*��V���:5��B�e��qw�ڰ�$�S�+���X2��g�}SջW��)��`P$e�6�_��en��yH+t���5�K}��k��,����n�Y��elP���˃���ƅV���B�Lۈ$�d�U(�V�v�/'�����nL��,F�=4�_����a�����K�aj%t0h��j� ��p��p$湚v��YX�T,p�8A�����&����k��Pƭ:Ci�p��yR�\���P�L�>����]=�W����(�8�-���BnE4,�oiǛKO��j�̽����Xn�Y>��(��gg���z�����3�o�F��a>�,�� 7V����کH��H�Ҕ� }0�XV�����W���n6�g�G֓(�F�73 �:����!Y0�U���j6C���W�m�,'\��9�3�7��h�c�I�HrbÍ�xO�
�s�.[1�̗��P� ���
�g�M�Ē67�Q�����qp�m�A2=k͹%	�H#Ue�ÐG:�^��\r�q��j9���LhAդ3e^��ȲI�:Ǌ��[��z`Q�!��͍�d�5�Q�j5��yH�=î�Jѫl�^&Q�*�vuy���=[>�,5�-!VF���]ז�S{FH�]G����oy�<���z0^S_�ڞ��
����ɞLzy;���� Rv��=@������h����|�/ȥ�MF�5t-O��pC��X5�:��e�Sͬ�����������zJ����8�����xY���	����K���7>� >��7m���u��:^1���D춣�KSfQw�
���b�w���LV��IUZl+�!/ҳ�ȕ�(�'g�e5���\"A-�g�M�5t����m���ј�W��)����>�c���%Z�!�H(���:�+]��c���F$�x�wpı�צ�t��?4(1�w�����vņx���+p�߃�١Ǻ;����WoY���5Ŝ-���}K,8m;�vns��D����A_;���K+��@����?]�����=��J�p�SpZ�Ыr4s���_�a��G8�eF���<���u�km^ܡ��\+Y�y���HV@�q�a8`�Z���r=Ξ��������m1��I�	6@:,.��6pr��~?�^Yx���T�4�����r��\#M��F�b����	�b�¸��+��S� ��%����'wA/2v�D���r{sԅe�x0G�ڏ�O��t�5z:3
��1V�g���m6�s@�ʑM�6��]�n�_�֛Jܚ�����Kk�����r􁭍�rg�g��5�n����Z��t��� ��Flc��'yQ�K1��4x7DK̖|��	�,hXB(�dH���=hs��V��h�ʼ#�`���bps+��5׬~�.�� ?sW#
��?�2E��3�KQ��D�\����]�� �V9�gB��з�Pި�����<]D\�͎�ɿ����i{�Ұo�6�u���ނ4誩;�ݽ���������vL���ۃ������B���;������r�*�/$���r��d|q�ŧ!bH���옮�Ҳ�s��ô�d���u��6�����b]��Ktuzz�_rB-j`�@����q͚v)� ��A\�IK�&�V$=��1Dv���,$�DE������㿊`��VԙۜO�f4g#;j��1(qڵ���0�w���w첋w'N�R'-�D��if�#���I��g_���i
$t
ϗX�&%[�.��/��m���C�z,|o�8̈�岟Ĭ�����|�>:�C�F���c�5Ne��
�B��K���*�F&�}+*"�l����7�âsOs��w�h�FD�${�=h���6�T��.Q�����F    ��#R�Q0��4ˠlD8�2��ʙ��%�5�478�PDPQ��<=�xA��Jo!"��{%1G1��]%`n�m�JL����?�uKt����	��ù
��HʈTN�ig��2w�w��In���{	�i³���r&�����!�^�6�۲ ���榹X*5y��p|(yL+R߉1�n�#�0U4�U��Oُ������H����r���l�ݏ��q�g1B�M�uiM�����w�m?����!x�xT���׭ u��`��<���rW��d&a0bR[ΔQ�A�C�Qu94(����"IM;��!^�kOp�0�;E��|?���L�ę(�r���z�"�:7"�O�k�S����	�S��>�k�y�pOд6%X�*�M^��&����?X�V��	5�&�yѶ6.P��c�{�408�aC�t�>8���X�q�V�_q���~|vp� ��َE6.	l�q��q�����G�?�^*�7\@��G<�:J�r^��=�5<�7�vA�h=��^m���X[$C��*�� &��3E�����6H'^��J�A��$����r�'�Uѱ����ы_	�f��!�L�Z�|�Q%�+�QQq�>��Ϛn�Պ}�l �9YR]s�'%�	�ڋoe��q0��7���>�F�6P���ռ\3�Z��
t�Y9���D�^�e�{�SXmj���b��l[�rr;/�Ѳ������-z��(�N��%����he���c,~N?����-��K��i���钾5���]�C���/����R���n<c�H�K�������ڬ� �ma�/6���G�Y)����jU��t�h�(wo3���òZ��x�;	>"���"��p���z��f!-N���9m��.��B�bXp������~��Ѵ�y��VL|�|:��=�,e-��Z�g��w��gy�<�������\&�>�\I�p�f4�ֿ%��[s!w5C�j���x�p���%�VMd�
��4�i-��>�G�$�4X��-����Ზ���h�7g��-�hH���Q��֢��RX<���rЪO�d*":�1�����V��Bß'$���P+)��cWrO���Y�+��,�M"ƐH��� ��D|h,&!]�25������U���.��jPN�ڬV4t��N˺V�<Q�x*�+ꁇ�v�z)�ቷA���N�B��>�b-^���$J��7~up>Y��L�8��0�����&��hf�j�X�����aQ*����%텖�ki��^ ]\�i|�x��7G��r"<�ytC���8�{V��%��+oy��؊G�� ��S��O+t-���F��G�ژ'���ڤ�5]�퉧�8�o�ˏ�v�����a.�G,!��h�&�fv)�NÒ�#�
��1�	��.����@�R��$+�Y�r%^�x�����Ȭ}[����U��k^��:����%v(+�A��4���&]�YŌ7��D��j#&�y��h��Q�q�y�e���Q���v�SE���z�"F~��Z�(�s��3q!���NÆcv*���M��Hb��]�'M
À$����A���Yc�п�HvL�K>"p�H�}����U:n���c��#��x�^�R����
.5[���3���;I�{�? ���G_����j�|&�/	#ʽ�� {���n��CC�Z��;f�=-�)i���H�/�x5,�=�����:X��Ęw�v�N�<%镯A���a�>'J���<�[d�8�/q���con��(_+�MZ�+�yRL��"@�|���D�>	Z�\�^��WeI�<�w�cKd�y;���_#	����T0��Z�b��j�gM΃X�W��#� S�t�}G�4��u!���l��~��lj�%�s��}b��fl�ѣk�\�Dyk1E���ε�Ny��v7�i�u&��uNZ�f%؛S/*�����.5!8���s�x�m���E�-C�CoN��j�i��
����GO��r�%��]ߌ���[�N�6�'�!kew��t���U���/�҇o�QV�=��-}�sm�ݟ��:�_��Ι!܎� �K���@�/��#���9�t�"��U�вy��T�����p<�a�64���3� ��+��˽�zE��Bޣ��p�L��i��"����
Ǣ��(-��M
&j���r�v�wp�p"Ͻԥw/t�$M��u╸��i,{	U�~����P���ZP�{dcA���R�7��¦��)*��Ҳ���-�����`�ؖDʕ��������Y�����a"S(r1��ݼL����V�J��V�"섵Vz��5x���%F�����|��e�9�K�ڢ�Ĭ��ۣy|����|5FP��o9� ��i�ܿό�F�����!���0�1�4��zI�������&D��9��U�}�&�U��&�I_�uz.-u�go��Ao�{�Cm���t�H�٦�m��=}�_LY!u�(Ėdl(��=Yr���~{�0,���7�Dkz�8�ϕ���C�)��Y��re;��!��Q5�\V���� ��F���f��<��<OH�*��f�}�M�E�w�EDZ>���,#�]�a���Z�8\�J���&lI%�
Y<2�ä ք���3�/��W�����;�=<k�z�ɎJ^���j���y7�,��i�����s|K�U���M����SC�V��ï"�����he�	��C�P���q
�T�JΥv�)����({S��͇�*�W�l�J�f���rެ��6Q')K���ę�*ON��n�� �71��D�z���s��\@
�^ERB����78+��#�̬ؒ����TE�S�Pܲ�=g�h���_
��S�w��<e���itgKg�Q�Ă��n���ލ�Z�&0���j��V��<]I�H�9�ͨ�V0���(y�B~I~ν}-�*����{xYh$�>VD��䶴��ZNV��E�[�6��߬X6�u2zH2���P5�èl��j)i�8��k��ΡZ��͵@��B4�1��V�
�nE� N����rш���!��7{S%��ߍ͓K5�J��+��	��Xk��&o��-��"=g�bFp�Q��c����.Ww�����j�ns��d���S%��1ݰ���~����m�}�99�7����-|�U�=��Xl��U�=9�(��|D1x	/����1;���u�GN�a�+|��#�4R�sY�����V�k��F54K(�Bp&�Ļ|��k�(��d\�L(�� �*}��fv(V	��)U�M�x�rH���\�FK�?#�W�=g�j����s�iNFn��8�Z6O�Gg>��!��d���$�x�^���E�|(H�TL�x��V�7������ݥ4�Ƴ\�C*̦q����62Y`��	�����*YQ���Nʈ�S3�8�H3���m���΍W�GG�cQ ��I�cp5��i;sugh1j尸��x�%�~�Q8�$�U�&�bn��}��.)�}[�k��*/A�?�t��y�eh����E���p�k��0�b����>y�1�g���-3�sb�^y���Ы�;*C�m��6,�Y�P&�&�"�f+����[,����N5 ��/?$�-t��_|�g��&�d��wYmJ�sҞ���}=�˯]�w�~�T[S�Ӻϗ�@A^�n�s�˩8��6:tq��w��Ǧz����-�iF.�ȂphJ.��=C������`�EH�r@�b]�ˍ&���Jߏ���X�M~�ҥA�tc}B�i������t:�nB�<���"H��ag��W�o4c�/���a��sh>���
z�`�~��tC�X�z���*��a��j����ea�I�A��8��%�8�!kw�R;��n{�i6+�l�(��.�'��@@��U�/����E����]���!��{�_n����D��9��s��HY�`Ձ	��Ma��*]�<����N\��~Mƣ�А�H\�>u����rj+�m��6��/&����w͌]��~�r�FC3WkG����&1>T�    nLs^���b�k�)��������/�Q7����O'-8�C���|����s+2��&1��9�g�G�M蒖�͍��w��C�k�m�Ԡ{��دU3ݤ�U^0�>l�H�ţ�CG�,R�G��[��ji��蹘6���Z�Y���N���)�t�����?�*�����]�-덇&HH��E��$��X�k�P��4ΪװN&���+]���T���WHj:�����^6"�*w��#H�/��Nj�	�^���Ca�_�@\�n���N4Ae�Kqo�v�i�`(�d��#��_��)��5y�i81��w�]5I�-ɍe'�ƵR����Sa�:�<�K�	�L�ي��4P�d��p�[�F���?ɦ)���,KRQ��/�z��^=����U5,���˪z=��WMɩ�QM��"���PM+>�MZ*)�i����k�4T�Y���ާ�R�y8 UF�Jmw��?�(����5��,�1+�Y+7��D��(�翶��ߋ&.��e�X,�"�p;Ӓϙ�Ӳ^����"0�|^n*m�����kp{�q�[MY���- Q7/Vs�rX�������[��:M��#�!��?�b[�Zz)z�J��y}9�+�zu�L\;0�UgƓq�Io���؃����{|���<*4�2�z�ү�g�7(��j�o��V�S��П�����}X��%j�V�ܗ����9>m�u:���ԡ���z[�"?�Cu�5��6\{'e �k.�L��[[YR#[<�g�\n�;Lf��ᛈP�P ��#/�8~�z�e�l����u$W��ͬӃ�F6ޠ`Z�ɤ��85�ň�mT)?G�&Y�D���i�x7�IkM{�I�c���F�~��I��^?{�9h�v�R�����]��ږվ-��_����j�M�Y_��b��g���Ί��V�?B�vʇ���#�Z7z�,��Y+Z����w�zY}G���!u8[ǑV��?�Z~�c�Q�#�|� �T� �^��"OQ��wϋ����@����O}���I�0i�7*����`��`�d�}a�"i��`cŬ��9�|¼���ۖۤ��!�0���վ�!��7tҾ���->&��Z�j�߮��D�\OaH��A�������k@<�:�Rd�O�!z-�0���7Jܩ��L��f�w\�qW���������GE�ՙ�5��9鞻��j��q'N´�=5ߙ�i�?�0y�+J�;��0��	Z�����Ʌn�'P�\'��A�T��L�1,D�`>r#k1VЦx�F`�&��G�f|��ۖ�⻶�ZW�f$�(�r}��]���[q�ί�N��C�[�:��/�-3���.�eH���d5���b�C�B��Y�E�s��j�!�$rxQ�P��T���*�R��^>e+:,6�pڑ䫐<�B�m�ʵ��n��z3JQ�5�J��>���,@W�[��U&Na����R�c%�q�$�_^U��I>��Y��j`ǲ����G<:gi�}���J��i͂�	χc�E��+�j|Do).�Z��du��"�)��r���e7%iQ'� U���A��A���blX4���Π�!/d��[��hq�YҜ�]��c�|��?��:SL��Q�%����!_�
@4�A�4Jeۭ�В!�A��2���*��ʷ6g>�������4y^c֭t�8����H�W��Y2�+$�k,�﫪&TKɻF5����5lO��E7�$�}��k35B����^3�"i��J�C�S3��ȑ|���UoS7��{�f��Z6Ǘ�y -;�������eWz}���bY*(�B�ѳ�x�M�D6E΄��.1z���s5z2Fk�v'�)��bګ�1e���Yk�0���
�m!f�꒸���*<[@UA�3H�3�.߻S���}b�[=���3�q:ߕ��k�Rݚ5,���ញ:����zD�ݕ(Ѳ�����z���{�m��x��b~�����s���a��j`\��ˈU�r����B����GS �zbܷ�T��'A���~by��|δ��+���R�!���O�\�P��]����� <�Ov�XZMd���Y[�����}�Gcd��؍Ks�תݘ�{�*=�޸���Q���#��&���K3�Ϥ�Q0eg��*�P,W��5��vL4X�z�uP�s&YQ���_��xuQ���0��0[#j�F�������i6�ꕇٞ��������i�Rȏ�o4�9{{��R����9��ٻ���J��΁�V����e�;�YdaJR��q��(�U�(�t�z�|Ilg��`��sD����)8ed:�tk����,����5�XF�g&������.�m\���Ul�i"�,�%�?4��צe�II&�v:�HSH���_���za����|�.(ڍ���$� vϞ=_�s�����K�����I�>�w�~]�!{F�����܈�
��o%�!�n#�۶ �8m먥��k���zZ����}p[Ȼ^*���f����)d�7p�OH&�^'����n���x�;˯�̉����k}�_i��z͇"'�o������A����nGJܟ�o/�L��3F�u������X)���1��W`0=����R�h	|z��_7�#��$�k����H��%���Sdm2Ԏ�ұE��.K�M��W��.���y_���v�Mm��sx�g��G��O�Ĩ`}f�Q��^�R�fO���\n�[J�g��NV�4���A�u;U,�R��ޖHG���wrC�z!i7��k%�7?ue��V'_)(?���݃Rz�{��j*R��U��9�ͩ����8z����Aw쉀2і���;�q6*O���kT��::�κ�#���$�~�ދ��Lޑ*4���,����I紃�����(*�"M����s���®���mp)�z�N���O��w������7C��}����l���T�ވ�"y�G���L�Dv�ݏt�~�H��m���'''�m�#~�ǉf����ږ�:��ОC6ljjjKЯ��-�|v�I��=VR��QK�@T��9n���\��B��`ؚĥ��
]�3�J���9zk���P�`��0}��80Q[}���1!�&��Q2���H����f�̜�J�L�o��A��{��rk�f��`��7�����}�BX��e_�ٿ�c�|�#M�IPdr���f9�|QF�*������bn"M��|����S�=��w�AZe�4Q{>�y��ozV��q�� `�[�B1r^V�k�mk�F'�8'�
�H$��Q~9f�R�2�7��;I5�(.�P�P�(y�? �D�^�#��uQNJŁ5w�Cio?wn�|��?xΞ����W�+X�9���$���_�͢��2�@[FKu|(������ E�v�n?����'��Va�\��4V��0���Jy�ˇʽh���G��صc���r�.�c 3OX�g��fIP��8� |��Ȱ��/��"m�`ͷ����Y����?�AY�{ �B�S�;�����Gw�����ay�߶wT�=2X��w���q�+�e��Sr�(����4�]K�U��02�l��[*�!~�MʎJ)��<�2VȚs�K��'�`g�6\�U��F�z��X,��IgL�w�=�[���Gj!�z�>�@��?��o��%���E��m5��7$�KO6� �9~Q�v��J]�n���t̥{�0��@����������׎�`��=E�����ۢX�q `��S�=͊&)�>�FTN9�<�����b'�m�B�-��גD�ոI�6�KN^t���<��<{Ƅ�x�)촻:��T+9-�J��XiO�O/�������W/0�!=���Z��3֕�'8aNqO	�u/\F��4�jnFԬ�Qf���J���-b[#���D@KVU�ڡ�W��~���sh��� �F�.�U�|y�}��}Av���h��`l�G��ttL|đ_��;l�7I�*�Yʠ76i|�>�&3�Z���Ή������Pft�Фe�~MW�g�C0C�;?r����v!G��*Ts^�hG �  %�Cq|�KzS~��ɈE$����G������:�;��i�������c�e��	�3�~Ů(4��=���y���zf{���G!�F���|�C��H�1S����S��l{=.s��hgt��)J�Lp�[A���bZ.|Wӽ���ڌ��,�u�ZRs�͊��eh}�[N_3hUʈ�bW�5��DlcJ�H�����U�-7h��]�܌��壊�69��S&��$�#qEx��8�\TYx#��ZP���B���CN��oy$3���^�����uaQ�Q�$a�J��,��{h:���O���2�ﷵ5a��\��wew��ڊಷR^�'��#��Z@���$)�`L��%]U߃R���˃����p� B��h'"eF��c��
%K95�jUeJѭ���H>R��/ebB��Ve	Wqf+�k���d�l] �V&0��GtZ�:�v�����{��vW�4����?��p�8�HNɈ_{nfKX�׾�f��GbH˵�����i�����T?m�M���
�`L�6���.�L�I��lK�C':�״�K�)��{��������`��@�j�&_��i_2���N4[%�=B�S�~ê�^���U��[�͞#S��tO/����O���UxX���6������~)0	iȹ2�W�$���!'��UOZ��S�k���[���R�|�@�'�@�oF�6��U�Z����f�sI>K��j��5�-�y���~��F��6�wn�xS;�+����4�~���OŇT}��M��D��/�����B����(9U��+�g�X��-�E��MT��B�����cL��� �g�n�*�v�$޺�2��.F�� �BZF&��>�Ze%'�t�KH���������ԇ�;0_=d���z ��0�/;����`�8��F�2�9��:�#@'�ߎ�H�p�y�ꫫ�;�'��}�XU�㴙/��
d�&_%�G��}��(��܏���Ky���)��7-��WG���M~~˪v��壣 �Rx�|!�v[��_��zI���<���n��#BJ�w	p/Nr|��O;�N���v�i!��=f����]�1�z�9�#��Fq�@�E��V
Z���$B�z�Ȋ�����L_�������L�}D�T��X�sRo�\�c�ϯ�*��i�N��X҈mW��y��j祒�3����ޖ���v�KhY:�2�uZogw�) 4��O����?��W51�7)	�^�k�k����� �4H���J�ґ������9����=N��br7x�d}R&��FZV���JS~Ύ�
�j
�!0�b������5cS�4&Z��J	�V�ٴ^Y�t�$�~��,tz<WV>�k�4�����=�&���pܯ@�Y��c
����3�}���׿w�D����I�#,�nk�H+Z$��N@�:aV�uI�|C�8�O��,�A�T�[�����__����R8� xt�yA������oڍ�qX�jQm� .�ɠ��@ޕy�){	2�M&�P�b���X��;r�+����"�~t�h��A�F�[~q�̹��$�*��YP��D��+�[�0(��������0e��Ͱ���ڳ��-s���5憌��A�mp�sN����i(f6�S��u��s�8�{7�7O����|H����Wv�d�gS�.F����n�S���D�z��e7�һ}ۖû��[ǯi�E~ͣ�50�3.~� �F�VO��ظ����'�I�N����{��8�QǠv����g9̀�v���4���]���,�S�<<ʽ���v�#�Ĭ�rΆ��C�~O����-��[���M@0c��D��<.͗p��ס)�c	�ٚ����I1�c�n����Eɀ-��Խ!�*pRA�V�82U��J�xz��L0pxֿ4�S����%��1[k?ke\c��ڍ�6j��������(������ǔ��T�(�%�w��6́�U?�#���8�����I��Ň6Ǻa��	8
�x34�r#�|c�Vη�]� xP�]�:�?8�2��N�4��ڌ�e|�J[��Ҥ���T���G{�jp�m��a ����O<�Q<�O��,4N�h���<6�H6�|Qޅ���!�Զ@�{fq�2)P�x�[Fwҳ�#θ��1Z�^�)�\�L|�韃%9��<Æ�@��H]����;[���2n����e����,޶�2�C*�j�]Θs�"c?~R�(P^0�]�舱f7���e�����b�D{��&[�+�G�m��*VL�u���U�N�b|�5�r���`��p�qoa!G�\h�2��.0�.}�J�hз�>��S ����y
��VzY�p^`�Ń����/]'�~x�U�&\�1(�%m�^2I��ʗ8/����鋮�v�������������=9=�|���F��w,`Qu�+��������GO�1E�xΣ���v��i��c�D���,ɖ��o�2+�6*}j2��?���H�	��&�$[N�H�0�AJ\O�(��6%��jo��s���Fi�Q8� �O{`FP9v�;ncNN�(��x@���u��i>zg�'"GG� ?�4�$���+��QJ�-��Z�;ତ0�b�.sNF�;�yq(�E�,Q�~��j��LQ9N>�����hi	 A�w��F��x��;t:%�)j�@�(�'�OKĜ�ܝ&|J{qlp{p�TBp1*_�#环�|��z}4*�ls���O���#ƪ�P䎮������S��TN:B�3�����l�9䀼{��+w�i)~1$��&f�s��pl�WC�!em���������_���6��M��9�ߜ�7��	��1�́��0��#G�@qW�������k�s��I	�.�H���q��QQk&	�⿗�?@�i)����`z�z av�̕L�2�cs�������LF���T��L���������e��t���3��G3�~]����J�������Ak8�������p<|�Υ���P3�*�wnu���CnY��G��e�	��|o�'3�5�֦5�z>��Y��ɺȷ_]]�$䷓Ԓ��ģ�2�������_�X�w�ytmԄz%s~�<�G�'#�Ln�h&�W�XV5��e�a���5�b9�|���N�ꉯ�S�~�zVV��%U9\W��/�,�ử�U��ӼQߌ��#��4?`�р�<��N�$�m�hA�c�\�����z'a2�c%UM$$���4�Q_ʟ=È�|(�和���{��&�����/��B�E�~t�j�����_��Wlb;&Ԓ��Wt6��0�% ��*�T�U�{-?�l
�����F�r���kS�����Y�V8��Y�&SVO�bo�5�* �Do�T1Y�\��:;�%���v+��%9!$ ��V�9�wXCl�������M�A�9��ԣ��^�u�B�Zrh��\���s�5o$@5)�s�oϓf>�`
�7UI����K���~r�L�J�.�,��X5+e�o�E��Bz����U�ʫ=�B�b�OѦ�ʿ1���R��&z&:�ߓo��濜���      �   �  x�ř�n�@��û(�0�I��!��	�����ڷ�J�61]Y��`"�s`>�/R��� ��nž�ʢnw�X?���t�,��Sv�O�f���ySLVe\�}�h�m׮�"ħ/�U8.��|���Uq^�]������_����C��E��}����?5ʬ�ˬ�u=H�m�Y��u>,�{:�=Y�Ⱥk��Gj�ۛ�<ˣ
g�-gd�RR�K%^�&��V�����s��M�m%5�����%�!S��fL�j��$d"��H� R)�T�B~�����d��Hȯ��&?~���J�&�0��)����[2nw����ؒ��4:*j�~�Ύ�Gս֯�5������E�@���4T�T�D-Qˀ�2�D-c����ѤP�����e%���H��BzY��"Ը,�-�B����,�-1ˁ�rP�rP�r`�r�k��iE�Wyi     