![picto](/doc/img/geocompiegnois_2020_reduit_v2.png)

# Standard local des Points d'Apport Volontaire Verre

Spécification du fichier d’échange relatif aux données concernant la  localisation géographique des lieux de collecte et les caractéristiques patrimoniales des Points d'Apport Volontaire Verre sur le territoire de l'Agglomération de la Région de Compiègne. La localisation et les caractéristiques patrimoniales des Points d'Apport Volontaire TLC (textile-linge-chaussure) ne sont pas considérés comme partis prenante du standard même si ils sont renseignés indépendant, le service n'en assure pas la gestion.

## Contexte

L’ARC est engagée dans un plan de modernisation numérique pour l’exercice de ses missions de services publics. L’objectif poursuivi vise à permettre à la collectivité de se doter d’outil d’aide à la décision et d’optimiser l’organisation de ses services. Ces objectifs se déclinent avec la mise en place d’outils informatiques adaptés au quotidien des services et le nécessaire retour auprès de la collectivité, des informations (données) produites et gérées par ses prestataires. 

L’ARC privilégie donc une organisation dans laquelle l’Interface Homme Machine (IHM) du métier assure l’alimentation d’un entrepôt de données territoriales. Cette stratégie « agile » permet de répondre au plus près des besoins des services dans une trajectoire soutenable assurant à la fois une bonne maitrise des flux d’information et un temps d’acculturation au sein de l’organisation.

## Voir aussi

- Fichier gabarit à télécharger au format csv (non géographique)
- Fichier gabarit Qgis complet à télécharger

## Jeu de données consolidé

Vous pouvez retrouver le jeu de données résultant de cette consolidation sur le catalogue GéoCompiégnois en cliquant [ici](https://geo.compiegnois.fr/geonetwork/srv/fre/catalog.search#/metadata/8a57fbfa-6ab3-41f4-b5cd-916554cbfd4f).

Ensemble des éléments constituant la mise en oeuvre de la base de données sur le tri sélectif ainsi que l'exploitation des données dans l'application dédiée :
- Script d'initialisation de la base de données
  * [Suivi des modifications](sql/tri_00_trace.sql)
  * [Création de la structure initiale](sql/tri_10_squelette.sql)
  * [Création des vues de gestion](sql/tri_20_vues_gestion.sql)
  * [Création des vues applicatives](sql/tri_21_vues_xapps.sql)
  * [Création des vues applicatives gd public](sql/tri_22_vues_xapps_public.sql)
  * [Création des vues open data](sql/tri_23_vues_xopendata.sql)
  * [Création des privilèges](sql/tri_99_grant.sql)
- [Documentation d'administration de la base](doc/doc_admin_bd_tri.md)
- [Documentation d'administration de l'application TRI SELECTIF](doc/doc_admin_app_tri.md)
- [Documentation utilisateur de l'application](doc/doc_user_app_tri.md)
