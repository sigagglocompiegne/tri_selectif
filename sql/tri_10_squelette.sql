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

