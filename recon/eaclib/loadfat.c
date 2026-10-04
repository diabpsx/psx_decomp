/* EACLIB LOADFAT.C -- load a whole file to a caller-supplied address (cache aware).
 * Source twin: NFS2 PC beta eaclib loadfat.c (win\obja\loadfat.obj): same three entry points.  The PSX member
 * drops the PC waitstreamtoppedup() calls and instead tops up the stream with the seek time from the
 * current CD position to the file plus 1/270 ms per byte, then releases the stream I/O reservation. */
#define LIBTEXT __attribute__((section(".text.lib")))

extern void *checkcacheadr(char *name);
extern void blockmove(void *source, void *dest, int size);
extern int memsizeadr(void *address);
extern void purgememadr(void *address);
extern int openhandlea(char *name, int *handle, int *offset, int *size, int abort);
extern int handlesector(int handle);
extern int readhandle(int handle, void *buffer, int size);
extern int libclosehandle(int handle);
extern void loadfiletopup(int msecs);
extern void reserveioforstream(void);
extern int returnseekmsecs(int fromsector, int tosector);
extern int asyncsector;
extern int loadfilesize;

void *loadfileatadra(char *name, void *address, int abort) LIBTEXT;
void *loadfileatadr(char *name, void *address) LIBTEXT;
void *loadfileatadrz(char *name, void *address) LIBTEXT;

void *loadfileatadra(char *name, void *address, int abort)
{
    void *cached;
    int handle;
    int offset;
    int size;

    cached = checkcacheadr(name);
    if (cached) {
        blockmove(cached, address, memsizeadr(cached));
        purgememadr(cached);
        return cached;
    }
    openhandlea(name, &handle, &offset, &size, abort);
    if (!size)
        return 0;
    loadfiletopup(size / 270 + returnseekmsecs(asyncsector, handlesector(handle)));
    readhandle(handle, address, size);
    loadfilesize = size;
    libclosehandle(handle);
    reserveioforstream();
    return address;
}

void *loadfileatadr(char *name, void *address)
{
    return loadfileatadra(name, address, 1);
}

void *loadfileatadrz(char *name, void *address)
{
    return loadfileatadra(name, address, 0);
}
