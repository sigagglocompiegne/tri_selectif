![picto](img/Logo_web-GeoCompiegnois.png)

# Documentation d'administration de l'application TRI SELECTIF #

# Généralité

* Statut
  - [x] à rédiger
  - [ ] en cours de rédaction
  - [ ] relecture
  - [ ] finaliser
  - [ ] révision

* Historique des versions

|Date | Auteur | Description
|:---|:---|:---|
|18/12/2018|Grégory Bodet|version initiale|


# Généralité

|Représentation| Nom de l'application |Résumé|
|:---|:---|:---|
|![picto](/doc/img/tri_selectif_bleu.png)|Tri sélectif|Cette application est dédiée à la gestion et la consultation des PAV (Points dd'apport volontaire Verre et TLC).|

# Accès

|Public|Métier|Accès restreint|
|:-:|:-:|:---|
||X|Accès réservé aux personnels gestionnaires des données.|

# Droit par profil de connexion

* **Prestataires**

|Fonctionnalités|Lecture|Ecriture|Précisions|
|:---|:-:|:-:|:---|

Sans objet

* **Personnes du service métier**

|Fonctionnalités|Lecture|Ecriture|Précisions|
|:---|:-:|:-:|:---|
|Toutes|x||L'ensemble des fonctionnalités (recherches, cartographie, fiches d'informations, ...) sont accessibles par tous les utilisateurs connectés.|
|Conteneur à verre ou tlc (édition)|x|x|Peut modifier les données des PAV.|
|Conteneur à verre ou tlc |x||Fiche d'information tous utilisateurs en consultation.|
|Modification géométrique - Conteneur Verre ou textile|x||Cette fonctionnalité est uniquement visible par les utilisateurs inclus dans les groupes PAV_EDIT.|

* **Autres profils**

Sans objet

# Les données

Sont décrites ici les Géotables et/ou Tables intégrées dans GEO pour les besoins de l'application. Les autres données servant d'habillage (pour la cartographie ou les recherches) sont listées dans les autres parties ci-après. Le tableau ci-dessous présente uniquement les changements (type de champ, formatage du résultat, ...) ou les ajouts (champs calculés, filtre, ...) non présents dans la donnée source. 

## GeoTable : `geo_dec_pav_verre`

|Attributs| Champ calculé | Formatage |Renommage|Particularité/Usage|Utilisation|Exemple|
|:---|:-:|:-:|:---|:---|:---|:---|
|affiche_result |x|x||Formate le contenu affiché dans le menu Résultat|Résultat de recherche|Conteneur à verre n° {id_contver}|
|info_bulle  |x|x||Composition de l'info bulle affiché au passage sur le PAV|Cartographie|{affiche_result} {adresse}|

|ame_acces  |||Accessibilité à revoir|Booléen oui/non|Fiche d'information Conteneur à Verre||
|cont_mat   |||Matériau|Liste de domaine  valeur_pav_contmat|Fiche d'information Conteneur à Verre||
|cont_nbr    |||Nombre de conteneur(s)||Fiche d'information Conteneur à Verre||
|cont_pos     |||Position|Liste de domaine  valeur_pav_contpos|Fiche d'information Conteneur à Verre||
|crochet      |||Etat du crochet|Liste de domaine  valeur_pav_crochet|Fiche d'information Conteneur à Verre||
|date_effet  |||Prise en compte dans le plan interactif||Fiche d'information Conteneur à Verre||
|date_maj   |||Date de mise à jour||Fiche d'information Conteneur à Verre||
|date_net    |||Date de nettoyage||Fiche d'information Conteneur à Verre||
|date_pos     |||Date de pose||Fiche d'information Conteneur à Verre||
|date_sai     |||Date de saisie||Fiche d'information Conteneur à Verre||
|def_struc      |||Défaut de structure visible||Fiche d'information Conteneur à Verre||
|env_implan       |||Type d'espace urbain d'implantation|Liste de domaine  valeur_pav_envimplan|Fiche d'information Conteneur à Verre||
|env_situ       |||Situation domaniale|Liste de domaine  valeur_pav_envsitu|Fiche d'information Conteneur à Verre||
|env_type       |||Type d'environnement|Liste de domaine  valeur_pav_envtype|Fiche d'information Conteneur à Verre||
|etat_sign      |||Etat de la signalétique|Liste de domaine   Valeur PAV Etat signalétique|Fiche d'information Conteneur à Verre||
|hab_pav       |||Tonnage par gisement d'habitants||Fiche d'information Conteneur à Verre||
|id_contver        |||Identifiant||Fiche d'information Conteneur à Verre||
|insee         |||Code Insee||Fiche d'information Conteneur à Verre||
|mode_preh          |||Mode de préhension|Liste de domaine   valeur_pav_modepreh|Fiche d'information Conteneur à Verre||
|nat_pb           |||Nature du problème|Liste de domaine   valeur_pav_natpb|Fiche d'information Conteneur à Verre||
|nat_pb_99            |||Autre problème||Fiche d'information Conteneur à Verre||
|observ             |||Observation(s)||Fiche d'information Conteneur à Verre||
|op_sai             |||Opérateur de saisie||Fiche d'information Conteneur à Verre||
|opercules              |||Opercules||Fiche d'information Conteneur à Verre||
|opt_pav               |||Manque de PAV||Fiche d'information Conteneur à Verre|| 
|pavorient                ||||Liste de domaine Valeur PAV Orientation|Fiche d'information Conteneur à Verre|| 
|peinture                 |||Etat de la peinture|Liste de domaine valeur_pav_peinture|Fiche d'information Conteneur à Verre|| 
|photo                  |||Nom du fichier photo||Fiche d'information Conteneur à Verre|| 
|prop_abor                   |||Etat de propreté des abords|Liste de domaine   valeur_pav_proprete_abor|Fiche d'information Conteneur à Verre|| 
|proprete                    |||Etat de propreté|Liste de domaine   valeur_pav_proprete|Fiche d'information Conteneur à Verre|| 
|prox_corb                     |||Présence d'une corbeille à proximité|Booléen oui/non|Fiche d'information Conteneur à Verre|| 
|src_geom                     |||Référentiel spatial||Fiche d'information Conteneur à Verre|| 
|statut                     ||||Liste de domaine    Valeur PAV Statut |Fiche d'information Conteneur à Verre||  


   * filtres :

