-- Trouver tous les sites d'une région spécifique:

SELECT s.name, r.name as resource, c.name as company
FROM mining_site s
JOIN resource_type r ON s.resource_type_id = r.id
JOIN administrative_region ar ON s.region_id = ar.id
LEFT JOIN site_company sc ON s.id = sc.site_id
LEFT JOIN mining_company c ON sc.company_id = c.id
WHERE ar.name = 'Anosy';

-- Visualiser l'emplacement des sites sur une carte:

SELECT name, ST_AsText(location) as coordinates 
FROM mining_site;


-- Trouver les caractéristiques des sols pour les sites miniers:

SELECT s.name as site, sc.soil_type, sc.ph_level, sc.iron_content
FROM mining_site s
JOIN soil_characteristics sc ON s.id = sc.site_id;