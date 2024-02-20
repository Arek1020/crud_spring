PGDMP     ;    *                |            shop    13.4 (Debian 13.4-4.pgdg110+1)    14.9 (Homebrew) 0    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16384    shop    DATABASE     X   CREATE DATABASE shop WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';
    DROP DATABASE shop;
                postgres    false                        2615    16430    shop    SCHEMA        CREATE SCHEMA shop;
    DROP SCHEMA shop;
                postgres    false            �            1259    24589    cart    TABLE     b  CREATE TABLE public.cart (
    id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    date timestamp(6) without time zone,
    order_details json,
    payment_date timestamp(6) without time zone NOT NULL,
    price double precision NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    user_id bigint NOT NULL
);
    DROP TABLE public.cart;
       public         heap    postgres    false            �            1259    24587    cart_id_seq    SEQUENCE     t   CREATE SEQUENCE public.cart_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.cart_id_seq;
       public          postgres    false    209            �           0    0    cart_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.cart_id_seq OWNED BY public.cart.id;
          public          postgres    false    208            �            1259    24600    product    TABLE     �   CREATE TABLE public.product (
    id bigint NOT NULL,
    description character varying(255) NOT NULL,
    image character varying(255),
    name character varying(255) NOT NULL,
    price double precision NOT NULL,
    quantity integer
);
    DROP TABLE public.product;
       public         heap    postgres    false            �            1259    24598    product_id_seq    SEQUENCE     w   CREATE SEQUENCE public.product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.product_id_seq;
       public          postgres    false    211            �           0    0    product_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.product_id_seq OWNED BY public.product.id;
          public          postgres    false    210            �            1259    24617 	   users_seq    SEQUENCE     s   CREATE SEQUENCE public.users_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
     DROP SEQUENCE public.users_seq;
       public          postgres    false            �            1259    16385    cart    TABLE     �   CREATE TABLE shop.cart (
    id integer NOT NULL,
    date character varying NOT NULL,
    "user" integer NOT NULL,
    price integer NOT NULL,
    "orderDetails" character varying,
    products character varying,
    payment_date character varying
);
    DROP TABLE shop.cart;
       shop         heap    postgres    false    6            �            1259    16391    cart_id_seq    SEQUENCE     �   CREATE SEQUENCE shop.cart_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
     DROP SEQUENCE shop.cart_id_seq;
       shop          postgres    false    6    201            �           0    0    cart_id_seq    SEQUENCE OWNED BY     7   ALTER SEQUENCE shop.cart_id_seq OWNED BY shop.cart.id;
          shop          postgres    false    202            �            1259    16393    product    TABLE     �   CREATE TABLE shop.product (
    id integer NOT NULL,
    name character varying NOT NULL,
    description character varying NOT NULL,
    price integer NOT NULL,
    image character varying,
    quantity integer
);
    DROP TABLE shop.product;
       shop         heap    postgres    false    6            �            1259    16399    product_id_seq    SEQUENCE     �   CREATE SEQUENCE shop.product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE shop.product_id_seq;
       shop          postgres    false    6    203            �           0    0    product_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE shop.product_id_seq OWNED BY shop.product.id;
          shop          postgres    false    204            �            1259    16401    session    TABLE     �   CREATE TABLE shop.session (
    sess json NOT NULL,
    expire timestamp without time zone NOT NULL,
    sid character varying NOT NULL
);
    DROP TABLE shop.session;
       shop         heap    postgres    false    6            �            1259    16407    user    TABLE     �   CREATE TABLE shop."user" (
    id bigint NOT NULL,
    "firstName" character varying,
    "lastName" character varying,
    email character varying,
    password character varying,
    "userName" character varying,
    first_name character varying
);
    DROP TABLE shop."user";
       shop         heap    postgres    false    6            �            1259    16413    user_id_seq    SEQUENCE     �   CREATE SEQUENCE shop.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
     DROP SEQUENCE shop.user_id_seq;
       shop          postgres    false    6    206            �           0    0    user_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE shop.user_id_seq OWNED BY shop."user".id;
          shop          postgres    false    207            �            1259    24609    users    TABLE     �   CREATE TABLE shop.users (
    id bigint NOT NULL,
    first_name character varying,
    last_name character varying,
    email character varying
);
    DROP TABLE shop.users;
       shop         heap    postgres    false    6            R           2604    24592    cart id    DEFAULT     b   ALTER TABLE ONLY public.cart ALTER COLUMN id SET DEFAULT nextval('public.cart_id_seq'::regclass);
 6   ALTER TABLE public.cart ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    209    208    209            S           2604    24603 
   product id    DEFAULT     h   ALTER TABLE ONLY public.product ALTER COLUMN id SET DEFAULT nextval('public.product_id_seq'::regclass);
 9   ALTER TABLE public.product ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    210    211    211            O           2604    16427    cart id    DEFAULT     ^   ALTER TABLE ONLY shop.cart ALTER COLUMN id SET DEFAULT nextval('shop.cart_id_seq'::regclass);
 4   ALTER TABLE shop.cart ALTER COLUMN id DROP DEFAULT;
       shop          postgres    false    202    201            P           2604    16428 
   product id    DEFAULT     d   ALTER TABLE ONLY shop.product ALTER COLUMN id SET DEFAULT nextval('shop.product_id_seq'::regclass);
 7   ALTER TABLE shop.product ALTER COLUMN id DROP DEFAULT;
       shop          postgres    false    204    203            Q           2604    24577    user id    DEFAULT     `   ALTER TABLE ONLY shop."user" ALTER COLUMN id SET DEFAULT nextval('shop.user_id_seq'::regclass);
 6   ALTER TABLE shop."user" ALTER COLUMN id DROP DEFAULT;
       shop          postgres    false    207    206            �          0    24589    cart 
   TABLE DATA           m   COPY public.cart (id, created_at, date, order_details, payment_date, price, updated_at, user_id) FROM stdin;
    public          postgres    false    209   �2       �          0    24600    product 
   TABLE DATA           P   COPY public.product (id, description, image, name, price, quantity) FROM stdin;
    public          postgres    false    211   �2       �          0    16385    cart 
   TABLE DATA           ]   COPY shop.cart (id, date, "user", price, "orderDetails", products, payment_date) FROM stdin;
    shop          postgres    false    201   �2       �          0    16393    product 
   TABLE DATA           N   COPY shop.product (id, name, description, price, image, quantity) FROM stdin;
    shop          postgres    false    203   �3       �          0    16401    session 
   TABLE DATA           2   COPY shop.session (sess, expire, sid) FROM stdin;
    shop          postgres    false    205   �7       �          0    16407    user 
   TABLE DATA           d   COPY shop."user" (id, "firstName", "lastName", email, password, "userName", first_name) FROM stdin;
    shop          postgres    false    206   �\       �          0    24609    users 
   TABLE DATA           ?   COPY shop.users (id, first_name, last_name, email) FROM stdin;
    shop          postgres    false    212   R^       �           0    0    cart_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.cart_id_seq', 1, false);
          public          postgres    false    208            �           0    0    product_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.product_id_seq', 1, false);
          public          postgres    false    210            �           0    0 	   users_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.users_seq', 301, true);
          public          postgres    false    213            �           0    0    cart_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('shop.cart_id_seq', 18, true);
          shop          postgres    false    202                        0    0    product_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('shop.product_id_seq', 19, true);
          shop          postgres    false    204                       0    0    user_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('shop.user_id_seq', 27, true);
          shop          postgres    false    207            ]           2606    24597    cart cart_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.cart DROP CONSTRAINT cart_pkey;
       public            postgres    false    209            _           2606    24608    product product_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.product DROP CONSTRAINT product_pkey;
       public            postgres    false    211            W           2606    16419 &   product PK_bebc9158e480b949565b4dc7a82 
   CONSTRAINT     d   ALTER TABLE ONLY shop.product
    ADD CONSTRAINT "PK_bebc9158e480b949565b4dc7a82" PRIMARY KEY (id);
 P   ALTER TABLE ONLY shop.product DROP CONSTRAINT "PK_bebc9158e480b949565b4dc7a82";
       shop            postgres    false    203            U           2606    16421 #   cart PK_c524ec48751b9b5bcfbf6e59be7 
   CONSTRAINT     a   ALTER TABLE ONLY shop.cart
    ADD CONSTRAINT "PK_c524ec48751b9b5bcfbf6e59be7" PRIMARY KEY (id);
 M   ALTER TABLE ONLY shop.cart DROP CONSTRAINT "PK_c524ec48751b9b5bcfbf6e59be7";
       shop            postgres    false    201            [           2606    24579 #   user PK_cace4a159ff9f2512dd42373760 
   CONSTRAINT     c   ALTER TABLE ONLY shop."user"
    ADD CONSTRAINT "PK_cace4a159ff9f2512dd42373760" PRIMARY KEY (id);
 O   ALTER TABLE ONLY shop."user" DROP CONSTRAINT "PK_cace4a159ff9f2512dd42373760";
       shop            postgres    false    206            Y           2606    16425    session session_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY shop.session
    ADD CONSTRAINT session_pkey PRIMARY KEY (sid);
 <   ALTER TABLE ONLY shop.session DROP CONSTRAINT session_pkey;
       shop            postgres    false    205            a           2606    24616    users users_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY shop.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY shop.users DROP CONSTRAINT users_pkey;
       shop            postgres    false    212            �      x������ � �      �      x������ � �      �   �   x���;�0�k�Ljpv�$@:/��J-(�G�pw�QԘ��_���H��Q�D!��,��):q��c{hja��(��G��OU�>���@$���(ǳ>�-J��rK�/��D����}��|U�L�D��%�k�X�rHG��H�L�9�)�߀�H[�q����@鋥!�f ���l��Y<�$����(����`O����������r�v+ �ۑ��      �   )  x��U�n�F<s����Y�z��Q��@	1� A.Cr�;|L3C�ш�o������J͐�Z9Jrr9���U��Qt�q"�~Ŏ튛���Rڂ���$n�F��	�$eL���ߒR^/U��T��ߌ����S�:%�H��a�3d��q�eN�c3H�j�J�,�dAxP������B��%���eZ�Etrt�i�`E�Gg���V��-/�-�*�ѽ(�t���{���	t�>hkia��c6 <f�Y�n8�m-5�����:�JWs��x=��*�J�}����H�焿��Iѱ�\۱q@��8�lgҖ�W�מyO� �ύgP~��+���I�ӥ�dF�Ҫ\Ω�K��[�{�����y�2])�h�Zs@�X�Q`��:ӎ��y�PR��ǳ�8�3"�V��������q�F-eA��l@�3eb�c�r2m!	}�6g�7_�,�À��<{;��ƃ�^���k�==�x9��N�Σ�Y|}����;�K8�:����;e\+*5�U�&�ִ�J�*\��l�y���b��C8T��@縠"�\����.�0|*o��2�y�=\�6p~>�O��dU��ts�����r�
