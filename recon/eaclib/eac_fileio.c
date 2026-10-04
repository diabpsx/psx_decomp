/* Repository file name eac_fileio.c: EA's member is FILEIO.C; the prefix only avoids a registry/segment
 * key collision with the game TU recon/psxsrc/fileio.cpp (same stem). */
/* EACPSXZ psx/fileio.c -- host (PC dev link) and CD-ROM file handles.
 * Retail abort strings name "psx/fileio.c".  Twin: the NFS2 PC beta
 * eaclib/fileio.c (Win32 variant of the same member: ufname/bigbufptr/
 * locatebigoffsetzvect/biglenvect/bigheaderlen globals, openhandlea retry,
 * the openhandle/openhandlez wrappers); the PSX bodies are reconstructed from
 * the retail oracle. */
#define LIBTEXT __attribute__((section(".text.lib")))

extern char *abortfile;
extern int abortline;
extern void abortmessage(char *fmt, ...);
extern void print(char *fmt, ...);
extern int sprintf(char *buf, const char *fmt, ...);
extern char *strcpy(char *, const char *);
extern char *strcat(char *, const char *);
extern char *strchr(const char *, int);
extern int strncmp(const char *, const char *, int);
extern int strlen(const char *);
extern int open(char *name, int mode);
extern int close(int fd);
extern int read(int fd, void *buf, int len);
extern int write(int fd, void *buf, int len);
extern int lseek(int fd, int offset, int whence);
extern void _96_init(void);
extern int disablecd;
extern int openblockhandlea(char *name, int *handle, int *offset, int *size, int *blocksize, int abort);
extern void closeblockhandle(int handle);
extern int readblockhandle(int handle, char *buf, int len);
extern int seekblockhandle(int handle, int offset);

char ufname[128] = { 0 };
char currentdirectory[64] = "sim:";
void *bigbufptr = 0;
int (*locatebigoffsetzvect)(void *buffer, char *name) = 0;
int *biglenvect = 0;
int bigheaderlen = 0;

int PCfilelen(int handle) LIBTEXT;
void initfileio(void) LIBTEXT;
void setdirectory(char *dir) LIBTEXT;
void getdirectory(char *dir) LIBTEXT;
int openhandlea(char *name, int *handle, int *offset, int *size, int abort) LIBTEXT;
int openhandle(char *name, int *handle, int *offset, int *size) LIBTEXT;
int openhandlez(char *name, int *handle, int *offset, int *size) LIBTEXT;
int openhandlewa(char *name, int *handle, int *offset, int *size, int abort) LIBTEXT;
int openhandlew(char *name, int *handle, int *offset, int *size) LIBTEXT;
void libclosehandle(int handle) LIBTEXT;
int readhandle(int handle, void *buf, int len) LIBTEXT;
int writehandle(int handle, void *buf, int len) LIBTEXT;
int seekhandle(int handle, int offset) LIBTEXT;

int PCfilelen(int handle)
{
    int lo;
    int hi;
    int mid;
    char c;

    lo = 0;
    hi = 0x7fffffff;
    do {
        mid = (hi - lo) / 2;
        if (mid > 0x400000)
            mid = 0x400000;
        mid += lo;
        lseek(handle, mid, 0);
        if (read(handle, &c, 1))
            lo = mid;
        else
            hi = mid;
    } while (lo + 1 < hi);
    if (hi <= 0) {
        abortfile = "psx/fileio.c";
        abortline = 63;
        abortmessage("openhandle - ERROR DETERMINING FILE SIZE\n");
    }
    return hi;
}

void initfileio(void)
{
    _96_init();
}

void setdirectory(char *dir)
{
    int len;
    unsigned char *p;

    currentdirectory[0] = 0;
    if (strchr(dir, ':') == 0 && strchr(dir, '\\') != 0)
        strcpy(currentdirectory, disablecd ? "sim:" : "cdrom:");
    strcat(currentdirectory, dir);
    len = strlen(currentdirectory);
    if (len) {
        p = (unsigned char *)currentdirectory + len - 1;
        if (*p != '\\' && *p != ':')
            strcpy((char *)p + 1, "\\");
    }
}

