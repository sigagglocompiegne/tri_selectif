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

ALTER TABLE m_dechet.lt_pav_cttype
    OWNER to sig_create;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE m_dechet.lt_pav_cttype TO edit_sig;
GRANT ALL ON TABLE m_dechet.lt_pav_cttype TO sig_create;
GRANT ALL ON TABLE m_dechet.lt_pav_cttype TO create_sig;
GRANT SELECT ON TABLE m_dechet.lt_pav_cttype TO read_sig;

ALTER TABLE m_dechet.lt_pav_contmat
    OWNER to sig_create;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE m_dechet.lt_pav_contmat TO edit_sig;
GRANT ALL ON TABLE m_dechet.lt_pav_contmat TO sig_create;
GRANT ALL ON TABLE m_dechet.lt_pav_contmat TO create_sig;
GRANT SELECT ON TABLE m_dechet.lt_pav_contmat TO read_sig;

ALTER TABLE m_dechet.lt_pav_contpos
    OWNER to sig_create;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE m_dechet.lt_pav_contpos TO edit_sig;
GRANT ALL ON TABLE m_dechet.lt_pav_contpos TO sig_create;
GRANT ALL ON TABLE m_dechet.lt_pav_contpos TO create_sig;
GRANT SELECT ON TABLE m_dechet.lt_pav_contpos TO read_sig;

ALTER TABLE m_dechet.lt_pav_crochet
    OWNER to sig_create;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE m_dechet.lt_pav_crochet TO edit_sig;
GRANT ALL ON TABLE m_dechet.lt_pav_crochet TO sig_create;
GRANT ALL ON TABLE m_dechet.lt_pav_crochet TO create_sig;
GRANT SELECT ON TABLE m_dechet.lt_pav_crochet TO read_sig;

ALTER TABLE m_dechet.lt_pav_envimplan
    OWNER to sig_create;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE m_dechet.lt_pav_envimplan TO edit_sig;

GRANT ALL ON TABLE m_dechet.lt_pav_envimplan TO sig_create;
GRANT ALL ON TABLE m_dechet.lt_pav_envimplan TO create_sig;
GRANT SELECT ON TABLE m_dechet.lt_pav_envimplan TO read_sig;

ALTER TABLE m_dechet.lt_pav_envsitu
    OWNER to sig_create;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE m_dechet.lt_pav_envsitu TO edit_sig;
GRANT ALL ON TABLE m_dechet.lt_pav_envsitu TO sig_create;
GRANT ALL ON TABLE m_dechet.lt_pav_envsitu TO create_sig;
GRANT SELECT ON TABLE m_dechet.lt_pav_envsitu TO read_sig;

ALTER TABLE m_dechet.lt_pav_envtype
    OWNER to sig_create;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE m_dechet.lt_pav_envtype TO edit_sig;

GRANT ALL ON TABLE m_dechet.lt_pav_envtype TO sig_create;
GRANT ALL ON TABLE m_dechet.lt_pav_envtype TO create_sig;
GRANT SELECT ON TABLE m_dechet.lt_pav_envtype TO read_sig;

ALTER TABLE m_dechet.lt_pav_etatsign
    OWNER to sig_create;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE m_dechet.lt_pav_etatsign TO edit_sig;

GRANT ALL ON TABLE m_dechet.lt_pav_etatsign TO sig_create;
GRANT ALL ON TABLE m_dechet.lt_pav_etatsign TO create_sig;
GRANT SELECT ON TABLE m_dechet.lt_pav_etatsign TO read_sig;

ALTER TABLE m_dechet.lt_pav_eve
    OWNER to sig_create;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE m_dechet.lt_pav_eve TO edit_sig;
GRANT ALL ON TABLE m_dechet.lt_pav_eve TO sig_create;
GRANT ALL ON TABLE m_dechet.lt_pav_eve TO create_sig;
GRANT SELECT ON TABLE m_dechet.lt_pav_eve TO read_sig;

ALTER TABLE m_dechet.lt_pav_gest
    OWNER to sig_create;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE m_dechet.lt_pav_gest TO edit_sig;

