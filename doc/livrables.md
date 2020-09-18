![picto](/doc/img/geocompiegnois_2020_reduit_v2.png)

# Standard local des Points d'Apport Volontaire Verre

# Documentation du standard

# Changelog

- 02/01/2021 : description initiale du gabarit de production et de mise à jour des lieux de collecte des Points d'Apport Volontaire Verre

# Livrables


## Gabarits

- Fichier gabarit des lieux de collecte et des conteneurs à télécharger au format csv (non géographique)
- Fichier gabarit à télécharger des lieux de collecte au format shape (géographique)
- Fichier gabarit Qgis complet à télécharger

## Principe fonctionnel et modalités de mises à jour

Le principe de fonctionnement de la base de données des Points d'Apport Volontaire Verre s'appuie sur le lieu de collecte. Ce lieu est un point unique disposant de n conteneurs, qu'ils soient à usage Verre ou TLC. 

![picto](/doc/img/principe_pav.png)

Schéma 1 : principe fonctionnel du lieu de collecte, ici 1 lieu de collecte comprend 2 conteneurs

![picto](/doc/img/mcd_pav.png)

Schéma 2 : restitution conceptuelle dans la base de données

La mise à jour repose à la fois sur les lieux de collecte Verre et les conteneurs Verre qui y sont affectés.
Elle doit permettre de vérifier le bon emplacement des lieux de collecte fournit par la collectivité et l'affectation des bons conteneurs. 
Le fichier de mise à jour restitué devra préciser pour chaque lieu dans l'attribut [maj_2021] :
- inchangé (si le lieu de collecte est toujours présent),
- nouveau (dans ce cas, le prestataire devra ajouter ce nouveau point de collecte dans le fichier SIG ou dans le fichier Excel en précisant l'ensemble des autres attributs précisés dans l'annexe 3,
- supprimé (dans ce cas, le prestataire devra uniquement spécifier cette mention dans l'attribut concerné et non supprimer le point de collecte dans les fichiers fournis).

Dans le cas d’un nouveau lieu identifié, le point de localisation doit représenter le lieu exact d'implantation de celui-ci au mètre près.
Pour chaque lieu de collecte, la bonne attribution des conteneurs Verre uniquement devra être réalisée. Le fichier csv fournit dans le gabarait présente la liste de l'ensemble des conteneurs Verre présent pour chaque lieu de collecte. L'attribut [idcont] permet de faire le lien avec le fichier des lieux de collecte. 
Comme pour les lieux de collecte, cette mise à jour devra préciser dans l'attribut [maj_2021] : 
- inchangé (si le conteneur est toujours présent),
- nouveau (dans ce cas, le prestataire devra ajouter une nouvelle ligne d'enregistrement dans le fichier Excel en précisant à quel lieu de collecte il est affecté et en complétant l'ensemble des autres attributs précisés dans l'annexe 3),
- supprimé (dans ce cas, le prestataire devra uniquement spécifier cette mention dans l'attribut concerné et non supprimer le conteneur dans les fichiers fournis).

*Important :*
-	l'entreprise gestionnaire veillera à bien indiquer le lieu de collecte d'appartenance de chaque nouveau conteneur par un identifiant unique de sa convenance différent de ceux déjà utilisés par la collectivité et qui sera également indiqué pour chaque nouveau lieu de collecte.
-	l'attribut [idpresta], dans le fichier des conteneurs et pour chaque conteneur Verre, doit contenir l'identifiant de l'entreprise gestionnaire. Cet attribut sera utilisé par la suite pour les échanges de données.
- L'attribut `date_sai` doit être renseigné uniquement lors d'un nouveau lieu de collecte identifié. L'attribut `date_maj`, quant à lui est à renseigner si il s'agit d'une mise à jour d'un lieu existant. Dans ce dernier cas, l'attribut `date_sai` reste inchangé dans le cadre d'une mise à jour.

Un gabarit de saisi, sous le logiciel SIG QGIS 3.x, est disponible et permet de disposer des fonds de plan géographiques nécessaires à la localisation des lieux de collecte actuelle.



## Système de coordonnées

Les coordonnées seront exprimées en mètre avec trois chiffres après la virgule dans le système national en vigueur.
Sur le territoire métropolitain s'applique le système géodésique français légal RGF93 associé au système altimétrique IGN69. La projection associée Lambert 93 France (epsg:2154) sera à utiliser pour la livraison des données.

## Topologie

- Tout objet est nécessairement inclu dans l'emprise des communes de l'Agglomération de la Région de Compiègne et ne peut être qu'inclus dans l'espace public sauf si il s'agit d'une parcelle cadastrale appartenant à une collectivité.

## Format des fichiers

Les fichiers sont disponibles au format ESRI Shape (.SHP) contenant la géométrie mais également au format CSV contenant les coordonnées X et Y du point.
L'encodage des caractères est en UTF8.

## Description des classes d'objets

|Nom fichier|Définition|Catégorie|Géométrie|
|:---|:---|:---|:---|
|geo_dec_pav_lieu|Localisation des lieux de collecte des conteneurs à verre|Patrimoine|Ponctuel|
|an_dec_pav_cont|Conteneurs à verre rattachés au lieu de collecte|Patrimoine|sans objet|

## Implémentation informatique

### Patrimoine

Ensemble des données décrivant les objets composant le réseau de gestion des Points d'Apport Volontaire Verre

`geo_dec_pav_lieu` : lieu de collecte

|Nom attribut|Définition|Type|Valeurs|Contraintes|
|:---|:---|:---|:---|:---|
|idlieu|Identifiant unique du positionnement|character varying(8)||valeur vide interdite|
|maj_aaaa|Evolution par rapport au dernier recensement|character varying(8)|lt_pav_maj|valeur vide interdite|
|insee|Code insee de la commune|character varying(5)||valeur vide interdite|
|commune|Libellé de la commune|character varying(30)||valeur vide interdite|
|quartier|Libellé du quartier|character varying(50)||uniquement pour le commune de Compiègne|
|adresse|Adresse du lieu de collecte|character varying(80)||nom de la rue ou n° d'adresse le plus proche|
|loca|Libellé de la commune|character varying(30)||valeur vide interdite|
|nb_cont|Nombre de conteneurs Verre|integer||valeur vide interdite|
|prop_abor|état de la propreté des abords|character varying(2)|lt_pav_proprete|valeur vide interdite|
|env_type|type d'espace géographique|character varying(2)|lt_pav_envtype|valeur vide interdite|
|env_implant|type d'espace urbain d'implantation|character varying(2)|lt_pav_envimplan|valeur vide interdite|
|env_situ|situation domaniale|character varying(2)|lt_pav_envsitu|valeur vide interdite|
|prox_corb|présence d''une corbeille à proximité|booléan||false par défaut|
|x_l93|Coordonnée X en Lambert 93|Double précision||valeur vide interdite|
|y_l93|Coordonnée Y en Lambert 93|Double précision||valeur vide interdite|
|src_geom|Référentiel spatial de saisie utilisé|character varying(2)|lt_src_geom|valeur vide interdite|
|src_date|Année du référentiel spatial utilisé|integer|||
|date_sai|Date de saisie|date||valeur vide interdite|
|date_maj|Date de mise à jour|date|||

`an_dec_pav_cont` : Points d'Apport Volontaire Verre

|Nom attribut|Définition|Type|Valeurs|Contraintes|
|:---|:---|:---|:---|:---|
|idcont|Identifiant unique du conteneur|character varying(8)||Valeur vide interdite|
|idlieu|Identifiant unique du positionnement|character varying(8)||Valeur vide interdite|
|idpresta|Identifiant du conteneur du prestataire|character varying(100)||Valeur vide interdite|
|maj_aaaa|Evolution par rapport au dernier recensement|character varying(8)|lt_pav_maj|valeur vide interdite|
|model|Modèle du conteneur|character varying(2)|lt_pav_modele|valeur vide interdite|
|model_a|Autre modèle|character varying(100)||uniquement à remplir si valeur 99 (autre) indiqué dans l’attribut model|
|mat|Matériel constituant le conteneur|character varying(2)|lt_pav_contmat|valeur vide interdite|
|pos|Type de positionnement|character varying(2)|lt_pav_contpos|valeur vide interdite|
|date_sai|Date de saisie|date||valeur vide interdite|
|date_maj|Date de mise à jour|date|||
|date_pose|Date de pose|date|||
|date_net|Date du dernier nettoyage|date|||
|volume|Volume en m3|integer||valeur vide interdite|
|mode_preh|Mode de préhension|character varying(2)|lt_pav_modepreh|valeur vide interdite|
|crochet|Etat du crochet|character varying(2)|lt_pav_crochet|valeur vide interdite|
|opercules|Bavettes sur opercules disponibles|booléan||false par défaut|
|tags|Présence de tags|booléan||false par défaut|
|peinture|Etat de la peinture|character varying(2)|lt_pav_peinture|valeur vide interdite|
|type_sol|Type de sol|character varying(2)|lt_pav_typesol|valeur vide interdite|
|trp_rest|Présence d'une trappe pour restaurateur|booléan||false par défaut|
|etat_sign|Etat de la signalétique|character varying(2)|lt_pav_etatsign|valeur vide interdite|
|type_sign|Type de signalétique|character varying(2)|lt_pav_typesign|valeur vide interdite|
|proprete|Etat de la propreté|character varying(2)|lt_pav_proprete|valeur vide interdite|



### Liste de valeurs

Le contenu des listes de valeurs est disponible dans la documentation complète de la base de données en cliquant [ici](/doc/doc_admin_bd_tri.md) dans la rubrique `Liste de valeurs`.
