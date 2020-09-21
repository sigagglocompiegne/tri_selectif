![picto](img/Logo_web-GeoCompiegnois.png)

# Documentation d'administration de l'application TRI SELECTIF #

# Généralité

* Statut
  - [ ] à rédiger
  - [x] en cours de rédaction
  - [ ] relecture
  - [ ] finaliser
  - [ ] révision

* Historique des versions

|Date | Auteur | Description
|:---|:---|:---|
|21/09/2020|Grégory Bodet|version 2|
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
|photo                  |||Nom du fichier photo||Inutilisé (photo dans la table des médias)|| 
|prop_abor                   |||Etat de propreté des abords|Liste de domaine   valeur_pav_proprete_abor|Fiche d'information Conteneur à Verre|| 
|proprete                    |||Etat de propreté|Liste de domaine   valeur_pav_proprete|Fiche d'information Conteneur à Verre|| 
|prox_corb                     |||Présence d'une corbeille à proximité|Booléen oui/non|Fiche d'information Conteneur à Verre|| 
|src_geom                     |||Référentiel spatial||Fiche d'information Conteneur à Verre|| 
|statut                     ||||Liste de domaine    Valeur PAV Statut |Fiche d'information Conteneur à Verre||  
|tags                     |||Présence de tags|Booléen oui/non |Fiche d'information Conteneur à Verre||  
|trp_rest                      |||Présence d'une trappe pour restaurateur|Booléen oui/non |Fiche d'information Conteneur à Verre||  
|type_sign                       |||Type de signalétique|Liste de domaine    Valeur PAV Etat signalétique
 |Fiche d'information Conteneur à Verre||  
|type_sol                        |||Type de sol|Liste de domaine    valeur_pav_typesol
 |Fiche d'information Conteneur à Verre||  
|url_photo                         |||Lien vers la photo| |Inutilisé (photo dans la table des médias)||  
|v_tampon                         |||Valeur du tampon correspondant à l'aire de captation du point de ramassage |Fiche d'information Conteneur à Verre||  


   * filtres :

|Nom|Attribut| Au chargement | Type | Condition |Valeur|Description|
|:---|:---|:-:|:---:|:---:|:---|:---|

Sans objet
   
   * relations :

|Géotables ou Tables| Champs de jointure | Type |
|:---|:---|:---|
| an_dec_pav_doc_media |id| 0..n (égal) |

|Géotables ou Tables| Champs de jointure | Type |
|:---|:---|:---|
| à partir de Géotable xapps_geo_vmr_adresse sur geo_dec_pav_verre |geom à geom2| 1..n (intersection) |

   * particularité(s) : aucune

## GeoTable : `geo_dec_pav_tlc`

|Attributs| Champ calculé | Formatage |Renommage|Particularité/Usage|Utilisation|Exemple|
|:---|:-:|:-:|:---|:---|:---|:---|
|affiche_result |x|x||Formate le contenu affiché dans le menu Résultat|Résultat de recherche|Conteneur textile n° {id_cont_tl}|
|info_bulle  |x|x||Composition de l'info bulle affiché au passage sur le PAV|Cartographie|Identifiant : {id_cont_tl}|
|cont_mat   |||Matériau|Liste de domaine  valeur_pav_contmat|Fiche d'information Conteneur Textile||
|cont_nbr    |||Nombre de conteneur(s)||Fiche d'information Conteneur Textile||
|cont_pos     |||Position|Liste de domaine  valeur_pav_contpos|Fiche d'information Conteneur Textile||
|date_effet  |||Prise en compte dans le plan interactif||Fiche d'information Conteneur Textile||
|date_maj   |||Date de mise à jour||Fiche d'information Conteneur Textile||
|date_netoy    |||Date de nettoyage||Fiche d'information Conteneur Textile||
|date_pose     |||Date de pose||Fiche d'information Conteneur Textile||
|date_sai     |||Date de saisie||Fiche d'information Conteneur Textile||
|env_implan       |||Type d'espace urbain d'implantation|Liste de domaine  valeur_pav_envimplan|Fiche d'information Conteneur Textile||
|env_situ       |||Situation domaniale|Liste de domaine  valeur_pav_envsitu|Fiche d'information Conteneur Textile||
|env_type       |||Type d'environnement|Liste de domaine  valeur_pav_envtype|Fiche d'information Conteneur Textile||
|id_cont_tl         |||Identifiant||Fiche d'information Conteneur Textile||
|insee         |||Code Insee||Fiche d'information Conteneur Textile||
|nom_entrep          |||Entreprise gestionnaire|Liste de domaine   valeur_pav_gest|Fiche d'information Conteneur Textile||
|nom_entrep_99            |||Autre entreprise gestionnaire||Fiche d'information Conteneur Textile||
|nat_pb_99            |||Autre problème||Fiche d'information Conteneur à Verre||
|observ             |||Observation(s)||Fiche d'information Conteneur Textile||
|op_sai             |||Opérateur de saisie||Fiche d'information Conteneur Textile||
|peinture                 |||Etat de la peinture|Liste de domaine valeur_pav_peinture|Fiche d'information Conteneur Textile|| 
|photo                  |||Nom du fichier photo||Inutilisé (photo dans la table des médias)|| 
|prop_abor                   |||Etat de propreté des abords|Liste de domaine   valeur_pav_proprete_abor|Fiche d'information Conteneur Textile|| 
|prox_corb                     |||Présence d'une corbeille à proximité|Booléen oui/non|Fiche d'information Conteneur Textile|| 
|src_geom                     |||Référentiel spatial||Fiche d'information Conteneur Textile|| 
|tags                     |||Présence de tags|Booléen oui/non |Fiche d'information Conteneur Textile||  
|type_sol                        |||Type de sol|Liste de domaine    valeur_pav_typesol
 |Fiche d'information Conteneur Textile||  
