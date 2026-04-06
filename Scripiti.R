# 1. Leitura do banco de dados
dados = read.csv("dados-aula-7 - dados-aula-7.csv", header= TRUE, sep=",")

# ver estrutura
str(dados)
head(dados)
# 2. Identificando em que linhas do CSV houve problema de leitura

# ler linha por linha
linhas = readLines("dados-aula-7 - dados-aula-7.csv") # quantidade de vírgulas em cada linha (não pode passar de 5 porque são 5 variáveis)
num_campos = sapply(strsplit(linhas, ","), length) # divide cada linha onde tem vírgula e conta quantos elementos tem
table(num_campos)

# exibir as linhas com problemas
which(num_campos != 5)
linhas[which(num_campos != 5)]

dados = dados[!duplicated(dados$id), ]

# Tratamento de duplicadas
dados = dados[!duplicated(dados$id), ]

# Tratamento de missing codificado
dados$peso[dados$peso == 999] = NA

# Tratamento da variável sexo
dados$sexo <- tolower(dados$sexo) # coloca tudo em letra minúscula
dados$sexo <- trimws(dados$sexo)  # retira espaços em branco antes e depois, se houver

dados$sexo[dados$sexo %in% c("m", "masc")] = "masculino"
dados$sexo[dados$sexo %in% c("f", "fem")] = "feminino"

head(dados)
summary(dados)

# Tratamento de valores inviáveis para as variáveis idade e peso - Isso depende docontexto do problema
dados$idade[dados$idade > 100] = NA
dados$peso[dados$peso > 150] = NA

# Remoção de linhas com falta de informação
dados_limpos <- na.omit(dados)

# Verificando quantas linhas foram extraídas por conta de perda de informação
nrow(dados)
nrow(dados_limpos)
