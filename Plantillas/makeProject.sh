#!/bin/bash
# Title:     	makeProject.sh
# Date:       	06/05/2021
# Author:      Shao Jie Hu Chen
# Version:     1.0
# Description: It creates a folder with all needed files and names.
# Options:    	No options
# Use:         ./makeProject.sh [Name of folder] [nº of exercises]

syntax="./makeProject.sh [Name of folder] [nº of exercises]";

if [ $# != 2 ];
then
	printf "Incorrect number of arguments. Sintaxis: $syntax.\n";
	exit 1;
fi;

cd $PWD;
cd ..;

if $(test ! -d $1);
then
	mkdir $1;
else
	printf "Project already created.\n";
fi;

cp -R Plantillas/doc-files/* $1/;

numero='^[0-9]+$';

if ! [[ $2 =~ $numero ]]; 
then 	
	printf "Incorrect number of exercises (second parameter).\n";
	exit 1;
fi

for (( i=0; i<$2; i++));
do
	touch $1/ejercicio-$(($i+1)).tex;
done