|url_photo                         |||Lien vers la photo| |Inutilisé (photo dans la table des médias)||  


   * filtres :

|Nom|Attribut| Au chargement | Type | Condition |Valeur|Description|
|:---|:---|:-:|:---:|:---:|:---|:---|

Sans objet

   * relations : 
 
|Géotables ou Tables| Champs de jointure | Type |
|:---|:---|:---|
| an_dec_pav_doc_media |id| 0..n (égal) |

|Géotables ou Tables| Champs de jointure | Type |
|:---|:---|:---|
| à partir de Géotable xapps_geo_vmr_adresse sur geo_dec_pav_tlc |geom à geom2| 1..n (intersection) |

   * particularité(s) : aucune
   
  
## GeoTable : `xapps_geo_v_pav_orient`

|Attributs| Champ calculé | Formatage |Renommage|Particularité/Usage|Utilisation|Exemple|
|:---|:-:|:-:|:---|:---|:---|:---|

Sans objet

   * filtres : aucun
   * relations : aucune
   * particularité(s) : aucune
 
 ## GeoTable : `xapps_geo_v_pav_verre_inactif`

|Attributs| Champ calculé | Formatage |Renommage|Particularité/Usage|Utilisation|Exemple|
|:---|:-:|:-:|:---|:---|:---|:---|

Sans objet

   * filtres : aucun
   * relations : aucune
   * particularité(s) : aucune
   
## Table : `an_dec_pav_doc_media`

|Attributs| Champ calculé | Formatage |Renommage|Particularité/Usage|Utilisation|Exemple|
|:---|:-:|:-:|:---|:---|:---|:---|
|d_photo |||Date de la prise de vue||Fiche d'information Conteneur à verre ou textile||
|date_sai  |||Date d'intégration du document||Fiche d'information Conteneur à verre ou textile||
|id  |||Identifiant du PAV||Fiche d'information Conteneur à verre ou textile||
|l_prec   |||Précision sur le document||Fiche d'information Conteneur à verre ou textile||
|lien_photo    |x|x|Lien vers la photo||Fiche d'information Conteneur à verre ou textile|http://geo.compiegnois.fr/documents/metiers/env/dechet/photos/{media}|
|media    |||Champ Média de GEO||||
|miniature    |||Champ miniature de GEO||Fiche d'information Conteneur à verre ou textile||
|n_fichier     |||Nom du fichier||Fiche d'information Conteneur à verre ou textile||
|op_sai      |||Libellé de l'opérateur ayant intégrer le document||Fiche d'information Conteneur à verre ou textile||
|t_fichier       |||Type de média dans GEO||Fiche d'information Conteneur à verre ou textile||

   * filtres : aucun
   * relations : aucune
   * particularité(s) : aucune


# Les fonctionnalités

Sont présentées ici uniquement les fonctionnalités spécifiques à l'application.

## Recherche globale : `Recherche dans la Base Adresse Locale`

Cette recherche permet à l'utilisateur de faire une recherche libre sur une adresse.

