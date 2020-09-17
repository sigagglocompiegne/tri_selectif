/*TRI SELECTIF V1.0*/
/*Creation du squelette de la structure des données */
/* tri_10_squelette.sql */
/*PostGIS*/

/* Propriétaire : GeoCompiegnois - http://geo.compiegnois.fr/ */
/* Auteur : Grégory Bodet */


-- ####################################################################################################################################################
-- ###                                                                                                                                              ###
-- ###                                                                SCHEMA                                                           ###
-- ###                                                                                                                                              ###
-- ####################################################################################################################################################

/*
-- Schema: m_dechet

-- DROP SCHEMA m_dechet;

CREATE SCHEMA m_dechet
  AUTHORIZATION sig_create;
  
COMMENT ON SCHEMA m_dechet
  IS 'Données métiers sur le thème des déchets et du recyclage';
  
*/

-- ####################################################################################################################################################
-- ###                                                                                                                                              ###
-- ###                                                                SEQUENCE                                                           ###
-- ###                                                                                                                                              ###
-- ####################################################################################################################################################

DROP SEQUENCE IF EXISTS m_dechet.geo_dec_pav_lieu_idlieu_seq;
DROP SEQUENCE IF EXISTS m_dechet.an_dec_pav_cont_idcont_seq;
DROP SEQUENCE IF EXISTS m_dechet.an_dec_pav_doc_media_gid_seq;

-- ################################################################# Séquence sur TABLE  ###############################################

-- SEQUENCE: m_dechet.geo_dec_pav_lieu_idlieu_seq

-- DROP SEQUENCE m_dechet.geo_dec_pav_lieu_idlieu_seq;

CREATE SEQUENCE m_dechet.geo_dec_pav_lieu_idlieu_seq
    INCREMENT 1
    START 424
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

COMMENT ON SEQUENCE m_dechet.geo_dec_pav_lieu_idlieu_seq
    IS 'Séquence d''incrémentation d''un numéro automatique sur le champ idlieu de la table geo_dec_pav_lieu';
    
-- SEQUENCE: m_dechet.an_dec_pav_cont_idcont_seq

-- DROP SEQUENCE m_dechet.an_dec_pav_cont_idcont_seq;

CREATE SEQUENCE m_dechet.an_dec_pav_cont_idcont_seq
    INCREMENT 1
    START 362
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE m_dechet.an_dec_pav_cont_idcont_seq
    OWNER TO sig_create;

-- SEQUENCE: m_dechet.an_dec_pav_doc_media_gid_seq

-- DROP SEQUENCE m_dechet.an_dec_pav_doc_media_gid_seq;

CREATE SEQUENCE m_dechet.an_dec_pav_doc_media_gid_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

  
  
-- ####################################################################################################################################################
-- ###                                                                                                                                              ###
-- ###                                                                DOMAINE DE VALEURS                                                            ###
-- ###                                                                                                                                              ###
-- ####################################################################################################################################################


-- fkey
ALTER TABLE m_dechet.geo_dec_pav_lieu DROP CONSTRAINT IF EXISTS geo_dec_pav_lieu_contrat_fkey;
ALTER TABLE m_dechet.geo_dec_pav_lieu DROP CONSTRAINT IF EXISTS geo_dec_pav_lieu_cttype_fkey;
ALTER TABLE m_dechet.geo_dec_pav_lieu DROP CONSTRAINT IF EXISTS geo_dec_pav_lieu_envimplan_fkey;
ALTER TABLE m_dechet.geo_dec_pav_lieu DROP CONSTRAINT IF EXISTS geo_dec_pav_lieu_envsitu_fkey;
ALTER TABLE m_dechet.geo_dec_pav_lieu DROP CONSTRAINT IF EXISTS geo_dec_pav_lieu_envtype_fkey;
ALTER TABLE m_dechet.geo_dec_pav_lieu DROP CONSTRAINT IF EXISTS geo_dec_pav_lieu_model_fkey;
ALTER TABLE m_dechet.geo_dec_pav_lieu DROP CONSTRAINT IF EXISTS geo_dec_pav_lieu_natpb_fkey;
ALTER TABLE m_dechet.geo_dec_pav_lieu DROP CONSTRAINT IF EXISTS geo_dec_pav_lieu_orient_fkey;
ALTER TABLE m_dechet.geo_dec_pav_lieu DROP CONSTRAINT IF EXISTS geo_dec_pav_lieu_propabord_fkey;
ALTER TABLE m_dechet.geo_dec_pav_lieu DROP CONSTRAINT IF EXISTS geo_dec_pav_lieu_srcgeom_fkey;
ALTER TABLE m_dechet.geo_dec_pav_lieu DROP CONSTRAINT IF EXISTS geo_dec_pav_lieu_statut_fkey;

ALTER TABLE m_dechet.an_dec_pav_cont DROP CONSTRAINT IF EXISTS an_dec_pav_cont_crochet_fkey;
ALTER TABLE m_dechet.an_dec_pav_cont DROP CONSTRAINT IF EXISTS an_dec_pav_cont_etatsign_fkey;
ALTER TABLE m_dechet.an_dec_pav_cont DROP CONSTRAINT IF EXISTS an_dec_pav_cont_eve_fkey;
ALTER TABLE m_dechet.an_dec_pav_cont DROP CONSTRAINT IF EXISTS an_dec_pav_cont_mat_fkey;
ALTER TABLE m_dechet.an_dec_pav_cont DROP CONSTRAINT IF EXISTS an_dec_pav_cont_model_fkey;
ALTER TABLE m_dechet.an_dec_pav_cont DROP CONSTRAINT IF EXISTS an_dec_pav_cont_modepreh_fkey;
ALTER TABLE m_dechet.an_dec_pav_cont DROP CONSTRAINT IF EXISTS an_dec_pav_cont_peinture_fkey;
ALTER TABLE m_dechet.an_dec_pav_cont DROP CONSTRAINT IF EXISTS an_dec_pav_cont_pos_fkey;
ALTER TABLE m_dechet.an_dec_pav_cont DROP CONSTRAINT IF EXISTS an_dec_pav_cont_prop_fkey;
ALTER TABLE m_dechet.an_dec_pav_cont DROP CONSTRAINT IF EXISTS an_dec_pav_cont_typesign_fkey;
ALTER TABLE m_dechet.an_dec_pav_cont DROP CONSTRAINT IF EXISTS an_dec_pav_cont_typesol_fkey;

ALTER TABLE m_dechet.an_dec_pav_cont_tlc DROP CONSTRAINT IF EXISTS an_dec_pav_cont_tlc_eve_fkey;
ALTER TABLE m_dechet.an_dec_pav_cont_tlc DROP CONSTRAINT IF EXISTS an_dec_pav_cont_tlc_gest_fkey;
ALTER TABLE m_dechet.an_dec_pav_cont_tlc DROP CONSTRAINT IF EXISTS an_dec_pav_cont_tlc_mat_fkey;
ALTER TABLE m_dechet.an_dec_pav_cont_tlc DROP CONSTRAINT IF EXISTS an_dec_pav_cont_tlc_model_fkey;
ALTER TABLE m_dechet.an_dec_pav_cont_tlc DROP CONSTRAINT IF EXISTS an_dec_pav_cont_tlc_pos_fkey;


-- domaine de valeur
DROP TABLE IF EXISTS m_dechet.lt_pav_contmat;
DROP TABLE IF EXISTS m_dechet.lt_pav_contpos;
DROP TABLE IF EXISTS m_dechet.lt_pav_crochet;
DROP TABLE IF EXISTS m_dechet.lt_pav_envimplan;
DROP TABLE IF EXISTS m_dechet.lt_pav_envsitu;
DROP TABLE IF EXISTS m_dechet.lt_pav_envtype;
DROP TABLE IF EXISTS m_dechet.lt_pav_etatsign;
DROP TABLE IF EXISTS m_dechet.lt_pav_gest;
DROP TABLE IF EXISTS m_dechet.lt_pav_modepreh;
DROP TABLE IF EXISTS m_dechet.lt_pav_natpb;
DROP TABLE IF EXISTS m_dechet.lt_pav_pavorient;
DROP TABLE IF EXISTS m_dechet.lt_pav_peinture;
DROP TABLE IF EXISTS m_dechet.lt_pav_proprete;
DROP TABLE IF EXISTS m_dechet.lt_pav_statut;
DROP TABLE IF EXISTS m_dechet.lt_pav_typesign;
DROP TABLE IF EXISTS m_dechet.lt_pav_typesol;
DROP TABLE IF EXISTS m_dechet.lt_pav_cttype;
DROP TABLE IF EXISTS m_dechet.lt_pav_eve;
DROP TABLE IF EXISTS m_dechet.lt_pav_modele;

-- ################################################################# Domaine valeur - lt_pav_contmat  ###############################################

-- Table: m_dechet.lt_pav_contmat

-- DROP TABLE m_dechet.lt_pav_contmat;

CREATE TABLE m_dechet.lt_pav_contmat
(
  cont_mat character varying(2) NOT NULL, -- Code matériaux constituant le conteneur
  cont_mat_lib character varying(30), -- Libellé des matériaux constituant le conteneur
  CONSTRAINT lt_pav_contmat_pkkey PRIMARY KEY (cont_mat) -- Clé primaire de la table lt_pav_contmat
)
WITH (
  OIDS=FALSE
);
COMMENT ON TABLE m_dechet.lt_pav_contmat
  IS 'Liste de valeurs des codes matériaux constituant le conteneur';
COMMENT ON COLUMN m_dechet.lt_pav_contmat.cont_mat IS 'Code matériaux constituant le conteneur';
COMMENT ON COLUMN m_dechet.lt_pav_contmat.cont_mat_lib IS 'Libellé des matériaux constituant le conteneur';

COMMENT ON CONSTRAINT lt_pav_contmat_pkkey ON m_dechet.lt_pav_contmat IS 'Clé primaire de la table lt_pav_contmat';

INSERT INTO m_dechet.lt_pav_contmat(
            cont_mat, cont_mat_lib)
    VALUES
    ('00','Non renseigné'),
    ('10','Métal'),
    ('20','Plastique'),
    ('21','Plastique + bois'), 
    ('30','Résine'), 
    ('40','Bois');
    
    
-- ################################################################# Domaine valeur - lt_pav_contpos  ###############################################

-- Table: m_dechet.lt_pav_contpos

-- DROP TABLE m_dechet.lt_pav_contpos;

CREATE TABLE m_dechet.lt_pav_contpos
(
  cont_pos character varying(2) NOT NULL, -- code du type de position du conteneur
  cont_pos_lib character varying(30), -- libellé du type de position du conteneur
  CONSTRAINT lt_pav_contpos_pkkey PRIMARY KEY (cont_pos) -- Clé primaire de la table lt_pav_contpos
)
WITH (
  OIDS=FALSE
);

COMMENT ON TABLE m_dechet.lt_pav_contpos
  IS 'Liste de valeurs des codes du type de position du conteneur';
COMMENT ON COLUMN m_dechet.lt_pav_contpos.cont_pos IS 'code du type de position du conteneur';
COMMENT ON COLUMN m_dechet.lt_pav_contpos.cont_pos_lib IS 'libellé du type de position du conteneur';

COMMENT ON CONSTRAINT lt_pav_contpos_pkkey ON m_dechet.lt_pav_contpos IS 'Clé primaire de la table lt_pav_contpos';

INSERT INTO m_dechet.lt_pav_contpos(
            cont_pos, cont_pos_lib)
    VALUES
    ('00','Non renseigné'),
    ('10','Aérien'),
    ('20','Enterré'),
    ('30','Semi-enterré'); 
    
-- ################################################################# Domaine valeur - lt_pav_crochet  ###############################################

-- Table: m_dechet.lt_pav_crochet

-- DROP TABLE m_dechet.lt_pav_crochet;

CREATE TABLE m_dechet.lt_pav_crochet
(
  crochet character varying(2) NOT NULL, -- code de l'état du crochet
  crochet_lib character varying(30), -- libellé de l'état du crochet
  CONSTRAINT lt_pav_crochet_pkkey PRIMARY KEY (crochet) -- Clé primaire de la table lt_pav_crochet
)
WITH (
  OIDS=FALSE
);

