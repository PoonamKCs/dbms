/*
	Author: Poonam
	Description: Insertion sort
*/
#include<iostream>
using namespace std;

template <class T>
class Sorting
{		int size;
		T *array;
	public:
		Sorting(T arr[], int s);
		void input();
		void display();
		void insertionSort();
};

template <class T>
Sorting<T>::Sorting(T arr[], int s) 
{
	array= new T[s];
	size= s;
	for(int i=0;i<size;i++)
	array[i]= arr[i];
}

template <class T>
void Sorting<T>::input() 
{
cout<<"\n Enter the Array Elements : ";
	for(int i = 0; i<size; i++)	
	{
		cin>>array[i];
	}
}
template <class T>
void Sorting<T>::display() 
{
   for(int i = 0; i<size; i++)
   cout << array[i] << "  ";
}


		    
template <class T>
void Sorting<T>:: insertionSort()
{
	int c=1;
	for(int i=1,j;i<size;i++)
	{
		T temp=array[i];
		for(j=i;j>0&&temp<array[j-1];j--,c++)
		{
			array[j]=array[j-1];
		}
			array[j]=temp;
		cout<<"\nArray After Pass "<<i<<" : ";
		display();
	}
	cout<<"\nNo of Comparsions : "<<c;
}
int main()
{   int n;
	int*arr=NULL;
	cout<<"\t\t--------------------------------------------------------------------------------";
	cout<<"\n\t\t\t\t\t\tINSERTION SORT ALGORITHM";
	cout<<"\n\t\t--------------------------------------------------------------------------------";
	cout<<"\n\n\n Enter Size of the Array :  ";
  	cin>>n;
  	arr= new int[n];
	Sorting<int>st(arr,n) ;
   
             
            st.input();
					cout << "\nUnsorted Array : ";
   					st.display();
   					cout<<endl;
					st.insertionSort();
   					cout << "\n\nSorted Array after Insertion Sort : ";
   					st.display();
			
	
	cout<<"\n Insertion Sorting Algorithm Successfully Executed........";
return 1;
}
