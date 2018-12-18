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
 
==> revoir ces relations en remplacement des listes de domaines (qui posaient problème dans les 1er versions de GEO

|Géotables ou Tables| Champs de jointure | Type |
|:---|:---|:---|
| an_dec_pav_doc_media |id| 0..n (égal) |

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

==> à remplacer par la recherche sur la BAL

Cette recherche permet à l'utilisateur de faire une recherche d'un PAV Verre à moins de 300 mètres d'une adresse.

  * Configuration :

Source : `geo_ban_arcba`

|Attribut|Afficher|Rechercher|Suggestion|Attribut de géométrie|Tri des résultats|
|:---|:-:|:-:|:-:|:-:|:-:|
|Résultat(s)|x|||||
|Commune|x|||||
|Adresse|x||x|||


 * Filtres :


(1) si liste de domaine

 * Fiches d'information active : Résultat PAV VERRE à moins de 300 mètres

# Recherche : `PAV VERRE par nature du problème`

Cette recherche permet à l'utilisateur de faire une recherche guidée sur un PAV Verre d'après la nature du problème.

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
|PAV nature du problème|x|nat_pb|Est égale à une valeur de liste de choix |Liste de domaine valeur_pav_natpb|nat_pb_lib|nat_pb|nat_pb||Titre : Nature|


(1) si liste de domaine

 * Fiches d'information active : Conteneur à verre (édition), Conteneur à verre

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

==> à remplacer par la recherche sur la BAL

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
