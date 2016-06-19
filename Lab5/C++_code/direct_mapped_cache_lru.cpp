#include <iostream>
#include <stdio.h>
#include <math.h>
#include <vector>

using namespace std;

struct cache_content{
	bool v;
	unsigned int count;
	unsigned int tag;
};

const int K=1024;

double log2( double n )
{
    // log(n)/log(2) is log2.
    return log( n ) / log(double(2));
}


void simulate(int cache_size, int block_size, int select, int way){
	unsigned int tag,index,x;
	unsigned int count = 0, miss = 0;

	int offset_bit = (int) log2(block_size);
	int index_bit = (int) log2(cache_size/way);
	int line= cache_size>>(offset_bit);
	int setSZ = (line / way);

	vector<vector<cache_content>> cache(way, vector<cache_content>(setSZ));
	for (size_t i = 0; i < way; i++) {
		for (size_t j = 0; j < setSZ; j++) {
			cache[i][j].v = false;
		}
	}

  FILE * fp=fopen((select ? "LU.txt" : "RADIX.txt"),"r");					//read file
	while(fscanf(fp,"%x",&x)!=EOF){

		// cout<<hex<<x<<" ";
		index=(x>>offset_bit)&(way-1);
		tag=x>>(index_bit+offset_bit);
		bool hit = false;
		for (size_t i = 0; i < cache[index].size(); i++) {
			if (cache[index][i].v && tag == cache[index][i].tag) {
				// hit
				hit = true;
				cache[index][i].count++;
				break;
			}
		}
		if (!hit) {
			miss++;
			bool full = true;
			int LRU = 0;
			for (size_t i = 0; i < cache[index].size(); i++) {
				if (!cache[index][i].v) {
					full = false;
					cache[index][i].v = true;
					cache[index][i].tag = tag;
					cache[index][i].count = 1;
					break;
				}
				if (cache[index][i].count < cache[index][LRU].count) {
					LRU = i;
				}
			}
			if (full) {
				cache[index][LRU].tag = tag;
				cache[index][LRU].count = 1;
			}
		}
		count++;
	}

	printf("      Miss rate %.4f%%\n", (count == 0 ? 0 : double(miss) * 100 /count));
	fclose(fp);

}

int main(){
	// Let us simulate 4KB cache with 16B blocks
	for (size_t i = 0; i <= 5; i++) {
		printf("Cache Size: %dK bytes\n", (1 << i));
		puts("  LU");
		for (size_t j = 1; j <= 8; j <<= 1) {
			printf("    %zu-way\n", j);
			simulate((1 << i) * K, (1 << 6), 0, j);
		}
		puts("  RADIX");
		for (size_t j = 1; j <= 8; j <<= 1) {
			printf("    %zu-way\n", j);
			simulate((1 << i) * K, (1 << 6), 1, j);
		}
	}
}
