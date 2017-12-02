
CREATE TABLE tb_tempo (
                ANO INT NOT NULL,
                SEMESTRE INT NOT NULL,
				FLAG_CORRENTE VARCHAR(3),
                PRIMARY KEY (ANO, SEMESTRE)
);


CREATE TABLE tb_disciplinas (
                CODIGO VARCHAR(10) NOT NULL,
                DISCIPLINA VARCHAR(100) NOT NULL,
                PRIMARY KEY (CODIGO)
);


CREATE TABLE tb_alunos (
                MATRICULA VARCHAR(20) NOT NULL,
                EMAIL VARCHAR(100),
                NOME VARCHAR(80) NOT NULL,
                SEMESTRE_INGRESSO INT NOT NULL,
                CPF CHAR(11),
                ANO_INGRESSO INT NOT NULL,
                PRIMARY KEY (MATRICULA)
);


CREATE TABLE tb_categoria (
                ID INT AUTO_INCREMENT NOT NULL,
                CATEGORIA VARCHAR(20) NOT NULL,
                FLAG_TIPO VARCHAR(5) NOT NULL,
                PRIMARY KEY (ID)
);


CREATE TABLE tb_respostas (
                ID INT AUTO_INCREMENT NOT NULL,
                RESPOSTA VARCHAR(250) NOT NULL,
                FLAG_ATIVO CHAR(1) NOT NULL,
                VALOR INT NOT NULL,
                ID_CATEGORIA INT NOT NULL,
                PRIMARY KEY (ID)
);


CREATE INDEX fk_resp_cat USING BTREE
 ON tb_respostas
 ( ID_CATEGORIA ASC );

CREATE TABLE tb_perguntas (
                ID INT AUTO_INCREMENT NOT NULL,
                PERGUNTA VARCHAR(1024) NOT NULL,
                FLAG_ATIVO CHAR(1) NOT NULL,
                ID_CATEGORIA INT NOT NULL,
                PRIMARY KEY (ID)
);


CREATE INDEX fk_perg_cat USING BTREE
 ON tb_perguntas
 ( ID_CATEGORIA ASC );

CREATE TABLE tb_administradores (
                LOGIN VARCHAR(12) NOT NULL,
                NOME VARCHAR(80) NOT NULL,
                EMAIL VARCHAR(80),
                SENHA VARCHAR(12) NOT NULL,
                PRIMARY KEY (LOGIN)
);


CREATE TABLE tb_docentes (
                MATRICULA VARCHAR(20) NOT NULL,
                NOME VARCHAR(80) NOT NULL,
                EMAIL VARCHAR(100),
                SENHA VARCHAR(12) NOT NULL,
                FLAG_ATIVO CHAR(3) DEFAULT 'SIM' NOT NULL,
                PRIMARY KEY (MATRICULA)
);


CREATE TABLE tb_oferta (
                ANO INT NOT NULL,
                CODIGO VARCHAR(10) NOT NULL,
                MATRICULA VARCHAR(20) NOT NULL,
                SEMESTRE INT NOT NULL,
                PRIMARY KEY (ANO, CODIGO, MATRICULA, SEMESTRE)
);


CREATE TABLE tb_turma (
                ANO INT NOT NULL,
                SEMESTRE INT NOT NULL,
                CODIGO VARCHAR(10) NOT NULL,
                MATRICULA VARCHAR(20) NOT NULL,
                FLAG_AVALIADO VARCHAR(3) DEFAULT 'NÃO' NOT NULL,
                PRIMARY KEY (ANO, SEMESTRE, CODIGO, MATRICULA)
);


CREATE TABLE tb_comentarios (
                ID INT AUTO_INCREMENT NOT NULL,
                COMENTARIO VARCHAR(1024),
                SUGESTOES VARCHAR(1024),
                ANO INT NOT NULL,
                SEMESTRE INT NOT NULL,
                CODIGO VARCHAR(10) NOT NULL,
                MATRICULA VARCHAR(20) NOT NULL,
                PRIMARY KEY (ID)
);


CREATE UNIQUE INDEX tb_comentarios_idx
 ON tb_comentarios
 ( ANO, SEMESTRE, CODIGO, MATRICULA );

CREATE TABLE tb_avaliacao (
                ID INT NOT NULL,
                ID_PERGUNTA INT NOT NULL,
                ID_RESPOSTA INT NOT NULL,
                SEMESTRE INT NOT NULL,
                ANO INT NOT NULL,
                CODIGO VARCHAR(10) NOT NULL,
                MATRICULA VARCHAR(20) NOT NULL,
                PRIMARY KEY (ID)
);


CREATE INDEX fk_av_perg USING BTREE
 ON tb_avaliacao
 ( ID_PERGUNTA ASC );

CREATE INDEX fk_av_resp USING BTREE
 ON tb_avaliacao
 ( ID_RESPOSTA ASC );

CREATE UNIQUE INDEX tb_avaliacao_idx
 ON tb_avaliacao
 ( ID_PERGUNTA, SEMESTRE, ANO, CODIGO, MATRICULA );

ALTER TABLE tb_oferta ADD CONSTRAINT tb_tempo_tb_oferta_fk
FOREIGN KEY (ANO, SEMESTRE)
REFERENCES tb_tempo (ANO, SEMESTRE)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE tb_oferta ADD CONSTRAINT tb_disciplinas_tb_oferta_fk
FOREIGN KEY (CODIGO)
REFERENCES tb_disciplinas (CODIGO)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE tb_turma ADD CONSTRAINT tb_alunos_tb_matricula_fk
FOREIGN KEY (MATRICULA)
REFERENCES tb_alunos (MATRICULA)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE tb_perguntas ADD CONSTRAINT tb_cat_tb_perg_fk
FOREIGN KEY (ID_CATEGORIA)
REFERENCES tb_categoria (ID)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE tb_respostas ADD CONSTRAINT tb_cat_tb_resp_fk
FOREIGN KEY (ID_CATEGORIA)
REFERENCES tb_categoria (ID)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE tb_avaliacao ADD CONSTRAINT tb_resp_tb_av_fk
FOREIGN KEY (ID_RESPOSTA)
REFERENCES tb_respostas (ID)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE tb_avaliacao ADD CONSTRAINT tb_perg_tb_av_fk
FOREIGN KEY (ID_PERGUNTA)
REFERENCES tb_perguntas (ID)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE tb_oferta ADD CONSTRAINT tb_docentes_tb_oferta_fk
FOREIGN KEY (MATRICULA)
REFERENCES tb_docentes (MATRICULA)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE tb_turma ADD CONSTRAINT tb_oferta_tb_matricula_fk
FOREIGN KEY (ANO, CODIGO, MATRICULA, SEMESTRE)
REFERENCES tb_oferta (ANO, CODIGO, MATRICULA, SEMESTRE)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE tb_avaliacao ADD CONSTRAINT tb_matricula_tb_avaliacao_fk
FOREIGN KEY (ANO, SEMESTRE, CODIGO, MATRICULA)
REFERENCES tb_turma (ANO, SEMESTRE, CODIGO, MATRICULA)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE tb_comentarios ADD CONSTRAINT tb_matricula_tb_comentarios_fk
FOREIGN KEY (ANO, SEMESTRE, CODIGO, MATRICULA)
REFERENCES tb_turma (ANO, SEMESTRE, CODIGO, MATRICULA)
ON DELETE NO ACTION
ON UPDATE NO ACTION;
