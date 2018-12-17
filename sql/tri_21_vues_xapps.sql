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

/* -------------------------------------------------------- xapps_geo_v_pav_verre_inactif ------------------------------------------- */

-- View: x_apps.xapps_geo_v_pav_verre_inactif

-- DROP VIEW x_apps.xapps_geo_v_pav_verre_inactif;

CREATE OR REPLACE VIEW x_apps.xapps_geo_v_pav_verre_inactif AS 
 SELECT geo_dec_pav_verre.id_contver,
    geo_dec_pav_verre.commune,
    geo_dec_pav_verre.insee,
    geo_dec_pav_verre.quartier,
    geo_dec_pav_verre.adresse,
    geo_dec_pav_verre.x_l93,
    geo_dec_pav_verre.y_l93,
    geo_dec_pav_verre.cont_nbr,
    geo_dec_pav_verre.cont_mat,
    geo_dec_pav_verre.cont_pos,
    geo_dec_pav_verre.date_sai,
    geo_dec_pav_verre.date_pos,
    geo_dec_pav_verre.date_net,
    geo_dec_pav_verre.date_maj,
    geo_dec_pav_verre.photo,
    geo_dec_pav_verre.url_photo,
    geo_dec_pav_verre.src_geom,
    geo_dec_pav_verre.volume,
    geo_dec_pav_verre.env_type,
    geo_dec_pav_verre.env_implan,
    geo_dec_pav_verre.env_situ,
    geo_dec_pav_verre.mode_preh,
    geo_dec_pav_verre.crochet,
    geo_dec_pav_verre.opercules,
    geo_dec_pav_verre.tags,
    geo_dec_pav_verre.peinture,
    geo_dec_pav_verre.prox_corb,
    geo_dec_pav_verre.type_sol,
    geo_dec_pav_verre.trp_rest,
    geo_dec_pav_verre.etat_sign,
    geo_dec_pav_verre.type_sign,
    geo_dec_pav_verre.proprete,
    geo_dec_pav_verre.prop_abor,
    geo_dec_pav_verre.def_struc,
    geo_dec_pav_verre.hab_pav,
    geo_dec_pav_verre.opt_pav,
    geo_dec_pav_verre.ame_acces,
    geo_dec_pav_verre.nat_pb,
    geo_dec_pav_verre.nat_pb_99,
    geo_dec_pav_verre.geom,
    geo_dec_pav_verre.op_sai,
    geo_dec_pav_verre.observ,
    geo_dec_pav_verre.pavorient,
    geo_dec_pav_verre.id_parent,
    geo_dec_pav_verre.statut
   FROM m_dechet.geo_dec_pav_verre
  WHERE geo_dec_pav_verre.statut::text = '20'::text;

COMMENT ON VIEW x_apps.xapps_geo_v_pav_verre_inactif
  IS 'Vue géographique permettant de visualiser les conteneurs PAV Verre inactifs (dans la cartothèque de l''application GEO sur le tri)';
