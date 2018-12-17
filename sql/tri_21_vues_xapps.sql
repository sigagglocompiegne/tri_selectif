/*TRI SELECTIF V1.0*/
/* Creation des vues applicatives */
/* tri_21_vues_xapps.sql */
/*PostGIS*/

/* Propriétaire : GeoCompiegnois - http://geo.compiegnois.fr/ */
/* Auteur : Grégory Bodet */

/* -------------------------------------------------------- xapps_geo_v_pav_orient ------------------------------------------- */

-- View: x_apps.xapps_geo_v_pav_orient

-- DROP VIEW x_apps.xapps_geo_v_pav_orient;

CREATE OR REPLACE VIEW x_apps.xapps_geo_v_pav_orient AS 
 SELECT row_number() OVER () AS row_id,
    st_makeline(a.geom, b.geom)::geometry(LineString,2154) AS geom
   FROM m_dechet.geo_dec_pav_verre a,
    m_dechet.geo_dec_pav_verre b
  WHERE a.id_contver = b.id_parent;


COMMENT ON VIEW x_apps.xapps_geo_v_pav_orient
  IS 'Vue géométrique des liens entre PAV supprimer, déplacer et le nouvel emplacement';
