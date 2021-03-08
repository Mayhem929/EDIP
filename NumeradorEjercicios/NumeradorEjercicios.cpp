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
	
	fichero << "\t\\begin{enumerate}\n";
	
	for (int i=0; i<num_ejercicios; i++) {
		string nombre_ejercicio = "ejercicio-" + to_string(i+1) + ".tex";
		fichero << "\t\t \\item \\input{" << nombre_ejercicio << "}" << endl;
	}
	
	fichero << "\t\\end{enumerate}\n";
	
	cout << "\nFichero creado con exito." << endl;
	
	fichero.close();

	return 0;
}
