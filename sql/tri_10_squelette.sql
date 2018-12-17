/*TRI SELECTIF V1.0*/
/*Creation du squelette de la structure des données */
/* tri_10_squelette.sql */
/*PostGIS*/

/* Propriétaire : GeoCompiegnois - http://geo.compiegnois.fr/ */
/* Auteur : Grégory Bodet */


-- ####################################################################################################################################################
-- ###                                                                                                                                              ###
-- ###                                                                SCHEMA                                                           ###
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
-- ###                                                                SEQUENCE                                                           ###
-- ###                                                                                                                                              ###
-- ####################################################################################################################################################


DROP SEQUENCE IF EXISTS m_dechet.an_dec_pav_doc_media_gid_seq;
DROP SEQUENCE IF EXISTS m_dechet.geo_dec_dechetterie_gid_seq;
DROP SEQUENCE mIF EXISTS _dechet.geo_dec_pav_idconv_seq;
DROP SEQUENCE IF EXISTS m_dechet.geo_dec_secteur_enc_seq;
DROP SEQUENCE IF EXISTS m_dechet.geo_dec_secteur_om_seq;
DROP SEQUENCE IF EXISTS m_dechet.log_dec_pav_gid_seq;

-- ################################################################# Séquence sur TABLE  ###############################################

-- Sequence: m_dechet.an_dec_pav_doc_media_gid_seq

-- DROP SEQUENCE m_dechet.an_dec_pav_doc_media_gid_seq;

CREATE SEQUENCE m_dechet.an_dec_pav_doc_media_gid_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 331
  CACHE 1;
  
  -- Sequence: m_dechet.geo_dec_dechetterie_gid_seq

-- DROP SEQUENCE m_dechet.geo_dec_dechetterie_gid_seq;

CREATE SEQUENCE m_dechet.geo_dec_dechetterie_gid_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 4
  CACHE 1;
  
  -- Sequence: m_dechet.geo_dec_pav_idconv_seq

-- DROP SEQUENCE m_dechet.geo_dec_pav_idconv_seq;

CREATE SEQUENCE m_dechet.geo_dec_pav_idconv_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 415
  CACHE 1;
  
  -- Sequence: m_dechet.geo_dec_secteur_enc_seq

-- DROP SEQUENCE m_dechet.geo_dec_secteur_enc_seq;

CREATE SEQUENCE m_dechet.geo_dec_secteur_enc_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 838
  CACHE 1;
  
  
  -- Sequence: m_dechet.geo_dec_secteur_om_seq

-- DROP SEQUENCE m_dechet.geo_dec_secteur_om_seq;

CREATE SEQUENCE m_dechet.geo_dec_secteur_om_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 23
  CACHE 1;
  
  -- Sequence: m_dechet.log_dec_pav_gid_seq

-- DROP SEQUENCE m_dechet.log_dec_pav_gid_seq;

CREATE SEQUENCE m_dechet.log_dec_pav_gid_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 32
  CACHE 1;
  
  
-- ####################################################################################################################################################
-- ###                                                                                                                                              ###
-- ###                                                                DOMAINE DE VALEURS                                                           ###
-- ###                                                                                                                                              ###
-- ####################################################################################################################################################


-- fkey
ALTER TABLE m_dechet.geo_dec_pav_tlc DROP CONSTRAINT IF EXISTS geo_dec_pav_tlc_contmat_fkey;
ALTER TABLE m_dechet.geo_dec_pav_tlc DROP CONSTRAINT IF EXISTS geo_dec_pav_tlc_contpos_fkey;
ALTER TABLE m_dechet.geo_dec_pav_tlc DROP CONSTRAINT IF EXISTS geo_dec_pav_tlc_envimplan_fkey;
ALTER TABLE m_dechet.geo_dec_pav_tlc DROP CONSTRAINT IF EXISTS geo_dec_pav_tlc_envsitu_fkey;
ALTER TABLE m_dechet.geo_dec_pav_tlc DROP CONSTRAINT IF EXISTS geo_dec_pav_tlc_envtype_fkey;
ALTER TABLE m_dechet.geo_dec_pav_tlc DROP CONSTRAINT IF EXISTS geo_dec_pav_tlc_gest_fkey;
ALTER TABLE m_dechet.geo_dec_pav_tlc DROP CONSTRAINT IF EXISTS geo_dec_pav_tlc_peinture_fkey;
ALTER TABLE m_dechet.geo_dec_pav_tlc DROP CONSTRAINT IF EXISTS geo_dec_pav_tlc_srcgeom_fkey;
ALTER TABLE m_dechet.geo_dec_pav_tlc DROP CONSTRAINT IF EXISTS geo_dec_pav_tlc_typesol_fkey;

ALTER TABLE m_dechet.geo_dec_pav_verre DROP CONSTRAINT IF EXISTS geo_dec_pav_verre_contmat_fkey;
ALTER TABLE m_dechet.geo_dec_pav_verre DROP CONSTRAINT IF EXISTS geo_dec_pav_verre_contpos_fkey;
ALTER TABLE m_dechet.geo_dec_pav_verre DROP CONSTRAINT IF EXISTS geo_dec_pav_verre_crochet_fkey;
ALTER TABLE m_dechet.geo_dec_pav_verre DROP CONSTRAINT IF EXISTS geo_dec_pav_verre_envimplan_fkey;
ALTER TABLE m_dechet.geo_dec_pav_verre DROP CONSTRAINT IF EXISTS geo_dec_pav_verre_envsitu_fkey;
ALTER TABLE m_dechet.geo_dec_pav_verre DROP CONSTRAINT IF EXISTS geo_dec_pav_verre_envtype_fkey;
ALTER TABLE m_dechet.geo_dec_pav_verre DROP CONSTRAINT IF EXISTS geo_dec_pav_verre_etatsign_fkey;
ALTER TABLE m_dechet.geo_dec_pav_verre DROP CONSTRAINT IF EXISTS geo_dec_pav_verre_modepreh_fkey;
ALTER TABLE m_dechet.geo_dec_pav_verre DROP CONSTRAINT IF EXISTS geo_dec_pav_verre_peinture_fkey;
ALTER TABLE m_dechet.geo_dec_pav_verre DROP CONSTRAINT IF EXISTS geo_dec_pav_verre_propabord_fkey;
ALTER TABLE m_dechet.geo_dec_pav_verre DROP CONSTRAINT IF EXISTS geo_dec_pav_verre_proprete_fkey;
ALTER TABLE m_dechet.geo_dec_pav_verre DROP CONSTRAINT IF EXISTS geo_dec_pav_verre_srcgeom_fkey;
ALTER TABLE m_dechet.geo_dec_pav_verre DROP CONSTRAINT IF EXISTS geo_dec_pav_verre_statut_fkey;
ALTER TABLE m_dechet.geo_dec_pav_verre DROP CONSTRAINT IF EXISTS geo_dec_pav_verre_typesign_fkey;
ALTER TABLE m_dechet.geo_dec_pav_verre DROP CONSTRAINT IF EXISTS geo_dec_pav_verre_typesol_fkey;

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
  cont_pos character varying(2) NOT NULL, -- code du type de position du conteneur
  cont_pos_lib character varying(30), -- libellé du type de position du conteneur
  CONSTRAINT lt_pav_contpos_pkkey PRIMARY KEY (cont_pos) -- Clé primaire de la table lt_pav_contpos
)
WITH (
  OIDS=FALSE
);

