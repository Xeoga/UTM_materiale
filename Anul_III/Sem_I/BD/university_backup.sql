PGDMP     3    -        	    	    {        
   university    15.4    15.4 3    7
           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            8
           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            9
           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            :
           1262    16409 
   university    DATABASE     �   CREATE DATABASE university WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE university;
                postgres    false            �            1259    16410 
   discipline    TABLE     �   CREATE TABLE public.discipline (
    id_disciplina integer NOT NULL,
    disciplina character varying(100),
    nr_ore_plan_disciplina integer
);
    DROP TABLE public.discipline;
       public         heap    postgres    false            �            1259    16413    discipline_id_disciplina_seq    SEQUENCE     �   CREATE SEQUENCE public.discipline_id_disciplina_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.discipline_id_disciplina_seq;
       public          postgres    false    214            ;
           0    0    discipline_id_disciplina_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.discipline_id_disciplina_seq OWNED BY public.discipline.id_disciplina;
          public          postgres    false    215            �            1259    16414    grupe    TABLE     �   CREATE TABLE public.grupe (
    id_grupa integer NOT NULL,
    specialitatea character varying(100),
    facultatea character varying(100),
    cod_grupa integer,
    sef_grupa integer,
    prof_indrumator integer
);
    DROP TABLE public.grupe;
       public         heap    postgres    false            �            1259    16417    grupe_id_grupa_seq    SEQUENCE     �   CREATE SEQUENCE public.grupe_id_grupa_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.grupe_id_grupa_seq;
       public          postgres    false    216            <
           0    0    grupe_id_grupa_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.grupe_id_grupa_seq OWNED BY public.grupe.id_grupa;
          public          postgres    false    217            �            1259    16481    orarul    TABLE       CREATE TABLE public.orarul (
    id_disciplina integer NOT NULL,
    id_profesor integer,
    id_grupa smallint NOT NULL,
    zi character(2) NOT NULL,
    ora time without time zone NOT NULL,
    auditoriu integer NOT NULL,
    bloc character(1) DEFAULT 'B'::bpchar NOT NULL
);
    DROP TABLE public.orarul;
       public         heap    postgres    false            �            1259    16418 	   profesori    TABLE     �   CREATE TABLE public.profesori (
    id_profesor integer NOT NULL,
    nume_profesor character varying(50),
    prenume_profesor character varying(50),
    adresa_postala_profesor character varying(200)
);
    DROP TABLE public.profesori;
       public         heap    postgres    false            �            1259    16421    profesori_id_profesor_seq    SEQUENCE     �   CREATE SEQUENCE public.profesori_id_profesor_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.profesori_id_profesor_seq;
       public          postgres    false    218            =
           0    0    profesori_id_profesor_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.profesori_id_profesor_seq OWNED BY public.profesori.id_profesor;
          public          postgres    false    219            �            1259    16474 
   profesori_new    TABLE     ?  CREATE TABLE public.profesori_new (
    id_profesor integer NOT NULL,
    nume_profesor character varying(60),
    prenume_profesor character varying(60),
    localitate character varying(60) DEFAULT 'mun. Chisinau'::character varying NOT NULL,
    adresa_1 character varying(60),
    adresa_2 character varying(60)
);
 !   DROP TABLE public.profesori_new;
       public         heap    postgres    false            �            1259    16473    profesori_new_id_profesor_seq    SEQUENCE     �   CREATE SEQUENCE public.profesori_new_id_profesor_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.profesori_new_id_profesor_seq;
       public          postgres    false    224            >
           0    0    profesori_new_id_profesor_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.profesori_new_id_profesor_seq OWNED BY public.profesori_new.id_profesor;
          public          postgres    false    223            �            1259    16422    studenti    TABLE     �   CREATE TABLE public.studenti (
    id_student integer NOT NULL,
    nume_student character varying(50),
    prenume_student character varying(50),
    data_nasterii_student date,
    adresa_postala_student character varying(200)
);
    DROP TABLE public.studenti;
       public         heap    postgres    false            �            1259    16425    studenti_id_student_seq    SEQUENCE     �   CREATE SEQUENCE public.studenti_id_student_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.studenti_id_student_seq;
       public          postgres    false    220            ?
           0    0    studenti_id_student_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.studenti_id_student_seq OWNED BY public.studenti.id_student;
          public          postgres    false    221            �            1259    16426    studenti_reusita    TABLE     �   CREATE TABLE public.studenti_reusita (
    id_student integer,
    id_disciplina integer,
    id_profesor integer,
    id_grupa integer,
    tip_evaluare character varying(50),
    nota integer,
    data_evaluare date
);
 $   DROP TABLE public.studenti_reusita;
       public         heap    postgres    false            �           2604    16429    discipline id_disciplina    DEFAULT     �   ALTER TABLE ONLY public.discipline ALTER COLUMN id_disciplina SET DEFAULT nextval('public.discipline_id_disciplina_seq'::regclass);
 G   ALTER TABLE public.discipline ALTER COLUMN id_disciplina DROP DEFAULT;
       public          postgres    false    215    214            �           2604    16430    grupe id_grupa    DEFAULT     p   ALTER TABLE ONLY public.grupe ALTER COLUMN id_grupa SET DEFAULT nextval('public.grupe_id_grupa_seq'::regclass);
 =   ALTER TABLE public.grupe ALTER COLUMN id_grupa DROP DEFAULT;
       public          postgres    false    217    216            �           2604    16431    profesori id_profesor    DEFAULT     ~   ALTER TABLE ONLY public.profesori ALTER COLUMN id_profesor SET DEFAULT nextval('public.profesori_id_profesor_seq'::regclass);
 D   ALTER TABLE public.profesori ALTER COLUMN id_profesor DROP DEFAULT;
       public          postgres    false    219    218            �           2604    16477    profesori_new id_profesor    DEFAULT     �   ALTER TABLE ONLY public.profesori_new ALTER COLUMN id_profesor SET DEFAULT nextval('public.profesori_new_id_profesor_seq'::regclass);
 H   ALTER TABLE public.profesori_new ALTER COLUMN id_profesor DROP DEFAULT;
       public          postgres    false    223    224    224            �           2604    16432    studenti id_student    DEFAULT     z   ALTER TABLE ONLY public.studenti ALTER COLUMN id_student SET DEFAULT nextval('public.studenti_id_student_seq'::regclass);
 B   ALTER TABLE public.studenti ALTER COLUMN id_student DROP DEFAULT;
       public          postgres    false    221    220            )
          0    16410 
   discipline 
   TABLE DATA           W   COPY public.discipline (id_disciplina, disciplina, nr_ore_plan_disciplina) FROM stdin;
    public          postgres    false    214   �>       +
          0    16414    grupe 
   TABLE DATA           k   COPY public.grupe (id_grupa, specialitatea, facultatea, cod_grupa, sef_grupa, prof_indrumator) FROM stdin;
    public          postgres    false    216   �?       4
          0    16481    orarul 
   TABLE DATA           `   COPY public.orarul (id_disciplina, id_profesor, id_grupa, zi, ora, auditoriu, bloc) FROM stdin;
    public          postgres    false    225   �B       -
          0    16418 	   profesori 
   TABLE DATA           j   COPY public.profesori (id_profesor, nume_profesor, prenume_profesor, adresa_postala_profesor) FROM stdin;
    public          postgres    false    218   �B       3
          0    16474 
   profesori_new 
   TABLE DATA           u   COPY public.profesori_new (id_profesor, nume_profesor, prenume_profesor, localitate, adresa_1, adresa_2) FROM stdin;
    public          postgres    false    224   �E       /
          0    16422    studenti 
   TABLE DATA           |   COPY public.studenti (id_student, nume_student, prenume_student, data_nasterii_student, adresa_postala_student) FROM stdin;
    public          postgres    false    220   �G       1
          0    16426    studenti_reusita 
   TABLE DATA              COPY public.studenti_reusita (id_student, id_disciplina, id_profesor, id_grupa, tip_evaluare, nota, data_evaluare) FROM stdin;
    public          postgres    false    222   
R       @
           0    0    discipline_id_disciplina_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.discipline_id_disciplina_seq', 33, true);
          public          postgres    false    215            A
           0    0    grupe_id_grupa_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.grupe_id_grupa_seq', 49, true);
          public          postgres    false    217            B
           0    0    profesori_id_profesor_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.profesori_id_profesor_seq', 49, true);
          public          postgres    false    219            C
           0    0    profesori_new_id_profesor_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.profesori_new_id_profesor_seq', 49, true);
          public          postgres    false    223            D
           0    0    studenti_id_student_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.studenti_id_student_seq', 99, true);
          public          postgres    false    221            �           2606    16434    discipline discipline_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.discipline
    ADD CONSTRAINT discipline_pkey PRIMARY KEY (id_disciplina);
 D   ALTER TABLE ONLY public.discipline DROP CONSTRAINT discipline_pkey;
       public            postgres    false    214            �           2606    16436    grupe grupe_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.grupe
    ADD CONSTRAINT grupe_pkey PRIMARY KEY (id_grupa);
 :   ALTER TABLE ONLY public.grupe DROP CONSTRAINT grupe_pkey;
       public            postgres    false    216            �           2606    16486    orarul orarul_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.orarul
    ADD CONSTRAINT orarul_pkey PRIMARY KEY (id_grupa, zi, ora, auditoriu);
 <   ALTER TABLE ONLY public.orarul DROP CONSTRAINT orarul_pkey;
       public            postgres    false    225    225    225    225            �           2606    16480     profesori_new profesori_new_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.profesori_new
    ADD CONSTRAINT profesori_new_pkey PRIMARY KEY (id_profesor);
 J   ALTER TABLE ONLY public.profesori_new DROP CONSTRAINT profesori_new_pkey;
       public            postgres    false    224            �           2606    16438    profesori profesori_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.profesori
    ADD CONSTRAINT profesori_pkey PRIMARY KEY (id_profesor);
 B   ALTER TABLE ONLY public.profesori DROP CONSTRAINT profesori_pkey;
       public            postgres    false    218            �           2606    16440    studenti studenti_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.studenti
    ADD CONSTRAINT studenti_pkey PRIMARY KEY (id_student);
 @   ALTER TABLE ONLY public.studenti DROP CONSTRAINT studenti_pkey;
       public            postgres    false    220            �           1259    16487    ix_discipline_nrore    INDEX     a   CREATE INDEX ix_discipline_nrore ON public.discipline USING btree (nr_ore_plan_disciplina DESC);
 '   DROP INDEX public.ix_discipline_nrore;
       public            postgres    false    214            �           2606    16468    grupe fk_prof_indrumator 
   FK CONSTRAINT     �   ALTER TABLE ONLY public.grupe
    ADD CONSTRAINT fk_prof_indrumator FOREIGN KEY (prof_indrumator) REFERENCES public.profesori(id_profesor);
 B   ALTER TABLE ONLY public.grupe DROP CONSTRAINT fk_prof_indrumator;
       public          postgres    false    216    218    3214            �           2606    16463    grupe fk_sef_grupa 
   FK CONSTRAINT     ~   ALTER TABLE ONLY public.grupe
    ADD CONSTRAINT fk_sef_grupa FOREIGN KEY (sef_grupa) REFERENCES public.studenti(id_student);
 <   ALTER TABLE ONLY public.grupe DROP CONSTRAINT fk_sef_grupa;
       public          postgres    false    220    3216    216            �           2606    16441 4   studenti_reusita studenti_reusita_id_disciplina_fkey 
   FK CONSTRAINT     �   ALTER TABLE ONLY public.studenti_reusita
    ADD CONSTRAINT studenti_reusita_id_disciplina_fkey FOREIGN KEY (id_disciplina) REFERENCES public.discipline(id_disciplina);
 ^   ALTER TABLE ONLY public.studenti_reusita DROP CONSTRAINT studenti_reusita_id_disciplina_fkey;
       public          postgres    false    3209    222    214            �           2606    16446 /   studenti_reusita studenti_reusita_id_grupa_fkey 
   FK CONSTRAINT     �   ALTER TABLE ONLY public.studenti_reusita
    ADD CONSTRAINT studenti_reusita_id_grupa_fkey FOREIGN KEY (id_grupa) REFERENCES public.grupe(id_grupa);
 Y   ALTER TABLE ONLY public.studenti_reusita DROP CONSTRAINT studenti_reusita_id_grupa_fkey;
       public          postgres    false    222    3212    216            �           2606    16451 2   studenti_reusita studenti_reusita_id_profesor_fkey 
   FK CONSTRAINT     �   ALTER TABLE ONLY public.studenti_reusita
    ADD CONSTRAINT studenti_reusita_id_profesor_fkey FOREIGN KEY (id_profesor) REFERENCES public.profesori(id_profesor);
 \   ALTER TABLE ONLY public.studenti_reusita DROP CONSTRAINT studenti_reusita_id_profesor_fkey;
       public          postgres    false    218    3214    222            �           2606    16456 1   studenti_reusita studenti_reusita_id_student_fkey 
   FK CONSTRAINT     �   ALTER TABLE ONLY public.studenti_reusita
    ADD CONSTRAINT studenti_reusita_id_student_fkey FOREIGN KEY (id_student) REFERENCES public.studenti(id_student);
 [   ALTER TABLE ONLY public.studenti_reusita DROP CONSTRAINT studenti_reusita_id_student_fkey;
       public          postgres    false    3216    220    222            )
   :  x�u��n�0��}��IH�#�����u/%R�4��u���Ӂ4�M�ŉ��,a�ɵ������
�]����а{���I)F���}aJa���[n5FT0��P�Ue����;Μ��Qq��:�G߾b�u��5.�,9������%�x�5o��R�K��R>�d�a0�!G0���M�����ǒ���gj1`��
6�~�W�a���e 6�	��^'��SXDwL��X�'V
���~a�?Xu�UC�b��.a�gW��ǫ�-y�k׺�NMq��Y����lc�W������ԏ�5��-z�e/wB�/�z�P      +
   �  x��U�n�0=���_�����-�iФ=��ȌM@��\�-r�4V�4	q��5�Y�fQ	���FI���J��GI΅�QK���s����Yݫ��Nۍj�A����U�q<����t���pT�`< gp��A������LYi$��Vda���s�"�ƈ[t�$L��	L�E�;���-ʨ�pi�U�U�����N$�"���6�W�,X�5�j6�u����چLz"-�Rb*[�`��,�����;�yVL�x��7݈V�0�$�����!�~��~�����D�!sX�����ZU