|Nom|Attribut| Au chargement | Type | Condition |Valeur|Description|
|:---|:---|:-:|:---:|:---:|:---|:---|
|PEI_SECU_PRESTA|id_contrat|x|Alphanumérique|est égale à une valeur de contaxte|id_presta|Permet de filtrer l'affichage des PEI en fonction des contrats affectés au profil de connexion du ou des prestataires|
|DECI_SECU|insee|x|Alphanumérique|est égale à une valeur de contaxte|ccocom|Permet de filtrer l'affichage des PEI en fonction des communes autorisées pour chaque profil de connexion EPCI|
   
   * relations :

|Géotables ou Tables| Champs de jointure | Type |
|:---|:---|:---|
| xapps_geo_v_pei_ctr_erreur |id_pei| 0..1 (égal) |

   * particularité(s) : aucune

## GeoTable : `xapps_geo_v_pei_zonedefense`

|Attributs| Champ calculé | Formatage |Renommage|Particularité/Usage|Utilisation|Exemple|
|:---|:-:|:-:|:---|:---|:---|:---|

Sans objet

   * filtres :

|Nom|Attribut| Au chargement | Type | Condition |Valeur|Description|
|:---|:---|:-:|:---:|:---:|:---|:---|
|PEI_SECU_PRESTA|id_contrat|x|Alphanumérique|est égale à une valeur de contaxte|id_presta|Permet de filtrer l'affichage des PEI en fonction des contrats affectés au profil de connexion du ou des prestataires|
|DECI_SECU|insee|x|Alphanumérique|est égale à une valeur de contaxte|ccocom|Permet de filtrer l'affichage des PEI en fonction des communes autorisées pour chaque profil de connexion EPCI|

   * relations : aucune

   * particularité(s) : aucune
   
  
## Table : `xapps_geo_v_pei_ctr_erreur`

|Attributs| Champ calculé | Formatage |Renommage|Particularité/Usage|Utilisation|Exemple|
|:---|:-:|:-:|:---|:---|:---|:---|
|affiche_message    |x|x|null|Formate en HTML le message à afficher dans la fiche d'information en cas d'erreur selon un temps définit (évite un affichage permanent du message)|Fiche d'information PEI|`CASE WHEN extract(epoch from  now()::timestamp) - extract(epoch from {horodatage}::timestamp) <= 3 then '<table width=100%><td bgcolor="#FF000"> <font size=4 color="#ffffff"><center><b>' {erreur} '</b></center></font></td></table>' ELSE '' END`|


   * filtres : aucun
   * relations : aucune
   * particularité(s) : aucune
   


# Les fonctionnalités

Sont présentées ici uniquement les fonctionnalités spécifiques à l'application.

## Recherche globale : `Recherche dans la Base Adresse Locale`

Cette recherche permet à l'utilisateur de faire une recherche libre sur une adresse.

Cette recherche a été créée pour l'application RVA. Le détail de celle-ci est donc à visualiser dans le répertoire GitHub rva au niveau de la documentation applicative.

## Recherche globale : `Recherche d'une voie`

Cette recherche permet à l'utilisateur de faire une recherche libre sur le libellé d'une voie.

