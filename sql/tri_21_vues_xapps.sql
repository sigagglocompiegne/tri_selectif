/*TRI SELECTIF V1.0*/
/* Creation des vues applicatives */
/* tri_21_vues_xapps.sql */
/*PostGIS*/

/* Propriétaire : GeoCompiegnois - http://geo.compiegnois.fr/ */
/* Auteur : Grégory Bodet */

/* -------------------------------------------------------- xapps_geo_v_dec_pav_lieu_orient ------------------------------------------- */

-- View: x_apps.xapps_geo_v_dec_pav_lieu_orient

-- DROP VIEW x_apps.xapps_geo_v_dec_pav_lieu_orient;

CREATE OR REPLACE VIEW x_apps.xapps_geo_v_dec_pav_lieu_orient
 AS
 SELECT row_number() OVER () AS row_id,
    st_makeline(a.geom, b.geom)::geometry(LineString,2154) AS geom
   FROM m_dechet.geo_dec_pav_lieu a,
    m_dechet.geo_dec_pav_lieu b
  WHERE a.idlieu = b.idparent;
  
  COMMENT ON VIEW x_apps.xapps_geo_v_dec_pav_lieu_orient
    IS 'Vue géométrique des liens entre PAV supprimer, déplacer et le nouvel emplacement (en pré-production)';

/* -------------------------------------------------------- xapps_an_dec_lieu_eve_tab ------------------------------------------- */

-- View: x_apps.xapps_an_dec_lieu_eve_tab

-- DROP VIEW x_apps.xapps_an_dec_lieu_eve_tab;

CREATE OR REPLACE VIEW x_apps.xapps_an_dec_lieu_eve_tab
 AS
 SELECT ( SELECT l2.idlieu
           FROM m_dechet.geo_dec_pav_lieu l2
          WHERE l2.idparent = l.idlieu) AS idlieu_new,
    l.idlieu AS idlieu_old,
    'Lieu de collecte (verre) déplacé'::text AS eve,
    max(c.date_eve) AS date_eve,
    max(to_char(c.date_eve, 'YYYY'::text)) AS annee_eve,
    l.date_maj,
    l.date_sai,
    (
        CASE
            WHEN l.adresse IS NULL THEN ''::character varying
            ELSE l.adresse
        END::text ||
        CASE
            WHEN l.localisation IS NULL THEN ''::character varying
            ELSE l.localisation
        END::text) ||
        CASE
            WHEN l.commune IS NULL THEN ''::text
            ELSE ' à '::text || l.commune::text
        END AS lieu_old,
    ( SELECT (
                CASE
                    WHEN l2.adresse IS NULL THEN ''::character varying
                    ELSE l2.adresse
                END::text ||
                CASE
                    WHEN l2.localisation IS NULL THEN ''::character varying
                    ELSE l2.localisation
                END::text) ||
                CASE
                    WHEN l2.commune IS NULL THEN ''::text
                    ELSE ' à '::text || l2.commune::text
                END
           FROM m_dechet.geo_dec_pav_lieu l2
          WHERE l2.idparent = l.idlieu) AS lieu_new
   FROM m_dechet.geo_dec_pav_lieu l,
    m_dechet.an_dec_pav_cont c
  WHERE l.idlieu = c.idlieu AND l.statut::text = '20'::text AND c.eve::text <> '10'::text AND (l.idlieu IN ( SELECT l1.idparent
           FROM m_dechet.geo_dec_pav_lieu l1
          WHERE l1.idparent IS NOT NULL))
  GROUP BY l.idlieu
