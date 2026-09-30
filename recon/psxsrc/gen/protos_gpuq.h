/* prototypes of GPUQ.CPP callees (tools/symhdr.py proto ...) */
extern "C" void *GAL_Lock(long Handle);   /* @0x80021774 GAL.C:466 */
extern "C" unsigned char GAL_Free(long Handle);   /* @0x80021860 GAL.C:544 */
extern "C" unsigned char GAL_Unlock(long Handle);   /* @0x800217DC GAL.C:501 */
extern "C" void DBG_Error(char *Text, char *File, int Line);   /* @0x80020E94 GDEBUG.C:146 */