COMMENT ON TABLE m_dechet.lt_pav_crochet
  IS 'Liste de valeurs des codes de l''état du crochet ';
COMMENT ON COLUMN m_dechet.lt_pav_crochet.crochet IS 'code de l''état du crochet ';
COMMENT ON COLUMN m_dechet.lt_pav_crochet.crochet_lib IS 'libellé de l''état du crochet ';

COMMENT ON CONSTRAINT lt_pav_crochet_pkkey ON m_dechet.lt_pav_crochet IS 'Clé primaire de la table lt_pav_crochet';

INSERT INTO m_dechet.lt_pav_crochet(
            crochet, crochet_lib)
    VALUES
    ('00','Non renseigné'),
    ('10','RAS'),
    ('20','Tordu');
    
    
-- ################################################################# Domaine valeur - lt_pav_envimplan  ###############################################

-- Table: m_dechet.lt_pav_envimplan

-- DROP TABLE m_dechet.lt_pav_envimplan;

CREATE TABLE m_dechet.lt_pav_envimplan
(
  env_implan character varying(2) NOT NULL, -- code du type d'espace urbain d'implantation
  env_implan_lib character varying(30), -- libellé du type d'espace urbain d'implantation
  CONSTRAINT lt_pav_envimplan_pkkey PRIMARY KEY (env_implan) -- Clé primaire de la table lt_pav_envimplan
)
WITH (
  OIDS=FALSE
);

COMMENT ON TABLE m_dechet.lt_pav_envimplan
  IS 'Liste de valeurs des codes du type d''espace urbain d''implantation';
COMMENT ON COLUMN m_dechet.lt_pav_envimplan.env_implan IS 'code du type d''espace urbain d''implantation';
COMMENT ON COLUMN m_dechet.lt_pav_envimplan.env_implan_lib IS 'libellé du type d''espace urbain d''implantation';

COMMENT ON CONSTRAINT lt_pav_envimplan_pkkey ON m_dechet.lt_pav_envimplan IS 'Clé primaire de la table lt_pav_envimplan';

INSERT INTO m_dechet.lt_pav_envimplan(
            env_implan, env_implan_lib)
    VALUES
    ('00','Non renseigné'),
    ('10','Pavillonnaire'),
    ('20','Collectif'),
    ('30','Mixte (y compris ZI)'),
    ('40','Professionnel');
    
-- ################################################################# Domaine valeur - lt_pav_envsitu  ###############################################

-- Table: m_dechet.lt_pav_envsitu

-- DROP TABLE m_dechet.lt_pav_envsitu;

CREATE TABLE m_dechet.lt_pav_envsitu
(
  env_situ character varying(2) NOT NULL, -- code de la situation domaniale
  env_situ_lib character varying(30), -- libellé du type de la situation domaniale
  CONSTRAINT lt_pav_envsitu_pkkey PRIMARY KEY (env_situ) -- Clé primaire de la table lt_pav_envsitu
)
WITH (
  OIDS=FALSE
);

COMMENT ON TABLE m_dechet.lt_pav_envsitu
  IS 'Liste de valeurs des codes de la situation domaniale';
COMMENT ON COLUMN m_dechet.lt_pav_envsitu.env_situ IS 'code de la situation domaniale';
COMMENT ON COLUMN m_dechet.lt_pav_envsitu.env_situ_lib IS 'libellé du type de la situation domaniale';

COMMENT ON CONSTRAINT lt_pav_envsitu_pkkey ON m_dechet.lt_pav_envsitu IS 'Clé primaire de la table lt_pav_envsitu';

INSERT INTO m_dechet.lt_pav_envsitu(
            env_situ, env_situ_lib)
    VALUES
    ('00','Non renseigné'),
    ('10','Terrain privé'),
    ('20','Terrain public');
    
-- ################################################################# Domaine valeur - lt_pav_envtype  ###############################################

-- Table: m_dechet.lt_pav_envtype

-- DROP TABLE m_dechet.lt_pav_envtype;

CREATE TABLE m_dechet.lt_pav_envtype
(
  env_type character varying(2) NOT NULL, -- code du type d'espace géographique
  env_type_lib character varying(30), -- libellé du type d'espace géographique
  CONSTRAINT lt_pav_envtype_pkkey PRIMARY KEY (env_type) -- Clé primaire de la table lt_pav_envtype
)
WITH (
  OIDS=FALSE
);

COMMENT ON TABLE m_dechet.lt_pav_envtype
  IS 'Liste de valeurs des codes du type d''espace géographique';
COMMENT ON COLUMN m_dechet.lt_pav_envtype.env_type IS 'code du type d''espace géographique';
COMMENT ON COLUMN m_dechet.lt_pav_envtype.env_type_lib IS 'libellé du type d''espace géographique';

COMMENT ON CONSTRAINT lt_pav_envtype_pkkey ON m_dechet.lt_pav_envtype IS 'Clé primaire de la table lt_pav_envtype';


INSERT INTO m_dechet.lt_pav_envtype(
            env_type, env_type_lib)
    VALUES
    ('00','Non renseigné'),
    ('10','Urbain'),
    ('20','Rural'); 
    
    
-- ################################################################# Domaine valeur - lt_pav_etatsign  ###############################################

-- Table: m_dechet.lt_pav_etatsign

-- DROP TABLE m_dechet.lt_pav_etatsign;

CREATE TABLE m_dechet.lt_pav_etatsign
(
  etat_sign character varying(2) NOT NULL, -- Code matériaux constituant le conteneur
  etat_sign_lib character varying(30), -- Libellé des matériaux constituant le conteneur
  CONSTRAINT lt_pav_etat_sign_pkkey PRIMARY KEY (etat_sign) -- Clé primaire de la table lt_pav_etat_sign
)
WITH (
  OIDS=FALSE
);

COMMENT ON TABLE m_dechet.lt_pav_etatsign
  IS 'Liste de valeurs de l''état de la signalitique';
COMMENT ON COLUMN m_dechet.lt_pav_etatsign.etat_sign IS 'Code matériaux constituant le conteneur';
COMMENT ON COLUMN m_dechet.lt_pav_etatsign.etat_sign_lib IS 'Libellé des matériaux constituant le conteneur';

COMMENT ON CONSTRAINT lt_pav_etat_sign_pkkey ON m_dechet.lt_pav_etatsign IS 'Clé primaire de la table lt_pav_etat_sign';


INSERT INTO m_dechet.lt_pav_etatsign(
            etat_sign, etat_sign_lib)
    VALUES
    ('00','Non renseigné'),
    ('10','Correct'),
    ('20','Moyen'), 
    ('30','Mauvais'),
    ('40','Incomplet'); 
    
-- ################################################################# Domaine valeur - lt_pav_gest  ###############################################

-- Table: m_dechet.lt_pav_gest

-- DROP TABLE m_dechet.lt_pav_gest;

CREATE TABLE m_dechet.lt_pav_gest
(
  nom_entrep character varying(2) NOT NULL, -- code du gestionnaire du PAV TLC
  nom_entrep_lib character varying(30), -- Libellé du code du gestionnaire du PAV TLC
  CONSTRAINT lt_pav_gest_pkkey PRIMARY KEY (nom_entrep) -- Clé primaire de la table lt_pav_gest
)
WITH (
  OIDS=FALSE
);

COMMENT ON TABLE m_dechet.lt_pav_gest
  IS 'Liste de valeurs des codes des gestionnaire du PAV TLC';
COMMENT ON COLUMN m_dechet.lt_pav_gest.nom_entrep IS 'code du gestionnaire du PAV TLC';
COMMENT ON COLUMN m_dechet.lt_pav_gest.nom_entrep_lib IS 'Libellé du code du gestionnaire du PAV TLC';

COMMENT ON CONSTRAINT lt_pav_gest_pkkey ON m_dechet.lt_pav_gest IS 'Clé primaire de la table lt_pav_gest';


INSERT INTO m_dechet.lt_pav_gest(
            nom_entrep, nom_entrep_lib)
    VALUES
    ('00','Non renseigné'),
    ('10','Le Relais'),
    ('20','Eco Textile'), 
    ('99','Autre'); 
    
-- ################################################################# Domaine valeur - lt_pav_modepreh  ###############################################

-- Table: m_dechet.lt_pav_modepreh

-- DROP TABLE m_dechet.lt_pav_modepreh;

CREATE TABLE m_dechet.lt_pav_modepreh
(
  mode_preh character varying(2) NOT NULL, -- code du mode de préhension
  mode_preh_lib character varying(30), -- libellé du mode de préhension
  CONSTRAINT lt_pav_modepreh_pkkey PRIMARY KEY (mode_preh) -- Clé primaire de la table lt_pav_modepreh
)
WITH (
  OIDS=FALSE
);

COMMENT ON TABLE m_dechet.lt_pav_modepreh
  IS 'Liste de valeurs des codes du mode de préhension';
COMMENT ON COLUMN m_dechet.lt_pav_modepreh.mode_preh IS 'code du mode de préhension';
COMMENT ON COLUMN m_dechet.lt_pav_modepreh.mode_preh_lib IS 'libellé du mode de préhension';

COMMENT ON CONSTRAINT lt_pav_modepreh_pkkey ON m_dechet.lt_pav_modepreh IS 'Clé primaire de la table lt_pav_modepreh';


INSERT INTO m_dechet.lt_pav_modepreh(
            mode_preh, mode_preh_lib)
    VALUES
    ('00','Non renseigné'),
    ('10','Crochet'),
    ('20','Kinshofer');
    
-- ################################################################# Domaine valeur - lt_pav_natpb  ###############################################


-- Table: m_dechet.lt_pav_natpb

-- DROP TABLE m_dechet.lt_pav_natpb;

CREATE TABLE m_dechet.lt_pav_natpb
(
  nat_pb character varying(2) NOT NULL, -- code de la nature du ou des problèmes
  nat_pb_lib character varying(30), -- Libellé des codes de la nature du ou des problèmes
  CONSTRAINT lt_pav_natpb_pkkey PRIMARY KEY (nat_pb) -- Clé primaire de la table lt_pav_natpb
)
WITH (
  OIDS=FALSE
);

COMMENT ON TABLE m_dechet.lt_pav_natpb
  IS 'Liste de valeurs des codes de la nature du ou des problèmes';
COMMENT ON COLUMN m_dechet.lt_pav_natpb.nat_pb IS 'code de la nature du ou des problèmes';
COMMENT ON COLUMN m_dechet.lt_pav_natpb.nat_pb_lib IS 'Libellé des codes de la nature du ou des problèmes';

COMMENT ON CONSTRAINT lt_pav_natpb_pkkey ON m_dechet.lt_pav_natpb IS 'Clé primaire de la table lt_pav_natpb';


INSERT INTO m_dechet.lt_pav_natpb(
            nat_pb, nat_pb_lib)
    VALUES
    ('00','Non renseigné'),
    ('01','Accès restreint'),
    ('02','Arbres'),
    ('03','Lignes aériennes'),
    ('04','Danger'),
    ('05','Excentré'),
    ('06','Marche arrière'),
    ('07','Pas de stationnement'),
    ('08','Sousauvent'),
    ('09','Stationnement gênant'),
    ('10','Virage'),
    ('99','Autre');
    
-- ################################################################# Domaine valeur - lt_pav_pavorient  ###############################################

-- Table: m_dechet.lt_pav_pavorient

-- DROP TABLE m_dechet.lt_pav_pavorient;

CREATE TABLE m_dechet.lt_pav_pavorient
(
  pavorient character varying(2) NOT NULL, -- code de l'orientation du PAV suite à l'état des lieux de l'été 2016
  pavorient_lib character varying(30), -- Libellé de l'orientation du PAV suite à l'état des lieux de l'été 2016
  CONSTRAINT lt_pav_pavorient_pkkey PRIMARY KEY (pavorient) -- Clé primaire de la table lt_pav_pavorient
)
WITH (
  OIDS=FALSE
);