GRANT ALL ON TABLE m_dechet.lt_pav_gest TO sig_create;
GRANT ALL ON TABLE m_dechet.lt_pav_gest TO create_sig;
GRANT SELECT ON TABLE m_dechet.lt_pav_gest TO read_sig;

ALTER TABLE m_dechet.lt_pav_modele
    OWNER to sig_create;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE m_dechet.lt_pav_modele TO edit_sig;
GRANT ALL ON TABLE m_dechet.lt_pav_modele TO sig_create;
GRANT ALL ON TABLE m_dechet.lt_pav_modele TO create_sig;
GRANT SELECT ON TABLE m_dechet.lt_pav_modele TO read_sig;


ALTER TABLE m_dechet.lt_pav_modepreh
    OWNER to sig_create;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE m_dechet.lt_pav_modepreh TO edit_sig;
GRANT ALL ON TABLE m_dechet.lt_pav_modepreh TO sig_create;
GRANT ALL ON TABLE m_dechet.lt_pav_modepreh TO create_sig;
GRANT SELECT ON TABLE m_dechet.lt_pav_modepreh TO read_sig;

ALTER TABLE m_dechet.lt_pav_natpb
    OWNER to sig_create;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE m_dechet.lt_pav_natpb TO edit_sig;
GRANT ALL ON TABLE m_dechet.lt_pav_natpb TO sig_create;
GRANT ALL ON TABLE m_dechet.lt_pav_natpb TO create_sig;
GRANT SELECT ON TABLE m_dechet.lt_pav_natpb TO read_sig;

ALTER TABLE m_dechet.lt_pav_pavorient
    OWNER to sig_create;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE m_dechet.lt_pav_pavorient TO edit_sig;
GRANT ALL ON TABLE m_dechet.lt_pav_pavorient TO sig_create;
GRANT ALL ON TABLE m_dechet.lt_pav_pavorient TO create_sig;
GRANT SELECT ON TABLE m_dechet.lt_pav_pavorient TO read_sig;

ALTER TABLE m_dechet.lt_pav_peinture
    OWNER to sig_create;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE m_dechet.lt_pav_peinture TO edit_sig;
GRANT ALL ON TABLE m_dechet.lt_pav_peinture TO sig_create;
GRANT ALL ON TABLE m_dechet.lt_pav_peinture TO create_sig;
GRANT SELECT ON TABLE m_dechet.lt_pav_peinture TO read_sig;

ALTER TABLE m_dechet.lt_pav_proprete
    OWNER to sig_create;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE m_dechet.lt_pav_proprete TO edit_sig;
GRANT ALL ON TABLE m_dechet.lt_pav_proprete TO sig_create;
GRANT ALL ON TABLE m_dechet.lt_pav_proprete TO create_sig;
GRANT SELECT ON TABLE m_dechet.lt_pav_proprete TO read_sig;

ALTER TABLE m_dechet.lt_pav_statut
    OWNER to sig_create;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE m_dechet.lt_pav_statut TO edit_sig;
GRANT ALL ON TABLE m_dechet.lt_pav_statut TO sig_create;
GRANT ALL ON TABLE m_dechet.lt_pav_statut TO create_sig;
GRANT SELECT ON TABLE m_dechet.lt_pav_statut TO read_sig;

ALTER TABLE m_dechet.lt_pav_typesign
    OWNER to sig_create;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE m_dechet.lt_pav_typesign TO edit_sig;
GRANT ALL ON TABLE m_dechet.lt_pav_typesign TO sig_create;
GRANT ALL ON TABLE m_dechet.lt_pav_typesign TO create_sig;
GRANT SELECT ON TABLE m_dechet.lt_pav_typesign TO read_sig;

ALTER TABLE m_dechet.lt_pav_typesol
    OWNER to sig_create;

GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE m_dechet.lt_pav_typesol TO edit_sig;
GRANT ALL ON TABLE m_dechet.lt_pav_typesol TO sig_create;
GRANT ALL ON TABLE m_dechet.lt_pav_typesol TO create_sig;
GRANT SELECT ON TABLE m_dechet.lt_pav_typesol TO read_sig;

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


