/*TRI SELECTIF V1.0*/
/*Creation du squelette de la structure des données */
/* tri_10_squelette.sql */
/*PostGIS*/

/* Propriétaire : GeoCompiegnois - http://geo.compiegnois.fr/ */
/* Auteur : Grégory Bodet */


-- ####################################################################################################################################################
-- ###                                                                                                                                              ###
-- ###                                                                SCHEMA                                                                        ###
-- ###                                                                                                                                              ###
-- ####################################################################################################################################################

/*
-- Schema: m_dechet

-- DROP SCHEMA m_dechet;

CREATE SCHEMA m_dechet
  AUTHORIZATION sig_create;
  
COMMENT ON SCHEMA m_dechet
  IS 'Données métiers sur le thème des déchets et du recyclage';
  
*/

-- ####################################################################################################################################################
-- ###                                                                                                                                              ###
-- ###                                                                SEQUENCE                                                                      ###
-- ###                                                                                                                                              ###
-- ####################################################################################################################################################

DROP SEQUENCE IF EXISTS m_dechet.geo_dec_pav_lieu_idlieu_seq;
DROP SEQUENCE IF EXISTS m_dechet.an_dec_pav_cont_idcont_seq;
DROP SEQUENCE IF EXISTS m_dechet.an_dec_pav_doc_media_gid_seq;

-- ################################################################# Séquence sur TABLE  ###############################################

-- SEQUENCE: m_dechet.geo_dec_pav_lieu_idlieu_seq

-- DROP SEQUENCE m_dechet.geo_dec_pav_lieu_idlieu_seq;

CREATE SEQUENCE m_dechet.geo_dec_pav_lieu_idlieu_seq
    INCREMENT 1
    START 424
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

COMMENT ON SEQUENCE m_dechet.geo_dec_pav_lieu_idlieu_seq
    IS 'Séquence d''incrémentation d''un numéro automatique sur le champ idlieu de la table geo_dec_pav_lieu';
    
-- SEQUENCE: m_dechet.an_dec_pav_cont_idcont_seq

-- DROP SEQUENCE m_dechet.an_dec_pav_cont_idcont_seq;

CREATE SEQUENCE m_dechet.an_dec_pav_cont_idcont_seq
    INCREMENT 1
    START 362
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE m_dechet.an_dec_pav_cont_idcont_seq
    OWNER TO sig_create;

-- SEQUENCE: m_dechet.an_dec_pav_doc_media_gid_seq

-- DROP SEQUENCE m_dechet.an_dec_pav_doc_media_gid_seq;

CREATE SEQUENCE m_dechet.an_dec_pav_doc_media_gid_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

  
  
-- ####################################################################################################################################################
-- ###                                                                                                                                              ###
-- ###                                                                DOMAINE DE VALEURS                                                            ###
-- ###                                                                                                                                              ###
-- ####################################################################################################################################################


-- fkey
ALTER TABLE m_dechet.geo_dec_pav_lieu DROP CONSTRAINT IF EXISTS geo_dec_pav_lieu_contrat_fkey;
ALTER TABLE m_dechet.geo_dec_pav_lieu DROP CONSTRAINT IF EXISTS geo_dec_pav_lieu_cttype_fkey;
ALTER TABLE m_dechet.geo_dec_pav_lieu DROP CONSTRAINT IF EXISTS geo_dec_pav_lieu_envimplan_fkey;
ALTER TABLE m_dechet.geo_dec_pav_lieu DROP CONSTRAINT IF EXISTS geo_dec_pav_lieu_envsitu_fkey;
ALTER TABLE m_dechet.geo_dec_pav_lieu DROP CONSTRAINT IF EXISTS geo_dec_pav_lieu_envtype_fkey;
ALTER TABLE m_dechet.geo_dec_pav_lieu DROP CONSTRAINT IF EXISTS geo_dec_pav_lieu_model_fkey;
ALTER TABLE m_dechet.geo_dec_pav_lieu DROP CONSTRAINT IF EXISTS geo_dec_pav_lieu_natpb_fkey;
ALTER TABLE m_dechet.geo_dec_pav_lieu DROP CONSTRAINT IF EXISTS geo_dec_pav_lieu_orient_fkey;
ALTER TABLE m_dechet.geo_dec_pav_lieu DROP CONSTRAINT IF EXISTS geo_dec_pav_lieu_propabord_fkey;
ALTER TABLE m_dechet.geo_dec_pav_lieu DROP CONSTRAINT IF EXISTS geo_dec_pav_lieu_srcgeom_fkey;
ALTER TABLE m_dechet.geo_dec_pav_lieu DROP CONSTRAINT IF EXISTS geo_dec_pav_lieu_statut_fkey;

ALTER TABLE m_dechet.an_dec_pav_cont DROP CONSTRAINT IF EXISTS an_dec_pav_cont_crochet_fkey;
ALTER TABLE m_dechet.an_dec_pav_cont DROP CONSTRAINT IF EXISTS an_dec_pav_cont_etatsign_fkey;
ALTER TABLE m_dechet.an_dec_pav_cont DROP CONSTRAINT IF EXISTS an_dec_pav_cont_eve_fkey;
ALTER TABLE m_dechet.an_dec_pav_cont DROP CONSTRAINT IF EXISTS an_dec_pav_cont_mat_fkey;
ALTER TABLE m_dechet.an_dec_pav_cont DROP CONSTRAINT IF EXISTS an_dec_pav_cont_model_fkey;
ALTER TABLE m_dechet.an_dec_pav_cont DROP CONSTRAINT IF EXISTS an_dec_pav_cont_modepreh_fkey;
ALTER TABLE m_dechet.an_dec_pav_cont DROP CONSTRAINT IF EXISTS an_dec_pav_cont_peinture_fkey;
ALTER TABLE m_dechet.an_dec_pav_cont DROP CONSTRAINT IF EXISTS an_dec_pav_cont_pos_fkey;
ALTER TABLE m_dechet.an_dec_pav_cont DROP CONSTRAINT IF EXISTS an_dec_pav_cont_prop_fkey;
ALTER TABLE m_dechet.an_dec_pav_cont DROP CONSTRAINT IF EXISTS an_dec_pav_cont_typesign_fkey;
ALTER TABLE m_dechet.an_dec_pav_cont DROP CONSTRAINT IF EXISTS an_dec_pav_cont_typesol_fkey;

