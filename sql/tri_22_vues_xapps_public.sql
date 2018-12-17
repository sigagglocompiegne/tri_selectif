/*TRI SELECTIF V1.0*/
/* Creation des vues applicatives publiques */
/* tri_21_vues_xapps_public.sql */
/*PostGIS*/

/* Propriétaire : GeoCompiegnois - http://geo.compiegnois.fr/ */
/* Auteur : Grégory Bodet */


/* ******************************************* xappspublic_geo_v_dec_pav_tampon ******************************************** */

-- View: x_apps_public.xappspublic_geo_v_dec_pav_tampon

-- DROP VIEW x_apps_public.xappspublic_geo_v_dec_pav_tampon;

CREATE OR REPLACE VIEW x_apps_public.xappspublic_geo_v_dec_pav_tampon AS 
 SELECT geo_dec_pav_verre.id_contver,
    geo_dec_pav_verre.v_tampon,
    geo_dec_pav_verre.date_effet,
    geo_dec_pav_verre.geom2
   FROM m_dechet.geo_dec_pav_verre
  WHERE geo_dec_pav_verre.statut::text = '10'::text AND geo_dec_pav_verre.env_implan::text <> '40'::text;

COMMENT ON VIEW x_apps_public.xappspublic_geo_v_dec_pav_tampon
  IS 'Vue géométrique contenant les tampons d''emprise des conteneurs TLC pour EXPORT FME et recherche des adresse dans ses tampons pour remonter le PAV VERRE';
  
  
/* ******************************************* xappspublic_geo_v_dec_pav_tlc_tampon ******************************************** */

-- View: x_apps_public.xappspublic_geo_v_dec_pav_tlc_tampon

-- DROP VIEW x_apps_public.xappspublic_geo_v_dec_pav_tlc_tampon;

CREATE OR REPLACE VIEW x_apps_public.xappspublic_geo_v_dec_pav_tlc_tampon AS 
 SELECT geo_dec_pav_tlc.id_cont_tl,
    geo_dec_pav_tlc.v_tampon,
    geo_dec_pav_tlc.date_effet,
    geo_dec_pav_tlc.geom2
   FROM m_dechet.geo_dec_pav_tlc;

COMMENT ON VIEW x_apps_public.xappspublic_geo_v_dec_pav_tlc_tampon
  IS 'Vue géométrique contenant les tampons d''emprise des conteneurs TLC pour EXPORT FME et recherche des adresse dans ses tampons pour remonter le PAV VERRE';


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

