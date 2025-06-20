-- Type de ressource
INSERT INTO resource_type (name, description, category) VALUES 
('Saphir', 'Pierre précieuse bleue, variété de corindon', 'pierre_précieuse'),
('Rubis', 'Pierre précieuse rouge, variété de corindon', 'pierre_précieuse');

-- Région
INSERT INTO administrative_region (name, code) VALUES 
('Anosy', 'MG-AN'), 
('Alaotra-Mangoro', 'MG-AL');

-- Sites d'exploitation
INSERT INTO mining_site (name, resource_type_id, region_id, location, description) VALUES
('Ilakaka', 1, 1, ST_SetSRID(ST_MakePoint(46.65, -22.68), 'L''un des plus grands gisements de saphir au monde'),
('Didy', 2, 2, ST_SetSRID(ST_MakePoint(48.38, -17.90), 'Important gisement de rubis');

-- Entreprises
INSERT INTO mining_company (name, country_origin) VALUES 
('Gemfields', 'Royaume-Uni'),
('Madagascar Gemstones', 'Madagascar');

-- Liaisons
INSERT INTO site_company VALUES 
(1, 1, 'exploitation', '2010-01-01', NULL),
(2, 2, 'exploitation', '2005-01-01', NULL);

-- Caractéristiques
INSERT INTO gemstone_characteristics (site_id, gem_type, clarity, color, hardness_mohs) VALUES
(1, 'Saphir bleu', 'VS', 'Bleu moyen', 9.0),
(2, 'Rubis', 'VVS', 'Rouge sang de pigeon', 9.0);

-- Type de ressource
INSERT INTO resource_type (name, description, category) VALUES 
('Granit', 'Roche plutonique à structure grenue', 'pierre_construction'),
('Marbre', 'Roche métamorphique dérivant du calcaire', 'pierre_construction');

-- Sites
INSERT INTO mining_site (name, resource_type_id, region_id, location, description) VALUES
('Ambatolampy', 3, 2, ST_SetSRID(ST_MakePoint(47.43, -19.38), 'Gisement de granit'),
('Antsirabe', 4, 2, ST_SetSRID(ST_MakePoint(47.03, -19.87), 'Gisement de marbre');

-- Entreprises
INSERT INTO mining_company (name, country_origin) VALUES 
('Madagascar Granit', 'Madagascar'),
('Stone Madagascar', 'France');

-- Liaisons
INSERT INTO site_company VALUES 
(3, 3, 'exploitation', '2000-01-01', NULL),
(4, 4, 'exploitation', '1998-01-01', NULL);

-- Caractéristiques
INSERT INTO construction_stone_characteristics (site_id, stone_type, density_kg_m3, compressive_strength_mpa) VALUES
(3, 'Granit rose', 2650, 200),
(4, 'Marbre blanc', 2700, 120);

-- Type de ressource
INSERT INTO resource_type (name, description, category) VALUES 
('Nickel', 'Métal de transition ductile et résistant', 'métal'),
('Cobalt', 'Métal de transition utilisé dans les batteries', 'métal');

-- Sites
INSERT INTO mining_site (name, resource_type_id, region_id, location, description) VALUES
('Ambatovy', 5, 2, ST_SetSRID(ST_MakePoint(48.42, -18.85), 'Mine de nickel et cobalt'),
('Taolagnaro', 6, 1, ST_SetSRID(ST_MakePoint(46.99, -25.03), 'Projet QMM Rio Tinto');

-- Entreprises
INSERT INTO mining_company (name, country_origin) VALUES 
('Ambatovy Joint Venture', 'Canada/Japon/Corée'),
('Rio Tinto QMM', 'Royaume-Uni/Australie');

-- Liaisons
INSERT INTO site_company VALUES 
(5, 5, 'exploitation', '2012-01-01', NULL),
(6, 6, 'exploitation', '2009-01-01', NULL);

-- Caractéristiques
INSERT INTO metal_characteristics (site_id, metal_type, ore_type, concentration) VALUES
(5, 'Nickel', 'Latérite', 1.2),
(5, 'Cobalt', 'Latérite', 0.1),
(6, 'Ilménite', 'Sables minéralisés', 5.0);

-- Type de ressource
INSERT INTO resource_type (name, description, category) VALUES 
('Latérite', 'Sols riches en fer et aluminium', 'terre'),
('Sols ferralitiques', 'Sols rouges des hautes terres', 'terre');

-- Sites
INSERT INTO mining_site (name, resource_type_id, region_id, location, description) VALUES
('Moramanga', 7, 2, ST_SetSRID(ST_MakePoint(48.20, -18.95), 'Zone de latérite nickelifère'),
('Antsirabe', 8, 2, ST_SetSRID(ST_MakePoint(47.03, -19.87), 'Sols ferralitiques des hautes terres');

-- Caractéristiques
INSERT INTO soil_characteristics (site_id, soil_type, ph_level, iron_content, aluminum_content) VALUES
(7, 'Latérite', 5.5, 45.2, 25.8),
(8, 'Ferralitique', 4.8, 32.1, 18.5);


