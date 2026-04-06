# Script da aula 7 - 06/04 para praticar uso de branches no Git e GitHub(tarefa 2)

# 1. Leitura e manipulação dos dados
dados = read.csv("dados-aula-7-limpos.csv", header=TRUE, sep = ",")
# ver estrutura
str(dados)
head(dados)

# cálculo de IMC
dados$imc = dados$peso / ((dados$altura/100)^2)

# criando faixas etárias
dados$faixa_etaria = ifelse(dados$idade < 30, "Jovem",
                            ifelse(dados$idade < 60, "Adulto", "Idoso"))
dados$faixa_etaria = factor(dados$faixa_etaria)