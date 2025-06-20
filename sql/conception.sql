CREATE DATABASE ressource_min;

\c ressource_min;

CREATE EXTENSION IF NOT EXISTS postgis;

-- Table des types de ressources
CREATE TABLE resource_type (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    category VARCHAR(50) CHECK (category IN ('pierre_précieuse', 'pierre_construction', 'métal', 'terre'))
);

-- Table des régions/administrations
CREATE TABLE administrative_region (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    code VARCHAR(20),
    geometry GEOMETRY(POLYGON, 4326)
);

-- Table des sites d'exploitation
CREATE TABLE mining_site (
    id SERIAL PRIMARY KEY,
    name VARCHAR(200) NOT NULL,
    resource_type_id INTEGER REFERENCES resource_type(id),
    region_id INTEGER REFERENCES administrative_region(id),
    location GEOMETRY(POINT, 4326),
    area GEOMETRY(POLYGON, 4326),
    status VARCHAR(50),
    discovery_date DATE,
    estimated_reserves TEXT,
    description TEXT,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

-- Table des entreprises minières
CREATE TABLE mining_company (
    id SERIAL PRIMARY KEY,
    name VARCHAR(200) NOT NULL,
    country_origin VARCHAR(100),
    company_type VARCHAR(100),
    website VARCHAR(255),
    description TEXT
);

-- Table de liaison entre sites et entreprises
CREATE TABLE site_company (
    site_id INTEGER REFERENCES mining_site(id),
    company_id INTEGER REFERENCES mining_company(id),
    relationship_type VARCHAR(100),
    start_date DATE,
    end_date DATE,
    PRIMARY KEY (site_id, company_id)
);

-- Table des caractéristiques spécifiques aux terres
CREATE TABLE soil_characteristics (
    id SERIAL PRIMARY KEY,
    site_id INTEGER REFERENCES mining_site(id),
    soil_type VARCHAR(100),
    ph_level NUMERIC(3,1),
    iron_content NUMERIC(5,2),
    aluminum_content NUMERIC(5,2),
    organic_matter NUMERIC(5,2),
    texture VARCHAR(50),
    color VARCHAR(50),
    depth_cm INTEGER
);

-- Table des caractéristiques des pierres précieuses
CREATE TABLE gemstone_characteristics (
    id SERIAL PRIMARY KEY,
    site_id INTEGER REFERENCES mining_site(id),
    gem_type VARCHAR(100),
    clarity VARCHAR(50),
    color VARCHAR(50),
    hardness_mohs NUMERIC(3,1),
    average_size_mm NUMERIC(6,2),
    rarity VARCHAR(50),
    quality_grade VARCHAR(50)
);

-- Table des caractéristiques des pierres de construction
CREATE TABLE construction_stone_characteristics (
    id SERIAL PRIMARY KEY,
    site_id INTEGER REFERENCES mining_site(id),
    stone_type VARCHAR(100),
    density_kg_m3 NUMERIC(6,2),
    compressive_strength_mpa NUMERIC(6,2),
    water_absorption NUMERIC(5,2),
    color VARCHAR(50),
    common_uses TEXT
);

-- Table des caractéristiques des métaux
CREATE TABLE metal_characteristics (
    id SERIAL PRIMARY KEY,
    site_id INTEGER REFERENCES mining_site(id),
    metal_type VARCHAR(100),
    purity NUMERIC(5,2),
    ore_type VARCHAR(100),
    concentration NUMERIC(6,2),
    associated_minerals TEXT,
    extraction_method VARCHAR(100)
);

-- Table des productions annuelles
CREATE TABLE annual_production (
    id SERIAL PRIMARY KEY,
    site_id INTEGER REFERENCES mining_site(id),
    year INTEGER NOT NULL,
    production_quantity NUMERIC(12,2),
    production_unit VARCHAR(20),
    estimated_value NUMERIC(15,2),
    currency VARCHAR(3),
    notes TEXT
);

-- Table des impacts environnementaux
CREATE TABLE environmental_impact (
    id SERIAL PRIMARY KEY,
    site_id INTEGER REFERENCES mining_site(id),
    impact_type VARCHAR(100),
    severity VARCHAR(50),
    affected_area GEOMETRY(POLYGON, 4326),
    description TEXT,
    mitigation_measures TEXT,
    assessment_date DATE
);