Cette recherche a été créée pour l'application RVA. Le détail de celle-ci est donc à visualiser dans le répertoire GitHub rva au niveau de la documentation applicative.
 

## Recherche (clic sur la carte) : `PEI par référence`

Cette recherche permet à l'utilisateur de cliquer sur la carte et de remonter les informations du PEI.

  * Configuration :

Source : `xapps_geo_v_pei_ctr`

|Attribut|Afficher|Rechercher|Suggestion|Attribut de géométrie|Tri des résultats|
|:---|:-:|:-:|:-:|:-:|:-:|
|Résultat|x|||||
|Type|x|||||
|Commune|x|||||
|disponible_recherche|x|||||
|geom||||x||
|id_pei|||||x|

(la détection des doublons n'est pas activée ici)

 * Filtres :

|Groupe|Jointure|Filtres liés|
|:---|:-:|:-:|
|Groupe de filtres par défaut|`OU`||

|Nom|Obligatoire|Attribut|Condition|Valeur|Champ d'affichage (1)|Champ de valeurs (1)|Champ de tri (1)|Ajout autorisé (1)|Particularités|
|:---|:-:|:---|:---|:---|:---|:---|:---|:-:|:---|
|PEI identifiant||id_pei|Prédéfinis - Filtre à valeur saisie||||||Titre : Numéro de PEI|
|PEI identifiant||id_sdis|Prédéfinis - Filtre à valeur saisie||||||Titre : Référence SDIS|

(1) si liste de domaine

 * Fiches d'information active : Fiche d'information PEI
 
## Recherche : `Toutes les recherches cadastrales`

L'ensemble des recherches cadastrales ont été formatées et intégrées par l'éditeur via son module GeoCadastre.
Seul le nom des certaines recherches a été modifié par l'ARC pour plus de compréhension des utilisateurs.

Cette recherche est détaillée dans le répertoire GitHub `docurba`.


## Recherche : `PEI public par disponibilité pour la DECI`

Cette recherche permet à l'utilisateur de faire une recherche guidée sur un PEI public en fonction de sa disponibilité pour la DECI.

  * Configuration :

Source : `xapps_geo_v_pei_ctr`

|Attribut|Afficher|Rechercher|Suggestion|Attribut de géométrie|Tri des résultats|
|:---|:-:|:-:|:-:|:-:|:-:|
|Résultat|x|||||
|Type|x|||||
|Commune|x|||||
|disponible_recherche|x|||||
|geom||||x||
|id_pei|||||x|

(la détection des doublons n'est pas activée ici)

 * Filtres :

|Groupe|Jointure|Filtres liés|
|:---|:-:|:-:|
|Groupe de filtres par défaut|`ET`||

|Groupe|Jointure|Filtres liés|
|:---|:-:|:-:|
|Groupe de filtres par défaut|`ET`|x|

|Nom|Obligatoire|Attribut|Condition|Valeur|Champ d'affichage (1)|Champ de valeurs (1)|Champ de tri (1)|Ajout autorisé (1)|Particularités|
|:---|:-:|:---|:---|:---|:---|:---|:---|:-:|:---|
|PEI disponible|x|disponible|Prédéfinis - Filtre à liste de choix||||||Titre : PEI disponible pour la DECI|
|PEI public||statut|Alphanumérique la valeur est égale à une valeur par défaut|00,01||||||

|Groupe|Jointure|Filtres liés|
|:---|:-:|:-:|
|Groupe de filtres par défaut|`ET`|x|

|Nom|Obligatoire|Attribut|Condition|Valeur|Champ d'affichage (1)|Champ de valeurs (1)|Champ de tri (1)|Ajout autorisé (1)|Particularités|
|:---|:-:|:---|:---|:---|:---|:---|:---|:-:|:---|
|PEI par EPCI||epci|Prédéfinis - Filtre à liste de choix||||||Titre : Nom de l'EPCI|
|PEI par commune||commune|Prédéfinis - Filtre à liste de choix||||||Titre : Nom de la commune|

(1) si liste de domaine

 * Fiches d'information active : Fiche d'information PEI
 
## Recherche : `PEI par date de contrôle`

Cette recherche permet à l'utilisateur de faire une recherche guidée sur un PEI en fonction d'une période de contrôle et d'un découpage administratif ou par rapport au gestionnaire ou d'un contrat.

  * Configuration :

Source : `xapps_geo_v_pei_ctr`

|Attribut|Afficher|Rechercher|Suggestion|Attribut de géométrie|Tri des résultats|
|:---|:-:|:-:|:-:|:-:|:-:|
|Résultat|x|||||
|Type|x|||||
|Commune|x|||||
|disponible_recherche|x|||||
|geom||||x||
|id_pei|||||x|

(la détection des doublons n'est pas activée ici)

 * Filtres :

|Groupe|Jointure|Filtres liés|
|:---|:-:|:-:|
|Groupe de filtres par défaut|`ET`||

|Groupe|Jointure|Filtres liés|
|:---|:-:|:-:|
|Groupe de filtres par défaut|`ET`|x|

|Nom|Obligatoire|Attribut|Condition|Valeur|Champ d'affichage (1)|Champ de valeurs (1)|Champ de tri (1)|Ajout autorisé (1)|Particularités|
|:---|:-:|:---|:---|:---|:---|:---|:---|:-:|:---|
|PEI par date de contrôle|x|date_ct|Alphanumérique la valeur est comprise entre une valeur 1 saisie||||||Titre invite 1 : Dernier controle effectué entre et Titre invite 2 : et|


|Groupe|Jointure|Filtres liés|
|:---|:-:|:-:|
|Groupe de filtres par défaut|`ET`|x|

|Nom|Obligatoire|Attribut|Condition|Valeur|Champ d'affichage (1)|Champ de valeurs (1)|Champ de tri (1)|Ajout autorisé (1)|Particularités|
|:---|:-:|:---|:---|:---|:---|:---|:---|:-:|:---|
|PEI par EPCI||epci|Prédéfinis - Filtre à liste de choix||||||Titre : Nom de l'EPCI|
|PEI par commune||commune|Prédéfinis - Filtre à liste de choix||||||Titre : Nom de la commune|

|Groupe|Jointure|Filtres liés|
|:---|:-:|:-:|
|Groupe de filtres par défaut|`ET`||

|Nom|Obligatoire|Attribut|Condition|Valeur|Champ d'affichage (1)|Champ de valeurs (1)|Champ de tri (1)|Ajout autorisé (1)|Particularités|
|:---|:-:|:---|:---|:---|:---|:---|:---|:-:|:---|
|PEI gestionnaire||gestion|Prédéfinis à liste de choix||||||Titre : Gestionnaire du PEI|

|Groupe|Jointure|Filtres liés|
|:---|:-:|:-:|
|Groupe de filtres par défaut|`ET`||

|Nom|Obligatoire|Attribut|Condition|Valeur|Champ d'affichage (1)|Champ de valeurs (1)|Champ de tri (1)|Ajout autorisé (1)|Particularités|
|:---|:-:|:---|:---|:---|:---|:---|:---|:-:|:---|
|PEI Contrat||id_contrat|Alphanumérique la valeur est égale à une valeur de liste de choix |lt_pei_id_contrat|valeur|code|valeur|x|Titre : N° de contrat et filtre non utilisable par le ou les prestataire(s)|

(1) si liste de domaine

 * Fiches d'information active : Fiche d'information PEI

## Recherche : `PEI par gestionnaire`

Cette recherche permet à l'utilisateur de faire une recherche guidée sur un PEI en fonciton du gestionnaire et du découpage administratif.

  * Configuration :

Source : `xapps_geo_v_pei_ctr`

|Attribut|Afficher|Rechercher|Suggestion|Attribut de géométrie|Tri des résultats|
|:---|:-:|:-:|:-:|:-:|:-:|
|Résultat|x|||||
|Type|x|||||
|Commune|x|||||
|disponible_recherche|x|||||
|geom||||x||
|id_pei|||||x|

(la détection des doublons n'est pas activée ici)

 * Filtres :

|Groupe|Jointure|Filtres liés|
|:---|:-:|:-:|
|Groupe de filtres par défaut|`ET`|x|

|Groupe|Jointure|Filtres liés|
|:---|:-:|:-:|
|Groupe de filtres par défaut|`ET`|x|

|Nom|Obligatoire|Attribut|Condition|Valeur|Champ d'affichage (1)|Champ de valeurs (1)|Champ de tri (1)|Ajout autorisé (1)|Particularités|
|:---|:-:|:---|:---|:---|:---|:---|:---|:-:|:---|
|PEI par EPCI|x|epci|Prédéfinis - Filtre à liste de choix||||||Titre : Nom de l'EPCI|
|PEI par commune||commune|Prédéfinis - Filtre à liste de choix||||||Titre : Nom de la commune|

|Groupe|Jointure|Filtres liés|
|:---|:-:|:-:|
|Groupe de filtres par défaut|`ET`||

|Nom|Obligatoire|Attribut|Condition|Valeur|Champ d'affichage (1)|Champ de valeurs (1)|Champ de tri (1)|Ajout autorisé (1)|Particularités|
|:---|:-:|:---|:---|:---|:---|:---|:---|:-:|:---|
|PEI gestionnaire|x|gestion|Prédéfinis à liste de choix||||||Titre : Gestionnaire du PEI|

(1) si liste de domaine

 * Fiches d'information active : Fiche d'information PEI
 
 ## Recherche : `PEI par état d'actualité`

Cette recherche permet à l'utilisateur de faire une recherche guidée sur un PEI par son état d'actualité et un découpage adminsitratif.

  * Configuration :

Source : `xapps_geo_v_pei_ctr`

|Attribut|Afficher|Rechercher|Suggestion|Attribut de géométrie|Tri des résultats|
|:---|:-:|:-:|:-:|:-:|:-:|
|Résultat|x|||||
|Type|x|||||
|Commune|x|||||
|disponible_recherche|x|||||
|geom||||x||
|id_pei|||||x|

(la détection des doublons n'est pas activée ici)

 * Filtres :

|Groupe|Jointure|Filtres liés|
|:---|:-:|:-:|
|Groupe de filtres par défaut|`ET`||


|Groupe|Jointure|Filtres liés|
|:---|:-:|:-:|
|Groupe de filtres par défaut|`ET`|x|

|Nom|Obligatoire|Attribut|Condition|Valeur|Champ d'affichage (1)|Champ de valeurs (1)|Champ de tri (1)|Ajout autorisé (1)|Particularités|
|:---|:-:|:---|:---|:---|:---|:---|:---|:-:|:---|
|PEI par état d'actualité|x|etat_pei|Prédéfinis à liste de choix||||||Titre : Etat d'actualité du PEI|

|Groupe|Jointure|Filtres liés|
|:---|:-:|:-:|
|Groupe de filtres par défaut|`ET`|x|

|Nom|Obligatoire|Attribut|Condition|Valeur|Champ d'affichage (1)|Champ de valeurs (1)|Champ de tri (1)|Ajout autorisé (1)|Particularités|
|:---|:-:|:---|:---|:---|:---|:---|:---|:-:|:---|
|PEI par EPCI||epci|Prédéfinis - Filtre à liste de choix||||||Titre : Nom de l'EPCI|
|PEI par commune||commune|Prédéfinis - Filtre à liste de choix||||||Titre : Nom de la commune|


(1) si liste de domaine

 * Fiches d'information active : Fiche d'information PEI
 
## Recherche : `PEI par caractéristiques techniques`

Cette recherche permet à l'utilisateur de faire une recherche guidée sur un PEI par ses caractéristiques techniques et un découpage adminsitratif.

  * Configuration :

Source : `xapps_geo_v_pei_ctr`

|Attribut|Afficher|Rechercher|Suggestion|Attribut de géométrie|Tri des résultats|
|:---|:-:|:-:|:-:|:-:|:-:|
|Résultat|x|||||
|Type|x|||||
|Commune|x|||||
|disponible_recherche|x|||||
|geom||||x||
|id_pei|||||x|

(la détection des doublons n'est pas activée ici)

 * Filtres :

|Groupe|Jointure|Filtres liés|
|:---|:-:|:-:|
|Groupe de filtres par défaut|`ET`||


|Groupe|Jointure|Filtres liés|
|:---|:-:|:-:|
|Groupe de filtres par défaut|`ET`||

|Nom|Obligatoire|Attribut|Condition|Valeur|Champ d'affichage (1)|Champ de valeurs (1)|Champ de tri (1)|Ajout autorisé (1)|Particularités|
|:---|:-:|:---|:---|:---|:---|:---|:---|:-:|:---|
|PEI par type||type_pei|Prédéfinis à liste de choix||||||Titre : Type de PEI|
|PEI par diam_pei||diam_pei|Prédéfinis à liste de choix||||||Titre : Diamètre intérieur|
|PEI par source||source|Prédéfinis à liste de choix||||||Titre : Source du point d'eau|
|PEI par raccord||raccord|Prédéfinis à liste de choix||||||Titre : Raccords de sortie|
|PEI par marque||marque|Prédéfinis à liste de choix||||||Titre : Marque du matériel|

|Groupe|Jointure|Filtres liés|
|:---|:-:|:-:|
|Groupe de filtres par défaut|`ET`|x|

|Nom|Obligatoire|Attribut|Condition|Valeur|Champ d'affichage (1)|Champ de valeurs (1)|Champ de tri (1)|Ajout autorisé (1)|Particularités|
|:---|:-:|:---|:---|:---|:---|:---|:---|:-:|:---|
|PEI par EPCI||epci|Prédéfinis - Filtre à liste de choix||||||Titre : Nom de l'EPCI|
|PEI par commune||commune|Prédéfinis - Filtre à liste de choix||||||Titre : Nom de la commune|

|Groupe|Jointure|Filtres liés|
|:---|:-:|:-:|
|Groupe de filtres par défaut|`ET`|x|

|Nom|Obligatoire|Attribut|Condition|Valeur|Champ d'affichage (1)|Champ de valeurs (1)|Champ de tri (1)|Ajout autorisé (1)|Particularités|
|:---|:-:|:---|:---|:---|:---|:---|:---|:-:|:---|
|PEI gestionnaire||gestion|Prédéfinis à liste de choix||||||Titre : Gestionnaire du PEI|

|Groupe|Jointure|Filtres liés|
|:---|:-:|:-:|
|Groupe de filtres par défaut|`ET`|x|

|Nom|Obligatoire|Attribut|Condition|Valeur|Champ d'affichage (1)|Champ de valeurs (1)|Champ de tri (1)|Ajout autorisé (1)|Particularités|
|:---|:-:|:---|:---|:---|:---|:---|:---|:-:|:---|
|PEI Contrat||id_contrat|Alphanumérique la valeur est égale à une valeur de liste de choix |lt_pei_id_contrat|valeur|code|valeur|x|Titre : N° de contrat et filtre non utilisable par le ou les prestataire(s)|

(1) si liste de domaine

 * Fiches d'information active : Fiche d'information PEI
 
## Recherche : `PEI par commune`

Cette recherche permet à l'utilisateur de faire une recherche guidée sur un PEI par sa commune de positionnement.

  * Configuration :

Source : `xapps_geo_v_pei_ctr`

|Attribut|Afficher|Rechercher|Suggestion|Attribut de géométrie|Tri des résultats|
|:---|:-:|:-:|:-:|:-:|:-:|
|Résultat|x|||||
|Type|x|||||
|Commune|x|||||
|disponible_recherche|x|||||
|geom||||x||
|id_pei|||||x|

(la détection des doublons n'est pas activée ici)

 * Filtres :

|Groupe|Jointure|Filtres liés|
|:---|:-:|:-:|
|Groupe de filtres par défaut|`ET`|x|


|Groupe|Jointure|Filtres liés|
|:---|:-:|:-:|
|Groupe de filtres par défaut|`ET`|x|

|Nom|Obligatoire|Attribut|Condition|Valeur|Champ d'affichage (1)|Champ de valeurs (1)|Champ de tri (1)|Ajout autorisé (1)|Particularités|
|:---|:-:|:---|:---|:---|:---|:---|:---|:-:|:---|
|PEI par EPCI||epci|Prédéfinis - Filtre à liste de choix||||||Titre : Nom de l'EPCI|
|PEI par commune||commune|Prédéfinis - Filtre à liste de choix||||||Titre : Nom de la commune|

(1) si liste de domaine

 * Fiches d'information active : Fiche d'information PEI
 
 ## Recherche : `PEI par contrat`

Cette recherche permet à l'utilisateur de faire une recherche guidée sur un PEI par son contrat de contrôle.
Ce filtre n'est pas accessible au(x) prestataire(s).

  * Configuration :

Source : `xapps_geo_v_pei_ctr`

|Attribut|Afficher|Rechercher|Suggestion|Attribut de géométrie|Tri des résultats|
|:---|:-:|:-:|:-:|:-:|:-:|
|Résultat|x|||||
|Type|x|||||
|Commune|x|||||
|disponible_recherche|x|||||
|geom||||x||
|id_pei|||||x|

(la détection des doublons n'est pas activée ici)

 * Filtres :

|Nom|Obligatoire|Attribut|Condition|Valeur|Champ d'affichage (1)|Champ de valeurs (1)|Champ de tri (1)|Ajout autorisé (1)|Particularités|
|:---|:-:|:---|:---|:---|:---|:---|:---|:-:|:---|
|PEI Contrat|x|id_contrat|Alphanumérique la valeur est égale à une valeur de liste de choix |lt_pei_id_contrat|valeur|code|valeur|x|Titre : N° de contrat et filtre non utilisable par le ou les prestataire(s)|

(1) si liste de domaine

 * Fiches d'information active : Fiche d'information PEI

## Fiche d'information : `Fiche d'information PEI`

Source : `xapps_geo_v_pei_ctr`

* Statistique : aucune
 
 * Représentation :
 
|Mode d'ouverture|Taille|Agencement des sections|
|:---|:---|:---|
|dans le gabarit|530x650|Accordéon|

|Nom de la section|Attributs|Position label|Agencement attribut|Visibilité conditionnelle|Fichie liée|Ajout de données autorisé|
|:---|:---|:---|:---|:---|:---|:---|
|Général|affiche_message|masqué|Vertical||||

|Nom de la sous-section|Attributs|Position label|Agencement attribut|Visibilité conditionnelle|Fichie liée|Ajout de données autorisé|
|:---|:---|:---|:---|:---|:---|:---|
|(vide)|n° SDIS (id_sdis),Identifiant(id_pei),Verrou (verrou),Référence sur le terrain (ref_terr),Nom de l'EPCI (epci),Insee (insee),Commune (commune),Type (type_pei),Type dans le règlement départemental (type_rd),Situation (situation),Disponible (disponible_img),Etat (etat_pei)|à gauche|Vertical||||

|Nom de la section|Attributs|Position label|Agencement attribut|Visibilité conditionnelle|Fichie liée|Ajout de données autorisé|
|:---|:---|:---|:---|:---|:---|:---|
|Caractéristiques techniques|affiche_message|masqué|Vertical||||

|Nom de la sous-section|Attributs|Position label|Agencement attribut|Visibilité conditionnelle|Fichie liée|Ajout de données autorisé|
|:---|:---|:---|:---|:---|:---|:---|
|(vide)|Diamètre intérieur (diam_int),Raccord(raccord),Marque (marque),Source (source_pei),Date de mise en service (date_mes)|à gauche|Vertical||||


|Nom de la section|Attributs|Position label|Agencement attribut|Visibilité conditionnelle|Fichie liée|Ajout de données autorisé|
|:---|:---|:---|:---|:---|:---|:---|
|Mesures et contrôle|affiche_message|masqué|Vertical||||

|Nom de la sous-section|Attributs|Position label|Agencement attribut|Visibilité conditionnelle|Fichie liée|Ajout de données autorisé|
|:---|:---|:---|:---|:---|:---|:---|
|(vide)|Référence du contrat de sous-traitance (id_contrat)|à gauche|Vertical||||

|Nom de la sous-section|Attributs|Position label|Agencement attribut|Visibilité conditionnelle|Fichie liée|Ajout de données autorisé|
|:---|:---|:---|:---|:---|:---|:---|
|Mesure||à gauche|Vertical||||

|Nom de la sous-sous-section|Attributs|Position label|Agencement attribut|Visibilité conditionnelle|Fichie liée|Ajout de données autorisé|
|:---|:---|:---|:---|:---|:---|:---|
|(vide)|Press statique (press_stat),Pression dynamique (press_dyn),Débit (debit),Débit max (debit_max)|à gauche|Vertical|type_pei=='CI' et (type_pei=='PA' && source != 'CE')|||

|Nom de la sous-sous-section|Attributs|Position label|Agencement attribut|Visibilité conditionnelle|Fichie liée|Ajout de données autorisé|
|:---|:---|:---|:---|:---|:---|:---|
|(vide)|Volmume (press_stat),Débit de remplissage (press_dyn)|à gauche|Vertical|type_pei=='CI' et (type_pei=='PA' && source != 'CE')|||


|Nom de la sous-section|Attributs|Position label|Agencement attribut|Visibilité conditionnelle|Fichie liée|Ajout de données autorisé|
|:---|:---|:---|:---|:---|:---|:---|
|Anomalies|Absence d'anomalie|à gauche|Vertical||||


|Nom de la sous-sous-section|Attributs|Position label|Agencement attribut|Visibilité conditionnelle|Fichie liée|Ajout de données autorisé|
|:---|:---|:---|:---|:---|:---|:---|
|(vide)|Anomalie(s) (lt_anom)|à gauche|Vertical|etat_anom='f'|||

|Nom de la sous-section|Attributs|Position label|Agencement attribut|Visibilité conditionnelle|Fichie liée|Ajout de données autorisé|
|:---|:---|:---|:---|:---|:---|:---|
|Conformité|Accès conforme (etat_access), Signalisation conforme (etat_sign),Conformité technique (etat_conf),Date du dernier contrôle technique (date_ct),disponible pour la DECI (disponible)|à gauche|Vertical||||

|Nom de la sous-section|Attributs|Position label|Agencement attribut|Visibilité conditionnelle|Fichie liée|Ajout de données autorisé|
|:---|:---|:---|:---|:---|:---|:---|
|Opérateur|Opérateur du contrôle (ope_ct)|à gauche|Vertical||||

|Nom de la section|Attributs|Position label|Agencement attribut|Visibilité conditionnelle|Fichie liée|Ajout de données autorisé|
|:---|:---|:---|:---|:---|:---|:---|
|Gestion|affiche_message|masqué|Vertical||||

|Nom de la sous-section|Attributs|Position label|Agencement attribut|Visibilité conditionnelle|Fichie liée|Ajout de données autorisé|
|:---|:---|:---|:---|:---|:---|:---|
|(vide)|Statut (statut), Nom de l'établissement (nom_etab),Gestionnaire (gestion),Délégataire (delegat),Centre de secours de 1er appel (cs_sdis)|à gauche|Vertical||||

|Nom de la section|Attributs|Position label|Agencement attribut|Visibilité conditionnelle|Fichie liée|Ajout de données autorisé|
|:---|:---|:---|:---|:---|:---|:---|
|Qualité|affiche_message|masqué|Vertical||||

|Nom de la sous-section|Attributs|Position label|Agencement attribut|Visibilité conditionnelle|Fichie liée|Ajout de données autorisé|
|:---|:---|:---|:---|:---|:---|:---|
|(vide)|Observations (observ), Source de la donnée (src_pei),Photo (photo_url),Coordonnées X (L93) (x_l93),Coordonnées Y (L93) (y_l93), Référentiel géographique ()|à gauche|Vertical||||

|Nom de la sous-section|Attributs|Position label|Agencement attribut|Visibilité conditionnelle|Fichie liée|Ajout de données autorisé|
|:---|:---|:---|:---|:---|:---|:---|
|(vide)|Date du référentiel (src_date), Précision (prec)|à gauche|Vertical|src_geom != '00'|||

|Nom de la sous-section|Attributs|Position label|Agencement attribut|Visibilité conditionnelle|Fichie liée|Ajout de données autorisé|
|:---|:---|:---|:---|:---|:---|:---|
|(vide)|Opérateur de saisie (ope_sai), Date de saisie (date_sai), Date de mise à jour (date_maj)|à gauche|Vertical||||

* Saisie :

Sont présent ici uniquement les attributs éditables ou disposant d'un mode de représentation spécifique.

|Attribut|Obligatoire|Valeur par défaut|Liste de domaine|Représentation|
|:---|:---|:---|:---|:---|
|n° SDIS|||||
|Type|x|NR|lt_pei_type_pei|Liste de choix|
|Diamètre intérieur||NR|lt_pei_diam_pei|Liste de choix|
|Raccord ||00|lt_pei_raccord|Liste de choix|
|Marque ||00|lt_pei_marque|Liste de choix|
|Source ||NR|lt_pei_source|Liste de choix|
|Volume |||||
|Diamètre de canalisation|||||
|Etat|x|00|lt_pei_etat_pei|Liste de choix|
|Press statique|||||
|Pression dynamique|||||
|Débit |||||
|Débit Max |||||
|Debit de remplissage |||||
|Absence d'anomalie ||0|lt_pei_etat_boolean|Liste de choix|
|Signalisation conforme ||0|lt_pei_etat_boolean|Liste de choix|
|Date de disponibilité |||||
|Date de mise en service |||||
|Date du dernier contrôle technique |||||
|Opérateur du contrôle |||||
|Date de la dernière reconnaissanve opérationnelle |||||
|Statut  ||00|lt_pei_statut|Liste de choix|
|Gestionnaire   ||00|lt_pei_gestion|Liste de choix|
|Délégataire   ||00|lt_pei_delegat|Liste de choix|
|Centre de secours de 1er appel   ||00000|lt_pei_cs_sdis|Liste de choix|
|Situation   |||||
|Observations    ||||Champ texte à plusieurs lignes|
|Photo     |||||
|Source de la donnée     |||||
|Référentiel géographique     ||00|valeur_src_geom|Liste de choix|
|Date du référentiel      ||0000|||
|Opérateur de saisie     ||%USER_LOGIN%||| 
|Anomalie(s)      |||lt_pei_anomalie|Cases à cocher multiples| 
|Type dans le règlement départemental   |||||
|Précision   |||||
|Référence sur le terrain   |||||
|Référence du contrat de sous-traitance  |||||
|Type dans le règlement départemental   ||00|lt_pei_id_contrat|Liste de choix|
|Verrou    |x|false||Caser à cocher|

**IMPORTANT** : L'édition des données jointes est désactivée.

 * Modèle d'impression : Fiche standard + carte et fiche standard

 
## Analyse :

Aucune

## Statistique :

Aucune

## Modification géométrique : `Ajouter ou déplacer un PEI`

Cette recherche permet à l'utilisateur de saisir ou modifier l'emplacement d'un PEI.
Cette fonctionnalité n'est accessible au(x) prestataire(s).

  * Configuration :
  
Source : `xapps_geo_v_pei_ctr`

 * Filtres : aucun
 * Accrochage : aucun
 * Fiches d'information active : Fiche d'informationPEI
 * Topologie : aucune 
 
 # La cartothèque

|Groupe|Sous-groupe|Visible dans la légende|Visible au démarrage|Détails visibles|Déplié par défaut|Geotable|Renommée|Issue d'une autre carte|Visible dans la légende|Visible au démarrage|Déplié par défaut|Couche sélectionnable|Couche accrochable|Catégorisation|Seuil de visibilité|Symbologie|Autres|
|:---|:---|:-:|:-:|:-:|:-:|:---|:---|:-:|:-:|:-:|:-:|:-:|:---|:---|:---|:---|:---|
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
