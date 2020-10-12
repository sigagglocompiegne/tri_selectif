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
- Peut gérer les modèles de PAV

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
|Erreur idparent|update|new.Statut = 20 et old.idparent >= 14 et new.statut <> old.statut|Annule la saisie|Boîte de dialogue : L'identifiant du lieu précédent est à indiquer sur le nouveau lieu de collecte créé.| 
|Pas de suppression possible|delete||Annule la saisie|Boîte de dialogue : Vous ne pouvez pas supprimer de lieux de collecte. Si celui-ci n'existe plus, vous devez le rendre inactif dans l'attribut état. Si il est déplacé, vous devez le rendre inactif et créer un nouveau lieu en indiquant l'identifiant de l'ancien lieu dans la partie préconisation.| 
|Vérif Service SIG|insert, update|ID parent saisi|Envoi Email|Envoi un email au service SIG pour vérifier si la saisie de l'identifiant de l'ancien lieu de collecte est correct| 

   * particularité(s) : aucune

## Table : `an_dec_pav_cont (actif)`

|Attributs| Champ calculé | Formatage |Renommage|Particularité/Usage|Utilisation|Exemple|
|:---|:-:|:-:|:---|:---|:---|:---|
| affiche_model |x|x|Photo (modèle)|Récupère la photo du modèle de conteneur|Fiche d'information Verre et lieu de collecte|`'<img src ="https://geo.compiegnois.fr/documents/metiers/env/dechet/model_pav/' (SELECT n_fichier FROM m_dechet.an_dec_pav_model_media WHERE id = {model} ) '" alt="" width="70%">'`|
| affiche_result |x|x||Formate le contenu affiché dans le menu Résultat|Résultat de recherche|Conteneur à verre n° {idcont}|
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
|mode_preh         |||Mode de préhension|Liste de domaine  valeur_pav_modepreh|Fiche d'information Conteneur Verre||
|model         |||Modèle|Liste de domaine  lt_pav_modele (Verre)|Fiche d'information Conteneur Verre||
|obs_eve         |||Commentaire(s)||Fiche d'information Conteneur Verre||
|observ   |||Observation(s)||Fiche d'information Conteneur Verre||
|op_sai             |||Saisi par||Fiche d'information Conteneur Verre||
|opercules             |||Opercules|Booléen (oui/non)|Fiche d'information Conteneur Verre||
|peinture                 |||Etat de la peinture|Liste de domaine valeur_pav_peinture|Fiche d'information Conteneur Verre|| 
|proprete                   |||Etat de Propreté|Liste de domaine   valeur_pav_proprete|Fiche d'information Conteneur Verre|| 
|tags                     |||Présence de tags|Booléen oui/non |Fiche d'information Conteneur Verre||  
|trp_rest                     |||Présence d'une trappe pour restaurateur|Booléen oui/non |Fiche d'information Conteneur Verre||
|type_sign                        |||Type de signalétique|Liste de domaine    valeur_pav_typesign |Fiche d'information Conteneur Verre||  
|type_sol                        |||Type de sol|Liste de domaine    valeur_pav_typesol |Fiche d'information Conteneur Verre||  
 

   * filtres :

|Nom|Attribut| Au chargement | Type | Condition |Valeur|Description|
|:---|:---|:---:|:---:|:---:|:---|:---|
|Actif|eve|x|alphanumérique|est égale à des valeurs par défaut|10,11,12,13,14,00|Permet d'afficher uniquement les PAV présents au lieu de collecte dans l'onglet Caractéristique|


   * relations : 
 
|Géotables ou Tables| Champs de jointure | Type |
|:---|:---|:---|
|geo_dec_pav_lieu |idlieu| 1 (égal) |
|lt_pav_model |model| 0..1 (égal) |


   * particularité(s) : aucune

## Table : `an_dec_pav_cont (inactif)`

|Attributs| Champ calculé | Formatage |Renommage|Particularité/Usage|Utilisation|Exemple|
|:---|:-:|:-:|:---|:---|:---|:---|
| affiche_model |x|x|Photo (modèle)|Récupère la photo du modèle de conteneur|Fiche d'information Verre et lieu de collecte|`'<img src ="https://geo.compiegnois.fr/documents/metiers/env/dechet/model_pav/' (SELECT n_fichier FROM m_dechet.an_dec_pav_model_media WHERE id = {model} ) '" alt="" width="70%">'`| 
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
|mode_preh         |||Mode de préhension|Liste de domaine  valeur_pav_modepreh|Fiche d'information Conteneur Verre||
|model         |||Modèle|Liste de domaine  lt_pav_modele (Verre)|Fiche d'information Conteneur Verre||
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


   * filtres :

|Nom|Attribut| Au chargement | Type | Condition |Valeur|Description|
|:---|:---|:---:|:---:|:---:|:---|:---|
|Inactif|eve|x|alphanumérique|est égale à des valeurs par défaut|20,21,30,31|Permet d'afficher uniquement les PAV "supprimés" au lieu de collecte dans l'onglet Evènements|

   * relations : 
 
|Géotables ou Tables| Champs de jointure | Type |
|:---|:---|:---|
|lt_pav_model |model| 0..1 (égal) |

   * particularité(s) : aucune
   
## Table : `an_dec_pav_cont_tlc (actif)`

|Attributs| Champ calculé | Formatage |Renommage|Particularité/Usage|Utilisation|Exemple|
|:---|:-:|:-:|:---|:---|:---|:---|
| affiche_model |x|x|Photo (modèle)|Récupère la photo du modèle de conteneur|Fiche d'information Conteneur TLC et lieu de collecte|`'<img src ="https://geo.compiegnois.fr/documents/metiers/env/dechet/model_pav/' (SELECT n_fichier FROM m_dechet.an_dec_pav_model_media WHERE id = {model} ) '" alt="" width="70%">'`|
| affiche_result |x|x||Formate le contenu affiché dans le menu Résultat|Résultat de recherche|Conteneur  n° {idcont}|
|pos     |||Position|Liste de domaine  valeur_pav_contpos|Fiche d'information Conteneur TLC||
|date_effet  |||Prise en compte dans le plan interactif||Fiche d'information Conteneur TLC||
|date_maj   |||Mis à jour le||Fiche d'information Conteneur TLC||
|date_pos     |||Posé le||Fiche d'information Conteneur TLC||
|date_sai     |||Saisie le||Fiche d'information Conteneur TLC||
|eve         |||Evènement|Liste de domaine  lt_pav_eve|Fiche d'information Conteneur TLC||
|idcont         |||Identifiant du conteneur||Fiche d'information Conteneur TLC||
|idlieu         |||Identifiant du lieu de collecte||Fiche d'information Conteneur VerTLCre||
|model         |||Modèle|Liste de domaine  lt_pav_modele (TLC)|Fiche d'information Conteneur TLC||
|nom_entrep         |||Gestionnaire|Liste de domaine  valeur_pav_gest|Fiche d'information Conteneur TLC||
|nom_entrep_99         |||Autre gestionnaire||Fiche d'information Conteneur TLC||
|obs_eve         |||Commentaire(s)||Fiche d'information Conteneur TLC||
|observ   |||Observation(s)||Fiche d'information Conteneur TLC||
|op_sai             |||Saisi par||Fiche d'information Conteneur TLC||

   * filtres :

|Nom|Attribut| Au chargement | Type | Condition |Valeur|Description|
|:---|:---|:---:|:---:|:---:|:---|:---|
|TLC Actif|eve|x|alphanumérique|est égale à des valeurs par défaut|10,11,12,13,14,00|Permet d'afficher uniquement les PAV présents au lieu de collecte dans l'onglet Caractéristique|


   * relations : 
 
