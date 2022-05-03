# FormatadorSQL3Enumerado
 Formata Sql inserindo numeração da linha para facilitar a localização.
 
 Exemplo: 
 # Este é um insert simples.
 
INSERT INTO PROXCODBARRAS(COD_BARRAS,CODIGOPRODUTO,
UNIDADE,VR_PRECO_VENDA,QTDE_MONTANTE,FRACIONADO...

# Este é o insert depois de convertido

{000}  'INSERT INTO PROXCODBARRAS( ' + 
{001}  'COD_BARRAS, ' + 
{002}  'CODIGOPRODUTO, ' + 
{003}  'UNIDADE, ' + 
{004}  'VR_PRECO_VENDA, ' + 
{005}  'QTDE_MONTANTE, ' + 
{006}  'FRACIONADO, ' + ...

## Isto é para facilitar a identificação do campo quando necessário.
