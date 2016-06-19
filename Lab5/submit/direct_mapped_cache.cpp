#include <iostream>
#include <stdio.h>
#include <math.h>

using namespace std;

struct cache_content{
	bool v;
	unsigned int  tag;
};

const int K=1024;

double log2( double n )
{
    // log(n)/log(2) is log2.
    return log( n ) / log(double(2));
}


void simulate(int cache_size, int block_size, int select){
	unsigned int tag,index,x;
	unsigned int count = 0, miss = 0;

	int offset_bit = (int) log2(block_size);
	int index_bit = (int) log2(cache_size/block_size);
	int line= cache_size>>(offset_bit);

	cache_content *cache =new cache_content[line];
   //cout<<"cache line:"<<line<<endl;

	for(int j=0;j<line;j++)
		cache[j].v=false;

  FILE * fp=fopen((select ? "ICACHE.txt" : "DCACHE.txt"),"r");					//read file
	while(fscanf(fp,"%x",&x)!=EOF){

		// cout<<hex<<x<<" ";
		index=(x>>offset_bit)&(line-1);
		tag=x>>(index_bit+offset_bit);
		if(cache[index].v && cache[index].tag==tag){
			cache[index].v=true; 			//hit
		}
		else{
			cache[index].v=true;			//miss
			cache[index].tag=tag;
      miss++;
		}
		count++;
	}

	printf("      Miss rate %f%%\n", (count == 0 ? 0 : double(miss) * 100 /count));
	fclose(fp);

	delete [] cache;
}

int main(){
	// Let us simulate 4KB cache with 16B blocks
	for (size_t i = 6; i < 10; i++) {
		printf("Cache size %zu\n", 1 << i);

		puts("  ICACHE");
		for (size_t j = 2; j < 6; j++) {
			printf("    Block Size %zu\n", 1 << j);
			simulate(1 << i, 1 << j, 0);
		}
		puts("  DCACHE");
		for (size_t j = 2; j < 6; j++) {
			printf("    Block Size %zu\n", 1 << j);
			simulate(1 << i, 1 << j, 1);
		}
	}

}
