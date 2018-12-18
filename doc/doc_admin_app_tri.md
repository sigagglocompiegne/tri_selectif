![picto](img/Logo_web-GeoCompiegnois.png)

# Documentation d'administration de l'application TRI SELECTIF #

# Généralité

* Statut
  - [x] à rédiger
  - [ ] en cours de rédaction
  - [ ] relecture
  - [ ] finaliser
  - [ ] révision

|Défense incendie||x|x|x|x|xapps_geo_v_pei_ctr|Point d'Eau Incendie|||x||||style|1/120000-1/140000|pei_picto_[].svg selon la catégorie,taille 16|Interactivité avec le champ calculé affiche_info_bulle|
|||||||xapps_geo_v_pei_ctr|Point d'Eau Incendie||x|x|x|||style|0-1/20000|pei_picto_[].svg selon la catégorie,taille 35|Interactivité avec le champ calculé affiche_info_bulle|
|||||||xapps_geo_v_pei_zonedefense|Zone de défense publique||x|x|||x||0-1/25000|Fond #BBBBBB 5% d'opacité et contour #343434 4ème symbole de tiret épaisseur 1||
|||||||xapps_geo_zone_gestion|Zone de gestion||x||x|||gest||Fond #6699BB 25% opaque et coutour noir pour ARC, Fond #FFFABB 25% opaque et coutour noir pour Compiègne|Interactivité avec le champ calculé affiche_info_bulle|
|Foncier||x||x||geo_v_fon_proprio_pu_arc|Propriétés institutionnelles|x|x||x||x|||Cf carte CADASTRE||
|Limites administratives||x|x|x||geo_v_osm_commune_apc|Limites communales|x|x|x|||x|||Cf Navigateur cartographique (sauf épaisseur contour à 2||
|||||||geo_adm_quartier|Quartiers de Compiègne|x|x|x|||x||0 - 1/70000|Cf Navigateur cartographique (sauf épaisseur contour à 2||
|Cadastre|||x|||Parcelle (V3)|Parcelles V3|||||||||Cf carte CADASTRE||

# L'application

* Généralités :

|Gabarit|Thème|Modules spé|Impression|Résultats|
|:---|:---|:---|:---|:---|
|Pro|Thème GeoCompiegnois 1.0.7|Partage de lien, Introduction, Coordonnées au survol, StreetView, Export Géotables (générique geotable de l'apps, Export Fonctionnalités (générique de fonctions de l'apps), GeoCadastre (V3),Google Analytics,Page de connexion perso, javascript|A4 - Portrait et A4 - Paysage+légende||

* Particularité de certains modules :
  * Module introduction : ce menu s'ouvre automatiquement à l'ouverture de l'application grâce un code dans le module javascript. Ce module contient une introduction sur l'application, et des liens vers des fiches d'aide.
  * Module javacript : 
  `var injector = angular.element('body').injector();
var acfApplicationService = injector.get('acfApplicationService');
acfApplicationService.whenLoaded(setTimeout(function(){
$(".sidepanel-item.launcher-application").click();
}, 100));`
  * Module Google Analytics : le n° ID est disponible sur le site de Google Analytics
  * Module Export Fonctionnalité : ce module permet l'export des données issues des recherches

* Recherche globale :

|Noms|Tri|Nb de sugggestion|Texte d'invite|
|:---|:---|:---|:---|
|Recherche dans la Base Adresse Locale,Recherche d'une voie|alpha|20|Rechercher une adresse ou une une voie|

* Carte : `DECI`

Comportement au clic : (dés)active uniquement l'item cliqué
Liste des recherches : PEI par référence

* Fonds de plan :

|Nom|Au démarrage|opacité|
|:---|:---|:---|
|Cadastre||100%|
|Plan de ville||100%|
|Photographie aérienne 2013|x|70%|

* Fonctionnalités

|Groupe|Nom|
|:---|:---|
|Rechercher un PEI||
||PEI par référence|
||PEI public par disponibilité pour la DECI|
||PEI par date de contrôle|
||PEI par gestionnaire|
||PEI par état d'actualité|
||PEI par caractéristiques techniques|
||PEI par commune|
||PEI par par contrat|
|Ajouter ou déplacer un PEI||
|Recherche cadastrale||
||Parcelles par référence|
||Parcelles par adresse fiscale|
||Parcelles par nom du propriétaire|
||Parcelles multicritères|
||Parcelles par nom du propriétaire d'un local|
||Parcelles par surface|
|Recherche avancée d'une adresse||
||Recherche avancée d'une adresse|
|Recherche avancée d'une voie||
||Recherche avancée d'une voie|
