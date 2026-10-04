/* EACLIB FILENAME.C -- return the name part of a path (after the last backslash, ':' or '/').
 * Source twin: NFS2 PC beta win\obja\filename.obj (filename.c); same algorithm.
 * The retail object reads the path bytes with lbu: EA built this library with the PsyQ
 * default unsigned plain char, so under this lane's -fsigned-char the text is spelled
 * unsigned char (identical code; plain char plus -funsigned-char also matches). */
#define LIBTEXT __attribute__((section(".text.lib")))

unsigned char *filename(unsigned char *name) LIBTEXT;

unsigned char *filename(unsigned char *name)
{
    unsigned char *base = name;

    while (*name) {
        if (*name == '\\' || *name == ':' || *name == '/')
            base = name + 1;
        ++name;
    }
    return base;
}