ALTER TABLE m_dechet.an_dec_pav_cont_tlc DROP CONSTRAINT IF EXISTS an_dec_pav_cont_tlc_eve_fkey;
ALTER TABLE m_dechet.an_dec_pav_cont_tlc DROP CONSTRAINT IF EXISTS an_dec_pav_cont_tlc_gest_fkey;
ALTER TABLE m_dechet.an_dec_pav_cont_tlc DROP CONSTRAINT IF EXISTS an_dec_pav_cont_tlc_mat_fkey;
ALTER TABLE m_dechet.an_dec_pav_cont_tlc DROP CONSTRAINT IF EXISTS an_dec_pav_cont_tlc_model_fkey;
ALTER TABLE m_dechet.an_dec_pav_cont_tlc DROP CONSTRAINT IF EXISTS an_dec_pav_cont_tlc_pos_fkey;


-- domaine de valeur
DROP TABLE IF EXISTS m_dechet.lt_pav_contmat;
DROP TABLE IF EXISTS m_dechet.lt_pav_contpos;
DROP TABLE IF EXISTS m_dechet.lt_pav_crochet;
DROP TABLE IF EXISTS m_dechet.lt_pav_envimplan;
DROP TABLE IF EXISTS m_dechet.lt_pav_envsitu;
DROP TABLE IF EXISTS m_dechet.lt_pav_envtype;
DROP TABLE IF EXISTS m_dechet.lt_pav_etatsign;
DROP TABLE IF EXISTS m_dechet.lt_pav_gest;
DROP TABLE IF EXISTS m_dechet.lt_pav_modepreh;
DROP TABLE IF EXISTS m_dechet.lt_pav_natpb;
DROP TABLE IF EXISTS m_dechet.lt_pav_pavorient;
DROP TABLE IF EXISTS m_dechet.lt_pav_peinture;
DROP TABLE IF EXISTS m_dechet.lt_pav_proprete;
DROP TABLE IF EXISTS m_dechet.lt_pav_statut;
DROP TABLE IF EXISTS m_dechet.lt_pav_typesign;
DROP TABLE IF EXISTS m_dechet.lt_pav_typesol;
DROP TABLE IF EXISTS m_dechet.lt_pav_cttype;
DROP TABLE IF EXISTS m_dechet.lt_pav_eve;
DROP TABLE IF EXISTS m_dechet.lt_pav_modele;

-- ################################################################# Domaine valeur - lt_pav_contmat  ###############################################

-- Table: m_dechet.lt_pav_contmat

-- DROP TABLE m_dechet.lt_pav_contmat;

CREATE TABLE m_dechet.lt_pav_contmat
(
  cont_mat character varying(2) NOT NULL, -- Code matériaux constituant le conteneur
  cont_mat_lib character varying(30), -- Libellé des matériaux constituant le conteneur
  CONSTRAINT lt_pav_contmat_pkkey PRIMARY KEY (cont_mat) -- Clé primaire de la table lt_pav_contmat
)
WITH (
  OIDS=FALSE
);
COMMENT ON TABLE m_dechet.lt_pav_contmat
  IS 'Liste de valeurs des codes matériaux constituant le conteneur';
COMMENT ON COLUMN m_dechet.lt_pav_contmat.cont_mat IS 'Code matériaux constituant le conteneur';
COMMENT ON COLUMN m_dechet.lt_pav_contmat.cont_mat_lib IS 'Libellé des matériaux constituant le conteneur';

COMMENT ON CONSTRAINT lt_pav_contmat_pkkey ON m_dechet.lt_pav_contmat IS 'Clé primaire de la table lt_pav_contmat';

INSERT INTO m_dechet.lt_pav_contmat(
            cont_mat, cont_mat_lib)
    VALUES
    ('00','Non renseigné'),
    ('10','Métal'),
    ('20','Plastique'),
    ('21','Plastique + bois'), 
    ('30','Résine'), 
    ('40','Bois');
    
    
-- ################################################################# Domaine valeur - lt_pav_contpos  ###############################################

-- Table: m_dechet.lt_pav_contpos

-- DROP TABLE m_dechet.lt_pav_contpos;

CREATE TABLE m_dechet.lt_pav_contpos
(
  code character varying(2) NOT NULL, -- code du type de position du conteneur
  valeur character varying(30), -- libellé du type de position du conteneur
  CONSTRAINT lt_pav_contpos_pkkey PRIMARY KEY (code) -- Clé primaire de la table lt_pav_contpos
)
WITH (
  OIDS=FALSE
);

COMMENT ON TABLE m_dechet.lt_pav_contpos
  IS 'Liste de valeurs des codes du type de position du conteneur';
COMMENT ON COLUMN m_dechet.lt_pav_contpos.code IS 'code du type de position du conteneur';
COMMENT ON COLUMN m_dechet.lt_pav_contpos.valeur IS 'libellé du type de position du conteneur';
COMMENT ON CONSTRAINT lt_pav_contpos_pkkey ON m_dechet.lt_pav_contpos IS 'Clé primaire de la table lt_pav_contpos';

INSERT INTO m_dechet.lt_pav_contpos(
            code, valeur)
    VALUES
    ('00','Non renseigné'),
    ('10','Aérien'),
    ('20','Enterré'),
    ('30','Semi-enterré'); 
    
-- ################################################################# Domaine valeur - lt_pav_crochet  ###############################################

-- Table: m_dechet.lt_pav_crochet

-- DROP TABLE m_dechet.lt_pav_crochet;

CREATE TABLE m_dechet.lt_pav_crochet
(
  code character varying(2) NOT NULL, -- code de l'état du crochet
  valeur character varying(30), -- libellé de l'état du crochet
  CONSTRAINT lt_pav_crochet_pkkey PRIMARY KEY (code) -- Clé primaire de la table lt_pav_crochet
)
WITH (
  OIDS=FALSE
);