UNION ALL
 SELECT ( SELECT l2.idlieu
           FROM m_dechet.geo_dec_pav_lieu l2
          WHERE l2.idparent = l.idlieu) AS idlieu_new,
    l.idlieu AS idlieu_old,
    'Lieu de collecte (verre) supprimé'::text AS eve,
    max(c.date_eve) AS date_eve,
    max(to_char(c.date_eve, 'YYYY'::text)) AS annee_eve,
    l.date_maj,
    l.date_sai,
    (
        CASE
            WHEN l.adresse IS NULL THEN ''::character varying
            ELSE l.adresse
        END::text ||
        CASE
            WHEN l.localisation IS NULL THEN ''::character varying
            ELSE l.localisation
        END::text) ||
        CASE
            WHEN l.commune IS NULL THEN ''::text
            ELSE ' à '::text || l.commune::text
        END AS lieu_old,
    ''::text AS lieu_new
   FROM m_dechet.geo_dec_pav_lieu l,
    m_dechet.an_dec_pav_cont c
  WHERE l.idlieu = c.idlieu AND l.statut::text = '20'::text AND c.eve::text <> '10'::text AND NOT (l.idlieu IN ( SELECT l1.idparent
           FROM m_dechet.geo_dec_pav_lieu l1
          WHERE l1.idparent IS NOT NULL))
  GROUP BY l.idlieu;

COMMENT ON VIEW x_apps.xapps_an_dec_lieu_eve_tab
    IS 'Vue alphanumérique présentant les évènements par année des mouvements des lieux de collecte disposant de PAV Verre';



/* -------------------------------------------------------- xapps_an_dec_pav_chiffre_cle_tab ------------------------------------------- */

-- View: x_apps.xapps_an_dec_pav_chiffre_cle_tab

-- DROP VIEW x_apps.xapps_an_dec_pav_chiffre_cle_tab;

CREATE OR REPLACE VIEW x_apps.xapps_an_dec_pav_chiffre_cle_tab
 AS
 WITH req_nbpav AS (
         SELECT 1 AS id,
            count(*) AS nb_pav_verre
           FROM m_dechet.an_dec_pav_cont
          WHERE an_dec_pav_cont.eve::text = ANY (ARRAY['10'::character varying, '11'::character varying, '12'::character varying, '13'::character varying, '14'::character varying, '00'::character varying]::text[])
        ), req_nblieu AS (
         SELECT 1 AS id,
            count(*) AS nb_lieu_verre
           FROM m_dechet.geo_dec_pav_lieu
          WHERE geo_dec_pav_lieu.statut::text = '10'::text AND (geo_dec_pav_lieu.idlieu IN ( SELECT an_dec_pav_cont.idlieu
                   FROM m_dechet.an_dec_pav_cont
                  WHERE an_dec_pav_cont.eve::text = ANY (ARRAY['10'::character varying, '11'::character varying, '12'::character varying, '13'::character varying, '14'::character varying, '00'::character varying]::text[])))
        )
 SELECT req_nbpav.id,
    req_nbpav.nb_pav_verre,
    req_nblieu.nb_lieu_verre
   FROM req_nbpav,
    req_nblieu
  WHERE req_nbpav.id = req_nblieu.id;

COMMENT ON VIEW x_apps.xapps_an_dec_pav_chiffre_cle_tab
    IS 'Vue alphanumérique présentant les chiffrss clés sur les PAV Verre';

											    
/* -------------------------------------------------------- xapps_an_dec_pav_chiffre_cle_commune_tab ------------------------------------------- */
											    
-- View: x_apps.xapps_an_dec_pav_chiffre_cle_commune_tab

-- DROP VIEW x_apps.xapps_an_dec_pav_chiffre_cle_commune_tab;

CREATE OR REPLACE VIEW x_apps.xapps_an_dec_pav_chiffre_cle_commune_tab
 AS
 WITH req_nbpav AS (
         SELECT l.insee,
            l.commune,
            count(*) AS nb_pav_verre
           FROM m_dechet.an_dec_pav_cont c,
            m_dechet.geo_dec_pav_lieu l
          WHERE c.idlieu = l.idlieu AND (c.eve::text = ANY (ARRAY['10'::character varying::text, '11'::character varying::text, '12'::character varying::text, '13'::character varying::text, '14'::character varying::text, '00'::character varying::text]))
          GROUP BY l.insee, l.commune
        ), req_nblieu AS (
         SELECT l.insee,
            l.commune,
            count(*) AS nb_lieu_verre
           FROM m_dechet.geo_dec_pav_lieu l
          WHERE l.statut::text = '10'::text AND (l.idlieu IN ( SELECT an_dec_pav_cont.idlieu
                   FROM m_dechet.an_dec_pav_cont
                  WHERE an_dec_pav_cont.eve::text = ANY (ARRAY['10'::character varying::text, '11'::character varying::text, '12'::character varying::text, '13'::character varying::text, '14'::character varying::text, '00'::character varying::text])))
          GROUP BY l.insee, l.commune
        )
 SELECT g.insee,
    g.libgeo,
    req_nbpav.nb_pav_verre,
    req_nblieu.nb_lieu_verre
   FROM r_administratif.an_geo g
     LEFT JOIN req_nbpav ON g.insee::text = req_nbpav.insee::text
     LEFT JOIN req_nblieu ON g.insee::text = req_nblieu.insee::text
  WHERE g.epci::text = '200067965'::text
  ORDER BY g.insee;