�l�θS��S)lޯ��
P֏C_z��3z/Ĝ~eW)�,M�a\�h�����"��sꁿ p��@��"0�v�m������,�n�<� �I�-�_��!
�Q�.��\�2x�62-���t2�\�i#׊DS����AI�?o���Ng�����V�k/�v7Xy�-�D�(����/|�A�f@N$��D��� 7Y��|�$dGT��'�:��:Egt�)j��������`�}�py7-㦪ZX\ d��e�� ��v��i$��]߀p�X?�a[+�!J������j(�}7��������%}pm�8�c������吖��{I�S�"~Tӿ9D=���_A%����"
1�0"ܦ�E�AT�.٤��o��ժ��;�I�E�YMZ������� %w�G'��F��h}�8P�[�S/�v�r0Mb7����"����镩���s1������      �      x�ս�n��{�u��Ž�K�(v��S؀@��wQ\��};�� �@>��{�7坙��ϳ��2�ϯ��O?�y�E��t��'��4��t�)��|9��u���,j���S,ˠw��?��i��:�ۨ����?�����R|}�����|��2����te+g+ۆ�V�mC�=%˭V����� � D�7D�B�_t�^^�� U���*y2����G�+�������O�Ȯ�B�ƹ(��iI�Mj���3(@�&[J��ר��#��*������|�� b��n<�rs��q;�y&	����	�%RDG랈�B��~�k��RT$BM�3(���*
�]H}`�,��c�e�����gP`�c���1��+����[ ��bY�qz
��^P�)n�����B.������0e�ԯ��4Ŕ��E��I	���z~��(HF7�(��hʣ�|�,K��`?Zn�����>�{�M�&�����T+���ȕ��z��5lA�3(���]�^�}�����B�w�(T� �0��MA��_yQ}�@j�x|���1ͤ[�i�t����hN�A�8�YU���'�3��d��u��ú^�'��?k0bu��K�j���D5�Z�V����o� 
��CU��q��2�_�``��j<���<	�i>�B����D�C]��s�҄��fO�^�� �����^��i�Z��k(P��K���@~�؅]��I�ޝ_V	&GAW����[�)R�N�ͨ�`r��\�k�*��-�
����7E��-&�FGS�|��H;"��H�\=�ǳO��/#�V:i1���a{�cu�9>�bJ�h� _
��w�z����{z~O�C�04�y��lH���r�ASB��L-����/��Q�y�J�%�#�6�̪��{��qI��?����t��{0(�!ѓ�0�^R|=�o�_��� n�[)����]5��R�;p���~�� |9*:Xh;��{�z�!EQ�[!|�#�s�z??�0�kK���@�ٗ���P����
���3(R�4���	�}�B�v��E���L
��3(vR�����Evo��
f@ Ho!�} ]��+f��89amE[L.��W�[������\��b+G�A���1�D�I/��(z�W�Zߛ�՛B�P���7�"d�gP@�΋7/6";O�E;Jr6 ����
�ů�˼do�F!sy��j/�@"���]b�|��¸ <n�;�c���'�3�(����p��V$7Q,k�uq~�߶���<��
��3��"4u�gD8*��7~«�EA�}�T~��  (����zPK�w��I�	�E��]�6�#P�,��Q��z��X!��@A^�㩤��7��d�,5S�� m�}uk�� 
�T/',}�F���[�m30d��ӵ��Ox/0��l"��soD����ӉU	v��]����Ŋ�Q�_�{�#��5�+[l��ku<ww��R`L�|ٛ����DU��9,��&�Y��A�Wl�K�X��_'`��F�L��$�@�_���bN�;��Ӹ#�A=,�Ӌ�G���n����=f�	X3:�V����X�%��^�Ϡ �a��P����[K�^��>^��/�*�>���<VO�*t�CފR#�(Bz��E���Ϡ(h��]�8�y���LVg"Il��Y��
ꂒ�\#���Y_��8��+�D�$��Ϡx'wk��,j���W����3U�9t|~�~��E��Yq�@G�J:���ݔlrn�,�A�U��S����$�}3!:]��5���
蒦,�r]4���7T��F8�i�	����gP�{Ћl�[��a(CN�,%}�n���[�����yI�Z���1]���������$`˵�@_�O��T��������{T�p��df���%�nP^�����9ϢV�V���\ ^ a���s=�_p\�k 𭉘�'��I����UU����W�<�L����V
$��F�ӛ��1�	�e��~���5鳛�N|Ɓ�	L^�~@/�B��j
��>"e�����f��I��p�O��"��w�*
}}#��ɃI�3��W��)����M����"Q�5�1;/Y@�(�˴�+ܙ3'�Z PS,��ƣ��Н���M{�à8w��RA�r�q�����@�����.o��W8$M7B9]���f��$���'h�(����T��^\�r�~�heN����G��ϠKe���2��i0뫍��r�)���h��#��ͯ�̫�f���G����{I���8�r2���Pǧ��/�nԯ����o�5�#7&*�ND��i��C���o?º����=�]C~'�,��$�C*�Gtr���鑭�5��</�}��!"��i����
�p��a�Wz�Xa���SW��e�6�sk��R��aY7���RU�D�>�k�ߓW��{��o�X���~�����P�zlFP��\q����S<�[�d������d�Qm����U��	�Ŋi�p_���3��Yl(��� �篁|S�B~��e5c�6�Lv8k���'��v�obr����lͷ%Fk�J2���O0w>��_�C�2���xǷk���Vs�����Fq�ȷ��������(D:�l`)kR�5g�Ff��0ἢ��7��kM"�u9���	�e8���aL�aB�`��W}Ϯ3��gP4�n�ǎ�MNt�3	���k1��X��3(ܧ�]t1�4>�il������GX7v鷦r�L:�S�\��j?H[�{ݸ��������>�i~F%����AI��v>u�����&!�M��9B����S�W �K?��N�٬L������� ��#�]>A��Eq�@���9#�*��ի';H_��T4y���7��m
�ߨB�yh&\���cg�m��!~~au,~8�`S�Ϸ�G";���b#m�v�3(LB��=c��g�r�w�v;q��O� .�ιS鋥�GB���{�2�X�M!U~Ec�^�B�1)^�m�CӢK�}�߶���������� >��4n�7�%+�ܽ������I$G�)����Y6�=T�2G�ϯf�V�ͷ��*�<N��ꦷ��vbٓ���O�:���_��+:f����ƶ��?BC%cz���xx�'�wQ�m�q�MV��V��N�>{Ȳ�#	O�ת}��k�r7%\R.y+n�G��xpO��-D��p����%Ej�R׍5�Xol����ί���h��e���6���IA$�5r�6��}Է��5"g�=ll�3�֎��N�ͫ���_�����L�6��k^Q��Zҍoleۡ����'P@�bl��v���f�u],V���M���:�<p�U�鉙�;ML�i��#�����wľ)(^��~S`�3��%x�����8u�)�o�v	 o(�:��2��!�~ׇy�W�[���W�j��S);����,�����z8m�[��g��z ���u��f_ᝠ��O�|S`��W^C�9�)ZU��m��ʱ8���@�Տ���ɖ�xN�h}�4��,�}�����o�-�zL=$�꾤Tf�h8���>��[��9���B�R�c�H��)w'r��Y����i�)(���1U"o����!V����I�8�����5�#�Tr���H[�\}���f+����#���%h�<�j��t}��Fd8��֜\q}��@�r����F��4��%�A���*��W_��6�MA�wa�q@�jq�quO����G�ƛp���zI���,E��z
c�ZF_v����Qݡ3��!��2
�{.)����}C�!W�w�GN�Y�[C�3���"{���]�A>i g'[΅5���,��S��/� ���>�V��|}�r/��zy �+x�g�X�P����$���S<
� ,�W#f�.�bP�z��
�+�c���[�D��M��V+�ޡw�>����E%G4G)��x%dWV�)�9K�K_��V{2h�t�V�.{�L�i�FGfv��/~1�{F�34�x�(VY>BO)~6N���B߯�\���#ń��˻F)��j�c��    �r���
�Ek,@�����_�;,�=�v���<��G%�K������>���ZnO@|���8�J��;��5��S-�H����hR�y��O��,!æ��ȗ������Uߟ]J��r�m?)��Oﭜ���̓13���*,�P�������E��
�� ������G�o5p9U:���
>LX��6SSo�*Z(m�G�J�d3=���?0r���}1����%z�b��|S���3(�	Z=�|ߙқ�i�B��-���k{����A�1v�9�{���X��b2 ��u:�����e.x+�X��hc��C�,k$���y�O4h?��r��(-�n}}���| h���̚��ą��a\uSy�=\����;��^8���?��W�pi�f�`H��C� �`� b�M��L�7,{^��.�_5�,�D'����:QN���{���}��3�1d������6U���*�y���{��H9g;����餳nm�{/N���u�|�s$��n������A:|�\�)G�(��G�z_qTsu�a��>sF��L�IiH߿��)�V�}G��.�"�8�{l(��Q�Y�\�u��P�5�ڜ���[d��6 ��<�M�-a̅�j���,���sS�nv���KT���p�E(�U�y+�,�t�6k\N�P�^��������;s��ɓV�k�����ڃ�腌��j&���%�u�wY�JI�r��8;�OL�u{�q��������y�����fyэ9�����!�f�1�:)��B!uO�D�3o��c�0yIAC�)z�%K��Ƿ�K޵��jμ��
����8z��ݹFԲ����&�8}�����.����X��|�÷c�yp$%[&|C�̊�(�ga%�"׍��1B��|?F���3b)�K�V��.C 4���TPB
�V�ϼ��
��L�Ł*o�IIf*������Wx�	�U��8�&���^�����כ�?g��y�?%?��ʏn��R�Ӟ�S�o�N�3g��P��,s�@��<�v݁�=XH�|��o���Q����A�;�1� БP9��_��2����wy����L�`yH
��t�c-�$�:���p�\�8j�hT���q�M��rk�����f;eKg�Y��D����jڒu�Xx���>��H�Oߵ�m���r1��=ŗ.�|x`�C�u�2:�~��2�ܒg������$9�д}�úE�y�?qT �ށrǪ�L?�T�g!���n#��ί,�~��%���+_�׋e�T��{x�M������P�gP$#�õ��Ъ�l3M�Jt�������3b�P\[�|�؉�PD�Fc��
'��P`���Dň�v�)x�F��ZfC�np+xXy���䛗~n�B�B���'��*~G7\բ7�1o թ>�B���xHW���j��M|���G%-V@�yW�O����IW��g��Y���IEo_��ix���~�J���pr_)�œ$)A�$sp�g�4����P��K���J2" ֲ��Lϖ
>�4�+��P��5�V*-���hW���f2s
篁|S�}��T?��A�q��{��,�t)��3�����}��������b�������b�Mр��k (���B@��4���lX�_#�(H�m��.�L����o�y���m� ˨��8���tc5���o�?鸷o�6��l�P�ّ�)Y�g�M���[v�R��X݌=���x�CZ��|#���&���/��@X�d��v����zՑ�S�
�B�	ȗ�b��CD���1�S�g��;�Y��!�ɵj���Yl/��B�}�0t�!0]�����:�V�)�B�&��SG�I�S:���m����@N���v�����/n�߯\�M�h�T4�Z��B��3��뷏
�畵d�i��c����$�G�����.~(�Kv��%RY�K��G���=��A�槯G���/X�������D!l�[���тv���P���%�q+��ֈ��,���,卿��Qt�<�<]Kp�w��ؾ6�5G�|���
�b �|L������j?5oS�k8=���B�Y�(�R=B%]X����+��rr����{2��;��rDIh?8 y��%���O�cE�_x�vL�4�AX����zc���\���/P�7�1�OIl?V)�WQ�����ܗ�y��
�����s��:pF��. x45IQS�^Y�C��w1x�w��q�P� kA��o�(��t��=���������U;�R �RTܲ$����a>�G�ޚ[��f�� [�I�h��u�<+����_n������8��`b��_�h���J������>�,,�{a<c����c����T?���(4
�y��A�_7��IH r�3�ЩN?�����VJ-Q��$^_������dP���@��(tx%J�b8߂Q�^#��i���"�s�j3����a�z��ob��J����c1��p�o��C�+��6�M�,�I.�OO��y����������MA\���rB*T��ZX@׽b�n������!�y��?���I&�m�Z.4�$����Fwz�O�Ӫ��O`�����]q�>8�n�wW=�u�� .ZPXRG�3C�Db��=Dk�� A~z��E�f*�H��~$�����۳\^�r�
��/�~KU��uj�x#&����14����%����!�s��-�������m~��ł���G�?�E�m$��ҍ���T���]�2i�q�%�����O���'ל��R���|d(��ýN�sje�?v��1�oI�s�IT���3V��Ԁ�}Rg�x��/�;�Q����<�zU7;��!�VLsz�E�b� �6���ݚUBP�� �g���QT�k"��/{,y@�ά�[GB���������Q�ae+�ܙ֖sGn�=�:��*�gP��"��a�I�x�b�T*nO;	����/
�B�ӏ��&P>����gf�����^��� 7w�[���+͗tס�����P����"�Tk �&@ރ%���M,2����G���"D]���C�,��&S&����O�3�g��������U��VlK@fLW_P�{��7#ا�p������M�����z��Fs�Ν]+@"��A�{��k]o��c;�A�Ƞ�&�Ѕ$�G��N����`�(�^��Ee���$ h6�����'�~��Wd>��ە7�\��hqe���d�7-Hm��g��C�}��H�+�����K�-��"z.����~(|��?����-�Gcҕ��R$:~�;����y+d�*p(0K��F��]0��;��>��ӎ/(b�,��Ā���e��!���Z�ο���G�z��*��3)�mHP}�7
\���}�o����k�g�e����u�t�zA�^2��b^_w�����v��ߋ�r[�����S�?v��iU�Ծ�-�Y��FC��97FGWg�#����Q��� �x����7��7�VO�����:�/
ꂬ\YQ��������������
@q��x�!��n�x�8|+0��F��;���l7A�zz��� :c��mdȤ]·���t��ӿ)���Ã�{L��Ju�Fm����[U�V�}�^�2����)�_<��J��k����j��ԥժ�����*x�cL���dP�^q�C�6�9/�Lu�����u�N�Z�N?]�E��^0T�0U�0���Z��A���wa�WD��j���+A�v<�Jl����c_]ˊp)������
�:?U"?<i��k1��XT�M�v��Q�)���>�{[���$�,���^�mN>��bJ\䷫�5����_�̋3����^����%�r���:���~�W����������C����-~�Ba�W��^��"
ܜ>c�M�\�=2��o�k�V�:+w�T��e����W����Ħ<:��?k7�Mr�l��O���Ǚ7���%�q�T�6Kk���9r2�5�,Bt�&�Pdd�bA�$Σ�)�>��T�:����WN��'�c�p�"g��u-���8ʢ��㕦���~S� �  k`;[x��}��M%�/t�sw'!�F��]�f�=v��z .��^�M��+8�@�>��"�ƫ �Gk�W:��#�ۖ8>(3��[vS`�������ڶ����O�2@�m�B��G ?ʼsb�1���5�@ܫ�9�%л~���/�4Cv��E��9B���s�,oɼй��Ex��R�l�c�f�b����,4m5?���ߧ�����X�pg�:���"��7�$2����u��K�G(��=����P�'�TZo:�h�ϯ�����<�~��5WI+P���
i����S|Y7D~Ŵ�@�c�6�/�;�
b�}ɯ���}w�/E'�>D��ԭ�-�d��\�JR ��wg����GA�E����6Yq mD��dA3$�r��MN�^��H���6���HU�î*����3?ġ<}��[�uQ4�8?�!��x�i�_�
-��m��O��P@O2e��{�jӟ-�D�(�R}�^�����l��$n�:��k���@r,�,]������\��QEe�G���Q�p��n�9$����υ_���OƷ���[�0�h�&'��x�F��p�P|E�1Ֆ��̆N,z�l��+�B�pfM���O�J^{��\���R{D>�j�122�uq��O��.��P���wt�ֳ%1�!ݸ,?�\�?y;+]U�1J�)�ՠu�y<���3�z�P��v����&�� ��2����N�O�x��
����#��dlnW)�q������ͩ��?�［k�Ĭ�~^�\e���k�X���EZ��^�C�a�T��LBZGf-{3��&�Iڌ'���C]v��8�`2+$
eU>�����֙'z��p��Ȍ�h��t'N��5F��.��3�"�K_�D��8�9^4 ��F7��T����(^�"[����O�"0�Ē�4�җ{�X�?���/rY_(p�iQ���G�M �Tr��A���y��
�[3�iSa�WQ�w6��j�S�ӫ3�Y�� ��X��} 3�&o�~]�����.'�gV���@.�8��3�У$��
q|�WMo�7��N�C�G0�b� ��ؑ+�P�	c�?�:���K�K�^��/Cs2�g�*~�b6s]|�"�3�=���Ϟ�#�=�֔s_�,|��@�{�?�>�؅�fT�L��{����:�A���X�=��?��8w����#@�k3���U2omR�������������/*      �   e  x���[��0��a>Z�˛�FFg��_
Ŋ�D���zf_�qLfFLL��iON��S�3��PF�G���`��8���6��8a�4�݀|c�Z�[����q�_��h�
�l���a�SN��X�do�;2��p��m���͘���3��P��F!At��p�/��Q�@I���5-��s����O,��T9�uX�P��S��[䕈���V���.jW}��cMK7�&'6��f�i�L֖��i�d��!,½e6�������o�]?K�+����ȓݘJD)'�nV�/��9�<�ԩ�T���)����N��O�"����j�vjD�׉�NDu�P'�?����M�+��+���`Y����q      �   h   x�u�1@0E뿇�:�C�$cL!
�q���4�̫��%�d����6�c�b�^��c ]h��I��&����55�h����W5�͚-u�c'��Ө��*�-d     