COMMENT ON TABLE m_dechet.lt_pav_crochet
  IS 'Liste de valeurs des codes de l''état du crochet ';
COMMENT ON COLUMN m_dechet.lt_pav_crochet.code IS 'code de l''état du crochet ';
COMMENT ON COLUMN m_dechet.lt_pav_crochet.valeur IS 'libellé de l''état du crochet ';

COMMENT ON CONSTRAINT lt_pav_crochet_pkkey ON m_dechet.lt_pav_crochet IS 'Clé primaire de la table lt_pav_crochet';

INSERT INTO m_dechet.lt_pav_crochet(
            code, valeur)
    VALUES
    ('00','Non renseigné'),
    ('10','RAS'),
    ('20','Tordu');

-- ################################################################# Domaine valeur - lt_pav_cttype  ###############################################

-- Table: m_dechet.lt_pav_cttype

-- DROP TABLE m_dechet.lt_pav_cttype;

CREATE TABLE m_dechet.lt_pav_cttype
(
    code character varying(2) COLLATE pg_catalog."default" NOT NULL,
    valeur character varying(30) COLLATE pg_catalog."default",
    CONSTRAINT lt_pav_cttype_pkkey PRIMARY KEY (code)
)
WITH (
    OIDS = FALSE
);

COMMENT ON TABLE m_dechet.lt_pav_cttype
    IS 'Liste de valeurs des codes du type de signalétique';
COMMENT ON COLUMN m_dechet.lt_pav_cttype.code
    IS 'code du type de conteneur';
COMMENT ON COLUMN m_dechet.lt_pav_cttype.valeur
    IS 'Libellé du type de conteneur';

INSERT INTO m_dechet.lt_pav_cttype(
            code, valeur)
    VALUES
    ('00','Non renseigné'),
    ('10','Verre'),
    ('20','TLC'),
    ('30','Verre et TLC'),
    ('40','Aucun');

    
-- ################################################################# Domaine valeur - lt_pav_envimplan  ###############################################

-- Table: m_dechet.lt_pav_envimplan

-- DROP TABLE m_dechet.lt_pav_envimplan;

CREATE TABLE m_dechet.lt_pav_envimplan
(
  code character varying(2) NOT NULL, -- code du type d'espace urbain d'implantation
  valeur character varying(30), -- libellé du type d'espace urbain d'implantation
  CONSTRAINT lt_pav_envimplan_pkkey PRIMARY KEY (code) -- Clé primaire de la table lt_pav_envimplan
)
WITH (
  OIDS=FALSE
);

COMMENT ON TABLE m_dechet.lt_pav_envimplan
  IS 'Liste de valeurs des codes du type d''espace urbain d''implantation';
COMMENT ON COLUMN m_dechet.lt_pav_envimplan.env_implan IS 'code du type d''espace urbain d''implantation';
COMMENT ON COLUMN m_dechet.lt_pav_envimplan.env_implan_lib IS 'libellé du type d''espace urbain d''implantation';

COMMENT ON CONSTRAINT lt_pav_envimplan_pkkey ON m_dechet.lt_pav_envimplan IS 'Clé primaire de la table lt_pav_envimplan';

INSERT INTO m_dechet.lt_pav_envimplan(
            code, valeur)
    VALUES
    ('00','Non renseigné'),
    ('10','Pavillonnaire'),
    ('20','Collectif'),
    ('30','Mixte (y compris ZI)'),
    ('40','Professionnel');
    
-- ################################################################# Domaine valeur - lt_pav_envsitu  ###############################################

-- Table: m_dechet.lt_pav_envsitu

-- DROP TABLE m_dechet.lt_pav_envsitu;

CREATE TABLE m_dechet.lt_pav_envsitu
(
  code character varying(2) NOT NULL, -- code de la situation domaniale
  valeur character varying(30), -- libellé du type de la situation domaniale
  CONSTRAINT lt_pav_envsitu_pkkey PRIMARY KEY (code) -- Clé primaire de la table lt_pav_envsitu
)
WITH (
  OIDS=FALSE
);

COMMENT ON TABLE m_dechet.lt_pav_envsitu
  IS 'Liste de valeurs des codes de la situation domaniale';
COMMENT ON COLUMN m_dechet.lt_pav_envsitu.code IS 'code de la situation domaniale';
COMMENT ON COLUMN m_dechet.lt_pav_envsitu.valeur IS 'libellé du type de la situation domaniale';

COMMENT ON CONSTRAINT lt_pav_envsitu_pkkey ON m_dechet.lt_pav_envsitu IS 'Clé primaire de la table lt_pav_envsitu';

INSERT INTO m_dechet.lt_pav_envsitu(
            code, valeur)
    VALUES
    ('00','Non renseigné'),
    ('10','Terrain privé'),
    ('20','Terrain public');
    
-- ################################################################# Domaine valeur - lt_pav_envtype  ###############################################

-- Table: m_dechet.lt_pav_envtype

-- DROP TABLE m_dechet.lt_pav_envtype;

CREATE TABLE m_dechet.lt_pav_envtype
(
  code character varying(2) NOT NULL, -- code du type d'espace géographique
  valeur character varying(30), -- libellé du type d'espace géographique
  CONSTRAINT lt_pav_envtype_pkkey PRIMARY KEY (code) -- Clé primaire de la table lt_pav_envtype
)
WITH (
  OIDS=FALSE
);

COMMENT ON TABLE m_dechet.lt_pav_envtype
  IS 'Liste de valeurs des codes du type d''espace géographique';
COMMENT ON COLUMN m_dechet.lt_pav_envtype.code IS 'code du type d''espace géographique';
COMMENT ON COLUMN m_dechet.lt_pav_envtype.valeur IS 'libellé du type d''espace géographique';

COMMENT ON CONSTRAINT lt_pav_envtype_pkkey ON m_dechet.lt_pav_envtype IS 'Clé primaire de la table lt_pav_envtype';


INSERT INTO m_dechet.lt_pav_envtype(
            code, valeur)
    VALUES
    ('00','Non renseigné'),
    ('10','Urbain'),
    ('20','Rural'); 
    
    
-- ################################################################# Domaine valeur - lt_pav_etatsign  ###############################################

