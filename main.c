void putc_(char c) {
	*(char *)(0x10000000) = c;
}

void puts_(char *c) {
	char b;
	while (b=*c++)
		putc_(b);
}
void main() {
	puts_("Hello World\n");
}
