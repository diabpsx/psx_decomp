#ifndef PSXSRC_SYSOBJ_H
#define PSXSRC_SYSOBJ_H
/* SYSOBJ.CPP — Climax system object base (SYM: struct SysObj, size 4). */
struct SysObj {
    long MemHnd;   /* +0x00 (SYM) */
    static long NewHnd;

    SysObj();
    void *operator new(int Amount);
    void *operator new(int Amount, unsigned long RamID);   /* allocates and locks a GAL block of that RamID */
    void operator delete(void *ptr);
};
#endif
