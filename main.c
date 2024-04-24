#include "gimli_KAT.h"
void putc_(char c) {
	*(char *)(0x10000000) = c;
}

void puts_(char *c) {
	char b;
	while (b=*c++)
		putc_(b);
	putc_('\n');
}


void putc_hex_byte(unsigned char c) {
	const char *alphabet = "0123456789abcdef";
	putc_(alphabet[(c>>4)&0xf]);
	putc_(alphabet[c&0xf]);
}

void puts_hex(unsigned char *c,int n) {
	char b;
	for (int i = 0; i < n; i++)
		putc_hex_byte(c[i]);
	puts_("");
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

	for (int i = 0; i < 1; i++) {
		unsigned int *in = (unsigned int*)(gimli_KAT+2*i*48);
		cpy(buf,in,48);
		puts_("=============");
		puts_hex((unsigned char *)buf,48);
		gimli(buf);
		puts_hex((unsigned char *)buf,48);
		puts_("=============");
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
