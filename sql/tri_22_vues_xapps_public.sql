/*TRI SELECTIF V1.0*/
/* Creation des vues applicatives publiques */
/* tri_22_vues_xapps_public.sql */
/*PostGIS*/

/* Propriétaire : GeoCompiegnois - http://geo.compiegnois.fr/ */
/* Auteur : Grégory Bodet */


/* ******************************************* x_apps_public.xappspublic_geo_dec_pav_tlc ******************************************** */

-- View: x_apps_public.xappspublic_geo_dec_pav_verre

-- DROP VIEW x_apps_public.xappspublic_geo_dec_pav_verre;

CREATE OR REPLACE VIEW x_apps_public.xappspublic_geo_dec_pav_verre
 AS
 SELECT l.idlieu AS id_contver,
    l.commune,
    l.quartier,
    l.adresse,
    count(*) AS cont_nb,
    l.geom
   FROM m_dechet.geo_dec_pav_lieu l,
    m_dechet.an_dec_pav_cont c
  WHERE l.statut::text = '10'::text AND l.idlieu = c.idlieu AND (l.idlieu IN ( SELECT an_dec_pav_cont.idlieu
           FROM m_dechet.an_dec_pav_cont
          WHERE an_dec_pav_cont.eve::text = ANY (ARRAY['10'::character varying::text, '11'::character varying::text, '12'::character varying::text, '13'::character varying::text, '14'::character varying::text, '00'::character varying::text]))) AND c.date_effet <= now()
  GROUP BY l.idlieu, l.commune, l.quartier, l.adresse
  ORDER BY l.idlieu;

ALTER TABLE x_apps_public.xappspublic_geo_dec_pav_verre
    OWNER TO sig_create;
COMMENT ON VIEW x_apps_public.xappspublic_geo_dec_pav_verre
    IS 'Vue géographique présentant les données servant à l''export pour l''appli Gd Public des conteneurs verres';

GRANT DELETE, UPDATE, SELECT, INSERT ON TABLE x_apps_public.xappspublic_geo_dec_pav_verre TO edit_sig;
GRANT ALL ON TABLE x_apps_public.xappspublic_geo_dec_pav_verre TO sig_create;
GRANT ALL ON TABLE x_apps_public.xappspublic_geo_dec_pav_verre TO create_sig;
GRANT SELECT ON TABLE x_apps_public.xappspublic_geo_dec_pav_verre TO read_sig;


/* ******************************************* x_apps_public.xappspublic_geo_dec_pav_tlc ******************************************** */
                                                       
-- View: x_apps_public.xappspublic_geo_dec_pav_tlc

-- DROP VIEW x_apps_public.xappspublic_geo_dec_pav_tlc;

CREATE OR REPLACE VIEW x_apps_public.xappspublic_geo_dec_pav_tlc
 AS
 SELECT l.idlieu AS id_cont_tl,
    l.commune,
    l.quartier,
    l.adresse,
    count(*) AS cont_nb,
    l.geom
   FROM m_dechet.geo_dec_pav_lieu l,
    m_dechet.an_dec_pav_cont_tlc c
  WHERE l.statut::text = '10'::text AND l.idlieu = c.idlieu AND (l.idlieu IN ( SELECT an_dec_pav_cont_tlc.idlieu
           FROM m_dechet.an_dec_pav_cont_tlc
          WHERE an_dec_pav_cont_tlc.eve::text = ANY (ARRAY['10'::character varying, '11'::character varying, '12'::character varying, '13'::character varying, '14'::character varying, '00'::character varying]::text[]))) AND c.date_effet <= now()
  GROUP BY l.idlieu, l.commune, l.quartier, l.adresse
  ORDER BY l.idlieu;

ALTER TABLE x_apps_public.xappspublic_geo_dec_pav_tlc
    OWNER TO sig_create;
COMMENT ON VIEW x_apps_public.xappspublic_geo_dec_pav_tlc
    IS 'Vue géographique présentant les données servant à l''export pour l''appli Gd Public des conteneurs TLC';

GRANT DELETE, UPDATE, SELECT, INSERT ON TABLE x_apps_public.xappspublic_geo_dec_pav_tlc TO edit_sig;
GRANT ALL ON TABLE x_apps_public.xappspublic_geo_dec_pav_tlc TO sig_create;
GRANT ALL ON TABLE x_apps_public.xappspublic_geo_dec_pav_tlc TO create_sig;
GRANT SELECT ON TABLE x_apps_public.xappspublic_geo_dec_pav_tlc TO read_sig;
  
  

/* ******************************************* xappspublic_geo_v_dec_secteur_enc_secteur ******************************************** */

-- View: x_apps_public.xappspublic_geo_v_dec_secteur_enc_secteur

-- DROP VIEW x_apps_public.xappspublic_geo_v_dec_secteur_enc_secteur;

CREATE OR REPLACE VIEW x_apps_public.xappspublic_geo_v_dec_secteur_enc_secteur AS 
 SELECT geo_dec_secteur_enc.gid,
    geo_dec_secteur_enc.insee,
    geo_dec_secteur_enc.commune,
    geo_dec_secteur_enc.adresse,
    geo_dec_secteur_enc.l_secteur,
    geo_dec_secteur_enc.l_message1,
    geo_dec_secteur_enc.l_message2,
    geo_dec_secteur_enc.geom1 AS geom
   FROM m_dechet.geo_dec_secteur_enc;

COMMENT ON VIEW x_apps_public.xappspublic_geo_v_dec_secteur_enc_secteur
  IS 'Vue géométrique contenant les secteurs de rammassage des encombrants pour export dans GEO APPLI GD PUBLIC';

