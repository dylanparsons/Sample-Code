#include <iostream>

using namespace std;

int main()

{

	double cTemp; // The entered Celsius temperature

	double fTemp; // The calculated Fahrenheit temperature

// Prompt the user for a Celsius temperature and read the value entered

	cout << "Please enter a Celsius temperature. -> ";

	cin >> cTemp;

	cout << endl << endl;

// Calculate the Fahrenheit equivalent

	fTemp = (9.0 / 5.0) * cTemp + 32.0;

// Output the result

	cout << cTemp << " degrees Celsius is equivalent to " << fTemp

	<< " degrees Fahrenheit." << endl;

//add code to let user enter temperature in Fahrenheit then

//convert it to Celsius and display it.

	cout << fTemp << " degrees Fahrenheit is equivalent to " << cTemp

	<< " degrees Celsius." << endl;

	cin >> fTemp;
	cTemp = (5.0 / 9.0) * (fTemp-32.0);	

	return 0;

}

/*
Output for TempConverter:
og8811os$ g++ TempConverter.cpp -o TempConverter
og8811os$ ./TempConverter

Please enter a Celsius temperature. -> 0

0 degrees Celsius is equivalent to 32 degrees Fahrenheit.
32 degrees Fahrenheit is equivalent to 0 degrees Celsius.
*/
