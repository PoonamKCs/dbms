#include<iostream>
#include<stdlib.h>
#include<fstream>
#define INF 100000;
using namespace std;

int Merge(int A[],int l,int q,int r,int& cmp)
{
	int i,j;
	//n1,n2 be the no of elements in left and right subarrays
	int n1=q-l+1;
	int n2=r-q;
	int L[n1];
	int R[n2];
	//int* L=new int[n1];
	//int* R=new int[n2];
	for(i=0;i<n1;i++)
	{
		L[i]=A[l+i];
	}
	for( j=0;j<n2;j++)
	{
		R[j]=A[q+j+1];
	}
	L[n1]=INF ;
	R[n2]=INF;
	i=0;
	j=0;
	for(int k=l;k<=r;k++)
	{
		cmp++;
		if(L[i]<=R[j])
		{
			A[k]=L[i++];
		}
		else
		{
			A[k]=R[j++];
		}
	}
	
}
void Merge_Sort(int A[],int left,int right,int& cmp)
{
	if(left<right)
	{
		int q=(left+right)/2;
		Merge_Sort(A,left,q,cmp);
		Merge_Sort(A,q+1,right,cmp);
		Merge(A,left,q,right,cmp);
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
	fout.open("merge.txt",ios::out);
	cout<<"\t\t--------------------------------------------------------------------------------";
	cout<<"\n\t\t\t\t\t\tMERGE SORT ALGORITHM";
	cout<<"\n\t\t--------------------------------------------------------------------------------";
	for(int i=0;i<100;i++)
	{
		//initial no of comparison for each array is 0
		cmp=0;  
		//size =[30,100]
		n=rand()%900;
		cout<<"\n Array size is :"<<n;	
		arr=new int[n];
		for(int j=0;j<n;j++)
		{
			//randomly inputing the array elements
			arr[j]=rand()%300+1;
		}
		Merge_Sort(arr,0,n-1,cmp);
		//cout<<"\n Sorted Array : ";	
		//display(arr,n);
		delete arr;//releasing the memory space
		fout<<n<<"\t"<<cmp<<"\n";
		//writing the size and the comparisons in file
		cout<<"\t\t\t\t No of Comparisons are : "<<cmp;	
	
	}
	fout.close();//closing the file
	cout<<"\n Merge sort Algorithm executed successfully ";
	return 0;
}

