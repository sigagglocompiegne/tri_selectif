/*TRI SELECTIF V1.0*/
/*Creation du schéma qui va accueillir la structure des données */
/* tri_10_schema.sql */
/*PostGIS*/

/* Propriétaire : GeoCompiegnois - http://geo.compiegnois.fr/ */
/* Auteur : Grégory Bodet */


-- #################################################################### SCHEMA  ####################################################################

-- Schema: m_dechet

-- DROP SCHEMA m_dechet;

CREATE SCHEMA m_dechet
  AUTHORIZATION sig_create;
  
COMMENT ON SCHEMA m_dechet
  IS 'Données métiers sur le thème des déchets et du recyclage';