void getdirectory(char *dir)
{
    strcpy(dir, currentdirectory);
}

int openhandlea(char *name, int *handle, int *offset, int *size, int abort)
{
    int retry;
    int len;
    int pos;
    int result;
    char filename[280];
    int blocksize;

    len = 0;
    retry = 10;
    result = 0;
    if (strncmp(currentdirectory, "cdrom:", 6) == 0)
        return openblockhandlea(name, handle, offset, size, &blocksize, abort);
    do {
        *handle = 0;
        *offset = 0;
        *size = 0;
        if (strchr(name, '\\') == 0 && strchr(name, ':') == 0)
            sprintf(filename, "%s%s", currentdirectory, name);
        else {
            if (strchr(name, ':') == 0)
                strcpy(filename, "sim:");
            else
                filename[0] = 0;
            strcat(filename, name);
        }
        *handle = open(filename, 1);
        if (*handle > 0) {
            len = PCfilelen(*handle);
            pos = lseek(*handle, 0, 0);
        }
        if (len == 0 || pos != 0) {
            if (--retry == 0 && abort) {
                abortfile = "psx/fileio.c";
                abortline = 360;
                abortmessage("openhandlea - OPEN ERROR %s\n", filename);
            }
            if (*handle > 0)
                libclosehandle(*handle);
            *handle = 0;
            len = 0;
            print("openhandlea - OPEN ERROR %s  RETRY\n", filename);
        } else {
            if (retry != 10)
                print("openhandlea - OPEN SUCCESSFUL %s  DONE\n", filename);
            retry = 0;
            result = 1;
        }
    } while (retry);
    *size = len;
    return result;
}

int openhandle(char *name, int *handle, int *offset, int *size)
{
    return openhandlea(name, handle, offset, size, 1);
}

int openhandlez(char *name, int *handle, int *offset, int *size)
{
    return openhandlea(name, handle, offset, size, 0);
}

int openhandlewa(char *name, int *handle, int *offset, int *size, int abort)
{
    char filename[80];

    *handle = 0;
    *offset = 0;
    *size = 0;
    if (strncmp(name, "cdrom:", 6) == 0 || strncmp(name, "sim:", 6) == 0) {
        if (abort) {
            abortfile = "psx/fileio.c";
            abortline = 411;
            abortmessage("openhandlew - FILENAME SHOULD NOT INCLUDE A DEVICE NAME '%s'\nUSE A SIMPLE FILE OR PATHNAME\n", name);
        }
        return 0;
    }
    sprintf(filename, "sim:%s", name);
    *handle = open(filename, 0x203);
    if (*handle < 0) {
        if (abort) {
            abortfile = "psx/fileio.c";
            abortline = 422;
            abortmessage("openhandlew - %s FILE ERROR\n", filename);
        }
        return 0;
    }
    *offset = 0;
    *size = 0;
    return 1;
}

int openhandlew(char *name, int *handle, int *offset, int *size)
{
    return openhandlewa(name, handle, offset, size, 1);
}

void libclosehandle(int handle)
{
    if (handle > 0) {
        if (strncmp(currentdirectory, "cdrom:", 6) == 0)
            closeblockhandle(handle);
        else
            close(handle);
    }
}

int readhandle(int handle, void *buf, int len)
{
    int result;

    result = 1;
    if (strncmp(currentdirectory, "cdrom:", 6) == 0)
        readblockhandle(handle, (char *)buf, len);
    else
        result = read(handle, buf, len);
    return result;
}

int writehandle(int handle, void *buf, int len)
{
    return write(handle, buf, len);
}

int seekhandle(int handle, int offset)
{
    if (strncmp(currentdirectory, "cdrom:", 6) == 0)
        seekblockhandle(handle, offset);
    else
        offset = lseek(handle, offset, 0);
    return offset;
}