Cette recherche a été créée pour l'application RVA. Le détail de celle-ci est donc à visualiser dans le répertoire GitHub rva au niveau de la documentation applicative.

## Recherche globale : `Recherche dans la base de Voie Locale`

Cette recherche permet à l'utilisateur de faire une recherche libre sur le libellé d'une voie.

Cette recherche a été créée pour l'application RVA. Le détail de celle-ci est donc à visualiser dans le répertoire GitHub rva au niveau de la documentation applicative.
 
## Recherche globale : `Localiser une commune de l'ARC`

Cette recherche permet à l'utilisateur de faire une recherche libre sur le nom d'une commune.

Cette recherche a été créée pour l'application Cadastre-Urbanisme. Le détail de celle-ci est donc à visualiser dans le répertoire GitHub rva au niveau de la documentation applicative.

## Recherche globale : `Localiser un équipement`

Cette recherche permet à l'utilisateur de faire une recherche libre sur le nom d'un équipement.

Cette recherche a été créée pour l'application Cadastre-Urbanisme. Le détail de celle-ci est donc à visualiser dans le répertoire GitHub rva au niveau de la documentation applicative.

## Recherche (clic sur la carte) : `Conteneur à verre`

Cette recherche permet à l'utilisateur de cliquer sur la carte et de remonter les informations du PAV.

  * Configuration :

Source : `xapps_geo_v_pei_ctr`

|Attribut|Afficher|Rechercher|Suggestion|Attribut de géométrie|Tri des résultats|
|:---|:-:|:-:|:-:|:-:|:-:|
|Résultat(s)|x|||||
|Commune|x|||||
|Adresse|x|||||

