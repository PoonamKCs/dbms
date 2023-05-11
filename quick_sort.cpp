#include<iostream>
#include<stdlib.h>
#include<fstream>
using namespace std;
void swap(int &a,int &b)
{
	int temp=a;
	a=b;
	b=temp;
}
int Rand_partition(int A[],int l,int r,int &cmp)
{
	int i=rand()%(r-l)+l;
	swap(A[i],A[r]);
	int x=A[r];
	int a=l-1;
	for(int j=l;j<r;j++)
	{
		cmp++;
		if(A[j]<=x)
		{
			a=a+1;
			swap(A[a],A[j]);
		}
	}
		swap(A[a+1],A[r]);
		return a+1;

}
void Rand_Quicksort(int A[],int left,int right,int &cmp)
{

	if(left<right)
	{
		int q=Rand_partition(A,left,right,cmp);
		Rand_Quicksort(A,left,q-1,cmp);
		Rand_Quicksort(A,q+1,right,cmp);
	}
}
void display(int A[],int size)
{
	for(int i=0;i<size;i++)
	{
		cout<<A[i]<<" ";
	}
}
int main()
{
	int *arr,n,cmp=0;
	ofstream fout;
	fout.open("quick.txt",ios::out);
	cout<<"\t\t--------------------------------------------------------------------------------";
	cout<<"\n\t\t\t\t\t\tHEAP SORT ALGORITHM";
	cout<<"\n\t\t--------------------------------------------------------------------------------";
	for(int i=0;i<100;i++)
	{
		cmp=0;
		n=rand()%970+30;//size =[30,100]
		cout<<"\n Array size is :"<<n;	
		arr=new int[n];
		for(int j=0;j<n;j++)
		{
			arr[j]=rand()%300+1;//randomly inputing the array elements
		}
		Rand_Quicksort(arr,0,n-1,cmp);
		delete arr;
		fout<<n<<"\t"<<cmp<<"\n";
		cout<<"\t\t\t\tNo of Comparisons are : "<<cmp;	
	
	}
	fout.close();
	cout<<"\n\nQuick Sort Algorithm executed successfully ";
	return 0;
}
