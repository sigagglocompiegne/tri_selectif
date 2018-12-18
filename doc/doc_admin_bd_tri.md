![picto](/doc/img/Logo_web-GeoCompiegnois.png)

# Documentation d'administration de la base #


* Statut
  - [ ] à rédiger
  - [x] en cours de rédaction
  - [ ] relecture
  - [ ] finaliser
  - [ ] révision

## Principes
 ### Généralité
 
En 2016, une étude d'optimisation de l'implantation des PAV Verre a été initiée sur le territoire de l'Agglomération de la Région de Compiègne avec comme objectif le suivi des PAV sur le terrain en terme de localisation et de données qualitatives. Cette gestion incombant au service déchet de l'Agglomération, une application dédiée au service a été développée par le service SIG. 

Une base de donnée spécifique à cette thématique a été initiée. En plus de ces informations, d'autres données commne les secteurs de collecte des ordures ménagères (zone), des encombrants (par adresse) ainsi que les PAV Textile Linge Chaussure (TLC) ont été intégrées à la base de données.
 
 ### Résumé fonctionnel
 
Pour rappel des grands principes :

* les données des différentes secteurs de ramassage ou de collecte sont gérés par le Sercvice SIG qui met à jour sur demande du servide des déchets
* les données des PAV Verre et TLC (positonnement et données attributaires) sont mises à jour par le Service déchet directement dans l'application métier et les données sont envoyées (la nuit) à l'application Grand Public du Plan Interactif.

## Schéma fonctionnel

![schema_fonctionnel](img/schema_fonctionnel_tri.png)

Dans le détail :

#### Les droits

#####	Le service des déchets peut :

*	Voir, consulter et rechercher les informations des PAV sur les communes de l’ARC
*	Peut modifier les données sur les PAV Verre et TLC
*	Peut créer un nouveau PAV ou modifier sa localisation

#####	Un autre service peut :

*	Voir, consulter et rechercher les informations d’un PAV sans pouvoir les modifier

###	Les contrôles de saisie

Aucun contrôle de saisies n'a été mis en place. Le service gère sa donnée. Certains champs sont guidés par des listes de valeurs.

## Dépendances

La base de données PEI s'appuie sur des référentiels préexistants constituant autant de dépendances nécessaires pour l'implémentation de la base PEI.

|schéma | table | description | usage |
|:---|:---|:---|:---|   
|r_objet|lt_src_geom|domaine de valeur générique d'une table géographique|source du positionnement du PEI|
|x_apps|geo_vmr_adresse|BAL|Assise des secteurs de ramassage des encombrants|

---

## Classes d'objets

L'ensemble des classes d'objets unitaires sont stockées dans le schéma m_defense_incendie, celles dérivées et applicatives dans le schéma x_apps, celles dérivées pour les exports opendata dans le schéma x_opendata.

### Classe d'objet géographique et patrimoniale

`geo_dec_pav_verre` : table géographique des attributs des PAV Verre.