-- Table: m_dechet.lt_pav_etatsign

-- DROP TABLE m_dechet.lt_pav_etatsign;

CREATE TABLE m_dechet.lt_pav_etatsign
(
  code character varying(2) NOT NULL, -- Code matériaux constituant le conteneur
  valeur character varying(30), -- Libellé des matériaux constituant le conteneur
  CONSTRAINT lt_pav_etat_sign_pkkey PRIMARY KEY (code) -- Clé primaire de la table lt_pav_etat_sign
)
WITH (
  OIDS=FALSE
);

COMMENT ON TABLE m_dechet.lt_pav_etatsign
  IS 'Liste de valeurs de l''état de la signalitique';
COMMENT ON COLUMN m_dechet.lt_pav_etatsign.code IS 'Code matériaux constituant le conteneur';
COMMENT ON COLUMN m_dechet.lt_pav_etatsign.valeur IS 'Libellé des matériaux constituant le conteneur';

COMMENT ON CONSTRAINT lt_pav_etat_sign_pkkey ON m_dechet.lt_pav_etatsign IS 'Clé primaire de la table lt_pav_etat_sign';


INSERT INTO m_dechet.lt_pav_etatsign(
            code, valeur)
    VALUES
    ('00','Non renseigné'),
    ('10','Correct'),
    ('20','Moyen'), 
    ('30','Mauvais'),
    ('40','Incomplet'); 
    
-- ################################################################# Domaine valeur - lt_pav_eve  ###############################################

-- Table: m_dechet.lt_pav_eve

-- DROP TABLE m_dechet.lt_pav_eve;

CREATE TABLE m_dechet.lt_pav_eve
(
    code character varying(2) COLLATE pg_catalog."default" NOT NULL,
    valeur character varying(50) COLLATE pg_catalog."default",
    CONSTRAINT lt_pav_eve_pkkey PRIMARY KEY (code)
)
WITH (
    OIDS = FALSE
);


COMMENT ON TABLE m_dechet.lt_pav_eve
    IS 'Liste de valeurs des codes du type de signalétique';

COMMENT ON COLUMN m_dechet.lt_pav_eve.code
    IS 'code de l''évènement du conteneur';

COMMENT ON COLUMN m_dechet.lt_pav_eve.valeur
    IS 'Libellé de l''évènement';

INSERT INTO m_dechet.lt_pav_eve(
            code, valeur)
    VALUES
    ('00','Non renseigné'),
    ('10','Ajout (initialisation de la base de donnée)'),
    ('11','Ajout (nouveau lieu de collecte)'), 
    ('12','Ajout (dû à un remplacement)'),
    ('13','Ajout (pour un complément)'),
    ('14','Ajout (dû à un déplacement du lieu de collecte)'),    
    ('20','Déposé'),
    ('21','Déposé (suppression du lieu de collecte)'),
    ('30','Remplacé (à l''identique)'),
    ('31','Remplacé (par un autre modèle)'); 
    
-- ################################################################# Domaine valeur - lt_pav_gest  ###############################################

-- Table: m_dechet.lt_pav_gest

-- DROP TABLE m_dechet.lt_pav_gest;

CREATE TABLE m_dechet.lt_pav_gest
(
  code character varying(2) NOT NULL, -- code du gestionnaire du PAV TLC
  valeur character varying(30), -- Libellé du code du gestionnaire du PAV TLC
  CONSTRAINT lt_pav_gest_pkkey PRIMARY KEY (code) -- Clé primaire de la table lt_pav_gest
)
WITH (
  OIDS=FALSE
);

COMMENT ON TABLE m_dechet.lt_pav_gest
  IS 'Liste de valeurs des codes des gestionnaire du PAV TLC';
COMMENT ON COLUMN m_dechet.lt_pav_gest.code IS 'code du gestionnaire du PAV TLC';
COMMENT ON COLUMN m_dechet.lt_pav_gest.valeur IS 'Libellé du code du gestionnaire du PAV TLC';

COMMENT ON CONSTRAINT lt_pav_gest_pkkey ON m_dechet.lt_pav_gest IS 'Clé primaire de la table lt_pav_gest';


INSERT INTO m_dechet.lt_pav_gest(
            code, valeur)
    VALUES
    ('00','Non renseigné'),
    ('10','Le Relais'),
    ('20','Eco Textile'), 
    ('99','Autre'); 
    
-- ################################################################# Domaine valeur - lt_pav_modele  #################################################

-- Table: m_dechet.lt_pav_modele

-- DROP TABLE m_dechet.lt_pav_modele;

CREATE TABLE m_dechet.lt_pav_modele
(
    code character varying(2) COLLATE pg_catalog."default" NOT NULL,
    valeur character varying(50) COLLATE pg_catalog."default",
    nomfic character varying(254) COLLATE pg_catalog."default",
    urlfic character varying(254) COLLATE pg_catalog."default",
    CONSTRAINT lt_pav_modele_pkkey PRIMARY KEY (code)
)
WITH (
    OIDS = FALSE
);

COMMENT ON TABLE m_dechet.lt_pav_modele
    IS 'Liste de valeurs des modèles de conteneur';

COMMENT ON COLUMN m_dechet.lt_pav_modele.code
    IS 'code du modèle';

COMMENT ON COLUMN m_dechet.lt_pav_modele.valeur
    IS 'Libellé du conteneur';

COMMENT ON COLUMN m_dechet.lt_pav_modele.nomfic
    IS 'Nom du fichier contenant la photo du modèle';

COMMENT ON COLUMN m_dechet.lt_pav_modele.urlfic
    IS 'Lien vers la photographie du modèle';


