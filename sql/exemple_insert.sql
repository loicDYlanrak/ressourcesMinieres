-- Données enrichies pour la base "ressource_min"

-- Types de ressources
INSERT INTO resource_type (name, description, category) VALUES 
('Graphite', 'Minéral de carbone, conducteur, utilisé dans les batteries', 'métal'),
('Ilménite', 'Oxyde de titane et fer, source de dioxyde de titane', 'métal'),
('Zircon', 'Silicate de zirconium, utilisé pour les céramiques', 'métal'),
('Rutile', 'Forme de dioxyde de titane, pigment blanc', 'métal'),
('Terres rares', 'Groupe de 17 éléments critiques pour la tech', 'métal'),
('Uranium', 'Métal radioactif utilisé pour le nucléaire', 'métal'),
('Charbon', 'Roche combustible fossile', 'terre'),
('Pétrole', 'Hydrocarbure liquide fossile', 'terre'),
('Tourmaline', 'Pierre semi-précieuse multicolore', 'pierre_précieuse'),
('Grenat', 'Silicate de magnésium, fer ou aluminium', 'pierre_précieuse'),
('Quartz', 'Cristal de silice très répandu', 'pierre_précieuse'),
('Topaze', 'Pierre précieuse transparente ou colorée', 'pierre_précieuse');

-- Régions administratives
INSERT INTO administrative_region (name, code) VALUES 
('Diana', 'MG-D'),
('Ihorombe', 'MG-IH'),
('Atsimo-Andrefana', 'MG-AA'),
('Vatovavy', 'MG-VV'),
('Atsinanana', 'MG-AT'),
('Fort-Dauphin', 'MG-TL');

-- Sites d'exploitation
INSERT INTO mining_site (name, resource_type_id, region_id, location, description) VALUES
('Zazafotsy', 1, 2, ST_SetSRID(ST_MakePoint(46.95, -23.10), 4326), 'Gisement de saphir corindon à Ihorombe'),
('Ikalamavony', 9, 2, ST_SetSRID(ST_MakePoint(46.70, -22.55), 4326), 'Tourmaline, grenat dans pegmatite artisanale'),
('Sakaraha', 1, 3, ST_SetSRID(ST_MakePoint(44.53, -22.90), 4326), 'Extraction de saphirs et ressources hydrocarbures'),
('Irondro', 1, 4, ST_SetSRID(ST_MakePoint(48.08, -21.88), 4326), 'Exploitation artisanale d''émeraude'),
('Andranondambo', 1, 6, ST_SetSRID(ST_MakePoint(46.85, -25.02), 4326), 'Réserve majeure de saphirs découverte en 1995'),
('Molo', 1, 3, ST_SetSRID(ST_MakePoint(45.00, -23.13), 4326), 'Projet NextSource de graphite de batterie'),
('QMM', 2, 6, ST_SetSRID(ST_MakePoint(47.00, -25.03), 4326), 'Extraction industrielle d''ilménite, zircon et rutile'),
('Tranomaro', 6, 6, ST_SetSRID(ST_MakePoint(46.87, -25.05), 4326), 'Ancien site d''uranium et thorium'),
('Tsimiroro', 8, 3, ST_SetSRID(ST_MakePoint(45.86, -20.38), 4326), 'Gisement de pétrole lourd exploitable'),
('Sakoa', 7, 3, ST_SetSRID(ST_MakePoint(45.23, -22.37), 4326), 'Gisement de charbon à ciel ouvert');

-- Entreprises minières
INSERT INTO mining_company (name, country_origin, company_type, website, description) VALUES 
('NextSource Materials', 'Canada', 'Privée', NULL, 'Société minière spécialisée dans le graphite'),
('Rio Tinto QMM', 'Royaume-Uni/Australie', 'Multinationale', NULL, 'Filiale de Rio Tinto opérant à Fort-Dauphin'),
('Kraoma', 'Madagascar', 'Publique', NULL, 'Entreprise d''état opérant sur le chrome'),
('PetroMada', 'Madagascar', 'Privée', NULL, 'Société malgache de pétrole'),
('Lemur Resources', 'Australie', 'Exploration', NULL, 'Projet charbonnier Sakoa'),
('Artisans locaux Ikalamavony', 'Madagascar', 'Artisanale', NULL, 'Petits exploitants de pierres semi-précieuses');

-- Liaison site-entreprise
INSERT INTO site_company (site_id, company_id, relationship_type, start_date, end_date) VALUES
(6, 1, 'exploitation', '2023-01-01', NULL),
(7, 2, 'exploitation', '2009-01-01', NULL),
(9, 4, 'exploration', '2010-01-01', NULL),
(10, 5, 'prospection', '2008-01-01', NULL),
(2, 6, 'artisanat', '2000-01-01', NULL);

-- Caractéristiques des pierres précieuses
INSERT INTO gemstone_characteristics (site_id, gem_type, clarity, color, hardness_mohs) VALUES
(1, 'Saphir', 'VS', 'Bleu intense', 9.0),
(2, 'Tourmaline fluoro-liddicoatite', 'VVS', 'Multicolore', 7.0),
(4, 'Émeraude', 'SI', 'Vert profond', 7.5),
(5, 'Saphir', 'VS', 'Bleu royal', 9.0);

-- Caractéristiques des métaux
INSERT INTO metal_characteristics (site_id, metal_type, ore_type, concentration) VALUES
(6, 'Graphite', 'Cristallin', 12.0),
(7, 'Ilménite', 'Sables côtiers', 60.0),
(7, 'Zircon', 'Sables côtiers', 5.0),
(7, 'Rutile', 'Sables côtiers', 4.5),
(9, 'Pétrole', 'Bitumineux lourd', 6.5),
(10, 'Charbon', 'Houille', 8.0),
(8, 'Uranium', 'Minerai uranifère', 0.12);
