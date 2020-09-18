![picto](/doc/img/geocompiegnois_2020_reduit_v2.png)

# Standard local des Points d'Apport Volontaire Verre

# Changelog

- 02/01/2021 : description initiale du gabarit de production de l'inventaire du réseau pluvial

# Livrables

## Principe fonctionnel et modalités de mises à jour

Le principe de fonctionnement de la base de données des Points d'Apport Volontaire Verre s'appuie sur le lieu de collecte. Ce lieu est un point unique disposant de n conteneurs, qu'ils soient à usage Verre ou TLC. 

![picto](/doc/img/principe_pav.png)
Schéma 1 : principe fonctionnel du lieu de collecte, ici 1 lieu de collecte comprend 2 conteneurs

## Système de coordonnées

Les coordonnées seront exprimées en mètre avec trois chiffres après la virgule dans le système national en vigueur.
Sur le territoire métropolitain s'applique le système géodésique français légal RGF93 associé au système altimétrique IGN69. La projection associée Lambert 93 France (epsg:2154) sera à utiliser pour la livraison des données.

## Topologie

- Tout objet est nécessairement inclu dans l'emprise des communes de l'Agglomération de la Région de Compiègne et ne peut être qu'inclus dans l'espace public sauf si il s'agit d'une parcelle cadastrale appartenant à une collectivité.

## Format des fichiers

Les fichiers sont disponibles au format ESRI Shape (.SHP) contenant la géométrie mais également au format CSV contenant les coordonnées X et Y du point.
L'encodage des caractères est en UTF8.

## Description des classes d'objets
