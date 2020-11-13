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
DROP SEQUENCE IF EXISTS m_dechet.lt_pav_model_code_seq;
DROP SEQUENCE IF EXISTS m_dechet.an_dec_pav_log_idlog_seq;

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
    
-- SEQUENCE: m_dechet.lt_pav_model_code_seq

-- DROP SEQUENCE m_dechet.lt_pav_model_code_seq;

CREATE SEQUENCE m_dechet.lt_pav_model_code_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

-- SEQUENCE: m_dechet.an_dec_pav_log_idlog_seq

-- DROP SEQUENCE m_dechet.an_dec_pav_log_idlog_seq;

CREATE SEQUENCE m_dechet.an_dec_pav_log_idlog_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

COMMENT ON SEQUENCE m_dechet.an_dec_pav_log_idlog_seq
    IS 'Séquence unique pour les logs liées au lieu de collecte et aux conteneurs Verre et TLC (PAV)';
    
    
 -- ####################################################################################################################################################
-- ###                                                                                                                                              ###
-- ###                                                                REINITIALISATION DU MODELE                                                    ###
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

ALTER TABLE m_dechet.an_dec_pav_cont DROP CONSTRAINT IF EXISTS an_dec_pav_cont_etatsign_fkey;
ALTER TABLE m_dechet.an_dec_pav_cont DROP CONSTRAINT IF EXISTS an_dec_pav_cont_eve_fkey;
ALTER TABLE m_dechet.an_dec_pav_cont DROP CONSTRAINT IF EXISTS an_dec_pav_cont_model_fkey;
ALTER TABLE m_dechet.an_dec_pav_cont DROP CONSTRAINT IF EXISTS an_dec_pav_cont_modepreh_fkey;
ALTER TABLE m_dechet.an_dec_pav_cont DROP CONSTRAINT IF EXISTS an_dec_pav_cont_peinture_fkey;
ALTER TABLE m_dechet.an_dec_pav_cont DROP CONSTRAINT IF EXISTS an_dec_pav_cont_pos_fkey;
ALTER TABLE m_dechet.an_dec_pav_cont DROP CONSTRAINT IF EXISTS an_dec_pav_cont_prop_fkey;
ALTER TABLE m_dechet.an_dec_pav_cont DROP CONSTRAINT IF EXISTS an_dec_pav_cont_typesign_fkey;
ALTER TABLE m_dechet.an_dec_pav_cont DROP CONSTRAINT IF EXISTS an_dec_pav_cont_typesol_fkey;

ALTER TABLE m_dechet.an_dec_pav_cont_tlc DROP CONSTRAINT IF EXISTS an_dec_pav_cont_tlc_eve_fkey;
ALTER TABLE m_dechet.an_dec_pav_cont_tlc DROP CONSTRAINT IF EXISTS an_dec_pav_cont_tlc_gest_fkey;
ALTER TABLE m_dechet.an_dec_pav_cont_tlc DROP CONSTRAINT IF EXISTS an_dec_pav_cont_tlc_model_fkey;
ALTER TABLE m_dechet.an_dec_pav_cont_tlc DROP CONSTRAINT IF EXISTS an_dec_pav_cont_tlc_pos_fkey;



-- domaine de valeur
DROP TABLE IF EXISTS m_dechet.lt_pav_contpos;
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

-- Table
DROP TABLE IF EXISTS m_dechet.geo_dec_pav_lieu;
DROP TABLE IF EXISTS m_dechet.an_dec_pav_cont;
DROP TABLE IF EXISTS m_dechet.an_dec_pav_cont_tlc;
DROP TABLE IF EXISTS m_dechet.an_dec_pav_doc_media;
DROP TABLE IF EXISTS m_dechet.an_dec_pav_model_media;
DROP TABLE IF EXISTS m_dechet.geo_dec_dechetterie;
DROP TABLE IF EXISTS m_dechet.geo_dec_secteur_enc;
DROP TABLE IF EXISTS m_dechet.geo_dec_secteur_om;
DROP TABLE IF EXISTS m_dechet.an_dec_pav_log;


-- ####################################################################################################################################################
-- ###                                                                                                                                              ###
-- ###                                                                DOMAINE DE VALEURS                                                            ###
-- ###                                                                                                                                              ###
-- ####################################################################################################################################################

    
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
    IS 'Liste de valeurs des codes du type de lieux de collecte';
COMMENT ON COLUMN m_dechet.lt_pav_cttype.code
    IS 'code du type de lieu';
COMMENT ON COLUMN m_dechet.lt_pav_cttype.valeur
    IS 'Libellé du type de lieu';

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
COMMENT ON COLUMN m_dechet.lt_pav_envimplan.code IS 'code du type d''espace urbain d''implantation';
COMMENT ON COLUMN m_dechet.lt_pav_envimplan.valeur IS 'libellé du type d''espace urbain d''implantation';

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
COMMENT ON COLUMN m_dechet.lt_pav_etatsign.code IS 'Code des états de la signalétique';
COMMENT ON COLUMN m_dechet.lt_pav_etatsign.valeur IS 'Libellé des états de la signalétique';

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
    IS 'Liste de valeurs des codes des évènements';

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
    code character varying(2) COLLATE pg_catalog."default" NOT NULL DEFAULT nextval('m_dechet.lt_pav_model_code_seq'::regclass),
    valeur character varying(50) COLLATE pg_catalog."default",
    volume integer,
    materiau character varying(20),
    cttype character varying(2),
    CONSTRAINT lt_pav_modele_pkkey PRIMARY KEY (code),
    ALTER TABLE m_dechet.lt_pav_modele
    ADD CONSTRAINT lt_pav_modele_cttype_fkey FOREIGN KEY (cttype)
    REFERENCES m_dechet.lt_pav_cttype (code) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
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
            code, valeur,volume,materiau,cttype)
    VALUES
    ('0','Non renseigné',null,'','00'),
    ('1','TEMACO - MULTIPACK C600 4m3',4,'Acier','10'),
    ('2','COLLECTAL-VILLIGERS City Line 4m3',4,'','10'), 
    ('3','TEMACO - PO MULTIPACK C600 4m3',4,'','10'),
    ('4','SULO-CITY BULLE 4m3',4,'Plastique','10'),
    ('5','UTPM 3m3',3,'Plastique','10'),
    ('6','MULTIPACK ENTERRE PO - 4m3',4,'Acier','10'),
    ('7','EcoNox Classique (rouleau simple)',3,'Acier','20'),
    ('8','EcoNox Classique (rouleau double)',6,'Acier','20'),
    ('9','EcoNox Bunker (mini)',2,'Acier','20'),
    ('10','EcoNox Bunker (Demi)',4,'Acier','20'),
    ('11','EcoNox Bunker (Bunker)',6,'Acier','20'),
    ('12','EcoNox Eco ZR',2,'Acier','20'),
    ('99','Autre',null,'','00');
    
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

