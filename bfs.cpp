#include<iostream>
#include<queue>
using namespace std;

class node{
			int val;
			node* next;	
	public:	
		node(int a=0,node* ptr=0)
	{
		val=a;
		next=ptr;
	}
	friend class graph;
	friend class sll;
};
class sll{
	node* head;
	public:	sll(node* ptr=0)
	{
		head=ptr;
	}
	~sll();
	void insertathead(int element);
	void display();
	friend class graph;
};
class graph{
	int size_v;
	sll* adjacency_list;
	int *distance;
	int *discovered;
	int *parent;
	public:
	graph(int V);
	void input();
	void show();
	void BFS(int s);
	void display_info();
	int check(int c);
	void path_find(int u,int v);
};
graph::graph(int V)
{
	size_v=V;
	adjacency_list=new sll[size_v];
	distance= new int[size_v];
	discovered=new int[size_v];
	parent=new int[size_v];
}
void graph::input()
{
	int a=0,b,count;
	
	for(int i=0;i<size_v;i++)
	{
		
		cout<<"\n Enter the No of edges connected from the VERTEX "<<i+1<<" : ";
		cin>>count;
		cout<<" Enter the adjacent vertices of VERTEX "<<i+1<<" : ";
		for(int j=0;j<count;j++)
		{
			cin>>b;
			if(check(b))
			{
				adjacency_list[i].insertathead(b);	
			}
			else
			{
				cout<<"Vertex "<<b<<" Not Belongs in Vertex set";
				cout<<" Enter the adjacent vertices of VERTEX "<<i+1<<" : ";
				cin>>b;
				if(check(b))
			{
				adjacency_list[i].insertathead(b);	
			}
			}	
		}
		adjacency_list[i].insertathead(++a);
	}
}
graph::check(int c)
{
	for(int i=1;i<=size_v;i++)
	{
			if(c==i)
			return 1;
	}	
	return 0;
}
void graph::BFS(int s)
{	
	int u;
	queue<int> q;
	for(int i=0;i<size_v;i++)
	{
		discovered[i]=0;
		distance[i]=-1;
		parent[i]=0;	
	}	
	discovered[s-1]=1;
	distance[s-1]=0;
	parent[s-1]=0;
	q.push(s);
	while(!q.empty())
	{
		u=q.front();
		q.pop();
		node* curr;
		for(curr=adjacency_list[u-1].head;curr!=0;curr=curr->next)
		{
			int v=curr->val;
			if(discovered[v-1]==0)
			{
				discovered[v-1]=1;
				q.push(v);
				parent[v-1]=u;
				distance[v-1]=distance[u-1]+1;	
			}	
		}
		
	}
}
void graph::display_info()
{
	for(int i=0;i<size_v;i++)
	{
		cout<<"\n\n\nVertex "<<i+1<<"\nDiscovered : "<<discovered[i]<<" \t Parent : "<<parent[i]<<"\t Distance : "<<distance[i];
	}
}
void graph::show()
{
		cout<<"\n\n\n\t\t\tADJACENCY LIST OF GRAPH\n\t\t\t-------------------------\n";
	for(int i=0;i<size_v;i++)
	{
		cout<<"\t\t\t";
		adjacency_list[i].display();
	}	
}
sll::~sll()
{
	node *current;
	while(head)
	{
		current=head->next;
		delete head;
		head=current;
	}
}
void sll::display(){
	if(head)
	{
		node *current=head;
		for(;current->next;current=current->next)
		{
		cout<<current->val<<"-->";
		}
		cout<<current->val<<"\n";
	}
	return;
}
void graph::path_find(int u,int v)
{
		int i=0,count=1;
		int* path=new int[size_v];
		BFS(u);	
				if(discovered[u-1]==1&&discovered[v-1]==1)
				{
					cout<<"\n There is a path between u and v";
					while(v!=u)
					{
						path[i++]=v;
						v=parent[v-1];
						++count;	
					}
					path[i++]=u;
					cout<<"\n Path(u->v) :";
					for(int j=count-1;j>0;j--)
					{
						cout<<path[j]<<"-->";
					}
					cout<<path[0];
				}
				else
				{
					cout<<"\n There is no path ";
				}
				
				
	return ;
}
void sll::insertathead(int element){

	head = new node(element,head);
	return;
}
int main()
{
	int size_v,source,choice,u,v;
	char ch='y';
cout<<"\t\t--------------------------------------------------------------------------------";
	cout<<"\n\t\t\t\t\t\tGraph Representation (Breadth First Search)";
	cout<<"\n\t\t--------------------------------------------------------------------------------";
	cout<<"\n Enter the number of vertices : ";
	cin>>size_v;
	graph g(size_v);
	do{
	cout<<"\n Graph Menu:\n 1 : Input Graph  \n 2 : Run Bfs And Display information of all vertices \n 3 : Display Adjacency list \n 4 : Find path Between vertex u and vertex v \n 5 :Exit";
	cout<<"\n ENTER YOUR CHOICE :  ";
	cin>>choice;
	switch (choice)
	{
		case 1 :g.input();
				break;
		case 2 :cout<<"\n Enter the source(BFS) : ";
				cin>>source;
				g.check(source);
				g.BFS(source);
				g.display_info();
				break;
		case 3 : g.show();
				break;
		case 4: cout<<"\n Enter vertex u and vertex v : ";
				cin>>u>>v;
				if(g.check(u)&&g.check(v))
					{
						g.path_find(u,v);	
					}
				else
				{
					cout<<"\nWARNING!! Vertices entered not belongs to th vertex set";
				}
				break;
		case 5: exit(0);
		default:cout<<"\n WRONG CHOICE!!!!";
	}
	cout<<"\n Do you want to continue ...press Y or y : ";
	cin>>ch;
	
	}
	while(ch=='y'||ch=='Y');
	
	cout<<"\n Graph Representation using adjacency list and using BFS Successfully done !!!";
	return 1;
}
