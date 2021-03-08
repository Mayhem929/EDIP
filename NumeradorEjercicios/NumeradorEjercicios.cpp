#include <iostream>
#include <fstream>
using namespace std;

int main() {
	const string NOMBRE_ARCHIVO = "ejercicios-main.tex";
	ofstream fichero(NOMBRE_ARCHIVO);
	int num_ejercicios;
	
	cout << "Introduzca el numero de ejercicios: ";
	
	do {
		cin >> num_ejercicios;
	} while (num_ejercicios <= 0);
	
	for (int i=0; i<num_ejercicios; i++) {
		string nombre_ejercicio = "ejercicio-" + to_string(i+1) + ".tex";
		fichero << "\t\\section{Problema " << i+1 << "} \\\\" << endl;
		fichero << "\t\\input{" << nombre_ejercicio << "} \\\\";
		fichero << endl << endl;
	}
	
	cout << "\nFichero creado con exito." << endl;
	
	fichero.close();

	return 0;
}
