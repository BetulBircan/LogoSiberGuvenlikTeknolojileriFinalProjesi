PGDMP                         z            dbbooks    14.2    14.2 #               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16511    dbbooks    DATABASE     d   CREATE DATABASE dbbooks WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Turkish_Turkey.1254';
    DROP DATABASE dbbooks;
                postgres    false            �            1259    16560    authors    TABLE     �   CREATE TABLE public.authors (
    author_id integer NOT NULL,
    firstname character varying(255) NOT NULL,
    lastname character varying(255) NOT NULL,
    category_id integer
);
    DROP TABLE public.authors;
       public         heap    postgres    false            �            1259    16559    authors_author_id_seq    SEQUENCE     �   CREATE SEQUENCE public.authors_author_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.authors_author_id_seq;
       public          postgres    false    212                       0    0    authors_author_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.authors_author_id_seq OWNED BY public.authors.author_id;
          public          postgres    false    211            �            1259    16574    books    TABLE       CREATE TABLE public.books (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    price integer NOT NULL,
    pagecount integer,
    category_id integer,
    author_id integer,
    publisher character varying(255),
    imageurl character varying(2048)
);
    DROP TABLE public.books;
       public         heap    postgres    false            �            1259    16573    books_id_seq    SEQUENCE     �   CREATE SEQUENCE public.books_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.books_id_seq;
       public          postgres    false    214                       0    0    books_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.books_id_seq OWNED BY public.books.id;
          public          postgres    false    213            �            1259    16553 
   categories    TABLE     o   CREATE TABLE public.categories (
    category_id integer NOT NULL,
    name character varying(255) NOT NULL
);
    DROP TABLE public.categories;
       public         heap    postgres    false            �            1259    16552    categories_category_id_seq    SEQUENCE     �   CREATE SEQUENCE public.categories_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.categories_category_id_seq;
       public          postgres    false    210                       0    0    categories_category_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.categories_category_id_seq OWNED BY public.categories.category_id;
          public          postgres    false    209            �            1259    16614    yenicikanlar    TABLE     @  CREATE TABLE public.yenicikanlar (
    book_id integer NOT NULL,
    name character varying(255) NOT NULL,
    price integer NOT NULL,
    pagecount integer NOT NULL,
    category_id integer NOT NULL,
    author_id integer NOT NULL,
    publisher character varying(255) NOT NULL,
    imageurl character varying(2048)
);
     DROP TABLE public.yenicikanlar;
       public         heap    postgres    false            �            1259    16613    yenicikanlar_book_id_seq    SEQUENCE     �   CREATE SEQUENCE public.yenicikanlar_book_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.yenicikanlar_book_id_seq;
       public          postgres    false    216                       0    0    yenicikanlar_book_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.yenicikanlar_book_id_seq OWNED BY public.yenicikanlar.book_id;
          public          postgres    false    215            l           2604    16563    authors author_id    DEFAULT     v   ALTER TABLE ONLY public.authors ALTER COLUMN author_id SET DEFAULT nextval('public.authors_author_id_seq'::regclass);
 @   ALTER TABLE public.authors ALTER COLUMN author_id DROP DEFAULT;
       public          postgres    false    211    212    212            m           2604    16577    books id    DEFAULT     d   ALTER TABLE ONLY public.books ALTER COLUMN id SET DEFAULT nextval('public.books_id_seq'::regclass);
 7   ALTER TABLE public.books ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    214    213    214            k           2604    16556    categories category_id    DEFAULT     �   ALTER TABLE ONLY public.categories ALTER COLUMN category_id SET DEFAULT nextval('public.categories_category_id_seq'::regclass);
 E   ALTER TABLE public.categories ALTER COLUMN category_id DROP DEFAULT;
       public          postgres    false    210    209    210            n           2604    16617    yenicikanlar book_id    DEFAULT     |   ALTER TABLE ONLY public.yenicikanlar ALTER COLUMN book_id SET DEFAULT nextval('public.yenicikanlar_book_id_seq'::regclass);
 C   ALTER TABLE public.yenicikanlar ALTER COLUMN book_id DROP DEFAULT;
       public          postgres    false    216    215    216                      0    16560    authors 
   TABLE DATA           N   COPY public.authors (author_id, firstname, lastname, category_id) FROM stdin;
    public          postgres    false    212   �'       
          0    16574    books 
   TABLE DATA           h   COPY public.books (id, name, price, pagecount, category_id, author_id, publisher, imageurl) FROM stdin;
    public          postgres    false    214   M-                 0    16553 
   categories 
   TABLE DATA           7   COPY public.categories (category_id, name) FROM stdin;
    public          postgres    false    210   �/                 0    16614    yenicikanlar 
   TABLE DATA           t   COPY public.yenicikanlar (book_id, name, price, pagecount, category_id, author_id, publisher, imageurl) FROM stdin;
    public          postgres    false    216   l0                  0    0    authors_author_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.authors_author_id_seq', 103, true);
          public          postgres    false    211                       0    0    books_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.books_id_seq', 15, true);
          public          postgres    false    213                       0    0    categories_category_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.categories_category_id_seq', 11, true);
          public          postgres    false    209                       0    0    yenicikanlar_book_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.yenicikanlar_book_id_seq', 3, true);
          public          postgres    false    215            r           2606    16567    authors authors_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.authors
    ADD CONSTRAINT authors_pkey PRIMARY KEY (author_id);
 >   ALTER TABLE ONLY public.authors DROP CONSTRAINT authors_pkey;
       public            postgres    false    212            t           2606    16579    books books_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.books DROP CONSTRAINT books_pkey;
       public            postgres    false    214            p           2606    16558    categories categories_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (category_id);
 D   ALTER TABLE ONLY public.categories DROP CONSTRAINT categories_pkey;
       public            postgres    false    210            v           2606    16621    yenicikanlar yenicikanlar_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.yenicikanlar
    ADD CONSTRAINT yenicikanlar_pkey PRIMARY KEY (book_id);
 H   ALTER TABLE ONLY public.yenicikanlar DROP CONSTRAINT yenicikanlar_pkey;
       public            postgres    false    216            w           2606    16568     authors authors_category_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.authors
    ADD CONSTRAINT authors_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.categories(category_id);
 J   ALTER TABLE ONLY public.authors DROP CONSTRAINT authors_category_id_fkey;
       public          postgres    false    3184    210    212            y           2606    16585    books books_author_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_author_id_fkey FOREIGN KEY (author_id) REFERENCES public.authors(author_id);
 D   ALTER TABLE ONLY public.books DROP CONSTRAINT books_author_id_fkey;
       public          postgres    false    3186    212    214            x           2606    16580    books books_category_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.categories(category_id);
 F   ALTER TABLE ONLY public.books DROP CONSTRAINT books_category_id_fkey;
       public          postgres    false    3184    214    210               >  x�mV=s�F��eRXC�%��1EE#)�ؓfI�w��A2��\e���.l\����T
