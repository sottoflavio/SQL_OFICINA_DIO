SELECT TOP 10 * FROM veículo WHERE fabricante = "Ford";

SELECT * FROM veículo JOIN cliente ON veículo.ClienteidCliente = cliente.idCliente;

SELECT DISTINCT modelo FROM veículos WHERE fabricante = "FIAT";

SELECT clienteidcliente COUNT (*).AVG (valor) FROM 'ordem de serviço' GROUP BY clienteidcliente WHERE 'ordem de serviço'.clienteidcliente = cliente.idCliente;

SELECT descrição COUNT (*) FROM produto  GROUP BY modelo HAVING  estoque (*) > 5 ORDER BY products.descricao;