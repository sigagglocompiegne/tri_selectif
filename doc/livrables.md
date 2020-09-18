![picto](/doc/img/geocompiegnois_2020_reduit_v2.png)

# Standard local des Points d'Apport Volontaire Verre

# Changelog

- 02/01/2021 : description initiale du gabarit de production et de mise à jour des lieux de collecte des Points d'Apport Volontaire Verre

# Livrables

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


## Système de coordonnées

Les coordonnées seront exprimées en mètre avec trois chiffres après la virgule dans le système national en vigueur.
Sur le territoire métropolitain s'applique le système géodésique français légal RGF93 associé au système altimétrique IGN69. La projection associée Lambert 93 France (epsg:2154) sera à utiliser pour la livraison des données.

## Topologie

- Tout objet est nécessairement inclu dans l'emprise des communes de l'Agglomération de la Région de Compiègne et ne peut être qu'inclus dans l'espace public sauf si il s'agit d'une parcelle cadastrale appartenant à une collectivité.

## Format des fichiers

Les fichiers sont disponibles au format ESRI Shape (.SHP) contenant la géométrie mais également au format CSV contenant les coordonnées X et Y du point.
L'encodage des caractères est en UTF8.

## Description des classes d'objets



# Gabarits

- Fichier gabarit à télécharger au format csv (non géographique)
- Fichier gabarit Qgis complet à télécharger