COMMENT ON TABLE m_dechet.lt_pav_contpos
  IS 'Liste de valeurs des codes du type de position du conteneur';
COMMENT ON COLUMN m_dechet.lt_pav_contpos.cont_pos IS 'code du type de position du conteneur';
COMMENT ON COLUMN m_dechet.lt_pav_contpos.cont_pos_lib IS 'libellé du type de position du conteneur';

COMMENT ON CONSTRAINT lt_pav_contpos_pkkey ON m_dechet.lt_pav_contpos IS 'Clé primaire de la table lt_pav_contpos';

INSERT INTO m_dechet.lt_pav_contpos(
            cont_pos, cont_pos_lib)
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
  crochet character varying(2) NOT NULL, -- code de l'état du crochet
  crochet_lib character varying(30), -- libellé de l'état du crochet
  CONSTRAINT lt_pav_crochet_pkkey PRIMARY KEY (crochet) -- Clé primaire de la table lt_pav_crochet
)
WITH (
  OIDS=FALSE
);

COMMENT ON TABLE m_dechet.lt_pav_crochet
  IS 'Liste de valeurs des codes de l''état du crochet ';
COMMENT ON COLUMN m_dechet.lt_pav_crochet.crochet IS 'code de l''état du crochet ';
COMMENT ON COLUMN m_dechet.lt_pav_crochet.crochet_lib IS 'libellé de l''état du crochet ';

COMMENT ON CONSTRAINT lt_pav_crochet_pkkey ON m_dechet.lt_pav_crochet IS 'Clé primaire de la table lt_pav_crochet';

INSERT INTO m_dechet.lt_pav_crochet(
            crochet, crochet_lib)
    VALUES
    ('00','Non renseigné'),
    ('10','RAS'),
    ('20','Tordu');
    
    
-- ################################################################# Domaine valeur - lt_pav_envimplan  ###############################################

-- Table: m_dechet.lt_pav_envimplan

-- DROP TABLE m_dechet.lt_pav_envimplan;

CREATE TABLE m_dechet.lt_pav_envimplan
(
  env_implan character varying(2) NOT NULL, -- code du type d'espace urbain d'implantation
  env_implan_lib character varying(30), -- libellé du type d'espace urbain d'implantation
  CONSTRAINT lt_pav_envimplan_pkkey PRIMARY KEY (env_implan) -- Clé primaire de la table lt_pav_envimplan
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
            env_implan, env_implan_lib)
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
  env_situ character varying(2) NOT NULL, -- code de la situation domaniale
  env_situ_lib character varying(30), -- libellé du type de la situation domaniale
  CONSTRAINT lt_pav_envsitu_pkkey PRIMARY KEY (env_situ) -- Clé primaire de la table lt_pav_envsitu
)
WITH (
  OIDS=FALSE
);

COMMENT ON TABLE m_dechet.lt_pav_envsitu
  IS 'Liste de valeurs des codes de la situation domaniale';
COMMENT ON COLUMN m_dechet.lt_pav_envsitu.env_situ IS 'code de la situation domaniale';
COMMENT ON COLUMN m_dechet.lt_pav_envsitu.env_situ_lib IS 'libellé du type de la situation domaniale';

COMMENT ON CONSTRAINT lt_pav_envsitu_pkkey ON m_dechet.lt_pav_envsitu IS 'Clé primaire de la table lt_pav_envsitu';

INSERT INTO m_dechet.lt_pav_envsitu(
            env_situ, env_situ_lib)
    VALUES
    ('00','Non renseigné'),
    ('10','Terrain privé'),
    ('20','Terrain public');
    
-- ################################################################# Domaine valeur - lt_pav_envtype  ###############################################

-- Table: m_dechet.lt_pav_envtype

-- DROP TABLE m_dechet.lt_pav_envtype;

CREATE TABLE m_dechet.lt_pav_envtype
(
  env_type character varying(2) NOT NULL, -- code du type d'espace géographique
  env_type_lib character varying(30), -- libellé du type d'espace géographique
  CONSTRAINT lt_pav_envtype_pkkey PRIMARY KEY (env_type) -- Clé primaire de la table lt_pav_envtype
)
WITH (
  OIDS=FALSE
);

COMMENT ON TABLE m_dechet.lt_pav_envtype
  IS 'Liste de valeurs des codes du type d''espace géographique';
COMMENT ON COLUMN m_dechet.lt_pav_envtype.env_type IS 'code du type d''espace géographique';
COMMENT ON COLUMN m_dechet.lt_pav_envtype.env_type_lib IS 'libellé du type d''espace géographique';

COMMENT ON CONSTRAINT lt_pav_envtype_pkkey ON m_dechet.lt_pav_envtype IS 'Clé primaire de la table lt_pav_envtype';


INSERT INTO m_dechet.lt_pav_envtype(
            env_type, env_type_lib)
    VALUES
    ('00','Non renseigné'),
    ('10','Urbain'),
    ('20','Rural'); 
    
    
-- ################################################################# Domaine valeur - lt_pav_etatsign  ###############################################

-- Table: m_dechet.lt_pav_etatsign

-- DROP TABLE m_dechet.lt_pav_etatsign;

CREATE TABLE m_dechet.lt_pav_etatsign
(
  etat_sign character varying(2) NOT NULL, -- Code matériaux constituant le conteneur
  etat_sign_lib character varying(30), -- Libellé des matériaux constituant le conteneur
  CONSTRAINT lt_pav_etat_sign_pkkey PRIMARY KEY (etat_sign) -- Clé primaire de la table lt_pav_etat_sign
)
WITH (
  OIDS=FALSE
);

COMMENT ON TABLE m_dechet.lt_pav_etatsign
  IS 'Liste de valeurs de l''état de la signalitique';
COMMENT ON COLUMN m_dechet.lt_pav_etatsign.etat_sign IS 'Code matériaux constituant le conteneur';
COMMENT ON COLUMN m_dechet.lt_pav_etatsign.etat_sign_lib IS 'Libellé des matériaux constituant le conteneur';

COMMENT ON CONSTRAINT lt_pav_etat_sign_pkkey ON m_dechet.lt_pav_etatsign IS 'Clé primaire de la table lt_pav_etat_sign';


INSERT INTO m_dechet.lt_pav_etatsign(
            etat_sign, etat_sign_lib)
    VALUES
    ('00','Non renseigné'),
    ('10','Correct'),
    ('20','Moyen'), 
    ('30','Mauvais'),
    ('40','Incomplet'); 
    
-- ################################################################# Domaine valeur - lt_pav_gest  ###############################################

-- Table: m_dechet.lt_pav_gest

