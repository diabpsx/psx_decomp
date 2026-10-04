/* EACPSXZ TEXTCRNT.C -- field writers.
 * Source twin: NFS4 EACLIB reconstruction; both retail bodies are identical. */
#define LIBTEXT __attribute__((section(".text.lib")))

void putm(int dst, unsigned int val, int n) LIBTEXT;
void puti(unsigned char *buf, unsigned int val, int n) LIBTEXT;

void putm(int dst, unsigned int val, int n)
{
    int i = n - 1;
    unsigned char *p = (unsigned char *)(dst + i);
    for (; -1 < i; i = i - 1) {
        *p = (unsigned char)val;
        val = val >> 8;
        p = p - 1;
    }
}

void puti(unsigned char *buf, unsigned int val, int n)
{
    while (n = n - 1, -1 < n) {
        *buf = (unsigned char)val;
        val = val >> 8;
        buf = buf + 1;
    }
}