�b��j�S��A-{�Z�j�KԲwQ�ޠ��M-{�Z^@f	�!���}���,��<�Q���$�H��;<��p���5�[�َ?��<��X�P��H������-���,׻J��T�C���ʊ��_������5@q��
.����_�[_I<��ΕC+`��,��(6ԺQ�a� �[Q��Z��v���5��?mZp�#
����["��'����'J���a��uV�g�����-]���j�����ΐ1\�pj����ws9���Є��=J��l��p�Y��-<�A�H��3ߞ䇺߹O���ҸQ�y�^�3����%��(-���m@�H>K9�����ōD��AG��z}2��Iz�M      4
   A   x�340�440�4��)�4��20 "N##N'.C�����1X�(��
�C匡� r1z\\\ ��      -
   �  x�u�Mn�0���)|�B�H�G�8qx� H����H�C��Z,
o{�ܧ��C��DKޘ�艚yߣR��ߍ 
4$��w'�@uT")�2�,OMmȓ� I*��h_�t��5�i�w%p7�~�S[��y��9|�`p#��"\$�p+zbA�����䇪��dl��v����Ia]��tWظ�=���٠HH~��ez�WP� b��q7�'�������O8��ɮ�~�'04���ȶ�S�"Bc�b������C]IC�d�����˹w[ �R�t��{_�e�P�+��b�"(���).�V�i,ŲՅs;>�U��I��ZK|��t��D�u�X��{P���rH�]%>#bo�If���u	�f��7]S6E����V:(Q8f�e���F|}6�U2FY���6�f;�d��e1/۝*�*HRʮ�x�[#��g�P3�M�b������5��Nſ�a�9e���Y�=�� 9e#0�(��Ӎ�QSi��v�D�,)�_>�񟄂ڴ���u�D���]*�4����fO�S��_�q؜�y��p��+x|�}^^��<��!7�b��ܱp�^\������ #f�fs7�߮�/��͐��"��5�lN3{o�Hs�q�du#@�aZ&Y��̲.��p�}9�C��?�Q`�D8�}9��.�S�����᡻4�Y�Oܠ��_	��?�|�      3
   �  x��T�n�0=�|�?�0�E�э� Frͅ�٘�L�Y���-�J*��YOo�-CM��iXYo����9�< rx6�S�`m�ʌ>x=)�5�[=�ǽ���^Ý#"3�ɡ�sr��;�ökm������/���ǫVa�>n=���oǫ�W���",���^��5�`��aFT0��8�������z3�"5{2I
v>&��!��LV@cl�oV��5L	�(���jwvbbH
�UK�^�k��o�g�\�
�xڃ	;km��y��0=G��:���=N�Ԥ��.C>A����%H%�d"=�@���1zn���lH���6B�+���.BH��O��
�Q�X&��03C�æ�P3���Dq����m\C�9�]�����c":x��JB	�(���_|C���@Z��5�J��5�%�j��ޞ��>U:T)�M|Q~�K;��A'[#[mL] !�[S� +�I���Ku��Ʒ%"�r*+>      /
   @
  x��Z�n�8>�O��6DR�;��L�C����i.J[q�����;䚧�=�ly���EJE{�4�������}�gu>]�7]�q��1�G����|*wͧ������́+&�g��ߖ}]�{̋���������ӵ9|�T���p�����9�d���R_�a�]��W5�6G.�<��{[)��o/��	l��"{,��%հ�;��(�ߜ_ʺ�9H�Tv_6e��/�
�Rsy�&<۫�w�i�]}*3ش�2��s�\����}��U����0�=t��R�����}��e0G��[���箯�ǻf������k�
s��/�|���栘ˆzd?�_~|o�v�Ϗ2��mw>u_���`�-��-���N�e�����ka����MSW.p��F����*�R�������9���^���r�����k�"Н��<���t�OP��v�@p����}S���n����/ �U��p@N�
?|.q�����a'.p�]}�t}Ȏ��!;�S��2q���^��5{�aY�N(]���6��T]���:ܝ���G3��,)��EU��j��N(�r���~k�� v������Ԁ�x����� !��̈́�g_���r��]n��ku�������TV�~�+,���ݺ��r�5�U]s}i�]@Zb����7(_�4-��'�0���~�Mn�O�[�B�{	���b�rn͙�%���]��_�}� �L�
�����]�O7rL������ɍ���I��/5a"=&k�������?���Q gRN�>��*a)�銑ʾn�I �E��ɞ�n����i�����B��L�	���!oP_��'�^�����T�Ӟ�v�KAQ�t^`�es=����V�KH�|א���f���W�|Wh��Ī��{1��wp��j��!����c}=vf��=@�����qqX�Y�kK�Iͱ�Q#�N��X�'�R�9�-,�n=�z�/CKŰ�f���{���¹KH��p��j��c������~��0��~q�A�<!bP�^t�O6�;T,Ӂ�/~���>@��_/��	_��7�i��^&s]B���
��|�C�&ݿƜ�&D
o*�L@�����:�I0 ���{�Ňt詑vA,���T$��hػ��&ʹO:7\� ��(X��y����� B{��/e��Cżi�l�3�Z-ې[.2�r�L5�Ww*�(� �Z�>��!��W��>�2c���;���g<�B ��dsO��.?�u�,������cy��5��gĚ��-!�y36b�&�a,��?jAS	��[ew���-ȪA"Y1�(�.���Gͬ��#��Lv���-Fձ;-��q4ɬ�m���
&L���װe��#*@�Aq������2k�o�U�=CK�p�$Ŭ�Rzi��|�lL<������K��kIWM1�ĀG#�f1l�˔�-1P7rGU�)�ķ�z�w`�/��\�[�t�5S*�jhÜ-��Z��w�iy����cjf��=�z+?Ô�gAS�cS�&g�-�v�r��.'�s�/�Q�I��:
N��`ni�Μ��2�ǿ�}�b�`pE�96U��4D�3O��f�WL�^ˑ�-�ء��p���.�����ta�s#G�6h��g<��s5��P�4��a�����j'Z|q�kzJ�:���q��z��Qt'�Iy�c4�qHϓ��n40��u��k�07���l%0vEf�	�C۴�@7N6��D� j*#��᪔�I�9-��wRk�����c)��
:Q7<��JA��!�&��@�(0�y������(0@��MuR��aш 4�Ԅ�B��
���I-��s@ȥ���T�9�"F��{UɊM0
�H$�v"L4��IP	"�׈��	ttB9Տ ��A߼*=z��38'ފJ � bB�Vl5frAD��s�DP$gpE�J��	#~U���tT�d?.UIG��C�Z@1d"*�gQ�)T[��"xs�<$�zt�&���Iۓx#2.PK�ǋ�qL�q)��K2-8�g��7�[���
:1�N�t�+�y��ǰ
��p�<1�H�yAE�I�&r�J
�t-	&^�����DsP*���7�����
����'L&�X�������PK#d����<9tp:EGE���UtT,��t�q�dT��C�
ڃ��B��BT�J����]Z��'

U������[pEEE����	�SQ�D�F��P����7]�q
�ɨ���u�~�MD�Y:�S(�NF�N~e(��t**8�:��
?,�Jҩ��}+AKѩ�Tӏ�w�bTD? ��Q!R�Z�C6���W"C�2*�H�?�Q!��6��6�	{(����In�)P��F�.��btT�űމ�0�mLf�ɯh�9�TT�	��C��7U@���T���mSSE���C��dTZKh�zwr��_��HL���@d-ҫ(�@pKD�YD���f��':*�\**d�H"��	�tT��i7F�����=*�_5tT��P�|�ʽ?����
�{�5p/**���B\�}r��{�S@#GG��)���t�"r:*d�U)`M"*4=����e��W
~      1
   9  x��Z��-5�w��8�| %%��P�����=�L�+@���4G���^k��P|%y����ϟy������W��?~��ӯ��k����}�ퟟ~����߇��I<ڜC�j.�O��jN
>���m#��Ս��FB����>�Kc�`��&]?'�AW���5����P��������_���'/ۯ��/}����������K��v�mu�x����G��!r��{�i�����.f�0�#K�֊�0��eu<��5
��;]�?
vix�n�c��z�u����\��
��)粑�S�c΃D�O�{ ��OO���}�%��#[�v?���8�����@�HR2�IJ'�9����#��
uN�@�Y�O�� �LG͍Pt���b9�$- �_�MpT3h�g��
��1�5wX㗄`����<!`P�����m�G��#�M�4�%���'dʖO�"O(칇S�?�_
��� ��3:;�� \�L�gx��4�33�4 ��i_�4ʹp⽂B�D+�4@g=3��A3-X����i֍F������<�z�rp!`p�jE�^�2j3��8�w��_�bu�C$UD
@��.)*m���[��������F�X��/!�0!�|i�	���N#PN�`LN#R�}N�4B%���L�U�
� XNo?�h��NL�'Yꆵ�W?�p�3X��aG�\�ꇲ�A����a''�Q]��|s��d7�n(�tﲽ�P��JT_�$`)1���c��)�������˥ˌ���e����$�uqv�[��M�t�6b�u���=':�vzR�B��)�Ӂ�[���LU^T�5lC�)��JUw�Pr�g�r�	�~��g7�P@+����S	�|�*Ne��Pu*t��S
��6ԝ� �!�A~]�$� :l9���:lCR�]�0T�����T+�0
)!^�`4%���IM8�6�E0��K���K��Y���ad�����g��ꃅ0=s+�$P�V,+d0�$��r!~B*���d �ns�`i^�d5T"��/�<5�=x�H2u��G�h
L$Y
�`�F>�*��ܑd8XXc�H��I5�Ё�0�0���v�dw$��� G̲IVC��`��l�I�kw$�!:z"I���E1O�wR��\1�`h��I6���.����L�%H2�!#��3%.H�C��@�i��G�ա�J6�dj�&|�� �#�aY�A��!�J;H/����U<r��Q�A�HH���j�,Y!Xr]+�<�
W�y��u5�8� /��/��e�_ę�8��3r�䵟q���Y{�3�(^�kt��:Z-q�V@�-qsh�%g�x¹-qs⼕#�䬮Ug0�#�[;⌢+Gi�g��Xe���3����8h/�p�?�i��!)���3$\P\�G������L�=�^�83���ގ8�9B���8.�'�@�"��o������������ք�W&��5oT�z�g�8�)*��)kF�e�l����V�As6�7"=p@~��D�KVY�r"�&T-n�Jaӥ��QDM h�-�>�`i���%�H.����D�B�ꨉ���f ��$$d�M#0vD�VJ�Y���J��i���~A��&:=��t2	:i��f�j�҆O3���!�.�z�w��T�
��D����AԴU徠�.��R	���QSݲ����ԔTZ�C2]0����`�US�%��h մU$6��.�zت�h��������E��n
l���j�%a�=��[m��'T�].4�"�W���4_���G.��^Nq�f7s�`'T
��$�v�\��͞$E�˴�_D�&��s�N��H�j��q�{a��X;����,' �5�w���[��<N"���S�8�GG�f���h�*�S�8��%۩���W���� �Q�m�r�x��r�!=ɮ롉�߂u۩�,&[��6�L®Q��}���j�n�Fr��0E�v�$g�
؊�Vr�؀�t�%�$�w�o�fr~���7���ǿ
�S;9�V.��;�����$��j(�Q���"����RV9���8��I�>     
