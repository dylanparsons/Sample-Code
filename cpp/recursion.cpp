#include <iostream>
using namespace std;
void rotateLeft(int *arr, int size)
{
   if(size < 2)
   return;
   rotateLeft(arr,size-1);
   int temp;
   temp = arr[size-2];
   arr[size-2] = arr[slsize-1];
   arr[size-1] = temp;
}

int main()

{
   int arrSize;
   cout << "Input: ";
   cin >> arrSize;
   int array[arrSize];
   for(int i = 0; i < arrSize; i++)
       cin >> array[i];
   cout << "Original list: ";
   for(int i = 0; i < arrSize; i++)
       cout << array[i] << " ";
   cout << endl;
   rotateLeft(array, arrSize);
   cout << "Rotated list: ";
   for(int i = 0; i < arrSize; i++)
       cout << array[i] << " ";
   cout << endl;
   return 0;

}