(la détection des doublons n'est pas activée ici)

 * Filtres :

Sans objet

(1) si liste de domaine

 * Fiches d'information active : Conteneur à verre, Conteneur à verre (édition)
 
 
 ## Recherche (clic sur la carte) : `Conteneur textile`

Cette recherche permet à l'utilisateur de cliquer sur la carte et de remonter les informations du PAV.

  * Configuration :

Source : `geo_dec_pav_tlc`

|Attribut|Afficher|Rechercher|Suggestion|Attribut de géométrie|Tri des résultats|
|:---|:-:|:-:|:-:|:-:|:-:|
|Résultat(s)|x|||||
|Commune|x|||||
|Adresse|x|||||

(la détection des doublons n'est pas activée ici)

 * Filtres :

Sans objet

(1) si liste de domaine

 * Fiches d'information active : Conteneur textile, Conteneur textile (édition)
 
 
 |Groupe|Jointure|Filtres liés|
|:---|:-:|:-:|
|Groupe de filtres par défaut|`OU`||

|Nom|Obligatoire|Attribut|Condition|Valeur|Champ d'affichage (1)|Champ de valeurs (1)|Champ de tri (1)|Ajout autorisé (1)|Particularités|
|:---|:-:|:---|:---|:---|:---|:---|:---|:-:|:---|
|PEI identifiant||id_pei|Prédéfinis - Filtre à valeur saisie||||||Titre : Numéro de PEI|
|PEI identifiant||id_sdis|Prédéfinis - Filtre à valeur saisie||||||Titre : Référence SDIS|
 
## Recherche (clic sur la carte) : `Conteneur textile`

Cette recherche permet à l'utilisateur de cliquer sur la carte et de remonter les informations de la parcelle.

Cette recherche a été créée pour l'application Cadastre-Urbanisme. Le détail de celle-ci est donc à visualiser dans le répertoire GitHub rva au niveau de la documentation applicative.

 
 
## Recherche : `Toutes les recherches cadastrales`

L'ensemble des recherches cadastrales ont été formatées et intégrées par l'éditeur via son module GeoCadastre.
Seul le nom des certaines recherches a été modifié par l'ARC pour plus de compréhension des utilisateurs.

Cette recherche est détaillée dans le répertoire GitHub `docurba`.


## Recherche : `PAV par référence`

Cette recherche permet à l'utilisateur de faire une recherche guidée sur un PAV Verre d'après sa référence.

  * Configuration :

Source : `geo_dec_pav_verre`

|Attribut|Afficher|Rechercher|Suggestion|Attribut de géométrie|Tri des résultats|
|:---|:-:|:-:|:-:|:-:|:-:|
|Résultat(s)|x|||||
|Commune|x|||||
|Adresse|x|||||


(la détection des doublons n'est pas activée ici)

 * Filtres :

|Nom|Obligatoire|Attribut|Condition|Valeur|Champ d'affichage (1)|Champ de valeurs (1)|Champ de tri (1)|Ajout autorisé (1)|Particularités|
|:---|:-:|:---|:---|:---|:---|:---|:---|:-:|:---|
|PAV Référence|x|id_contver|Est égale à une valeur saisie||||||Titre : N° PAV|


(1) si liste de domaine

 * Fiches d'information active : Conteneur à verre (édition), Conteneur à verre
 
## Recherche : `PAV VERRE par localisation`

Cette recherche permet à l'utilisateur de faire une recherche guidée sur un PAV Verre d'après sa commune et/ou son adresse de localisation.

  * Configuration :

Source : `geo_dec_pav_verre`

|Attribut|Afficher|Rechercher|Suggestion|Attribut de géométrie|Tri des résultats|
|:---|:-:|:-:|:-:|:-:|:-:|
|Résultat(s)|x|||||
|Commune|x|||||
|Adresse|x|||||


(la détection des doublons n'est pas activée ici)

 * Filtres :

|Groupe|Jointure|Filtres liés|
|:---|:-:|:-:|
|Groupe de filtres par défaut|`ET`|x|

|Nom|Obligatoire|Attribut|Condition|Valeur|Champ d'affichage (1)|Champ de valeurs (1)|Champ de tri (1)|Ajout autorisé (1)|Particularités|
|:---|:-:|:---|:---|:---|:---|:---|:---|:-:|:---|
|PAV Verre commune|x|commune|Est égal à une valeur de liste de choix |Liste de domaine PAV Verre Commune|commune|commune|commune||Titre : Commune :|
|PAV Verre adresse|x|commune|Est égal à une valeur de liste de choix |Liste de domaine PAV Verre adresse|adresse|adresse|adresse||Titre : Adresse :|


(1) si liste de domaine

 * Fiches d'information active : Conteneur à verre (édition), Conteneur à verre

## Recherche : `PAV VERRE par lieu d'implantation`

Cette recherche permet à l'utilisateur de faire une recherche guidée sur un PAV Verre d'après son lieu d'implantation.

  * Configuration :

Source : `geo_dec_pav_verre`

|Attribut|Afficher|Rechercher|Suggestion|Attribut de géométrie|Tri des résultats|
|:---|:-:|:-:|:-:|:-:|:-:|
|Résultat(s)|x|||||
|Commune|x|||||
|Adresse|x|||||


(la détection des doublons n'est pas activée ici)

 * Filtres :


|Nom|Obligatoire|Attribut|Condition|Valeur|Champ d'affichage (1)|Champ de valeurs (1)|Champ de tri (1)|Ajout autorisé (1)|Particularités|
|:---|:-:|:---|:---|:---|:---|:---|:---|:-:|:---|
|PAV implantation|x|id_contver|Est égale à une valeur de liste de choix |Liste de domaine valeur_pav_envimplan|env_implan_lib|env_implan|env_implan||Titre : Implantation :|


(1) si liste de domaine

 * Fiches d'information active : Conteneur à verre (édition), Conteneur à verre


## Recherche : `PAV VERRE à moins de 300 mètres`

Cette recherche permet à l'utilisateur de faire une recherche d'un PAV Verre à moins de 300 mètres d'une adresse.

  * Configuration :

Source : `xapps_geo_vmr_adresse`

|Attribut|Afficher|Rechercher|Suggestion|Attribut de géométrie|Tri des résultats|
|:---|:-:|:-:|:-:|:-:|:-:|
|Résultat(s)|x|||||
|Commune|x|||||
|Adresse|x||x|||


 * Filtres :
 
|Groupe|Jointure|Filtres liés|
|:---|:-:|:-:|
|Groupe de filtres par défaut|`ET`|x|

|Nom|Obligatoire|Attribut|Condition|Valeur|Champ d'affichage (1)|Champ de valeurs (1)|Champ de tri (1)|Ajout autorisé (1)|Particularités|
|:---|:-:|:---|:---|:---|:---|:---|:---|:-:|:---|
|Commune|x|commune|Prédéfinis avec une filtre à liste de choix||||||Titre : Sélectionnez la commune|
|Voie|x|libvoie_c|Prédéfinis avec une filtre à liste de choix||||||Titre : Sélectionnez la voie|
|Numéro||numero_complet|Prédéfinis avec une filtre à liste de choix||||||Titre : Sélectionnez le n° dans la voie|

(1) si liste de domaine

 * Fiches d'information active : PAV VERRE à moins de 300 mètres

# Recherche : `PAV VERRE par nature du problème`

Cette recherche permet à l'utilisateur de faire une recherche guidée sur un PAV Verre d'après la nature du problème.

  * Configuration :

Source : `xapps_geo_vmr_adresse`

|Attribut|Afficher|Rechercher|Suggestion|Attribut de géométrie|Tri des résultats|
|:---|:-:|:-:|:-:|:-:|:-:|
|Résultat(s)|x|||||
|Commune|x|||||
|Adresse|x|||||


(la détection des doublons n'est pas activée ici)

 * Filtres :


|Groupe|Jointure|Filtres liés|
|:---|:-:|:-:|
|Groupe de filtres par défaut|`ET`|x|

|Nom|Obligatoire|Attribut|Condition|Valeur|Champ d'affichage (1)|Champ de valeurs (1)|Champ de tri (1)|Ajout autorisé (1)|Particularités|
|:---|:-:|:---|:---|:---|:---|:---|:---|:-:|:---|
|Commune|x|commune|Prédéfinis avec une filtre à liste de choix||||||Titre : Sélectionnez la commune|
|Voie|x|libvoie_c|Prédéfinis avec une filtre à liste de choix||||||Titre : Sélectionnez la voie|
|Numéro||numero_complet|Prédéfinis avec une filtre à liste de choix||||||Titre : Sélectionnez le n° dans la voie|


(1) si liste de domaine

 * Fiches d'information active : PAV TLC à moins de 500 mètres

## Recherche : `TLC par référence`

Cette recherche permet à l'utilisateur de faire une recherche guidée sur un PAV TLC d'après sa référence.

  * Configuration :

Source : `geo_dec_pav_tlc`

|Attribut|Afficher|Rechercher|Suggestion|Attribut de géométrie|Tri des résultats|
|:---|:-:|:-:|:-:|:-:|:-:|
|Résultat(s)|x|||||
|Commune|x|||||
|Adresse|x|||||


(la détection des doublons n'est pas activée ici)

 * Filtres :

|Nom|Obligatoire|Attribut|Condition|Valeur|Champ d'affichage (1)|Champ de valeurs (1)|Champ de tri (1)|Ajout autorisé (1)|Particularités|
|:---|:-:|:---|:---|:---|:---|:---|:---|:-:|:---|
|TLC Référence|x|id_cont_tl|Est égale à une valeur saisie||||||Titre : N° PAV|


(1) si liste de domaine

 * Fiches d'information active : Conteneur textile (édition), Conteneur textile
 
## Recherche : `PAV TLC par localisation`

Cette recherche permet à l'utilisateur de faire une recherche guidée sur un PAV TLC d'après sa commune et/ou son adresse de localisation.

  * Configuration :

Source : `geo_dec_pav_tlc`

|Attribut|Afficher|Rechercher|Suggestion|Attribut de géométrie|Tri des résultats|
|:---|:-:|:-:|:-:|:-:|:-:|
|Résultat(s)|x|||||
|Commune|x|||||
|Adresse|x|||||


(la détection des doublons n'est pas activée ici)

 * Filtres :

|Groupe|Jointure|Filtres liés|
|:---|:-:|:-:|
|Groupe de filtres par défaut|`ET`|x|

|Nom|Obligatoire|Attribut|Condition|Valeur|Champ d'affichage (1)|Champ de valeurs (1)|Champ de tri (1)|Ajout autorisé (1)|Particularités|
|:---|:-:|:---|:---|:---|:---|:---|:---|:-:|:---|
|PAV TLC commune|x|commune|Est égal à une valeur de liste de choix |Liste de domaine PAV TLC Commune|commune|commune|commune||Titre : Commune :|
|PAV TLC adresse|x|commune|Est égal à une valeur de liste de choix |Liste de domaine PAV TLC adresse|adresse|adresse|adresse||Titre : Adresse :|


(1) si liste de domaine

 * Fiches d'information active : Conteneur textile (édition), Conteneur textile

## Recherche : `PAV TLC à moins de 500 mètres`


Cette recherche permet à l'utilisateur de faire une recherche d'un PAV TLC à moins de 500 mètres d'une adresse.

  * Configuration :

Source : `geo_ban_arcba`

|Attribut|Afficher|Rechercher|Suggestion|Attribut de géométrie|Tri des résultats|
|:---|:-:|:-:|:-:|:-:|:-:|
|Résultat(s)|x|||||
|Commune|x|||||
|Adresse|x||x|||


 * Filtres :


(1) si liste de domaine

 * Fiches d'information active : Résultat PAV TLC à moins de 500 mètres
 

## Recherche : `Toutes les recherches avancées d'une adresse ou d'une voie`

L'ensemble des recherches d'adresse ou de voies ont été formatées pour l'application de gestion des Voies et des Adresses.

Cette recherche est détaillée dans le répertoire GitHub `RVA`.


## Fiche d'information : `Conteneur à verre (édition)`

Source : `geo_dec_pav_verre`

* Statistique : aucune
 
 * Représentation :
 
|Mode d'ouverture|Taille|Agencement des sections|
|:---|:---|:---|
|dans le gabarit|530x650|Accordéon|

|Nom de la section|Attributs|Position label|Agencement attribut|Visibilité conditionnelle|Fichie liée|Ajout de données autorisé|
|:---|:---|:---|:---|:---|:---|:---|
|Photographies|Commune,Adresse,Lien vers la photo|par défaut|Vertical||||

|Nom de la section|Attributs|Position label|Agencement attribut|Visibilité conditionnelle|Fichie liée|Ajout de données autorisé|
|:---|:---|:---|:---|:---|:---|:---|
|Fiche détaillée|Identifiant(id_contver),Prise en compte dans le plan interactif(date_effet),Commune(commune),Code Insee(insee),Quartier(quartier),Adresse(adresse),Statut(statut),X L93(x_l93),Y L93(y_l93), Nombre de conteneur(s)(cont_nb),Matériau(cont_mat),Position(cont_pos),Date de saisie(date_sai),Date de pose(date_pos),Date de nettoyage(date_net),Date de mise à jour(dat_maj),volume(volume),type d'environnement(env_type),type d'espace urbain d'implantation(env_implan),situation domaniale(env_situ),mode de préhension(mode_preh),Etat du corchet(crochet),Opercules(opercules),Présente de tags(tags),Etat de la peinture(peinture), Présence d'une corbeille à proximité(prox_corb),Type de sol(type_sol),Présence d'une trappe pour restaurateur(trp_rest),Type de signalétique(type_sign),Etat de propriété(proprete),Etat de propreté des abords(prop_abor),Défaut de structure visible(def_struc),Tonnage par gisement d'habitants(hab_pav),Manque de PAV(opt_pav),Accessibilité à revoir(ame_access),Nature du problème(nat_pb), Référentiel spatial(src_geom),Opérateur de saisie(op_sai),Observation(s)(observ)|masqué|Vertical||||

|Nom de la sous-section|Attributs|Position label|Agencement attribut|Visibilité conditionnelle|Fichie liée|Ajout de données autorisé|
|:---|:---|:---|:---|:---|:---|:---|
|Orientation retenue|Orientation retenue(pavorient),Identifiant du PAV d'origine (si PAV créé issu d'un PAV déplacé)(id_parent)|Par défaut|Vertical||||

|Nom de la sous-section|Attributs|Position label|Agencement attribut|Visibilité conditionnelle|Fichie liée|Ajout de données autorisé|
|:---|:---|:---|:---|:---|:---|:---|
|Gestion des photographies|Champ de miniature de GEO(miniature)|par défaut|Vertical||||


* Saisie :

Sont présent ici uniquement les attributs éditables ou disposant d'un mode de représentation spécifique.

|Attribut|Obligatoire|Valeur par défaut|Liste de domaine|Représentation|
|:---|:---|:---|:---|:---|
|Adresse|||||
|Nombre de conteneur(s) |||||
|Matériau  |||valeur_pav_contmat||
|Position  |||valeur_pav_contpos||
|Date de pose |||||
|Date de nettoyage  |||||
|Volume |||||
|Type d'environnement |||valeur_pav_envtype||
|Type d'espace urbain d'implantation |||valeur_pav_envimplan||
|Situation domaniale|||valeur_pav_envsitu||
|Mode de préhension |||valeur_pav_modepreh||
|Etat du crochet  |||valeur_pav_crochet ||
|Opercules  |||Oui / Non (char)|Bourons radios|
|Présence de tags |||Oui / Non (char)|Bourons radios|
|Etat de la peinture |||valeur_pav_peinture||
|Présence d'une corbeille à proximité  |||Oui / Non (char)|Boutons radios|
|Type de sol |||valeur_pav_typesol||
|Présence d'une trappe pour restaurateur |||Oui / Non (char)|Boutons radios|
|Etat de la signalétique|||Valeur PAV Etat signalétique||
|Type de signalétique |||valeur_pav_typesign||
|Etat de propreté  |||valeur_pav_proprete||
|Etat de propreté des abords    |||valeur_pav_proprete_abor||
|Défaut de structure visible    |||||
|Tonnage par gisement d'habitants |||||
|Manque de PAV    |||||
|Accessibilté à revoir     |||Oui / Non (char)|Boutons radios|
|Nature du problème     |||valeur_pav_natpb||
|Autre problème     |||||
|Référentiel spatial     |||valeur_src_geom||
|Opérateur de saisie     ||%USER_LOGIN%||| 
|Orientation retenue      |||Valeur PAV Orientation|Cases à cocher multiples| 
|Identifiant du PAV d'origine (si PAV créé issu d'un PAV déplacé)  |||||
|Statut    |||Valeur PAV Statut||
|Etat de la signalétique |||Valeur PAV Etat signalétique||
|Observation(s)  ||||Champ texte à plusieurs lignes|
|Prise en compte dans le plan interactif  |||||


**IMPORTANT** : L'édition des données jointes est désactivée.

 * Modèle d'impression : sans objet

## Fiche d'information : `Conteneur à verre`

Source : `geo_dec_pav_verre`

* Statistique : aucune
 
 * Représentation :
 
|Mode d'ouverture|Taille|Agencement des sections|
|:---|:---|:---|
|dans le gabarit|530x650|Accordéon|

|Nom de la section|Attributs|Position label|Agencement attribut|Visibilité conditionnelle|Fichie liée|Ajout de données autorisé|
|:---|:---|:---|:---|:---|:---|:---|
|Photographies|Commune,Adresse,Lien vers la photo|par défaut|Vertical||||

|Nom de la section|Attributs|Position label|Agencement attribut|Visibilité conditionnelle|Fichie liée|Ajout de données autorisé|
|:---|:---|:---|:---|:---|:---|:---|
|Fiche détaillée|Identifiant(id_contver),Commune(commune),Code Insee(insee),Quartier(quartier),Adresse(adresse),X L93(x_l93),Y L93(y_l93), Nombre de conteneur(s)(cont_nb),Date de saisie(date_sai),Date de pose(date_pos),Date de nettoyage(date_net),Date de mise à jour(dat_maj),volume(volume),Opercules(opercules),Présente de tags(tags), Présence d'une corbeille à proximité(prox_corb),Présence d'une trappe pour restaurateur(trp_rest),Défaut de structure visible(def_struc),Tonnage par gisement d'habitants(hab_pav),Manque de PAV(opt_pav),Accessibilité à revoir(ame_access),Autre problème(nat_pb_99), Opérateur de saisie(op_sai),Observation(s)(observ)|masqué|Vertical||||

|Nom de la sous-section|Attributs|Position label|Agencement attribut|Visibilité conditionnelle|Fichie liée|Ajout de données autorisé|
|:---|:---|:---|:---|:---|:---|:---|
|Préconisation|Orientation retenue(pavorient),Identifiant du PAV d'origine (si PAV créé issu d'un PAV déplacé)(id_parent)|Par défaut|Vertical||||

|Nom de la sous-section|Attributs|Position label|Agencement attribut|Visibilité conditionnelle|Fichie liée|Ajout de données autorisé|
|:---|:---|:---|:---|:---|:---|:---|
|Gestion des photographies|Champ de miniature de GEO(miniature)|par défaut|Vertical||||
 
## Analyse :

Aucune

## Statistique :

Aucune

## Modification géométrique : `Conteneur à verre`

Cette recherche permet à l'utilisateur de saisir ou modifier l'emplacement d'un PAV Verre.

  * Configuration :
  
Source : `geo_dec_pav_verre`

 * Filtres : aucun
 * Accrochage : aucun
 * Fiches d'information active : Conteneur à verre (insertion)
 * Topologie : aucune 
 
 ## Modification géométrique : `Conteneur textile`

Cette recherche permet à l'utilisateur de saisir ou modifier l'emplacement d'un PAV Textile.

  * Configuration :
  
Source : `geo_dec_pav_tlc`

 * Filtres : aucun
 * Accrochage : aucun
 * Fiches d'information active : Conteneur textile (insertion)
 * Topologie : aucune 
 
 # La cartothèque

|Groupe|Sous-groupe|Visible dans la légende|Visible au démarrage|Détails visibles|Déplié par défaut|Geotable|Renommée|Issue d'une autre carte|Visible dans la légende|Visible au démarrage|Déplié par défaut|Couche sélectionnable|Couche accrochable|Catégorisation|Seuil de visibilité|Symbologie|Autres|
|:---|:---|:-:|:-:|:-:|:-:|:---|:---|:-:|:-:|:-:|:-:|:-:|:---|:---|:---|:---|:---|
|||||||xapps_geo_vmr_adresse|Adresse|x||x|||||1/0-1/2000||Interactivité avec le champ calculé infobulle (0-2000è)|
|Points d'apport volontaire||x|x|x|x|xapps_geo_v_pav_verre_inactif|Conteneur à verre inactif||x|x||||||croie rouge de taille 25||
|||||||geo_dec_pav_verre|Conteneur à verre||x|x||||||picto_appli_PAV_verre.svg de taille 25|Intéractivité avec info_bulle|
|||||||geo_dec_pav_tlc|Conteneur textile||x|x||||||picto_appli_PAV_textile.svg de taille 25|Intéractivité avec info_bulle|
|||||||xapps_geo_v_pav_orient|Suivi des emplacements||x|x||||||Trait dee petit tiret taille 1 rouge||
|Foncier||x||x||geo_v_fon_proprio_pu_arc|Propriétés institutionnelles|x|x|x||||||||
|Limites administratives||x|x|x||geo_v_osm_commune_arcba|Limites communales|x|x|x||||||||
|||||||geo_adm_quartier|Quartier de Compiègne|x|||||||0-70000è|||
|Cadastre|||x|||Parcelle (V3)|Parcelle (V3)||x||x|||||||

# L'application

* Généralités :

|Gabarit|Thème|Modules spé|Impression|Résultats|
|:---|:---|:---|:---|:---|
|Pro|Thème GeoCompiegnois 1.0.7|Partage de lien, Introduction, StreetView, GeoCadastre (V3),Google Analytics,Page de connexion perso, Bandeau HTML, Multimedia (Média - Déchet PAV),Javascript|A4 et A3 Paysage, A4 et A3 Portrait, A4 et A3 Portait + légende et A4 et A3 Paysage + légende||

* Particularité de certains modules :

  * Module Javascript : ouverture par défaut du menu Introductif
  `var injector = angular.element('body').injector();
var acfApplicationService = injector.get('acfApplicationService');
acfApplicationService.whenLoaded(setTimeout(function(){
$(".sidepanel-item.launcher-application").click();
}, 100));`
  * Module Google Analytics : le n° ID est disponible sur le site de Google Analytics


* Recherche globale :

|Noms|Tri|Nb de sugggestion|Texte d'invite|
|:---|:---|:---|:---|
|Recherche dans la Base Adresse Locale,Recherche dans la Base de Voie Locale,localiser une commune de l'ARC, Localiser un équipement|alpha|20|Rechercher une adresse, une voie, une commune ou un équipement|

* Carte : `Le tri`

Comportement au clic : (dés)active uniquement l'item cliqué
Liste des recherches : Conteneur à verre, Conteneur textile, Parcelle(s) sélectionnée(s)

* Fonds de plan :

|Nom|Au démarrage|opacité|
|:---|:---|:---|
|Cadastre||100%|
|Plan de ville|x|100%|
|Carte IGN 25000||100%|
|Photographie aérienne 2013||70%|

* Fonctionnalités

|Groupe|Nom|
|:---|:---|
|Recherche cadastrale||
||Parcelles par référence|
||Parcelles par adresse fiscale|
||Parcelles par nom du propriétaire|
||Parcelles multicritères|
||Parcelles par nom du propriétaire d'un local|
||Parcelles par surface|
|Recherche un conteneur VERRE||
||PAV par référence|
||PAV VERRE par localisation|
||PAV VERRE par lieu d'implantation|
||PAV VERRE par nature du problème|
|Recherche un conteneur TEXTILE||
||TLC par référence|
||PAV TLC par localisation|
||PAV TLC par gestionnaire|
|Recherche avancée d'une voie ou d'une adresse||
||Recherche avancée d'une adresse|
||Recherche avancée d'une voie|
|Modifier un objet||
||Conteneur à verre|
||Conteneur textile|


