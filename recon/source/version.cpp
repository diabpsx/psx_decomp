/* VERSION.CPP — Diablo PSX (Climax 1998) reconstruction.  No PC twin (the PC build's version comes
 * from the resource file): builds the "VERSION / CODEWORD" string shown by the front end from the
 * compile date. The original VERSION owner supplies all five functions, the
 * word/calendar bank and its string pools. Once-only sections are grouped in
 * STARTUP; the three ordinary routines remain in VERSION_text. */
#include "diabpsx_types.h"

extern "C" int sprintf(char *buf, const char *fmt, ...);
char *GetVersionString(char *VersionString2) __attribute__((section(".text.version_startup")));
char *GetWord(char *VStr) __attribute__((section(".text.version_startup")));

struct MONTH_DAYS {
    char *Month;
    int Days;
};

/* Once-only VERSION data is grouped before its once-only functions by PSYLINK. */
char *Words[118] __attribute__((section(".rdata.version_startup"))) = { /* @0x800B07E0 */
    "CHUNKY",
    "TINKER",
    "GINGER",
    "YELLOW",
    "GREEN",
    "GOLD",
    "HAPPY LARRY",
    "MANGO CHUNTNEY",
    "SPANNER",
    "DIBBLE",
    "DOBBLE",
    "DANGLE",
    "TREBLE",
    "BIBBLE",
    "BABBLE",
    "TRIANGLE",
    "SQUARE",
    "TONTO",
    "CHORLTON",
    "CHARLIE",
    "OSCAR",
    "BRAVO",
    "DOUBLE",
    "BUBBLE",
    "TROUBLE",
    "DENNIS THE MENACE",
    "PLAP",
    "PLAPTRONICS",
    "DEMI SEMI HEMI QUAVER",
    "CHEGGLY",
    "WENKLE",
    "GAHN-DJA",
    "JUCINOB",
    "FLECKSPOT",
    "FINPLIP",
    "CABBAGE",
    "NADS",
    "HELLYWELL",
    "KHLARTY KAT",
    "THROAT",
    "MONKEY SPUNK",
    "SPUNKY MONK",
    "NEARLY THERE",
    "SID JAMES",
    "HATTIE JAQUES",
    "ERIC IDLE",
    "SYD LITTLE",
    "EDDIE LARGE",
    "CHUCKLEVISION",
    "CHUCKLECUNTS",
    "ARSEPIPE",
    "FANNY BATTER",
    "HOT BOT SLOT",
    "SAGGY FLAPS",
    "CHEDDARY CHAP",
    "JAPS EYE",
    "CHOCOLATE STARFISH",
    "RUSTY BULLETHOLE",
    "GRANDFATHER CLOCK",
    "FRENCH POLISH",
    "OOOH THE FMV DOESN'T WORK",
    "DICK EMERY",
    "YOU'LL CATCH YOUR DEATH",
    "YOU WON'T FEEL THE BENEFIT",
    "MANY A MICKLE (MACKS A MUCKLE)",
    "YOU'LL HAVE YOUR EYE OUT WITH THAT",
    "PROPER CHARLIE",
    "A RIGHT TWO AND EIGHT",
    "DING DONG MERRILY",
    "TOOTELL",
    "DAVE 4 GRAHAM",
    "GAPING GAP",
    "LARD IS LORD",
    "BIONIC ARSE",
    "JESUS WAS A BLACK MAN",
    "JESUS WAS BATMAN",
    "THAT WAS BRUCE WAYNE",
    "RANDOM LIGHT",
    "DOVE FROM ABOVE",
    "GEORGE DOORS",
    "CROW FROM BELOW",
    "GREGG MITCHEL",
    "PHIL MITCHEL",
    "GRANT MITCHEL",
    "BARBARA WINDSOR",
    "WINDSOR DAVIS",
    "IT AINT HALF HOT MUM",
    "MY WIFES GONNA KILL ME",
    "TROUT",
    "ANGEL",
    "DJANGO",
    "MARY JANE",
    "LARGE CHEST FOR SALE",
    "EASY AS PIE",
    "NICE AS PIE",
    "PIE EYED",
    "PIECE OF PISS",
    "YOU WOULDN'T LET IT LIE",
    "I WOULD'VE LET IT LIE",
    "IT'S A BIT RUNNY",
    "IN OUT SHAKE IT ALL ABOUT",
    "COUNT OF MONTE ARSEHOLE",
    "ORSON SMELLS",
    "MAGNIFICANT AMBERSONS",
    "TOUCH OF EVIL",
    "CITIZEN KANE",
    "GAWD BLIMEY MARY POPPINS",
    "ISN'T THIS FUN",
    "ARE WE HAVING FUN YET",
    "YOUR BREATH STINKS",
    "I'LL BE A MONKEY'S UNCLE",
    "GET A HAIRCUT",
    "POLYGON",
    "DON'T RUB IT",
    "YOU'LL WEAR IT OUT",
    "DING DONG MERRILY",
    "ARSE TRUMPET",
    "HIGH RES?",
};
MONTH_DAYS MonDays[12] __attribute__((section(".rdata.version_startup"))) = { /* @0x800B09B8 */
    { "JAN", 31 },
    { "FEB", 28 },
    { "MAR", 31 },
    { "APR", 30 },
    { "MAY", 31 },
    { "JUN", 30 },
    { "JUL", 31 },
    { "AUG", 31 },
    { "SEP", 30 },
    { "OCT", 31 },
    { "NOV", 30 },
    { "DEC", 31 },
};
int Year;
int Day;

char MyVerString[120] = {0};   /* Retail initialized buffer at 0x800E3C1C. */

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

extern "C" {
void *memcpy(void *, const void *, unsigned int);
char *strcpy(char *, const char *);
int strcmp(const char *, const char *);
void DBG_Error(char *, char *, int);
}
void strupr(char *Buffa);

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
