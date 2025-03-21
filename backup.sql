PGDMP     2                    }            club_db #   15.7 (Ubuntu 15.7-0ubuntu0.23.10.1) #   15.7 (Ubuntu 15.7-0ubuntu0.23.10.1) @    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    65536    club_db    DATABASE     s   CREATE DATABASE club_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.UTF-8';
    DROP DATABASE club_db;
                matt    false            �            1259    65563    Messages    TABLE     �   CREATE TABLE public."Messages" (
    id integer NOT NULL,
    content text NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "senderId" integer,
    "receiverId" integer
);
    DROP TABLE public."Messages";
       public         heap    matt    false            �            1259    65562    Messages_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Messages_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public."Messages_id_seq";
       public          matt    false    221            �           0    0    Messages_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public."Messages_id_seq" OWNED BY public."Messages".id;
          public          matt    false    220            �            1259    65538    Roles    TABLE     �   CREATE TABLE public."Roles" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public."Roles";
       public         heap    matt    false            �            1259    65537    Roles_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Roles_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public."Roles_id_seq";
       public          matt    false    217            �           0    0    Roles_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public."Roles_id_seq" OWNED BY public."Roles".id;
          public          matt    false    216            �            1259    65547    Users    TABLE     o  CREATE TABLE public."Users" (
    id integer NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "roleId" integer,
    "firstName" character varying(255) NOT NULL,
    "lastName" character varying(255) NOT NULL
);
    DROP TABLE public."Users";
       public         heap    matt    false            �            1259    65546    Users_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Users_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public."Users_id_seq";
       public          matt    false    219            �           0    0    Users_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public."Users_id_seq" OWNED BY public."Users".id;
          public          matt    false    218            �           2604    65566    Messages id    DEFAULT     n   ALTER TABLE ONLY public."Messages" ALTER COLUMN id SET DEFAULT nextval('public."Messages_id_seq"'::regclass);
 <   ALTER TABLE public."Messages" ALTER COLUMN id DROP DEFAULT;
       public          matt    false    221    220    221            �           2604    65541    Roles id    DEFAULT     h   ALTER TABLE ONLY public."Roles" ALTER COLUMN id SET DEFAULT nextval('public."Roles_id_seq"'::regclass);
 9   ALTER TABLE public."Roles" ALTER COLUMN id DROP DEFAULT;
       public          matt    false    216    217    217            �           2604    65550    Users id    DEFAULT     h   ALTER TABLE ONLY public."Users" ALTER COLUMN id SET DEFAULT nextval('public."Users_id_seq"'::regclass);
 9   ALTER TABLE public."Users" ALTER COLUMN id DROP DEFAULT;
       public          matt    false    218    219    219            �          0    65563    Messages 
   TABLE DATA           e   COPY public."Messages" (id, content, "createdAt", "updatedAt", "senderId", "receiverId") FROM stdin;
    public          matt    false    221   �J       �          0    65538    Roles 
   TABLE DATA           E   COPY public."Roles" (id, name, "createdAt", "updatedAt") FROM stdin;
    public          matt    false    217   �K       �          0    65547    Users 
   TABLE DATA           s   COPY public."Users" (id, email, password, "createdAt", "updatedAt", "roleId", "firstName", "lastName") FROM stdin;
    public          matt    false    219   CL       �           0    0    Messages_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public."Messages_id_seq"', 39, true);
          public          matt    false    220            �           0    0    Roles_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public."Roles_id_seq"', 3, true);
          public          matt    false    216            �           0    0    Users_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public."Users_id_seq"', 19, true);
          public          matt    false    218            �           2606    65570    Messages Messages_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."Messages"
    ADD CONSTRAINT "Messages_pkey" PRIMARY KEY (id);
 D   ALTER TABLE ONLY public."Messages" DROP CONSTRAINT "Messages_pkey";
       public            matt    false    221            �           2606    114865    Roles Roles_name_key 
   CONSTRAINT     S   ALTER TABLE ONLY public."Roles"
    ADD CONSTRAINT "Roles_name_key" UNIQUE (name);
 B   ALTER TABLE ONLY public."Roles" DROP CONSTRAINT "Roles_name_key";
       public            matt    false    217            �           2606    114867    Roles Roles_name_key1 
   CONSTRAINT     T   ALTER TABLE ONLY public."Roles"
    ADD CONSTRAINT "Roles_name_key1" UNIQUE (name);
 C   ALTER TABLE ONLY public."Roles" DROP CONSTRAINT "Roles_name_key1";
       public            matt    false    217            �           2606    114885    Roles Roles_name_key10 
   CONSTRAINT     U   ALTER TABLE ONLY public."Roles"
    ADD CONSTRAINT "Roles_name_key10" UNIQUE (name);
 D   ALTER TABLE ONLY public."Roles" DROP CONSTRAINT "Roles_name_key10";
       public            matt    false    217            �           2606    114887    Roles Roles_name_key11 
   CONSTRAINT     U   ALTER TABLE ONLY public."Roles"
    ADD CONSTRAINT "Roles_name_key11" UNIQUE (name);
 D   ALTER TABLE ONLY public."Roles" DROP CONSTRAINT "Roles_name_key11";
       public            matt    false    217            �           2606    114863    Roles Roles_name_key12 
   CONSTRAINT     U   ALTER TABLE ONLY public."Roles"
    ADD CONSTRAINT "Roles_name_key12" UNIQUE (name);
 D   ALTER TABLE ONLY public."Roles" DROP CONSTRAINT "Roles_name_key12";
       public            matt    false    217            �           2606    114889    Roles Roles_name_key13 
   CONSTRAINT     U   ALTER TABLE ONLY public."Roles"
    ADD CONSTRAINT "Roles_name_key13" UNIQUE (name);
 D   ALTER TABLE ONLY public."Roles" DROP CONSTRAINT "Roles_name_key13";
       public            matt    false    217            �           2606    114861    Roles Roles_name_key14 
   CONSTRAINT     U   ALTER TABLE ONLY public."Roles"
    ADD CONSTRAINT "Roles_name_key14" UNIQUE (name);
 D   ALTER TABLE ONLY public."Roles" DROP CONSTRAINT "Roles_name_key14";
       public            matt    false    217            �           2606    114891    Roles Roles_name_key15 
   CONSTRAINT     U   ALTER TABLE ONLY public."Roles"
    ADD CONSTRAINT "Roles_name_key15" UNIQUE (name);
 D   ALTER TABLE ONLY public."Roles" DROP CONSTRAINT "Roles_name_key15";
       public            matt    false    217            �           2606    114893    Roles Roles_name_key16 
   CONSTRAINT     U   ALTER TABLE ONLY public."Roles"
    ADD CONSTRAINT "Roles_name_key16" UNIQUE (name);
 D   ALTER TABLE ONLY public."Roles" DROP CONSTRAINT "Roles_name_key16";
       public            matt    false    217            �           2606    114895    Roles Roles_name_key17 
   CONSTRAINT     U   ALTER TABLE ONLY public."Roles"
    ADD CONSTRAINT "Roles_name_key17" UNIQUE (name);
 D   ALTER TABLE ONLY public."Roles" DROP CONSTRAINT "Roles_name_key17";
       public            matt    false    217            �           2606    114897    Roles Roles_name_key18 
   CONSTRAINT     U   ALTER TABLE ONLY public."Roles"
    ADD CONSTRAINT "Roles_name_key18" UNIQUE (name);
 D   ALTER TABLE ONLY public."Roles" DROP CONSTRAINT "Roles_name_key18";
       public            matt    false    217            �           2606    114869    Roles Roles_name_key2 
   CONSTRAINT     T   ALTER TABLE ONLY public."Roles"
    ADD CONSTRAINT "Roles_name_key2" UNIQUE (name);
 C   ALTER TABLE ONLY public."Roles" DROP CONSTRAINT "Roles_name_key2";
       public            matt    false    217            �           2606    114871    Roles Roles_name_key3 
   CONSTRAINT     T   ALTER TABLE ONLY public."Roles"
    ADD CONSTRAINT "Roles_name_key3" UNIQUE (name);
 C   ALTER TABLE ONLY public."Roles" DROP CONSTRAINT "Roles_name_key3";
       public            matt    false    217            �           2606    114873    Roles Roles_name_key4 
   CONSTRAINT     T   ALTER TABLE ONLY public."Roles"
    ADD CONSTRAINT "Roles_name_key4" UNIQUE (name);
 C   ALTER TABLE ONLY public."Roles" DROP CONSTRAINT "Roles_name_key4";
       public            matt    false    217            �           2606    114875    Roles Roles_name_key5 
   CONSTRAINT     T   ALTER TABLE ONLY public."Roles"
    ADD CONSTRAINT "Roles_name_key5" UNIQUE (name);
 C   ALTER TABLE ONLY public."Roles" DROP CONSTRAINT "Roles_name_key5";
       public            matt    false    217            �           2606    114877    Roles Roles_name_key6 
   CONSTRAINT     T   ALTER TABLE ONLY public."Roles"
    ADD CONSTRAINT "Roles_name_key6" UNIQUE (name);
 C   ALTER TABLE ONLY public."Roles" DROP CONSTRAINT "Roles_name_key6";
       public            matt    false    217            �           2606    114879    Roles Roles_name_key7 
   CONSTRAINT     T   ALTER TABLE ONLY public."Roles"
    ADD CONSTRAINT "Roles_name_key7" UNIQUE (name);
 C   ALTER TABLE ONLY public."Roles" DROP CONSTRAINT "Roles_name_key7";
       public            matt    false    217            �           2606    114881    Roles Roles_name_key8 
   CONSTRAINT     T   ALTER TABLE ONLY public."Roles"
    ADD CONSTRAINT "Roles_name_key8" UNIQUE (name);
 C   ALTER TABLE ONLY public."Roles" DROP CONSTRAINT "Roles_name_key8";
       public            matt    false    217            �           2606    114883    Roles Roles_name_key9 
   CONSTRAINT     T   ALTER TABLE ONLY public."Roles"
    ADD CONSTRAINT "Roles_name_key9" UNIQUE (name);
 C   ALTER TABLE ONLY public."Roles" DROP CONSTRAINT "Roles_name_key9";
       public            matt    false    217            �           2606    65543    Roles Roles_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public."Roles"
    ADD CONSTRAINT "Roles_pkey" PRIMARY KEY (id);
 >   ALTER TABLE ONLY public."Roles" DROP CONSTRAINT "Roles_pkey";
       public            matt    false    217            �           2606    114913    Users Users_email_key 
   CONSTRAINT     U   ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_email_key" UNIQUE (email);
 C   ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_email_key";
       public            matt    false    219            �           2606    114915    Users Users_email_key1 
   CONSTRAINT     V   ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_email_key1" UNIQUE (email);
 D   ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_email_key1";
       public            matt    false    219            �           2606    114903    Users Users_email_key10 
   CONSTRAINT     W   ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_email_key10" UNIQUE (email);
 E   ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_email_key10";
       public            matt    false    219            �           2606    114911    Users Users_email_key11 
   CONSTRAINT     W   ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_email_key11" UNIQUE (email);
 E   ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_email_key11";
       public            matt    false    219            �           2606    114909    Users Users_email_key12 
   CONSTRAINT     W   ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_email_key12" UNIQUE (email);
 E   ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_email_key12";
       public            matt    false    219            �           2606    114905    Users Users_email_key13 
   CONSTRAINT     W   ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_email_key13" UNIQUE (email);
 E   ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_email_key13";
       public            matt    false    219            �           2606    114907    Users Users_email_key14 
   CONSTRAINT     W   ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_email_key14" UNIQUE (email);
 E   ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_email_key14";
       public            matt    false    219            �           2606    114931    Users Users_email_key15 
   CONSTRAINT     W   ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_email_key15" UNIQUE (email);
 E   ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_email_key15";
       public            matt    false    219            �           2606    114933    Users Users_email_key16 
   CONSTRAINT     W   ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_email_key16" UNIQUE (email);
 E   ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_email_key16";
       public            matt    false    219            �           2606    114917    Users Users_email_key2 
   CONSTRAINT     V   ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_email_key2" UNIQUE (email);
 D   ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_email_key2";
       public            matt    false    219            �           2606    114919    Users Users_email_key3 
   CONSTRAINT     V   ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_email_key3" UNIQUE (email);
 D   ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_email_key3";
       public            matt    false    219            �           2606    114921    Users Users_email_key4 
   CONSTRAINT     V   ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_email_key4" UNIQUE (email);
 D   ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_email_key4";
       public            matt    false    219            �           2606    114923    Users Users_email_key5 
   CONSTRAINT     V   ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_email_key5" UNIQUE (email);
 D   ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_email_key5";
       public            matt    false    219            �           2606    114925    Users Users_email_key6 
   CONSTRAINT     V   ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_email_key6" UNIQUE (email);
 D   ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_email_key6";
       public            matt    false    219            �           2606    114927    Users Users_email_key7 
   CONSTRAINT     V   ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_email_key7" UNIQUE (email);
 D   ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_email_key7";
       public            matt    false    219            �           2606    114929    Users Users_email_key8 
   CONSTRAINT     V   ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_email_key8" UNIQUE (email);
 D   ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_email_key8";
       public            matt    false    219            �           2606    114901    Users Users_email_key9 
   CONSTRAINT     V   ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_email_key9" UNIQUE (email);
 D   ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_email_key9";
       public            matt    false    219            �           2606    65554    Users Users_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_pkey" PRIMARY KEY (id);
 >   ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_pkey";
       public            matt    false    219            �           2606    114944 !   Messages Messages_receiverId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Messages"
    ADD CONSTRAINT "Messages_receiverId_fkey" FOREIGN KEY ("receiverId") REFERENCES public."Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 O   ALTER TABLE ONLY public."Messages" DROP CONSTRAINT "Messages_receiverId_fkey";
       public          matt    false    219    221    3323                        2606    114939    Messages Messages_senderId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Messages"
    ADD CONSTRAINT "Messages_senderId_fkey" FOREIGN KEY ("senderId") REFERENCES public."Users"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 M   ALTER TABLE ONLY public."Messages" DROP CONSTRAINT "Messages_senderId_fkey";
       public          matt    false    221    219    3323            �           2606    114934    Users Users_roleId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_roleId_fkey" FOREIGN KEY ("roleId") REFERENCES public."Roles"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 E   ALTER TABLE ONLY public."Users" DROP CONSTRAINT "Users_roleId_fkey";
       public          matt    false    217    3287    219            �   �   x�}�1r1Ek��3fB t�����l�珼֬������lpN\�)_�/�i#C����?D��+l���h�8�P8lS�����pFOCN�0��9GU�
