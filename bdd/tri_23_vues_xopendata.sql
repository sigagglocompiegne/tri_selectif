/*TRI SELECTIF V1.0*/
/* Creation des vues applicatives publiques */
/* tri_23_vues_xopendata.sql */
/*PostGIS*/

/* Propriétaire : GeoCompiegnois - http://geo.compiegnois.fr/ */
/* Auteur : Grégory Bodet */


-- View: x_opendata.xopendata_geo_dec_pav_verre

-- DROP VIEW x_opendata.xopendata_geo_dec_pav_verre;

CREATE OR REPLACE VIEW x_opendata.xopendata_geo_dec_pav_verre
 AS
 SELECT l.idlieu,
    c.idcont,
    l.statut,
    l.cttype,
    l.insee,
    l.commune,
    l.quartier,
    l.adresse,
    l.localisation,
    l.prop_abor,
    l.env_type,
    l.env_implan,
    l.env_situ,
    l.prox_corb,
    l.ame_acces,
    l.nat_pb,
    l.nat_pb_99,
    l.x_l93,
    l.y_l93,
    l.src_geom,
    l.src_date,
    l.date_sai AS ldate_sai,
    l.date_maj AS ldate_maj,
    c.model,
    c.pos,
    c.date_pos,
    c.date_net,
    c.mode_preh,
    c.opercules,
    c.tags,
    c.peinture,
    c.type_sol,
    c.trp_rest,
    c.etat_sign,
    c.type_sign,
    c.proprete,
    c.def_struc,
    c.date_sai AS cdate_sai,
    c.date_maj AS cdate_maj,
    l.geom
   FROM m_dechet.geo_dec_pav_lieu l,
    m_dechet.an_dec_pav_cont c
  WHERE l.statut::text = '10'::text AND l.env_implan::text <> '40'::text AND l.idlieu = c.idlieu AND (l.idlieu IN ( SELECT an_dec_pav_cont.idlieu
           FROM m_dechet.an_dec_pav_cont
          WHERE an_dec_pav_cont.eve::text = ANY (ARRAY['10'::character varying::text, '11'::character varying::text, '12'::character varying::text, '13'::character varying::text, '14'::character varying::text, '00'::character varying::text]))) AND c.date_effet <= now()
  ORDER BY l.idlieu;

COMMENT ON VIEW x_opendata.xopendata_geo_dec_pav_verre
    IS 'Vue géographique présentant les données servant à l''export pour l''open data des lieux de collecte de PAV verres';




                                                    