INSERT INTO m_dechet.lt_pav_modele(
            code, valeur,nomfic,urlfic)
    VALUES
    ('00','Non renseigné','non_disponible.jpg','https://geo.compiegnois.fr/documents/metiers/env/dechet/model_pav/non_disponible.jpg'),
    ('01','TEMACO - MULTIPACK C600 4m3','tamaco6004.png','https://geo.compiegnois.fr/documents/metiers/env/dechet/model_pav/tamaco6004.png'),
    ('02','COLLECTAL-VILLIGERS City Line 4m3','villigerscityline4.png','https://geo.compiegnois.fr/documents/metiers/env/dechet/model_pav/villigerscityline4.png'), 
    ('03','TEMACO - PO MULTIPACK C600 4m3','tamacopo6003.png','https://geo.compiegnois.fr/documents/metiers/env/dechet/model_pav/tamacopo6003.png'),
    ('04','SULO-CITY BULLE 4m3','sulocitybulle4.png','https://geo.compiegnois.fr/documents/metiers/env/dechet/model_pav/sulocitybulle4.png'),
    ('05','UTPM 3m3','utpm3.png','https://geo.compiegnois.fr/documents/metiers/env/dechet/model_pav/utpm3.png'),
    ('06','MULTIPACK ENTERRE PO - 4m3','tamacoenterrepo4.png','https://geo.compiegnois.fr/documents/metiers/env/dechet/model_pav/tamacoenterrepo4.png'); 
    
-- ################################################################# Domaine valeur - lt_pav_modepreh  ###############################################

-- Table: m_dechet.lt_pav_modepreh

-- DROP TABLE m_dechet.lt_pav_modepreh;

CREATE TABLE m_dechet.lt_pav_modepreh
(
  code character varying(2) NOT NULL, -- code du mode de préhension
  valeur character varying(30), -- libellé du mode de préhension
  CONSTRAINT lt_pav_modepreh_pkkey PRIMARY KEY (code) -- Clé primaire de la table lt_pav_modepreh
)
WITH (
  OIDS=FALSE
);

COMMENT ON TABLE m_dechet.lt_pav_modepreh
  IS 'Liste de valeurs des codes du mode de préhension';
COMMENT ON COLUMN m_dechet.lt_pav_modepreh.code IS 'code du mode de préhension';
COMMENT ON COLUMN m_dechet.lt_pav_modepreh.valeur IS 'libellé du mode de préhension';

COMMENT ON CONSTRAINT lt_pav_modepreh_pkkey ON m_dechet.lt_pav_modepreh IS 'Clé primaire de la table lt_pav_modepreh';


INSERT INTO m_dechet.lt_pav_modepreh(
            code, valeur)
    VALUES
    ('00','Non renseigné'),
    ('10','Crochet'),
    ('20','Kinshofer');
    
-- ################################################################# Domaine valeur - lt_pav_natpb  ###############################################


-- Table: m_dechet.lt_pav_natpb

-- DROP TABLE m_dechet.lt_pav_natpb;

CREATE TABLE m_dechet.lt_pav_natpb
(
  code character varying(2) NOT NULL, -- code de la nature du ou des problèmes
  valeur character varying(30), -- Libellé des codes de la nature du ou des problèmes
  CONSTRAINT lt_pav_natpb_pkkey PRIMARY KEY (code) -- Clé primaire de la table lt_pav_natpb
)
WITH (
  OIDS=FALSE
);

COMMENT ON TABLE m_dechet.lt_pav_natpb
  IS 'Liste de valeurs des codes de la nature du ou des problèmes';
COMMENT ON COLUMN m_dechet.lt_pav_natpb.code IS 'code de la nature du ou des problèmes';
COMMENT ON COLUMN m_dechet.lt_pav_natpb.valeur IS 'Libellé des codes de la nature du ou des problèmes';

COMMENT ON CONSTRAINT lt_pav_natpb_pkkey ON m_dechet.lt_pav_natpb IS 'Clé primaire de la table lt_pav_natpb';


INSERT INTO m_dechet.lt_pav_natpb(
            code, valeur)
    VALUES
    ('00','Non renseigné'),
    ('01','Accès restreint'),
    ('02','Arbres'),
    ('03','Lignes aériennes'),
    ('04','Danger'),
    ('05','Excentré'),
    ('06','Marche arrière'),
    ('07','Pas de stationnement'),
    ('08','Sousauvent'),
    ('09','Stationnement gênant'),
    ('10','Virage'),
    ('99','Autre');
    
-- ################################################################# Domaine valeur - lt_pav_pavorient  ###############################################

-- Table: m_dechet.lt_pav_pavorient

-- DROP TABLE m_dechet.lt_pav_pavorient;

CREATE TABLE m_dechet.lt_pav_pavorient
(
  code character varying(2) NOT NULL, -- code de l'orientation du PAV suite à l'état des lieux de l'été 2016
  valeur character varying(30), -- Libellé de l'orientation du PAV suite à l'état des lieux de l'été 2016
  CONSTRAINT lt_pav_pavorient_pkkey PRIMARY KEY (code) -- Clé primaire de la table lt_pav_pavorient
)
WITH (
  OIDS=FALSE
);

COMMENT ON TABLE m_dechet.lt_pav_pavorient
  IS 'Liste de valeurs des orientations retenues';
COMMENT ON COLUMN m_dechet.lt_pav_pavorient.code IS 'code de l''orientation du PAV suite à l''état des lieux de l''été 2016';
COMMENT ON COLUMN m_dechet.lt_pav_pavorient.valeur IS 'Libellé de l''orientation du PAV suite à l''état des lieux de l''été 2016';

COMMENT ON CONSTRAINT lt_pav_pavorient_pkkey ON m_dechet.lt_pav_pavorient IS 'Clé primaire de la table lt_pav_pavorient';

INSERT INTO m_dechet.lt_pav_pavorient(
            code, valeur)
    VALUES
    ('00','Non renseigné'),
    ('10','A conserver seul'),
    ('20','A renforcer'),
    ('30','A supprimer'),
    ('40','A déplacer'),
    ('50','A créer');

-- ################################################################# Domaine valeur - lt_pav_peinture  ###############################################

-- Table: m_dechet.lt_pav_peinture

-- DROP TABLE m_dechet.lt_pav_peinture;

CREATE TABLE m_dechet.lt_pav_peinture
(
  code character varying(2) NOT NULL, -- code de l'état de la peinture
  valeur character varying(30), -- Libellé de l'état de la peinture
  CONSTRAINT lt_pav_peinture_pkkey PRIMARY KEY (code) -- Clé primaire de la table lt_pav_peinture
)
WITH (
  OIDS=FALSE
);

