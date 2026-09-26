/* startup_1 — Diablo PSX (Climax 1998) reconstruction: the two VERSION.CPP functions linked into this
 * segment (the rest of VERSION.CPP is recon/source/version.cpp).  GetVersionString turns the
 * compile __DATE__/__TIME__ into "MMMYYDD.HHMM"; GetWord hashes that date/time (minutes since
 * year 0, in 6-hour steps) into one of the 118 code words shown with the version. */
#include "diabpsx_types.h"

struct MONTH_DAYS {   /* sizeof 8 */
    char *Month;
    int Days;
};

extern "C" {
void *memcpy(void *dst, const void *src, unsigned int n);
char *strcpy(char *dst, const char *src);
int strcmp(const char *a, const char *b);
void DBG_Error(char *Text, char *File, int Line);
}
void strupr(char *Buffa);
int CharPair2Num(char *Str);

extern struct MONTH_DAYS MonDays[12];
extern char *Words[118];
int Year;
int Day;

/* @0x800B0A18 VERSION.CPP:252 */
char *GetVersionString(char *VersionString2)
{
    char VersionString[40];

    memcpy(&VersionString[0], __DATE__, 3);       /* "May" */
    memcpy(&VersionString[3], __DATE__ + 9, 2);   /* year */
    memcpy(&VersionString[5], __DATE__ + 4, 2);   /* day */
    if (VersionString[5] == ' ')
        VersionString[5] = '0';
    VersionString[7] = '.';
    memcpy(&VersionString[8], __TIME__, 2);       /* hours */
    memcpy(&VersionString[10], __TIME__ + 3, 2);  /* minutes */
    VersionString[12] = 0;
    strupr(VersionString);
    strcpy(VersionString2, VersionString);
    return VersionString2;
}

/* @0x800B0AEC VERSION.CPP:299 */
char *GetWord(char *VStr)
{
    BOOL Found;
    char MonStr[4];
    int DayCount;
    int Minutes;

    Year = CharPair2Num(&VStr[3]);
    Day = CharPair2Num(&VStr[5]);
    DayCount = 0;
    memcpy(MonStr, VStr, 3);
    MonStr[3] = 0;
    Found = 0;
    for (int i = 0; i < 12 && !Found; i++) {
        if (!strcmp(MonDays[i].Month, MonStr))
            Found = 1;
        else
            DayCount += MonDays[i].Days;
    }
    if (!Found)
        DBG_Error(NULL, "source/VERSION.cpp", 325);
    DayCount += Day;
    DayCount += Year * 365;
    Minutes = DayCount * 24 * 60;
    Minutes += CharPair2Num(&VStr[8]) * 60;
    Minutes += CharPair2Num(&VStr[10]);
    return Words[(Minutes / 360) % 118];
}
