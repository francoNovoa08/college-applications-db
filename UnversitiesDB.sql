PGDMP  $    ,                 }            UniversitiesDB    17.2    17.2 '    #           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            $           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            %           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            &           1262    16396    UniversitiesDB    DATABASE     �   CREATE DATABASE "UniversitiesDB" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United Kingdom.1252';
     DROP DATABASE "UniversitiesDB";
                     postgres    false            \           1247    16435    poltiical_orientation    TYPE     �   CREATE TYPE public.poltiical_orientation AS ENUM (
    'extreme left',
    'strong left',
    'left',
    'centre',
    'right',
    'strong right',
    'extreme right'
);
 (   DROP TYPE public.poltiical_orientation;
       public               postgres    false            �            1259    16397    cities    TABLE     x   CREATE TABLE public.cities (
    id integer NOT NULL,
    city character varying(100) NOT NULL,
    state_id integer
);
    DROP TABLE public.cities;
       public         heap r       postgres    false            �            1259    16458 	   countries    TABLE     [   CREATE TABLE public.countries (
    id integer NOT NULL,
    name character varying(15)
);
    DROP TABLE public.countries;
       public         heap r       postgres    false            �            1259    16449    states    TABLE     p   CREATE TABLE public.states (
    id integer NOT NULL,
    name character varying(60),
    country_id integer
);
    DROP TABLE public.states;
       public         heap r       postgres    false            �            1259    16402    tests    TABLE     �   CREATE TABLE public.tests (
    id integer NOT NULL,
    name character varying(5) NOT NULL,
    requirement_type character varying(10)
);
    DROP TABLE public.tests;
       public         heap r       postgres    false            �            1259    16409    universities    TABLE       CREATE TABLE public.universities (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    city_id integer,
    application_deadline character varying(7),
    acceptance_rate integer,
    tuition integer,
    student_to_faculty_ratio character varying(5)
);
     DROP TABLE public.universities;
       public         heap r       postgres    false            �            1259    16419    universities_tests    TABLE     �   CREATE TABLE public.universities_tests (
    id integer NOT NULL,
    university_id integer NOT NULL,
    test_id integer,
    score_average integer,
    score_requirement real
);
 &   DROP TABLE public.universities_tests;
       public         heap r       postgres    false                      0    16397    cities 
   TABLE DATA           4   COPY public.cities (id, city, state_id) FROM stdin;
    public               postgres    false    217   �,                  0    16458 	   countries 
   TABLE DATA           -   COPY public.countries (id, name) FROM stdin;
    public               postgres    false    222   �-                 0    16449    states 
   TABLE DATA           6   COPY public.states (id, name, country_id) FROM stdin;
    public               postgres    false    221   �-                 0    16402    tests 
   TABLE DATA           ;   COPY public.tests (id, name, requirement_type) FROM stdin;
    public               postgres    false    218   \.                 0    16409    universities 
   TABLE DATA           �   COPY public.universities (id, name, city_id, application_deadline, acceptance_rate, tuition, student_to_faculty_ratio) FROM stdin;
    public               postgres    false    219   �.                 0    16419    universities_tests 
   TABLE DATA           j   COPY public.universities_tests (id, university_id, test_id, score_average, score_requirement) FROM stdin;
    public               postgres    false    220   <0       �           2606    16462    countries countries_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.countries DROP CONSTRAINT countries_pkey;
       public                 postgres    false    222            p           2606    16401    cities locations_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.cities
    ADD CONSTRAINT locations_pkey PRIMARY KEY (id);
 ?   ALTER TABLE ONLY public.cities DROP CONSTRAINT locations_pkey;
       public                 postgres    false    217            �           2606    16453    states states_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.states
    ADD CONSTRAINT states_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.states DROP CONSTRAINT states_pkey;
       public                 postgres    false    221            s           2606    16408    tests tests_name_key 
   CONSTRAINT     O   ALTER TABLE ONLY public.tests
    ADD CONSTRAINT tests_name_key UNIQUE (name);
 >   ALTER TABLE ONLY public.tests DROP CONSTRAINT tests_name_key;
       public                 postgres    false    218            u           2606    16406    tests tests_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.tests
    ADD CONSTRAINT tests_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.tests DROP CONSTRAINT tests_pkey;
       public                 postgres    false    218            {           2606    16413    universities universities_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.universities
    ADD CONSTRAINT universities_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.universities DROP CONSTRAINT universities_pkey;
       public                 postgres    false    219            �           2606    16423 *   universities_tests universities_tests_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.universities_tests
    ADD CONSTRAINT universities_tests_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.universities_tests DROP CONSTRAINT universities_tests_pkey;
       public                 postgres    false    220            v           1259    16949    idx_acceptance_rate    INDEX     W   CREATE INDEX idx_acceptance_rate ON public.universities USING btree (acceptance_rate);
 '   DROP INDEX public.idx_acceptance_rate;
       public                 postgres    false    219            w           1259    16950    idx_application_deadline    INDEX     a   CREATE INDEX idx_application_deadline ON public.universities USING btree (application_deadline);
 ,   DROP INDEX public.idx_application_deadline;
       public                 postgres    false    219            m           1259    16957    idx_city    INDEX     ;   CREATE INDEX idx_city ON public.cities USING btree (city);
    DROP INDEX public.idx_city;
       public                 postgres    false    217            x           1259    16947    idx_location_id    INDEX     K   CREATE INDEX idx_location_id ON public.universities USING btree (city_id);
 #   DROP INDEX public.idx_location_id;
       public                 postgres    false    219            y           1259    16948    idx_name    INDEX     A   CREATE INDEX idx_name ON public.universities USING btree (name);
    DROP INDEX public.idx_name;
       public                 postgres    false    219            n           1259    16958 	   idx_state    INDEX     @   CREATE INDEX idx_state ON public.cities USING btree (state_id);
    DROP INDEX public.idx_state;
       public                 postgres    false    217            |           1259    16945    idx_test_id    INDEX     M   CREATE INDEX idx_test_id ON public.universities_tests USING btree (test_id);
    DROP INDEX public.idx_test_id;
       public                 postgres    false    220            q           1259    16951    idx_test_name    INDEX     ?   CREATE INDEX idx_test_name ON public.tests USING btree (name);
 !   DROP INDEX public.idx_test_name;
       public                 postgres    false    218            }           1259    16944    idx_university_id    INDEX     Y   CREATE INDEX idx_university_id ON public.universities_tests USING btree (university_id);
 %   DROP INDEX public.idx_university_id;
       public                 postgres    false    220            ~           1259    16946    idx_university_test    INDEX     d   CREATE INDEX idx_university_test ON public.universities_tests USING btree (university_id, test_id);
 '   DROP INDEX public.idx_university_test;
       public                 postgres    false    220    220            �           2606    16463    cities locations_state_id_fkey    FK CONSTRAINT        ALTER TABLE ONLY public.cities
    ADD CONSTRAINT locations_state_id_fkey FOREIGN KEY (state_id) REFERENCES public.states(id);
 H   ALTER TABLE ONLY public.cities DROP CONSTRAINT locations_state_id_fkey;
       public               postgres    false    4738    217    221            �           2606    16473    states states_country_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.states
    ADD CONSTRAINT states_country_id_fkey FOREIGN KEY (country_id) REFERENCES public.countries(id);
 G   ALTER TABLE ONLY public.states DROP CONSTRAINT states_country_id_fkey;
       public               postgres    false    221    222    4740            �           2606    16414 *   universities universities_location_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.universities
    ADD CONSTRAINT universities_location_id_fkey FOREIGN KEY (city_id) REFERENCES public.cities(id);
 T   ALTER TABLE ONLY public.universities DROP CONSTRAINT universities_location_id_fkey;
       public               postgres    false    219    217    4720            �           2606    16429 2   universities_tests universities_tests_test_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.universities_tests
    ADD CONSTRAINT universities_tests_test_id_fkey FOREIGN KEY (test_id) REFERENCES public.tests(id);
 \   ALTER TABLE ONLY public.universities_tests DROP CONSTRAINT universities_tests_test_id_fkey;
       public               postgres    false    220    218    4725            �           2606    16424 8   universities_tests universities_tests_university_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.universities_tests
    ADD CONSTRAINT universities_tests_university_id_fkey FOREIGN KEY (university_id) REFERENCES public.universities(id);
 b   ALTER TABLE ONLY public.universities_tests DROP CONSTRAINT universities_tests_university_id_fkey;
       public               postgres    false    220    4731    219               �   x�M��JA���O�O��ߣ1�B�A���tv�lfdf�����[���x��>�ì`*�>�VPR�Q��	*��&��X�}NͿ�@-^��x�ᄚ:l�bc�z�6���
�ACFc��[>M�7�wXk8��L3�9�$;��5>�EZ�
[�{7g�f�c�n��:�;&�IC��[��]l�(WMI�wX�x�s��E�d���>VD�
KI�             x�3�v�2������� ��         x   x�%��
�@�=#$��ADA�*2$c\\fag���]�cuQ]��fܾwCEK4�+e\p��������U~ϳd��`����Oj�&�J��/��I��s��A��ڡ���qO�S�cADm�(O         8   x�3�v�H-JN�+��I�2��t�		����N�/J�2��wu�A��qqq �x�         �  x�]R]k1|���.Z}��>�LC
��(��(����@v��]�l
}�ӌfgFK�><��=��"X8�|���}��aL�s޿C/y<Cka�i:5�YF>X����R�6c>̢�8��FA[X} Ea9e<�zO��Wק߯u|;d8lS]� M��Y)��x|��D2p�8����Ķ�����+(\n�'Y�6�B�\
�MЃ���a���Q����o�[)����� ���@��|<ͥ�g�uxkS�ڰZr��K����i9��S��iV�r��S�M�_Zk�/m�E?ג��W��H+ui��茶��@��ql��e��=@���׶.�V�(^ۋ��]�>K$Ȩ������%`�Y�>%�F8#�磕+���e�Z��Џ4           x�M�ٱ!�E0.tp%�"p�qX#q��mzg�L�_3��__�/�k-�i|Z1��6x�)�UK�Uje�fXH��-�mq%���Bc&Kojaq8�R{lNg�Q�6-^ĝ�?q8�޼h�=�4N�0�h[�������D�)6���^�u��F"�8�;R�,�-����'le�� w��X%���j��6�q}2����s'0܎^*.��pV�a�U[.�Z����o�p����t�v��bl���F�-�`�(�E5m|��t�?��/�p�     