COMMENT ON TABLE m_dechet.lt_pav_pavorient
  IS 'Liste de valeurs des orientations retenues';
COMMENT ON COLUMN m_dechet.lt_pav_pavorient.pavorient IS 'code de l''orientation du PAV suite à l''état des lieux de l''été 2016';
COMMENT ON COLUMN m_dechet.lt_pav_pavorient.pavorient_lib IS 'Libellé de l''orientation du PAV suite à l''état des lieux de l''été 2016';

COMMENT ON CONSTRAINT lt_pav_pavorient_pkkey ON m_dechet.lt_pav_pavorient IS 'Clé primaire de la table lt_pav_pavorient';

INSERT INTO m_dechet.lt_pav_pavorient(
            pavorient, pavorient_lib)
    VALUES
    ('00','Non renseigné'),
    ('10','A conserver seul'),
    ('20','A renforcer'),
    ('30','A supprimer'),
    ('40','A déplacer'),
    ('50','A créer');

-- ################################################################# Domaine valeur - lt_pav_peinture  ###############################################

-- Table: m_dechet.lt_pav_peinture

-- DROP TABLE m_dechet.lt_pav_peinture;

CREATE TABLE m_dechet.lt_pav_peinture
(
  peinture character varying(2) NOT NULL, -- code de l'état de la peinture
  peinture_lib character varying(30), -- Libellé de l'état de la peinture
  CONSTRAINT lt_pav_peinture_pkkey PRIMARY KEY (peinture) -- Clé primaire de la table lt_pav_peinture
)
WITH (
  OIDS=FALSE
);

COMMENT ON TABLE m_dechet.lt_pav_peinture
  IS 'Liste de valeurs des code de l''état de la peinture';
COMMENT ON COLUMN m_dechet.lt_pav_peinture.peinture IS 'code de l''état de la peinture';
COMMENT ON COLUMN m_dechet.lt_pav_peinture.peinture_lib IS 'Libellé de l''état de la peinture';

COMMENT ON CONSTRAINT lt_pav_peinture_pkkey ON m_dechet.lt_pav_peinture IS 'Clé primaire de la table lt_pav_peinture';

INSERT INTO m_dechet.lt_pav_peinture(
            peinture, peinture_lib)
    VALUES
    ('00','Non renseigné'),
    ('10','RAS'),
    ('20','Abîmée'),
    ('30','Brûlée');

-- ################################################################# Domaine valeur - lt_pav_proprete  ###############################################

-- Table: m_dechet.lt_pav_proprete

-- DROP TABLE m_dechet.lt_pav_proprete;

CREATE TABLE m_dechet.lt_pav_proprete
(
  proprete character varying(2) NOT NULL, -- code de l'état de la propreté
  proprete_lib character varying(30), -- Libellé code de l'état de la propreté
  CONSTRAINT lt_pav_proprete_pkkey PRIMARY KEY (proprete) -- Clé primaire de la table lt_pav_proprete
)
WITH (
  OIDS=FALSE
);

COMMENT ON TABLE m_dechet.lt_pav_proprete
  IS 'Liste de valeurs des codes de l''état de la propreté';
COMMENT ON COLUMN m_dechet.lt_pav_proprete.proprete IS 'code de l''état de la propreté';
COMMENT ON COLUMN m_dechet.lt_pav_proprete.proprete_lib IS 'Libellé code de l''état de la propreté';

COMMENT ON CONSTRAINT lt_pav_proprete_pkkey ON m_dechet.lt_pav_proprete IS 'Clé primaire de la table lt_pav_proprete';


INSERT INTO m_dechet.lt_pav_proprete(
            proprete, proprete_lib)
    VALUES
    ('00','Non renseigné'),
    ('10','Propre'),
    ('20','Moyen'),
    ('30','Sale');

-- ################################################################# Domaine valeur - lt_pav_statut  ###############################################

-- Table: m_dechet.lt_pav_statut

-- DROP TABLE m_dechet.lt_pav_statut;

CREATE TABLE m_dechet.lt_pav_statut
(
  statut character varying(2) NOT NULL, -- code du statut
  statut_lib character varying(30), -- Libellé du statut
  CONSTRAINT lt_pav_statut_pkkey PRIMARY KEY (statut) -- Clé primaire de la table lt_pav_statut
)
WITH (
  OIDS=FALSE
);

COMMENT ON TABLE m_dechet.lt_pav_statut
  IS 'Liste de valeurs des codes du statut du PAV';
COMMENT ON COLUMN m_dechet.lt_pav_statut.statut IS 'code du statut';
COMMENT ON COLUMN m_dechet.lt_pav_statut.statut_lib IS 'Libellé du statut';

COMMENT ON CONSTRAINT lt_pav_statut_pkkey ON m_dechet.lt_pav_statut IS 'Clé primaire de la table lt_pav_statut';

INSERT INTO m_dechet.lt_pav_statut(
            statut, statut_lib)
    VALUES
    ('00','Non renseigné'),
    ('10','Actif'),
    ('20','Inactif (projet, existe plus)');
    
-- ################################################################# Domaine valeur - lt_pav_typesign  ###############################################

-- Table: m_dechet.lt_pav_typesign

-- DROP TABLE m_dechet.lt_pav_typesign;

CREATE TABLE m_dechet.lt_pav_typesign
(
  type_sign character varying(2) NOT NULL, -- code du type de signalétique
  type_sign_lib character varying(30), -- Libellé du type de signalétique
  CONSTRAINT lt_pav_typesign_pkkey PRIMARY KEY (type_sign) -- Clé primaire de la table lt_pav_typesign
)
WITH (
  OIDS=FALSE
);

COMMENT ON TABLE m_dechet.lt_pav_typesign
  IS 'Liste de valeurs des codes du type de signalétique';
COMMENT ON COLUMN m_dechet.lt_pav_typesign.type_sign IS 'code du type de signalétique';
COMMENT ON COLUMN m_dechet.lt_pav_typesign.type_sign_lib IS 'Libellé du type de signalétique';

COMMENT ON CONSTRAINT lt_pav_typesign_pkkey ON m_dechet.lt_pav_typesign IS 'Clé primaire de la table lt_pav_typesign';

INSERT INTO m_dechet.lt_pav_typesign(
            type_sign, type_sign_lib)
    VALUES
    ('00','Non renseigné'),
    ('10','Adhésif'),
    ('20','Totem'),
    ('30','Covering'),
    ('40','Plaque + adhésif');

-- ################################################################# Domaine valeur - lt_pav_typesol  ###############################################

-- Table: m_dechet.lt_pav_typesol

-- DROP TABLE m_dechet.lt_pav_typesol;

CREATE TABLE m_dechet.lt_pav_typesol
(
  type_sol character varying(2) NOT NULL, -- code du type de sol
  type_sol_lib character varying(30), -- Libellé du type de sol
  CONSTRAINT lt_pav_typesol_pkkey PRIMARY KEY (type_sol) -- Clé primaire de la table lt_pav_typesol
)
WITH (
  OIDS=FALSE
);

COMMENT ON TABLE m_dechet.lt_pav_typesol
  IS 'Liste de valeurs des types de sols';
COMMENT ON COLUMN m_dechet.lt_pav_typesol.type_sol IS 'code du type de sol';
COMMENT ON COLUMN m_dechet.lt_pav_typesol.type_sol_lib IS 'Libellé du type de sol';

COMMENT ON CONSTRAINT lt_pav_typesol_pkkey ON m_dechet.lt_pav_typesol IS 'Clé primaire de la table lt_pav_typesol';

INSERT INTO m_dechet.lt_pav_typesol(
            type_sol, type_sol_lib)
    VALUES
    ('00','Non renseigné'),
    ('10','Dalle'),
    ('20','Bitume'),
    ('30','Terre'),
    ('99','Autre');

-- ####################################################################################################################################################
-- ###                                                                                                                                              ###
-- ###                                                                TABLE                                                           ###
-- ###                                                                                                                                              ###
-- ####################################################################################################################################################

-- Table: m_dechet.geo_dec_pav_verre

-- DROP TABLE m_dechet.geo_dec_pav_verre;

