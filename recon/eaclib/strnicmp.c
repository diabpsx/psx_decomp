/* EACLIB STRNICMP.C -- case-insensitive compare of at most n characters (tail-recursive).
 * Source twin: NFS2 PC beta strnicmp.c (Watcom CLIB, iterative) for the contract; the EA
 * PSX member is the recursive sibling of STRICMP.C.  Plain char is spelled unsigned char
 * (EA's library build used the PsyQ default unsigned plain char). */
#define LIBTEXT __attribute__((section(".text.lib")))

#define LOWER(c) (((c) >= 'A' && (c) <= 'Z') ? (c) + 0x20 : (c))

int strnicmp(unsigned char *s1, unsigned char *s2, int n) LIBTEXT;

int strnicmp(unsigned char *s1, unsigned char *s2, int n)
{
    int diff;

    diff = LOWER(*s1) - LOWER(*s2);
    if (diff == 0 && *s1 != 0 && n != 0)
        return strnicmp(s1 + 1, s2 + 1, n - 1);
    if (n == 0)
        diff = 0;
    return diff;
}
