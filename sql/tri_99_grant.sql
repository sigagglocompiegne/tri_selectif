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

ALTER SEQUENCE m_dechet.geo_dec_pav_lieu_idlieu_seq
    OWNER TO sig_create;

GRANT ALL ON SEQUENCE m_dechet.geo_dec_pav_lieu_idlieu_seq TO PUBLIC;
GRANT ALL ON SEQUENCE m_dechet.geo_dec_pav_lieu_idlieu_seq TO create_sig;
GRANT ALL ON SEQUENCE m_dechet.geo_dec_pav_lieu_idlieu_seq TO sig_create;

ALTER SEQUENCE m_dechet.an_dec_pav_cont_idcont_seq
    OWNER TO sig_create;
   
GRANT ALL ON SEQUENCE m_dechet.an_dec_pav_cont_idcont_seq TO PUBLIC;
GRANT ALL ON SEQUENCE m_dechet.an_dec_pav_cont_idcont_seq TO create_sig;
GRANT ALL ON SEQUENCE m_dechet.an_dec_pav_cont_idcont_seq TO sig_create;

ALTER SEQUENCE m_dechet.an_dec_pav_doc_media_gid_seq
    OWNER TO sig_create;

GRANT ALL ON SEQUENCE m_dechet.an_dec_pav_doc_media_gid_seq TO PUBLIC;
GRANT ALL ON SEQUENCE m_dechet.an_dec_pav_doc_media_gid_seq TO create_sig;
GRANT ALL ON SEQUENCE m_dechet.an_dec_pav_doc_media_gid_seq TO sig_create;


-- #################################################################### TABLE  ####################################################################



-- #################################################################### VUE DE GESTION  ####################################################################

Sans objet


-- #################################################################### VUE APPLICATIVE  ####################################################################

ALTER TABLE x_apps.xapps_geo_v_dec_pav_lieu_orient
    OWNER TO sig_create;

GRANT DELETE, UPDATE, SELECT, INSERT ON TABLE x_apps.xapps_geo_v_dec_pav_lieu_orient TO edit_sig;
GRANT ALL ON TABLE x_apps.xapps_geo_v_dec_pav_lieu_orient TO sig_create;
GRANT ALL ON TABLE x_apps.xapps_geo_v_dec_pav_lieu_orient TO create_sig;
GRANT SELECT ON TABLE x_apps.xapps_geo_v_dec_pav_lieu_orient TO read_sig;

ALTER TABLE x_apps.xapps_an_dec_lieu_eve_tab
    OWNER TO sig_create;

GRANT DELETE, UPDATE, SELECT, INSERT ON TABLE x_apps.xapps_an_dec_lieu_eve_tab TO edit_sig;
GRANT ALL ON TABLE x_apps.xapps_an_dec_lieu_eve_tab TO sig_create;
GRANT ALL ON TABLE x_apps.xapps_an_dec_lieu_eve_tab TO create_sig;
GRANT SELECT ON TABLE x_apps.xapps_an_dec_lieu_eve_tab TO read_sig;

ALTER TABLE x_apps.xapps_an_dec_pav_chiffre_cle_tab
    OWNER TO sig_create;

GRANT DELETE, UPDATE, SELECT, INSERT ON TABLE x_apps.xapps_an_dec_pav_chiffre_cle_tab TO edit_sig;
GRANT ALL ON TABLE x_apps.xapps_an_dec_pav_chiffre_cle_tab TO sig_create;
GRANT ALL ON TABLE x_apps.xapps_an_dec_pav_chiffre_cle_tab TO create_sig;
GRANT SELECT ON TABLE x_apps.xapps_an_dec_pav_chiffre_cle_tab TO read_sig;

ALTER TABLE x_apps.xapps_an_dec_pav_eve_tab
    OWNER TO sig_create;

GRANT DELETE, UPDATE, SELECT, INSERT ON TABLE x_apps.xapps_an_dec_pav_eve_tab TO edit_sig;
GRANT ALL ON TABLE x_apps.xapps_an_dec_pav_eve_tab TO sig_create;
GRANT ALL ON TABLE x_apps.xapps_an_dec_pav_eve_tab TO create_sig;
GRANT SELECT ON TABLE x_apps.xapps_an_dec_pav_eve_tab TO read_sig;
                                                                  

-- #################################################################### VUE GD PUBLIC  ####################################################################


ALTER TABLE x_apps_public.xappspublic_geo_dec_pav_verre
    OWNER TO sig_create;


GRANT DELETE, UPDATE, SELECT, INSERT ON TABLE x_apps_public.xappspublic_geo_dec_pav_verre TO edit_sig;
GRANT ALL ON TABLE x_apps_public.xappspublic_geo_dec_pav_verre TO sig_create;
GRANT ALL ON TABLE x_apps_public.xappspublic_geo_dec_pav_verre TO create_sig;
GRANT SELECT ON TABLE x_apps_public.xappspublic_geo_dec_pav_verre TO read_sig;


ALTER TABLE x_apps_public.xappspublic_geo_dec_pav_tlc
    OWNER TO sig_create;

GRANT DELETE, UPDATE, SELECT, INSERT ON TABLE x_apps_public.xappspublic_geo_dec_pav_tlc TO edit_sig;
GRANT ALL ON TABLE x_apps_public.xappspublic_geo_dec_pav_tlc TO sig_create;
GRANT ALL ON TABLE x_apps_public.xappspublic_geo_dec_pav_tlc TO create_sig;
GRANT SELECT ON TABLE x_apps_public.xappspublic_geo_dec_pav_tlc TO read_sig;


ALTER TABLE x_apps_public.xappspublic_geo_v_dec_secteur_enc_secteur
    OWNER TO sig_create;


GRANT DELETE, UPDATE, SELECT, INSERT ON TABLE x_apps_public.xappspublic_geo_v_dec_secteur_enc_secteur TO edit_sig;
GRANT ALL ON TABLE x_apps_public.xappspublic_geo_v_dec_secteur_enc_secteur TO sig_create;
GRANT ALL ON TABLE x_apps_public.xappspublic_geo_v_dec_secteur_enc_secteur TO create_sig;
GRANT SELECT ON TABLE x_apps_public.xappspublic_geo_v_dec_secteur_enc_secteur TO read_sig;


-- #################################################################### VUE OPENDATA  ####################################################################

Sans objet


-- #################################################################### FUNCTION TRIGGER  ####################################################################


