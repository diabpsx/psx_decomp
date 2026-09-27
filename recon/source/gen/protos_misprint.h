/* prototypes of MISPRINT.CPP callees (tools/symhdr.py proto ...; DrawSpinner spelled from its mangling
 * FiiUcUcUciiibiT8T8Uc -- symhdr renders SpinB/SinStep as int) */
struct TextDat *GM_UseTexData(int Id);   /* @0x80093C10 GMAN.CPP:1312 */
void DrawSpinner(int x, int y, unsigned char SpinR, unsigned char SpinG, unsigned char SpinB, int spinradius, int spinbright, int angle, BOOL Sparkle, int OtPos, BOOL cross, BOOL iso, unsigned char SinStep);   /* @0x800A6A44 OPTIONS.CPP:898 */
void DrawExpl(int sx, int sy, int f, int ot, int scale, char rtint, char gtint, char btint);   /* @0x80054638 OBJECTS.CPP:892 */
void ParticleMissile(struct MissileStruct *Ms, int ScrX, int ScrY, int colour, int OtPos);   /* @0x8009FA04 DAVEL.CPP:570 */
void ParticleExp(struct MissileStruct *Ms, int ScrX, int ScrY, int colour, int OtPos);   /* @0x8009FFE8 DAVEL.CPP:665 */
void ResurrectFX(int x, int height, int scale, int OtPos);   /* @0x8009FDC0 DAVEL.CPP:645 */
