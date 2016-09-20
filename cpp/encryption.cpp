#include <iostream>
#include <fstream>
#include <cstdlib>

using namespace std;

void read_chunk(ifstream& inRead, char **array, int key);
// The read_chunk function will require an input file stream, a 2-D
// array of characters and a user specified integer, less
// than 10 to determine the size of the array. Reading the contents of the array from
// the input file from the input stream and place individual characters in the 2-D array.

void transpose(char **array, int key);
// The transpose function requires a dynamic 2-D array and a user specified integer, less
// than 10 to determine the size of the array. Transposing the matrix will occur
// by switching the rows and columns of the array, i.e. flip it on its side. 

void write_chunk(ofstream& outWrite, char **array, int key);
// The write_chunk function will require an output file stream, a dynamic 2-D array
// and a user specified integer to determine the size of the array. 
// Writing the contents of the array repeatedly to the output file from the output stream.


int main()
{
	char originalFile[100];
	char resultFile[100];
	ifstream myIn;
	ofstream myOut;
	int key = 0;
	char** letter;
	
	cout << "For encryption, enter the input file name, the "; cout << "an output file name, and an encryption key,";
	cout << " a number from 2-10." << endl << endl;
	
	cout << "For decryption , enter the name of the  encrypted file, the ";
	cout << "decrypted file name (WARNING: Do Not Use The Original ";
	cout << "File Name.), and the encryption key from the corresponding output file. ";
	cout << endl << endl;
	
	cout << "\n\nEnter the input file name: ";
	cin >> originalFile;
	// Prompt the user for an input file name
	
	myIn.open(originalFile); // Attempt to open the input file
	
	// Checking the input file
	if (myIn.fail())
	{
		cout << "File Not Found! Unable to open input file." << endl;
		exit(EXIT_FAILURE);
	}
	
	cout << "Enter the output file name to be created: ";
	cin >> resultFile;
	// Prompt the user for an output file name
	
	myOut.open(resultFile); // Attempts to open the file 
	
	// Check the output file
	if (myOut.fail())
	{
		cout << "File Not Found! Unable to open output file." << endl;
		exit(EXIT_FAILURE);
	}
	
	// Prompt the user for an encryption key, a number from 2-10
	cout << "Enter the encryption key, a number from 2-10: ";
	cin >> key;
	cout << endl << endl;
	letter = new char* [key];
		// Dynamically allocate the pointer to the array	
		for(int i = 0; i < key; i++)
			letter[i] = new char [key];
	
	// Repeat the read_chunk, transpose, and write_chunk functions until EOF. 


	while (!myIn.eof())
	{
	
		read_chunk(myIn, letter, key);
		// Read the input file stream and read the characters from input file to the array
		
		transpose(letter, key);
		// Transpose the 2-D array
		
		write_chunk(myOut, letter, key);
		// Write the content of the transposed array to the output file
		
		
	}
	// Deallocate memory of the pointer to the array
	for(int i=0; i < key; i++)
		delete [] letter[i];
	delete [] letter;

	// Closing the input and output file streams
	myIn.close(); 
	myOut.close(); 
	
	return EXIT_SUCCESS;
}

void read_chunk(ifstream& inRead, char **array, int key)
{
	for(int i = 0; i < key; i++) // Loop for the rows (From left to right) X axis
		for(int j = 0; j < key; j++) // Loop for the columns (From top to bottom) Y axis
	{
			inRead.get( array[i][j] ); // Read the characters to array
			if(inRead.eof()) return;
}
	}

void transpose(char **array, int key)
{
	char temp;
	
	for(int i = 0; i < key; i++) // Loop for the rows (From left to right) X axis
	{
		for(int j = i + 1; j < key; j++) // Loop for the columns (From top to bottom) Y axis
		{
			temp = array[i][j]; // Move and place element
			array[i][j] = array[j][i]; // Replace the first element
			array[j][i] = temp; // Replace the second element
		}
	}
}

void write_chunk(ofstream& outWrite, char **array, int key)
{
	for(int i = 0; i < key; i++) // Loop for the rows (From left to right) X axis
		for(int j = 0; j < key; j++) // Loop for the columns (From top to bottom) Y axis
			outWrite.put(array[i][j]); // Write the characters to the output file
}