CREATE TABLE m_dechet.geo_dec_pav_verre
(
  id_contver integer NOT NULL DEFAULT nextval('m_dechet.geo_dec_pav_idconv_seq'::regclass), -- Identifiant unique géographique
  commune character varying(30), -- libellé de la commune
  insee character(5), -- numéro insee de la commune
  quartier character varying(50), -- libellé du quartier
  adresse character varying(80), -- adresse d'implantation
  x_l93 double precision, -- coordonnée x en lambert 93
  y_l93 double precision, -- coordonnée y en lambert 93
  cont_nbr integer, -- nombre de conteneurs
  cont_mat character varying(2) DEFAULT '10'::character varying, -- code du matériaux constituant le conteneur (liste de choix lt_pav_contmat)
  cont_pos character varying(2) DEFAULT '10'::character varying, -- code du type de position du conteneur (liste de choix lt_pav_contpos)
  date_sai timestamp without time zone, -- date de saisie de l'information
  date_pos timestamp without time zone, -- date de pose
  date_net timestamp without time zone, -- date de nettoyage
  date_maj timestamp without time zone, -- date de mise à jour des informations
  photo character varying(254), -- Nom du fichier de la photo avant la mise à jour de juillet 2016 par le BE RETIF
  url_photo character varying(254), -- Lien url vers la photo avant la mise à jour de juillet 2016 par le BE RETIF
  src_geom character(2) DEFAULT '00'::bpchar, -- code du référentiel spatial de saisie utilisé (liste de choix r_objet.lt_src_geom)
  volume double precision, -- volume en m3 (par défaut 4)
  env_type character varying(2) DEFAULT '00'::character varying, -- code du type d'espace géographique (liste de choix lt_pav_envtype)
  env_implan character varying(2) DEFAULT '00'::character varying, -- code du type d'espace urbain d'implantation (liste de choix lt_pav_envimplan)
  env_situ character varying(2) DEFAULT '00'::character varying, -- code de la situation domaniale (liste de choix lt_pav_envsitu)
  mode_preh character varying(2) DEFAULT '10'::character varying, -- code du mode de préhension (liste de choix lt_pav_modepreh)
  crochet character varying(2) DEFAULT '00'::character varying, -- code de l'état du crochet (liste de choix lt_pav_crochet)
  opercules boolean, -- Bavettes sur opercules disponibles
  tags boolean, -- présence de tags
  peinture character varying(2) DEFAULT '00'::character varying, -- code de l'état de la peinture (liste de choix lt_pav_peinture)
  prox_corb boolean, -- présence d'une corbeille à proximité
  type_sol character varying(2) DEFAULT '00'::character varying, -- code du type de sol (liste de choix (lt_pav_typesol)
  trp_rest boolean, -- présence d'une trappe pour restaurateur
  etat_sign character varying(30), -- état de la signalétique (création d'une liste de valeur en fonction de l'état des lieux)
  type_sign character varying(2) DEFAULT '00'::character varying, -- code du type de signalétique (liste de choix lt_pav_typesign)
  proprete character varying(2) DEFAULT '00'::character varying, -- code de l'état de la propreté (liste de choix lt_pav_proprete)
  prop_abor character varying(2) DEFAULT '00'::character varying, -- code de l'état de la propreté des abords (liste de choix lt_pav_propabor)
  def_struc character varying(30), -- défaut de structure visible
  hab_pav integer, -- Tonnage par gisement d'habitants
  opt_pav integer, -- nombre de PAV manquant ou excédents par rapport aux préconisation éco-emballages
  ame_acces boolean, -- accéssibilité à revoir
  nat_pb character varying(2) DEFAULT '00'::character varying, -- code de la nature du ou des problèmes (liste de choix lt_pav_natpb)
  nat_pb_99 character varying(500), -- précision sur la nature du problème
  geom geometry(Point,2154), -- champ contenant la géométrie de l'objet
  op_sai character varying(80), -- Opérateur de saisie de la donnée
  observ character varying(500), -- Observations diverses
  pavorient character varying(2), -- code des préconisations pour l'amélioration dee emplacements des PAV Verre (suite à l'état des lieux de l'été 2016
  id_parent integer, -- identifiant du PAV Verre parent selon les préconisations
  statut character varying(2), -- code du statut du PAV (actif ou inactif)
  v_tampon integer, -- Valeur du tampon correspondant à l'aire de captation du point de ramassage
  geom2 geometry(Polygon,2154), -- Champ contenant la géométrie du tampon d'emprise définit par v_tampon où modifier selon l'influence
  date_effet timestamp without time zone DEFAULT now(), -- Date de prise en compte des données dans le plan interactif Grand Public
  CONSTRAINT geo_dec_pav_verre_prkey PRIMARY KEY (id_contver),
  CONSTRAINT geo_dec_pav_verre_contmat_fkey FOREIGN KEY (cont_mat)
      REFERENCES m_dechet.lt_pav_contmat (cont_mat) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT geo_dec_pav_verre_contpos_fkey FOREIGN KEY (cont_pos)
      REFERENCES m_dechet.lt_pav_contpos (cont_pos) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT geo_dec_pav_verre_crochet_fkey FOREIGN KEY (crochet)
      REFERENCES m_dechet.lt_pav_crochet (crochet) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT geo_dec_pav_verre_envimplan_fkey FOREIGN KEY (env_implan)
      REFERENCES m_dechet.lt_pav_envimplan (env_implan) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT geo_dec_pav_verre_envsitu_fkey FOREIGN KEY (env_situ)
      REFERENCES m_dechet.lt_pav_envsitu (env_situ) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT geo_dec_pav_verre_envtype_fkey FOREIGN KEY (env_type)
      REFERENCES m_dechet.lt_pav_envtype (env_type) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT geo_dec_pav_verre_etatsign_fkey FOREIGN KEY (etat_sign)
      REFERENCES m_dechet.lt_pav_etatsign (etat_sign) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT geo_dec_pav_verre_modepreh_fkey FOREIGN KEY (mode_preh)
      REFERENCES m_dechet.lt_pav_modepreh (mode_preh) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT geo_dec_pav_verre_natpb_fkey FOREIGN KEY (nat_pb)
      REFERENCES m_dechet.lt_pav_natpb (nat_pb) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT geo_dec_pav_verre_peinture_fkey FOREIGN KEY (peinture)
      REFERENCES m_dechet.lt_pav_peinture (peinture) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT geo_dec_pav_verre_propabord_fkey FOREIGN KEY (proprete)
      REFERENCES m_dechet.lt_pav_proprete (proprete) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT geo_dec_pav_verre_proprete_fkey FOREIGN KEY (proprete)
      REFERENCES m_dechet.lt_pav_proprete (proprete) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT geo_dec_pav_verre_srcgeom_fkey FOREIGN KEY (src_geom)
      REFERENCES r_objet.lt_src_geom (code) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT geo_dec_pav_verre_statut_fkey FOREIGN KEY (statut)
      REFERENCES m_dechet.lt_pav_statut (statut) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT geo_dec_pav_verre_typesign_fkey FOREIGN KEY (type_sign)
      REFERENCES m_dechet.lt_pav_typesign (type_sign) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT geo_dec_pav_verre_typesol_fkey FOREIGN KEY (type_sol)
      REFERENCES m_dechet.lt_pav_typesol (type_sol) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);

COMMENT ON TABLE m_dechet.geo_dec_pav_verre
  IS 'Localisation des points d''apport volontaire verre - version 2 : nouveau modèle suite à la mise à jour de juillet 2016 - cette table remplacera la table "geo_dec_pav_verre" à la fin de la mise à jour (modifier la structure de la table dans Geo et intégrer les listes de choix)';
COMMENT ON COLUMN m_dechet.geo_dec_pav_verre.id_contver IS 'Identifiant unique géographique';
COMMENT ON COLUMN m_dechet.geo_dec_pav_verre.commune IS 'libellé de la commune';
COMMENT ON COLUMN m_dechet.geo_dec_pav_verre.insee IS 'numéro insee de la commune';
COMMENT ON COLUMN m_dechet.geo_dec_pav_verre.quartier IS 'libellé du quartier';
COMMENT ON COLUMN m_dechet.geo_dec_pav_verre.adresse IS 'adresse d''implantation';
COMMENT ON COLUMN m_dechet.geo_dec_pav_verre.x_l93 IS 'coordonnée x en lambert 93';
COMMENT ON COLUMN m_dechet.geo_dec_pav_verre.y_l93 IS 'coordonnée y en lambert 93';
COMMENT ON COLUMN m_dechet.geo_dec_pav_verre.cont_nbr IS 'nombre de conteneurs';
COMMENT ON COLUMN m_dechet.geo_dec_pav_verre.cont_mat IS 'code du matériaux constituant le conteneur (liste de choix lt_pav_contmat)';
COMMENT ON COLUMN m_dechet.geo_dec_pav_verre.cont_pos IS 'code du type de position du conteneur (liste de choix lt_pav_contpos)';
COMMENT ON COLUMN m_dechet.geo_dec_pav_verre.date_sai IS 'date de saisie de l''information';
COMMENT ON COLUMN m_dechet.geo_dec_pav_verre.date_pos IS 'date de pose';
COMMENT ON COLUMN m_dechet.geo_dec_pav_verre.date_net IS 'date de nettoyage';
COMMENT ON COLUMN m_dechet.geo_dec_pav_verre.date_maj IS 'date de mise à jour des informations';
COMMENT ON COLUMN m_dechet.geo_dec_pav_verre.photo IS 'Nom du fichier de la photo avant la mise à jour de juillet 2016 par le BE RETIF';
COMMENT ON COLUMN m_dechet.geo_dec_pav_verre.url_photo IS 'Lien url vers la photo avant la mise à jour de juillet 2016 par le BE RETIF';
COMMENT ON COLUMN m_dechet.geo_dec_pav_verre.src_geom IS 'code du référentiel spatial de saisie utilisé (liste de choix r_objet.lt_src_geom)';
COMMENT ON COLUMN m_dechet.geo_dec_pav_verre.volume IS 'volume en m3 (par défaut 4)';
COMMENT ON COLUMN m_dechet.geo_dec_pav_verre.env_type IS 'code du type d''espace géographique (liste de choix lt_pav_envtype)';
COMMENT ON COLUMN m_dechet.geo_dec_pav_verre.env_implan IS 'code du type d''espace urbain d''implantation (liste de choix lt_pav_envimplan)';
COMMENT ON COLUMN m_dechet.geo_dec_pav_verre.env_situ IS 'code de la situation domaniale (liste de choix lt_pav_envsitu)';
COMMENT ON COLUMN m_dechet.geo_dec_pav_verre.mode_preh IS 'code du mode de préhension (liste de choix lt_pav_modepreh)';
COMMENT ON COLUMN m_dechet.geo_dec_pav_verre.crochet IS 'code de l''état du crochet (liste de choix lt_pav_crochet)';
COMMENT ON COLUMN m_dechet.geo_dec_pav_verre.opercules IS 'Bavettes sur opercules disponibles';
COMMENT ON COLUMN m_dechet.geo_dec_pav_verre.tags IS 'présence de tags';
COMMENT ON COLUMN m_dechet.geo_dec_pav_verre.peinture IS 'code de l''état de la peinture (liste de choix lt_pav_peinture)';
COMMENT ON COLUMN m_dechet.geo_dec_pav_verre.prox_corb IS 'présence d''une corbeille à proximité';
COMMENT ON COLUMN m_dechet.geo_dec_pav_verre.type_sol IS 'code du type de sol (liste de choix (lt_pav_typesol)';
COMMENT ON COLUMN m_dechet.geo_dec_pav_verre.trp_rest IS 'présence d''une trappe pour restaurateur';
COMMENT ON COLUMN m_dechet.geo_dec_pav_verre.etat_sign IS 'état de la signalétique (création d''une liste de valeur en fonction de l''état des lieux)';
COMMENT ON COLUMN m_dechet.geo_dec_pav_verre.type_sign IS 'code du type de signalétique (liste de choix lt_pav_typesign)';
COMMENT ON COLUMN m_dechet.geo_dec_pav_verre.proprete IS 'code de l''état de la propreté (liste de choix lt_pav_proprete)';
COMMENT ON COLUMN m_dechet.geo_dec_pav_verre.prop_abor IS 'code de l''état de la propreté des abords (liste de choix lt_pav_propabor)';
COMMENT ON COLUMN m_dechet.geo_dec_pav_verre.def_struc IS 'défaut de structure visible';
COMMENT ON COLUMN m_dechet.geo_dec_pav_verre.hab_pav IS 'Tonnage par gisement d''habitants';
COMMENT ON COLUMN m_dechet.geo_dec_pav_verre.opt_pav IS 'nombre de PAV manquant ou excédents par rapport aux préconisation éco-emballages';
COMMENT ON COLUMN m_dechet.geo_dec_pav_verre.ame_acces IS 'accéssibilité à revoir';
COMMENT ON COLUMN m_dechet.geo_dec_pav_verre.nat_pb IS 'code de la nature du ou des problèmes (liste de choix lt_pav_natpb)';
COMMENT ON COLUMN m_dechet.geo_dec_pav_verre.nat_pb_99 IS 'précision sur la nature du problème';
COMMENT ON COLUMN m_dechet.geo_dec_pav_verre.geom IS 'champ contenant la géométrie de l''objet';
COMMENT ON COLUMN m_dechet.geo_dec_pav_verre.op_sai IS 'Opérateur de saisie de la donnée';
COMMENT ON COLUMN m_dechet.geo_dec_pav_verre.observ IS 'Observations diverses';
COMMENT ON COLUMN m_dechet.geo_dec_pav_verre.pavorient IS 'code des préconisations pour l''amélioration dee emplacements des PAV Verre (suite à l''état des lieux de l''été 2016';
COMMENT ON COLUMN m_dechet.geo_dec_pav_verre.id_parent IS 'identifiant du PAV Verre parent selon les préconisations';
COMMENT ON COLUMN m_dechet.geo_dec_pav_verre.statut IS 'code du statut du PAV (actif ou inactif)';
COMMENT ON COLUMN m_dechet.geo_dec_pav_verre.v_tampon IS 'Valeur du tampon correspondant à l''aire de captation du point de ramassage';
COMMENT ON COLUMN m_dechet.geo_dec_pav_verre.geom2 IS 'Champ contenant la géométrie du tampon d''emprise définit par v_tampon où modifier selon l''influence';
COMMENT ON COLUMN m_dechet.geo_dec_pav_verre.date_effet IS 'Date de prise en compte des données dans le plan interactif Grand Public';

-- Table: m_dechet.geo_dec_pav_tlc

-- DROP TABLE m_dechet.geo_dec_pav_tlc;

CREATE TABLE m_dechet.geo_dec_pav_tlc
(
  id_cont_tl integer NOT NULL DEFAULT nextval('m_dechet.geo_dec_pav_idconv_seq'::regclass), -- identifiant géographique unique
  commune character varying(50), -- libellé de la commune
  insee character(5), -- code insee de la commune
  quartier character varying(50), -- libellé du quartier
  adresse character varying(80), -- adresse
  x_l93 double precision, -- coordonnée x en lambert 93
  y_l93 double precision, -- coordonnée y en lambert 93
  cont_nbr integer, -- nombre de conteneurs
  cont_mat character varying(2) DEFAULT '10'::character varying, -- code du matériaux constituant le conteneur (liste de choix lt_pav_contmat)
  cont_pos character varying(2) DEFAULT '10'::character varying, -- code du type de position du conteneur (liste de choix lt_pav_contpos)
  date_sai timestamp without time zone, -- date de la saisie des informations
  date_pose timestamp without time zone, -- date de pose
  date_netoy timestamp without time zone, -- date de nettoyage
  date_maj timestamp without time zone, -- date de mise à jour des informations
  nom_entrep character varying(2), -- code de l'entreprise gestionnaire du pav (liste de choix lt_pav_gest)
  nom_entrep_99 character varying(30), -- autre gestionnaire si 99 saisie dans le champ nom_entrep
  photo character varying(254), -- libellé du fichier de la photo
  url_photo character varying(254), -- lien url de la photo
  src_geom character(2) DEFAULT '00'::bpchar, -- code du référentiel spatial de saisie utilisé (liste de choix r_objet.lt_scr_geom)
  env_type character varying(2) DEFAULT '00'::character varying, -- code du type d'espace géographique (liste de choix lt_pav_envtype)
  env_implan character varying(2) DEFAULT '00'::character varying, -- code du type d'espace urbain d'implantation (liste de choix lt_pav_envimplan)
  env_situ character varying(2) DEFAULT '00'::character varying, -- code de la situation domaniale (liste de choix lt_pav_envsitu)
  tags boolean DEFAULT false, -- présence de tags
  peinture character varying(2) DEFAULT '00'::character varying, -- code de l'état de la peinture (liste de choix lt_pav_peinture)
  prox_corb boolean DEFAULT false, -- présence d'une corbeille à proximité
  type_sol character varying(2) DEFAULT '00'::character varying, -- code du type de sol (liste de choix (lt_pav_typesol)
  type_sol_99 character varying(30), -- autre type de sol si 99 saisie dans le champ type_sol
  geom geometry(Point,2154), -- champ contenant la géométrie de l'objet
  op_sai character varying(80), -- Opérateur de saisie de la donnée
  observ character varying(500), -- Observations diverses
  v_tampon integer, -- Valeur du tampon d'emprise du PAV TLC
  geom2 geometry(Polygon,2154), -- Champ contenant la géométrie du tampon d'emprise définit par v_tampon où modifier selon l'influence
  date_effet timestamp without time zone DEFAULT now(), -- Date de prise en compte des données dans le plan interactif Grand Public
  CONSTRAINT geo_dec_pav_tlc_prkey PRIMARY KEY (id_cont_tl),
  CONSTRAINT geo_dec_pav_tlc_contmat_fkey FOREIGN KEY (cont_mat)
      REFERENCES m_dechet.lt_pav_contmat (cont_mat) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT geo_dec_pav_tlc_contpos_fkey FOREIGN KEY (cont_pos)
      REFERENCES m_dechet.lt_pav_contpos (cont_pos) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT geo_dec_pav_tlc_envimplan_fkey FOREIGN KEY (env_implan)
      REFERENCES m_dechet.lt_pav_envimplan (env_implan) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT geo_dec_pav_tlc_envsitu_fkey FOREIGN KEY (env_situ)
      REFERENCES m_dechet.lt_pav_envsitu (env_situ) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT geo_dec_pav_tlc_envtype_fkey FOREIGN KEY (env_type)
      REFERENCES m_dechet.lt_pav_envtype (env_type) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT geo_dec_pav_tlc_gest_fkey FOREIGN KEY (nom_entrep)
      REFERENCES m_dechet.lt_pav_gest (nom_entrep) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT geo_dec_pav_tlc_peinture_fkey FOREIGN KEY (peinture)
      REFERENCES m_dechet.lt_pav_peinture (peinture) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT geo_dec_pav_tlc_srcgeom_fkey FOREIGN KEY (src_geom)
      REFERENCES r_objet.lt_src_geom (code) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT geo_dec_pav_tlc_typesol_fkey FOREIGN KEY (type_sol)
      REFERENCES m_dechet.lt_pav_typesol (type_sol) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);

COMMENT ON TABLE m_dechet.geo_dec_pav_tlc
  IS 'Localisation des points d''apport volontaire textile - version 2 : nouveau modèle suite à la mise à jour de juillet 2016 - cette table remplacera la table "geo_dec_pav_tlc" à la fin de la mise à jour (modifier la structure de la table dans Geo et intégrer les listes de choix)';
COMMENT ON COLUMN m_dechet.geo_dec_pav_tlc.id_cont_tl IS 'identifiant géographique unique';
COMMENT ON COLUMN m_dechet.geo_dec_pav_tlc.commune IS 'libellé de la commune';
COMMENT ON COLUMN m_dechet.geo_dec_pav_tlc.insee IS 'code insee de la commune';
COMMENT ON COLUMN m_dechet.geo_dec_pav_tlc.quartier IS 'libellé du quartier';
COMMENT ON COLUMN m_dechet.geo_dec_pav_tlc.adresse IS 'adresse';
COMMENT ON COLUMN m_dechet.geo_dec_pav_tlc.x_l93 IS 'coordonnée x en lambert 93';
COMMENT ON COLUMN m_dechet.geo_dec_pav_tlc.y_l93 IS 'coordonnée y en lambert 93';
COMMENT ON COLUMN m_dechet.geo_dec_pav_tlc.cont_nbr IS 'nombre de conteneurs';
COMMENT ON COLUMN m_dechet.geo_dec_pav_tlc.cont_mat IS 'code du matériaux constituant le conteneur (liste de choix lt_pav_contmat)';
COMMENT ON COLUMN m_dechet.geo_dec_pav_tlc.cont_pos IS 'code du type de position du conteneur (liste de choix lt_pav_contpos)';
COMMENT ON COLUMN m_dechet.geo_dec_pav_tlc.date_sai IS 'date de la saisie des informations';
COMMENT ON COLUMN m_dechet.geo_dec_pav_tlc.date_pose IS 'date de pose';
COMMENT ON COLUMN m_dechet.geo_dec_pav_tlc.date_netoy IS 'date de nettoyage';
COMMENT ON COLUMN m_dechet.geo_dec_pav_tlc.date_maj IS 'date de mise à jour des informations';
COMMENT ON COLUMN m_dechet.geo_dec_pav_tlc.nom_entrep IS 'code de l''entreprise gestionnaire du pav (liste de choix lt_pav_gest)';
COMMENT ON COLUMN m_dechet.geo_dec_pav_tlc.nom_entrep_99 IS 'autre gestionnaire si 99 saisie dans le champ nom_entrep';
COMMENT ON COLUMN m_dechet.geo_dec_pav_tlc.photo IS 'libellé du fichier de la photo';
COMMENT ON COLUMN m_dechet.geo_dec_pav_tlc.url_photo IS 'lien url de la photo';
COMMENT ON COLUMN m_dechet.geo_dec_pav_tlc.src_geom IS 'code du référentiel spatial de saisie utilisé (liste de choix r_objet.lt_scr_geom)';
COMMENT ON COLUMN m_dechet.geo_dec_pav_tlc.env_type IS 'code du type d''espace géographique (liste de choix lt_pav_envtype)';
COMMENT ON COLUMN m_dechet.geo_dec_pav_tlc.env_implan IS 'code du type d''espace urbain d''implantation (liste de choix lt_pav_envimplan)';
COMMENT ON COLUMN m_dechet.geo_dec_pav_tlc.env_situ IS 'code de la situation domaniale (liste de choix lt_pav_envsitu)';
COMMENT ON COLUMN m_dechet.geo_dec_pav_tlc.tags IS 'présence de tags';
COMMENT ON COLUMN m_dechet.geo_dec_pav_tlc.peinture IS 'code de l''état de la peinture (liste de choix lt_pav_peinture)';
COMMENT ON COLUMN m_dechet.geo_dec_pav_tlc.prox_corb IS 'présence d''une corbeille à proximité';
COMMENT ON COLUMN m_dechet.geo_dec_pav_tlc.type_sol IS 'code du type de sol (liste de choix (lt_pav_typesol)';
COMMENT ON COLUMN m_dechet.geo_dec_pav_tlc.type_sol_99 IS 'autre type de sol si 99 saisie dans le champ type_sol';
COMMENT ON COLUMN m_dechet.geo_dec_pav_tlc.geom IS 'champ contenant la géométrie de l''objet';
COMMENT ON COLUMN m_dechet.geo_dec_pav_tlc.op_sai IS 'Opérateur de saisie de la donnée';
COMMENT ON COLUMN m_dechet.geo_dec_pav_tlc.observ IS 'Observations diverses';
COMMENT ON COLUMN m_dechet.geo_dec_pav_tlc.v_tampon IS 'Valeur du tampon d''emprise du PAV TLC';
COMMENT ON COLUMN m_dechet.geo_dec_pav_tlc.geom2 IS 'Champ contenant la géométrie du tampon d''emprise définit par v_tampon où modifier selon l''influence';
COMMENT ON COLUMN m_dechet.geo_dec_pav_tlc.date_effet IS 'Date de prise en compte des données dans le plan interactif Grand Public';


-- Table: m_dechet.an_dec_pav_doc_media

-- DROP TABLE m_dechet.an_dec_pav_doc_media;

CREATE TABLE m_dechet.an_dec_pav_doc_media
(
  gid serial NOT NULL,
  id integer, -- Identifiant du PAV
  media text, -- Champ Média de GEO
  miniature bytea, -- Champ miniature de GEO
  n_fichier text, -- Nom du fichier
  t_fichier text, -- Type de média dans GEO
  op_sai character varying(100), -- Libellé de l'opérateur ayant intégrer le document
  date_sai timestamp without time zone, -- Date d'intégration du document
  d_photo timestamp without time zone, -- Date de la prise de vue
  l_prec character varying(1000) -- Précision sur le document
)
WITH (
  OIDS=FALSE
);

COMMENT ON TABLE m_dechet.an_dec_pav_doc_media
  IS 'Table gérant la liste des photos des PAV (verre et tlc) avec le module média dans GEO (application Tri)';
COMMENT ON COLUMN m_dechet.an_dec_pav_doc_media.id IS 'Identifiant du PAV';
COMMENT ON COLUMN m_dechet.an_dec_pav_doc_media.media IS 'Champ Média de GEO';
COMMENT ON COLUMN m_dechet.an_dec_pav_doc_media.miniature IS 'Champ miniature de GEO';
COMMENT ON COLUMN m_dechet.an_dec_pav_doc_media.n_fichier IS 'Nom du fichier';
COMMENT ON COLUMN m_dechet.an_dec_pav_doc_media.t_fichier IS 'Type de média dans GEO';
COMMENT ON COLUMN m_dechet.an_dec_pav_doc_media.op_sai IS 'Libellé de l''opérateur ayant intégrer le document';
COMMENT ON COLUMN m_dechet.an_dec_pav_doc_media.date_sai IS 'Date d''intégration du document';
COMMENT ON COLUMN m_dechet.an_dec_pav_doc_media.d_photo IS 'Date de la prise de vue';
COMMENT ON COLUMN m_dechet.an_dec_pav_doc_media.l_prec IS 'Précision sur le document';

-- Table: m_dechet.geo_dec_dechetterie

-- DROP TABLE m_dechet.geo_dec_dechetterie;

CREATE TABLE m_dechet.geo_dec_dechetterie
(
  id character(10) NOT NULL,
  nomcom_min character varying(50),
  insee character(5),
  nomdechet character varying(50),
  x double precision,
  y double precision,
  adresse character varying(80),
  gestionnaire character varying(20),
  geom geometry(Point,2154),
  gid serial NOT NULL,
  CONSTRAINT geo_dec_dechetterie_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=TRUE
);

COMMENT ON TABLE m_dechet.geo_dec_dechetterie
  IS 'Localisation des déchetterie sur l''ARC';



-- Table: m_dechet.geo_dec_secteur_enc

-- DROP TABLE m_dechet.geo_dec_secteur_enc;

CREATE TABLE m_dechet.geo_dec_secteur_enc
(
  gid integer NOT NULL DEFAULT nextval('m_dechet.geo_dec_secteur_enc_seq'::regclass), -- Identifiant interne
  insee character varying(5), -- Code Insee de la commune
  commune character varying(150), -- Libellé de la commune
  op_sai character varying(80), -- Opérateur de saisie
  observ character varying(254), -- Observation(s)
  src_geom character varying(2), -- Référentiel de saisie
  date_sai timestamp without time zone, -- Date de saisie
  date_maj timestamp without time zone, -- Date de mise à jour
  adresse character varying(254), -- Adresse concernées par un ramassage des encombrants à jour fixe
  l_secteur character varying(25), -- Libellé du secteur par rapport au ramssage (fixe ou sur rendez-vous)
  l_message1 character varying(500), -- Message diffusé sur l'application Grand Public pour les encombrants à jour fixe
  l_message2 character varying(500), -- Message diffusé sur l'application Grand Public pour les encombrants sur rendez-vous
  geom geometry(MultiPoint,2154), -- Géométrie des points d'adresse à jour fixe
  geom1 geometry(Polygon,2154), -- Géométrie des zones issus des adresses et par défaut les autres (1 seul polygone) sur rendez-vous. Sert dans GEO appli Gd public pour la recherche par adresse
  CONSTRAINT geo_dec_secteur_enc_pkey1 PRIMARY KEY (gid)
)
WITH (
  OIDS=FALSE
);
COMMENT ON TABLE m_dechet.geo_dec_secteur_enc
  IS 'Table contenant les objets sectorisant le ramassage des encombrants';
ALTER TABLE m_dechet.geo_dec_secteur_enc
  OWNER TO sig_create;
GRANT ALL ON TABLE m_dechet.geo_dec_secteur_enc TO sig_create;
GRANT ALL ON TABLE m_dechet.geo_dec_secteur_enc TO create_sig;
GRANT SELECT ON TABLE m_dechet.geo_dec_secteur_enc TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_dechet.geo_dec_secteur_enc TO edit_sig;
COMMENT ON COLUMN m_dechet.geo_dec_secteur_enc.gid IS 'Identifiant interne';
COMMENT ON COLUMN m_dechet.geo_dec_secteur_enc.insee IS 'Code Insee de la commune';
COMMENT ON COLUMN m_dechet.geo_dec_secteur_enc.commune IS 'Libellé de la commune';
COMMENT ON COLUMN m_dechet.geo_dec_secteur_enc.op_sai IS 'Opérateur de saisie';
COMMENT ON COLUMN m_dechet.geo_dec_secteur_enc.observ IS 'Observation(s)';
COMMENT ON COLUMN m_dechet.geo_dec_secteur_enc.src_geom IS 'Référentiel de saisie';
COMMENT ON COLUMN m_dechet.geo_dec_secteur_enc.date_sai IS 'Date de saisie';
COMMENT ON COLUMN m_dechet.geo_dec_secteur_enc.date_maj IS 'Date de mise à jour';
COMMENT ON COLUMN m_dechet.geo_dec_secteur_enc.adresse IS 'Adresse concernées par un ramassage des encombrants à jour fixe';
COMMENT ON COLUMN m_dechet.geo_dec_secteur_enc.l_secteur IS 'Libellé du secteur par rapport au ramssage (fixe ou sur rendez-vous)';
COMMENT ON COLUMN m_dechet.geo_dec_secteur_enc.l_message1 IS 'Message diffusé sur l''application Grand Public pour les encombrants à jour fixe';
COMMENT ON COLUMN m_dechet.geo_dec_secteur_enc.l_message2 IS 'Message diffusé sur l''application Grand Public pour les encombrants sur rendez-vous';
COMMENT ON COLUMN m_dechet.geo_dec_secteur_enc.geom IS 'Géométrie des points d''adresse à jour fixe';
COMMENT ON COLUMN m_dechet.geo_dec_secteur_enc.geom1 IS 'Géométrie des zones issus des adresses et par défaut les autres (1 seul polygone) sur rendez-vous. Sert dans GEO appli Gd public pour la recherche par adresse';


-- Table: m_dechet.geo_dec_secteur_om

-- DROP TABLE m_dechet.geo_dec_secteur_om;

CREATE TABLE m_dechet.geo_dec_secteur_om
(
  gid integer NOT NULL DEFAULT nextval('m_dechet.geo_dec_secteur_om_seq'::regclass), -- Identifiant unique interne
  l_zone character varying(150), -- Nom du secteur de ramassage des ordures ménagères
  geom geometry(MultiPolygon,2154),
  insee character varying(25), -- Code insee de la Commune
  commune character varying(150), -- Libellé de la commune
  op_sai character varying(80), -- Opérateur de saisie
  observ character varying(254), -- Observations
  src_geom character varying(2) DEFAULT '00'::character varying, -- Code de la valeur du référentiel de saisie (lien vers la liste de valeur r_objet.lt_src_geom
  date_sai timestamp without time zone, -- Date de saisie des informations
  date_maj timestamp without time zone, -- Date de mise à jour des informations
  l_fichier character varying(100), -- Libellé du fichier avec son extension pour le document lié, ici le calendrier de collecte
  l_message1 character varying(255), -- Espace pour rédiger un message qui sera intégré dans l'application grand public (plusieurs lignes possibles dans les champs l_message n
  l_message2 character varying(255), -- 2ème ligne du message
  l_message3 character varying(255), -- 3ème ligne du message
  l_message4 character varying(255), -- 4ème ligne du message
  l_message5 character varying(255), -- 5ème ligne du message
  l_message6 character varying(255), -- 6ème ligne du message
  l_message7 character varying(255), -- 7ème ligne du message
  CONSTRAINT geo_dec_zonage_pkey PRIMARY KEY (gid)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE m_dechet.geo_dec_secteur_om
  OWNER TO sig_create;
GRANT ALL ON TABLE m_dechet.geo_dec_secteur_om TO sig_create;
GRANT ALL ON TABLE m_dechet.geo_dec_secteur_om TO create_sig;
GRANT SELECT ON TABLE m_dechet.geo_dec_secteur_om TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_dechet.geo_dec_secteur_om TO edit_sig;
COMMENT ON TABLE m_dechet.geo_dec_secteur_om
  IS 'Secteur de collecte des ordures ménagères.';
COMMENT ON COLUMN m_dechet.geo_dec_secteur_om.gid IS 'Identifiant unique interne';
COMMENT ON COLUMN m_dechet.geo_dec_secteur_om.l_zone IS 'Nom du secteur de ramassage des ordures ménagères';
COMMENT ON COLUMN m_dechet.geo_dec_secteur_om.insee IS 'Code insee de la Commune';
COMMENT ON COLUMN m_dechet.geo_dec_secteur_om.commune IS 'Libellé de la commune';
COMMENT ON COLUMN m_dechet.geo_dec_secteur_om.op_sai IS 'Opérateur de saisie';
COMMENT ON COLUMN m_dechet.geo_dec_secteur_om.observ IS 'Observations';
COMMENT ON COLUMN m_dechet.geo_dec_secteur_om.src_geom IS 'Code de la valeur du référentiel de saisie (lien vers la liste de valeur r_objet.lt_src_geom';
COMMENT ON COLUMN m_dechet.geo_dec_secteur_om.date_sai IS 'Date de saisie des informations';
COMMENT ON COLUMN m_dechet.geo_dec_secteur_om.date_maj IS 'Date de mise à jour des informations';
COMMENT ON COLUMN m_dechet.geo_dec_secteur_om.l_fichier IS 'Libellé du fichier avec son extension pour le document lié, ici le calendrier de collecte';
COMMENT ON COLUMN m_dechet.geo_dec_secteur_om.l_message1 IS 'Espace pour rédiger un message qui sera intégré dans l''application grand public (plusieurs lignes possibles dans les champs l_message n';
COMMENT ON COLUMN m_dechet.geo_dec_secteur_om.l_message2 IS '2ème ligne du message';
COMMENT ON COLUMN m_dechet.geo_dec_secteur_om.l_message3 IS '3ème ligne du message';
COMMENT ON COLUMN m_dechet.geo_dec_secteur_om.l_message4 IS '4ème ligne du message';
COMMENT ON COLUMN m_dechet.geo_dec_secteur_om.l_message5 IS '5ème ligne du message';
COMMENT ON COLUMN m_dechet.geo_dec_secteur_om.l_message6 IS '6ème ligne du message';
COMMENT ON COLUMN m_dechet.geo_dec_secteur_om.l_message7 IS '7ème ligne du message';

-- Table: m_dechet.log_dec_pav

-- DROP TABLE m_dechet.log_dec_pav;

CREATE TABLE m_dechet.log_dec_pav
(
  gid integer NOT NULL, -- identifiant unique
  objet character varying(10), -- Type de modification (update, delete, insert)
  d_maj timestamp without time zone, -- Date de l'exécution de la modification
  "user" character varying(50), -- Utilisateur ayant exécuté l'exécution
  relid character varying(255), -- ID d'objet de la table qui a causé le déclenchement.
  l_schema character varying(30), -- Libellé du schéma contenant la table ou la vue exécutée ou mlodifiée
  l_table character varying(30), -- Libellé de la table exécutée
  idgeo character varying(100), -- Identifiant unique de l'objet de la table correspondante
  modif character varying(10000),
  geom geometry(Point,2154), -- Champ contenant la géométrie des objets polygones modifiés ou supprimés
  CONSTRAINT log_dec_pav_pkey PRIMARY KEY (gid)
)
WITH (
  OIDS=FALSE
);

COMMENT ON TABLE m_dechet.log_dec_pav
  IS 'Table permettant de suivre les modifications intervenues sur les données des contrôles de conformité. Cette table est mise à jour via des triggers intégrés au niveau des vues de gestion.';
COMMENT ON COLUMN m_dechet.log_dec_pav.gid IS 'identifiant unique';
COMMENT ON COLUMN m_dechet.log_dec_pav.objet IS 'Type de modification (update, delete, insert)';
COMMENT ON COLUMN m_dechet.log_dec_pav.d_maj IS 'Date de l''exécution de la modification';
COMMENT ON COLUMN m_dechet.log_dec_pav."user" IS 'Utilisateur ayant exécuté l''exécution';
COMMENT ON COLUMN m_dechet.log_dec_pav.relid IS 'ID d''objet de la table qui a causé le déclenchement.';
COMMENT ON COLUMN m_dechet.log_dec_pav.l_schema IS 'Libellé du schéma contenant la table ou la vue exécutée ou mlodifiée';
COMMENT ON COLUMN m_dechet.log_dec_pav.l_table IS 'Libellé de la table exécutée';
COMMENT ON COLUMN m_dechet.log_dec_pav.idgeo IS 'Identifiant unique de l''objet de la table correspondante';
COMMENT ON COLUMN m_dechet.log_dec_pav.geom IS 'Champ contenant la géométrie des objets polygones modifiés ou supprimés';


  
-- ####################################################################################################################################################
-- ###                                                                                                                                              ###
-- ###                                                                INDEX                                                           ###
-- ###                                                                                                                                              ###
-- ####################################################################################################################################################

-- Index: m_dechet.geo_dec_pav_verre_etat_sign_idx

-- DROP INDEX m_dechet.geo_dec_pav_verre_etat_sign_idx;

CREATE INDEX geo_dec_pav_verre_etat_sign_idx
  ON m_dechet.geo_dec_pav_verre
  USING btree
  (etat_sign COLLATE pg_catalog."default");

-- Index: m_dechet.geo_dec_pav_verre_geom_idx

-- DROP INDEX m_dechet.geo_dec_pav_verre_geom_idx;

CREATE INDEX geo_dec_pav_verre_geom_idx
  ON m_dechet.geo_dec_pav_verre
  USING gist
  (geom);

-- Index: m_dechet.geo_dec_pav_verre_pavorient_idx

-- DROP INDEX m_dechet.geo_dec_pav_verre_pavorient_idx;

CREATE INDEX geo_dec_pav_verre_pavorient_idx
  ON m_dechet.geo_dec_pav_verre
  USING btree
  (pavorient COLLATE pg_catalog."default");

-- Index: m_dechet.geo_dec_pav_verre_statut_idx

-- DROP INDEX m_dechet.geo_dec_pav_verre_statut_idx;

CREATE INDEX geo_dec_pav_verre_statut_idx
  ON m_dechet.geo_dec_pav_verre
  USING btree
  (statut COLLATE pg_catalog."default");
  
  -- Index: m_dechet.geo_dec_pav_tlc_geom_idx

-- DROP INDEX m_dechet.geo_dec_pav_tlc_geom_idx;

CREATE INDEX geo_dec_pav_tlc_geom_idx
  ON m_dechet.geo_dec_pav_tlc
  USING gist
  (geom);
  
-- Index: m_dechet.an_dec_pav_doc_media_id_idx

-- DROP INDEX m_dechet.an_dec_pav_doc_media_id_idx;

CREATE INDEX an_dec_pav_doc_media_id_idx
  ON m_dechet.an_dec_pav_doc_media
  USING btree
  (id);
  
-- Index: m_dechet.geo_dec_dechetterie_geom_idx

-- DROP INDEX m_dechet.geo_dec_dechetterie_geom_idx;

CREATE INDEX geo_dec_dechetterie_geom_idx
  ON m_dechet.geo_dec_dechetterie
  USING gist
  (geom);
  
  -- Index: m_dechet.geo_dec_secteur_enc_geom_idx

-- DROP INDEX m_dechet.geo_dec_secteur_enc_geom_idx;

CREATE INDEX geo_dec_secteur_enc_geom_idx
  ON m_dechet.geo_dec_secteur_enc
  USING gist
  (geom);
  
 -- Index: m_dechet.geo_dec_zonage_geom_idx

-- DROP INDEX m_dechet.geo_dec_zonage_geom_idx;

CREATE INDEX geo_dec_zonage_geom_idx
  ON m_dechet.geo_dec_secteur_om
  USING gist
  (geom);
  
-- ####################################################################################################################################################
-- ###                                                                                                                                              ###
-- ###                                                                TRIGGERS                                                           ###
-- ###                                                                                                                                              ###
-- ####################################################################################################################################################

-- Trigger: t_t1_geo_dec_pav_verre_datemaj on m_dechet.geo_dec_pav_verre

-- DROP TRIGGER t_t1_geo_dec_pav_verre_datemaj ON m_dechet.geo_dec_pav_verre;

CREATE TRIGGER t_t1_geo_dec_pav_verre_datemaj
  BEFORE INSERT OR UPDATE
  ON m_dechet.geo_dec_pav_verre
  FOR EACH ROW
  EXECUTE PROCEDURE public.ft_r_timestamp_maj();

-- Trigger: t_t2_geo_dec_pav_verre_datesai on m_dechet.geo_dec_pav_verre

-- DROP TRIGGER t_t2_geo_dec_pav_verre_datesai ON m_dechet.geo_dec_pav_verre;

CREATE TRIGGER t_t2_geo_dec_pav_verre_datesai
  BEFORE INSERT
  ON m_dechet.geo_dec_pav_verre
  FOR EACH ROW
  EXECUTE PROCEDURE public.ft_r_timestamp_sai();

-- Trigger: t_t3_geo_dec_pav_verre_insee on m_dechet.geo_dec_pav_verre

-- DROP TRIGGER t_t3_geo_dec_pav_verre_insee ON m_dechet.geo_dec_pav_verre;

CREATE TRIGGER t_t3_geo_dec_pav_verre_insee
  BEFORE INSERT OR UPDATE OF geom
  ON m_dechet.geo_dec_pav_verre
  FOR EACH ROW
  EXECUTE PROCEDURE public.ft_r_commune_pl();

-- Trigger: t_t4_geo_dec_pav_verre_quartier on m_dechet.geo_dec_pav_verre

-- DROP TRIGGER t_t4_geo_dec_pav_verre_quartier ON m_dechet.geo_dec_pav_verre;

CREATE TRIGGER t_t4_geo_dec_pav_verre_quartier
  BEFORE INSERT OR UPDATE OF geom
  ON m_dechet.geo_dec_pav_verre
  FOR EACH ROW
  EXECUTE PROCEDURE public.ft_r_quartier();

-- Trigger: t_t5_geo_dec_pav_verre_xy on m_dechet.geo_dec_pav_verre

-- DROP TRIGGER t_t5_geo_dec_pav_verre_xy ON m_dechet.geo_dec_pav_verre;

CREATE TRIGGER t_t5_geo_dec_pav_verre_xy
  BEFORE INSERT OR UPDATE OF geom
  ON m_dechet.geo_dec_pav_verre
  FOR EACH ROW
  EXECUTE PROCEDURE public.ft_r_xy_l93();

-- Function: m_dechet.ft_m_tampon_nav()

-- DROP FUNCTION m_dechet.ft_m_tampon_nav();

CREATE OR REPLACE FUNCTION m_dechet.ft_m_tampon_nav()
  RETURNS trigger AS
$BODY$



BEGIN

update m_dechet.geo_dec_pav_verre set geom2 = st_buffer(geom,new.v_tampon) where id_contver=new.id_contver;

return new;

END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION m_dechet.ft_m_tampon_nav()
  OWNER TO sig_create;

COMMENT ON FUNCTION m_dechet.ft_m_tampon_nav() IS 'Fonction trigger pour mise à jour du tampon d''emprise du PAV VERRE si v_tampon est modifiée';

-- Trigger: t_t6_geo_dec_pav_verre_tampon on m_dechet.geo_dec_pav_verre

-- DROP TRIGGER t_t6_geo_dec_pav_verre_tampon ON m_dechet.geo_dec_pav_verre;

CREATE TRIGGER t_t6_geo_dec_pav_verre_tampon
  AFTER UPDATE OF geom, v_tampon
  ON m_dechet.geo_dec_pav_verre
  FOR EACH ROW
  EXECUTE PROCEDURE m_dechet.ft_m_tampon_nav();


-- Function: m_dechet.ft_m_log_dec_pav()

-- DROP FUNCTION m_dechet.ft_m_log_dec_pav();

CREATE OR REPLACE FUNCTION m_dechet.ft_m_log_dec_pav()
  RETURNS trigger AS
$BODY$
begin
		--ajoute une ligne dans la table suivi des modifications pour refléter l'operation réalisée sur les tables
		--utilise la variable spéciale TG_OP pour cette opération
		--
		      
		IF (TG_OP='INSERT') then			
			if (TG_TABLE_NAME='geo_dec_pav_verre') then
				insert into m_dechet.log_dec_pav select nextval('m_dechet.log_dec_pav_gid_seq'::regclass), 'INSERT',now(),user,TG_Relid,TG_TABLE_SCHEMA,TG_TABLE_NAME,new.id_contver;
			end if;

			if (TG_TABLE_NAME='geo_dec_pav_tlc') then
				insert into m_dechet.log_dec_pav select nextval('m_dechet.log_dec_pav_gid_seq'::regclass), 'INSERT',now(),user,TG_Relid,TG_TABLE_SCHEMA,TG_TABLE_NAME,new.id_cont_tl;
			end if;
                 elsif (TG_OP='UPDATE') then
			if (TG_TABLE_NAME='geo_dec_pav_verre') then
				insert into m_dechet.log_dec_pav select nextval('m_dechet.log_dec_pav_gid_seq'::regclass),'UPDATE',now(),user,TG_Relid,TG_TABLE_SCHEMA,TG_TABLE_NAME,old.id_contver;
 				
			END IF;
			if (TG_TABLE_NAME='geo_dec_pav_tlc') then
				insert into m_dechet.log_dec_pav select nextval('m_dechet.log_dec_pav_gid_seq'::regclass),'UPDATE',now(),user,TG_Relid,TG_TABLE_SCHEMA,TG_TABLE_NAME,old.id_cont_tl;
 				
			END IF;
			
                elsif (TG_OP='DELETE') then
	      
                        if (TG_TABLE_NAME='geo_dec_pav_verre') then
				insert into m_dechet.log_dec_pav select nextval('m_dechet.log_dec_pav_gid_seq'::regclass),'DELETE',now(),user,TG_Relid,TG_TABLE_SCHEMA,TG_TABLE_NAME,old.id_contver,
				CASE WHEN old.commune is null THEN '' ELSE 'commune:' || old.commune END || ';' || 
				CASE WHEN old.insee is null THEN '' ELSE 'insee:' || old.insee END || ';' || 
				CASE WHEN old.quartier is null THEN '' ELSE 'quartier:' || old.quartier END || ';' || 
				CASE WHEN old.adresse is null THEN '' ELSE 'adresse:' || old.adresse END || ';' || 
				CASE WHEN old.cont_nbr is null THEN '' ELSE 'cont_nbr:' || old.cont_nbr END || ';' ||
				CASE WHEN old.cont_mat is null THEN '' ELSE 'cont_mat:' || old.cont_mat END || ';' || 
				CASE WHEN old.cont_pos is null THEN '' ELSE 'cont_pos:' || old.cont_pos END || ';' || 
				CASE WHEN old.date_pos is null THEN '' ELSE 'date_pos:' || old.date_pos END || ';' || 
				CASE WHEN old.date_net is null THEN '' ELSE 'date_net:' || old.date_net END || ';' || 
				CASE WHEN old.photo is null THEN '' ELSE 'photo:' || old.photo END || ';' ||
				CASE WHEN old.url_photo is null THEN '' ELSE 'url_photo:' || old.url_photo END|| ';' || 
				CASE WHEN old.volume is null THEN '' ELSE 'volume:' || old.volume END || ';' || 
				CASE WHEN old.env_type is null THEN '' ELSE 'env_type:' || old.env_type END || ';' || 
				CASE WHEN old.env_implan is null THEN '' ELSE 'env_implan:' || old.env_implan END || ';' || 
				CASE WHEN old.env_situ is null THEN '' ELSE 'env_situ:' || old.env_situ END || ';' ||
				CASE WHEN old.mode_preh is null THEN '' ELSE 'mode_preh:' || old.mode_preh END || ';' || 
				CASE WHEN old.crochet is null THEN '' ELSE 'crochet:' || old.crochet END || ';' || 
				CASE WHEN old.opercules is null THEN '' ELSE 'opercules:' || old.opercules END || ';' || 
				CASE WHEN old.tags is null THEN '' ELSE 'tags:' || old.tags END || ';' || 
				CASE WHEN old.peinture is null THEN '' ELSE 'peinture:' || old.peinture END || ';' ||
				CASE WHEN old.prox_corb is null THEN '' ELSE 'prox_corb:' || old.prox_corb END || ';' || 
				CASE WHEN old.type_sol is null THEN '' ELSE 'type_sol:' || old.type_sol END || ';' || 
				CASE WHEN old.trp_rest is null THEN '' ELSE 'trp_rest:' || old.trp_rest END || ';' || 
				CASE WHEN old.etat_sign is null THEN '' ELSE 'etat_sign:' || old.etat_sign END || ';' || 
				CASE WHEN old.type_sign is null THEN '' ELSE 'type_sign:' || old.type_sign END || ';' ||
				CASE WHEN old.proprete is null THEN '' ELSE 'proprete:' || old.proprete END || ';' || 
				CASE WHEN old.prop_abor is null THEN '' ELSE 'prop_abor:' || old.prop_abor END || ';' || 
				CASE WHEN old.def_struc is null THEN '' ELSE 'def_struc:' || old.def_struc END || ';' || 
				CASE WHEN old.hab_pav is null THEN '' ELSE 'hab_pav:' || old.hab_pav END || ';' || 
				CASE WHEN old.opt_pav is null THEN '' ELSE 'opt_pav:' || old.opt_pav END || ';' ||
				CASE WHEN old.ame_acces is null THEN '' ELSE 'ame_acces:' || old.ame_acces END || ';' || 
				CASE WHEN old.nat_pb is null THEN '' ELSE 'nat_pb:' || old.nat_pb END || ';' || 
				CASE WHEN old.nat_pb_99 is null THEN '' ELSE 'nat_pb_99:' || old.nat_pb_99 END || ';' || 
				CASE WHEN old.op_sai is null THEN '' ELSE 'op_sai:' || old.op_sai END || ';' || 
				CASE WHEN old.observ is null THEN '' ELSE 'observ:' || old.observ END || ';' ||
				CASE WHEN old.pavorient is null THEN '' ELSE 'pavorient:' || old.pavorient END || ';' || 
				CASE WHEN old.id_parent is null THEN '' ELSE 'id_parent:' || old.id_parent END || ';' || 
				CASE WHEN old.statut is null THEN '' ELSE 'statut:' || old.statut END || ';' || 
				CASE WHEN old.date_effet is null THEN '' ELSE 'date_effet:' || old.date_effet END
				;
				return old;
			end if;

			 if (TG_TABLE_NAME='geo_dec_pav_tlc') then
				insert into m_dechet.log_dec_pav select nextval('m_dechet.log_dec_pav_gid_seq'::regclass),'DELETE',now(),user,TG_Relid,TG_TABLE_SCHEMA,TG_TABLE_NAME,old.id_cont_tl,
				CASE WHEN old.commune is null THEN '' ELSE 'commune:' || old.commune END || ';' || 
				CASE WHEN old.insee is null THEN '' ELSE 'insee:' || old.insee END || ';' || 
				CASE WHEN old.quartier is null THEN '' ELSE 'quartier:' || old.quartier END || ';' || 
				CASE WHEN old.adresse is null THEN '' ELSE 'adresse:' || old.adresse END || ';' || 
 				CASE WHEN old.cont_nbr is null THEN '' ELSE 'cont_nbr:' || old.cont_nbr END || ';' ||
 				CASE WHEN old.cont_mat is null THEN '' ELSE 'cont_mat:' || old.cont_mat END || ';' || 
				CASE WHEN old.cont_pos is null THEN '' ELSE 'cont_pos:' || old.cont_pos END || ';' || 
				CASE WHEN old.date_pose is null THEN '' ELSE 'date_pose:' || old.date_pose END || ';' || 
				CASE WHEN old.date_netoy is null THEN '' ELSE 'date_netoy:' || old.date_netoy END || ';' || 
				CASE WHEN old.photo is null THEN '' ELSE 'photo:' || old.photo END || ';' ||
				CASE WHEN old.url_photo is null THEN '' ELSE 'url_photo:' || old.url_photo END || ';' || 
				CASE WHEN old.nom_entrep is null THEN '' ELSE 'nom_entrep:' || old.nom_entrep END || ';' || 
				CASE WHEN old.env_type is null THEN '' ELSE 'env_type:' || old.env_type END || ';' || 
				CASE WHEN old.env_implan is null THEN '' ELSE 'env_implan:' || old.env_implan END || ';' || 
				CASE WHEN old.env_situ is null THEN '' ELSE 'env_situ:' || old.env_situ END || ';' ||
				CASE WHEN old.nom_entrep_99 is null THEN '' ELSE 'nom_entrep_99:' || old.nom_entrep_99 END || ';' || 
				CASE WHEN old.tags is null THEN '' ELSE 'tags:' || old.tags END || ';' || 
				CASE WHEN old.peinture is null THEN '' ELSE 'peinture:' || old.peinture END || ';' ||
				CASE WHEN old.prox_corb is null THEN '' ELSE 'prox_corb:' || old.prox_corb END || ';' || 
				CASE WHEN old.type_sol is null THEN '' ELSE 'type_sol:' || old.type_sol END || ';' || 
				CASE WHEN old.type_sol_99 is null THEN '' ELSE 'type_sol_99:' || old.type_sol_99 END || ';' || 
				CASE WHEN old.op_sai is null THEN '' ELSE 'op_sai:' || old.op_sai END || ';' || 
				CASE WHEN old.observ is null THEN '' ELSE 'observ:' || old.observ END || ';' ||
				CASE WHEN old.date_effet is null THEN '' ELSE 'date_effet:' || old.date_effet END
				;
				return old;
			end if;
		end if;

		return null; -- le résultat est ignoré car il s'agit d'un déclencheur AFTER
	end;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION m_dechet.ft_m_log_dec_pav()
  OWNER TO sig_create;



-- Trigger: t_t7_geo_dec_pav_verre_log on m_dechet.geo_dec_pav_verre

-- DROP TRIGGER t_t7_geo_dec_pav_verre_log ON m_dechet.geo_dec_pav_verre;

CREATE TRIGGER t_t7_geo_dec_pav_verre_log
  AFTER INSERT OR UPDATE OR DELETE
  ON m_dechet.geo_dec_pav_verre
  FOR EACH ROW
  EXECUTE PROCEDURE m_dechet.ft_m_log_dec_pav();
  


-- Trigger: t_t1_geo_dec_pav_tlc_datemaj on m_dechet.geo_dec_pav_tlc

-- DROP TRIGGER t_t1_geo_dec_pav_tlc_datemaj ON m_dechet.geo_dec_pav_tlc;

CREATE TRIGGER t_t1_geo_dec_pav_tlc_datemaj
  BEFORE INSERT
  ON m_dechet.geo_dec_pav_tlc
  FOR EACH ROW
  EXECUTE PROCEDURE public.ft_r_timestamp_maj();

-- Trigger: t_t2_geo_dec_pav_tlc_datesai on m_dechet.geo_dec_pav_tlc

-- DROP TRIGGER t_t2_geo_dec_pav_tlc_datesai ON m_dechet.geo_dec_pav_tlc;

CREATE TRIGGER t_t2_geo_dec_pav_tlc_datesai
  BEFORE INSERT
  ON m_dechet.geo_dec_pav_tlc
  FOR EACH ROW
  EXECUTE PROCEDURE public.ft_r_timestamp_sai();

-- Trigger: t_t3_geo_dec_pav_tlc_insee on m_dechet.geo_dec_pav_tlc

-- DROP TRIGGER t_t3_geo_dec_pav_tlc_insee ON m_dechet.geo_dec_pav_tlc;

CREATE TRIGGER t_t3_geo_dec_pav_tlc_insee
  BEFORE INSERT OR UPDATE OF geom
  ON m_dechet.geo_dec_pav_tlc
  FOR EACH ROW
  EXECUTE PROCEDURE public.ft_r_commune_pl();

-- Trigger: t_t4_geo_dec_pav_tlc_quartier on m_dechet.geo_dec_pav_tlc

-- DROP TRIGGER t_t4_geo_dec_pav_tlc_quartier ON m_dechet.geo_dec_pav_tlc;

CREATE TRIGGER t_t4_geo_dec_pav_tlc_quartier
  BEFORE INSERT OR UPDATE OF geom
  ON m_dechet.geo_dec_pav_tlc
  FOR EACH ROW
  EXECUTE PROCEDURE public.ft_r_quartier();

-- Trigger: t_t5_geo_dec_pav_tlc_xy on m_dechet.geo_dec_pav_tlc

-- DROP TRIGGER t_t5_geo_dec_pav_tlc_xy ON m_dechet.geo_dec_pav_tlc;

CREATE TRIGGER t_t5_geo_dec_pav_tlc_xy
  BEFORE INSERT OR UPDATE OF geom
  ON m_dechet.geo_dec_pav_tlc
  FOR EACH ROW
  EXECUTE PROCEDURE public.ft_r_xy_l93();


-- Trigger: t_t6_geo_dec_pav_tlc_log on m_dechet.geo_dec_pav_tlc

-- DROP TRIGGER t_t6_geo_dec_pav_tlc_log ON m_dechet.geo_dec_pav_tlc;

CREATE TRIGGER t_t6_geo_dec_pav_tlc_log
  AFTER INSERT OR UPDATE OR DELETE
  ON m_dechet.geo_dec_pav_tlc
  FOR EACH ROW
  EXECUTE PROCEDURE m_dechet.ft_m_log_dec_pav();
  

-- Function: m_dechet.ft_m_tampon_tlc_nav()

-- DROP FUNCTION m_dechet.ft_m_tampon_tlc_nav();

CREATE OR REPLACE FUNCTION m_dechet.ft_m_tampon_tlc_nav()
  RETURNS trigger AS
$BODY$



BEGIN

update m_dechet.geo_dec_pav_tlc set geom2 = st_buffer(geom,500) where id_cont_tl=new.id_cont_tl;

return new;

END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION m_dechet.ft_m_tampon_tlc_nav()
  OWNER TO sig_create;

COMMENT ON FUNCTION m_dechet.ft_m_tampon_tlc_nav() IS 'Fonction trigger pour mise à jour du tampon d''emprise du PAV TLC à 500m';


-- Trigger: t_t7_geo_dec_pav_tlc_tampon on m_dechet.geo_dec_pav_tlc

-- DROP TRIGGER t_t7_geo_dec_pav_tlc_tampon ON m_dechet.geo_dec_pav_tlc;

CREATE TRIGGER t_t7_geo_dec_pav_tlc_tampon
  AFTER UPDATE OF geom
  ON m_dechet.geo_dec_pav_tlc
  FOR EACH ROW
  EXECUTE PROCEDURE m_dechet.ft_m_tampon_tlc_nav();
  
-- Trigger: t_t1_an_dec_pav_doc_media_date_sai on m_dechet.an_dec_pav_doc_media

-- DROP TRIGGER t_t1_an_dec_pav_doc_media_date_sai ON m_dechet.an_dec_pav_doc_media;

CREATE TRIGGER t_t1_an_dec_pav_doc_media_date_sai
  BEFORE INSERT
  ON m_dechet.an_dec_pav_doc_media
  FOR EACH ROW
  EXECUTE PROCEDURE public.ft_r_timestamp_sai();
  
  
  -- Trigger: t_t1_geo_dec_secteur_enc_datemaj on m_dechet.geo_dec_secteur_enc

-- DROP TRIGGER t_t1_geo_dec_secteur_enc_datemaj ON m_dechet.geo_dec_secteur_enc;

CREATE TRIGGER t_t1_geo_dec_secteur_enc_datemaj
  BEFORE INSERT OR UPDATE
  ON m_dechet.geo_dec_secteur_enc
  FOR EACH ROW
  EXECUTE PROCEDURE public.ft_r_timestamp_maj();

-- Trigger: t_t2_geo_dec_secteur_enc_datesai on m_dechet.geo_dec_secteur_enc

-- DROP TRIGGER t_t2_geo_dec_secteur_enc_datesai ON m_dechet.geo_dec_secteur_enc;

CREATE TRIGGER t_t2_geo_dec_secteur_enc_datesai
  BEFORE INSERT
  ON m_dechet.geo_dec_secteur_enc
  FOR EACH ROW
  EXECUTE PROCEDURE public.ft_r_timestamp_sai();

-- Trigger: t_t3_geo_dec_secteur_om_datemaj on m_dechet.geo_dec_secteur_enc

-- DROP TRIGGER t_t3_geo_dec_secteur_om_datemaj ON m_dechet.geo_dec_secteur_enc;

CREATE TRIGGER t_t3_geo_dec_secteur_om_datemaj
  BEFORE INSERT OR UPDATE
  ON m_dechet.geo_dec_secteur_enc
  FOR EACH ROW
  EXECUTE PROCEDURE public.ft_r_timestamp_maj();

-- Trigger: t_t4_geo_dec_secteur_om_datesai on m_dechet.geo_dec_secteur_enc

-- DROP TRIGGER t_t4_geo_dec_secteur_om_datesai ON m_dechet.geo_dec_secteur_enc;

CREATE TRIGGER t_t4_geo_dec_secteur_om_datesai
  BEFORE INSERT
  ON m_dechet.geo_dec_secteur_enc
  FOR EACH ROW
  EXECUTE PROCEDURE public.ft_r_timestamp_sai();

-- Trigger: t_t1_geo_dec_secteur_om_datemaj on m_dechet.geo_dec_secteur_om

-- DROP TRIGGER t_t1_geo_dec_secteur_om_datemaj ON m_dechet.geo_dec_secteur_om;

CREATE TRIGGER t_t1_geo_dec_secteur_om_datemaj
  BEFORE INSERT OR UPDATE
  ON m_dechet.geo_dec_secteur_om
  FOR EACH ROW
  EXECUTE PROCEDURE public.ft_r_timestamp_maj();

-- Trigger: t_t2_geo_dec_secteur_om_datesai on m_dechet.geo_dec_secteur_om

-- DROP TRIGGER t_t2_geo_dec_secteur_om_datesai ON m_dechet.geo_dec_secteur_om;

CREATE TRIGGER t_t2_geo_dec_secteur_om_datesai
  BEFORE INSERT
  ON m_dechet.geo_dec_secteur_om
  FOR EACH ROW
  EXECUTE PROCEDURE public.ft_r_timestamp_sai();