-- Table: m_dechet.geo_dec_pav_lieu

-- DROP TABLE m_dechet.geo_dec_pav_lieu;

CREATE TABLE m_dechet.geo_dec_pav_lieu
(
    idlieu integer NOT NULL DEFAULT nextval('m_dechet.geo_dec_pav_lieu_idlieu_seq'::regclass),
    statut character varying(2) COLLATE pg_catalog."default",
    cttype character varying(2) COLLATE pg_catalog."default",
    insee character varying(5) COLLATE pg_catalog."default",
    commune character varying(50) COLLATE pg_catalog."default",
    quartier character varying(50) COLLATE pg_catalog."default",
    adresse character varying(80) COLLATE pg_catalog."default",
    localisation character varying(254) COLLATE pg_catalog."default",
    nb_cont integer,
    prop_abor character varying(2) COLLATE pg_catalog."default",
    env_type character varying(2) COLLATE pg_catalog."default",
    env_implan character varying(2) COLLATE pg_catalog."default",
    env_situ character varying(2) COLLATE pg_catalog."default",
    prox_corb boolean,
    opt_pav integer,
    ame_acces boolean,
    nat_pb character varying(2) COLLATE pg_catalog."default",
    nat_pb_99 character varying(254) COLLATE pg_catalog."default",
    pavorient character varying(2) COLLATE pg_catalog."default",
    idparent integer,
    v_tampon integer,
    x_l93 double precision,
    y_l93 double precision,
    src_geom character(2) COLLATE pg_catalog."default",
    src_date integer,
    date_sai timestamp without time zone,
    date_maj timestamp without time zone,
    op_sai character varying(80) COLLATE pg_catalog."default",
    observ character varying(500) COLLATE pg_catalog."default",
    geom geometry(Point,2154),
    idcontrat character varying(2) COLLATE pg_catalog."default",
    CONSTRAINT geo_dec_pav_lieu_pkey PRIMARY KEY (idlieu),
    CONSTRAINT geo_dec_pav_lieu_contrat_fkey FOREIGN KEY (idcontrat)
        REFERENCES r_objet.lt_contrat (code) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT geo_dec_pav_lieu_cttype_fkey FOREIGN KEY (cttype)
        REFERENCES m_dechet.lt_pav_cttype (code) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT geo_dec_pav_lieu_envimplan_fkey FOREIGN KEY (env_implan)
        REFERENCES m_dechet.lt_pav_envimplan (env_implan) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT geo_dec_pav_lieu_envsitu_fkey FOREIGN KEY (env_situ)
        REFERENCES m_dechet.lt_pav_envsitu (env_situ) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT geo_dec_pav_lieu_envtype_fkey FOREIGN KEY (env_type)
        REFERENCES m_dechet.lt_pav_envtype (env_type) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT geo_dec_pav_lieu_model_fkey FOREIGN KEY (cttype)
        REFERENCES m_dechet.lt_pav_cttype (code) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT geo_dec_pav_lieu_natpb_fkey FOREIGN KEY (nat_pb)
        REFERENCES m_dechet.lt_pav_natpb (nat_pb) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT geo_dec_pav_lieu_orient_fkey FOREIGN KEY (pavorient)
        REFERENCES m_dechet.lt_pav_pavorient (pavorient) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT geo_dec_pav_lieu_propabord_fkey FOREIGN KEY (prop_abor)
        REFERENCES m_dechet.lt_pav_proprete (proprete) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT geo_dec_pav_lieu_srcgeom_fkey FOREIGN KEY (src_geom)
        REFERENCES r_objet.lt_src_geom (code) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT geo_dec_pav_lieu_statut_fkey FOREIGN KEY (statut)
        REFERENCES m_dechet.lt_pav_statut (statut) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
);


COMMENT ON TABLE m_dechet.geo_dec_pav_lieu
    IS 'Table géographique contenant les lieux de collecte du Verre et/ou TLC
(en pré-production)';

COMMENT ON COLUMN m_dechet.geo_dec_pav_lieu.idlieu
    IS 'Identifiant unique du lieu de collecte';

COMMENT ON COLUMN m_dechet.geo_dec_pav_lieu.statut
    IS 'Statut du lieu du collecte (liste de valeurs lt_pav_statut)';

COMMENT ON COLUMN m_dechet.geo_dec_pav_lieu.cttype
    IS 'Type de conteneur (liste de valeurs lt_pav_cctype). Attribut automatisé en fonction des conteneurs présents au lieu';

COMMENT ON COLUMN m_dechet.geo_dec_pav_lieu.insee
    IS 'Code insee de la commune d''implantation du lieu';

COMMENT ON COLUMN m_dechet.geo_dec_pav_lieu.commune
    IS 'Libellé de la commune d''implantation du lieu';

COMMENT ON COLUMN m_dechet.geo_dec_pav_lieu.quartier
    IS 'Libellé du quartier d''implantation du lieu (ville de Compiègne uniquement)';

COMMENT ON COLUMN m_dechet.geo_dec_pav_lieu.adresse
    IS 'Libellé de l''adresse proche du lieu';

COMMENT ON COLUMN m_dechet.geo_dec_pav_lieu.localisation
    IS 'Information complémentaire à l''adresse pour mieux appréhender la localisation du lieu';

COMMENT ON COLUMN m_dechet.geo_dec_pav_lieu.nb_cont
    IS 'Nombre de conteneurs Verre présent au lieu. Cet attribut est calculé automatiquement à la mise à jour des conteneurs';

COMMENT ON COLUMN m_dechet.geo_dec_pav_lieu.prop_abor
    IS 'Propreté aux abords du lieu (liste de valeurs lt_pav_proprete)';
    
COMMENT ON COLUMN m_dechet.geo_dec_pav_lieu.opt_pav
    IS 'nombre de PAV manquant ou excédents par rapport aux préconisation éco-emballages';

COMMENT ON COLUMN m_dechet.geo_dec_pav_lieu.env_type
    IS 'Type d''environnement autour du lieu (liste de valeurs lt_pav_envtype)';

COMMENT ON COLUMN m_dechet.geo_dec_pav_lieu.env_implan
    IS 'Environnement d''implantation du lieu (liste de valeurs lt_pav_envimplan)';

COMMENT ON COLUMN m_dechet.geo_dec_pav_lieu.env_situ
    IS 'Situation du lieu (liste de valeurs lt_pav_envsitu)';

