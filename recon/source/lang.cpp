/* LANG.CPP — Diablo PSX (Climax 1998) reconstruction (SOURCE).  No PC twin: the language text
 * databases.  Each database (MAIN/QUEST/BACK/CRED) is a file of string offsets followed by the
 * strings; it is loaded whole, the offsets rebased to pointers, and GetStr picks the database
 * from the high bits of the string id. */
#include "diabpsx_types.h"
#include "psxsrc/textfileinfo_header.h"
#include "psxsrc/textdat_header.h"

enum LANG_TYPE {
    LANG_ENGLISH = 0,
    LANG_FRENCH = 1,
    LANG_GERMAN = 2,
    LANG_SWEDISH = 3,
    LANG_JAP = 4,
    LANG_NONE = 5
};

enum LANG_DB_NO {
    LANG_DB_MAIN = 0,
    LANG_DB_QUEST = 1,
    LANG_DB_BACK = 2,
    LANG_DB_CREDITS = 3
};

class SysObj {   /* sizeof 4 */
public:
    long MemHnd;
};

class FileIO : public SysObj {   /* sizeof 20 */
public:
    unsigned long MemId;
    long hndPath;
    char *SearchPath;
    void *_vf;
    long Read(const char *Name, unsigned long RamId);
};

extern "C" {
void TSK_Sleep(int Frames);
char *strcat(char *dst, const char *src);
}
FileIO *SYSI_GetFs(void);
bool IsKanjiLoaded(void);
bool IsGameLoading(void);
long BL_LoadFileAsync(char *Name, char RamId);
void BL_WaitForAsyncFinish(void);
void KANJI_SetDb(enum LANG_DB_NO NewLangDbNo);

void DumpCurrentText(void);
int CalcNumOfStrings(char **TPtr);
void GetLangFileName(enum LANG_TYPE NewLanguageType, char *Dest);
char *GetLangFileNameExt(enum LANG_TYPE NewLanguageType);

extern int FileSYS;
extern int CDWAIT;

enum LANG_TYPE LanguageType = LANG_NONE;
long hndText = -1;
char **TextPtr = 0;
enum LANG_DB_NO LangDbNo = LANG_DB_MAIN;
extern int NumOfStrings;

/* @0x8007B348 LANG.CPP:84 */
enum LANG_TYPE LANG_GetLang(void)
{
    return LanguageType;
}

/* @0x8007B354 LANG.CPP:92 */
void LANG_SetDb(enum LANG_DB_NO NewLangDbNo)
{
    if (LANG_GetLang() == LANG_JAP) {
        while (!IsKanjiLoaded())
            TSK_Sleep(1);
    }
    if (NewLangDbNo != LangDbNo) {
        char FileNameBuffer[40];
        FileIO *FIO;

        FIO = SYSI_GetFs();
        DumpCurrentText();
        LangDbNo = NewLangDbNo;
        GetLangFileName(LanguageType, FileNameBuffer);
        if (FileSYS != 1 && !IsGameLoading()) {
            CDWAIT = 1;
            hndText = BL_LoadFileAsync(FileNameBuffer, 0);
            if (hndText == -1)
                DBG_Error(0, "source/LANG.cpp", 138);
            BL_WaitForAsyncFinish();
            CDWAIT = 0;
        } else {
            CDWAIT = 1;
            hndText = FIO->Read(FileNameBuffer, 1);
            if (hndText == -1)
                DBG_Error(0, "source/LANG.cpp", 146);
            CDWAIT = 0;
        }
        GAL_SetMemName(hndText, "TEXTDB");
        TextPtr = (char **)GAL_Lock(hndText);
        if (!TextPtr)
            DBG_Error(0, "source/LANG.cpp", 152);
        NumOfStrings = CalcNumOfStrings(TextPtr);
        KANJI_SetDb(NewLangDbNo);
        for (int f = 0; f < NumOfStrings; f++)
            TextPtr[f] += (int)TextPtr;
    }
}

/* @0x8007B528 LANG.CPP:171 */
char *GetStr(int StrId)
{
    if (StrId & 0x4000) {
        StrId -= 0x4000;
        LANG_SetDb(LANG_DB_CREDITS);
    } else if (StrId & 0x2000) {
        StrId -= 0x2000;
        LANG_SetDb(LANG_DB_BACK);
    } else if (StrId & 0x1000) {
        StrId -= 0x1000;
        LANG_SetDb(LANG_DB_QUEST);
    } else {
        LANG_SetDb(LANG_DB_MAIN);
    }
    return TextPtr[StrId];
}

/* @0x8007B5A4 LANG.CPP:204 */
void LANG_ReloadMainTXT(void)
{
    CDWAIT = 1;
    GetStr(0x302);
    if (IsKanjiLoaded())
        CDWAIT = 0;
}

/* @0x8007B5E8 LANG.CPP:222 */
void LANG_SetLang(enum LANG_TYPE NewLanguageType)
{
    if (NewLanguageType != LanguageType) {
        char FileNameBuffer[40];
        FileIO *FIO;

        FIO = SYSI_GetFs();
        DumpCurrentText();
        GetLangFileName(NewLanguageType, FileNameBuffer);
        CDWAIT = 1;
        hndText = FIO->Read(FileNameBuffer, 1);
        if (hndText == -1)
            DBG_Error(0, "source/LANG.cpp", 243);
        CDWAIT = 0;
        GAL_SetMemName(hndText, "TEXTDB");
        TextPtr = (char **)GAL_Lock(hndText);
        if (!TextPtr)
            DBG_Error(0, "source/LANG.cpp", 250);
        NumOfStrings = CalcNumOfStrings(TextPtr);
        for (int f = 0; f < NumOfStrings; f++)
            TextPtr[f] += (int)TextPtr;
        LanguageType = NewLanguageType;
    }
}

/* @0x8007B700 LANG.CPP:276 */
void DumpCurrentText(void)
{
    if (hndText != -1) {
        unsigned char Freed = GAL_Free(hndText);
        if (!Freed)
            DBG_Error(0, "source/LANG.cpp", 282);
        TextPtr = 0;
        hndText = -1;
    }
}

/* @0x8007B758 LANG.CPP:294 */
int CalcNumOfStrings(char **TPtr)
{
    return (unsigned long)*TPtr / 4;
}

/* @0x8007B764 LANG.CPP:306 */
void GetLangFileName(enum LANG_TYPE NewLanguageType, char *Dest)
{
    char *Ext;

    Ext = GetLangFileNameExt(NewLanguageType);
    if (!Ext)
        DBG_Error(0, "source/LANG.cpp", 310);
    *Dest = 0;
    switch (LangDbNo) {
    case LANG_DB_MAIN:
        strcat(Dest, "MAINTXT.");
        break;
    case LANG_DB_QUEST:
        strcat(Dest, "QUESTTXT.");
        break;
    case LANG_DB_BACK:
        strcat(Dest, "BACKTXT.");
        break;
    case LANG_DB_CREDITS:
        strcat(Dest, "CREDTXT.");
        break;
    }
    strcat(Dest, Ext);
}

/* @0x8007B844 LANG.CPP:334 */
char *GetLangFileNameExt(enum LANG_TYPE NewLanguageType)
{
    switch (NewLanguageType) {
    case LANG_ENGLISH:
        return "ENG";
    case LANG_FRENCH:
        return "FRE";
    case LANG_GERMAN:
        return "GER";
    case LANG_SWEDISH:
        return "SWE";
    case LANG_JAP:
        return "JAP";
    case LANG_NONE:
        return 0;
    }
    return 0;
}

int NumOfStrings = 0;