-- DROP TABLE m_dechet.lt_pav_gest;

CREATE TABLE m_dechet.lt_pav_gest
(
  nom_entrep character varying(2) NOT NULL, -- code du gestionnaire du PAV TLC
  nom_entrep_lib character varying(30), -- Libellé du code du gestionnaire du PAV TLC
  CONSTRAINT lt_pav_gest_pkkey PRIMARY KEY (nom_entrep) -- Clé primaire de la table lt_pav_gest
)
WITH (
  OIDS=FALSE
);

COMMENT ON TABLE m_dechet.lt_pav_gest
  IS 'Liste de valeurs des codes des gestionnaire du PAV TLC';
COMMENT ON COLUMN m_dechet.lt_pav_gest.nom_entrep IS 'code du gestionnaire du PAV TLC';
COMMENT ON COLUMN m_dechet.lt_pav_gest.nom_entrep_lib IS 'Libellé du code du gestionnaire du PAV TLC';

COMMENT ON CONSTRAINT lt_pav_gest_pkkey ON m_dechet.lt_pav_gest IS 'Clé primaire de la table lt_pav_gest';


INSERT INTO m_dechet.lt_pav_gest(
            nom_entrep, nom_entrep_lib)
    VALUES
    ('00','Non renseigné'),
    ('10','Le Relais'),
    ('20','Eco Textile'), 
    ('99','Autre'); 
    
-- ################################################################# Domaine valeur - lt_pav_modepreh  ###############################################

-- Table: m_dechet.lt_pav_modepreh

-- DROP TABLE m_dechet.lt_pav_modepreh;

CREATE TABLE m_dechet.lt_pav_modepreh
(
  mode_preh character varying(2) NOT NULL, -- code du mode de préhension
  mode_preh_lib character varying(30), -- libellé du mode de préhension
  CONSTRAINT lt_pav_modepreh_pkkey PRIMARY KEY (mode_preh) -- Clé primaire de la table lt_pav_modepreh
)
WITH (
  OIDS=FALSE
);

COMMENT ON TABLE m_dechet.lt_pav_modepreh
  IS 'Liste de valeurs des codes du mode de préhension';
COMMENT ON COLUMN m_dechet.lt_pav_modepreh.mode_preh IS 'code du mode de préhension';
COMMENT ON COLUMN m_dechet.lt_pav_modepreh.mode_preh_lib IS 'libellé du mode de préhension';

COMMENT ON CONSTRAINT lt_pav_modepreh_pkkey ON m_dechet.lt_pav_modepreh IS 'Clé primaire de la table lt_pav_modepreh';


INSERT INTO m_dechet.lt_pav_modepreh(
            mode_preh, mode_preh_lib)
    VALUES
    ('00','Non renseigné'),
    ('10','Crochet'),
    ('20','Kinshofer');
    
-- ################################################################# Domaine valeur - lt_pav_natpb  ###############################################


-- Table: m_dechet.lt_pav_natpb

-- DROP TABLE m_dechet.lt_pav_natpb;

CREATE TABLE m_dechet.lt_pav_natpb
(
  nat_pb character varying(2) NOT NULL, -- code de la nature du ou des problèmes
  nat_pb_lib character varying(30), -- Libellé des codes de la nature du ou des problèmes
  CONSTRAINT lt_pav_natpb_pkkey PRIMARY KEY (nat_pb) -- Clé primaire de la table lt_pav_natpb
)
WITH (
  OIDS=FALSE
);

COMMENT ON TABLE m_dechet.lt_pav_natpb
  IS 'Liste de valeurs des codes de la nature du ou des problèmes';
COMMENT ON COLUMN m_dechet.lt_pav_natpb.nat_pb IS 'code de la nature du ou des problèmes';
COMMENT ON COLUMN m_dechet.lt_pav_natpb.nat_pb_lib IS 'Libellé des codes de la nature du ou des problèmes';

COMMENT ON CONSTRAINT lt_pav_natpb_pkkey ON m_dechet.lt_pav_natpb IS 'Clé primaire de la table lt_pav_natpb';


INSERT INTO m_dechet.lt_pav_natpb(
            nat_pb, nat_pb_lib)
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
  pavorient character varying(2) NOT NULL, -- code de l'orientation du PAV suite à l'état des lieux de l'été 2016
  pavorient_lib character varying(30), -- Libellé de l'orientation du PAV suite à l'état des lieux de l'été 2016
  CONSTRAINT lt_pav_pavorient_pkkey PRIMARY KEY (pavorient) -- Clé primaire de la table lt_pav_pavorient
)
WITH (
  OIDS=FALSE
);

COMMENT ON TABLE m_dechet.lt_pav_pavorient
  IS 'Liste de valeurs des code de l''état de la peinture';
COMMENT ON COLUMN m_dechet.lt_pav_pavorient.pavorient IS 'code de l''orientation du PAV suite à l''état des lieux de l''été 2016';
COMMENT ON COLUMN m_dechet.lt_pav_pavorient.pavorient_lib IS 'Libellé de l''orientation du PAV suite à l''état des lieux de l''été 2016';

COMMENT ON CONSTRAINT lt_pav_pavorient_pkkey ON m_dechet.lt_pav_pavorient IS 'Clé primaire de la table lt_pav_pavorient';

INSERT INTO m_dechet.lt_pav_pavorient(
            pavorient, pavorient_lib)
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
  peinture character varying(2) NOT NULL, -- code de l'état de la peinture
  peinture_lib character varying(30), -- Libellé de l'état de la peinture
  CONSTRAINT lt_pav_peinture_pkkey PRIMARY KEY (peinture) -- Clé primaire de la table lt_pav_peinture
)
WITH (
  OIDS=FALSE
);

COMMENT ON TABLE m_dechet.lt_pav_peinture
  IS 'Liste de valeurs des code de l''état de la peinture';
COMMENT ON COLUMN m_dechet.lt_pav_peinture.peinture IS 'code de l''état de la peinture';
COMMENT ON COLUMN m_dechet.lt_pav_peinture.peinture_lib IS 'Libellé de l''état de la peinture';

COMMENT ON CONSTRAINT lt_pav_peinture_pkkey ON m_dechet.lt_pav_peinture IS 'Clé primaire de la table lt_pav_peinture';

INSERT INTO m_dechet.lt_pav_peinture(
            peinture, peinture_lib)
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
  proprete character varying(2) NOT NULL, -- code de l'état de la propreté
  proprete_lib character varying(30), -- Libellé code de l'état de la propreté
  CONSTRAINT lt_pav_proprete_pkkey PRIMARY KEY (proprete) -- Clé primaire de la table lt_pav_proprete
)
WITH (
  OIDS=FALSE
);

COMMENT ON TABLE m_dechet.lt_pav_proprete
  IS 'Liste de valeurs des codes de l''état de la propreté';
COMMENT ON COLUMN m_dechet.lt_pav_proprete.proprete IS 'code de l''état de la propreté';
COMMENT ON COLUMN m_dechet.lt_pav_proprete.proprete_lib IS 'Libellé code de l''état de la propreté';

