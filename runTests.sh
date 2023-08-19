#!/bin/bash

echo "### TRABALHO 2 SISTEMAS EMBARCADOS ###"

cd src

g++ maxSumSub_seq.cpp energia.c -o testSeqNaoOpt -fopenmp
g++ -O3 maxSumSub_seq.cpp energia.c -o testSeqOpt -fopenmp
g++ maxSumSub_seq.cpp energia.c -o testParNaoOpt -fopenmp
g++ -O3 maxSumSub_seq.cpp energia.c -o testParOpt -fopenmp


echo -e "### Executando testes sequenciais ### \n \n"

echo -e "### Codigo 1: Sequencial s/ otimizacao ### \n"

export OMP_NUM_THREADS=1

echo "Resultado para 40k elementos:"
./testSeqNaoOpt < ../inputFiles/elem_40k.in
echo -e "\n"

#debug
echo "numero de threads eh "
echo $OMP_NUM_THREADS
echo -e "\n"

echo "Resultado para 60k elementos:"
./testSeqNaoOpt < ../inputFiles/elem_60k.in
echo -e "\n"

#debug
echo "numero de threads eh "
echo $OMP_NUM_THREADS
echo -e "\n"

echo "Resultado para 90k elementos:"
./testSeqNaoOpt < ../inputFiles/elem_90k.in
echo -e "\n"

#debug
echo "numero de threads eh "
echo $OMP_NUM_THREADS
echo -e "\n"

echo "Resultado para 100k elementos:"
./testSeqNaoOpt < ../inputFiles/elem_100k.in
echo -e "\n"

#debug
echo "numero de threads eh "
echo $OMP_NUM_THREADS
echo -e "\n"


rm testSeqNaoOpt
rm testSeqOpt
rm testParNaoOpt
rm testParOpt

cd ..