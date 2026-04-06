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
# 2. Distribuição de frequências e gráficos
# (PREENCHER NA BRANCH analise-graficos,)
# use comandos para distribuição de frequências de sexo, gráfico de colunas para faixa_etaria por sexo, histograma de altura, boxplot de IMC por sexo
# 3. Medidas descritivas
# (PREENCHER NA BRANCH analise-medidas)
# use comandos de cálculo de mínimo, máximo, média, mediana e desvio-padrão para idade, altura, peso e IMC
# 2. Distribuição de frequências e gráficos
table(dados$sexo)
barplot(table(dados$faixa_etaria, dados$sexo), beside = TRUE, legend
        = TRUE)
hist(dados$altura)
boxplot(dados$imc ~ dados$sexo)