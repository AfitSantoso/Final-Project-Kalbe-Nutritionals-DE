PGDMP     /    9    	        	    {            KALBE    15.4    15.4 3    1           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            2           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            3           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            4           1262    16470    KALBE    DATABASE     �   CREATE DATABASE "KALBE" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE "KALBE";
                postgres    false            �            1259    16493    customer_dimension    TABLE     �   CREATE TABLE public.customer_dimension (
    customer_id integer NOT NULL,
    customer_name character varying(255),
    address character varying(255),
    phone_number character varying(15)
);
 &   DROP TABLE public.customer_dimension;
       public         heap    postgres    false            �            1259    16492 "   customer_dimension_customer_id_seq    SEQUENCE     �   CREATE SEQUENCE public.customer_dimension_customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.customer_dimension_customer_id_seq;
       public          postgres    false    221            5           0    0 "   customer_dimension_customer_id_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public.customer_dimension_customer_id_seq OWNED BY public.customer_dimension.customer_id;
          public          postgres    false    220            �            1259    16472    date_dimension    TABLE     �   CREATE TABLE public.date_dimension (
    date_id integer NOT NULL,
    date date,
    day integer,
    month integer,
    year integer
);
 "   DROP TABLE public.date_dimension;
       public         heap    postgres    false            �            1259    16471    date_dimension_date_id_seq    SEQUENCE     �   CREATE SEQUENCE public.date_dimension_date_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.date_dimension_date_id_seq;
       public          postgres    false    215            6           0    0    date_dimension_date_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.date_dimension_date_id_seq OWNED BY public.date_dimension.date_id;
          public          postgres    false    214            �            1259    16502    employee_dimension    TABLE     �   CREATE TABLE public.employee_dimension (
    employee_id integer NOT NULL,
    employee_name character varying(255),
    "position" character varying(100)
);
 &   DROP TABLE public.employee_dimension;
       public         heap    postgres    false            �            1259    16501 "   employee_dimension_employee_id_seq    SEQUENCE     �   CREATE SEQUENCE public.employee_dimension_employee_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.employee_dimension_employee_id_seq;
       public          postgres    false    223            7           0    0 "   employee_dimension_employee_id_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public.employee_dimension_employee_id_seq OWNED BY public.employee_dimension.employee_id;
          public          postgres    false    222            �            1259    16479    product_dimension    TABLE     �   CREATE TABLE public.product_dimension (
    product_id integer NOT NULL,
    product_name character varying(255),
    category character varying(50)
);
 %   DROP TABLE public.product_dimension;
       public         heap    postgres    false            �            1259    16478     product_dimension_product_id_seq    SEQUENCE     �   CREATE SEQUENCE public.product_dimension_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.product_dimension_product_id_seq;
       public          postgres    false    217            8           0    0     product_dimension_product_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.product_dimension_product_id_seq OWNED BY public.product_dimension.product_id;
          public          postgres    false    216            �            1259    16509 
   sales_fact    TABLE       CREATE TABLE public.sales_fact (
    sales_id integer NOT NULL,
    date_id integer NOT NULL,
    product_id integer NOT NULL,
    store_id integer NOT NULL,
    quantity integer,
    revenue numeric(10,2),
    customer_id integer NOT NULL,
    employee_id integer NOT NULL
);
    DROP TABLE public.sales_fact;
       public         heap    postgres    false            �            1259    16508    sales_fact_sales_id_seq    SEQUENCE     �   CREATE SEQUENCE public.sales_fact_sales_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.sales_fact_sales_id_seq;
       public          postgres    false    225            9           0    0    sales_fact_sales_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.sales_fact_sales_id_seq OWNED BY public.sales_fact.sales_id;
          public          postgres    false    224            �            1259    16486    store_dimension    TABLE     �   CREATE TABLE public.store_dimension (
    store_id integer NOT NULL,
    store_name character varying(255),
    city character varying(100)
);
 #   DROP TABLE public.store_dimension;
       public         heap    postgres    false            �            1259    16485    store_dimension_store_id_seq    SEQUENCE     �   CREATE SEQUENCE public.store_dimension_store_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.store_dimension_store_id_seq;
       public          postgres    false    219            :           0    0    store_dimension_store_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.store_dimension_store_id_seq OWNED BY public.store_dimension.store_id;
          public          postgres    false    218            �           2604    16496    customer_dimension customer_id    DEFAULT     �   ALTER TABLE ONLY public.customer_dimension ALTER COLUMN customer_id SET DEFAULT nextval('public.customer_dimension_customer_id_seq'::regclass);
 M   ALTER TABLE public.customer_dimension ALTER COLUMN customer_id DROP DEFAULT;
       public          postgres    false    220    221    221            ~           2604    16475    date_dimension date_id    DEFAULT     �   ALTER TABLE ONLY public.date_dimension ALTER COLUMN date_id SET DEFAULT nextval('public.date_dimension_date_id_seq'::regclass);
 E   ALTER TABLE public.date_dimension ALTER COLUMN date_id DROP DEFAULT;
       public          postgres    false    215    214    215            �           2604    16505    employee_dimension employee_id    DEFAULT     �   ALTER TABLE ONLY public.employee_dimension ALTER COLUMN employee_id SET DEFAULT nextval('public.employee_dimension_employee_id_seq'::regclass);
 M   ALTER TABLE public.employee_dimension ALTER COLUMN employee_id DROP DEFAULT;
       public          postgres    false    223    222    223                       2604    16482    product_dimension product_id    DEFAULT     �   ALTER TABLE ONLY public.product_dimension ALTER COLUMN product_id SET DEFAULT nextval('public.product_dimension_product_id_seq'::regclass);
 K   ALTER TABLE public.product_dimension ALTER COLUMN product_id DROP DEFAULT;
       public          postgres    false    216    217    217            �           2604    16512    sales_fact sales_id    DEFAULT     z   ALTER TABLE ONLY public.sales_fact ALTER COLUMN sales_id SET DEFAULT nextval('public.sales_fact_sales_id_seq'::regclass);
 B   ALTER TABLE public.sales_fact ALTER COLUMN sales_id DROP DEFAULT;
       public          postgres    false    225    224    225            �           2604    16489    store_dimension store_id    DEFAULT     �   ALTER TABLE ONLY public.store_dimension ALTER COLUMN store_id SET DEFAULT nextval('public.store_dimension_store_id_seq'::regclass);
 G   ALTER TABLE public.store_dimension ALTER COLUMN store_id DROP DEFAULT;
       public          postgres    false    218    219    219            *          0    16493    customer_dimension 
   TABLE DATA           _   COPY public.customer_dimension (customer_id, customer_name, address, phone_number) FROM stdin;
    public          postgres    false    221   �=       $          0    16472    date_dimension 
   TABLE DATA           I   COPY public.date_dimension (date_id, date, day, month, year) FROM stdin;
    public          postgres    false    215   >       ,          0    16502    employee_dimension 
   TABLE DATA           T   COPY public.employee_dimension (employee_id, employee_name, "position") FROM stdin;
    public          postgres    false    223   4>       &          0    16479    product_dimension 
   TABLE DATA           O   COPY public.product_dimension (product_id, product_name, category) FROM stdin;
    public          postgres    false    217   Q>       .          0    16509 
   sales_fact 
   TABLE DATA           z   COPY public.sales_fact (sales_id, date_id, product_id, store_id, quantity, revenue, customer_id, employee_id) FROM stdin;
    public          postgres    false    225   n>       (          0    16486    store_dimension 
   TABLE DATA           E   COPY public.store_dimension (store_id, store_name, city) FROM stdin;
    public          postgres    false    219   �>       ;           0    0 "   customer_dimension_customer_id_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.customer_dimension_customer_id_seq', 1, false);
          public          postgres    false    220            <           0    0    date_dimension_date_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.date_dimension_date_id_seq', 1, false);
          public          postgres    false    214            =           0    0 "   employee_dimension_employee_id_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.employee_dimension_employee_id_seq', 1, false);
          public          postgres    false    222            >           0    0     product_dimension_product_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.product_dimension_product_id_seq', 1, false);
          public          postgres    false    216            ?           0    0    sales_fact_sales_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.sales_fact_sales_id_seq', 1, false);
          public          postgres    false    224            @           0    0    store_dimension_store_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.store_dimension_store_id_seq', 1, false);
          public          postgres    false    218            �           2606    16500 *   customer_dimension customer_dimension_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public.customer_dimension
    ADD CONSTRAINT customer_dimension_pkey PRIMARY KEY (customer_id);
 T   ALTER TABLE ONLY public.customer_dimension DROP CONSTRAINT customer_dimension_pkey;
       public            postgres    false    221            �           2606    16477 "   date_dimension date_dimension_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.date_dimension
    ADD CONSTRAINT date_dimension_pkey PRIMARY KEY (date_id);
 L   ALTER TABLE ONLY public.date_dimension DROP CONSTRAINT date_dimension_pkey;
       public            postgres    false    215            �           2606    16507 *   employee_dimension employee_dimension_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public.employee_dimension
    ADD CONSTRAINT employee_dimension_pkey PRIMARY KEY (employee_id);
 T   ALTER TABLE ONLY public.employee_dimension DROP CONSTRAINT employee_dimension_pkey;
       public            postgres    false    223            �           2606    16484 (   product_dimension product_dimension_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.product_dimension
    ADD CONSTRAINT product_dimension_pkey PRIMARY KEY (product_id);
 R   ALTER TABLE ONLY public.product_dimension DROP CONSTRAINT product_dimension_pkey;
       public            postgres    false    217            �           2606    16514    sales_fact sales_fact_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.sales_fact
    ADD CONSTRAINT sales_fact_pkey PRIMARY KEY (sales_id);
 D   ALTER TABLE ONLY public.sales_fact DROP CONSTRAINT sales_fact_pkey;
       public            postgres    false    225            �           2606    16491 $   store_dimension store_dimension_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.store_dimension
    ADD CONSTRAINT store_dimension_pkey PRIMARY KEY (store_id);
 N   ALTER TABLE ONLY public.store_dimension DROP CONSTRAINT store_dimension_pkey;
       public            postgres    false    219            �           2606    16530    sales_fact fk_customer_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.sales_fact
    ADD CONSTRAINT fk_customer_id FOREIGN KEY (customer_id) REFERENCES public.customer_dimension(customer_id);
 C   ALTER TABLE ONLY public.sales_fact DROP CONSTRAINT fk_customer_id;
       public          postgres    false    3211    225    221            �           2606    16515    sales_fact fk_date_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.sales_fact
    ADD CONSTRAINT fk_date_id FOREIGN KEY (date_id) REFERENCES public.date_dimension(date_id);
 ?   ALTER TABLE ONLY public.sales_fact DROP CONSTRAINT fk_date_id;
       public          postgres    false    3205    215    225            �           2606    16535    sales_fact fk_employee_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.sales_fact
    ADD CONSTRAINT fk_employee_id FOREIGN KEY (employee_id) REFERENCES public.employee_dimension(employee_id);
 C   ALTER TABLE ONLY public.sales_fact DROP CONSTRAINT fk_employee_id;
       public          postgres    false    223    225    3213            �           2606    16520    sales_fact fk_product_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.sales_fact
    ADD CONSTRAINT fk_product_id FOREIGN KEY (product_id) REFERENCES public.product_dimension(product_id);
 B   ALTER TABLE ONLY public.sales_fact DROP CONSTRAINT fk_product_id;
       public          postgres    false    225    3207    217            �           2606    16525    sales_fact fk_store_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.sales_fact
    ADD CONSTRAINT fk_store_id FOREIGN KEY (store_id) REFERENCES public.store_dimension(store_id);
 @   ALTER TABLE ONLY public.sales_fact DROP CONSTRAINT fk_store_id;
       public          postgres    false    3209    219    225            *      x������ � �      $      x������ � �      ,      x������ � �      &      x������ � �      .      x������ � �      (      x������ � �     