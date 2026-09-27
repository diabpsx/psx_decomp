/* GPUQ.CPP layouts -- re-derived field-by-field from the raw (asm/nonmatchings/gpuq/*.s), NOT from
 * the refs/skeleton Ghidra draft (its field names for this struct are inconsistent/wrong -- e.g. it
 * calls the SAME offset both "DiscardAfterDump" and "Offset" in different functions, and mis-locates
 * MoveImage's x/y at +0x10 when the raw clearly stores them at +0x18/+0x1A). Confirmed byte-exact:
 *   +0x00 RECT Rect        (x,y,w,h shorts -- Load/Move copy this whole span in one shot)
 *   +0x08 unsigned long Flags   bit0 UseAddr (use Addr@+0x14 directly, skip GAL_Lock)
 *                                bit1 FreeNotUnlock (cleanup via GAL_Free instead of GAL_Unlock)
 *                                bit2 IsMove (dispatch to MoveImage instead of LoadImage)
 *   +0x0C long Offset       added to the GAL_Lock'd pointer when UseAddr is clear
 *   +0x10 long Handle       GAL_Lock/GAL_Free/GAL_Unlock argument
 *   +0x14 void *Addr        direct load address when UseAddr is set (LoadClutAddr's VRAM target)
 *   +0x18 short MoveX
 *   +0x1A short MoveY       (sizeof 0x1C total -- matches the 28-byte AllArgs[] stride everywhere) */
struct LOAD_IMAGE_ARGS {
    RECT Rect;               /* +0x0 */
    unsigned long Flags;     /* +0x8 */
    long Offset;             /* +0xC */
    long Handle;             /* +0x10 */
    void *Addr;              /* +0x14 */
    unsigned short MoveX;    /* +0x18 */
    unsigned short MoveY;    /* +0x1A */
};
