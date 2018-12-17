/*TRI SELECTIF V1.0*/
/*Creation du squelette de la structure des données */
/* tri_10_squelette.sql */
/*PostGIS*/

/* Propriétaire : GeoCompiegnois - http://geo.compiegnois.fr/ */
/* Auteur : Grégory Bodet */


-- #################################################################### SCHEMA  ####################################################################

/*
-- Schema: m_dechet

-- DROP SCHEMA m_dechet;

CREATE SCHEMA m_dechet
  AUTHORIZATION sig_create;
  
COMMENT ON SCHEMA m_dechet
  IS 'Données métiers sur le thème des déchets et du recyclage';
  
*/

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
