/*TRI SELECTIF V1.0*/
/*Insertion des valeurs dans les listes*/
/* tri_31_insert.sql */
/*PostGIS*/

/* Propriétaire : GeoCompiegnois - http://geo.compiegnois.fr/ */
/* Auteur : Grégory Bodet */

-- ####################################################################################################################################################
-- ###                                                                                                                                              ###
-- ###                                                                DOMAINES DE VALEURS                                                           ###
-- ###                                                                                                                                              ###
-- ####################################################################################################################################################


-- ################################################################# Domaine valeur - lt_pav_contmat  ###############################################


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


INSERT INTO m_dechet.lt_pav_contpos(
            cont_pos, cont_pos_lib)
    VALUES
    ('00','Non renseigné'),
    ('10','Aérien'),
    ('20','Enterré'),
    ('30','Semi-enterré'); 
    
-- ################################################################# Domaine valeur - lt_pav_crochet  ###############################################


INSERT INTO m_dechet.lt_pav_crochet(
            crochet, crochet_lib)
    VALUES
    ('00','Non renseigné'),
    ('10','RAS'),
    ('20','Tordu');
    
-- ################################################################# Domaine valeur - lt_pav_envimplan  ###############################################


INSERT INTO m_dechet.lt_pav_envimplan(
            env_implan, env_implan_lib)
    VALUES
    ('00','Non renseigné'),
    ('10','Pavillonnaire'),
    ('20','Collectif'),
    ('30','Mixte (y compris ZI)'),
    ('40','Professionnel');

-- ################################################################# Domaine valeur - lt_pav_envsitu  ###############################################


INSERT INTO m_dechet.lt_pav_envsitu(
            env_situ, env_situ_lib)
    VALUES
    ('00','Non renseigné'),
    ('10','Terrain privé'),
    ('20','Terrain public');
    
-- ################################################################# Domaine valeur - lt_pav_envtype  ###############################################


INSERT INTO m_dechet.lt_pav_envtype(
            env_type, env_type_lib)
    VALUES
    ('00','Non renseigné'),
    ('10','Urbain'),
    ('20','Rural'); 


-- ################################################################# Domaine valeur - lt_pav_etatsign  ###############################################


INSERT INTO m_dechet.lt_pav_etatsign(
            etat_sign, etat_sign_lib)
    VALUES
    ('00','Non renseigné'),
    ('10','Correct'),
    ('20','Moyen'), 
    ('30','Mauvais'),
    ('40','Incomplet'); 
    
    
-- ################################################################# Domaine valeur - lt_pav_gest  ###############################################


INSERT INTO m_dechet.lt_pav_gest(
            nom_entrep, nom_entrep_lib)
    VALUES
    ('00','Non renseigné'),
    ('10','Le Relais'),
    ('20','Eco Textile'), 
    ('99','Autre'); 
    
-- ################################################################# Domaine valeur - lt_pav_modepreh  ###############################################


INSERT INTO m_dechet.lt_pav_modepreh(
            mode_preh, mode_preh_lib)
    VALUES
    ('00','Non renseigné'),
    ('10','Crochet'),
    ('20','Kinshofer');
    
        
-- ################################################################# Domaine valeur - lt_pav_natpb  ###############################################


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
