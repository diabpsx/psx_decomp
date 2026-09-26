/* LIGHTING.CPP calls no cross-TU functions (verified against every asm/nonmatchings/lighting/*.s
 * oracle -- FreeLightTable/InitLightTable/MakeLightTable are literal `jr ra; nop` stubs in this
 * build, and every other call target is another function inside this same TU). */
