INSERT INTO empregado 
VALUES 
	(1000000, 'Antonio Lima', 'RJ', 'Av. Rio Branco'),
	(1000001, 'Paulo Enrique', 'RJ', 'Rua Presidente Vargas'),
	(1000002, 'Manuela Diaz', 'SP', 'Av. Paulista'),
	(1000003, 'Roberto Rodrigues', 'RJ', 'Av. Brasil'),
	(1000004, 'Fernanda Ramos', 'RJ', 'Av. Atlantica');
	
SELECT * FROM empregado;
	
INSERT INTO empresa
VALUES
    ('FGV', 'RJ'),
    ('UFRJ', 'RJ'),
    ('USP', 'SP');
	
SELECT * FROM empresa;

INSERT INTO trabalha
VALUES
	(1000000, 'FGV', 4000),
    (1000001, 'FGV', 3000),
    (1000002, 'FGV', 3000),
    (1000003, 'FGV', 3000),
    (1000004, 'FGV', 3000);
	
INSERT INTO gerencia
VALUES
    (1000001, 1000000),
    (1000002, 1000000),
    (1000004, 1000003);
	
SELECT * FROM gerencia;

SELECT 
	e.id_empregado
FROM empregado as e
LEFT JOIN gerencia as g
ON e.id_empregado = g.id
WHERE g.id IS NULL;

SELECT *
FROM empregado as e
WHERE id_empregado NOT IN (
	SELECT id
	FROM gerencia as g
);

