/* SYSINIT.CPP — Diablo PSX (Climax 1998) reconstruction (PSXSRC).  No PC twin: system start-up.
 * SYSI_Init brings up memory, video, the file system, the tasker and every module; the file
 * system is the PC link (PCIO) or packed data file (DatIO) on a dev kit, else the CD (CdIO). */
#include "diabpsx_types.h"
#include "psxsrc/textdat_header.h"

struct RECT {   /* sizeof 8 */
    short x, y, w, h;
};

class SysObj {   /* sizeof 4 */
public:
    long MemHnd;
    void *operator new(int Amount, unsigned long RamID);
};

class FileIO : public SysObj {   /* sizeof 20 */
public:
    unsigned long MemId;
    long hndPath;
    char *SearchPath;
    void *_vf;
    void SetSearchPath(const char *Path);
};

class PCIO : public FileIO {
public:
    PCIO(unsigned long OurMemId);
};

class DatIO : public FileIO {
public:
    DatIO(unsigned long OurMemId);
};

class CdIO : public FileIO {
public:
    CdIO(unsigned long OurMemId);
};

extern "C" {
void DBG_Error(char *Text, char *File, int Line);
void SaveGP(void);
int ClearImage(struct RECT *rect, unsigned char r, unsigned char g, unsigned char b);
int ResetCallback(void);
unsigned char TSK_OpenModule(unsigned long MemType);
void TSK_SetExtraStackProtection(unsigned char OnOff);
void GU_InitModule(void);
void SpuInit(void);
}
void MEM_SetupMem(void);
void InitTmalloc(void);
void VID_OpenModule(void);
void VID_ScrOn(void);
void GM_Open(void);
void PA_Open(void);
void PAD_Open(void);
void PutUpCutScreen(int Scr);
void BL_LoadDirectory(void);
void BL_InitEAC(void);
void SCR_Open(void);
void DEC_Open(void);
void OVR_Open(void);
void STR_Init(void);
void SPU_OnceOnlyInit(void);
void GLUE_Init(void);
static void SortOutFileSystem(void);

extern int OPT_FileSystem;
extern int OPT_DevKit;
int FileSYS;

static FileIO *FileSystem;
static FileIO *OverlayFileSystem;

/* @0x800B059C SYSINIT.CPP:97 (linked into the startup segment) */
void SYSI_Init(void) __attribute__((section(".STARTUP_text")));

/* TUTILS.H helpers precede SYSINIT's ordinary code in retail. */
static int GetTpY(unsigned short tpage)
{
    return ((tpage << 4) & 0x100) | ((tpage >> 2) & 0x200);
}

static int GetTpX(unsigned short tpage)
{
    return (tpage << 6) & 0x3C0;
}

void SYSI_Init(void)
{
    struct RECT clrRect;

    SaveGP();
    MEM_SetupMem();
    InitTmalloc();
    VID_OpenModule();
    clrRect.x = 0;
    clrRect.y = 0;
    clrRect.w = 320;
    clrRect.h = 256;
    ClearImage(&clrRect, 0, 0, 0);
    clrRect.x = 320;
    ClearImage(&clrRect, 0, 0, 0);
    VID_ScrOn();
    SortOutFileSystem();
    ResetCallback();
    if (!TSK_OpenModule(0x8001)) {
        if (!!"Error opening tasker")
            DBG_Error(NULL, "psxsrc/SYSINIT.CPP", 131);
    }
    TSK_SetExtraStackProtection(0);
    GU_InitModule();
    GM_Open();
    PA_Open();
    PAD_Open();
    PutUpCutScreen(11);
    if (FileSYS == 2)
        BL_LoadDirectory();
    SCR_Open();
    DEC_Open();
    OVR_Open();
    STR_Init();
    SpuInit();
    SPU_OnceOnlyInit();
    GLUE_Init();
}

/* @0x80084474 SYSINIT.CPP:182 */
FileIO *SYSI_GetFs(void)
{
    return FileSystem;
}

/* @0x80084480 SYSINIT.CPP:192 */
FileIO *SYSI_GetOverlayFs(void)
{
    return OverlayFileSystem;
}

/* @0x8008448C SYSINIT.CPP:201 */
static void SortOutFileSystem(void)
{
    char *SearchPath;

    FileSYS = 0;
    switch (OPT_FileSystem) {
    case 0:
        FileSYS = 1;
        switch (OPT_DevKit) {
        case 0:
        case 1:
            FileSystem = new (1) PCIO(1);
            break;
        case 2:
            FileSystem = new (1) DatIO(1);
            break;
        }
        break;
    case 1:
        FileSYS = 2;
        FileSystem = new (1) CdIO(1);
        BL_InitEAC();
        break;
    }
    OverlayFileSystem = FileSystem;
    if (!FileSystem)
        DBG_Error(NULL, "psxsrc/SYSINIT.CPP", 255);
    SearchPath = "target\\data\\load\\jap;target\\data\\load;data;data\\snd";
    FileSystem->SetSearchPath(SearchPath);
    if (OverlayFileSystem != FileSystem)
        OverlayFileSystem->SetSearchPath(SearchPath);
}
