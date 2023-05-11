#include<iostream>
#include<fstream>
#include<stdlib.h>
using namespace std;
class heap_sort{
	int n,heapsize;
	int *arr;
	public:
	heap_sort(int size);
	~heap_sort();
	void display();
	void input();
	void build_maxheap(int &comp);
	void max_heapify(int i,int &comp);
	void heapsort(int &comp);
};
heap_sort::heap_sort(int size)
{
	n=size;
	arr=new int[n];
	heapsize=n;
}
heap_sort::~heap_sort()
{
	delete arr;
}
void heap_sort::max_heapify(int i,int &comp)
{ 	 
	int largest=i;
	do
	{
		i=largest;
		int l=2*i+1;
		int r=2*i+2;
		if(l<heapsize)
		{
			comp++;
			if(arr[l]>arr[i])
			{
			largest=l;	
			}
			else
			{
				largest=i;
			}
		}
		if(r<heapsize)
		{
			comp++;
			if(arr[r]>arr[largest])
				largest=r;	
		}
		if(largest!=i)
			swap(arr[i],arr[largest]);
	}while(i!=largest);
}
void heap_sort::build_maxheap(int &comp)
{
	int i;
	if(n%2==0)
	{
		i=n/2;
	}
	else
	{
		i=n/2-1;
	}
	for(int j=i-1;j>=0;j--)
	{
		max_heapify(j,comp);
	}
}
void heap_sort::heapsort(int& comp)
{
	build_maxheap(comp);
	while(heapsize>1)
	{
		swap(arr[0],arr[heapsize-1]);
		heapsize--;
		max_heapify(0,comp);
	}
}
void heap_sort::input()
{
	for(int j=0;j<n;j++)
		{
		
		     //randomly inputing the array elements
			arr[j]=rand()%300+1;
		}
}
void heap_sort::display()
{
	cout<<"Sorted array : ";	
	for(int i=0;i<n;i++)
	{
		cout<<arr[i]<<" ";
	}
}
int main()
{
	int *arr,n,comp=0;
	ofstream fout;
	fout.open("heap.txt",ios::out);
    cout<<"\t\t--------------------------------------------------------------------------------";
	cout<<"\n\t\t\t\t\t\tHEAP SORT ALGORITHM";
	cout<<"\n\t\t--------------------------------------------------------------------------------";
	for(int i=0;i<100;i++)
	{
		comp=0;        // initial no of comparison for each array is 0
		n=rand()%900; //size =[30,100]
		cout<<"\n Array size is :"<<n;	
		heap_sort h(n);
		h.input();
		h.heapsort(comp);
	
		fout<<n<<"\t"<<comp<<"\n";            
		cout<<"\t\t\t\tNo of Comparisons are : "<<comp;	
	
	}
	fout.close();
	cout<<"\n\nHeap Sort Algorithm executed successfully ";
	return 0;
}