COMMENT ON TABLE m_dechet.lt_pav_peinture
  IS 'Liste de valeurs des code de l''état de la peinture';
COMMENT ON COLUMN m_dechet.lt_pav_peinture.code IS 'code de l''état de la peinture';
COMMENT ON COLUMN m_dechet.lt_pav_peinture.valeur IS 'Libellé de l''état de la peinture';

COMMENT ON CONSTRAINT lt_pav_peinture_pkkey ON m_dechet.lt_pav_peinture IS 'Clé primaire de la table lt_pav_peinture';

INSERT INTO m_dechet.lt_pav_peinture(
            code, valeur)
    VALUES
    ('00','Non renseigné'),
    ('10','RAS'),
    ('20','Abîmée'),
    ('30','Brûlée');

-- ################################################################# Domaine valeur - lt_pav_proprete  ###############################################

-- Table: m_dechet.lt_pav_proprete

-- DROP TABLE m_dechet.lt_pav_proprete;

CREATE TABLE m_dechet.lt_pav_proprete
(
  code character varying(2) NOT NULL, -- code de l'état de la propreté
  valeur character varying(30), -- Libellé code de l'état de la propreté
  CONSTRAINT lt_pav_proprete_pkkey PRIMARY KEY (code) -- Clé primaire de la table lt_pav_proprete
)
WITH (
  OIDS=FALSE
);

COMMENT ON TABLE m_dechet.lt_pav_proprete
  IS 'Liste de valeurs des codes de l''état de la propreté';
COMMENT ON COLUMN m_dechet.lt_pav_proprete.code IS 'code de l''état de la propreté';
COMMENT ON COLUMN m_dechet.lt_pav_proprete.valeur IS 'Libellé code de l''état de la propreté';

COMMENT ON CONSTRAINT lt_pav_proprete_pkkey ON m_dechet.lt_pav_proprete IS 'Clé primaire de la table lt_pav_proprete';


INSERT INTO m_dechet.lt_pav_proprete(
            code, valeur)
    VALUES
    ('00','Non renseigné'),
    ('10','Propre'),
    ('20','Moyen'),
    ('30','Sale');

-- ################################################################# Domaine valeur - lt_pav_statut  ###############################################

-- Table: m_dechet.lt_pav_statut

-- DROP TABLE m_dechet.lt_pav_statut;

CREATE TABLE m_dechet.lt_pav_statut
(
  code character varying(2) NOT NULL, -- code du statut
  valeur character varying(30), -- Libellé du statut
  CONSTRAINT lt_pav_statut_pkkey PRIMARY KEY (code) -- Clé primaire de la table lt_pav_statut
)
WITH (
  OIDS=FALSE
);

COMMENT ON TABLE m_dechet.lt_pav_statut
  IS 'Liste de valeurs des codes du statut du PAV';
COMMENT ON COLUMN m_dechet.lt_pav_statut.code IS 'code du statut';
COMMENT ON COLUMN m_dechet.lt_pav_statut.valeur IS 'Libellé du statut';

COMMENT ON CONSTRAINT lt_pav_statut_pkkey ON m_dechet.lt_pav_statut IS 'Clé primaire de la table lt_pav_statut';

INSERT INTO m_dechet.lt_pav_statut(
            code, valeur)
    VALUES
    ('00','Non renseigné'),
    ('10','Actif'),
    ('20','Inactif (projet, existe plus)');
    
-- ################################################################# Domaine valeur - lt_pav_typesign  ###############################################

-- Table: m_dechet.lt_pav_typesign

-- DROP TABLE m_dechet.lt_pav_typesign;

CREATE TABLE m_dechet.lt_pav_typesign
(
  code character varying(2) NOT NULL, -- code du type de signalétique
  valeur character varying(30), -- Libellé du type de signalétique
  CONSTRAINT lt_pav_typesign_pkkey PRIMARY KEY (code) -- Clé primaire de la table lt_pav_typesign
)
WITH (
  OIDS=FALSE
);

COMMENT ON TABLE m_dechet.lt_pav_typesign
  IS 'Liste de valeurs des codes du type de signalétique';
COMMENT ON COLUMN m_dechet.lt_pav_typesign.code IS 'code du type de signalétique';
COMMENT ON COLUMN m_dechet.lt_pav_typesign.valeur IS 'Libellé du type de signalétique';

COMMENT ON CONSTRAINT lt_pav_typesign_pkkey ON m_dechet.lt_pav_typesign IS 'Clé primaire de la table lt_pav_typesign';

INSERT INTO m_dechet.lt_pav_typesign(
            code, valeur)
    VALUES
    ('00','Non renseigné'),
    ('10','Adhésif'),
    ('20','Totem'),
    ('30','Covering'),
    ('40','Plaque + adhésif');

-- ################################################################# Domaine valeur - lt_pav_typesol  ###############################################

-- Table: m_dechet.lt_pav_typesol

-- DROP TABLE m_dechet.lt_pav_typesol;

CREATE TABLE m_dechet.lt_pav_typesol
(
  code character varying(2) NOT NULL, -- code du type de sol
  valeur character varying(30), -- Libellé du type de sol
  CONSTRAINT lt_pav_typesol_pkkey PRIMARY KEY (code) -- Clé primaire de la table lt_pav_typesol
)
WITH (
  OIDS=FALSE
);

COMMENT ON TABLE m_dechet.lt_pav_typesol
  IS 'Liste de valeurs des types de sols';
COMMENT ON COLUMN m_dechet.lt_pav_typesol.code IS 'code du type de sol';
COMMENT ON COLUMN m_dechet.lt_pav_typesol.valeur IS 'Libellé du type de sol';

COMMENT ON CONSTRAINT lt_pav_typesol_pkkey ON m_dechet.lt_pav_typesol IS 'Clé primaire de la table lt_pav_typesol';

INSERT INTO m_dechet.lt_pav_typesol(
            code, valeur)
    VALUES
    ('00','Non renseigné'),
    ('10','Dalle'),
    ('20','Bitume'),
    ('30','Terre'),
    ('99','Autre');

