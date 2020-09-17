![picto](/doc/img/geocompiegnois_2020_reduit_v2.png)

# Standard local des Points d'Apport Volontaire Verre

Ensemble des éléments constituant la mise en oeuvre de la base de données sur le tri sélectif ainsi que l'exploitation des données dans l'application dédiée :

# Script d'initialisation de la base de données

## Changelog

- 02/01/2021 : description initiale du gabarit de production de l'inventaire du réseau pluvial

## Scripts SQL 

  * [Création de la structure initiale](sql/tri_10_squelette.sql)
  * [Création des vues de gestion](sql/tri_20_vues_gestion.sql)
  * [Création des vues applicatives](sql/tri_21_vues_xapps.sql)
  * [Création des vues applicatives gd public](sql/tri_22_vues_xapps_public.sql)
  * [Création des vues open data](sql/tri_23_vues_xopendata.sql)
  * [Création des privilèges](sql/tri_99_grant.sql)
