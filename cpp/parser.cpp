#include <iostream>
#include <cstring>
#include <stdlib.h>
using namespace std;

/* This function reads a line of words from the keyboard and puts them into array a 
The size of the array is written into num
*/
void parse(char** a, int& num)
{
	char c;
	int i = 0, j = 0;
	bool space = false;	// Used to eliminate spaces at the end
	bool nonempty = false; // Used to check whether the string is empty or not

	cout << "dysh> ";

	// Skip leading spaces
	do {
		c = cin.get();
	} while(c == ' ' && c != '\n');

	// Now treat the main part of the line
	while(c != '\n') {
		if(c == ' ') {	// Space means new word
			space = true;
			a[i][j] = '\0';
			i++;
			j = 0;
			while(c == ' ') { c = cin.get(); }	// Skip a bunch of consequent spaces
		} else {
			nonempty = true;
			space = false;
			a[i][j] = c;
			j++;
			c = cin.get();
		}
	}
	a[i][j] = '\0';	// Terminate the very last word
	
	if(!space) num = i+1;	// User hit enter right after typing word
	else num = i;	// There is a space in the end
	if(!nonempty) num = 0;	// The line is empty or made of spaces only
}

int main()
{
	int n;

	// Create a dynamic two-dimentional array of characters a[30][1024]
	char** a = new char*[30];
	if(!a) {
		cerr << "Memory allocation error.\n";
		exit(1);
	}

	for(int i = 0; i < 30; i++) {
		a[i] = new char[1024];
		if(!a[i]) {
			cerr << "Memory allocation error.\n";
			exit(1);
		}
	}

	do {	// Sentinel-controlled loop
		parse(a, n);

		for(int i = 0; i < n; i++) {	// Print the array
			cout << "a[" << i << "] = '" << a[i] << "'" << endl;
		}
		cout << "# of items: " << n << endl;	// Print the size of the array
	} while(strcmp(a[0], "QUIT"));

	// Delete the array
	for(int i = 0; i < 30; i++) {
		delete [] a[i];
	}

	delete [] a;
	return 0;
}