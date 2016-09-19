#include <iostream>

using namespace std;

void TowersOfHanoi(int n, int current, int temp, int final)
{
if( n != 0 ) {
TowersOfHanoi(n - 1, current, final, temp);
cout << "Move a disk from peg " << current << " to peg " << final << "." << endl;
TowersOfHanoi(n - 1, temp, current, final);
}
}

int main()
{
int n, x, y, z;
cout << "How many disks do you want to move? ";
cin >> n;
cout << "From which peg? ";
cin >> x;
cout << "To which peg? ";
cin >> y;
if(x != 1 && y != 1){
   z = 1;
}
else if(x != 2 && y != 2){
   z = 2;
}
else if(x != 3 && y != 3){
   z = 3;
}
TowersOfHanoi(n, x, z, y);
return 0;
}
