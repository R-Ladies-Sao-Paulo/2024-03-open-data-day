# instalar o pacote
# install.packages("basedosdados")

# carregar o pacote base dos dados
library(basedosdados)

# Aqui embaixo
set_billing_id("base-dos-dados-334420")

# carregar os dados de id_municipio
id_municipio <- read_sql("
SELECT id_municipio
FROM `basedosdados.br_bd_diretorios_brasil.municipio`
WHERE nome = 'Curitiba'
")

# carregar os dados para responder a pergunta
dados <- read_sql("
SELECT  raca_cor, idade_mae, escolaridade_mae,estado_civil_mae
FROM `basedosdados.br_ms_sinasc.microdados` as dados
WHERE ano = 2022
AND id_municipio_nascimento = '4106902'
AND classificacao_pre_natal IN ('1','2','3')
")