COMMENT ON CONSTRAINT lt_pav_proprete_pkkey ON m_dechet.lt_pav_proprete IS 'Clé primaire de la table lt_pav_proprete';


INSERT INTO m_dechet.lt_pav_proprete(
            proprete, proprete_lib)
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
  statut character varying(2) NOT NULL, -- code du statut
  statut_lib character varying(30), -- Libellé du statut
  CONSTRAINT lt_pav_statut_pkkey PRIMARY KEY (statut) -- Clé primaire de la table lt_pav_statut
)
WITH (
  OIDS=FALSE
);

COMMENT ON TABLE m_dechet.lt_pav_statut
  IS 'Liste de valeurs des codes du statut du PAV';
COMMENT ON COLUMN m_dechet.lt_pav_statut.statut IS 'code du statut';
COMMENT ON COLUMN m_dechet.lt_pav_statut.statut_lib IS 'Libellé du statut';

COMMENT ON CONSTRAINT lt_pav_statut_pkkey ON m_dechet.lt_pav_statut IS 'Clé primaire de la table lt_pav_statut';

INSERT INTO m_dechet.lt_pav_statut(
            statut, statut_lib)
    VALUES
    ('00','Non renseigné'),
    ('10','Actif'),
    ('20','Inactif (projet, existe plus)');
    
-- ################################################################# Domaine valeur - lt_pav_typesign  ###############################################

-- Table: m_dechet.lt_pav_typesign

-- DROP TABLE m_dechet.lt_pav_typesign;

CREATE TABLE m_dechet.lt_pav_typesign
(
  type_sign character varying(2) NOT NULL, -- code du type de signalétique
  type_sign_lib character varying(30), -- Libellé du type de signalétique
  CONSTRAINT lt_pav_typesign_pkkey PRIMARY KEY (type_sign) -- Clé primaire de la table lt_pav_typesign
)
WITH (
  OIDS=FALSE
);

COMMENT ON TABLE m_dechet.lt_pav_typesign
  IS 'Liste de valeurs des codes du type de signalétique';
COMMENT ON COLUMN m_dechet.lt_pav_typesign.type_sign IS 'code du type de signalétique';
COMMENT ON COLUMN m_dechet.lt_pav_typesign.type_sign_lib IS 'Libellé du type de signalétique';

COMMENT ON CONSTRAINT lt_pav_typesign_pkkey ON m_dechet.lt_pav_typesign IS 'Clé primaire de la table lt_pav_typesign';

INSERT INTO m_dechet.lt_pav_typesign(
            type_sign, type_sign_lib)
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
  type_sol character varying(2) NOT NULL, -- code du type de sol
  type_sol_lib character varying(30), -- Libellé du type de sol
  CONSTRAINT lt_pav_typesol_pkkey PRIMARY KEY (type_sol) -- Clé primaire de la table lt_pav_typesol
)
WITH (
  OIDS=FALSE
);

COMMENT ON TABLE m_dechet.lt_pav_typesol
  IS 'Liste de valeurs des code de l''état de la peinture';
COMMENT ON COLUMN m_dechet.lt_pav_typesol.type_sol IS 'code du type de sol';
COMMENT ON COLUMN m_dechet.lt_pav_typesol.type_sol_lib IS 'Libellé du type de sol';

COMMENT ON CONSTRAINT lt_pav_typesol_pkkey ON m_dechet.lt_pav_typesol IS 'Clé primaire de la table lt_pav_typesol';

INSERT INTO m_dechet.lt_pav_typesol(
            type_sol, type_sol_lib)
    VALUES
    ('00','Non renseigné'),
    ('10','Dalle'),
    ('20','Bitume'),
    ('30','Terre'),
    ('99','Autre');

-- ####################################################################################################################################################
-- ###                                                                                                                                              ###
-- ###                                                                TABLE                                                           ###
-- ###                                                                                                                                              ###
-- ####################################################################################################################################################

-- Table: m_dechet.geo_dec_pav_verre

-- DROP TABLE m_dechet.geo_dec_pav_verre;

