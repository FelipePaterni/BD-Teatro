# Apresentação de BD

# BD:

### Informações base

Cliente: Ministério do Turismo.

O nosso cliente deseja um site que mostre informações sobre futuras peças teatrais em diferentes teatros da região de salto e itu. Com o objetivo de melhorar a divulgação deles.

O banco de dados vai guardar várias informações, que vai facilitar saber mais sobre as peças, o lugar onde vão acontecer. As informações podem ser usadas para compra de ingresso, saber mais sobre os criadores da peça e para criar propagandas.

**Entidades:**

**Roteirista:**

- Id_Roterista
- Nome
- Contato
- Biografia

**Peça Teatral:**

- Id_peça
- Num_Cenas
- Num_Musica
- Tempo_min
- id_roterista(FK)
- Descrição
- Classificação
- Estreia

**Teatro:**

- Id_teatro
- Nome
- Endereço
- Contato
- Tamanho

**Sessão:**

- Id_Sessao
- data_hora
- Id_peça(FK)
- Id_teatro(FK)

**Ingresso:**

- Id_Ingresso
- Valor
- Assento
- Comprador
- idade_comprador
- Id_Sessao(FK)

Relacionamentos:

Uma Peça é escrita por um Roteirista (Muitos-para-Um).

Uma Peça é exibida em um Teatro (Muitos-para-Um).

Um Ingresso está associado a uma Sessão (Muitos-para-Um).

Uma sessão está em Peça (Muitos-para-Um)

## Tabelas

```sql
CREATE DATABASE teatro;

CREATE TABLE roterista (
    id_roterista INT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    contato VARCHAR(15) NOT NULL,
    biografia TEXT
);

CREATE TABLE peca (
    id_peca INT PRIMARY KEY,
    nome VARCHAR(50),
    num_cenas INT NOT NULL,
    num_musicas INT NOT NULL,
    tempo VARCHAR(25),
    descricao TEXT,
    tema VARCHAR(30),
    classificacao VARCHAR(10) NOT NULL,
    estreia VARCHAR(10),
    id_roterista INT,
    FOREIGN KEY (id_roterista) REFERENCES roterista(id_roterista)
);

CREATE TABLE teatro (
    id_teatro INT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    endereco VARCHAR(255) NOT NULL,
    contato VARCHAR(15) NOT NULL,
    tamanho INT CHECK (tamanho > 0)
);

CREATE TABLE sessao (
    id_sessao INT PRIMARY KEY,
    data_hora VARCHAR(15) NOT NULL,
    id_peca INT,
    FOREIGN KEY (id_peca) REFERENCES peca(id_peca),
    id_teatro INT,
    FOREIGN KEY (id_teatro) REFERENCES teatro(id_teatro)
);

CREATE TABLE ingresso (
    id_ingresso INT PRIMARY KEY,
    valor INT CHECK (valor > 0),
    assento INT NOT NULL,
    comprador VARCHAR(50) NOT NULL,
    idade_comprador INT CHECK (idade_comprador >= 18),
    id_sessao INT,
    FOREIGN KEY (id_sessao) REFERENCES sessao(id_sessao)
);

```

## ALTER TABLE

```sql
ALTER TABLE sessao MODIFY data_hora VARCHAR(20);
ALTER TABLE peca DROP COLUMN tema;
ALTER TABLE peca RENAME pecaTeatral;
```

## Joins

```sql
//
SELECT p.id_peca,p.nome,r.nome,r.biografia
FROM pecaTeatral as p
INNER JOIN roterista as r
on p.id_roterista = r.id_roterista

//Identificar sessões com ingressos disponíveis 
SELECT i.id_ingresso,i.assento,i.comprador, s.data_hora
FROM ingresso as i
RIGHT JOIN sessao as s
on i.id_sessao= s.id_sessao
```

## Inserts

### Roterista

```sql
INSERT INTO roterista(
    id_roterista,
    nome,
    contato,
    biografia
)
VALUES(
    1,
    'João Silva',
    '(11) 9999-8888',
    'João Silva é um roteirista premiado com diversas peças no currículo.'
),(
    2,
    'Maria Souza',
    '(21) 7777-6666',
    'Maria Souza é uma roterista conhecida por suas comédias leves e satíricas.'
),(
    3,
    'Carlos Oliveira',
    '(31) 5555-4444',
    'Carlos Oliveira é um roterista iniciante, buscando explorar novos temas no teatro.'
);
```

### Peca

```sql
INSERT INTO pecateatral(
    id_peca,
    nome,
    num_cenas,
    num_musicas,
    tempo,
    descricao,
    classificacao,
    estreia,
    id_roterista
)
VALUES(
    1,
    'O Fantasma da Ópera',
    20,
    15,
    '2 horas',
    'Uma história de amor e mistério ambientada em uma ópera famosa.',
    'Livre',
    '15/07/2023',
    1
),(
    2,
    'Hamlet',
    25,
    10,
    '2 horas e meia',
    'Uma tragédia clássica de William Shakespeare.',  
    '12 anos',
    '10/05/2023',
    2
),(
    3,
    'O PEQUENO PRÍNCIPE – UMA AVENTURA BRASILEIRA',
    30,
    20,
    '1 hora',
    'Essa é uma história de um menino que viaja por muitos planetas tentando compreender o Amor e a Vida. ',
    'Livre',
    '20/09/2023',
    3
);
```

### Teatro

```sql
INSERT INTO teatro(
    id_teatro,
    nome,
    endereco,
    contato,
    tamanho
)
VALUES(
    1,
    'Teatro Municipal',
    'Rua dos Artistas, 123',
    '(11) 3333-2222',
    500
),(
    2,
    'Teatro Nacional',
    'Av. Cultural, 456',
    '(21) 8888-9999',
    700
),(
    3,
    'Teatro da Cidade',
    'Praça das Artes, 789',
    '(31) 4444-3333',
    300
);
```

### Sesão

```sql
INSERT INTO sessao(
    id_sessao,
    data_hora,
    id_peca,
    id_teatro
)
VALUES(1, '15/07/2023 19:00', 1, 1),(2, '10/05/2023 20:00', 2, 2),(3, '20/09/2023 18:30', 3, 3);
```

### Ingresso

```sql
INSERT INTO ingresso(
    id_ingresso,
    valor,
    assento,
    comprador,
    idade_comprador,
    id_sessao
)
VALUES(
    1,
    50,
    101,
    'Fernanda Oliveira',
    28,
    1
),(
    2,
    70,
    205,
    'Rafael Souza',
    35,
    2
),(
    3,
    60,
    301,
    'Juliana Santos',
    19,
    3
);
```

 

# Subconsultas

```sql
//Buscar o nome do comprador 
//com idade superior a 30 anos
 //que têm uma sessão.
SELECT comprador FROM ingresso 
WHERE idade_comprador>30
AND id_sessao IN(
SELECT id_sessao FROM sessao)

//Buscar o id e a data da sessao 
//que nao tenha peca teatral 
//com classificação livre
SELECT id_sessao, data_hora 
FROM sessao 
WHERE id_peca NOT IN( 
SELECT id_peca FROM pecateatral
WHERE classificacao <> 'Livre')

//Buscar o id e a data da sessao 
//que exista um teatro 
SELECT id_sessao, data_hora
FROM sessao
WHERE EXISTS(SELECT * FROM teatro);

```

# Selects

```sql
SELECT * FROM roterista;

SELECT nome, endereço FROM teatro;
```
