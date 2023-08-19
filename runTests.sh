#!/bin/bash

echo "### TRABALHO 2 SISTEMAS EMBARCADOS ###"

cd src

g++ maxSumSub_seq.cpp energia.c -o testSeqNaoOpt -fopenmp
g++ -O3 maxSumSub_seq.cpp energia.c -o testSeqOpt -fopenmp
g++ maxSumSub_par.cpp energia.c -o testParNaoOpt -fopenmp
g++ -O3 maxSumSub_par.cpp energia.c -o testParOpt -fopenmp


# ===================== SEQUENCIAIS SEM OTIMIZACAO =====================

echo -e "### Executando testes sequenciais ### \n \n"
echo -e "### Caso 1: Sequencial s/ otimizacao ### \n"

export OMP_NUM_THREADS=1


echo "Resultado para 40k elementos:"
./testSeqNaoOpt < ../inputFiles/elem_40k.in
echo -e "\n"

echo "Resultado para 60k elementos:"
./testSeqNaoOpt < ../inputFiles/elem_60k.in
echo -e "\n"

echo "Resultado para 90k elementos:"
./testSeqNaoOpt < ../inputFiles/elem_90k.in
echo -e "\n"

echo "Resultado para 100k elementos:"
./testSeqNaoOpt < ../inputFiles/elem_100k.in
echo -e "\n"

# ===================== SEQUENCIAIS COM OTIMIZACAO =====================

echo -e "### Caso 2: Sequencial c/ otimizacao ### \n"

echo "Resultado para 40k elementos:"
./testSeqOpt < ../inputFiles/elem_40k.in
echo -e "\n"

echo "Resultado para 60k elementos:"
./testSeqOpt < ../inputFiles/elem_60k.in
echo -e "\n"

echo "Resultado para 90k elementos:"
./testSeqOpt < ../inputFiles/elem_90k.in
echo -e "\n"

echo "Resultado para 100k elementos:"
./testSeqOpt < ../inputFiles/elem_100k.in
echo -e "\n"

# ===================== PARALELOS SEM OTIMIZACAO =====================

echo -e "### Executando testes paralelos ### \n \n"
echo -e "### Caso 1: Paralelizado s/ otimizacao ### \n"

export OMP_NUM_THREADS=4

echo "Resultado para 40k elementos:"
./testParNaoOpt < ../inputFiles/elem_40k.in
echo -e "\n"

echo "Resultado para 60k elementos:"
./testParNaoOpt < ../inputFiles/elem_60k.in
echo -e "\n"

echo "Resultado para 90k elementos:"
./testParNaoOpt < ../inputFiles/elem_90k.in
echo -e "\n"

echo "Resultado para 100k elementos:"
./testParNaoOpt < ../inputFiles/elem_100k.in
echo -e "\n"

# ===================== PARALELOS COM OTIMIZACAO =====================
echo -e "### Caso 2: Paralelizado c/ otimizacao ### \n"


echo "Resultado para 40k elementos:"
./testParOpt < ../inputFiles/elem_40k.in
echo -e "\n"

echo "Resultado para 60k elementos:"
./testParOpt < ../inputFiles/elem_60k.in
echo -e "\n"

echo "Resultado para 90k elementos:"
./testParOpt < ../inputFiles/elem_90k.in
echo -e "\n"

echo "Resultado para 100k elementos:"
./testParOpt < ../inputFiles/elem_100k.in
echo -e "\n"


rm testSeqNaoOpt
rm testSeqOpt
rm testParNaoOpt
rm testParOpt

cd ..