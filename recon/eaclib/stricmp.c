/* EACLIB STRICMP.C -- case-insensitive string compare (tail-recursive form).
 * Source twins: NFS4 EACPSXZ stricmp.c (same member, gcc 2.8 era); NFS2 PC beta stricmp.c
 * (Watcom CLIB, iterative).  Plain char is spelled unsigned char: EA built this library
 * with the PsyQ default unsigned plain char (lbu loads). */
#define LIBTEXT __attribute__((section(".text.lib")))

#define LOWER(c) (((c) >= 'A' && (c) <= 'Z') ? (c) + 0x20 : (c))

int stricmp(unsigned char *s1, unsigned char *s2) LIBTEXT;

int stricmp(unsigned char *s1, unsigned char *s2)
{
    int diff;

    diff = LOWER(*s1) - LOWER(*s2);
    if (diff == 0 && *s1 != 0)
        return stricmp(s1 + 1, s2 + 1);
    return diff;
}

/* strnicmp: the same member (retail pulls it with stricmp although no caller survives). */
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