CREATE TABLE m_dechet.geo_dec_pav_verre
(
  id_contver integer NOT NULL DEFAULT nextval('m_dechet.geo_dec_pav_idconv_seq'::regclass), -- Identifiant unique géographique
  commune character varying(30), -- libellé de la commune
  insee character(5), -- numéro insee de la commune
  quartier character varying(50), -- libellé du quartier
  adresse character varying(80), -- adresse d'implantation
  x_l93 double precision, -- coordonnée x en lambert 93
  y_l93 double precision, -- coordonnée y en lambert 93
  cont_nbr integer, -- nombre de conteneurs
  cont_mat character varying(2) DEFAULT '10'::character varying, -- code du matériaux constituant le conteneur (liste de choix lt_pav_contmat)
  cont_pos character varying(2) DEFAULT '10'::character varying, -- code du type de position du conteneur (liste de choix lt_pav_contpos)
  date_sai timestamp without time zone, -- date de saisie de l'information
  date_pos timestamp without time zone, -- date de pose
  date_net timestamp without time zone, -- date de nettoyage
  date_maj timestamp without time zone, -- date de mise à jour des informations
  photo character varying(254), -- Nom du fichier de la photo avant la mise à jour de juillet 2016 par le BE RETIF
  url_photo character varying(254), -- Lien url vers la photo avant la mise à jour de juillet 2016 par le BE RETIF
  src_geom character(2) DEFAULT '00'::bpchar, -- code du référentiel spatial de saisie utilisé (liste de choix r_objet.lt_src_geom)
  volume double precision, -- volume en m3 (par défaut 4)
  env_type character varying(2) DEFAULT '00'::character varying, -- code du type d'espace géographique (liste de choix lt_pav_envtype)
  env_implan character varying(2) DEFAULT '00'::character varying, -- code du type d'espace urbain d'implantation (liste de choix lt_pav_envimplan)
  env_situ character varying(2) DEFAULT '00'::character varying, -- code de la situation domaniale (liste de choix lt_pav_envsitu)
  mode_preh character varying(2) DEFAULT '10'::character varying, -- code du mode de préhension (liste de choix lt_pav_modepreh)
  crochet character varying(2) DEFAULT '00'::character varying, -- code de l'état du crochet (liste de choix lt_pav_crochet)
  opercules boolean, -- Bavettes sur opercules disponibles
  tags boolean, -- présence de tags
  peinture character varying(2) DEFAULT '00'::character varying, -- code de l'état de la peinture (liste de choix lt_pav_peinture)
  prox_corb boolean, -- présence d'une corbeille à proximité
  type_sol character varying(2) DEFAULT '00'::character varying, -- code du type de sol (liste de choix (lt_pav_typesol)
  trp_rest boolean, -- présence d'une trappe pour restaurateur
  etat_sign character varying(30), -- état de la signalétique (création d'une liste de valeur en fonction de l'état des lieux)
  type_sign character varying(2) DEFAULT '00'::character varying, -- code du type de signalétique (liste de choix lt_pav_typesign)
  proprete character varying(2) DEFAULT '00'::character varying, -- code de l'état de la propreté (liste de choix lt_pav_proprete)
  prop_abor character varying(2) DEFAULT '00'::character varying, -- code de l'état de la propreté des abords (liste de choix lt_pav_propabor)
  def_struc character varying(30), -- défaut de structure visible
  hab_pav integer, -- Tonnage par gisement d'habitants
  opt_pav integer, -- nombre de PAV manquant ou excédents par rapport aux préconisation éco-emballages
  ame_acces boolean, -- accéssibilité à revoir
  nat_pb character varying(2) DEFAULT '00'::character varying, -- code de la nature du ou des problèmes (liste de choix lt_pav_natpb)
  nat_pb_99 character varying(500), -- précision sur la nature du problème
  geom geometry(Point,2154), -- champ contenant la géométrie de l'objet
  op_sai character varying(80), -- Opérateur de saisie de la donnée
  observ character varying(500), -- Observations diverses
  pavorient character varying(2), -- code des préconisations pour l'amélioration dee emplacements des PAV Verre (suite à l'état des lieux de l'été 2016
  id_parent integer, -- identifiant du PAV Verre parent selon les préconisations
  statut character varying(2), -- code du statut du PAV (actif ou inactif)
  v_tampon integer, -- Valeur du tampon correspondant à l'aire de captation du point de ramassage
  geom2 geometry(Polygon,2154), -- Champ contenant la géométrie du tampon d'emprise définit par v_tampon où modifier selon l'influence
  date_effet timestamp without time zone DEFAULT now(), -- Date de prise en compte des données dans le plan interactif Grand Public
  CONSTRAINT geo_dec_pav_verre_prkey PRIMARY KEY (id_contver),
  CONSTRAINT geo_dec_pav_verre_contmat_fkey FOREIGN KEY (cont_mat)
      REFERENCES m_dechet.lt_pav_contmat (cont_mat) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT geo_dec_pav_verre_contpos_fkey FOREIGN KEY (cont_pos)
      REFERENCES m_dechet.lt_pav_contpos (cont_pos) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT geo_dec_pav_verre_crochet_fkey FOREIGN KEY (crochet)
      REFERENCES m_dechet.lt_pav_crochet (crochet) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT geo_dec_pav_verre_envimplan_fkey FOREIGN KEY (env_implan)
      REFERENCES m_dechet.lt_pav_envimplan (env_implan) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT geo_dec_pav_verre_envsitu_fkey FOREIGN KEY (env_situ)
      REFERENCES m_dechet.lt_pav_envsitu (env_situ) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT geo_dec_pav_verre_envtype_fkey FOREIGN KEY (env_type)
      REFERENCES m_dechet.lt_pav_envtype (env_type) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT geo_dec_pav_verre_etatsign_fkey FOREIGN KEY (etat_sign)
      REFERENCES m_dechet.lt_pav_etatsign (etat_sign) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT geo_dec_pav_verre_modepreh_fkey FOREIGN KEY (mode_preh)
      REFERENCES m_dechet.lt_pav_modepreh (mode_preh) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT geo_dec_pav_verre_natpb_fkey FOREIGN KEY (nat_pb)
      REFERENCES m_dechet.lt_pav_natpb (nat_pb) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT geo_dec_pav_verre_peinture_fkey FOREIGN KEY (peinture)
      REFERENCES m_dechet.lt_pav_peinture (peinture) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT geo_dec_pav_verre_propabord_fkey FOREIGN KEY (proprete)
      REFERENCES m_dechet.lt_pav_proprete (proprete) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT geo_dec_pav_verre_proprete_fkey FOREIGN KEY (proprete)
      REFERENCES m_dechet.lt_pav_proprete (proprete) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT geo_dec_pav_verre_srcgeom_fkey FOREIGN KEY (src_geom)
      REFERENCES r_objet.lt_src_geom (code) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT geo_dec_pav_verre_statut_fkey FOREIGN KEY (statut)
      REFERENCES m_dechet.lt_pav_statut (statut) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT geo_dec_pav_verre_typesign_fkey FOREIGN KEY (type_sign)
      REFERENCES m_dechet.lt_pav_typesign (type_sign) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT geo_dec_pav_verre_typesol_fkey FOREIGN KEY (type_sol)
      REFERENCES m_dechet.lt_pav_typesol (type_sol) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);

COMMENT ON TABLE m_dechet.geo_dec_pav_verre
  IS 'Localisation des points d''apport volontaire verre - version 2 : nouveau modèle suite à la mise à jour de juillet 2016 - cette table remplacera la table "geo_dec_pav_verre" à la fin de la mise à jour (modifier la structure de la table dans Geo et intégrer les listes de choix)';
COMMENT ON COLUMN m_dechet.geo_dec_pav_verre.id_contver IS 'Identifiant unique géographique';
COMMENT ON COLUMN m_dechet.geo_dec_pav_verre.commune IS 'libellé de la commune';
COMMENT ON COLUMN m_dechet.geo_dec_pav_verre.insee IS 'numéro insee de la commune';
COMMENT ON COLUMN m_dechet.geo_dec_pav_verre.quartier IS 'libellé du quartier';
COMMENT ON COLUMN m_dechet.geo_dec_pav_verre.adresse IS 'adresse d''implantation';
COMMENT ON COLUMN m_dechet.geo_dec_pav_verre.x_l93 IS 'coordonnée x en lambert 93';
COMMENT ON COLUMN m_dechet.geo_dec_pav_verre.y_l93 IS 'coordonnée y en lambert 93';
COMMENT ON COLUMN m_dechet.geo_dec_pav_verre.cont_nbr IS 'nombre de conteneurs';
COMMENT ON COLUMN m_dechet.geo_dec_pav_verre.cont_mat IS 'code du matériaux constituant le conteneur (liste de choix lt_pav_contmat)';
COMMENT ON COLUMN m_dechet.geo_dec_pav_verre.cont_pos IS 'code du type de position du conteneur (liste de choix lt_pav_contpos)';
COMMENT ON COLUMN m_dechet.geo_dec_pav_verre.date_sai IS 'date de saisie de l''information';
COMMENT ON COLUMN m_dechet.geo_dec_pav_verre.date_pos IS 'date de pose';
COMMENT ON COLUMN m_dechet.geo_dec_pav_verre.date_net IS 'date de nettoyage';
COMMENT ON COLUMN m_dechet.geo_dec_pav_verre.date_maj IS 'date de mise à jour des informations';
COMMENT ON COLUMN m_dechet.geo_dec_pav_verre.photo IS 'Nom du fichier de la photo avant la mise à jour de juillet 2016 par le BE RETIF';
COMMENT ON COLUMN m_dechet.geo_dec_pav_verre.url_photo IS 'Lien url vers la photo avant la mise à jour de juillet 2016 par le BE RETIF';
COMMENT ON COLUMN m_dechet.geo_dec_pav_verre.src_geom IS 'code du référentiel spatial de saisie utilisé (liste de choix r_objet.lt_src_geom)';
COMMENT ON COLUMN m_dechet.geo_dec_pav_verre.volume IS 'volume en m3 (par défaut 4)';
COMMENT ON COLUMN m_dechet.geo_dec_pav_verre.env_type IS 'code du type d''espace géographique (liste de choix lt_pav_envtype)';
COMMENT ON COLUMN m_dechet.geo_dec_pav_verre.env_implan IS 'code du type d''espace urbain d''implantation (liste de choix lt_pav_envimplan)';
COMMENT ON COLUMN m_dechet.geo_dec_pav_verre.env_situ IS 'code de la situation domaniale (liste de choix lt_pav_envsitu)';
COMMENT ON COLUMN m_dechet.geo_dec_pav_verre.mode_preh IS 'code du mode de préhension (liste de choix lt_pav_modepreh)';
COMMENT ON COLUMN m_dechet.geo_dec_pav_verre.crochet IS 'code de l''état du crochet (liste de choix lt_pav_crochet)';
COMMENT ON COLUMN m_dechet.geo_dec_pav_verre.opercules IS 'Bavettes sur opercules disponibles';
COMMENT ON COLUMN m_dechet.geo_dec_pav_verre.tags IS 'présence de tags';
COMMENT ON COLUMN m_dechet.geo_dec_pav_verre.peinture IS 'code de l''état de la peinture (liste de choix lt_pav_peinture)';
COMMENT ON COLUMN m_dechet.geo_dec_pav_verre.prox_corb IS 'présence d''une corbeille à proximité';
COMMENT ON COLUMN m_dechet.geo_dec_pav_verre.type_sol IS 'code du type de sol (liste de choix (lt_pav_typesol)';
COMMENT ON COLUMN m_dechet.geo_dec_pav_verre.trp_rest IS 'présence d''une trappe pour restaurateur';
COMMENT ON COLUMN m_dechet.geo_dec_pav_verre.etat_sign IS 'état de la signalétique (création d''une liste de valeur en fonction de l''état des lieux)';
COMMENT ON COLUMN m_dechet.geo_dec_pav_verre.type_sign IS 'code du type de signalétique (liste de choix lt_pav_typesign)';
COMMENT ON COLUMN m_dechet.geo_dec_pav_verre.proprete IS 'code de l''état de la propreté (liste de choix lt_pav_proprete)';
COMMENT ON COLUMN m_dechet.geo_dec_pav_verre.prop_abor IS 'code de l''état de la propreté des abords (liste de choix lt_pav_propabor)';
COMMENT ON COLUMN m_dechet.geo_dec_pav_verre.def_struc IS 'défaut de structure visible';
COMMENT ON COLUMN m_dechet.geo_dec_pav_verre.hab_pav IS 'Tonnage par gisement d''habitants';
COMMENT ON COLUMN m_dechet.geo_dec_pav_verre.opt_pav IS 'nombre de PAV manquant ou excédents par rapport aux préconisation éco-emballages';
COMMENT ON COLUMN m_dechet.geo_dec_pav_verre.ame_acces IS 'accéssibilité à revoir';
COMMENT ON COLUMN m_dechet.geo_dec_pav_verre.nat_pb IS 'code de la nature du ou des problèmes (liste de choix lt_pav_natpb)';
COMMENT ON COLUMN m_dechet.geo_dec_pav_verre.nat_pb_99 IS 'précision sur la nature du problème';
COMMENT ON COLUMN m_dechet.geo_dec_pav_verre.geom IS 'champ contenant la géométrie de l''objet';
COMMENT ON COLUMN m_dechet.geo_dec_pav_verre.op_sai IS 'Opérateur de saisie de la donnée';
COMMENT ON COLUMN m_dechet.geo_dec_pav_verre.observ IS 'Observations diverses';
COMMENT ON COLUMN m_dechet.geo_dec_pav_verre.pavorient IS 'code des préconisations pour l''amélioration dee emplacements des PAV Verre (suite à l''état des lieux de l''été 2016';
COMMENT ON COLUMN m_dechet.geo_dec_pav_verre.id_parent IS 'identifiant du PAV Verre parent selon les préconisations';
COMMENT ON COLUMN m_dechet.geo_dec_pav_verre.statut IS 'code du statut du PAV (actif ou inactif)';
COMMENT ON COLUMN m_dechet.geo_dec_pav_verre.v_tampon IS 'Valeur du tampon correspondant à l''aire de captation du point de ramassage';
COMMENT ON COLUMN m_dechet.geo_dec_pav_verre.geom2 IS 'Champ contenant la géométrie du tampon d''emprise définit par v_tampon où modifier selon l''influence';
COMMENT ON COLUMN m_dechet.geo_dec_pav_verre.date_effet IS 'Date de prise en compte des données dans le plan interactif Grand Public';


  
-- ####################################################################################################################################################
-- ###                                                                                                                                              ###
-- ###                                                                INDEX                                                           ###
-- ###                                                                                                                                              ###
-- ####################################################################################################################################################

-- Index: m_dechet.geo_dec_pav_verre_etat_sign_idx

-- DROP INDEX m_dechet.geo_dec_pav_verre_etat_sign_idx;

CREATE INDEX geo_dec_pav_verre_etat_sign_idx
  ON m_dechet.geo_dec_pav_verre
  USING btree
  (etat_sign COLLATE pg_catalog."default");

-- Index: m_dechet.geo_dec_pav_verre_geom_idx

-- DROP INDEX m_dechet.geo_dec_pav_verre_geom_idx;

CREATE INDEX geo_dec_pav_verre_geom_idx
  ON m_dechet.geo_dec_pav_verre
  USING gist
  (geom);

-- Index: m_dechet.geo_dec_pav_verre_pavorient_idx

-- DROP INDEX m_dechet.geo_dec_pav_verre_pavorient_idx;

CREATE INDEX geo_dec_pav_verre_pavorient_idx
  ON m_dechet.geo_dec_pav_verre
  USING btree
  (pavorient COLLATE pg_catalog."default");

-- Index: m_dechet.geo_dec_pav_verre_statut_idx

-- DROP INDEX m_dechet.geo_dec_pav_verre_statut_idx;

CREATE INDEX geo_dec_pav_verre_statut_idx
  ON m_dechet.geo_dec_pav_verre
  USING btree
  (statut COLLATE pg_catalog."default");
  
-- ####################################################################################################################################################
-- ###                                                                                                                                              ###
-- ###                                                                TRIGGERS                                                           ###
-- ###                                                                                                                                              ###
-- ####################################################################################################################################################

-- Trigger: t_t1_geo_dec_pav_verre_datemaj on m_dechet.geo_dec_pav_verre

-- DROP TRIGGER t_t1_geo_dec_pav_verre_datemaj ON m_dechet.geo_dec_pav_verre;

CREATE TRIGGER t_t1_geo_dec_pav_verre_datemaj
  BEFORE INSERT OR UPDATE
  ON m_dechet.geo_dec_pav_verre
  FOR EACH ROW
  EXECUTE PROCEDURE public.r_timestamp_maj();

-- Trigger: t_t2_geo_dec_pav_verre_datesai on m_dechet.geo_dec_pav_verre

-- DROP TRIGGER t_t2_geo_dec_pav_verre_datesai ON m_dechet.geo_dec_pav_verre;

CREATE TRIGGER t_t2_geo_dec_pav_verre_datesai
  BEFORE INSERT
  ON m_dechet.geo_dec_pav_verre
  FOR EACH ROW
  EXECUTE PROCEDURE public.r_timestamp_sai();

-- Trigger: t_t3_geo_dec_pav_verre_insee on m_dechet.geo_dec_pav_verre

-- DROP TRIGGER t_t3_geo_dec_pav_verre_insee ON m_dechet.geo_dec_pav_verre;

CREATE TRIGGER t_t3_geo_dec_pav_verre_insee
  BEFORE INSERT OR UPDATE OF geom
  ON m_dechet.geo_dec_pav_verre
  FOR EACH ROW
  EXECUTE PROCEDURE public.r_commune_pl();

-- Trigger: t_t4_geo_dec_pav_verre_quartier on m_dechet.geo_dec_pav_verre

-- DROP TRIGGER t_t4_geo_dec_pav_verre_quartier ON m_dechet.geo_dec_pav_verre;

CREATE TRIGGER t_t4_geo_dec_pav_verre_quartier
  BEFORE INSERT OR UPDATE OF geom
  ON m_dechet.geo_dec_pav_verre
  FOR EACH ROW
  EXECUTE PROCEDURE public.r_quartier();

-- Trigger: t_t5_geo_dec_pav_verre_xy on m_dechet.geo_dec_pav_verre

-- DROP TRIGGER t_t5_geo_dec_pav_verre_xy ON m_dechet.geo_dec_pav_verre;

CREATE TRIGGER t_t5_geo_dec_pav_verre_xy
  BEFORE INSERT OR UPDATE OF geom
  ON m_dechet.geo_dec_pav_verre
  FOR EACH ROW
  EXECUTE PROCEDURE public.r_xy_l93();

-- Function: m_dechet.m_tampon_nav()

-- DROP FUNCTION m_dechet.m_tampon_nav();

CREATE OR REPLACE FUNCTION m_dechet.m_tampon_nav()
  RETURNS trigger AS
$BODY$

BEGIN

update m_dechet.geo_dec_pav_verre set geom2 = st_buffer(geom,new.v_tampon) where id_contver=new.id_contver;

return new;

END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

COMMENT ON FUNCTION m_dechet.m_tampon_nav() IS 'Fonction trigger pour mise à jour du tampon d''emprise du PAV VERRE si v_tampon est modifiée';

-- Trigger: t_t6_geo_dec_pav_verre_tampon on m_dechet.geo_dec_pav_verre

-- DROP TRIGGER t_t6_geo_dec_pav_verre_tampon ON m_dechet.geo_dec_pav_verre;

CREATE TRIGGER t_t6_geo_dec_pav_verre_tampon
  AFTER UPDATE OF geom, v_tampon
  ON m_dechet.geo_dec_pav_verre
  FOR EACH ROW
  EXECUTE PROCEDURE m_dechet.m_tampon_nav();


-- Function: m_dechet.m_log_dec_pav()

-- DROP FUNCTION m_dechet.m_log_dec_pav();

CREATE OR REPLACE FUNCTION m_dechet.m_log_dec_pav()
  RETURNS trigger AS
$BODY$
begin
		--ajoute une ligne dans la table suivi des modifications pour refléter l'operation réalisée sur les tables
		--utilise la variable spéciale TG_OP pour cette opération
		--
		      
		IF (TG_OP='INSERT') then			
			if (TG_TABLE_NAME='geo_dec_pav_verre') then
				insert into m_dechet.log_dec_pav select nextval('m_dechet.log_dec_pav_gid_seq'::regclass), 'INSERT',now(),user,TG_Relid,TG_TABLE_SCHEMA,TG_TABLE_NAME,new.id_contver;
			end if;

			if (TG_TABLE_NAME='geo_dec_pav_tlc') then
				insert into m_dechet.log_dec_pav select nextval('m_dechet.log_dec_pav_gid_seq'::regclass), 'INSERT',now(),user,TG_Relid,TG_TABLE_SCHEMA,TG_TABLE_NAME,new.id_cont_tl;
			end if;
                 elsif (TG_OP='UPDATE') then
			if (TG_TABLE_NAME='geo_dec_pav_verre') then
				insert into m_dechet.log_dec_pav select nextval('m_dechet.log_dec_pav_gid_seq'::regclass),'UPDATE',now(),user,TG_Relid,TG_TABLE_SCHEMA,TG_TABLE_NAME,old.id_contver;
 				
			END IF;
			if (TG_TABLE_NAME='geo_dec_pav_tlc') then
				insert into m_dechet.log_dec_pav select nextval('m_dechet.log_dec_pav_gid_seq'::regclass),'UPDATE',now(),user,TG_Relid,TG_TABLE_SCHEMA,TG_TABLE_NAME,old.id_cont_tl;
 				
			END IF;
			
                elsif (TG_OP='DELETE') then
	      
                        if (TG_TABLE_NAME='geo_dec_pav_verre') then
				insert into m_dechet.log_dec_pav select nextval('m_dechet.log_dec_pav_gid_seq'::regclass),'DELETE',now(),user,TG_Relid,TG_TABLE_SCHEMA,TG_TABLE_NAME,old.id_contver,
				CASE WHEN old.commune is null THEN '' ELSE 'commune:' || old.commune END || ';' || 
				CASE WHEN old.insee is null THEN '' ELSE 'insee:' || old.insee END || ';' || 
				CASE WHEN old.quartier is null THEN '' ELSE 'quartier:' || old.quartier END || ';' || 
				CASE WHEN old.adresse is null THEN '' ELSE 'adresse:' || old.adresse END || ';' || 
				CASE WHEN old.cont_nbr is null THEN '' ELSE 'cont_nbr:' || old.cont_nbr END || ';' ||
				CASE WHEN old.cont_mat is null THEN '' ELSE 'cont_mat:' || old.cont_mat END || ';' || 
				CASE WHEN old.cont_pos is null THEN '' ELSE 'cont_pos:' || old.cont_pos END || ';' || 
				CASE WHEN old.date_pos is null THEN '' ELSE 'date_pos:' || old.date_pos END || ';' || 
				CASE WHEN old.date_net is null THEN '' ELSE 'date_net:' || old.date_net END || ';' || 
				CASE WHEN old.photo is null THEN '' ELSE 'photo:' || old.photo END || ';' ||
				CASE WHEN old.url_photo is null THEN '' ELSE 'url_photo:' || old.url_photo END|| ';' || 
				CASE WHEN old.volume is null THEN '' ELSE 'volume:' || old.volume END || ';' || 
				CASE WHEN old.env_type is null THEN '' ELSE 'env_type:' || old.env_type END || ';' || 
				CASE WHEN old.env_implan is null THEN '' ELSE 'env_implan:' || old.env_implan END || ';' || 
				CASE WHEN old.env_situ is null THEN '' ELSE 'env_situ:' || old.env_situ END || ';' ||
				CASE WHEN old.mode_preh is null THEN '' ELSE 'mode_preh:' || old.mode_preh END || ';' || 
				CASE WHEN old.crochet is null THEN '' ELSE 'crochet:' || old.crochet END || ';' || 
				CASE WHEN old.opercules is null THEN '' ELSE 'opercules:' || old.opercules END || ';' || 
				CASE WHEN old.tags is null THEN '' ELSE 'tags:' || old.tags END || ';' || 
				CASE WHEN old.peinture is null THEN '' ELSE 'peinture:' || old.peinture END || ';' ||
				CASE WHEN old.prox_corb is null THEN '' ELSE 'prox_corb:' || old.prox_corb END || ';' || 
				CASE WHEN old.type_sol is null THEN '' ELSE 'type_sol:' || old.type_sol END || ';' || 
				CASE WHEN old.trp_rest is null THEN '' ELSE 'trp_rest:' || old.trp_rest END || ';' || 
				CASE WHEN old.etat_sign is null THEN '' ELSE 'etat_sign:' || old.etat_sign END || ';' || 
				CASE WHEN old.type_sign is null THEN '' ELSE 'type_sign:' || old.type_sign END || ';' ||
				CASE WHEN old.proprete is null THEN '' ELSE 'proprete:' || old.proprete END || ';' || 
				CASE WHEN old.prop_abor is null THEN '' ELSE 'prop_abor:' || old.prop_abor END || ';' || 
				CASE WHEN old.def_struc is null THEN '' ELSE 'def_struc:' || old.def_struc END || ';' || 
				CASE WHEN old.hab_pav is null THEN '' ELSE 'hab_pav:' || old.hab_pav END || ';' || 
				CASE WHEN old.opt_pav is null THEN '' ELSE 'opt_pav:' || old.opt_pav END || ';' ||
				CASE WHEN old.ame_acces is null THEN '' ELSE 'ame_acces:' || old.ame_acces END || ';' || 
				CASE WHEN old.nat_pb is null THEN '' ELSE 'nat_pb:' || old.nat_pb END || ';' || 
				CASE WHEN old.nat_pb_99 is null THEN '' ELSE 'nat_pb_99:' || old.nat_pb_99 END || ';' || 
				CASE WHEN old.op_sai is null THEN '' ELSE 'op_sai:' || old.op_sai END || ';' || 
				CASE WHEN old.observ is null THEN '' ELSE 'observ:' || old.observ END || ';' ||
				CASE WHEN old.pavorient is null THEN '' ELSE 'pavorient:' || old.pavorient END || ';' || 
				CASE WHEN old.id_parent is null THEN '' ELSE 'id_parent:' || old.id_parent END || ';' || 
				CASE WHEN old.statut is null THEN '' ELSE 'statut:' || old.statut END || ';' || 
				CASE WHEN old.date_effet is null THEN '' ELSE 'date_effet:' || old.date_effet END
				;
				return old;
			end if;

			 if (TG_TABLE_NAME='geo_dec_pav_tlc') then
				insert into m_dechet.log_dec_pav select nextval('m_dechet.log_dec_pav_gid_seq'::regclass),'DELETE',now(),user,TG_Relid,TG_TABLE_SCHEMA,TG_TABLE_NAME,old.id_cont_tl,
				CASE WHEN old.commune is null THEN '' ELSE 'commune:' || old.commune END || ';' || 
				CASE WHEN old.insee is null THEN '' ELSE 'insee:' || old.insee END || ';' || 
				CASE WHEN old.quartier is null THEN '' ELSE 'quartier:' || old.quartier END || ';' || 
				CASE WHEN old.adresse is null THEN '' ELSE 'adresse:' || old.adresse END || ';' || 
 				CASE WHEN old.cont_nbr is null THEN '' ELSE 'cont_nbr:' || old.cont_nbr END || ';' ||
 				CASE WHEN old.cont_mat is null THEN '' ELSE 'cont_mat:' || old.cont_mat END || ';' || 
				CASE WHEN old.cont_pos is null THEN '' ELSE 'cont_pos:' || old.cont_pos END || ';' || 
				CASE WHEN old.date_pose is null THEN '' ELSE 'date_pose:' || old.date_pose END || ';' || 
				CASE WHEN old.date_netoy is null THEN '' ELSE 'date_netoy:' || old.date_netoy END || ';' || 
				CASE WHEN old.photo is null THEN '' ELSE 'photo:' || old.photo END || ';' ||
				CASE WHEN old.url_photo is null THEN '' ELSE 'url_photo:' || old.url_photo END || ';' || 
				CASE WHEN old.nom_entrep is null THEN '' ELSE 'nom_entrep:' || old.nom_entrep END || ';' || 
				CASE WHEN old.env_type is null THEN '' ELSE 'env_type:' || old.env_type END || ';' || 
				CASE WHEN old.env_implan is null THEN '' ELSE 'env_implan:' || old.env_implan END || ';' || 
				CASE WHEN old.env_situ is null THEN '' ELSE 'env_situ:' || old.env_situ END || ';' ||
				CASE WHEN old.nom_entrep_99 is null THEN '' ELSE 'nom_entrep_99:' || old.nom_entrep_99 END || ';' || 
				CASE WHEN old.tags is null THEN '' ELSE 'tags:' || old.tags END || ';' || 
				CASE WHEN old.peinture is null THEN '' ELSE 'peinture:' || old.peinture END || ';' ||
				CASE WHEN old.prox_corb is null THEN '' ELSE 'prox_corb:' || old.prox_corb END || ';' || 
				CASE WHEN old.type_sol is null THEN '' ELSE 'type_sol:' || old.type_sol END || ';' || 
				CASE WHEN old.type_sol_99 is null THEN '' ELSE 'type_sol_99:' || old.type_sol_99 END || ';' || 
				CASE WHEN old.op_sai is null THEN '' ELSE 'op_sai:' || old.op_sai END || ';' || 
				CASE WHEN old.observ is null THEN '' ELSE 'observ:' || old.observ END || ';' ||
				CASE WHEN old.date_effet is null THEN '' ELSE 'date_effet:' || old.date_effet END
				;
				return old;
			end if;
		end if;

		return null; -- le résultat est ignoré car il s'agit d'un déclencheur AFTER
	end;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;



-- Trigger: t_t7_geo_dec_pav_verre_log on m_dechet.geo_dec_pav_verre

-- DROP TRIGGER t_t7_geo_dec_pav_verre_log ON m_dechet.geo_dec_pav_verre;

CREATE TRIGGER t_t7_geo_dec_pav_verre_log
  AFTER INSERT OR UPDATE OR DELETE
  ON m_dechet.geo_dec_pav_verre
  FOR EACH ROW
  EXECUTE PROCEDURE m_dechet.m_log_dec_pav();