|Géotables ou Tables| Champs de jointure | Type |
|:---|:---|:---|
|geo_dec_pav_lieu |idlieu| 1 (égal) |
|lt_pav_model |model| 0..1 (égal) |


   * particularité(s) : aucune
   
## Table : `an_dec_pav_cont_tlc (inactif)`

|Attributs| Champ calculé | Formatage |Renommage|Particularité/Usage|Utilisation|Exemple|
|:---|:-:|:-:|:---|:---|:---|:---|
| affiche_model |x|x|Photo (modèle)|Récupère la photo du modèle de conteneur|Fiche d'information Conteneur TLC et lieu de collecte|`'<img src ="https://geo.compiegnois.fr/documents/metiers/env/dechet/model_pav/' (SELECT n_fichier FROM m_dechet.an_dec_pav_model_media WHERE id = {model} ) '" alt="" width="70%">'`|
| affiche_result |x|x|||TLC par référence (2020), TLC par gestionnaire|Conteneur TLC n° {idcont}|
|pos     |||Position|Liste de domaine  valeur_pav_contpos|Fiche d'information Conteneur TLC||
|date_effet  |||Prise en compte dans le plan interactif||Fiche d'information Conteneur TLC||
|date_maj   |||Mis à jour le||Fiche d'information Conteneur TLC||
|date_pos     |||Posé le||Fiche d'information Conteneur TLC||
|date_sai     |||Saisie le||Fiche d'information Conteneur TLC||
|eve         |||Evènement|Liste de domaine  lt_pav_eve|Fiche d'information Conteneur TLC||
|idcont         |||Identifiant du conteneur||Fiche d'information Conteneur TLC||
|idlieu         |||Identifiant du lieu de collecte||Fiche d'information Conteneur VerTLCre||
|model         |||Modèle|Liste de domaine  lt_pav_modele (TLC)|Fiche d'information Conteneur TLC||
|nom_entrep         |||Gestionnaire|Liste de domaine  valeur_pav_gest|Fiche d'information Conteneur TLC||
|nom_entrep_99         |||Autre gestionnaire||Fiche d'information Conteneur TLC||
|obs_eve         |||Commentaire(s)||Fiche d'information Conteneur TLC||
|observ   |||Observation(s)||Fiche d'information Conteneur TLC||
|op_sai             |||Saisi par||Fiche d'information Conteneur TLC||

   * filtres :

|Nom|Attribut| Au chargement | Type | Condition |Valeur|Description|
|:---|:---|:---:|:---:|:---:|:---|:---|
|TLC Inactif|eve|x|alphanumérique|est égale à des valeurs par défaut|20,21,30,31|Permet d'afficher uniquement les PAV présents au lieu de collecte dans l'onglet Evènement|


   * relations : 
 
|Géotables ou Tables| Champs de jointure | Type |
|:---|:---|:---|
|lt_pav_model |model| 0..1 (égal) |


   * particularité(s) : aucune
  
## GeoTable : `xapps_geo_v_pav_lieu_orient`

|Attributs| Champ calculé | Formatage |Renommage|Particularité/Usage|Utilisation|Exemple|
|:---|:-:|:-:|:---|:---|:---|:---|

Sans objet

   * filtres : aucun
   * relations : aucune
   * particularité(s) : vue géographique générant le trait sur la carte entre un lieu supprimé et déplacé
 
   
## Table : `an_dec_pav_model_media`

|Attributs| Champ calculé | Formatage |Renommage|Particularité/Usage|Utilisation|Exemple|
|:---|:-:|:-:|:---|:---|:---|:---|
|gid  |||Identifiant||||
|date_sai  |||Date d'intégration du document||Fiche d'information Conteneur à verre ou textile||
|id  |||Identifiant du PAV||Fiche d'information Conteneur à verre ou textile||
|media    |||Champ Média de GEO||||
|miniature    |||Champ miniature de GEO||Fiche d'information Conteneur à verre ou textile||
|n_fichier     |||Nom du fichier||Fiche d'information Conteneur à verre ou textile||
|op_sai      |||Libellé de l'opérateur ayant intégrer le document||Fiche d'information Conteneur à verre ou textile||
|t_fichier       |||Type de média dans GEO||Fiche d'information Conteneur à verre ou textile||

   * filtres : aucun
   * relations : aucune
   * particularité(s) : aucune
   
## Table : `an_dec_pav_doc_media`

|Attributs| Champ calculé | Formatage |Renommage|Particularité/Usage|Utilisation|Exemple|
|:---|:-:|:-:|:---|:---|:---|:---|
|gid  |||Identifiant||||
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

## Table : `lt_pav_modele`

|Attributs| Champ calculé | Formatage |Renommage|Particularité/Usage|Utilisation|Exemple|
|:---|:-:|:-:|:---|:---|:---|:---|
|affiche_blanc |x||||Résultat requête liste des modèles||
|affiche_model |x|'<center><b>' || {valeur} || '</b><br>' CASE WHEN (SELECT COUNT(*) FROM  m_dechet.an_dec_pav_model_media WHERE id = {code}) = 0 THEN
'Aucune photographie du modèle associé' ELSE '<img src="http://geo.compiegnois.fr/documents/metiers/env/dechet/model_pav/' (SELECT n_fichier FROM m_dechet.an_dec_pav_model_media WHERE id = {code}) '" alt ="">' END '</center>'|||Résultat requête liste des modèles||

   * filtres : aucun
   * relations :
   
|Géotables ou Tables| Champs de jointure | Type |
|:---|:---|:---|
|an_dec_pav_model_media |code| 0..n (égal) |   

   * particularité(s) : cette table de liste de valeurs a une jointure permettant de récupérer la photo du modèle. Cette liaison et la réalisation d'un média permet au service déchet d'être autonome pour la gestion de leur modèle de PAV. Cette table a été rechargée 2 fois pour gérer le filtrage des types Verre et TLV et permettre l'ajout de modèles par type (ci ci-après)
   
## Table : `lt_pav_modele` (lt_pav_modele (verre))

|Attributs| Champ calculé | Formatage |Renommage|Particularité/Usage|Utilisation|Exemple|
|:---|:-:|:-:|:---|:---|:---|:---|
|affiche_blanc |x||||Résultat requête liste des modèles||
|affiche_model |x|'<center><b>' || {valeur} || '</b><br>' CASE WHEN (SELECT COUNT(*) FROM  m_dechet.an_dec_pav_model_media WHERE id = {code}) = 0 THEN
'Aucune photographie du modèle associé' ELSE '<img src="http://geo.compiegnois.fr/documents/metiers/env/dechet/model_pav/' (SELECT n_fichier FROM m_dechet.an_dec_pav_model_media WHERE id = {code}) '" alt ="">' END '</center>'|||Résultat requête liste des modèles||

   * filtres : 

|Nom|Attribut| Au chargement | Type | Condition |Valeur|Description|
|:---|:---|:---:|:---:|:---:|:---|:---|
|Modèle PAV Verre|cttype|x|alphanumérique|est égale à des valeurs par défaut|10,00|Permet d'afficher uniquement les modèles de PAV de type Verre|
   
   * relations :
   
|Géotables ou Tables| Champs de jointure | Type |
|:---|:---|:---|
|an_dec_pav_model_media |code| 0..n (égal) |   

   * particularité(s) : un déclencheur par envoi d'email a été créé à l'ajout d'un modèle pour vérification apr le service SIG

