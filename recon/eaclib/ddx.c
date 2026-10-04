/* EACPSXZ DDX -- host file I/O over the development-system parallel link
 * (MMIO 0x1F060000 data in, 0x1F060008 data out, 0x1F060010 status).
 * No source twin: reconstructed from the retail bodies.  Each request is a
 * 0xFE escape plus a command letter, NUL-terminated strings and big-endian
 * longs; the host's reply long is returned.
 * Toolchain identity (measured): gcc 2.6.x/2.7.2 C generation at -O (not -O2),
 * -G0, li 0..0xFFFF as ori (ASPSX < 2.50), DOS ASPSX 2.34 byte-exact.
 * SwapByte: see the comment above its definition. */
#define LIBTEXT __attribute__((section(".text.lib")))

#define DDX_DATAIN  (*(unsigned char *)0x1F060000)
#define DDX_DATAOUT (*(unsigned char *)0x1F060008)
#define DDX_STATUS  (*(volatile unsigned char *)0x1F060010)

unsigned char SwapByte(unsigned char c) LIBTEXT;
void PutLong(unsigned long val) LIBTEXT;
long GetLong(void) LIBTEXT;
long DDXinit(void) LIBTEXT;
long DDXcreate(unsigned char *name, long mode) LIBTEXT;
long DDXopen(unsigned char *name, long mode) LIBTEXT;
long DDXclose(long handle) LIBTEXT;
long DDXread(long handle, char *buf, long len) LIBTEXT;
long DDXwrite(long handle, char *buf, long len) LIBTEXT;
long DDXlseek(long handle, long offset, long mode) LIBTEXT;
void DDXpollhost(void) LIBTEXT;
void DDXputchar(char c) LIBTEXT;

/* SwapByte evidence (retail oracle 8002326C): only the status poll is a volatile
 * MMIO access; the data ports 0x1F060000/0x1F060008 are non-volatile absolute
 * MMIO (folded lbu/sb address macros), while the received byte is held in a
 * volatile stack local that orders the read before the send: sb to 0(sp), the
 * send, then lbu 0(sp) followed by andi 0xFF.  That andi-after-lbu is the
 * volatile signature -- combine folds the zero-extension into the load for any
 * non-volatile MEM.  Falsified non-volatile forms (gcc 2.6.3 -O1, diffs):
 * byte array / struct local 3 (andi lost), address-taken local 18, all ports
 * volatile with plain local 13, send-first orders 18-19, pointer locals 12-14.
 * The volatile local was ruled in by the user on 2026-10-04 under the MMIO
 * exception (volatile local inside an MMIO function sequencing a hardware access). */
unsigned char SwapByte(unsigned char c)
{
    volatile unsigned char r;
    do {
    } while (!(DDX_STATUS & 1));
    r = DDX_DATAIN;
    DDX_DATAOUT = c;
    return r;
}

void PutLong(unsigned long val)
{
    SwapByte(val >> 24);
    SwapByte(val >> 16);
    SwapByte(val >> 8);
    SwapByte(val);
}

long GetLong(void)
{
    long val;
    val = SwapByte(1) << 24;
    val += SwapByte(2) << 16;
    val += SwapByte(3) << 8;
    return val + SwapByte(4);
}

long DDXinit(void)
{
    SwapByte(0xFE);
    SwapByte('i');
    return GetLong();
}

long DDXcreate(unsigned char *name, long mode)
{
    int i;
    SwapByte(0xFE);
    SwapByte('m');
    for (i = 0; name[i] != 0; i++)
        SwapByte(name[i]);
    SwapByte(0);
    PutLong(mode);
    SwapByte(0);
    return GetLong();
}

long DDXopen(unsigned char *name, long mode)
{
    int i;
    SwapByte(0xFE);
    SwapByte('o');
    for (i = 0; name[i] != 0; i++)
        SwapByte(name[i]);
    SwapByte(0);
    PutLong(mode);
    SwapByte(0);
    return GetLong();
}

long DDXclose(long handle)
{
    SwapByte(0xFE);
    SwapByte('c');
    PutLong(handle);
    SwapByte(0);
    return GetLong();
}

long DDXread(long handle, char *buf, long len)
{
    int i;
    if (len == 0)
        return 0;
    SwapByte(0xFE);
    SwapByte('r');
    PutLong(handle);
    PutLong(len);
    for (i = 0; i < len; i++)
        buf[i] = SwapByte(0);
    SwapByte(0);
    return GetLong();
}

long DDXwrite(long handle, char *buf, long len)
{
    int i;
    if (len == 0)
        return 0;
    SwapByte(0xFE);
    SwapByte('w');
    PutLong(handle);
    PutLong(len);
    for (i = 0; i < len; i++)
        SwapByte(buf[i]);
    SwapByte(0);
    return GetLong();
}

long DDXlseek(long handle, long offset, long mode)
{
    SwapByte(0xFE);
    SwapByte('s');
    PutLong(handle);
    PutLong(offset);
    PutLong(mode);
    SwapByte(0);
    return GetLong();
}

void DDXpollhost(void)
{
    SwapByte(0xFE);
    SwapByte('p');
    if (GetLong())
        __asm__ volatile("break 0\n\tnop");   /* host-requested debugger stop */
}

void DDXputchar(char c)
{
    SwapByte(c);
}
