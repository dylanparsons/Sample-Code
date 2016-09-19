#include<iostream>
using namespace std;

int main()
{
   int x1,x2,x,y1,y2,y;
  
   while(true)
   {
       //Prompt the user for the upper left corner of a rectangle
       cout << "Enter upper left corner x cordinate : " ;
       cin >> x1;
      
       cout << "Enter upper left corner y cordinate : " ;
       cin >> y1;
      
       //Prompt the user for the lower right corner of the rectangle
       cout << "Enter lower right corner x cordinate : " ;
       cin >> x2;
      
       cout << "Enter lower right corner y cordinate : " ;
       cin >> y2;
      
       //Prompt the user for the coordinates of a point
       cout << "Enter x cordinate to be checked : " ;
       cin >> x;
      
       cout << "Enter y cordinate to be checked : " ;
       cin >> y;
      
       //Repeat the above steps until the user enters (0,0) for both corners
       if(x1 == 0 && y1 == 0 && x2 == 0 && y2 ==0)
       {
           //Exit
           cout << "Exitting the program \n";
           break;
       }
      
       if(x>=x1&&x<=x2&&y>=y1&&y<=y2)
       	   //Point exists within boundaries    
           cout << "Point is inside the rectangle\n";
       else
       	   //Point does not exist within boundaries     
           cout << "Point is not inside the rectangle \n";
   }
   return 0;
}