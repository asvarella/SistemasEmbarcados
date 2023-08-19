# Sistemas Embarcados - UFRGS
## Análise do custo energético com diferentes formas de otimização
### 1. Algoritmo e escolhas de otimização

O algoritmo utilizado foi uma implementação em c++ do problema **Maximum Sum Subsequence.** Leia mais sobre o algoritmo [aqui](https://www.geeksforgeeks.org/maximum-sum-subsequence/).

Fazendo uso do RAPL para capturar dados de custo energético da execução do código, foram feitos testes com as seguintes configurações:

* Execução single-thread:
    - sem nenhuma otimização;
    - usando a flag -O3 para compilar o programa.
* Execução paralelizada com uso de **OpenMP**:
    - sem nenhuma otimização além de usar multi-thread;
    - usando a flag -O3 para compilar o programa.

O objetivo do trabalho é comparar os resultados de desempenho dessas quatro configurações, assim, estudando o impacto de usar _diversas formas de resolver o mesmo problema._

### 2. Arquivos desse repositório 

No diretório `inputFiles` encontram-se os quatro arquivos utilizados para entrada na execução do código. 

As entradas consistem em arrays de `n` elementos do tipo `int` gerados de forma pseudo-aleatória. No caso destes testes, foram utilizados arrays de tamanho **40000, 60000, 90000 e 100000**.

No diretório `src` encontram-se os arquivos para uso de RAPL, chamados `energia.h` e `energia.c`, bem como a versão single-thread e a versão multi-thread do código para o Maximum Sum Subsequence, chamadas `maxSumSub_seq.cpp` e `maxSumSub_par.cpp` respectivamente.

Na raiz do repositório encontra-se o script `runTests.sh`, que compila as quatro configurações de teste e roda cada executável com os quatro arquivos de entrada diferentes. O arquivo `logs.txt` apresenta resultados de uma execução prévia do script.

Nos passos abaixo estão as instruções de como executar um novo batch de testes.

### 3. Testando o código
Contadores de hardware precisam ser executados como _root_. Na raiz do repositório, execute o comando abaixo:

```sudo su```

Digite sua senha quando aparecer a mensagem no terminal.

Depois disso, você pode testar os códigos de duas maneiras diferentes:


#### 1. Usando o script `runTests.sh`:

> **AVISO**: o script roda todas as configurações com todas as entradas. Esse processo pode demorar longos minutos.

Para poder rodar o arquivo `runTests.sh`, execute os comandos abaixo no diretório raiz do repositório:

```
chmod +x runTests.sh
./runTests.sh
```
Os _outputs_ das execuções dos algoritmos aparecerão no terminal. Caso queira salvar as saídas em um arquivo de texto, troque `./runTests.sh` pelo comando abaixo:

```./runTests.sh > {nomeArquivo}.txt```

#### 2. Compilando e rodando uma configuração específica:
> Para testes mais rápidos/pontuais, essa é a melhor configuração.

Para testar, por exemplo, o algoritmo na versão **paralelizada e com flag de otimização**:

```
cd src
g++ -O3 maxSumSub_par.cpp energia.c -o testParOpt -fopenmp
export OMP_NUM_THREADS=4 
./testParOpt < ../inputFiles/elem_40k.in
```
