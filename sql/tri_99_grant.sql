/*TRI SELECTIF V1.0*/
/*Creation des droits sur l'ensemble des objets */
/* tri_99_grant.sql */
/*PostGIS*/

/* Propriétaire : GeoCompiegnois - http://geo.compiegnois.fr/ */
/* Auteur : Grégory Bodet */



-- ####################################################################################################################################################
-- ###                                                                                                                                              ###
-- ###                                                                        GRANT                                                                  ###
-- ###                                                                                                                                              ###
-- ####################################################################################################################################################



-- #################################################################### SCHEMA  ####################################################################

GRANT ALL ON SCHEMA m_dechet TO sig_create;
GRANT ALL ON SCHEMA m_dechet TO create_sig;
GRANT USAGE ON SCHEMA m_dechet TO read_sig;
GRANT USAGE ON SCHEMA m_dechet TO edit_sig;


ALTER DEFAULT PRIVILEGES IN SCHEMA m_dechet
    GRANT INSERT, SELECT, UPDATE, DELETE, TRUNCATE, REFERENCES, TRIGGER ON TABLES
    TO create_sig;

ALTER DEFAULT PRIVILEGES IN SCHEMA m_dechet
    GRANT INSERT, SELECT, UPDATE, DELETE ON TABLES
    TO edit_sig;

ALTER DEFAULT PRIVILEGES IN SCHEMA m_dechet
    GRANT SELECT ON TABLES
    TO read_sig;

-- #################################################################### DOMAINE DE VALEUR  ####################################################################






-- #################################################################### SEQUENCE  ####################################################################

ALTER TABLE m_dechet.an_dec_pav_doc_media_gid_seq
  OWNER TO sig_create;
GRANT ALL ON SEQUENCE m_dechet.an_dec_pav_doc_media_gid_seq TO sig_create;
GRANT ALL ON SEQUENCE m_dechet.an_dec_pav_doc_media_gid_seq TO public;
GRANT ALL ON SEQUENCE m_dechet.an_dec_pav_doc_media_gid_seq TO create_sig;

ALTER TABLE m_dechet.geo_dec_dechetterie_gid_seq
  OWNER TO sig_create;
GRANT ALL ON SEQUENCE m_dechet.geo_dec_dechetterie_gid_seq TO sig_create;
GRANT ALL ON SEQUENCE m_dechet.geo_dec_dechetterie_gid_seq TO public;
GRANT ALL ON SEQUENCE m_dechet.geo_dec_dechetterie_gid_seq TO create_sig;

ALTER TABLE m_dechet.geo_dec_pav_idconv_seq
  OWNER TO sig_create;
GRANT ALL ON SEQUENCE m_dechet.geo_dec_pav_idconv_seq TO sig_create;
GRANT ALL ON SEQUENCE m_dechet.geo_dec_pav_idconv_seq TO public;
GRANT ALL ON SEQUENCE m_dechet.geo_dec_pav_idconv_seq TO create_sig;

ALTER TABLE m_dechet.geo_dec_secteur_enc_seq
  OWNER TO sig_create;
GRANT ALL ON SEQUENCE m_dechet.geo_dec_secteur_enc_seq TO sig_create;
GRANT ALL ON SEQUENCE m_dechet.geo_dec_secteur_enc_seq TO public;
GRANT ALL ON SEQUENCE m_dechet.geo_dec_secteur_enc_seq TO create_sig;

ALTER TABLE m_dechet.geo_dec_secteur_om_seq
  OWNER TO sig_create;
GRANT ALL ON SEQUENCE m_dechet.geo_dec_secteur_om_seq TO sig_create;
GRANT ALL ON SEQUENCE m_dechet.geo_dec_secteur_om_seq TO public;
GRANT ALL ON SEQUENCE m_dechet.geo_dec_secteur_om_seq TO create_sig;

ALTER TABLE m_dechet.log_dec_pav_gid_seq
  OWNER TO sig_create;
GRANT ALL ON SEQUENCE m_dechet.log_dec_pav_gid_seq TO sig_create;
GRANT ALL ON SEQUENCE m_dechet.log_dec_pav_gid_seq TO public;
GRANT ALL ON SEQUENCE m_dechet.log_dec_pav_gid_seq TO create_sig;




-- #################################################################### TABLE  ####################################################################



-- #################################################################### VUE DE GESTION  ####################################################################




-- #################################################################### VUE APPLICATIVE  ####################################################################



-- #################################################################### VUE OPENDATA  ####################################################################




-- #################################################################### FUNCTION TRIGGER  ####################################################################