COMMENT ON COLUMN m_dechet.geo_dec_pav_lieu.prox_corb
    IS 'Présence d''une corbeille à proximité du lieu';

COMMENT ON COLUMN m_dechet.geo_dec_pav_lieu.opt_pav
    IS 'nombre de PAV manquant ou excédents par rapport aux préconisation éco-emballages';

COMMENT ON COLUMN m_dechet.geo_dec_pav_lieu.ame_acces
    IS 'Accéssibilité à revoir';

COMMENT ON COLUMN m_dechet.geo_dec_pav_lieu.nat_pb
    IS 'Nature des problèmes identifiés au lieu (liste de valeurs lt_pav_natpb)';

COMMENT ON COLUMN m_dechet.geo_dec_pav_lieu.nat_pb_99
    IS 'Autre type de problème identifié au lieu';

COMMENT ON COLUMN m_dechet.geo_dec_pav_lieu.pavorient
    IS 'Préconisations pour l''amélioration des emplacements des lieux (suite à l''état des lieux de l''été 2016) (liste de valeurs lt_pav_pavorient)';

COMMENT ON COLUMN m_dechet.geo_dec_pav_lieu.idparent
    IS 'Identifient du lieu parent';

COMMENT ON COLUMN m_dechet.geo_dec_pav_lieu.v_tampon
    IS 'Valeur en mètre de l''aire de chalandise du lieu';

COMMENT ON COLUMN m_dechet.geo_dec_pav_lieu.x_l93
    IS 'Coordonnée X en Lambert 93 du lieu';

COMMENT ON COLUMN m_dechet.geo_dec_pav_lieu.y_l93
    IS 'Coordonnée Y en Lambert 93 du lieu';

COMMENT ON COLUMN m_dechet.geo_dec_pav_lieu.src_geom
    IS 'Référentiel de saisie utilisé pour saisir le lieu (liste de valeurs r_objet.lt_src_geom)';

COMMENT ON COLUMN m_dechet.geo_dec_pav_lieu.src_date
    IS 'Année du référentiel de saisi pour la saisie des lieux';

COMMENT ON COLUMN m_dechet.geo_dec_pav_lieu.date_sai
    IS 'Date de saisie initiale du lieu';

COMMENT ON COLUMN m_dechet.geo_dec_pav_lieu.date_maj
    IS 'Date de mise à jour de la donnée';

COMMENT ON COLUMN m_dechet.geo_dec_pav_lieu.op_sai
    IS 'Opérateur de saisie';

COMMENT ON COLUMN m_dechet.geo_dec_pav_lieu.observ
    IS 'Observations diverses';

COMMENT ON COLUMN m_dechet.geo_dec_pav_lieu.geom
    IS 'Attribut de géométrie';