O�H�ۻ��}o�)��zoJ啥�*�M�[6;�<���Q�ny���-M��$�ѵ�p�Y1���[�\mix����3�t�E��{Ho�����_�97�n�B#�Q B|Uy-eؠr��Dc�RK�����5���z�d���.��*X�$�aj�6r6��?��t��Z��M(8�G{t��niƫ\.���[EӪ�M4��K��SW�Q�e.]H�X�����ԵGt���\�mƹ*{%�1�>�M�yZ\
8�K�Hw�HR ���B���^�����I�_*s��u�4�
◯���]�?�>�z4��!�/�t]�����O�c���yUh�=����37��4��	m9Ξ�g���&؈�9��>��N ��^*�1FyA&X�΁�f��E�](��
�xR��е�~9[���*hlh�z��b43S��+�¶\fJ���R(_��s�p����2�3p��� � ��ͮ����|����n!��F8BD3c�c�(���g�@�?rYTnv�=�~��J�t�- U�����sP���?>���V��ʦ���R�t�6r�Ld.Ȑn�ԙ���f��`��>�{g6V�쏑��S���'�"���E��?����n��A\e:�O@�,$?�6 hm�!c:ɼ.�nW����B��L�O�M=�w���&� �.0f�v�P��?�[�A&7�@J�j�"��ф��\��5�i&t����^�����L�a��M7�V��ږ%��� ���:�j���K8_�������4* ����(1� ZM�4��{�
U"�Y�Srtst#��kծ���'sH<�a��Uq�(�emÛ�O�C�E�*����+�U��SN���r�(��xO�-��uA�����p��2��G���x����c�f�Gf��*�{�R�!���`�� lܲ,�\r|�l8$���y�a��,}�/)o(����")� 4�3����%�m���j�?+��60}D��E�_=
P��W"���
��
F��/G�[��F��ؙO����y����B�m#�� �I���r[�, �3#b���N0r2g�l�l�t�՘O��2'�l���������m��H�f����&�`=�GC<V̑���̡i�s�����R��N4�C���+v�}{G4�LN-�A6�VG�Zn���,pa�I�#v���y#k�UeG��.���&�f��G�'�B=!W�(�GQ�U��F      
   T  x����j�P��g����ǫ�tنR�@�M�Pn�f�V��%q�˺̶n��N�z4%ʴ$"�����|G��Rm3��L;�5�,!X��V�@��3S�>�:w�d3t&�l�R�r�`.�X���l�T�90zB1���2u>JS��kR#! R��p%wC�K��??t���]�����[��;��o4���s��E��%I���x�p�"B}��e��4w���ܹ�һ�s��n�������	"�B��C���Re�suhK��O$a?ֶ��L�A��V�[᜽l+��ȑ��	�5+6Ee�s'�ԉ����:��D��9�PM-����5����Vj�=q7��"�{kb�|��źQκZ{h-�%0�O��(Q{Iy�x�H�4$����h#�����.��0���F��؊ ".��?\��}7�O.f���CW���Y��m�a�C�8�J�1���g)�L�.se�}�_%gj3�ї�^�z;&� ����=N�1JUqSOS���-V�o�5�'\�}��LD�������w��.���I���%u���r��:
ou�\*t0�i�OE.�� ���\]�(��I�o�X�P�         �   x�U�=�@F�S�4���F���3$$f���,�a��x� g�e����ާ�q*-y�C(ߗ86��f�%. `��Ƹ��IQ��.���2�e\�^��*l꼙d=9/n��M�B��0T�n7G-՗�m=ז=� �����A�8�3�����L�G�e#�XL����CJn         1  x�m��n�0Dk�� ^lw��J��\�D�����N�U�>]�����$R��ّ�h�'7���}��^ä4�\~��$�0FX���p�v�a1��j�-Qrrn�� �˅�[BMM#��&��v5��~���[�FITa��h0uĲ$�E����4'�l��֫ǆg��-}�#I��z
r����:V����V���8d  Ic!��cg�ť�c�,�)Iy|Cp���u����`�݌JKۿ��6jv�,����0�j����FO�}��Q��bo� i���A�	P|�i     