-- ####################################################################################################################################################
-- ###                                                                                                                                              ###
-- ###                                                                TABLE                                                           		    ###
-- ###                                                                                                                                              ###
-- ####################################################################################################################################################




-- Table: m_dechet.an_dec_pav_doc_media

-- DROP TABLE m_dechet.an_dec_pav_doc_media;

CREATE TABLE m_dechet.an_dec_pav_doc_media
(
  gid serial NOT NULL,
  id integer, -- Identifiant du PAV
  media text, -- Champ Média de GEO
  miniature bytea, -- Champ miniature de GEO
  n_fichier text, -- Nom du fichier
  t_fichier text, -- Type de média dans GEO
  op_sai character varying(100), -- Libellé de l'opérateur ayant intégrer le document
  date_sai timestamp without time zone, -- Date d'intégration du document
  d_photo timestamp without time zone, -- Date de la prise de vue
  l_prec character varying(1000) -- Précision sur le document
)
WITH (
  OIDS=FALSE
);

COMMENT ON TABLE m_dechet.an_dec_pav_doc_media
  IS 'Table gérant la liste des photos des PAV (verre et tlc) avec le module média dans GEO (application Tri)';
COMMENT ON COLUMN m_dechet.an_dec_pav_doc_media.id IS 'Identifiant du PAV';
COMMENT ON COLUMN m_dechet.an_dec_pav_doc_media.media IS 'Champ Média de GEO';
COMMENT ON COLUMN m_dechet.an_dec_pav_doc_media.miniature IS 'Champ miniature de GEO';
COMMENT ON COLUMN m_dechet.an_dec_pav_doc_media.n_fichier IS 'Nom du fichier';
COMMENT ON COLUMN m_dechet.an_dec_pav_doc_media.t_fichier IS 'Type de média dans GEO';
COMMENT ON COLUMN m_dechet.an_dec_pav_doc_media.op_sai IS 'Libellé de l''opérateur ayant intégrer le document';
COMMENT ON COLUMN m_dechet.an_dec_pav_doc_media.date_sai IS 'Date d''intégration du document';
COMMENT ON COLUMN m_dechet.an_dec_pav_doc_media.d_photo IS 'Date de la prise de vue';
COMMENT ON COLUMN m_dechet.an_dec_pav_doc_media.l_prec IS 'Précision sur le document';

-- Table: m_dechet.geo_dec_dechetterie

-- DROP TABLE m_dechet.geo_dec_dechetterie;

CREATE TABLE m_dechet.geo_dec_dechetterie
(
  id character(10) NOT NULL,
  nomcom_min character varying(50),
  insee character(5),
  nomdechet character varying(50),
  x double precision,
  y double precision,
  adresse character varying(80),
  gestionnaire character varying(20),
  geom geometry(Point,2154),
  gid serial NOT NULL,
  CONSTRAINT geo_dec_dechetterie_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=TRUE
);

COMMENT ON TABLE m_dechet.geo_dec_dechetterie
  IS 'Localisation des déchetterie sur l''ARC';



-- Table: m_dechet.geo_dec_secteur_enc

-- DROP TABLE m_dechet.geo_dec_secteur_enc;

CREATE TABLE m_dechet.geo_dec_secteur_enc
(
  gid integer NOT NULL DEFAULT nextval('m_dechet.geo_dec_secteur_enc_seq'::regclass), -- Identifiant interne
  insee character varying(5), -- Code Insee de la commune
  commune character varying(150), -- Libellé de la commune
  op_sai character varying(80), -- Opérateur de saisie
  observ character varying(254), -- Observation(s)
  src_geom character varying(2), -- Référentiel de saisie
  date_sai timestamp without time zone, -- Date de saisie
  date_maj timestamp without time zone, -- Date de mise à jour
  adresse character varying(254), -- Adresse concernées par un ramassage des encombrants à jour fixe
  l_secteur character varying(25), -- Libellé du secteur par rapport au ramssage (fixe ou sur rendez-vous)
  l_message1 character varying(500), -- Message diffusé sur l'application Grand Public pour les encombrants à jour fixe
  l_message2 character varying(500), -- Message diffusé sur l'application Grand Public pour les encombrants sur rendez-vous
  geom geometry(MultiPoint,2154), -- Géométrie des points d'adresse à jour fixe
  geom1 geometry(Polygon,2154), -- Géométrie des zones issus des adresses et par défaut les autres (1 seul polygone) sur rendez-vous. Sert dans GEO appli Gd public pour la recherche par adresse
  CONSTRAINT geo_dec_secteur_enc_pkey1 PRIMARY KEY (gid)
)
WITH (
  OIDS=FALSE
);
COMMENT ON TABLE m_dechet.geo_dec_secteur_enc
  IS 'Table contenant les objets sectorisant le ramassage des encombrants';
ALTER TABLE m_dechet.geo_dec_secteur_enc
  OWNER TO sig_create;
GRANT ALL ON TABLE m_dechet.geo_dec_secteur_enc TO sig_create;
GRANT ALL ON TABLE m_dechet.geo_dec_secteur_enc TO create_sig;
GRANT SELECT ON TABLE m_dechet.geo_dec_secteur_enc TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_dechet.geo_dec_secteur_enc TO edit_sig;
COMMENT ON COLUMN m_dechet.geo_dec_secteur_enc.gid IS 'Identifiant interne';
COMMENT ON COLUMN m_dechet.geo_dec_secteur_enc.insee IS 'Code Insee de la commune';
COMMENT ON COLUMN m_dechet.geo_dec_secteur_enc.commune IS 'Libellé de la commune';
COMMENT ON COLUMN m_dechet.geo_dec_secteur_enc.op_sai IS 'Opérateur de saisie';
COMMENT ON COLUMN m_dechet.geo_dec_secteur_enc.observ IS 'Observation(s)';
COMMENT ON COLUMN m_dechet.geo_dec_secteur_enc.src_geom IS 'Référentiel de saisie';
COMMENT ON COLUMN m_dechet.geo_dec_secteur_enc.date_sai IS 'Date de saisie';
COMMENT ON COLUMN m_dechet.geo_dec_secteur_enc.date_maj IS 'Date de mise à jour';
COMMENT ON COLUMN m_dechet.geo_dec_secteur_enc.adresse IS 'Adresse concernées par un ramassage des encombrants à jour fixe';
COMMENT ON COLUMN m_dechet.geo_dec_secteur_enc.l_secteur IS 'Libellé du secteur par rapport au ramssage (fixe ou sur rendez-vous)';
COMMENT ON COLUMN m_dechet.geo_dec_secteur_enc.l_message1 IS 'Message diffusé sur l''application Grand Public pour les encombrants à jour fixe';
COMMENT ON COLUMN m_dechet.geo_dec_secteur_enc.l_message2 IS 'Message diffusé sur l''application Grand Public pour les encombrants sur rendez-vous';
COMMENT ON COLUMN m_dechet.geo_dec_secteur_enc.geom IS 'Géométrie des points d''adresse à jour fixe';
COMMENT ON COLUMN m_dechet.geo_dec_secteur_enc.geom1 IS 'Géométrie des zones issus des adresses et par défaut les autres (1 seul polygone) sur rendez-vous. Sert dans GEO appli Gd public pour la recherche par adresse';