|Nom attribut | Définition | Type  | Valeurs par défaut |
|:---|:---|:---|:---|  
|id_contver|Identifiant unique géographique|integer|nextval('m_dechet.geo_dec_pav_idconv_seq'::regclass)|"
|commune|libellé de la commune|character varying(30)| |
|insee|numéro insee de la commune|character(5)| |
|quartier|libellé du quartier|character varying(50)| |
|adresse|adresse d'implantation|character varying(80)| |
|x_l93|coordonnée x en lambert 93|double precision| |
|y_l93|coordonnée y en lambert 93|double precision| |
|cont_nbr|nombre de conteneurs|integer| |
|cont_mat|code du matériaux constituant le conteneur (liste de choix lt_pav_contmat)|character varying(2)|'10'::character varying|
|cont_pos|code du type de position du conteneur (liste de choix lt_pav_contpos)|character varying(2)|'10'::character varying|
|date_sai|date de saisie de l'information|timestamp without time zone| |
|date_pos|date de pose|timestamp without time zone| |
|date_net|date de nettoyage|timestamp without time zone| |
|date_maj|date de mise à jour des informations|timestamp without time zone| |
|photo|Nom du fichier de la photo avant la mise à jour de juillet 2016 par le BE RETIF|character varying(254)| |
|url_photo|Lien url vers la photo avant la mise à jour de juillet 2016 par le BE RETIF|character varying(254)| |
|src_geom|code du référentiel spatial de saisie utilisé (liste de choix r_objet.lt_src_geom)|character(2)|'00'::bpchar|
|volume|volume en m3 (par défaut 4)|double precision| |
|env_type|code du type d'espace géographique (liste de choix lt_pav_envtype)|character varying(2)|'00'::character varying|
|env_implan|code du type d'espace urbain d'implantation (liste de choix lt_pav_envimplan)|character varying(2)|'00'::character varying|
|env_situ|code de la situation domaniale (liste de choix lt_pav_envsitu)|character varying(2)|'00'::character varying|
|mode_preh|code du mode de préhension (liste de choix lt_pav_modepreh)|character varying(2)|'10'::character varying|
|crochet|code de l'état du crochet (liste de choix lt_pav_crochet)|character varying(2)|'00'::character varying|
|opercules|Bavettes sur opercules disponibles|boolean| |
|tags|présence de tags|boolean| |
|peinture|code de l'état de la peinture (liste de choix lt_pav_peinture)|character varying(2)|'00'::character varying|
|prox_corb|présence d'une corbeille à proximité|boolean| |
|type_sol|code du type de sol (liste de choix (lt_pav_typesol)|character varying(2)|'00'::character varying|
|trp_rest|présence d'une trappe pour restaurateur|boolean| |
|etat_sign|état de la signalétique (création d'une liste de valeur en fonction de l'état des lieux)|character varying(30)| |
|type_sign|code du type de signalétique (liste de choix lt_pav_typesign)|character varying(2)|'00'::character varying|
|proprete|code de l'état de la propreté (liste de choix lt_pav_proprete)|character varying(2)|'00'::character varying|
|prop_abor|code de l'état de la propreté des abords (liste de choix lt_pav_propabor)|character varying(2)|'00'::character varying|
|def_struc|défaut de structure visible|character varying(30)| |
|hab_pav|Tonnage par gisement d'habitants|integer| |
|opt_pav|nombre de PAV manquant ou excédents par rapport aux préconisation éco-emballages|integer| |
|ame_acces|accéssibilité à revoir|boolean| |
|nat_pb|code de la nature du ou des problèmes (liste de choix lt_pav_natpb)|character varying(2)|'00'::character varying|
|nat_pb_99|précision sur la nature du problème|character varying(500)| |
|geom|champ contenant la géométrie de l'objet|USER-DEFINED| |
|op_sai|Opérateur de saisie de la donnée|character varying(80)| |
|observ|Observations diverses|character varying(500)| |
|pavorient|code des préconisations pour l'amélioration dee emplacements des PAV Verre (suite à l'état des lieux de l'été 2016|character varying(2)| |
|id_parent|identifiant du PAV Verre parent selon les préconisations|integer| |
|statut|code du statut du PAV (actif ou inactif)|character varying(2)| |
|v_tampon|Valeur du tampon correspondant à l'aire de captation du point de ramassage|integer| |
|geom2|Champ contenant la géométrie du tampon d'emprise définit par v_tampon où modifier selon l'influence|USER-DEFINED| |
|date_effet|Date de prise en compte des données dans le plan interactif Grand Public|timestamp without time zone|now()|


  * `t_t1_geo_v_pei_ctr` :trigger gérant la saisie ou la mise à jour des données PEI, intégrant les contrôles de saisies et la génération des messages d'erreur
  * `t_t2_log_pei` : intégration de valeurs dans la table de log 

`geo_dec_pav_tlc` : table géographique des attributs des PAV TLC.

|Nom attribut | Définition | Type  | Valeurs par défaut |
|:---|:---|:---|:---|  
|id_cont_tl|identifiant géographique unique|integer|nextval('m_dechet.geo_dec_pav_idconv_seq'::regclass)|"
|commune|libellé de la commune|character varying(50)| |
|insee|code insee de la commune|character(5)| |
|quartier|libellé du quartier|character varying(50)| |
|adresse|adresse|character varying(80)| |
|x_l93|coordonnée x en lambert 93|double precision| |
|y_l93|coordonnée y en lambert 93|double precision| |
|cont_nbr|nombre de conteneurs|integer| |
|cont_mat|code du matériaux constituant le conteneur (liste de choix lt_pav_contmat)|character varying(2)|'10'::character varying|
|cont_pos|code du type de position du conteneur (liste de choix lt_pav_contpos)|character varying(2)|'10'::character varying|
|date_sai|date de la saisie des informations|timestamp without time zone| |
|date_pose|date de pose|timestamp without time zone| |
|date_netoy|date de nettoyage|timestamp without time zone| |
|date_maj|date de mise à jour des informations|timestamp without time zone| |
|nom_entrep|code de l'entreprise gestionnaire du pav (liste de choix lt_pav_gest)|character varying(2)| |
|nom_entrep_99|autre gestionnaire si 99 saisie dans le champ nom_entrep|character varying(30)| |
|photo|libellé du fichier de la photo|character varying(254)| |
|url_photo|lien url de la photo|character varying(254)| |
|src_geom|code du référentiel spatial de saisie utilisé (liste de choix r_objet.lt_scr_geom)|character(2)|'00'::bpchar|
|env_type|code du type d'espace géographique (liste de choix lt_pav_envtype)|character varying(2)|'00'::character varying|
|env_implan|code du type d'espace urbain d'implantation (liste de choix lt_pav_envimplan)|character varying(2)|'00'::character varying|
|env_situ|code de la situation domaniale (liste de choix lt_pav_envsitu)|character varying(2)|'00'::character varying|
|tags|présence de tags|boolean|false|
|peinture|code de l'état de la peinture (liste de choix lt_pav_peinture)|character varying(2)|'00'::character varying|
|prox_corb|présence d'une corbeille à proximité|boolean|false|
|type_sol|code du type de sol (liste de choix (lt_pav_typesol)|character varying(2)|'00'::character varying|
|type_sol_99|autre type de sol si 99 saisie dans le champ type_sol|character varying(30)| |
|geom|champ contenant la géométrie de l'objet|USER-DEFINED| |
|op_sai|Opérateur de saisie de la donnée|character varying(80)| |
|observ|Observations diverses|character varying(500)| |
|v_tampon|Valeur du tampon d'emprise du PAV TLC|integer| |
|geom2|Champ contenant la géométrie du tampon d'emprise définit par v_tampon où modifier selon l'influence|USER-DEFINED| |
|date_effet|Date de prise en compte des données dans le plan interactif Grand Public|timestamp without time zone|now()|

`geo_dec_secteur_enc` : table géographique des secteurs de ramassage des encombrants.

|Nom attribut | Définition | Type  | Valeurs par défaut |
|:---|:---|:---|:---| 
|gid|Identifiant interne|integer|nextval('m_dechet.geo_dec_secteur_enc_seq'::regclass)|"
|insee|Code Insee de la commune|character varying(5)| |
|commune|Libellé de la commune|character varying(150)| |
|op_sai|Opérateur de saisie|character varying(80)| |
|observ|Observation(s)|character varying(254)| |
|src_geom|Référentiel de saisie|character varying(2)| |
|date_sai|Date de saisie|timestamp without time zone| |
|date_maj|Date de mise à jour|timestamp without time zone| |
|adresse|Adresse concernées par un ramassage des encombrants à jour fixe|character varying(254)| |
|l_secteur|Libellé du secteur par rapport au ramssage (fixe ou sur rendez-vous)|character varying(25)| |
|l_message1|Message diffusé sur l'application Grand Public pour les encombrants à jour fixe|character varying(500)| |
|l_message2|Message diffusé sur l'application Grand Public pour les encombrants sur rendez-vous|character varying(500)| |
|geom|Géométrie des points d'adresse à jour fixe|USER-DEFINED| |
|geom1|Géométrie des zones issus des adresses et par défaut les autres (1 seul polygone) sur rendez-vous. Sert dans GEO appli Gd public pour la recherche par adresse|USER-DEFINED| |

`geo_dec_secteur_om` : table géographique des secteurs de ramassage des ordures ménagères.

|Nom attribut | Définition | Type  | Valeurs par défaut |
|:---|:---|:---|:---| 
|gid|Identifiant unique interne|integer|nextval('m_dechet.geo_dec_secteur_om_seq'::regclass)|"
|l_zone|Nom du secteur de ramassage des ordures ménagères|character varying(150)| |
|insee|Code insee de la Commune|character varying(25)| |
|commune|Libellé de la commune|character varying(150)| |
|op_sai|Opérateur de saisie|character varying(80)| |
|observ|Observations|character varying(254)| |
|src_geom|Code de la valeur du référentiel de saisie (lien vers la liste de valeur r_objet.lt_src_geom|character varying(2)|'00'::character varying|
|date_sai|Date de saisie des informations|timestamp without time zone| |
|date_maj|Date de mise à jour des informations|timestamp without time zone| |
|l_fichier|Libellé du fichier avec son extension pour le document lié, ici le calendrier de collecte|character varying(100)| |
|l_message1|Espace pour rédiger un message qui sera intégré dans l'application grand public (plusieurs lignes possibles dans les champs l_message n|character varying(255)| |
|l_message2|2ème ligne du message|character varying(255)| |
|l_message3|3ème ligne du message|character varying(255)| |
|l_message4|4ème ligne du message|character varying(255)| |
|l_message5|5ème ligne du message|character varying(255)| |
|l_message6|6ème ligne du message|character varying(255)| |
|l_message7|7ème ligne du message|character varying(255)| |


### Classe d'objet attributaire et patrimoniale

`an_dec_pav_doc_media` : table attributaire des photos.

|Nom attribut | Définition | Type  | Valeurs par défaut |
|:---|:---|:---|:---|  
|id|Identifiant du PAV|integer| |
|media|Champ Média de GEO|text| |
|miniature|Champ miniature de GEO|bytea| |
|n_fichier|Nom du fichier|text| |
|t_fichier|Type de média dans GEO|text| |
|op_sai|Libellé de l'opérateur ayant intégrer le document|character varying(100)| |
|date_sai|Date d'intégration du document|timestamp without time zone| |
|d_photo|Date de la prise de vue|timestamp without time zone| |
|l_prec|Précision sur le document|character varying(1000)| |


`log_dec_pav` : table attributaire des logd.

|Nom attribut | Définition | Type  | Valeurs par défaut |
|:---|:---|:---|:---|  
|gid|identifiant unique|integer| |
|objet|Type de modification (update, delete, insert)|character varying(10)| |
|d_maj|Date de l'exécution de la modification|timestamp without time zone| |
|user|Utilisateur ayant exécuté l'exécution|character varying(50)| |
|relid|ID d'objet de la table qui a causé le déclenchement.|character varying(255)| |
|l_schema|Libellé du schéma contenant la table ou la vue exécutée ou mlodifiée|character varying(30)| |
|l_table|Libellé de la table exécutée|character varying(30)| |
|idgeo|Identifiant unique de l'objet de la table correspondante|character varying(100)| |
|geom|Champ contenant la géométrie des objets polygones modifiés ou supprimés|USER-DEFINED| |



### classes d'objets applicatives de gestion :

Sans objet

---

### classes d'objets applicatives métiers sont classés dans le schéma x_apps :
 
`x_apps.xapps_geo_v_pav_orient` : Vue géométrique des liens entre PAV supprimer, déplacer et le nouvel emplacement
  
`x_apps.xapps_geo_v_pav_verre_inactif` : Vue géographique permettant de visualiser les conteneurs PAV Verre inactifs (dans la cartothèque de l'application GEO sur le tri)

### classes d'objets applicatives grands publics sont classés dans le schéma x_apps_public :

`x_apps_public.xappspublic_geo_v_dec_pav_tampon` : Vue géométrique contenant les tampons d''emprise des conteneurs Verre pour EXPORT FME et recherche des adresse dans ses tampons pour remonter le PAV VERRE

`x_apps_public.xappspublic_geo_v_dec_pav_tlc_tampon` : Vue géométrique contenant les tampons d''emprise des conteneurs TLC pour EXPORT FME et recherche des adresse dans ses tampons pour remonter le PAV VERRE

`x_apps_public.xappspublic_geo_v_dec_secteur_enc_secteur` : Vue géométrique contenant les secteurs de rammassage des encombrants pour export dans GEO APPLI GD PUBLIC

### classes d'objets opendata sont classés dans le schéma x_opendata :

Sans objet

## Liste de valeurs


`lt_pei_type_pei` : Liste des types de PEI

|Nom attribut | Définition | Type  | Valeurs par défaut |
|:---|:---|:---|:---|    
|code|Code de la liste énumérée relative au type de PEI|character varying(2)| |
|valeur|Valeur de la liste énumérée relative au type de PEI|character varying(80)| |
|affich|Ordre d'affichage de la liste énumérée relative au type de PEI|character(1)| |

Particularité(s) à noter :
* Domaine de valeur issu du format d'échange défini par l'AFIGEO

Valeurs possibles :

|code | valeur | affich
|:---|:---|:---|     
|BI|Prise d'eau sous pression, notamment bouche d'incendie|2|
|CI|Citerne aérienne ou enterrée|4|
|NR|Non renseigné|5|
|PA|Point d'aspiration aménagé (point de puisage)|3|
|PI|Poteau d'incendie|1|

---

`lt_pei_diam_pei` : Liste permettant de décrire le diamètre intérieur du point d'eau incendie

|Nom attribut | Définition | Type  | Valeurs par défaut |
|:---|:---|:---|:---|    
|code|Code de la liste énumérée relative au type de PEI|integer| |
|valeur|Valeur de la liste énumérée relative au type de PEI|character varying(80)| |

Particularité(s) à noter :
* Domaine de valeur issu du format d'échange défini par l'AFIGEO


Valeurs possibles :

|code | valeur |
|:---|:---|  
|80|80|
|100|100|
|150|150|
|0|Non renseigné|

---

`lt_pei_source_pei` : Liste permettant de décrire le type de source d'alimentation du PEI

|Nom attribut | Définition | Type  | Valeurs par défaut |
|:---|:---|:---|:---|    
|code|Code de la liste énumérée relative au type de source du PEI|character varying(3)| |
|valeur|Valeur de la liste énumérée relative au type de source du PEI|character varying(80)| |
|code_open|Code pour les exports opendata de la liste énumérée relative au type de source du PEI|character varying(30)| |

Particularité(s) à noter :
* Domaine de valeur (code_open, valeur) issu du format d'échange défini par l'AFIGEO

Valeurs possibles :

|code | valeur | code_open |
|:---|:---|:---|   
|CI|Citerne|citerne|
|PE|Plan d'eau|plan_eau|
|PU|Puit|puits|
|CE|Cours d'eau|cours_eau|
|AEP|Réseau AEP|reseau_aep|
|IRR|Réseau d'irrigation|reseau_irrigation|
|PIS|Piscine|piscine|
|NR|Non renseigné||

---

`lt_pei_statut` : Liste permettant de décrire le statut juridique du PEI

|Nom attribut | Définition | Type  | Valeurs par défaut |
|:---|:---|:---|:---|    
|code|Code de la liste énumérée relative au statut juridique du PEI|character varying(2)| |
|valeur|Valeur de la liste énumérée relative au statut juridique du PEI|character varying(80)| |
|code_open|Code pour les exports opendata de la liste énumérée relative au statut juridique du PEI|character varying(10)| |

Particularité(s) à noter :
* Domaine de valeur (code_open, valeur) issu du format d'échange défini par l'AFIGEO

Valeurs possibles :

|code | valeur | code_open |
|:---|:---|:---|   
|01|Public|public|
|02|Privé|prive|
|00|Non renseigné|

---

`lt_pei_etat_pei` : Liste permettant de décrire l'état d'actualité du PEI

|Nom attribut | Définition | Type  | Valeurs par défaut |
|:---|:---|:---|:---|    
|code|Code de la liste énumérée relative à l'état d'actualité du PEI|character varying(2)| |
|valeur|Valeur de la liste énumérée relative à l'état d'actualité du PEI|character varying(80)| |

Valeurs possibles :

|code | valeur | 
|:---|:---|   
|01|Projet|
|02|Existant|
|03|Supprimé|
|00|Non renseigné|

---

`lt_pei_etat_boolean` : Liste permettant de décrire l'état d'un attribut "booléen" pour un PEI

|Nom attribut | Définition | Type  | Valeurs par défaut |
|:---|:---|:---|:---|    
|code|Code de la liste énumérée relative à l'état d'un attribut boolean|character varying(1)| |
|valeur|Valeur de la liste énumérée relative à l'état d'un attribut boolean|character varying(80)| |
|code_open|Code pour les exports opendata de la liste énumérée relative à l'état d'un attribut boolean|character varying(1)| |

Particularité(s) à noter :
* Domaine de valeur (code_open, valeur) issu du format d'échange défini par l'AFIGEO

Valeurs possibles :

|code | valeur | code_open |
|:---|:---|:---|   
|0|Non renseigné||
|f|Non|0|
|t|Oui|1|

---

`lt_pei_marque` : Liste permettant de décrire la marque du PEI

|Nom attribut | Définition | Type  | Valeurs par défaut |
|:---|:---|:---|:---|    
|code|Code de la liste énumérée relative à la marque du PEI|character varying(2)|to_char(nextval('m_defense_incendie.lt_pei_marque_seq'::regclass), 'FM00'::text)|
|valeur|Valeur de la liste énumérée relative à la marque du PEI|character varying(80)| |


Particularité(s) à noter :
* Domaine de valeur ouvert

Valeurs possibles :

|code | valeur |
|:---|:---|  
|00|Non renseigné|
|01|Bayard|
|02|...|
---

`lt_pei_raccord` : Liste permettant de décrire le type de raccord du PEI

|Nom attribut | Définition | Type  | Valeurs par défaut |
|:---|:---|:---|:---|    
|code|Code de la liste énumérée relative au type de raccord du PEI|character varying(2)|to_char(nextval('m_defense_incendie.lt_pei_raccord_seq'::regclass), 'FM00'::text)|
|valeur|Valeur de la liste énumérée relative au type de raccord du PEI|character varying(80)| |


Particularité(s) à noter :
* Domaine de valeur ouvert

Valeurs possibles :

|code | valeur |
|:---|:---|  
|00|Non renseigné|
|01|1x100|
|02|1x65|
|03|1x100 - 2x65|
|04|2x100 - 1x65|
|05|3x100|
|06|1x65 - 2x40|
|07|...|

---

`lt_pei_gestion` : Liste permettant de décrire le gestionnaire du PEI

|Nom attribut | Définition | Type  | Valeurs par défaut |
|:---|:---|:---|:---|    
|code|Code de la liste énumérée relative au gestionnaire du PEI|character varying(2)| |
|valeur|Valeur de la liste énumérée relative au gestionnaire du PEI|character varying(80)| |

Valeurs possibles :

|code | valeur | 
|:---|:---|   
|01|Etat|
|02|Région|
|03|Département|
|04|Intercommunalité|
|05|Commune|
|06|Office HLM|
|07|Privé|
|99|Autre|
|ZZ|Non concerné|
|00|Non renseigné|

---

`lt_pei_delegat` : Liste permettant de décrire le délégataire du réseau surlequel est lié un PEI

|Nom attribut | Définition | Type  | Valeurs par défaut |
|:---|:---|:---|:---|    
|code|Code de la liste énumérée relative au délégataire du réseau surlequel est lié un PEI|character varying(2)| |
|valeur|Valeur de la liste énumérée relative au délégataire du réseau surlequel est lié un PEI|character varying(80)| |

Particularité(s) à noter :
* Domaine de valeur ouvert

Valeurs possibles :

|code | valeur |
|:---|:---|  
|00|Non renseigné|
|01|Suez|
|02|Saur|
|03|Veolia|
|04|...|
---

`lt_pei_cs_sdis` : Liste permettant de décrire le nom du centre de secours de 1er appel du SDIS en charge du PEI

|Nom attribut | Définition | Type  | Valeurs par défaut |
|:---|:---|:---|:---|    
|code|Code de la liste énumérée relative au nom du CS SDIS en charge du PEI|character varying(5)| |
|valeur|Valeur de la liste énumérée relative au nom du CS SDIS en charge du PEI|character varying(80)| |

Particularité(s) à noter :
* Information connue par héritage de données PEI issues de sources tierces et difficile à maintenir car relevant de la gestion propre du SDIS (ex : présence de cas de découpage infra-communal dans la répartition de la prise en charge par les centres de secours)

Valeurs possibles :

|code | valeur |
|:---|:---|  
|00000|Non renseigné|
|60159|CS de Compiègne|
|60068|CS de Béthisy-Saint-Pierre|
|60636|CS de Thourotte|
|60667|CS de Verberie|
|60025|CS d'Attichy|
|60223|CS d'Estrées-Saint-Denis|
|60509|CS de Pont-Sainte-Maxence|

---

`lt_pei_anomalie` : Liste des anomalies possibles pour un PEI

|Nom attribut | Définition | Type  | Valeurs par défaut |
|:---|:---|:---|:---|    
|code|Code de la liste énumérée relative au type d'anomalie d'un PEI|character varying(2)| |
|valeur|Valeur de la liste énumérée relative au type d'anomalie d'un PEI|character varying(80)| |
|csq_acces|Impact de l'anomalie sur l''état de l''accessibilité du PEI|character varying(1)| |
|csq_sign|Impact de l'anomalie sur l''état de la signalisation du PEI|character varying(1)| |
|csq_conf|Impact de l''anomalie sur l'état de la conformité technique du PEI|character varying(1)| |

Particularité(s) à noter :
* Le fonctionnement du générateur d'application web permet la saisie de choix multiple par la concaténation des différents `code` séparées par un `;`. Il n'y a donc pas de nécessiter à gérer une cardinalité 1-n depuis la classe `an_pei_ctr` et donc pas de clé étrangère depuis cette dernière.

Valeurs possibles :

|code | valeur |csq_acces |csq_sign |csq_conf |
|:---|:---|    
|01|Manque bouchon|0|0|0|
|02|Manque capot ou capot HS|0|0|0|
|03|Manque de débit ou volume|0|0|1|
|04|Manque de signalisation|0|1|0|
|05|Problème d'accès|1|0|1|
|06|Ouverture point d'eau difficile|0|0|0|
|07|Fuite hydrant|0|0|0|
|08|Manque butée sur la vis d'ouverture|0|0|0|
|09|Purge HS|0|0|0|
|10|Pas d'écoulement d'eau|0|0|1|
|11|Végétation génante|0|0|0|
|12|Gêne accès extérieur|1|0|0|
|13|Equipement à remplacer|0|0|0|
|14|Hors service|0|0|1|
|15|Manqued'eau (pour citerne ou point d'aspiration seulement)|0|0|1|

---

## Log

`log_pei` : table des log de la base PEI.

|Nom attribut | Définition | Type  | Valeurs par défaut |
|:---|:---|:---|:---|
|id_audit|Identifiant unique de l'opération de base PEI|bigint|nextval('m_defense_incendie.log_pei_id_seq'::regclass)|
|type_ope|Type d'opération intervenue sur la base PEI|text| |
|ope_sai|Utilisateur ayant effectuée l'opération sur la base PEI|character varying(254)| |
|id_pei|Identifiant du PEI concerné par l'opération sur la base PEI|bigint| |
|date_maj|Horodatage de l'opération sur la base PEI|timestamp without time zone| |

Particularité(s) à noter :
* Table de log liée à la vue de gestion des données PEI

## Erreur

`x_apps.xapps_geo_v_pei_ctr_erreur` : table des messages d'erreurs remontant dans l'application par rapport à la saisie des données via la fiche d'information applicative.

|Nom attribut | Définition | Type  | Valeurs par défaut |
|:---|:---|:---|:---|
|gid|Identifiant unique du message|integer|NOT NULL|
|id_pei|Identifiant du PEI|integer| |
|erreur|Message à afficher dans la fiche d'information|character varying(500)| |
|horodatage|Date d'intégration du message|timestamp without time zone| |

Particularité(s) à noter :
* Cette table est uniquement liée dans GEO à la vue applicative.

---

## Projet QGIS pour la gestion

Un projet QGIS a été réalisé pour la gestion interne des données. Il est stocké ici :
R:\Projets\Metiers\1712ENV-ARC-PointEauIncendie\3-BaseDeDonnees
dans l'attente d'être placé ici Y:\Ressources\4-Partage\3-Procedures\QGIS

## Traitement automatisé mis en place (Workflow de l'ETL FME)

### Initialisation des données - Etat 0

Le fichier a utilisé est placé ici `R:\Projets\Metiers\1712ENV-ARC-PointEauIncendie\3-BaseDeDonnees\2-Production\init_data_PEI_sdis2arc.fmw`.


### Mise à jour régulière des données SDIS

Le processus de traitement est en cours de développement.


## Export Open Data

Le processus de traitement est en cours de développement.


---

## Schéma fonctionnel

### Modèle conceptuel simplifié

![mcd](img/mcd.jpg)