COMMENT ON VIEW x_apps.xapps_an_dec_pav_chiffre_cle_commune_tab
    IS 'Vue alphanumérique présentant les chiffres clés sur les PAV Verre à la commune';


											    
											    
/* -------------------------------------------------------- xapps_an_dec_pav_eve_tab ------------------------------------------- */
                                                                                               
 -- View: x_apps.xapps_an_dec_pav_eve_tab

-- DROP VIEW x_apps.xapps_an_dec_pav_eve_tab;

CREATE OR REPLACE VIEW x_apps.xapps_an_dec_pav_eve_tab
 AS
 SELECT c.idcont,
    c.idlieu,
    c.eve,
    e.valeur AS nom_eve,
    c.date_eve,
    to_char(c.date_eve, 'YYYY'::text)::integer AS annee_eve,
    c.obs_eve,
    (
        CASE
            WHEN l.adresse IS NULL THEN ''::character varying
            ELSE l.adresse
        END::text ||
        CASE
            WHEN l.localisation IS NULL THEN ''::character varying::text
            ELSE ' '::text || l.localisation::text
        END) ||
        CASE
            WHEN l.commune IS NULL THEN ''::text
            ELSE ' à '::text || l.commune::text
        END AS lieu
   FROM m_dechet.an_dec_pav_cont c,
    m_dechet.lt_pav_eve e,
    m_dechet.geo_dec_pav_lieu l
  WHERE c.eve::text = e.code::text AND l.idlieu = c.idlieu AND c.eve::text <> '10'::text;

COMMENT ON VIEW x_apps.xapps_an_dec_pav_eve_tab
    IS 'Vue alphanumérique présentant les évènements par année des mouvements de PAV Verre';

                                                                                            
/* -------------------------------------------------------- xapps_geo_dec_pav_verre ------------------------------------------- */
                                                                                            
-- View: x_apps.xapps_geo_dec_pav_verre

-- DROP VIEW x_apps.xapps_geo_dec_pav_verre;

CREATE OR REPLACE VIEW x_apps.xapps_geo_dec_pav_verre
 AS
 SELECT l.idlieu AS id_contver,
    l.commune,
    l.quartier,
    l.adresse,
	l.idlieu,
	l.statut,
	string_agg(c.idcont::text,', ' order by idcont) as idcont,
    count(*) AS cont_nbr,
    c.date_effet,
    l.geom
   FROM m_dechet.geo_dec_pav_lieu l,
    m_dechet.an_dec_pav_cont c
  WHERE l.idlieu = c.idlieu AND (l.idlieu IN ( SELECT an_dec_pav_cont.idlieu
           FROM m_dechet.an_dec_pav_cont
          WHERE an_dec_pav_cont.eve::text = ANY (ARRAY['10'::character varying::text, '11'::character varying::text, '12'::character varying::text, '13'::character varying::text, '14'::character varying::text, '00'::character varying::text]))) AND c.date_effet <= now()
  GROUP BY l.idlieu, l.commune, l.quartier, l.adresse, c.date_effet
  ORDER BY l.idlieu;

COMMENT ON VIEW x_apps.xapps_geo_dec_pav_verre
    IS 'Vue géographique présentant les données des lieux de collecte (actif) à usage de Verre (pour cartographie dans QGIS)';
