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

	fichero << "%CUERPO" << endl;

	fichero << "\\begin{document}" << endl << endl;

	for (int i=0; i<num_ejercicios; i++) {
		string nombre_ejercicio = "ejercicio-" + to_string(i+1);

		fichero << "\n\n%%%%%%%%%%%%%% EJERCICIO " << i+1 << " %%%%%%%%%%%%%%\n";

//	fichero << "\\problem" << endl;

//	fichero << "\\color{blue}" << endl;
//	fichero << "\t\\input{" << nombre_ejercicio << "-enunciado.tex}";
//	fichero << endl;

//	fichero << "\\color{black}" << endl;
		fichero << "\t\\input{" << nombre_ejercicio << ".tex}";
		fichero << endl << endl;
	}

	fichero << "\\end{document}" << endl;

	cout << "\nFichero creado con exito." << endl;

	fichero.close();

	return 0;
}
