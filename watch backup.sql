PGDMP                      |            Project     16.2    16.2     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    25073    Project     DATABASE     �   CREATE DATABASE "Project " WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE "Project ";
                postgres    false            �            1259    25214    cust_region    TABLE     �   CREATE TABLE public.cust_region (
    pincode integer,
    city character varying(150),
    state character varying(150),
    region character varying(150)
);
    DROP TABLE public.cust_region;
       public         heap    postgres    false            �            1259    25188    customer    TABLE       CREATE TABLE public.customer (
    cust_id integer NOT NULL,
    cust_name character varying(150),
    gender character varying(100),
    state character varying(150),
    city character varying(150),
    pincode integer,
    region character varying(150),
    watch_specs_id integer
);
    DROP TABLE public.customer;
       public         heap    postgres    false            �            1259    25187    customer_cust_id_seq    SEQUENCE     �   CREATE SEQUENCE public.customer_cust_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.customer_cust_id_seq;
       public          postgres    false    218            �           0    0    customer_cust_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.customer_cust_id_seq OWNED BY public.customer.cust_id;
          public          postgres    false    217            �            1259    25202    watch    TABLE     �   CREATE TABLE public.watch (
    product_id integer NOT NULL,
    brand character varying(150),
    product_name character varying(150),
    price integer,
    weight integer,
    stock integer,
    watch_specs_id integer
);
    DROP TABLE public.watch;
       public         heap    postgres    false            �            1259    25201    watch_product_id_seq    SEQUENCE     �   CREATE SEQUENCE public.watch_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.watch_product_id_seq;
       public          postgres    false    220            �           0    0    watch_product_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.watch_product_id_seq OWNED BY public.watch.product_id;
          public          postgres    false    219            �            1259    25163    watch_specs    TABLE       CREATE TABLE public.watch_specs (
    watch_specs_id integer NOT NULL,
    brand character varying(150),
    gender_type character varying(150),
    movement_type character varying(150),
    case_material character varying(150),
    crystal_material character varying(150)
);
    DROP TABLE public.watch_specs;
       public         heap    postgres    false            �            1259    25162    watch_specs_watch_specs_id_seq    SEQUENCE     �   CREATE SEQUENCE public.watch_specs_watch_specs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.watch_specs_watch_specs_id_seq;
       public          postgres    false    216            �           0    0    watch_specs_watch_specs_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.watch_specs_watch_specs_id_seq OWNED BY public.watch_specs.watch_specs_id;
          public          postgres    false    215            )           2604    25191    customer cust_id    DEFAULT     t   ALTER TABLE ONLY public.customer ALTER COLUMN cust_id SET DEFAULT nextval('public.customer_cust_id_seq'::regclass);
 ?   ALTER TABLE public.customer ALTER COLUMN cust_id DROP DEFAULT;
       public          postgres    false    217    218    218            *           2604    25205    watch product_id    DEFAULT     t   ALTER TABLE ONLY public.watch ALTER COLUMN product_id SET DEFAULT nextval('public.watch_product_id_seq'::regclass);
 ?   ALTER TABLE public.watch ALTER COLUMN product_id DROP DEFAULT;
       public          postgres    false    220    219    220            (           2604    25166    watch_specs watch_specs_id    DEFAULT     �   ALTER TABLE ONLY public.watch_specs ALTER COLUMN watch_specs_id SET DEFAULT nextval('public.watch_specs_watch_specs_id_seq'::regclass);
 I   ALTER TABLE public.watch_specs ALTER COLUMN watch_specs_id DROP DEFAULT;
       public          postgres    false    215    216    216            �          0    25214    cust_region 
   TABLE DATA           C   COPY public.cust_region (pincode, city, state, region) FROM stdin;
    public          postgres    false    221   �!       �          0    25188    customer 
   TABLE DATA           l   COPY public.customer (cust_id, cust_name, gender, state, city, pincode, region, watch_specs_id) FROM stdin;
    public          postgres    false    218   "#       �          0    25202    watch 
   TABLE DATA           f   COPY public.watch (product_id, brand, product_name, price, weight, stock, watch_specs_id) FROM stdin;
    public          postgres    false    220   s%       �          0    25163    watch_specs 
   TABLE DATA           y   COPY public.watch_specs (watch_specs_id, brand, gender_type, movement_type, case_material, crystal_material) FROM stdin;
    public          postgres    false    216   c&       �           0    0    customer_cust_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.customer_cust_id_seq', 20, true);
          public          postgres    false    217            �           0    0    watch_product_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.watch_product_id_seq', 11, true);
          public          postgres    false    219            �           0    0    watch_specs_watch_specs_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.watch_specs_watch_specs_id_seq', 5, true);
          public          postgres    false    215            .           2606    25195    customer customer_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (cust_id);
 @   ALTER TABLE ONLY public.customer DROP CONSTRAINT customer_pkey;
       public            postgres    false    218            0           2606    25207    watch watch_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.watch
    ADD CONSTRAINT watch_pkey PRIMARY KEY (product_id);
 :   ALTER TABLE ONLY public.watch DROP CONSTRAINT watch_pkey;
       public            postgres    false    220            ,           2606    25170    watch_specs watch_specs_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.watch_specs
    ADD CONSTRAINT watch_specs_pkey PRIMARY KEY (watch_specs_id);
 F   ALTER TABLE ONLY public.watch_specs DROP CONSTRAINT watch_specs_pkey;
       public            postgres    false    216            1           2606    25196 %   customer customer_watch_specs_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_watch_specs_id_fkey FOREIGN KEY (watch_specs_id) REFERENCES public.watch_specs(watch_specs_id);
 O   ALTER TABLE ONLY public.customer DROP CONSTRAINT customer_watch_specs_id_fkey;
       public          postgres    false    216    4652    218            2           2606    25208    watch watch_watch_specs_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.watch
    ADD CONSTRAINT watch_watch_specs_id_fkey FOREIGN KEY (watch_specs_id) REFERENCES public.watch_specs(watch_specs_id);
 I   ALTER TABLE ONLY public.watch DROP CONSTRAINT watch_watch_specs_id_fkey;
       public          postgres    false    216    220    4652            �   )  x�m��N�@���O�'0��.$j��o&�i���!���ۻ�h����sv�7g�$I*���3ݠB+栨f�	�m�g�
