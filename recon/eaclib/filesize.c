/* EACLIB FILESIZE.C -- size of a file through the handle layer.
 * Source twin: NFS2 PC beta eaclib filesize.c (PSX closes only a nonzero handle). */
#define LIBTEXT __attribute__((section(".text.lib")))

extern int openhandlea(char *name, int *handle, int *offset, int *size, int abort);
extern void libclosehandle(int handle);

int filesize(char *name) LIBTEXT;
int filesizez(char *name) LIBTEXT;
int filesizea(char *name, int abort) LIBTEXT;

int filesize(char *name)
{
    return filesizea(name, 1);
}

int filesizez(char *name)
{
    return filesizea(name, 0);
}

int filesizea(char *name, int abort)
{
    int handle;
    int offset;
    int size;

    openhandlea(name, &handle, &offset, &size, abort);
    if (handle)
        libclosehandle(handle);
    return size;
}
