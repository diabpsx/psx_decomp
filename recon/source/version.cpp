/* VERSION.CPP — Diablo PSX (Climax 1998) reconstruction.  No PC twin (the PC build's version comes
 * from the resource file): builds the "VERSION / CODEWORD" string shown by the front end from the
 * compile date.  GetVersionString/GetWord were linked into the startup_1 segment
 * (recon/source/startup_1.cpp); this object holds the three functions of segment version. */
#include "diabpsx_types.h"

extern "C" int sprintf(char *buf, const char *fmt, ...);
char *GetVersionString(char *VersionString2);
char *GetWord(char *VStr);

extern char MyVerString[120];

/* @0x800826A0 VERSION.CPP:230 */
void VER_InitVersion(void)
{
    char VerString[120];

    GetVersionString(VerString);
    sprintf(MyVerString, "VERSION\n%s\n\nCODEWORD\n%s", VerString, GetWord(VerString));
}

/* @0x800826E4 VERSION.CPP:241 */
char *VER_GetVerString(void)
{
    return MyVerString;
}

/* @0x800826F4 VERSION.CPP:285 */
int CharPair2Num(char *Str)
{
    return (Str[0] - '0') * 10 + (Str[1] - '0');
}
