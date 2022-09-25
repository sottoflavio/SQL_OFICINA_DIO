
create database oficina;
use oficina;

CREATE TABLE  Cliente (
  `idCliente` PRIMARY KEY INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  `endereço` VARCHAR(45) NULL,
  `telefone` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `histórico` VARCHAR(45) NULL,
  `veículo` VARCHAR(45) NULL,
),

CREATE TABLE  veículo (
  `placa` INT NOT NULL,
  `modelo` VARCHAR(45) NULL,
  `ano` VARCHAR(45) NULL,
  `cor` VARCHAR(45) NULL,
  `fabricante` VARCHAR(45) NULL,
  `Cliente_idCliente` INT NOT NULL,
  PRIMARY KEY (`placa`, `Cliente_idCliente`),
  INDEX `fk_veículo_Cliente_idx` (`Cliente_idCliente`),
  CONSTRAINT `fk_veículo_Cliente`
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES Cliente (`idCliente`)
);

CREATE TABLE  produto (
  `idproduto` INT NOT NULL PRIMARY KEY,
  `descrição` VARCHAR(45) NULL,
  `modelo` VARCHAR(45) NULL,
  `numero série` VARCHAR(45) NULL,
  `fornecedor` VARCHAR(45) NULL,
  `estoque` INT NULL
);

CREATE TABLE fornecedor (
  `idfornecedor` INT NOT NULL PRIMARY KEY,
  `nome` VARCHAR(45) NULL,
  `produto` VARCHAR(45) NULL,
  `contato` VARCHAR(45) NULL
  );

CREATE TABLE  `produto_has_fornecedor` (
  `produto_idproduto` INT NOT NULL,
  `fornecedor_idfornecedor` INT NOT NULL,
  PRIMARY KEY (`produto_idproduto`, `fornecedor_idfornecedor`),
  INDEX `fk_produto_has_fornecedor_fornecedor1_idx` (`fornecedor_idfornecedor` ASC) VISIBLE,
  INDEX `fk_produto_has_fornecedor_produto1_idx` (`produto_idproduto` ASC) VISIBLE,
  CONSTRAINT `fk_produto_has_fornecedor_produto1`
    FOREIGN KEY (`produto_idproduto`)
    REFERENCES produto (`idproduto`),
  CONSTRAINT `fk_produto_has_fornecedor_fornecedor1`
    FOREIGN KEY (`fornecedor_idfornecedor`)
    REFERENCES fornecedor (`idfornecedor`)
);
  
CREATE TABLE serviços (
  `idserviços` INT NOT NULL PRIMARY KEY,
  `descrição` VARCHAR(45) NULL,
  `valor hora` VARCHAR(45) NULL,
);

CREATE TABLE mecânico (
  `idmecânico` INT NOT NULL PRIMARY KEY,
  `nome` VARCHAR(45) NULL,
  `endereço` VARCHAR(45) NULL,
  `telefone` VARCHAR(45) NULL,
  `equipe` VARCHAR(45) NULL,
  `especialidade` VARCHAR(45) NULL
);

CREATE TABLE `ordem de serviço` (
  `idordem de serviço` INT NOT NULL,
  `equipe_idequipe` INT NOT NULL,
  `equipe_mecânico_idmecânico` INT NOT NULL,
  `serviços_idserviços` INT NOT NULL,
  `produto_idproduto` INT NOT NULL,
  `data` DATE NULL,
  `status` VARCHAR(45) NULL,
  `valor` VARCHAR(45) NULL,
  `Cliente_idCliente` INT NOT NULL,
  PRIMARY KEY (`idordem de serviço`, `equipe_idequipe`, `equipe_mecânico_idmecânico`, `serviços_idserviços`, `produto_idproduto`, `Cliente_idCliente`),
  INDEX `fk_ordem de serviço_equipe1_idx` (`equipe_idequipe` , `equipe_mecânico_idmecânico`),
  INDEX `fk_ordem de serviço_serviços1_idx` (`serviços_idserviços`),
  INDEX `fk_ordem de serviço_produto1_idx` (`produto_idproduto`),
  INDEX `fk_ordem de serviço_Cliente1_idx` (`Cliente_idCliente`),
  CONSTRAINT `fk_ordem de serviço_equipe1`
    FOREIGN KEY (`equipe_idequipe` , `equipe_mecânico_idmecânico`)
    REFERENCES `mydb`.`equipe` (`idequipe` , `mecânico_idmecânico`),
  CONSTRAINT `fk_ordem de serviço_serviços1`
    FOREIGN KEY (`serviços_idserviços`)
    REFERENCES `mydb`.`serviços` (`idserviços`),
  CONSTRAINT `fk_ordem de serviço_produto1`
    FOREIGN KEY (`produto_idproduto`)
    REFERENCES `mydb`.`produto` (`idproduto`),
  CONSTRAINT `fk_ordem de serviço_Cliente1`
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES Cliente (`idCliente`)
);

CREATE TABLE equipe (
  `idequipe` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  `mecânico_idmecânico` INT NOT NULL,
  PRIMARY KEY (`idequipe`, `mecânico_idmecânico`),
  INDEX `fk_equipe_mecânico1_idx` (`mecânico_idmecânico` ASC) VISIBLE,
  CONSTRAINT `fk_equipe_mecânico1`
    FOREIGN KEY (`mecânico_idmecânico`)
    REFERENCES mecânico (`idmecânico`)
);