## Table : `lt_pav_modele` (lt_pav_modele (TLC))

|Attributs| Champ calculé | Formatage |Renommage|Particularité/Usage|Utilisation|Exemple|
|:---|:-:|:-:|:---|:---|:---|:---|
|affiche_blanc |x||||Résultat requête liste des modèles||
|affiche_model |x|'<center><b>' || {valeur} || '</b><br>' CASE WHEN (SELECT COUNT(*) FROM  m_dechet.an_dec_pav_model_media WHERE id = {code}) = 0 THEN
'Aucune photographie du modèle associé' ELSE '<img src="http://geo.compiegnois.fr/documents/metiers/env/dechet/model_pav/' (SELECT n_fichier FROM m_dechet.an_dec_pav_model_media WHERE id = {code}) '" alt ="">' END '</center>'|||Résultat requête liste des modèles||

   * filtres : 

|Nom|Attribut| Au chargement | Type | Condition |Valeur|Description|
|:---|:---|:---:|:---:|:---:|:---|:---|
|Modèle PAV TLV|cttype|x|alphanumérique|est égale à des valeurs par défaut|20,00|Permet d'afficher uniquement les modèles de PAV de type TLC|
   
   * relations :
   
|Géotables ou Tables| Champs de jointure | Type |
|:---|:---|:---|
|an_dec_pav_model_media |code| 0..n (égal) |   

   * particularité(s) : un déclencheur par envoi d'email a été créé à l'ajout d'un modèle pour vérification apr le service SIG

## Table : `xapps_an_dec_pav_eve_tab`

|Attributs| Champ calculé | Formatage |Renommage|Particularité/Usage|Utilisation|Exemple|
|:---|:-:|:-:|:---|:---|:---|:---|
|date_eve |||Date||Recherche Mouvement enregistré sur les PAV Verre||
|lieu |||Lieu||Recherche Mouvement enregistré sur les PAV Verre||
|nom_eve |||Evènement||Recherche Mouvement enregistré sur les PAV Verre||
|obs_eve |||Commentaire(s)||Recherche Mouvement enregistré sur les PAV Verre||

   * filtres : aucun
   * relations :
   
|Géotables ou Tables| Champs de jointure | Type |
|:---|:---|:---|
|geo_dec_pav_lieu |idlieu| 0..1 (égal) |   

   * particularité(s) : table générant un pré-traitement afin d'afficher les évènements passés des PAV Verre par année (utilisé pour les tableaux de bord)

## Table : `xapps_an_dec_lieu_eve_tab`

|Attributs| Champ calculé | Formatage |Renommage|Particularité/Usage|Utilisation|Exemple|
|:---|:-:|:-:|:---|:---|:---|:---|
|date_eve |||Date||Mouvement enregistré sur les lieux de collecte (Verre)||
|lieu |||Lieu||Mouvement enregistré sur les lieux de collecte (Verre)||
|lieu_old |||Ancien lieu||Mouvement enregistré sur les lieux de collecte (Verre)||
|lieu_new |||Nouveau lieu||Mouvement enregistré sur les lieux de collecte (Verre)||

   * filtres : aucun
   * relations :
   
|Géotables ou Tables| Champs de jointure | Type |
|:---|:---|:---|
|geo_dec_pav_lieu |idlieu| 0..1 (égal) |   

   * particularité(s) : table générant un pré-traitement afin d'afficher les évènements passés des lieux de collecte par année (utilisé pour les tableaux de bord)
   

## Table : `xapps_an_dec_pav_chiffre_cle_tab`

   * champs : aucun attribut formaté dans GEO 
   * filtres : aucun
   * relations : aucune
   * particularité(s) : table générant un pré-traitement afin d'afficher les chiffres clés des PAV Verre (utilisé pour les tableaux de bord)


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
|Identifiant PAV Verre|x|idcont|Est égale à une valeur saisie||||||Titre : N° de PAV :|

(1) si liste de domaine

 * Fiches d'information active : Fiche conteneur à verre
 
 * Particularité(s) : la geom est celle des lieux de collecte
 
### Recherche : `Lieu de collecte par localisation`

Cette recherche permet à l'utilisateur de faire une recherche guidée sur un lieu de collecte disposant de PAV Verre sur sa commune et/ou son adresse de localisation.

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


## Rechercher un conteneur TLC

### Recherche : `TLC par référence`

Cette recherche permet à l'utilisateur de faire une recherche guidée sur un PAV TLC d'après sa référence.

  * Configuration :

Source : `an_dec_pav_cont_tlc (actif)`

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
|Identifiant PAV TLC|x|idcont|Est égale à une valeur saisie||||||Titre : N° de TLC :|

(1) si liste de domaine

 * Fiches d'information active : Fiche conteneur TLC
 
 * Particularité(s) : la geom est celle des lieux de collecte

### Recherche : `TLC par gestionnaire`

Cette recherche permet à l'utilisateur de faire une recherche guidée sur un PAV TLC d'après l'entreprise qui en a la gestion.

  * Configuration :

Source : `an_dec_pav_cont_tlc (actif)`

|Attribut|Afficher|Rechercher|Suggestion|Attribut de géométrie|Tri des résultats|
|:---|:-:|:-:|:-:|:-:|:-:|
|affiche_résult|x|||||
|Gestionnaire|x|||||
|Commune|x|||||
|Adresse|x|||||
|Localisation|x|||||


