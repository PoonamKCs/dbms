#include<graphics.h>
#include<iostream>
using namespace std;
void midpointellipse(int xc,int yc,long rx,long ry){
	int x,y;
   float p;
   x=0;y=ry;
    
	//Region 1
	 p=ry*ry-rx*rx*ry+(rx*rx)/4;
  
   while(ry*ry*x <= rx*rx*y)
   {
	if(p < 0)
	{
		x++;
		p = p+2*ry*ry*x+3*ry*ry;
	}
	else
	{
		x++;y--;
		p = p+2*ry*ry*x-2*rx*rx*y+2*ry*ry;
	}
	putpixel(xc+x,yc+y,WHITE);
	putpixel(xc+x,yc-y,WHITE);
	putpixel(xc-x,yc+y,WHITE);
	putpixel(xc-x,yc-y,WHITE);
   }
   //Region 2
   p=ry*ry*(x+0.5)*(x+0.5)+rx*rx*(y-1)*(y-1)-rx*rx*ry*ry;
   while(y > 0)
   {
	if(p <= 0)
	{
		x++;y--;
		p = p+2*ry*ry*x-2*rx*rx*y+rx*rx;
	}
	else
	{
		y--;
		p = p-2*rx*rx*y+rx*rx;
	}
	putpixel(xc+x,yc+y,WHITE);
	putpixel(xc+x,yc-y,WHITE);
	putpixel(xc-x,yc+y,WHITE);
	putpixel(xc-x,yc-y,WHITE);
   }
}
int main()
{
   int x_center,y_center;
   long x_radius,y_radius;
   //request auto detection  
	int gd=DETECT,gm,errorcode;
	//initialize graphics and local variables
	initgraph(&gd,&gm,"c:\\turboc3\\bgi");
	//read result of initialization
	errorcode = graphresult();
   //an error occurred 
   if (errorcode != grOk)
   {
      printf("Graphics error: %s\n", grapherrormsg(errorcode));
      printf("Press any key to halt:");
      getch();
      exit(1);
   }
    cout<< "Enter Coordinates of Center(x, y) of Ellipse :";  
    cin>>x_center>>y_center;  
    cout<<"Enter Length of Major and Minor axis(a,b) of Ellipse :";  
    cin>>x_radius>>y_radius;
	
	midpointellipse(x_center,y_center,x_radius,y_radius);
   	getch();
}
