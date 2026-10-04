/* EACLIB CALLBACK.C -- the load-file post-processing hook cell (data-only member).
 * Source twins: NFS2 PC beta eaclib callback.c (win\obja\callback.obj) and NFS4 eacpsxz callback.c, both the
 * loadfilecallback cell alone.  Retail .sdata 0x8011C498, between loadcall.obj's and seekmsec's small data;
 * initloadfilecallback (loadcall.c) installs eacloadfilecallback here. */
typedef char *MEMBLOCK;

MEMBLOCK *(*loadfilecallback)(MEMBLOCK *block, char *name, unsigned int flags, int abort) = 0;
