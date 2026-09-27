/* LIGHTING.CPP calls no cross-TU functions (verified against every asm/nonmatchings/lighting/*.s
 * oracle -- FreeLightTable/InitLightTable/MakeLightTable are literal `jr ra; nop` stubs in this
 * build, and every other call target is another function inside this same TU). */
unsigned long GU_GetRnd(void);   /* @0x80020CF4 GUTILS.C:76 */
