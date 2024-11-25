#!/bin/sh
echo "Affichage des lignes contenant des nombres entiers naturels :"
egrep -e " [0-9]+$" exemple.txt
echo "Affichage des lignes contenant des nombres entiers relatifs :"
egrep -e " (\+|-)[0-9]+$" exemple.txt
echo "Affichage des lignes contenant des nombres décimaux :"
egrep -e "-?[0-9]+\.[0-9]+$" exemple.txt
echo "Affichage des lignes contenant des nombres rationnels :"
egrep -e "-?[0-9]+/[0-9]+$" exemple.txt
echo "Affichage des lignes contenant des nombres complexes rationnels :"
egrep -e "/[0-9]+i" exemple.txt

echo "elim balises debut et fin"
sed -E -e "s/<\/[a-z]+>//" < enseignant-element.xml-sed > resultat-elem.xml-seb


echo "elim balises debut et fin"
sed -E -e "s/<[a-z]+>//" < enseignant-attribut.xml-sed > resultat-attribut.xml-sed
