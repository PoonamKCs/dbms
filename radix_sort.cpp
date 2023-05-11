#include<iostream>
using namespace std;

class Radix_Sort{

	int d,*arr,size;
	public:
		Radix_Sort(int s);
		~Radix_Sort();
		int digits(int a);
		void Radix_Sorting();
		
};
class Count_Sort{
	
	int* arr;
	int size,ll,ul;
	
	public:
		Count_Sort(int n);
		void range();
		~Count_Sort();
		void input();
		void display(int *A,int n);
		void counting_sort();
		
		friend class Radix_Sort;
};
Radix_Sort::Radix_Sort(int s)
{
	d=0;
	size=s;
	arr=new int[size];
}
int Radix_Sort::digits(int a)
{
	int max=0;
	while(a>=0)
	{
		a=a%10;
		a=a/10;
		++max;
	}
	return max;		
}
void Radix_Sort::Radix_Sorting()
{
	for(int i=0;i<size;i++)
	{
	int d=digits(arr[i]);
	for(int j=0;j<d;j++)
	{
		Count_Sort c(d);
		c.counting_sort();	
	}	
	}
	
}
void Count_Sort::range()
{
	ll=ul=arr[0];
	for(int i=1;i<size;i++)
	{
		if(arr[i]>ul)
			ul=arr[i];
		else
			if(arr[i]<ll)
				ll=arr[i];
	}
}
Count_Sort::Count_Sort(int n)
{	
	size=n;
	arr=new int[size];
	ll=0;
	ul=0;
}
Count_Sort::~Count_Sort()
{
	delete arr;
}
void Count_Sort::input()
{
	cout<<"\n Array Elements : ";
	for(int i=0;i<size;i++)
		cin>>arr[i];
	range();
	cout<<"\n Range  : "<<ll<<" "<<ul;
}
void Count_Sort::display(int *A,int n)
{
	for(int i=0;i<n;i++)
	{
		cout<<A[i]<<"  ";
	}
}
void Count_Sort::counting_sort()
{
	int k=ul-ll+1;
    //Frequency array
	int* C=new int[k];
	int* B=new int[size];
	//sorted output array
	for(int i=0;i<k;i++)
		C[i]=0;
		
	for(int j=0;j<size;j++)
		C[arr[j]-ll]+=1;
	//cout<<"\n Frequency Count : ";
	//display(C,k);
	for(int i=1;i<k;i++)
		C[i]+=C[i-1];
	//cout<<"\n Cumulative Frequency : ";
	//display(C,k);
	for(int j=size-1;j>=0;j--)
	{
		B[C[arr[j]-ll]-1]=arr[j];
		C[arr[j]-ll]--;
	}
	cout<<"\n\nSorted array : ";
	display(B,size);
	delete B;
	delete C;
}
int main()
{
	int n;
    cout<<"\t\t--------------------------------------------------------------------------------";
	cout<<"\n\t\t\t\t\t\tRADIX SORT ALGORITHM";
	cout<<"\n\t\t--------------------------------------------------------------------------------";
	cout<<"\n\nEnter Array size : ";
	cin>>n;
	Count_Sort c(n);
	c.input();
	c.counting_sort();
	cout<<"\n\nRadix Sort Implemented Successfully ";
}
