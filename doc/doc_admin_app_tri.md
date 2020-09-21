![picto](/doc/img/geocompiegnois_2020_reduit_v2.png)

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
|![picto](/doc/img/tri_selectif_bleu.png)|Tri sélectif|Cette application est dédiée à la gestion et la consultation des données sur les déchets, et notamment les lieux de collecte des PAV (Points dd'apport volontaire Verre et TLC).|

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
|Rechercher un conteneur Verre (par référence, lieu de collecte...|x|x|Peut modifier les données des lieux et des PAV Verre.|
|Rechercher un conteneur TLS (par référence, lieu de collecte...|x|x|Peut modifier les données des lieux et des PAV TLC.|
|Gestion des lieux de collecte|x|x|Cette fonctionnalité est uniquement visible par les utilisateurs inclus dans les groupes PAV_EDIT. Permet la création, modificaiton ou la désactivation d'un lieu de collecte|

* Le service des déchets peut :

- Voir, consulter et rechercher les informations des lieux de collecte et des Points d'Apport Volontaire (PAV)
- Peut modifier les données sur les lieux de collecte et sur les PAV (verre et TLC)
- Peut créer un nouveau lieu et y affecter de nouveaux PAV
- Peut modifier l'emplacement d'un lieu de collecte
- Peut rendre inactif un lieu (pas le supprimer réellement) et le lié à un autre si il est déplacé
- Peut gérer l'affectation des PAV au lieu

*	Un autre service peut :

-	Voir, consulter et rechercher les informations d’un lieu et des PAV affectés sans pouvoir les modifier

*	Les contrôles de saisie

Les contrôles de saisies sont effectués directement dans l'outil WEB. Seules des contraintes fonctionnelles sont intégrées (impossible de supprimer ou vérification que l'identifiant de l'ancien lieu est bien saisie dans le nouveau lieu si celui-ci a fait l'objet d'un déplacement pour l'optimiser). Le service gère sa donnée en propre et seuls certains attributs sont guidés par des listes de valeurs.

* **Autres profils**

Sans objet

# Les données

Sont décrites ici les Géotables et/ou Tables intégrées dans GEO pour les besoins de l'application. Les autres données servant d'habillage (pour la cartographie ou les recherches) sont listées dans les autres parties ci-après. Le tableau ci-dessous présente uniquement les changements (type de champ, formatage du résultat, ...) ou les ajouts (champs calculés, filtre, ...) non présents dans la donnée source. 

## GeoTable : `geo_dec_pav_lieu`

|Attributs| Champ calculé | Formatage |Renommage|Particularité/Usage|Utilisation|Exemple|
|:---|:-:|:-:|:---|:---|:---|:---|
|adresse  |||Adresse||Fiche d'information Lieu de collecte + recherche au clic||
|affiche_message_eve  |x|x||Formate le contenu affiché dans le fiche d'information du lieu dans l'onglet Evènement|Résultat de recherche|`CASE WHEN (SELECT count(*) FROM m_dechet.an_dec_pav_cont WHERE idlieu = {idlieu} AND eve IN ('20','30','31')) > 0 THEN '' ELSE '<font size=3><b>Pas d''évènements de conteneurs enregistrés sur ce lieu de collecte</b></font>' END`|
|ame_acces  |||Accessibilité à revoir|Booléen oui/non|Fiche d'information Lieu de collecte||
|commune  |||Commune||Fiche d'information Lieu de collecte + recherche au clic||
|cttype   |||Type de lieu|Liste de domaine  valeur_pav_contmat|Fiche d'information Lieu de collecte||
|cont_nbr    |||Nombre de conteneur(s)||Fiche d'information Lieu de collecte||
|date_maj   |||Date de mise à jour||Fiche d'information Lieu de collecte||
|date_net    |||Date de nettoyage||Fiche d'information Lieu de collecte||
|date_sai     |||Date de saisie||Fiche d'information Lieu de collecte||
|env_implan       |||Type d'espace urbain d'implantation|Liste de domaine  valeur_pav_envimplan|Fiche d'information Lieu de collecte||
|env_situ       |||Situation domaniale|Liste de domaine  valeur_pav_envsitu|Fiche d'information Lieu de collecte||
|env_type       |||Type d'environnement|Liste de domaine  valeur_pav_envtype|Fiche d'information Lieu de collecte||
|hab_pav       |||Tonnage par gisement d'habitants||Fiche d'information Lieu de collecte||
|id_lieu       |||Identifiant||Fiche d'information Lieu de collecte||
|insee         |||Code Insee||Fiche d'information Lieu de collecte||
|Localisation         |||Localisation||Fiche d'information Lieu de collecte + recherche au clic||
|nat_pb           |||Nature du problème|Liste de domaine   valeur_pav_natpb|Fiche d'information Lieu de collecte||
|nat_pb_99            |||Autre problème||Fiche d'information Lieu de collecte||
|observ             |||Observation(s)||Fiche d'information Lieu de collecte||
|op_sai             |||Opérateur de saisie||Fiche d'information Lieu de collecte||
|opt_pav               |||Manque de PAV||Fiche d'information Lieu de collecte|| 
|pavorient                ||||Liste de domaine Valeur PAV Orientation|Fiche d'information Lieu de collecte|| 
|prop_abor                   |||Etat de propreté des abords|Liste de domaine   valeur_pav_proprete_abor|Fiche d'information Lieu de collecte|| 
|prox_corb                     |||Présence d'une corbeille à proximité|Booléen oui/non|Fiche d'information Lieu de collecte|| 
|quartier  |||Quartier||Fiche d'information Lieu de collecte||
|src_geom                     |||Référentiel spatial||Fiche d'information Lieu de collecte|| 
|statut                     ||||Liste de domaine    Valeur PAV Statut |Fiche d'information Lieu de collecte||  
|v_tampon                         |||Valeur du tampon correspondant à l'aire de captation du point de ramassage |Fiche d'information Lieu de collecte||  


   * filtres :

|Nom|Attribut| Au chargement | Type | Condition |Valeur|Description|
|:---|:---|:-:|:---:|:---:|:---|:---|

Sans objet
   
   * relations :

|Géotables ou Tables| Champs de jointure | Type |
|:---|:---|:---|
| an_dec_pav_doc_media |id| 0..n (égal) |
| an_dec_pav_cont (actif) |idlieu| 0..n (égal) |
| lt_contrat_pav |code| 0..1 (égal) |
| an_dec_pav_cont (inactif) |idlieu| 0..n (égal) |
| an_dec_pav_cont_tlc (actif) |idlieu| 0..n (égal) |
| an_dec_pav_cont_tlc (inactif) |idlieu| 0..n (égal) |

   * déclencheurs :
   
|Non|Opérations|Conditions|Type|Actions|
|:---|:---|:---|:---|:---|
|Erreur idparent|update|new.Statut = 20 et old.idparent <> new.idparent|Annule la saisie|Boîte de dialogue : L'identifiant du lieu précédent est à indiquer sur le nouveau lieu de collecte créé.| 
|Erreur idparent (2)|update|old.Statut = 20 et old.idparent <> new.idparent|Annule la saisie|Boîte de dialogue : L'identifiant du lieu précédent est à indiquer sur le nouveau lieu de collecte créé.| 
|Pas de suppression possible|delete||Annule la saisie|Boîte de dialogue : Vous ne pouvez pas supprimer de lieux de collecte. Si celui-ci n'existe plus, vous devez le rendre inactif dans l'attribut état. Si il est déplacé, vous devez le rendre inactif et créer un nouveau lieu en indiquant l'identifiant de l'ancien lieu dans la partie préconisation.| 

   * particularité(s) : aucune

## Table : `an_dec_pav_cont (actif)`

|Attributs| Champ calculé | Formatage |Renommage|Particularité/Usage|Utilisation|Exemple|
|:---|:-:|:-:|:---|:---|:---|:---|
| affiche_model |x|x|Photo (modèle)|Récupère la photo du modèle de conteneur|Fiche d'information Verre et lieu de collecte|`'<img src ="' || (SELECT urlfic FROM m_dechet.lt_pav_modele m WHERE m.code = {model})|| '" alt="" width="50%">'`|
| affiche_result |x|x||Formate le contenu affiché dans le menu Résultat|Résultat de recherche|Conteneur à verre n° {idcont}|
|mat   |||Matériau|Liste de domaine  valeur_pav_contmat|Fiche d'information Conteneur Verre||
|pos     |||Position|Liste de domaine  valeur_pav_contpos|Fiche d'information Conteneur Verre||
|date_effet  |||Prise en compte dans le plan interactif||Fiche d'information Conteneur Verre||
|date_maj   |||Mis à jour le||Fiche d'information Conteneur Verre||
|date_net    |||Nettoyé le||Fiche d'information Conteneur Verre||
|date_pos     |||Posé le||Fiche d'information Conteneur Verre||
|date_sai     |||Saisie le||Fiche d'information Conteneur Verre||
|def_struc         |||Défaut de structure visible||Fiche d'information Conteneur Verre||
|etat_sign         |||Etat||Fiche d'information Conteneur Verre||
|eve         |||Evènement|Liste de domaine  lt_pav_eve|Fiche d'information Conteneur Verre||
|idcont         |||Identifiant du conteneur||Fiche d'information Conteneur Verre||
|idlieu         |||Identifiant du lieu de collecte||Fiche d'information Conteneur Verre||
|idpresta         |||Ref prestataire||Fiche d'information Conteneur Verre||
|mat         |||Matériau|Liste de domaine  valeur_pav_contmat|Fiche d'information Conteneur Verre||
|mode_preh         |||Mode de préhension|Liste de domaine  valeur_pav_modepreh|Fiche d'information Conteneur Verre||
|model         |||Modèle|Liste de domaine  lt_pav_modele|Fiche d'information Conteneur Verre||
|obs_eve         |||Commentaire(s)||Fiche d'information Conteneur Verre||
|observ   |||Observation(s)||Fiche d'information Conteneur Verre||
|op_sai             |||Saisi par||Fiche d'information Conteneur Verre||
|opercules             |||Opercules|Booléen (oui/non)|Fiche d'information Conteneur Verre||
|peinture                 |||Etat de la peinture|Liste de domaine valeur_pav_peinture|Fiche d'information Conteneur Verre|| 
|pos                 |||Position|Liste de domaine valeur_pav_contpos|Fiche d'information Conteneur Verre||
|proprete                   |||Etat de Propreté|Liste de domaine   valeur_pav_proprete|Fiche d'information Conteneur Verre|| 
|tags                     |||Présence de tags|Booléen oui/non |Fiche d'information Conteneur Verre||  
|trp_rest                     |||Présence d'une trappe pour restaurateur|Booléen oui/non |Fiche d'information Conteneur Verre||
|type_sign                        |||Type de signalétique|Liste de domaine    valeur_pav_typesign |Fiche d'information Conteneur Verre||  
|type_sol                        |||Type de sol|Liste de domaine    valeur_pav_typesol |Fiche d'information Conteneur Verre||  
|volume                        |||Volume||Fiche d'information Conteneur Verre||  
 

   * filtres :

|Nom|Attribut| Au chargement | Type | Condition |Valeur|Description|
|:---|:---|:---:|:---:|:---:|:---|:---|
|Actif|eve|x|alphanumérique|est égale à des valeurs par défaut|10,11,12,13,14,00|Permet d'afficher uniquement les PAV présents au lieu de collecte dans l'onglet Caractéristique|


   * relations : 
 
|Géotables ou Tables| Champs de jointure | Type |
|:---|:---|:---|
|geo_dec_pav_lieu |idlieu| 1 (égal) |


   * particularité(s) : aucune

## Table : `an_dec_pav_cont (inactif)`

|Attributs| Champ calculé | Formatage |Renommage|Particularité/Usage|Utilisation|Exemple|
|:---|:-:|:-:|:---|:---|:---|:---|
| affiche_model |x|x|Photo (modèle)|Récupère la photo du modèle de conteneur|Fiche d'information Verre et lieu de collecte|`'<img src ="' || (SELECT urlfic FROM m_dechet.lt_pav_modele m WHERE m.code = {model})|| '" alt="" width="50%">'`|
|mat   |||Matériau|Liste de domaine  valeur_pav_contmat|Fiche d'information Conteneur Verre||
|pos     |||Position|Liste de domaine  valeur_pav_contpos|Fiche d'information Conteneur Verre||
|date_effet  |||Prise en compte dans le plan interactif||Fiche d'information Conteneur Verre||
|date_maj   |||Mis à jour le||Fiche d'information Conteneur Verre||
|date_net    |||Nettoyé le||Fiche d'information Conteneur Verre||
|date_pos     |||Posé le||Fiche d'information Conteneur Verre||
|date_sai     |||Saisie le||Fiche d'information Conteneur Verre||
|def_struc         |||Défaut de structure visible||Fiche d'information Conteneur Verre||
|etat_sign         |||Etat||Fiche d'information Conteneur Verre||
|eve         |||Evènement|Liste de domaine  lt_pav_eve|Fiche d'information Conteneur Verre||
|idcont         |||Identifiant du conteneur||Fiche d'information Conteneur Verre||
|idlieu         |||Identifiant du lieu de collecte||Fiche d'information Conteneur Verre||
|idpresta         |||Ref prestataire||Fiche d'information Conteneur Verre||
|mat         |||Matériau|Liste de domaine  valeur_pav_contmat|Fiche d'information Conteneur Verre||
|mode_preh         |||Mode de préhension|Liste de domaine  valeur_pav_modepreh|Fiche d'information Conteneur Verre||
|model         |||Modèle|Liste de domaine  lt_pav_modele|Fiche d'information Conteneur Verre||
|obs_eve         |||Commentaire(s)||Fiche d'information Conteneur Verre||
|observ   |||Observation(s)||Fiche d'information Conteneur Verre||
|op_sai             |||Saisi par||Fiche d'information Conteneur Verre||
|opercules             |||Opercules|Booléen (oui/non)|Fiche d'information Conteneur Verre||
|peinture                 |||Etat de la peinture|Liste de domaine valeur_pav_peinture|Fiche d'information Conteneur Verre|| 
|pos                 |||Position|Liste de domaine valeur_pav_contpos|Fiche d'information Conteneur Verre||
|proprete                   |||Etat de Propreté|Liste de domaine   valeur_pav_proprete|Fiche d'information Conteneur Verre|| 
|tags                     |||Présence de tags|Booléen oui/non |Fiche d'information Conteneur Verre||  
|trp_rest                     |||Présence d'une trappe pour restaurateur|Booléen oui/non |Fiche d'information Conteneur Verre||
|type_sign                        |||Type de signalétique|Liste de domaine    valeur_pav_typesign |Fiche d'information Conteneur Verre||  
|type_sol                        |||Type de sol|Liste de domaine    valeur_pav_typesol |Fiche d'information Conteneur Verre||  
|volume                        |||Volume||Fiche d'information Conteneur Verre||  
 

   * filtres :

|Nom|Attribut| Au chargement | Type | Condition |Valeur|Description|
|:---|:---|:---:|:---:|:---:|:---|:---|
|Inactif|eve|x|alphanumérique|est égale à des valeurs par défaut|20,21,30,31|Permet d'afficher uniquement les PAV "supprimés" au lieu de collecte dans l'onglet Evènements|

   * relations : 
 
Sans objet

   * particularité(s) : aucune
   
## Table : `an_dec_pav_cont_tlc (actif)`

|Attributs| Champ calculé | Formatage |Renommage|Particularité/Usage|Utilisation|Exemple|
|:---|:-:|:-:|:---|:---|:---|:---|
| affiche_model |x|x|Photo (modèle)|Récupère la photo du modèle de conteneur|Fiche d'information Conteneur TLC et lieu de collecte|`'<img src ="' || (SELECT urlfic FROM m_dechet.lt_pav_modele m WHERE m.code = {model})|| '" alt="" width="50%">'`|
| affiche_result |x|x||Formate le contenu affiché dans le menu Résultat|Résultat de recherche|Conteneur  n° {idcont}|
|mat   |||Matériau|Liste de domaine  valeur_pav_contmat|Fiche d'information Conteneur TLC||
|pos     |||Position|Liste de domaine  valeur_pav_contpos|Fiche d'information Conteneur TLC||
|date_effet  |||Prise en compte dans le plan interactif||Fiche d'information Conteneur TLC||
|date_maj   |||Mis à jour le||Fiche d'information Conteneur TLC||
|date_pos     |||Posé le||Fiche d'information Conteneur TLC||
|date_sai     |||Saisie le||Fiche d'information Conteneur TLC||
|eve         |||Evènement|Liste de domaine  lt_pav_eve|Fiche d'information Conteneur TLC||
|idcont         |||Identifiant du conteneur||Fiche d'information Conteneur TLC||
|idlieu         |||Identifiant du lieu de collecte||Fiche d'information Conteneur VerTLCre||
|mat         |||Matériau|Liste de domaine  valeur_pav_contmat|Fiche d'information Conteneur TLC||
|model         |||Modèle|Liste de domaine  lt_pav_modele|Fiche d'information Conteneur TLC||
|nom_entrep         |||Gestionnaire|Liste de domaine  valeur_pav_gest|Fiche d'information Conteneur TLC||
|nom_entrep_99         |||Autre gestionnaire||Fiche d'information Conteneur TLC||
|obs_eve         |||Commentaire(s)||Fiche d'information Conteneur TLC||
|observ   |||Observation(s)||Fiche d'information Conteneur TLC||
|op_sai             |||Saisi par||Fiche d'information Conteneur TLC||
|pos                 |||Position|Liste de domaine valeur_pav_contpos|Fiche d'information Conteneur TLC||

   * filtres :

|Nom|Attribut| Au chargement | Type | Condition |Valeur|Description|
|:---|:---|:---:|:---:|:---:|:---|:---|
|TLC Actif|eve|x|alphanumérique|est égale à des valeurs par défaut|10,11,12,13,14,00|Permet d'afficher uniquement les PAV présents au lieu de collecte dans l'onglet Caractéristique|


   * relations : 
 
|Géotables ou Tables| Champs de jointure | Type |
|:---|:---|:---|
|geo_dec_pav_lieu |idlieu| 1 (égal) |


   * particularité(s) : aucune
   
## Table : `an_dec_pav_cont_tlc (inactif)`

|Attributs| Champ calculé | Formatage |Renommage|Particularité/Usage|Utilisation|Exemple|
|:---|:-:|:-:|:---|:---|:---|:---|
| affiche_model |x|x|Photo (modèle)|Récupère la photo du modèle de conteneur|Fiche d'information Conteneur TLC et lieu de collecte|`'<img src ="' || (SELECT urlfic FROM m_dechet.lt_pav_modele m WHERE m.code = {model})|| '" alt="" width="50%">'`|
|mat   |||Matériau|Liste de domaine  valeur_pav_contmat|Fiche d'information Conteneur TLC||
|pos     |||Position|Liste de domaine  valeur_pav_contpos|Fiche d'information Conteneur TLC||
|date_effet  |||Prise en compte dans le plan interactif||Fiche d'information Conteneur TLC||
|date_maj   |||Mis à jour le||Fiche d'information Conteneur TLC||
|date_pos     |||Posé le||Fiche d'information Conteneur TLC||
|date_sai     |||Saisie le||Fiche d'information Conteneur TLC||
|eve         |||Evènement|Liste de domaine  lt_pav_eve|Fiche d'information Conteneur TLC||
|idcont         |||Identifiant du conteneur||Fiche d'information Conteneur TLC||
|idlieu         |||Identifiant du lieu de collecte||Fiche d'information Conteneur VerTLCre||
|mat         |||Matériau|Liste de domaine  valeur_pav_contmat|Fiche d'information Conteneur TLC||
|model         |||Modèle|Liste de domaine  lt_pav_modele|Fiche d'information Conteneur TLC||
|nom_entrep         |||Gestionnaire|Liste de domaine  valeur_pav_gest|Fiche d'information Conteneur TLC||
|nom_entrep_99         |||Autre gestionnaire||Fiche d'information Conteneur TLC||
|obs_eve         |||Commentaire(s)||Fiche d'information Conteneur TLC||
|observ   |||Observation(s)||Fiche d'information Conteneur TLC||
|op_sai             |||Saisi par||Fiche d'information Conteneur TLC||
|pos                 |||Position|Liste de domaine valeur_pav_contpos|Fiche d'information Conteneur TLC||

   * filtres :

|Nom|Attribut| Au chargement | Type | Condition |Valeur|Description|
|:---|:---|:---:|:---:|:---:|:---|:---|
|TLC Inactif|eve|x|alphanumérique|est égale à des valeurs par défaut|20,21,30,31|Permet d'afficher uniquement les PAV présents au lieu de collecte dans l'onglet Evènement|


   * relations : 
 
|Géotables ou Tables| Champs de jointure | Type |
|:---|:---|:---|
|geo_dec_pav_lieu |idlieu| 1 (égal) |


   * particularité(s) : aucune
  
## GeoTable : `xapps_geo_v_pav_lieu_orient`

|Attributs| Champ calculé | Formatage |Renommage|Particularité/Usage|Utilisation|Exemple|
|:---|:-:|:-:|:---|:---|:---|:---|

Sans objet

   * filtres : aucun
   * relations : aucune
   * particularité(s) : vue géographique générant le trait sur la carte entre un lieu supprimé et déplacé
 
   
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


## Recherche globale : `Parcelle sélectionnée`

Cette recherche permet à l'utilisateur de faire une recherche libre sur une référence de parcelle identique à celle de l'application Grand Publique (ex : AB292).

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

## Recherche (clic sur la carte) : `Lieu de collecte`

Cette recherche permet à l'utilisateur de cliquer sur la carte et de remonter les informations du lieu de collecte.

  * Configuration :

Source : `geo_dec_pav_lieu`

|Attribut|Afficher|Rechercher|Suggestion|Attribut de géométrie|Tri des résultats|
|:---|:-:|:-:|:-:|:-:|:-:|
|Commune|x|||||
|Adresse|x|||||
|Localisation|x|||||

(la détection des doublons n'est pas activée ici)

 * Filtres :

Sans objet

(1) si liste de domaine

 * Fiches d'information active : Lieu de collecte
 
 * Particularité(s) : lancer au Démarrage dans la liste des recherches
 
 
## Recherche (clic sur la carte) : `Parcelle sélectionnée`

Cette recherche permet à l'utilisateur de cliquer sur la carte et de remonter les informations des parcelles et la note de renseignements d'urbanisme.

L'ensemble des recherches cadastrales ont été formatées et intégrées par l'éditeur via son module GeoCadastre.
Seul le nom des certaines recherches a été modifié par l'ARC pour plus de compréhension des utilisateurs.

Cette recherche est détaillée dans le répertoire GitHub `docurba`.  

 
# Recherche : `Toutes les recherches cadastrales`

L'ensemble des recherches cadastrales ont été formatées et intégrées par l'éditeur via son module GeoCadastre.
Seul le nom des certaines recherches a été modifié par l'ARC pour plus de compréhension des utilisateurs.

Cette recherche est détaillée dans le répertoire GitHub `docurba`.


# Recherche PAV

## Rechercher un conteneur Verre

### Recherche : `PAV par référence`

Cette recherche permet à l'utilisateur de faire une recherche guidée sur un PAV Verre d'après sa référence.

  * Configuration :

Source : `an_dec_pav_cont (actif)`

|Attribut|Afficher|Rechercher|Suggestion|Attribut de géométrie|Tri des résultats|
|:---|:-:|:-:|:-:|:-:|:-:|
|affiche_résult|x|||||
|Commune|x|||||
|Adresse|x|||||
|Localisation|x|||||


(la détection des doublons n'est pas activée ici)

 * Filtres :

|Nom|Obligatoire|Attribut|Condition|Valeur|Champ d'affichage (1)|Champ de valeurs (1)|Champ de tri (1)|Ajout autorisé (1)|Particularités|
|:---|:-:|:---|:---|:---|:---|:---|:---|:-:|:---|
|Identifiant PAV Verre|x|idcont|Est égale à une valeur saisie||||||N° de PAV :|

(1) si liste de domaine

 * Fiches d'information active : Fiche conteneur à verre
 
 * Particularité(s) : la geom est celle des lieux de collecte
 
### Recherche : `Lieu de collecte par localisation`

Cette recherche permet à l'utilisateur de faire une recherche guidée sur un lieu de collecte sa commune et/ou son adresse de localisation.

  * Configuration :

Source : `geo_dec_pav_lieu`

|Attribut|Afficher|Rechercher|Suggestion|Attribut de géométrie|Tri des résultats|
|:---|:-:|:-:|:-:|:-:|:-:|
|Commune|x|||||
|Adresse|x|||||
|Localisation|x|||||


(la détection des doublons n'est pas activée ici)

 * Filtres :

|Groupe|Jointure|Filtres liés|
|:---|:-:|:-:|
|Groupe de filtres par défaut|`ET`|x|

|Nom|Obligatoire|Attribut|Condition|Valeur|Champ d'affichage (1)|Champ de valeurs (1)|Champ de tri (1)|Ajout autorisé (1)|Particularités|
|:---|:-:|:---|:---|:---|:---|:---|:---|:-:|:---|
|Actif|x|statut|Est égal à des valeurs par défaut |10||||||
|Verre|x|cttype|Est égal à des valeurs par défaut |10,30||||||
|Commune||commune|Est égal à une valeur de liste de choix |Commune (lieu de collecte)|commune|commune|commune|non|Titre : Commune|
|Adresse||commune|Est égal à une valeur de liste de choix |Adresse (lieu de collecte)|adresse|adresse|adresse|non|Titre : Adresse|


(1) si liste de domaine

 * Fiches d'information active : Lieu de collecte

### Recherche : `Lieu de collecte par implantation`

Cette recherche permet à l'utilisateur de faire une recherche guidée sur un lieu de collecte d'après son lieu d'implantation.

  * Configuration :

Source : `geo_dec_pav_lieu`

|Attribut|Afficher|Rechercher|Suggestion|Attribut de géométrie|Tri des résultats|
|:---|:-:|:-:|:-:|:-:|:-:|
|Commune|x|||||
|Adresse|x|||||
|Localisation|x|||||

(la détection des doublons n'est pas activée ici)

 * Filtres :

|Groupe|Jointure|Filtres liés|
|:---|:-:|:-:|
|Groupe de filtres par défaut|`ET`|x|

|Nom|Obligatoire|Attribut|Condition|Valeur|Champ d'affichage (1)|Champ de valeurs (1)|Champ de tri (1)|Ajout autorisé (1)|Particularités|
|:---|:-:|:---|:---|:---|:---|:---|:---|:-:|:---|
|Actif|x|statut|Est égal à des valeurs par défaut |10||||||
|Verre|x|cttype|Est égal à des valeurs par défaut |10,30||||||
|Implantation|x|env_implan|Est égal à une valeur de liste de choix |lt_pav_envimplan|env_implan_lib|env_implan|env_implan|non|Titre : Type d'espace urbain d'implantation|


(1) si liste de domaine

 * Fiches d'information active : Lieu de collecte

### Recherche : `Lieu de collecte par nature du problème`

Cette recherche permet à l'utilisateur de faire une recherche guidée sur un lieu de collecte d'après son lieu d'implantation.

  * Configuration :

Source : `geo_dec_pav_lieu`

|Attribut|Afficher|Rechercher|Suggestion|Attribut de géométrie|Tri des résultats|
|:---|:-:|:-:|:-:|:-:|:-:|
|Commune|x|||||
|Adresse|x|||||
|Localisation|x|||||

(la détection des doublons n'est pas activée ici)

 * Filtres :

|Groupe|Jointure|Filtres liés|
|:---|:-:|:-:|
|Groupe de filtres par défaut|`ET`|x|

|Nom|Obligatoire|Attribut|Condition|Valeur|Champ d'affichage (1)|Champ de valeurs (1)|Champ de tri (1)|Ajout autorisé (1)|Particularités|
|:---|:-:|:---|:---|:---|:---|:---|:---|:-:|:---|
|Actif|x|statut|Est égal à des valeurs par défaut |10||||||
|Verre|x|cttype|Est égal à des valeurs par défaut |10,30||||||
|Nature du problème|x|env_implan|Est égal à une valeur de liste de choix |lt_pav_natpb|nat_pb_lib|nat_pb|nat_pb|non|Titre : Nature du problème|


(1) si liste de domaine

 * Fiches d'information active : Lieu de collecte

### Recherche : `Lieu de collecte à moins de 300 mètres` (en cours de réalisation)

Cette recherche permet à l'utilisateur de faire une recherche d'un lieu de collecte à moins de 300 mètres d'une adresse.

  * Configuration :

Source : `xapps_geo_vmr_adresse`

|Attribut|Afficher|Rechercher|Suggestion|Attribut de géométrie|Tri des résultats|
|:---|:-:|:-:|:-:|:-:|:-:|

 * Filtres :
 
|Groupe|Jointure|Filtres liés|
|:---|:-:|:-:|
|Groupe de filtres par défaut|`ET`|x|

|Nom|Obligatoire|Attribut|Condition|Valeur|Champ d'affichage (1)|Champ de valeurs (1)|Champ de tri (1)|Ajout autorisé (1)|Particularités|
|:---|:-:|:---|:---|:---|:---|:---|:---|:-:|:---|


(1) si liste de domaine

 * Fiches d'information active : Lieu de collecte


## Rechercher un conteneur TLC




# Recherche : `Toutes les recherches avancées d'une adresse ou d'une voie`

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


