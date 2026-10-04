/* EACLIB FILEXIST.C -- does a file exist (non-aborting open).
 * Source twin: NFS2 PC beta eaclib filexist.c. */
#define LIBTEXT __attribute__((section(".text.lib")))

extern int openhandlez(char *name, int *handle, int *offset, int *size);
extern void libclosehandle(int handle);

int fileexists(char *name) LIBTEXT;

int fileexists(char *name)
{
    int handle;
    int offset;
    int size;

    openhandlez(name, &handle, &offset, &size);
    if (handle) {
        libclosehandle(handle);
        handle = 1;
    }
    return handle;
}