�I�-J�g4y�$K+���&��.�f`kY����
����c�`�74:�aM��/Du؇�Ϯ;4~�����D%Έ|8��i��+(&��@O��e�w��      �   U   x�3�t/M-.�4202�50�50U02�25�26�342�60�#�e�雚��Z�U���.�).cNǔ��<�J,�pi�p��qqq �M&      �     x�}�ɲ�H��)�v����E@� 8A�yRq ��5*��CV���q�8�'QgSE�_g��;����զ�?�a�ũt8e=�E/ӝ|���s��Ҋx�����U�s$����t0��OH~B���{� 8�����:_��:� j�k?��7]鿻2�S�J��"	'w��=�h�����+?7x�_�ri���~������l���G-���C�(m��;+_�`�)ʠ�'9�f���.{E��
u��ja*]i��p���|B��lB@��ģD�	�w^zB���g}����9ާ��}�-�&U��O�ՠ/yz�'+�dx�:��`��z=��Ba��(	�w�Z�����T2\Pj����=Y%�TJ^�q�K�E�#�4_k=�ċ�cDsq�6��6y��*$�s��d�2ý�r0��F�d&\�r�]�<C�i;^]�a�����b���X
�)���N���;�X�-c2�7_�r2s
53����60g9��8�u�fy
��!�O���ݏ��3�����3��P��w�%�n5��<��2I���Dx�nC�ry���	�O���h���F�ݻ� ��G�=���'��H���3)!�Sl�,XK9τS���p���s���uwx���]A0 �р>���hJ��W.���Ŕ,>˭7��B3��˪3�J?�<��c�JR���!�P8 �]�;�*Q�?��㯿w�[B:�D-؇��@I�*�b0
'�֤1q59�Q4�SY��z��<!����~��DT~�gJ��ݚH���'^*�Jn9'E�MM�keLLi^.�������K����0�[�*�aT�Hj[<��㻤\\\�.�#��"Y�3ʌ0m�M4��vn`;o=����iA�hD�71MR���F�N�q�?��k1�k0���)��n�Ђ#H$�c���*��Ww����+�M�>
�ƾW���sPZv��,�aw���E{Vvy�Ǝ�W6t���L�?���y��=� �R�	u��_ ��K
N���t2��%p���@7Ki�D� �*���L���`������!~ޮ�}` �ৗ%��N��ɽ{�1��y��ԭ��Hߪk��0��e�;}9�`kycw<rE|�Y�@n7� Rt�Q'h���A�����vw��u'�Wª�gny�;O���9W�*ĚcT�Z��)��>&:i��I��O&�Hd^q�Q'��/�@�-�������ƅ%��6R�.MI��r3E��/�i�n���p5�����)�Ǥ�g����|||�z@�     