-- Table: m_dechet.geo_dec_secteur_om

-- DROP TABLE m_dechet.geo_dec_secteur_om;

CREATE TABLE m_dechet.geo_dec_secteur_om
(
  gid integer NOT NULL DEFAULT nextval('m_dechet.geo_dec_secteur_om_seq'::regclass), -- Identifiant unique interne
  l_zone character varying(150), -- Nom du secteur de ramassage des ordures ménagères
  geom geometry(MultiPolygon,2154),
  insee character varying(25), -- Code insee de la Commune
  commune character varying(150), -- Libellé de la commune
  op_sai character varying(80), -- Opérateur de saisie
  observ character varying(254), -- Observations
  src_geom character varying(2) DEFAULT '00'::character varying, -- Code de la valeur du référentiel de saisie (lien vers la liste de valeur r_objet.lt_src_geom
  date_sai timestamp without time zone, -- Date de saisie des informations
  date_maj timestamp without time zone, -- Date de mise à jour des informations
  l_fichier character varying(100), -- Libellé du fichier avec son extension pour le document lié, ici le calendrier de collecte
  l_message1 character varying(255), -- Espace pour rédiger un message qui sera intégré dans l'application grand public (plusieurs lignes possibles dans les champs l_message n
  l_message2 character varying(255), -- 2ème ligne du message
  l_message3 character varying(255), -- 3ème ligne du message
  l_message4 character varying(255), -- 4ème ligne du message
  l_message5 character varying(255), -- 5ème ligne du message
  l_message6 character varying(255), -- 6ème ligne du message
  l_message7 character varying(255), -- 7ème ligne du message
  CONSTRAINT geo_dec_zonage_pkey PRIMARY KEY (gid)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE m_dechet.geo_dec_secteur_om
  OWNER TO sig_create;
GRANT ALL ON TABLE m_dechet.geo_dec_secteur_om TO sig_create;
GRANT ALL ON TABLE m_dechet.geo_dec_secteur_om TO create_sig;
GRANT SELECT ON TABLE m_dechet.geo_dec_secteur_om TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_dechet.geo_dec_secteur_om TO edit_sig;
COMMENT ON TABLE m_dechet.geo_dec_secteur_om
  IS 'Secteur de collecte des ordures ménagères.';
COMMENT ON COLUMN m_dechet.geo_dec_secteur_om.gid IS 'Identifiant unique interne';
COMMENT ON COLUMN m_dechet.geo_dec_secteur_om.l_zone IS 'Nom du secteur de ramassage des ordures ménagères';
COMMENT ON COLUMN m_dechet.geo_dec_secteur_om.insee IS 'Code insee de la Commune';
COMMENT ON COLUMN m_dechet.geo_dec_secteur_om.commune IS 'Libellé de la commune';
COMMENT ON COLUMN m_dechet.geo_dec_secteur_om.op_sai IS 'Opérateur de saisie';
COMMENT ON COLUMN m_dechet.geo_dec_secteur_om.observ IS 'Observations';
COMMENT ON COLUMN m_dechet.geo_dec_secteur_om.src_geom IS 'Code de la valeur du référentiel de saisie (lien vers la liste de valeur r_objet.lt_src_geom';
COMMENT ON COLUMN m_dechet.geo_dec_secteur_om.date_sai IS 'Date de saisie des informations';
COMMENT ON COLUMN m_dechet.geo_dec_secteur_om.date_maj IS 'Date de mise à jour des informations';
COMMENT ON COLUMN m_dechet.geo_dec_secteur_om.l_fichier IS 'Libellé du fichier avec son extension pour le document lié, ici le calendrier de collecte';
COMMENT ON COLUMN m_dechet.geo_dec_secteur_om.l_message1 IS 'Espace pour rédiger un message qui sera intégré dans l''application grand public (plusieurs lignes possibles dans les champs l_message n';
COMMENT ON COLUMN m_dechet.geo_dec_secteur_om.l_message2 IS '2ème ligne du message';
COMMENT ON COLUMN m_dechet.geo_dec_secteur_om.l_message3 IS '3ème ligne du message';
COMMENT ON COLUMN m_dechet.geo_dec_secteur_om.l_message4 IS '4ème ligne du message';
COMMENT ON COLUMN m_dechet.geo_dec_secteur_om.l_message5 IS '5ème ligne du message';
COMMENT ON COLUMN m_dechet.geo_dec_secteur_om.l_message6 IS '6ème ligne du message';
COMMENT ON COLUMN m_dechet.geo_dec_secteur_om.l_message7 IS '7ème ligne du message';




  
-- ####################################################################################################################################################
-- ###                                                                                                                                              ###
-- ###                                                                INDEX                                                                         ###
-- ###                                                                                                                                              ###
-- ####################################################################################################################################################

à revoir
  
-- ####################################################################################################################################################
-- ###                                                                                                                                              ###
-- ###                                                                TRIGGERS                                                                      ###
-- ###                                                                                                                                              ###
-- ####################################################################################################################################################

à revoir