��;�}<���7�;p���{�m�Zl��Xs���<O��LВX*6T�E)��)�IhX<(E��:ku��ӑ��/hIV�X9ΜgJ�����	/F��8��J��`H75����ӑ�{��5(N�f�\�f�i���\6���@{��&ƣD���擔�!�"��˝�ЄH7wH�@��b�.�3'k�,�>��[�? _��_ѽ� [~^~2 {���ME߶G�X      �   A  x�m��n�0���O�'X�NH��B�]T�UA�*��41dT�FN��>�N�bB�WD��s�s�`�k'�����Z������r�ƚ&I�(x1mJhX�3r�PWÝi��G�!_}x�rF�Կ�[�:-R�Z*��'�ޝK��7�p��mǇE�W���{k����7���~w����A��x9#�ՁZ�`>�������ϩĭ�<������^�H�pې=�9���>+t�.�+�-=L2u��E�m���/d{5ˋ�9Z�?�H��R1��i[�C���*��Ί��EWyH�8V)1�~�J.1t�̟/�V�@n�!c+�uq%N%<�9ژ�>V&�G�n��Z*�g�R��v]ֵ͗ovQ�4s2u��%J�?��Fyo�cI����S6���q1�Nq8\x�w%��r{����<V���,/l>�D:��3�@���d�%�j�`s����\T�<���&0�<�'4�g��웆�&����q�I��h��*�vv򄤇9�G��S�����Y�߻���,�|��OS��|&�ɴ�N��"+�N�O�r5|��	�rx�=�py����ܷT:�˯oB��|�S       �   �   x�m��N�0E�w�� �Y�uQ�D�l��jM�Ů��8iXղW����H|�.����z?�!�����Ǘ��p�h��}.�)W�4�>Ǆ�c{J�3g��
h2<�	�c��`ŜHC��s��zݍ��в@��e�f��,�n�/�Z��k�ԯa���?-���b�j�$���p��7a̤���X�/aF�i��|�i��!�TK��}��Ԫ)�|"�?�^<      �   �   x�]�;�0D��)8� P� �c�hV�*Y��#ۑ�Ǒ��j���f��W~�$e���;JR�&���&f���o%����qC(��Bza�F)��Y`CQ<nNb&o��D��Rџ4KX���7_s���aO����
��Q��,�js���Sj9����1�<F+     