COMMENT ON COLUMN m_dechet.geo_dec_pav_lieu.hab_pav
    IS 'Tonnage par gisement d''''habitants';

COMMENT ON COLUMN m_dechet.geo_dec_pav_lieu.idcontrat
    IS 'Identifiant du contrat de gestion du ramassage des conteneurs Verre (liste de valeurs r_objet.lt_contrat)';

-- Trigger: t_t1_geo_dec_pav_lieu_datemaj

-- DROP TRIGGER t_t1_geo_dec_pav_lieu_datemaj ON m_dechet.geo_dec_pav_lieu;

CREATE TRIGGER t_t1_geo_dec_pav_lieu_datemaj
    BEFORE INSERT OR UPDATE 
    ON m_dechet.geo_dec_pav_lieu
    FOR EACH ROW
    EXECUTE PROCEDURE public.ft_r_timestamp_maj();

-- Trigger: t_t2_geo_dec_pav_lieu_datesai

-- DROP TRIGGER t_t2_geo_dec_pav_lieu_datesai ON m_dechet.geo_dec_pav_lieu;

CREATE TRIGGER t_t2_geo_dec_pav_lieu_datesai
    BEFORE INSERT
    ON m_dechet.geo_dec_pav_lieu
    FOR EACH ROW
    EXECUTE PROCEDURE public.ft_r_timestamp_sai();

-- Trigger: t_t3_geo_dec_pav_lieu_insee

-- DROP TRIGGER t_t3_geo_dec_pav_lieu_insee ON m_dechet.geo_dec_pav_lieu;

CREATE TRIGGER t_t3_geo_dec_pav_lieu_insee
    BEFORE INSERT OR UPDATE OF geom
    ON m_dechet.geo_dec_pav_lieu
    FOR EACH ROW
    EXECUTE PROCEDURE public.ft_r_commune_pl();

-- Trigger: t_t4_geo_dec_pav_lieu_quartier

-- DROP TRIGGER t_t4_geo_dec_pav_lieu_quartier ON m_dechet.geo_dec_pav_lieu;

CREATE TRIGGER t_t4_geo_dec_pav_lieu_quartier
    BEFORE INSERT OR UPDATE OF geom
    ON m_dechet.geo_dec_pav_lieu
    FOR EACH ROW
    EXECUTE PROCEDURE public.ft_r_quartier();

-- Trigger: t_t5_geo_dec_pav_lieu_xy

-- DROP TRIGGER t_t5_geo_dec_pav_lieu_xy ON m_dechet.geo_dec_pav_lieu;

CREATE TRIGGER t_t5_geo_dec_pav_lieu_xy
    BEFORE INSERT OR UPDATE OF geom
    ON m_dechet.geo_dec_pav_lieu
    FOR EACH ROW
    EXECUTE PROCEDURE public.ft_r_xy_l93();

-- Trigger: t_t6_geo_dec_pav_lieu_tampon

-- DROP TRIGGER t_t6_geo_dec_pav_lieu_tampon ON m_dechet.geo_dec_pav_lieu;
/*
CREATE TRIGGER t_t6_geo_dec_pav_lieu_tampon
    AFTER UPDATE OF v_tampon, geom
    ON m_dechet.geo_dec_pav_lieu
    FOR EACH ROW
    EXECUTE PROCEDURE m_dechet.ft_m_tampon_lieu_nav();
*/

-- Trigger: t_t7_geo_dec_pav_lieu_delete

-- DROP TRIGGER t_t7_geo_dec_pav_lieu_delete ON m_dechet.geo_dec_pav_lieu;

CREATE TRIGGER t_t7_geo_dec_pav_lieu_delete
    AFTER UPDATE OF statut
    ON m_dechet.geo_dec_pav_lieu
    FOR EACH ROW
    EXECUTE PROCEDURE m_dechet.ft_m_dec_lieu_delete();

-- Trigger: t_t8_log_lieu

-- DROP TRIGGER t_t8_log_lieu ON m_dechet.geo_dec_pav_lieu;

CREATE TRIGGER t_t8_log_lieu
    AFTER INSERT OR DELETE OR UPDATE 
    ON m_dechet.geo_dec_pav_lieu
    FOR EACH ROW
    EXECUTE PROCEDURE m_dechet.ft_m_log_dec_lieu();

-- Table: m_dechet.an_dec_pav_cont

-- DROP TABLE m_dechet.an_dec_pav_cont;

CREATE TABLE m_dechet.an_dec_pav_cont
(
    idcont integer NOT NULL DEFAULT nextval('m_dechet.an_dec_pav_cont_idcont_seq'::regclass),
    idlieu integer,
    idpresta character varying(10) COLLATE pg_catalog."default",
    eve character varying(2) COLLATE pg_catalog."default",
    model integer COLLATE pg_catalog."default",
    pos character varying(2) COLLATE pg_catalog."default",
    date_sai timestamp without time zone,
    date_maj timestamp without time zone,
    date_pos timestamp without time zone,
    date_net timestamp without time zone,
    date_effet timestamp without time zone,
    mode_preh character varying(2) COLLATE pg_catalog."default",
    opercules boolean,
    tags boolean,
    peinture character varying(2) COLLATE pg_catalog."default",
    type_sol character varying(2) COLLATE pg_catalog."default",
    trp_rest boolean,
    etat_sign character varying(2) COLLATE pg_catalog."default",
    type_sign character varying(2) COLLATE pg_catalog."default",
    proprete character varying(2) COLLATE pg_catalog."default",
    def_struc boolean,
    op_sai character varying(80) COLLATE pg_catalog."default",
    observ character varying(500) COLLATE pg_catalog."default",
    date_eve timestamp without time zone,
    obs_eve character varying(500) COLLATE pg_catalog."default",
    CONSTRAINT an_dec_pav_cont_pkey PRIMARY KEY (idcont),
    CONSTRAINT an_dec_pav_cont_etatsign_fkey FOREIGN KEY (etat_sign)
        REFERENCES m_dechet.lt_pav_etatsign (etat_sign) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT an_dec_pav_cont_eve_fkey FOREIGN KEY (eve)
        REFERENCES m_dechet.lt_pav_eve (code) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT an_dec_pav_cont_model_fkey FOREIGN KEY (model)
        REFERENCES m_dechet.lt_pav_modele (code) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT an_dec_pav_cont_modepreh_fkey FOREIGN KEY (mode_preh)
        REFERENCES m_dechet.lt_pav_modepreh (mode_preh) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT an_dec_pav_cont_peinture_fkey FOREIGN KEY (peinture)
        REFERENCES m_dechet.lt_pav_peinture (peinture) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT an_dec_pav_cont_pos_fkey FOREIGN KEY (pos)
        REFERENCES m_dechet.lt_pav_contpos (cont_pos) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT an_dec_pav_cont_prop_fkey FOREIGN KEY (proprete)
        REFERENCES m_dechet.lt_pav_proprete (proprete) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT an_dec_pav_cont_typesign_fkey FOREIGN KEY (type_sign)
        REFERENCES m_dechet.lt_pav_typesign (type_sign) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT an_dec_pav_cont_typesol_fkey FOREIGN KEY (type_sol)
        REFERENCES m_dechet.lt_pav_typesol (type_sol) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
);

COMMENT ON TABLE m_dechet.an_dec_pav_cont
    IS 'Table alphanumérique des attributs métiers correspondant au conteneur Verre
(en pré-production)';

COMMENT ON COLUMN m_dechet.an_dec_pav_cont.idcont
    IS 'Identifiant unique du conteneur Verre
( valeur par défaut de la clé à restaurer après migration finale des données, (nextval(''m_dechet.an_dec_pav_cont_idcont_seq''::regclass)) )';

COMMENT ON COLUMN m_dechet.an_dec_pav_cont.idlieu
    IS 'Identifiant du lieu de collecte';

COMMENT ON COLUMN m_dechet.an_dec_pav_cont.idpresta
    IS 'Identifiant du conteneur du prestataire';

COMMENT ON COLUMN m_dechet.an_dec_pav_cont.eve
    IS 'Evènement lié à la vie du conteneur (liste de valeurs lt_pav_eve)';

COMMENT ON COLUMN m_dechet.an_dec_pav_cont.model
    IS 'Modèle du conteneur Verre (liste de valeurs lt_pav_modele)';

COMMENT ON COLUMN m_dechet.an_dec_pav_cont.pos
    IS 'Position du conteneur Verre (liste de valeurs lt_pav_pos)';

COMMENT ON COLUMN m_dechet.an_dec_pav_cont.date_sai
    IS 'Date de saisie de la donnée';

COMMENT ON COLUMN m_dechet.an_dec_pav_cont.date_maj
    IS 'Date de mise à jour de la donnée';

COMMENT ON COLUMN m_dechet.an_dec_pav_cont.date_pos
    IS 'Date de pose';

COMMENT ON COLUMN m_dechet.an_dec_pav_cont.date_net
    IS 'Date du dernier nettoyage';

COMMENT ON COLUMN m_dechet.an_dec_pav_cont.date_effet
    IS 'Date de prise en compte des données dans le plan interactif Grand Public';

COMMENT ON COLUMN m_dechet.an_dec_pav_cont.mode_preh
    IS 'Mode de préhension du conteneur Verre';

COMMENT ON COLUMN m_dechet.an_dec_pav_cont.opercules
    IS 'Présence d''opercules sur le conteneur Verre';

COMMENT ON COLUMN m_dechet.an_dec_pav_cont.tags
    IS 'Présence de tags sur le conteneur';

COMMENT ON COLUMN m_dechet.an_dec_pav_cont.peinture
    IS 'Etat de la peinture du conteneur Verre (liste de valeurs lt_pav_peinture)';

COMMENT ON COLUMN m_dechet.an_dec_pav_cont.type_sol
    IS 'Type de sol sur lequel est posé le conteneur Verre (liste de valeurs lt_pav_typesol)';

COMMENT ON COLUMN m_dechet.an_dec_pav_cont.trp_rest
    IS 'Présence d''une trappe pour restaurateur';

COMMENT ON COLUMN m_dechet.an_dec_pav_cont.etat_sign
    IS 'Etat de la signalétique sur le conteneur Verre (liste de valeurs lt_pav_etatsign)';

COMMENT ON COLUMN m_dechet.an_dec_pav_cont.type_sign
    IS 'Type de signalétique présente sur le conteneur Verre (liste de valeurs lt_pav_typesign)';

COMMENT ON COLUMN m_dechet.an_dec_pav_cont.proprete
    IS 'Etat de propreté du conteneur Verre (liste de valeurs lt_pav_proprete)';

COMMENT ON COLUMN m_dechet.an_dec_pav_cont.def_struc
    IS 'Présence de défaut de structure';

COMMENT ON COLUMN m_dechet.an_dec_pav_cont.op_sai
    IS 'Opérateur de saisie initial du conteneur';

COMMENT ON COLUMN m_dechet.an_dec_pav_cont.observ
    IS 'Observations diverses';

COMMENT ON COLUMN m_dechet.an_dec_pav_cont.date_eve
    IS 'Date du dernier évènement intervenu sur le conteneur Verre';

COMMENT ON COLUMN m_dechet.an_dec_pav_cont.obs_eve
    IS 'Observations liées à l''évènement';

-- Trigger: t_t1_an_dec_pav_cont_lieu

-- DROP TRIGGER t_t1_an_dec_pav_cont_lieu ON m_dechet.an_dec_pav_cont;

CREATE TRIGGER t_t1_an_dec_pav_cont_lieu
    AFTER INSERT OR UPDATE 
    ON m_dechet.an_dec_pav_cont
    FOR EACH ROW
    EXECUTE PROCEDURE m_dechet.ft_m_dec_pav_lieu();

-- Trigger: t_t2_an_dec_pav_cont_datemaj

-- DROP TRIGGER t_t2_an_dec_pav_cont_datemaj ON m_dechet.an_dec_pav_cont;

CREATE TRIGGER t_t2_an_dec_pav_cont_datemaj
    BEFORE INSERT OR UPDATE 
    ON m_dechet.an_dec_pav_cont
    FOR EACH ROW
    EXECUTE PROCEDURE public.ft_r_timestamp_maj();

-- Trigger: t_t3_an_dec_pav_cont_datesai

-- DROP TRIGGER t_t3_an_dec_pav_cont_datesai ON m_dechet.an_dec_pav_cont;

CREATE TRIGGER t_t3_an_dec_pav_cont_datesai
    BEFORE INSERT
    ON m_dechet.an_dec_pav_cont
    FOR EACH ROW
    EXECUTE PROCEDURE public.ft_r_timestamp_sai();

-- Trigger: t_t4_log_pav_verre

-- DROP TRIGGER t_t4_log_pav_verre ON m_dechet.an_dec_pav_cont;

CREATE TRIGGER t_t4_log_pav_verre
    AFTER INSERT OR UPDATE 
    ON m_dechet.an_dec_pav_cont
    FOR EACH ROW
    EXECUTE PROCEDURE m_dechet.ft_m_log_dec_pav();

-- Table: m_dechet.an_dec_pav_cont_tlc

-- DROP TABLE m_dechet.an_dec_pav_cont_tlc;

CREATE TABLE m_dechet.an_dec_pav_cont_tlc
(
    idcont integer DEFAULT nextval('m_dechet.an_dec_pav_cont_idcont_seq'::regclass),
    idlieu integer,
    eve character varying(2) COLLATE pg_catalog."default",
    model integer COLLATE pg_catalog."default",
    nom_entrep character varying(2) COLLATE pg_catalog."default",
    nom_entrep_99 character varying(80) COLLATE pg_catalog."default",
    pos character varying(2) COLLATE pg_catalog."default",
    date_sai timestamp without time zone,
    date_maj timestamp without time zone,
    date_pos timestamp without time zone,
    date_effet timestamp without time zone,
    op_sai character varying(80) COLLATE pg_catalog."default",
    observ character varying(500) COLLATE pg_catalog."default",
    date_eve timestamp without time zone,
    obs_eve character varying(500) COLLATE pg_catalog."default",
    CONSTRAINT an_dec_pav_cont_tlc_eve_fkey FOREIGN KEY (eve)
        REFERENCES m_dechet.lt_pav_eve (code) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT an_dec_pav_cont_tlc_gest_fkey FOREIGN KEY (nom_entrep)
        REFERENCES m_dechet.lt_pav_gest (nom_entrep) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT an_dec_pav_cont_tlc_mat_fkey FOREIGN KEY (mat)
        REFERENCES m_dechet.lt_pav_contmat (cont_mat) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT an_dec_pav_cont_tlc_model_fkey FOREIGN KEY (model)
        REFERENCES m_dechet.lt_pav_modele (code) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT an_dec_pav_cont_tlc_pos_fkey FOREIGN KEY (pos)
        REFERENCES m_dechet.lt_pav_contpos (cont_pos) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
);

COMMENT ON TABLE m_dechet.an_dec_pav_cont_tlc
    IS 'Table alphanumérique des attributs métiers correspondant au conteneur Textile-Linge-Chaussure (en pré-production)';

COMMENT ON COLUMN m_dechet.an_dec_pav_cont_tlc.idcont
    IS 'Identifiant unique du conteneur TLC
(nextval(''m_dechet.an_dec_pav_cont_idcont_seq''::regclass) )';

COMMENT ON COLUMN m_dechet.an_dec_pav_cont_tlc.idlieu
    IS 'Identifiant du lieu de collecte';

COMMENT ON COLUMN m_dechet.an_dec_pav_cont_tlc.eve
    IS 'Evènement intervenu sur le conteneur TLC (liste de valeurs lt_pav_eve)';

COMMENT ON COLUMN m_dechet.an_dec_pav_cont_tlc.model
    IS 'Modèle du conteneur (liste de valeurs lt_pav_modele)';

COMMENT ON COLUMN m_dechet.an_dec_pav_cont_tlc.nom_entrep
    IS 'Nom de l''entreprise gestionnaire du conteneur (liste de valeurs lt_pav_gest)';

COMMENT ON COLUMN m_dechet.an_dec_pav_cont_tlc.nom_entrep_99
    IS 'Autre entreprise gestionnaire si non présente das nom_entrep';

COMMENT ON COLUMN m_dechet.an_dec_pav_cont_tlc.pos
    IS 'Position du conteneur TLC (liste de valeurs lt_pav_pos)';

COMMENT ON COLUMN m_dechet.an_dec_pav_cont_tlc.date_sai
    IS 'Date de saisie initiale';

COMMENT ON COLUMN m_dechet.an_dec_pav_cont_tlc.date_maj
    IS 'Date de mise à jour de la donnée';

COMMENT ON COLUMN m_dechet.an_dec_pav_cont_tlc.date_pos
    IS 'Date de pose du conteneur TLC';

COMMENT ON COLUMN m_dechet.an_dec_pav_cont_tlc.date_effet
    IS 'Date de prise en compte dans l''application Grand Public Plan Interactif ';

COMMENT ON COLUMN m_dechet.an_dec_pav_cont_tlc.op_sai
    IS 'Opérateur de saisie initiale de la donnée';

COMMENT ON COLUMN m_dechet.an_dec_pav_cont_tlc.observ
    IS 'Observations diverses';

COMMENT ON COLUMN m_dechet.an_dec_pav_cont_tlc.date_eve
    IS 'Date du dernier évènement intervenu sur le conteneur TLC';

COMMENT ON COLUMN m_dechet.an_dec_pav_cont_tlc.obs_eve
    IS 'Observations liées à l''évènement';
-- Index: fki_an_dec_pav_cont_tlc_eve_fkey

-- DROP INDEX m_dechet.fki_an_dec_pav_cont_tlc_eve_fkey;

CREATE INDEX fki_an_dec_pav_cont_tlc_eve_fkey
    ON m_dechet.an_dec_pav_cont_tlc USING btree
    (idcont ASC NULLS LAST)
    TABLESPACE pg_default;

-- Trigger: t_t1_an_dec_pav_cont_lieu

-- DROP TRIGGER t_t1_an_dec_pav_cont_lieu ON m_dechet.an_dec_pav_cont_tlc;

CREATE TRIGGER t_t1_an_dec_pav_cont_lieu
    AFTER INSERT OR UPDATE 
    ON m_dechet.an_dec_pav_cont_tlc
    FOR EACH ROW
    EXECUTE PROCEDURE m_dechet.ft_m_dec_pav_lieu();

-- Trigger: t_t2_an_dec_pav_cont_datemaj

-- DROP TRIGGER t_t2_an_dec_pav_cont_datemaj ON m_dechet.an_dec_pav_cont_tlc;

CREATE TRIGGER t_t2_an_dec_pav_cont_datemaj
    BEFORE INSERT OR UPDATE 
    ON m_dechet.an_dec_pav_cont_tlc
    FOR EACH ROW
    EXECUTE PROCEDURE public.ft_r_timestamp_maj();
    

-- Trigger: t_t3_an_dec_pav_cont_datesai

-- DROP TRIGGER t_t3_an_dec_pav_cont_datesai ON m_dechet.an_dec_pav_cont_tlc;

CREATE TRIGGER t_t3_an_dec_pav_cont_datesai
    BEFORE INSERT
    ON m_dechet.an_dec_pav_cont_tlc
    FOR EACH ROW
    EXECUTE PROCEDURE public.ft_r_timestamp_sai();
    
-- Trigger: t_t4_log_pav_tlc

-- DROP TRIGGER t_t4_log_pav_tlc ON m_dechet.an_dec_pav_cont_tlc;

CREATE TRIGGER t_t4_log_pav_tlc
    AFTER INSERT OR UPDATE 
    ON m_dechet.an_dec_pav_cont_tlc
    FOR EACH ROW
    EXECUTE PROCEDURE m_dechet.ft_m_log_dec_pav();    

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

-- Table: m_dechet.an_dec_pav_model_media

-- DROP TABLE m_dechet.an_dec_pav_model_media;

CREATE TABLE m_dechet.an_dec_pav_model_media
(
    gid integer NOT NULL DEFAULT nextval('m_dechet.an_dec_pav_doc_media_gid_seq'::regclass),
    id integer,
    media text COLLATE pg_catalog."default",
    miniature bytea,
    n_fichier text COLLATE pg_catalog."default",
    t_fichier text COLLATE pg_catalog."default",
    op_sai character varying(100) COLLATE pg_catalog."default",
    date_sai timestamp without time zone,
    CONSTRAINT an_dec_pav_model_media_pkey PRIMARY KEY (gid)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

COMMENT ON TABLE m_dechet.an_dec_pav_model_media
    IS 'Table gérant les photos des modèles de PAV Verre ou TLC';

COMMENT ON COLUMN m_dechet.an_dec_pav_model_media.id
    IS 'Identifiant du modèle';

COMMENT ON COLUMN m_dechet.an_dec_pav_model_media.media
    IS 'Champ Média de GEO';

COMMENT ON COLUMN m_dechet.an_dec_pav_model_media.miniature
    IS 'Champ miniature de GEO';

COMMENT ON COLUMN m_dechet.an_dec_pav_model_media.n_fichier
    IS 'Nom du fichier';

COMMENT ON COLUMN m_dechet.an_dec_pav_model_media.t_fichier
    IS 'Type de média dans GEO';

COMMENT ON COLUMN m_dechet.an_dec_pav_model_media.op_sai
    IS 'Libellé de l''opérateur ayant intégrer le modèle';

COMMENT ON COLUMN m_dechet.an_dec_pav_model_media.date_sai
    IS 'Date d''intégration du document';

-- Trigger: t_t1_an_dec_pav_doc_media_date_sai

-- DROP TRIGGER t_t1_an_dec_pav_doc_media_date_sai ON m_dechet.an_dec_pav_doc_media;

CREATE TRIGGER t_t1_an_dec_pav_model_media_date_sai
    BEFORE INSERT
    ON m_dechet.an_dec_pav_model_media
    FOR EACH ROW
    EXECUTE PROCEDURE public.ft_r_timestamp_sai();

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
-- ###                                                                LOG                                                           		    ###
-- ###                                                                                                                                              ###
-- ####################################################################################################################################################

-- Table: m_dechet.an_dec_pav_log

-- DROP TABLE m_dechet.an_dec_pav_log;

CREATE TABLE m_dechet.an_dec_pav_log
(
    idlog integer NOT NULL,
    tablename character varying(80) COLLATE pg_catalog."default" NOT NULL,
    type_ope text COLLATE pg_catalog."default" NOT NULL,
    dataold character varying(10000) COLLATE pg_catalog."default",
    datanew character varying(10000) COLLATE pg_catalog."default",
    date_maj timestamp without time zone,
    CONSTRAINT an_dec_pav_log_pkey PRIMARY KEY (idlog)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;


COMMENT ON TABLE m_dechet.an_dec_pav_log
    IS 'Table des opérations sur la base de données des lieux de collecte et des conteneurs Verre ou TLC(PAV)';

COMMENT ON COLUMN m_dechet.an_dec_pav_log.idlog
    IS 'Identifiant unique de d''opération';

COMMENT ON COLUMN m_dechet.an_dec_pav_log.tablename
    IS 'Nom de la table concernée par l''opération sur l''entité';

COMMENT ON COLUMN m_dechet.an_dec_pav_log.type_ope
    IS 'Type l''opération sur l''entité';

COMMENT ON COLUMN m_dechet.an_dec_pav_log.dataold
    IS 'Valeur ancienne avant l''opération sur l''entité';

COMMENT ON COLUMN m_dechet.an_dec_pav_log.datanew
    IS 'Valeur nouvelle après l''opération sur l''entité';

COMMENT ON COLUMN m_dechet.an_dec_pav_log.date_maj
    IS 'Horodatage de l''opération sur la base des lieux de collecte et des conteneurs Verre ou TLC (PAV)';
  
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


-- FUNCTION: m_dechet.ft_m_dec_lieu_delete()

-- DROP FUNCTION m_dechet.ft_m_dec_lieu_delete();

CREATE FUNCTION m_dechet.ft_m_dec_lieu_delete()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$

BEGIN

IF (old.statut = '10' or old.statut ='00') AND new.statut = '20' THEN
UPDATE m_dechet.an_dec_pav_cont SET eve = '21', date_eve = now() WHERE idlieu = old.idlieu;
UPDATE m_dechet.an_dec_pav_cont_tlc SET eve = '21', date_eve = now() WHERE idlieu = old.idlieu;
END IF;

return new;

END;
$BODY$;

COMMENT ON FUNCTION m_dechet.ft_m_dec_lieu_delete()
    IS 'Fonction trigger pour automatiser la dépose de tous les conteneurs lorsque le lieu de collecte devient inactif';


-- FUNCTION: m_dechet.ft_m_dec_pav_lieu()

-- DROP FUNCTION m_dechet.ft_m_dec_pav_lieu();

CREATE OR REPLACE FUNCTION m_dechet.ft_m_dec_pav_lieu()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$

BEGIN

-- après l'insertion d'un conteneur ou mise à jour, je mets à jour le nombre de conteneurs verre dans les lieux de collecte
update m_dechet.geo_dec_pav_lieu set nb_cont = (SELECT count(*) from m_dechet.an_dec_pav_cont where eve IN ('10','11','12','13','14') 
AND idlieu=geo_dec_pav_lieu.idlieu);

-- après l'insertion d'un conteneur ou mise à jour, je mets à jour le type de lieu
update m_dechet.geo_dec_pav_lieu set cttype = b.cttype from (
WITH
req_tot as 
(
WITH 
req_verre as
(
SELECT 
	l.idlieu,
	count(*) as nb_verre
FROM 
	m_dechet.geo_dec_pav_lieu l 
LEFT JOIN m_dechet.an_dec_pav_cont a ON l.idlieu=a.idlieu 
WHERE a.eve like '1%' 
GROUP BY l.idlieu
),
req_tlc as
(
SELECT 
	l.idlieu,
	count(*) as nb_tlc
FROM 
	m_dechet.geo_dec_pav_lieu l 
LEFT JOIN m_dechet.an_dec_pav_cont_tlc a ON l.idlieu=a.idlieu 
WHERE a.eve like '1%' 
GROUP BY l.idlieu
)

SELECT
l.idlieu,
CASE WHEN v.nb_verre > 0 THEN v.nb_verre ELSE 0 END as nb_verre,
CASE WHEN t.nb_tlc > 0 THEN t.nb_tlc ELSE 0 END as nb_tlc
FROM
m_dechet.geo_dec_pav_lieu l 
LEFT JOIN req_verre v ON l.idlieu = v.idlieu
LEFT JOIN req_tlc t ON l.idlieu = t.idlieu
)
SELECT
idlieu,
CASE 
WHEN nb_verre > 0 AND nb_tlc = 0 THEN '10'
WHEN nb_verre = 0 AND nb_tlc > 0 THEN '20'
WHEN nb_verre > 0 AND nb_tlc > 0 THEN '30'
WHEN nb_verre = 0 AND nb_tlc = 0 THEN '40'
END AS cttype
FROM
req_tot 
	) b WHERE geo_dec_pav_lieu.idlieu = b.idlieu;

return new;

END;
$BODY$;

ALTER FUNCTION m_dechet.ft_m_dec_pav_lieu()
    OWNER TO sig_create;

GRANT EXECUTE ON FUNCTION m_dechet.ft_m_dec_pav_lieu() TO sig_create;

GRANT EXECUTE ON FUNCTION m_dechet.ft_m_dec_pav_lieu() TO PUBLIC;

GRANT EXECUTE ON FUNCTION m_dechet.ft_m_dec_pav_lieu() TO create_sig;

COMMENT ON FUNCTION m_dechet.ft_m_dec_pav_lieu()
    IS 'Fonction trigger pour mise à jour lieu de collecte (nb de conteneur verre et type de lieu)';


-- FUNCTION: m_dechet.ft_m_tampon_lieu_nav()

-- DROP FUNCTION m_dechet.ft_m_tampon_lieu_nav();

CREATE FUNCTION m_dechet.ft_m_tampon_lieu_nav()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$

BEGIN

update m_dechet.geo_dec_pav_lieu set geom2 = st_buffer(geom,new.v_tampon) where idlieu=new.idlieu;

return new;

END;
$BODY$;

COMMENT ON FUNCTION m_dechet.ft_m_tampon_lieu_nav()
    IS 'Fonction trigger pour mise à jour du tampon d''emprise du lieu de collecte si v_tampon est modifiée';

-- FUNCTION: public.ft_r_timestamp_maj()

-- DROP FUNCTION public.ft_r_timestamp_maj();

CREATE FUNCTION public.ft_r_timestamp_maj()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$BEGIN
new.date_maj=current_timestamp;
return new;
END$BODY$;

COMMENT ON FUNCTION public.ft_r_timestamp_maj()
    IS 'Fonction dont l''objet est de mettre à jour la date et l''heure locale de mise à jour (géométrie et/ou attribut) de la donnée (champ date_maj).';


-- FUNCTION: public.ft_r_timestamp_sai()

-- DROP FUNCTION public.ft_r_timestamp_sai();

CREATE FUNCTION public.ft_r_timestamp_sai()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$BEGIN
new.date_sai=current_timestamp;
return new;
END$BODY$;

COMMENT ON FUNCTION public.ft_r_timestamp_sai()
    IS 'Fonction dont l''objet est d''insérer la date et l''heure locale de saisie (géométrie et/ou attribut) de la donnée (champ date_sai).';


-- FUNCTION: public.ft_r_commune_pl()

-- DROP FUNCTION public.ft_r_commune_pl();

CREATE FUNCTION public.ft_r_commune_pl()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$BEGIN
select into new.insee string_agg(insee, ', ') from r_osm.geo_osm_commune where st_intersects(new.geom,geom);
select into new.commune string_agg(commune, ', ') from r_osm.geo_osm_commune where st_intersects(new.geom,geom);
return new;
END$BODY$;

COMMENT ON FUNCTION public.ft_r_commune_pl()
    IS 'Fonction dont l''objet est de recupérer par croisement géographique, le nom et le code insee de la commune à partir de la vue de référence r_osm.geo_v_osm_commune
Fonction réservée au géométrie de type point et ligne';

-- FUNCTION: public.ft_r_quartier()

-- DROP FUNCTION public.ft_r_quartier();

CREATE FUNCTION public.ft_r_quartier()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$BEGIN
select into new.quartier string_agg(nom, ', ') from r_administratif.geo_adm_quartier where st_intersects(new.geom,geom);
return new;
END$BODY$;

COMMENT ON FUNCTION public.ft_r_quartier()
    IS 'Fonction dont l''objet est de recupérer par croisement géographique, le nom du quartier de la commune à partir de la table geo_adm_quartier';

-- FUNCTION: public.ft_r_xy_l93()

-- DROP FUNCTION public.ft_r_xy_l93();

CREATE FUNCTION public.ft_r_xy_l93()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$BEGIN
new.x_l93=ST_X(new.geom);
new.y_l93=ST_Y(new.geom);
return new;
END$BODY$;

COMMENT ON FUNCTION public.ft_r_xy_l93()
    IS 'Fonction dont l''objet est de récupérer les coordonnées X et Y en Lambert 93 (epsg:2154)';
    
    
-- FUNCTION: m_dechet.ft_m_log_dec_pav()

-- DROP FUNCTION m_dechet.ft_m_log_dec_pav();

CREATE FUNCTION m_dechet.ft_m_log_dec_pav()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$
DECLARE v_idlog integer;
DECLARE v_dataold character varying(5000);
DECLARE v_datanew character varying(5000);
DECLARE v_name_table character varying(254);
BEGIN

-- INSERT
IF (TG_OP = 'INSERT') THEN

  v_idlog := nextval('m_dechet.an_dec_pav_log_idlog_seq'::regclass); 
  v_datanew := ROW(NEW.*); ------------------------------------ On concatène tous les attributs dans un seul

  ---
  INSERT INTO m_dechet.an_dec_pav_log (idlog, tablename, type_ope, dataold, datanew, date_maj)
  SELECT
  v_idlog,
  TG_TABLE_NAME,
  'INSERT',
  NULL,
  v_datanew,
  now();

  ---
  
  RETURN NEW;
  

-- UPDATE
ELSIF (TG_OP = 'UPDATE') THEN 
  ---
  
  v_idlog := nextval('m_dechet.an_dec_pav_log_idlog_seq'::regclass);
  v_dataold := ROW(OLD.*);------------------------------------ On concatène tous les anciens attributs dans un seul
  v_datanew := ROW(NEW.*);------------------------------------ On concatène tous les nouveaux attributs dans un seul	
  v_name_table := TG_TABLE_NAME;

  ---
  
  INSERT INTO m_dechet.an_dec_pav_log (idlog, tablename,  type_ope, dataold, datanew, date_maj)
  SELECT
  v_idlog,
  v_name_table,
  'UPDATE',
  v_dataold,
  v_datanew,
  now();
  RETURN NEW;
  

END IF;

END;
$BODY$;

-- FUNCTION: m_dechet.ft_m_log_dec_lieu()

-- DROP FUNCTION m_dechet.ft_m_log_dec_lieu();

CREATE OR REPLACE FUNCTION m_dechet.ft_m_log_dec_lieu()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$
DECLARE v_idlog integer;
DECLARE v_dataold character varying(5000);
DECLARE v_datanew character varying(5000);
DECLARE v_nnbcont integer;
DECLARE v_onbcont integer;
DECLARE v_ncttype character varying(2);
DECLARE v_octtype character varying(2);
DECLARE v_name_table character varying(254);
BEGIN

-- INSERT
IF (TG_OP = 'INSERT') THEN

  v_idlog := nextval('m_dechet.an_dec_pav_log_idlog_seq'::regclass); 
  v_datanew := ROW(NEW.*); ------------------------------------ On concatène tous les attributs dans un seul

  ---
  INSERT INTO m_dechet.an_dec_pav_log (idlog, tablename, type_ope, dataold, datanew, date_maj)
  SELECT
  v_idlog,
  TG_TABLE_NAME,
  'INSERT',
  NULL,
  v_datanew,
  now();

  ---
  
  RETURN NEW;
  

-- UPDATE
ELSIF (TG_OP = 'UPDATE') THEN 
  ---
  
  v_idlog := nextval('m_dechet.an_dec_pav_log_idlog_seq'::regclass);
  v_dataold := ROW(OLD.*);------------------------------------ On concatène tous les anciens attributs dans un seul
  v_datanew := ROW(NEW.*);------------------------------------ On concatène tous les nouveaux attributs dans un seul	
  v_name_table := TG_TABLE_NAME;
  v_nnbcont := NEW.nb_cont;
  v_onbcont := OLD.nb_cont;
  v_ncttype := NEW.cttype;
  v_octtype := OLD.cttype;
  

  INSERT INTO m_dechet.an_dec_pav_log (idlog, tablename,  type_ope, dataold, datanew, date_maj)
  SELECT
  v_idlog,
  v_name_table,
  'UPDATE',
  v_dataold,
  v_datanew,
  now()
  
  -- afin d'éviter l'écriture multiple de lieux suite à la mise automatique du nb de conteneurs et du type via l'insertion ou la mise à jour d'un conteneur
  -- filtre uniquement sur les attributs ayant changé
  
  WHERE 
    new.statut <> old.statut OR
	new.cttype <> old.cttype OR
    new.quartier <> old.quartier OR
    new.adresse <> old.adresse OR
    new.localisation <> old.localisation OR
    new.nb_cont <> old.nb_cont OR
    new.prop_abor <> old. prop_abor OR
    new.env_type <> old.env_type OR
    new.env_implan <> old.env_implan OR
    new.env_situ <> old.env_situ OR
    new.prox_corb <> old.prox_corb OR
    new.opt_pav <> old.opt_pav OR
    new.ame_acces <> old.ame_acces OR
	new.nat_pb <> old.nat_pb OR
    new.nat_pb_99 <> old.nat_pb_99 OR
    new.pavorient <> old.pavorient OR
    new.idparent <> old.idparent OR
    new.src_geom <> old.src_geom OR
    new.src_date <> old.src_date OR
    new.op_sai <> old.op_sai OR
    new.observ <> old.observ
  ;
  
 
RETURN NEW;

END IF;

END;
$BODY$;




