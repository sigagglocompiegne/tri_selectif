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

ALTER TABLE m_dechet.lt_pav_contmat
  OWNER TO sig_create;
GRANT ALL ON TABLE m_dechet.lt_pav_contmat TO sig_create;
GRANT ALL ON TABLE m_dechet.lt_pav_contmat TO create_sig;
GRANT SELECT ON TABLE m_dechet.lt_pav_contmat TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_dechet.lt_pav_contmat TO edit_sig;

ALTER TABLE m_dechet.lt_pav_contpos
  OWNER TO sig_create;
GRANT ALL ON TABLE m_dechet.lt_pav_contpos TO sig_create;
GRANT ALL ON TABLE m_dechet.lt_pav_contpos TO create_sig;
GRANT SELECT ON TABLE m_dechet.lt_pav_contpos TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_dechet.lt_pav_contpos TO edit_sig;


ALTER TABLE m_dechet.lt_pav_crochet
  OWNER TO sig_create;
GRANT ALL ON TABLE m_dechet.lt_pav_crochet TO sig_create;
GRANT ALL ON TABLE m_dechet.lt_pav_crochet TO create_sig;
GRANT SELECT ON TABLE m_dechet.lt_pav_crochet TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_dechet.lt_pav_crochet TO edit_sig;

ALTER TABLE m_dechet.lt_pav_envimplan
  OWNER TO sig_create;
GRANT ALL ON TABLE m_dechet.lt_pav_envimplan TO sig_create;
GRANT ALL ON TABLE m_dechet.lt_pav_envimplan TO create_sig;
GRANT SELECT ON TABLE m_dechet.lt_pav_envimplan TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_dechet.lt_pav_envimplan TO edit_sig;

ALTER TABLE m_dechet.lt_pav_envsitu
  OWNER TO sig_create;
GRANT ALL ON TABLE m_dechet.lt_pav_envsitu TO sig_create;
GRANT ALL ON TABLE m_dechet.lt_pav_envsitu TO create_sig;
GRANT SELECT ON TABLE m_dechet.lt_pav_envsitu TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_dechet.lt_pav_envsitu TO edit_sig;

ALTER TABLE m_dechet.lt_pav_envtype
  OWNER TO sig_create;
GRANT ALL ON TABLE m_dechet.lt_pav_envtype TO sig_create;
GRANT ALL ON TABLE m_dechet.lt_pav_envtype TO create_sig;
GRANT SELECT ON TABLE m_dechet.lt_pav_envtype TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_dechet.lt_pav_envtype TO edit_sig;

ALTER TABLE m_dechet.lt_pav_etatsign
  OWNER TO sig_create;
GRANT ALL ON TABLE m_dechet.lt_pav_etatsign TO sig_create;
GRANT ALL ON TABLE m_dechet.lt_pav_etatsign TO create_sig;
GRANT SELECT ON TABLE m_dechet.lt_pav_etatsign TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_dechet.lt_pav_etatsign TO edit_sig;

ALTER TABLE m_dechet.lt_pav_gest
  OWNER TO sig_create;
GRANT ALL ON TABLE m_dechet.lt_pav_gest TO sig_create;
GRANT ALL ON TABLE m_dechet.lt_pav_gest TO create_sig;
GRANT SELECT ON TABLE m_dechet.lt_pav_gest TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_dechet.lt_pav_gest TO edit_sig;

ALTER TABLE m_dechet.lt_pav_modepreh
  OWNER TO sig_create;
GRANT ALL ON TABLE m_dechet.lt_pav_modepreh TO sig_create;
GRANT ALL ON TABLE m_dechet.lt_pav_modepreh TO create_sig;
GRANT SELECT ON TABLE m_dechet.lt_pav_modepreh TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_dechet.lt_pav_modepreh TO edit_sig;

ALTER TABLE m_dechet.lt_pav_natpb
  OWNER TO sig_create;
GRANT ALL ON TABLE m_dechet.lt_pav_natpb TO sig_create;
GRANT ALL ON TABLE m_dechet.lt_pav_natpb TO create_sig;
GRANT SELECT ON TABLE m_dechet.lt_pav_natpb TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_dechet.lt_pav_natpb TO edit_sig;


ALTER TABLE m_dechet.lt_pav_pavorient
  OWNER TO sig_create;
GRANT ALL ON TABLE m_dechet.lt_pav_pavorient TO sig_create;
GRANT ALL ON TABLE m_dechet.lt_pav_pavorient TO create_sig;
GRANT SELECT ON TABLE m_dechet.lt_pav_pavorient TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_dechet.lt_pav_pavorient TO edit_sig;

ALTER TABLE m_dechet.lt_pav_peinture
  OWNER TO sig_create;
GRANT ALL ON TABLE m_dechet.lt_pav_peinture TO sig_create;
GRANT ALL ON TABLE m_dechet.lt_pav_peinture TO create_sig;
GRANT SELECT ON TABLE m_dechet.lt_pav_peinture TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_dechet.lt_pav_peinture TO edit_sig;

ALTER TABLE m_dechet.lt_pav_proprete
  OWNER TO sig_create;
GRANT ALL ON TABLE m_dechet.lt_pav_proprete TO sig_create;
GRANT ALL ON TABLE m_dechet.lt_pav_proprete TO create_sig;
GRANT SELECT ON TABLE m_dechet.lt_pav_proprete TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_dechet.lt_pav_proprete TO edit_sig;

ALTER TABLE m_dechet.lt_pav_statut
  OWNER TO sig_create;
GRANT ALL ON TABLE m_dechet.lt_pav_statut TO sig_create;
GRANT ALL ON TABLE m_dechet.lt_pav_statut TO create_sig;
GRANT SELECT ON TABLE m_dechet.lt_pav_statut TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_dechet.lt_pav_statut TO edit_sig;

ALTER TABLE m_dechet.lt_pav_typesign
  OWNER TO sig_create;
GRANT ALL ON TABLE m_dechet.lt_pav_typesign TO sig_create;
GRANT ALL ON TABLE m_dechet.lt_pav_typesign TO create_sig;
GRANT SELECT ON TABLE m_dechet.lt_pav_typesign TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_dechet.lt_pav_typesign TO edit_sig;

ALTER TABLE m_dechet.lt_pav_typesol
  OWNER TO sig_create;
GRANT ALL ON TABLE m_dechet.lt_pav_typesol TO sig_create;
GRANT ALL ON TABLE m_dechet.lt_pav_typesol TO create_sig;
GRANT SELECT ON TABLE m_dechet.lt_pav_typesol TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_dechet.lt_pav_typesol TO edit_sig;

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