(la détection des doublons n'est pas activée ici)

 * Filtres :

|Nom|Obligatoire|Attribut|Condition|Valeur|Champ d'affichage (1)|Champ de valeurs (1)|Champ de tri (1)|Ajout autorisé (1)|Particularités|
|:---|:-:|:---|:---|:---|:---|:---|:---|:-:|:---|
|Actif|x|statut|Est égal à des valeurs par défaut |10||||||
|TLC|x|cttype|Est égal à des valeurs par défaut |20,30||||||
|gestionnaire|x|nom_entrep|Prédéfinis Filtre à liste de choix||||||Titre : Gestionnaire : |

(1) si liste de domaine

 * Fiches d'information active : Fiche conteneur TLC
 
 * Particularité(s) : la geom est celle des lieux de collecte
 
### Recherche : `Lieu de collecte par localisation`

Cette recherche permet à l'utilisateur de faire une recherche guidée sur un lieu de collecte disposant de PAV TLC.

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
|TLC|x|cttype|Est égal à des valeurs par défaut |20,30||||||
|Commune||commune|Est égal à une valeur de liste de choix |Commune (lieu de collecte)|commune|commune|commune|non|Titre : Commune|
|Adresse||commune|Est égal à une valeur de liste de choix |Adresse (lieu de collecte)|adresse|adresse|adresse|non|Titre : Adresse|

(1) si liste de domaine

 * Fiches d'information active : Lieu de collecte
 
 * Particularité(s) : la geom est celle des lieux de collecte
 
 

## Export des données

### Recherche : `Export PAV Verre`

Cette recherche permet à l'utilisateur de faire une recherche sur tous les lieux de collecte actif disposant d'un PAV Verre pour les exporter.

  * Configuration :

Source : `geo_dec_pav_lieu`

|Attribut|Afficher|Rechercher|Suggestion|Attribut de géométrie|Tri des résultats|
|:---|:-:|:-:|:-:|:-:|:-:|
|Identifiant du lieu de collecte|x|||||
|Identifiant du conteneur|x|||||
|Type|x|||||
|Commune|x|||||
|Quartier|x|||||
|Adresse|x|||||
|Localisation|x|||||
|Posé le|x|||||
|Modèle|x|||||

(la détection des doublons n'est pas activée ici)

 * Filtres :

|Groupe|Jointure|Filtres liés|
|:---|:-:|:-:|
|Groupe de filtres par défaut|`ET`||

|Nom|Obligatoire|Attribut|Condition|Valeur|Champ d'affichage (1)|Champ de valeurs (1)|Champ de tri (1)|Ajout autorisé (1)|Particularités|
|:---|:-:|:---|:---|:---|:---|:---|:---|:-:|:---|
|Actif|x|statut|Est égal à des valeurs par défaut |10||||||
|Verre|x|cttype|Est égal à des valeurs par défaut |10,30||||||


(1) si liste de domaine

 * Fiches d'information active : aucune
 
 * Particularité(s) : aucune
 
### Recherche : `Export PAV TLC`

Cette recherche permet à l'utilisateur de faire une recherche sur tous les lieux de collecte actif disposant d'un PAV TLC pour les exporter.

  * Configuration :

Source : `geo_dec_pav_lieu`

|Attribut|Afficher|Rechercher|Suggestion|Attribut de géométrie|Tri des résultats|
|:---|:-:|:-:|:-:|:-:|:-:|
|Identifiant du lieu de collecte|x|||||
|Identifiant du conteneur|x|||||
|Type|x|||||
|Commune|x|||||
|Adresse|x|||||
|Localisation|x|||||
|Gestionnaire|x|||||
|Autre gestionnaire|x|||||
|Posé le|x|||||
|Modèle|x|||||

(la détection des doublons n'est pas activée ici)

 * Filtres :

|Groupe|Jointure|Filtres liés|
|:---|:-:|:-:|
|Groupe de filtres par défaut|`ET`||

|Nom|Obligatoire|Attribut|Condition|Valeur|Champ d'affichage (1)|Champ de valeurs (1)|Champ de tri (1)|Ajout autorisé (1)|Particularités|
|:---|:-:|:---|:---|:---|:---|:---|:---|:-:|:---|
|Actif|x|statut|Est égal à des valeurs par défaut |10||||||
|tlc|x|cttype|Est égal à des valeurs par défaut |20,30||||||


(1) si liste de domaine

 * Fiches d'information active : aucune
 
 * Particularité(s) : aucune

## Gestion des modèles

### Recherche : `Liste des modèles`

Cette recherche permet à l'utilisateur d'afficher dans le menu résultat tous les modèles de PAV Verre ou TLC.

  * Configuration :

Source : `lt_pav_modele`

|Attribut|Afficher|Rechercher|Suggestion|Attribut de géométrie|Tri des résultats|
|:---|:-:|:-:|:-:|:-:|:-:|
|affiche_blanc|x|||||
|affiche_model|x|||||

(la détection des doublons n'est pas activée ici)

 * Filtres :

|Groupe|Jointure|Filtres liés|
|:---|:-:|:-:|
|Groupe de filtres par défaut|`ET`||

|Nom|Obligatoire|Attribut|Condition|Valeur|Champ d'affichage (1)|Champ de valeurs (1)|Champ de tri (1)|Ajout autorisé (1)|Particularités|
|:---|:-:|:---|:---|:---|:---|:---|:---|:-:|:---|
|Liste Modèle|x|code|Est différent de |0||||||


(1) si liste de domaine

 * Fiches d'information active : Modèle de PAV
 
 * Particularité(s) : Tri des résultat par code
 
### Recherche : `Liste des modèles`

Permet à l'utilisateur d'afficher l'ensemble des modèles de PAV Verre ou TLC.

  * Configuration :

Source : `lt_pav_modele`

 * Fiches d'information active : Fiche du moèdle de PAV
 
 * Particularité(s) : sans objet

### Recherche : `Mouvement enregistré sur les PAV Verre`

Cette recherche permet à l'utilisateur d'optenir une liste des évènements intervenus pour une année n dans le tableau de bord de l'application pour les points d'apport volontaire Verre.

  * Configuration :

Source : `xapps_an_dec_pav_eve_tab`

|Attribut|Afficher|Rechercher|Suggestion|Attribut de géométrie|Tri des résultats|
|:---|:-:|:-:|:-:|:-:|:-:|
|Date|x|||||
|Evènement|x|||||
|Lieu|x|||||
|Commentaire(s)|x|||||


(la détection des doublons n'est pas activée ici)

 * Filtres :

|Groupe|Jointure|Filtres liés|
|:---|:-:|:-:|
|Groupe de filtres par défaut|`ET`||

|Nom|Obligatoire|Attribut|Condition|Valeur|Champ d'affichage (1)|Champ de valeurs (1)|Champ de tri (1)|Ajout autorisé (1)|Particularités|
|:---|:-:|:---|:---|:---|:---|:---|:---|:-:|:---|
|Année||annee_eve|Est égal à une valeur de liste de choix |lt_pav_annee_eve|annee_eve|annee_eve|annee_eve|||


(1) si liste de domaine

 * Fiches d'information active : aucune
 
 * Particularité(s) : aucune
 
### Recherche : `Mouvement enregistré sur les lieux de collecte (Verre)`

Cette recherche permet à l'utilisateur d'optenir une liste des évènements intervenus pour une année n dans le tableau de bord de l'application pour les lieux de collecte.

  * Configuration :

Source : `xapps_an_dec_lieu_eve_tab`

|Attribut|Afficher|Rechercher|Suggestion|Attribut de géométrie|Tri des résultats|
|:---|:-:|:-:|:-:|:-:|:-:|
|Date|x|||||
|Evènement|x|||||
|Ancien lieu|x|||||
|Nouveau lieu|x|||||

(la détection des doublons n'est pas activée ici)

 * Filtres :

|Groupe|Jointure|Filtres liés|
|:---|:-:|:-:|
|Groupe de filtres par défaut|`ET`||

|Nom|Obligatoire|Attribut|Condition|Valeur|Champ d'affichage (1)|Champ de valeurs (1)|Champ de tri (1)|Ajout autorisé (1)|Particularités|
|:---|:-:|:---|:---|:---|:---|:---|:---|:-:|:---|
|Année||annee_eve|Est égal à une valeur de liste de choix (par défaut 2020)|lt_pav_annee_eve|annee_eve|annee_eve|annee_eve|||


(1) si liste de domaine

 * Fiches d'information active : aucune
 
 * Particularité(s) : aucune

# Recherche : `Toutes les recherches avancées d'une adresse ou d'une voie`

L'ensemble des recherches d'adresse ou de voies ont été formatées pour l'application de gestion des Voies et des Adresses.

Cette recherche est détaillée dans le répertoire GitHub `RVA`.

# Gestion des lieux de collecte

## Recherche : `Insérer ou déplacer mon lieu de collecte`

Cette fonctionnalité (modification géométriques) permet à l'utilisateur de faire de saisir ou de déplacer le point correspondant au lieu de collecte.
Se reporter à la partie Modification Géométrique plus bas pour la configuration de cette fonction.


## Fiche d'information : `Lieu de collecte`

Source : `geo_dec_pav_lieu`

* Statistique : aucune
 
 * Représentation :
 
|Mode d'ouverture|Taille|Agencement des sections|
|:---|:---|:---|
|dans le gabarit|1100x700|Onglets|

|Nom de la section|Attributs|Position label|Agencement attribut|Visibilité conditionnelle|Fichie liée|Ajout de données autorisé|
|:---|:---|:---|:---|:---|:---|:---|
|Lieu de collecte|||||||

|Nom de la sous-section|Attributs|Position label|Agencement attribut|Visibilité conditionnelle|Fichie liée|Ajout de données autorisé|
|:---|:---|:---|:---|:---|:---|:---|
|Caractéristiques|||||||

Cette section est agencée verticalement.

|Nom de la sous-sous-section|Attributs|Position label|Agencement attribut|Visibilité conditionnelle|Fichie liée|Ajout de données autorisé|
|:---|:---|:---|:---|:---|:---|:---|
|(vide)|||Onglets||||

|Nom de la sous-sous-sous-section|Attributs|Position label|Agencement attribut|Visibilité conditionnelle|Fichie liée|Ajout de données autorisé|
|:---|:---|:---|:---|:---|:---|:---|
|Localisation|Commune(commune), Adresse(adresse), Quartier(quartier), Localisation (localisation), Nombre de conteneur(s) Verre (nb_cont)|par défaut|Vertical|||
|Descriptif|Statut(statut), Type(cttype), Corbeille à proximité (prox_corb), Type d'environnement (env_type), Type d'espace urbain d'implantation (env_implan), Situation domaniale (env_situ)|par défaut|Vertical||||
|Etat|Etat de propreté des abords (prop_abor), Accessibilité à revoir (ame_access), Nature du problème (nat_pb), Autre problème (nat_pb_99)|par défaut|Vertical|Si nat_pb = '99' affiche nat_pb_99|||
|Préconisation|Nb de conteneurs manquant ou excédents par rapport aux préconisations éco-emballages (opt_pav), Orientation retenue (pavorient), Identifiant du lieu précédent (idparent)|par défaut|Vertical||||
|Médiathèque|Champ miniature de GEO (miniature)|par défaut|Vertical||Média - PAV (photo)||

|Nom de la sous-sous-section|Attributs|Position label|Agencement attribut|Visibilité conditionnelle|Fichie liée|Ajout de données autorisé|
|:---|:---|:---|:---|:---|:---|:---|
|(vide)|||Vertical||||

|Nom de la sous-sous-section|Attributs|Position label|Agencement attribut|Visibilité conditionnelle|Fichie liée|Ajout de données autorisé|
|:---|:---|:---|:---|:---|:---|:---|
|Liste des conteneurs(s) Verre|Identifiant du conteneur (idcont), Ref Prestataire (idpresta), Modèle (model), Photo (modèle) (affiche_model), Evènement (eve), Date de l'évènement (dat_eve)|par défaut|Vertical|Fiche conteneur Verre|x|
|Liste des conteneurs(s) TLC|Identifiant du conteneur (idcont_1), Gestionnaire (nom_entrep), Modèle (model_1), Modèle (photo) (affiche_model_1), Evènement (eve_1)|par défaut|Vertical|Fiche conteneur TLC|x|

|Nom de la sous-section|Attributs|Position label|Agencement attribut|Visibilité conditionnelle|Fichie liée|Ajout de données autorisé|
|:---|:---|:---|:---|:---|:---|:---|
|Signalements/Interventions|||||||

|Nom de la sous-sous-section|Attributs|Position label|Agencement attribut|Visibilité conditionnelle|Fichie liée|Ajout de données autorisé|
|:---|:---|:---|:---|:---|:---|:---|
|(vide)|affiche_message_media|Masqué|Vertical||||

Cette sous-sous-section sera effective à l'intégration des fonctionnalités de signalements et d'interventions en 2021 ou 2022.

|Nom de la sous-section|Attributs|Position label|Agencement attribut|Visibilité conditionnelle|Fichie liée|Ajout de données autorisé|
|:---|:---|:---|:---|:---|:---|:---|
|Contrat|Contrat (valeur), Prestataire (presta), Début du contrat (ddebut), Fin du contrat (dfin), Définition (definition)|Par défaut|Vertical||||

|Nom de la sous-section|Attributs|Position label|Agencement attribut|Visibilité conditionnelle|Fichie liée|Ajout de données autorisé|
|:---|:---|:---|:---|:---|:---|:---|
|Statistiques|||||||

|Nom de la sous-sous-section|Attributs|Position label|Agencement attribut|Visibilité conditionnelle|Fichie liée|Ajout de données autorisé|
|:---|:---|:---|:---|:---|:---|:---|
|(vide)|affiche_message_signalement|Masqué|Vertical||||

Cette sous-sous-section sera effective à l'intégration des statistiques en 2021 ou 2022.

|Nom de la sous-section|Attributs|Position label|Agencement attribut|Visibilité conditionnelle|Fichie liée|Ajout de données autorisé|
|:---|:---|:---|:---|:---|:---|:---|
|Evènements|||||||

Cette sous-section a un agencement des onglets vertical.

|Nom de la sous-sous-section|Attributs|Position label|Agencement attribut|Visibilité conditionnelle|Fichie liée|Ajout de données autorisé|
|:---|:---|:---|:---|:---|:---|:---|
|Sur les conteneurs Verre|Identifiant du conteneur (idcont_2), Ref prestataire (idpresta_1), Modèle (model_2), Photo (modèle) (affiche_model_2), Evènement (eve_2), Date de l'évènement (date_eve_2)|Par défaut|Vertical||Fiche conteneur Verre (historique)||
|Sur les conteneurs TLC|Identifiant du conteneur (idcont_3), Evènement (eve_3), Gestionnaire (nom_entrep_1), Modèle (model_3), Modèle (photo) (affiche_model_3)|Par défaut|Vertical||Fiche conteneur TLC (historique)||

Ces 2 sous-sous-ection affichent les données des tables conteneurs (inactif).

|Nom de la sous-section|Attributs|Position label|Agencement attribut|Visibilité conditionnelle|Fichie liée|Ajout de données autorisé|
|:---|:---|:---|:---|:---|:---|:---|
|Méradonnées|Identifiant du lieu de collecte (idlieu), Coordonnées Lambert93-X (x_l93), Coordonnées Lambert93-Y (y_l93), Référentiel spatial (src_geom), Année du référentiel (src_date), Saisi le (date_sai), Mise à jour le (date_maj), Opérateur de saisie (op_sai), Observations (observ)|par défaut|vertical||||

* Saisie :

Sont présent ici uniquement les attributs éditables ou disposant d'un mode de représentation spécifique.

|Attribut|Obligatoire|Valeur par défaut|Liste de domaine|Représentation|
|:---|:---|:---|:---|:---|
|Statut ||10|Valeur PAV Statut|par défaut|
|Type  ||00|lt_pav_cttype|par défaut|
|Adresse  ||||par défaut|
|Localisation ||||par défaut|
|Etat de propreté des abords    ||00|valeur_pav_proprete_abor|par défaut|
|Type d'environnement ||00|valeur_pav_envtype|par défaut|
|Type d'espace urbain d'implantation ||00|valeur_pav_envimplan|par défaut|
|Situation domaniale||00|valeur_pav_envsitu|par défaut|
|Corbeille à proximité  ||false|cases à cocher|
|Accessibilté à revoir     |||false|cases à cocher|
|Nature du problème     ||00|valeur_pav_natpb|par défaut|
|Autre problème     ||||par défaut|
|Orientation retenue     ||00|Valeur PAV Orientation|par défaut|
|Identifiant du lieu précédent     ||||par défaut|
|V Tampon (non éditable)     |||300|par défaut|
|Référentiel spatial     ||00|lt_src_geom|par défaut|
|Année du référentiel   ||||par défaut|
|Opérateur de saisie (non éditable)     |||%USER_LOGIN%|par défaut|
|Observation(s)   ||||par défaut|


  * Particularité : garde la fiche ouverte après la sauvegarde


**IMPORTANT** : L'édition des données jointes est désactivée.

 * Modèle d'impression : sans objet

## Fiche d'information : `Fiche conteneur Verre`

Source : `an_dec_pav_cont (actif)`

* Statistique : aucune
 
 * Représentation :
 
|Mode d'ouverture|Taille|Agencement des sections|
|:---|:---|:---|
|dans le gabarit|850x650|Onglets|

|Nom de la section|Attributs|Position label|Agencement attribut|Visibilité conditionnelle|Fichie liée|Ajout de données autorisé|
|:---|:---|:---|:---|:---|:---|:---|
|Conteneur Verre|||||||

Cette section est agencée par onglets.

|Nom de la sous-section|Attributs|Position label|Agencement attribut|Visibilité conditionnelle|Fichie liée|Ajout de données autorisé|
|:---|:---|:---|:---|:---|:---|:---|
|Caractéristiques|||||||

Cette sous-section est agencée par onglets.

|Nom de la sous-sous-section|Attributs|Position label|Agencement attribut|Visibilité conditionnelle|Fichie liée|Ajout de données autorisé|
|:---|:---|:---|:---|:---|:---|:---|
|Descriptifs|Position (pos), Modèle (model), Photo (modèle) (affiche_model), Posé le (date_pos), Mode de préhension (mode_preh), Présence d'une trappe pour restaurateur (trp_rest), Opercules (opercules), Type de sol (type_sol)|Par défaut|Vertical||||
|Etat|Etat de propreté (proprete), Nettoyé le  (date_net), Défaut de structure visible (def_struc), Peinture (peinture), Présence de tags (tags)|Par défaut|Vertical||||
|Signalétique|Type (type_sign), Etat (etat_sign)|Par défaut|Vertical||||
|Evènement|Evènement (eve), Date de l'évènement (date_eve), Commentaire(s) (obs_eve)|Par défaut|Vertical||||

|Nom de la sous-section|Attributs|Position label|Agencement attribut|Visibilité conditionnelle|Fichie liée|Ajout de données autorisé|
|:---|:---|:---|:---|:---|:---|:---|
|Statistiques|||||||

|Nom de la sous-sous-section|Attributs|Position label|Agencement attribut|Visibilité conditionnelle|Fichie liée|Ajout de données autorisé|
|:---|:---|:---|:---|:---|:---|:---|
|(vide)|affiche_message_stat|Masqué|Vertical||||

Cette sous-sous-section sera effective à l'intégration des statistiques en 2021 ou 2022.

|Nom de la sous-section|Attributs|Position label|Agencement attribut|Visibilité conditionnelle|Fichie liée|Ajout de données autorisé|
|:---|:---|:---|:---|:---|:---|:---|
|Métadonnées|Identifiant du conteneur (idcont), Identifiant du lieu de collecte (idlieu), Prise en compte dans le plan interactif (date_effet), Saisi par (op_sai), Observation(s) (observ), Saisi le (date_sai), Mis à jour le (date_maj)|Par défaut|Vertical||||

* Saisie :

Sont présent ici uniquement les attributs éditables ou disposant d'un mode de représentation spécifique.

|Attribut|Obligatoire|Valeur par défaut|Liste de domaine|Représentation|
|:---|:---|:---|:---|:---|
|Evènement ||00|lt_pav_eve|par défaut|
|Modèle ||0|lt_pav_model|par défaut|
|Position ||00|valeur_pav_contpos|par défaut|
|Posé le ||||par défaut|
|Nettoyé le ||||par défaut|
|Prise en compte dans le plan interactif ||||par défaut|
|Mode de préhension ||00|valeur_pav_modepreh|par défaut|
|Opercules ||false||cases à cocher|
|Présence de tags ||false||cases à cocher|
|Peinture||00|valeur_pav_peinture|par défaut|
|Type de sol ||00|valeur_pav_typesol|par défaut|
|Présence d'une trappe pour restaurateur||false||cases à cocher|
|Etat||00|valeur PAV Etat signalétique|par défaut|
|Type de signalétique||00|valeur_pav_typesign|par défaut|
|Etat de propreté||00|valeur PAV Etat signalétique|par défaut|
|Défaut de structure visible||false||cases à cocher|
|Saisi par (non éditable)||%USER_LOGIN%||par défaut|
|Observation(s)||||champ texte à plusieurs lignes|
|Date de l'évènement||||par défaut|
|Commentaire(s)||||Champ texte à plusieurs lignes|

  * Particularité : garde la fiche ouverte après la sauvegarde
  
## Fiche d'information : `Fiche conteneur Verre (historique)`

Source : `an_dec_pav_cont (inactif)`

* Statistique : aucune
 
 * Représentation :
 
|Mode d'ouverture|Taille|Agencement des sections|
|:---|:---|:---|
|dans le gabarit|850x650|Onglets|

|Nom de la section|Attributs|Position label|Agencement attribut|Visibilité conditionnelle|Fichie liée|Ajout de données autorisé|
|:---|:---|:---|:---|:---|:---|:---|
|Conteneur Verre|||||||

Cette section est agencée par onglets.

|Nom de la sous-section|Attributs|Position label|Agencement attribut|Visibilité conditionnelle|Fichie liée|Ajout de données autorisé|
|:---|:---|:---|:---|:---|:---|:---|
|Caractéristiques|||||||

Cette sous-section est agencée par onglets.

|Nom de la sous-sous-section|Attributs|Position label|Agencement attribut|Visibilité conditionnelle|Fichie liée|Ajout de données autorisé|
|:---|:---|:---|:---|:---|:---|:---|
|Descriptifs|Position (pos), Modèle (model), Photo (modèle) (affiche_model), Posé le (date_pos), Mode de préhension (mode_preh), Présence d'une trappe pour restaurateur (trp_rest), Opercules (opercules), Type de sol (type_sol)|Par défaut|Vertical||||
|Etat|Etat de propreté (proprete), Nettoyé le  (date_net), Défaut de structure visible (def_struc), Peinture (peinture), Présence de tags (tags)|Par défaut|Vertical||||
|Signalétique|Type (type_sign), Etat (etat_sign)|Par défaut|Vertical||||
|Evènement|Evènement (eve), Date de l'évènement (date_eve), Commentaire(s) (obs_eve)|Par défaut|Vertical||||

|Nom de la sous-section|Attributs|Position label|Agencement attribut|Visibilité conditionnelle|Fichie liée|Ajout de données autorisé|
|:---|:---|:---|:---|:---|:---|:---|
|Statistiques|||||||

|Nom de la sous-sous-section|Attributs|Position label|Agencement attribut|Visibilité conditionnelle|Fichie liée|Ajout de données autorisé|
|:---|:---|:---|:---|:---|:---|:---|
|(vide)|affiche_message_stat|Masqué|Vertical||||

Cette sous-sous-section sera effective à l'intégration des statistiques en 2021 ou 2022.

|Nom de la sous-section|Attributs|Position label|Agencement attribut|Visibilité conditionnelle|Fichie liée|Ajout de données autorisé|
|:---|:---|:---|:---|:---|:---|:---|
|Métadonnées|Identifiant du conteneur (idcont), Identifiant du lieu de collecte (idlieu), Prise en compte dans le plan interactif (date_effet), Saisi par (op_sai), Observation(s) (observ), Saisi le (date_sai), Mis à jour le (date_maj)|Par défaut|Vertical||||

  * Saisie :

Sont présent ici uniquement les attributs éditables ou disposant d'un mode de représentation spécifique.

|Attribut|Obligatoire|Valeur par défaut|Liste de domaine|Représentation|
|:---|:---|:---|:---|:---|
|Evènement ||00|lt_pav_eve|par défaut|
|Date de l'évènement||||par défaut|
|Commentaire(s)||||Champ texte à plusieurs lignes|

  * Particularité : garde la fiche ouverte après la sauvegarde

## Fiche d'information : `Fiche conteneur TLC`

Source : `an_dec_pav_cont_tlc  (actif)`

* Statistique : aucune
 
 * Représentation :
 
|Mode d'ouverture|Taille|Agencement des sections|
|:---|:---|:---|
|dans le gabarit|850x650|Onglets|

|Nom de la section|Attributs|Position label|Agencement attribut|Visibilité conditionnelle|Fichie liée|Ajout de données autorisé|
|:---|:---|:---|:---|:---|:---|:---|
|Conteneur Textile-Linge-Chaussure (TLC)|||||||

Cette section est agencée par onglets.

|Nom de la sous-section|Attributs|Position label|Agencement attribut|Visibilité conditionnelle|Fichie liée|Ajout de données autorisé|
|:---|:---|:---|:---|:---|:---|:---|
|Caractéristiques|||||||

Cette sous-section est agencée par onglets.

|Nom de la sous-sous-section|Attributs|Position label|Agencement attribut|Visibilité conditionnelle|Fichie liée|Ajout de données autorisé|
|:---|:---|:---|:---|:---|:---|:---|
|Descriptifs|Position (pos), Modèle (model), Modèle (photo) (affiche_model), Posé le (date_pos)|Par défaut|Vertical||||
|Evènement|Evènement (eve), Date de l'évènement (date_eve), Commentaire(s) (obs_eve)|Par défaut|Vertical||||


|Nom de la sous-section|Attributs|Position label|Agencement attribut|Visibilité conditionnelle|Fichie liée|Ajout de données autorisé|
|:---|:---|:---|:---|:---|:---|:---|
|Métadonnées|Identifiant du conteneur (idcont), Identifiant du lieu de collecte (idlieu), Prise en compte dans le plan interactif (date_effet), Saisi par (op_sai), Observation(s) (observ), Saisi le (date_sai), Mis à jour le (date_maj)|Par défaut|Vertical||||

* Saisie :

Sont présent ici uniquement les attributs éditables ou disposant d'un mode de représentation spécifique.

|Attribut|Obligatoire|Valeur par défaut|Liste de domaine|Représentation|
|:---|:---|:---|:---|:---|
|Evènement ||00|lt_pav_eve|par défaut|
|Modèle ||00|lt_pav_model|par défaut|
|Position ||00|valeur_pav_contpos|par défaut|
|Posé le ||||par défaut|
|Prise en compte dans le plan interactif ||||par défaut|
|Saisi par (non éditable)||%USER_LOGIN%||par défaut|
|Volume ||||par défaut|
|Observation(s)||||champ texte à plusieurs lignes|
|Date de l'évènement||||par défaut|
|Commentaire(s)||||Champ texte à plusieurs lignes|
|Gestionnaire||00|valeur_pv_gest|par défaut|
|Autre gestionnaire||||par défaut|

  * Particularité : garde la fiche ouverte après la sauvegarde
  
## Fiche d'information : `Fiche conteneur TLC (historique)`

Source : `an_dec_pav_cont_tlc  (inactif)`

* Statistique : aucune
 
 * Représentation :
 
|Mode d'ouverture|Taille|Agencement des sections|
|:---|:---|:---|
|dans le gabarit|850x650|Onglets|

|Nom de la section|Attributs|Position label|Agencement attribut|Visibilité conditionnelle|Fichie liée|Ajout de données autorisé|
|:---|:---|:---|:---|:---|:---|:---|
|Conteneur Textile-Linge-Chaussure (TLC)|||||||

Cette section est agencée par onglets.

|Nom de la sous-section|Attributs|Position label|Agencement attribut|Visibilité conditionnelle|Fichie liée|Ajout de données autorisé|
|:---|:---|:---|:---|:---|:---|:---|
|Caractéristiques|||||||

Cette sous-section est agencée par onglets.

|Nom de la sous-sous-section|Attributs|Position label|Agencement attribut|Visibilité conditionnelle|Fichie liée|Ajout de données autorisé|
|:---|:---|:---|:---|:---|:---|:---|
|Descriptifs|Position (pos), Modèle (model), Modèle (photo) (affiche_model), Posé le (date_pos)|Par défaut|Vertical||||
|Evènement|Evènement (eve), Date de l'évènement (date_eve), Commentaire(s) (obs_eve)|Par défaut|Vertical||||


|Nom de la sous-section|Attributs|Position label|Agencement attribut|Visibilité conditionnelle|Fichie liée|Ajout de données autorisé|
|:---|:---|:---|:---|:---|:---|:---|
|Métadonnées|Identifiant du conteneur (idcont), Identifiant du lieu de collecte (idlieu), Prise en compte dans le plan interactif (date_effet), Saisi par (op_sai), Observation(s) (observ), Saisi le (date_sai), Mis à jour le (date_maj)|Par défaut|Vertical||||

* Saisie :

Sont présent ici uniquement les attributs éditables ou disposant d'un mode de représentation spécifique.

|Attribut|Obligatoire|Valeur par défaut|Liste de domaine|Représentation|
|:---|:---|:---|:---|:---|
|Evènement ||00|lt_pav_eve|par défaut|
|Date de l'évènement||||par défaut|
|Commentaire(s)||||Champ texte à plusieurs lignes|

  * Particularité : garde la fiche ouverte après la sauvegarde
  
## Fiche d'information : `Nouveau modèle PAV Verre`

Source : `lt_pav_modele (verre)`

* Statistique : aucune
 
 * Représentation :
 
|Mode d'ouverture|Taille|Agencement des sections|
|:---|:---|:---|
|dans le gabarit|530x650|Onglets|

|Nom de la section|Attributs|Position label|Agencement attribut|Visibilité conditionnelle|Fichie liée|Ajout de données autorisé|
|:---|:---|:---|:---|:---|:---|:---|
|Liste des modèles|Libellé du conteneur (valeur), Volume (en m3) (volume), Matériau (materiau), Type de PAV (Verre ou TLC) (cttype)|Par défaut|Vertical||||
|Médiathèque|Photo (miniature)|Par défaut|Vertical||||


* Saisie :

Sont présent ici uniquement les attributs éditables ou disposant d'un mode de représentation spécifique.

|Attribut|Obligatoire|Valeur par défaut|Liste de domaine|Représentation|
|:---|:---|:---|:---|:---|
|Libellé du conteneur ||||par défaut|
|Volume (en m3)||||par défaut|
|Matériau||||par défaut|
|Type de PAV (Verre ou TLC)||10||par défaut|

  * Particularité : garde la fiche ouverte après la sauvegarde
  
## Fiche d'information : `Nouveau modèle PAV Verre`

Source : `lt_pav_modele (TLC)`

* Statistique : aucune
 
 * Représentation :
 
|Mode d'ouverture|Taille|Agencement des sections|
|:---|:---|:---|
|dans le gabarit|530x650|Onglets|

|Nom de la section|Attributs|Position label|Agencement attribut|Visibilité conditionnelle|Fichie liée|Ajout de données autorisé|
|:---|:---|:---|:---|:---|:---|:---|
|Liste des modèles|Libellé du conteneur (valeur), Volume (en m3) (volume), Matériau (materiau), Type de PAV (Verre ou TLC) (cttype)|Par défaut|Vertical||||
|Médiathèque|Photo (miniature)|Par défaut|Vertical||||


* Saisie :

Sont présent ici uniquement les attributs éditables ou disposant d'un mode de représentation spécifique.

|Attribut|Obligatoire|Valeur par défaut|Liste de domaine|Représentation|
|:---|:---|:---|:---|:---|
|Libellé du conteneur ||||par défaut|
|Volume (en m3)||||par défaut|
|Matériau||||par défaut|
|Type de PAV (Verre ou TLC)||20||par défaut|

  * Particularité : garde la fiche ouverte après la sauvegarde

## Analyse :

Aucune

## Statistique :

Aucune

## Modification géométrique : `Insérer ou déplacer mon lieu de collecte`

Cette recherche permet à l'utilisateur de saisir ou modifier l'emplacement d'un lieu de collecte. A partir de cette fonctionnalité, l'utilisateur peut gérer l'affectactiion des différents PAV au lieu.

  * Configuration :
  
Source : `geo_dec_pav_lieu`

 * Type de saisie : saisie simple, point
 * Filtres : aucun
 * Accrochage : aucun
 * Fiches d'information active : Lieu de collecte
 * Topologie : aucune 
 
 
 # La cartothèque

|Groupe|Sous-groupe|Visible dans la légende|Visible au démarrage|Détails visibles|Déplié par défaut|Geotable|Renommée|Issue d'une autre carte|Visible dans la légende|Visible au démarrage|Déplié par défaut|Couche sélectionnable|Couche accrochable|Catégorisation|Seuil de visibilité|Symbologie|Autres|
|:---|:---|:-:|:-:|:-:|:-:|:---|:---|:-:|:-:|:-:|:-:|:-:|:---|:---|:---|:---|:---|
|||||||xapps_geo_vmr_adresse|Adresse|x||x|||||1/0-1/2000||Interactivité avec le champ calculé infobulle (0-2000è)|
|Points d'apport volontaire||x|x|x|x|geo_dec_pav_lieu|Par type||x|x||||cttype||symbole GeoCompiegnois taille 50 |Etiquette affichant le nb de conteneur Verre|
|||||||xapps_geo_v_pav_lieu_orient|Suivi des emplacements||x|x||||||Trait de petit tiret taille 1 rouge||
|Foncier||x||x||geo_v_fon_proprio_pu_arc|Propriétés institutionnelles|x|x|x||||||||
|Limites administratives||x|x|x||geo_v_osm_commune_arcba|Limites communales|x|x|x||||||||
|||||||geo_adm_quartier|Quartier de Compiègne|x|||||||0-70000è|||

# L'application

* Généralités :

|Gabarit|Thème|Modules spé|Impression|Résultats|
|:---|:---|:---|:---|:---|
|Pro|Thème GeoCompiegnois 1.0.7|Partage de lien, Introduction, StreetView, GeoCadastre (GeoCadastre 2020),Page de connexion perso (tri), Bandeau HTML, Multimedia (Média - Déchet PAV),Javascript, Zoom, Export de fonctionnalités (tri 2020)|A4 et A3 Paysage, A4 et A3 Portrait, A4 et A3 Portait + légende et A4 et A3 Paysage + légende||

* Particularité de certains modules :

  * Module Javascript : recherche au clic par défaut et sélection par défaut au clic
  `// recherche au clic
acfApplicationService.addConfiguration({
  '@type': 'com.bg.functionality.application.SimpleConfigurationValue',
  key: 'pro1.mapfeatureidentifier.defaulttool',
  value: 'point'
});`
`// sélection
acfApplicationService.addConfiguration({
  '@type': 'com.bg.functionality.application.SimpleConfigurationValue',
  key: 'pro1.layerquery.defaulttool',
  value: 'point'
});`
  
  * Export de fonctionnalité : Recherche Export PAV Verre et TLC, Mouvement enregistré sur les PAV Verre, Mouvement enregistré sur les lieux de collecte (Verre)


* Recherche globale :

|Noms|Tri|Nb de sugggestion|Texte d'invite|
|:---|:---|:---|:---|
|Parcelle sélectionnée, Recherche dans la Base Adresse Locale,Recherche dans la Base de Voie Locale,localiser une commune de l'ARC, Localiser un équipement|alpha|100|Tapez un n° de parcelle (AL17), une adresse, une commune, un équipement, ...|

* Carte : `Les déchets`

Comportement au clic : (dés)active uniquement l'item cliqué
Liste des recherches : Parcelle sélectionnée (ignorer la visibilité), Lieu de collecte (au démarrage)

* Fonds de plan :

|Nom|Au démarrage|opacité|
|:---|:---|:---|
|Cadastre||100%|
|Plan de ville|x|50%|
|Carte IGN 25000||100%|
|Scan Express IGN||100%|
|ortho-express 2018|x|100%|

* Fonctionnalités

|Groupe|Nom|
|:---|:---|
|PAV||
|Rechercher un conteneur Verre||
||PAV par référence|
||Lieu de collecte par localisation|
||Lieu de collecte par implantation|
||Lieu de collecte par nature du problème|
||Lieu de collecte à moins de 300 mètres|
|Rechercher un conteneur TLC||
||TLC par référence|
||TLC par gestionnaire|
||Lieu de collecte par localisation (TLC)|
||Lieu de collecte à moins de 500 mètres|
|Export des données||
||Export PAV Verre|
||Export PAV TLC|
|Gestion des lieux de collecte||
||Insérer ou déplacer mon lieu de collecte|
|Gestion des modèles||
||Liste des modèles|
||Nouveau modèle PAV Verre|
||Nouveau modèle PAV TLC|
|Recherche cadastrale||
||Parcelles par référence|
||Parcelles par adresse fiscale|
||Parcelles par nom du propriétaire|
||Parcelles multicritères|
||Parcelles par nom du propriétaire d'un local|
||Parcelles par surface|
|Recherche avancée d'une voie ou d'une adresse||
||Recherche avancée d'une adresse|
||Recherche avancée d'une voie|


* Tableau de bord

|Nom|Contenu|Type|Données|Style|Paramètres|
|:---|:---|:---|:---|:---|:---|
|PAV Verre|||||
||Chiffres clés (PAV Verre)|Statistique de type texte|nb_pav_verre et nb_lieu_verre (couleur #054a91, taille 50)|<b>{text1}</b> conteneurs verres, <b>{text2}</b> lieux de collecte (couleur #79c24d)||
||Chiffres clés (PAV Verre)|Statistique de type texte|nb_pav_verre et nb_lieu_verre (couleur #054a91, taille 50)|<b>{text1}</b> conteneurs verres, <b>{text2}</b> lieux de collecte (couleur #79c24d)||
||Chiffres clés (PAV Verre)|Statistique de type texte|nb_pav_verre et nb_lieu_verre (couleur #054a91, taille 50)|<b>{text1}</b> conteneurs verres, <b>{text2}</b> lieux de collecte (couleur #79c24d)||
||Mouvement enregistré sur les PAV Verre|Recherche|||Afficher le titre|
||Mouvement enregistré sur les lieux de collecte (Verre)|Recherche|||Afficher le titre|
