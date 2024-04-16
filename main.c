#include "gimli_KAT.h"
void putc_(char c) {
	*(char *)(0x10000000) = c;
}

void puts_(char *c) {
	char b;
	while (b=*c++)
		putc_(b);
}

void cpy(unsigned int *dst, unsigned int *src, unsigned int cnt) {
	for (int i = 0; i < cnt; i++) {
		dst[i] = src[i];
	}
}

int cmp(unsigned int *a, unsigned int *b, unsigned int cnt) {
	int ret = 0;
	for (int i = 0; i < cnt; i++) {
		ret += a[i]^b[i];
	}
	return ret;
}
unsigned int *gimli(unsigned int *);


void main() {
	int ret=0; 
	unsigned int buf [48];
	puts_("Hello World\n");

	for (int i = 0; i < 100; i++) {
		unsigned int *in = (unsigned int*)(gimli_KAT+2*i*48);
		cpy(buf,in,48);
		gimli(buf);
		if(ret|=cmp(buf,in+12,12)) {
			puts_("-");
		} else {
			puts_(".");
		}

	}

	if (ret == 0) {
		puts_("SUCCESS");
	} else {
		puts_("FAIL!");
	}
	puts_("\n");
}
