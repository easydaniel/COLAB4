#include <iostream>
#include <stdio.h>
#include <math.h>
#include <vector>

using namespace std;

struct cache_content{
	bool v;
	unsigned int ts;
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
	int index_size = (cache_size / block_size) / way;
	int index_bit = (int) log2(index_size);

	vector<vector<cache_content>> cache(index_size, vector<cache_content>(way));
	for (size_t i = 0; i < index_size; i++) {
		for (size_t j = 0; j < way; j++) {
			cache[i][j].v = false;
			cache[i][j].ts = 0;
		}
	}

  FILE * fp=fopen((select ? "LU.txt" : "RADIX.txt"),"r");					//read file
	while(fscanf(fp,"%x",&x)!=EOF){

		// cout<<hex<<x<<" ";
		index = (x >> offset_bit) & (index_size - 1);
		tag = x >> (index_bit + offset_bit);
		bool hit = false;
		for (size_t i = 0; i < cache[index].size(); i++) {
			if (cache[index][i].v && tag == cache[index][i].tag) {
				// hit
				hit = true;
				cache[index][i].ts = count;
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
					cache[index][i].ts = count;
					break;
				}
				if (cache[index][i].ts < cache[index][LRU].ts) {
					LRU = i;
				}
			}
			if (full) {
				cache[index][LRU].tag = tag;
				cache[index][LRU].ts = count;
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
