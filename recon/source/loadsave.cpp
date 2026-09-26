/* LOADSAVE.CPP -- Diablo PSX (Climax 1998) reconstruction.  Twin: refs/devilution/Source/loadsave.cpp
 * (the generic byte/int/bool stream helpers plus LoadQuest/SaveQuest only, so far).
 * Layouts / prototypes / externs generated from DIABPSX.SYM (tools/symhdr.py, see gen headers).
 * PSX deltas: PC's memcpy/pointer-file save-game is entirely replaced by a memory-card block save
 * (PSX_GM_SaveGame, PSX_GM_LoadGame, the PSX_CH_ family, RestorePads, StorePads, GetIcon, the
 * PSX_OPT_ family, LoadOptions, SaveOptions, RestoreLoadedData) -- NOT YET RECONSTRUCTED (13 of 23
 * functions; see the final report).
 * LoadQuest/SaveQuest on PSX are a straight memcpy of QuestStruct with NO trailing WLoad() calls for
 * ReturnLvlX/Y/ReturnLvl/ReturnLvlT/DoomQuestState (devilution's LoadQuest reads those 5 extra ints
 * after the quest struct; PSX's LoadQuest does not touch them here). */
#include "diabpsx_types.h"
#include "source/gen/structs_loadsave.h"
#include "source/gen/externs_loadsave.h"
#include "source/gen/protos_loadsave.h"
#include "source/diablo.h"

#define TRUE  1
#define FALSE 0

extern "C" int sprintf(char *buf, const char *fmt, ...);
void SaveOptions(void);
void GetIcon(void);

/* TU-owned globals (oracle reaches these via %gp_rel -> tentative defs here). */
unsigned char ADirtyFlagThatGaryWillLove;
int DirtyVidx;
int DirtyVidY;

/* file-scope static (SYM class STAT; the load/save cursor into the decoded save-file buffer). */
static unsigned char *tbuff;

/* @0x8015B958 */
char *GetOptStr(void)
{
    return "\x83\x49\x83\x76\x83\x56\x83\x87\x83\x93";   /* Shift-JIS "オプション" ("Option") */
}

/* @0x8015B968 */
char *GetDiabloStr(void)
{
    return "\x83\x66\x83\x42\x83\x41\x83\x75\x83\x8D";   /* Shift-JIS "ディアブロ" ("Diablo") */
}

/* @0x8015B978 */
char BLoad(void)
{
    return *tbuff++;
}

/* @0x8015B994 */
int ILoad(void)
{
    int rv;

    rv = *tbuff++ << 24;
    rv |= *tbuff++ << 16;
    rv |= *tbuff++ << 8;
    rv |= *tbuff++;

    return rv;
}

/* @0x8015B9E8 */
BOOL OLoad(void)
{
    if (*tbuff++ == TRUE)
        return TRUE;
    else
        return FALSE;
}

/* @0x8015BA0C */
void LoadQuest(int i)
{
    memcpy(&quests[i], tbuff, sizeof(struct QuestStruct));
    tbuff += sizeof(struct QuestStruct);
}

/* @0x8015BAD4 */
void BSave(char v)
{
    *tbuff++ = v;
}

/* @0x8015BAEC */
void ISave(int v)
{
    *tbuff++ = v >> 24;
    *tbuff++ = v >> 16;
    *tbuff++ = v >> 8;
    *tbuff++ = v;
}

/* @0x8015BB4C */
void OSave(unsigned char v)
{
    if (v)
        *tbuff++ = 1;
    else
        *tbuff++ = 0;
}

/* @0x8015BB90 */
void SaveQuest(int i)
{
    memcpy(tbuff, &quests[i], sizeof(struct QuestStruct));
    tbuff += sizeof(struct QuestStruct);
}

/* @0x8015C2E8 */
void PSX_CH_LoadGame(int slot)
{
    gbMaxPlayers = FePlayerNo + 1;
    UnPackPlayer(&CharDataStruct.CharSlots[slot], FePlayerNo, 0);
    QSpell[FePlayerNo] = CharDataStruct.ToggleSave[slot];
    _spltotype[FePlayerNo] = CharDataStruct.spltypesave[slot];
}

/* @0x8015C388 */
int PSX_CH_LoadBlock(int card_number, int file)
{
    return read_card_file(card_number, file, 0x3001, (char *)&CharDataStruct);
}

/* @0x8015C3B0 */
int PSX_CH_SaveGame(int card_number, int slot)
{
    int result;
    int tries;
    char TempStr[64];
    unsigned char *icon;
    unsigned short *clut;
    int delete_file_number;

    sprintf(TempStr, "%s %s",
        "\x83\x66\x83\x42\x83\x41\x83\x75\x83\x8D",   /* Shift-JIS "ディアブロ" ("Diablo") */
        "\x83\x4C\x83\x83\x83\x89\x83\x4E\x83\x5E\x81\x5B\x83\x66\x81\x5B\x83\x5E");   /* Shift-JIS "キャラクターデータ" ("Character Data") */
    GetIcon();
    tries = 4;

    PackPlayer(&CharDataStruct.CharSlots[slot], options_pad);
    CharDataStruct.ToggleSave[slot] = QSpell[options_pad];
    icon = IconBuffer + 0x28;
    CharDataStruct.spltypesave[slot] = _spltotype[options_pad];
    clut = (unsigned short *)(icon - 0x20);

    do {
        delete_file_number = GetFileNumber(current_card, DiabloCharacterFile);
        if (delete_file_number != -1) {
            delete_card_file(current_card, delete_file_number);
        }
        result = write_card_file(card_number, 0x3001, DiabloCharacterFile, TempStr,
                                  icon, clut, 0x1DE0, (unsigned char *)&CharDataStruct);
        tries--;
    } while (tries != -1 && result != 0);

    return result;
}

/* @0x8015C51C */
void RestorePads(void)
{
    int i;

    for (i = 0; i < 20; i++) {
        txt_actions[i].pad_val = ILoad();
        txt_actions[i].combo_val = ILoad();
    }
    PostGamePad(9, 0, (int)txt_actions, 0);

    for (i = 0; i < 20; i++) {
        txt_actions[i].pad_val = ILoad();
        txt_actions[i].combo_val = ILoad();
    }
    PostGamePad(9, 1, (int)txt_actions, 0);
}

/* @0x8015C5DC */
void StorePads(void)
{
    int i;

    PostGamePad(11, 0, (int)txt_actions, 0);
    for (i = 0; i < 20; i++) {
        ISave(txt_actions[i].pad_val);
        ISave(txt_actions[i].combo_val);
    }

    PostGamePad(11, 1, (int)txt_actions, 0);
    for (i = 0; i < 20; i++) {
        ISave(txt_actions[i].pad_val);
        ISave(txt_actions[i].combo_val);
    }
}

/* @0x8015C698 */
void GetIcon(void)
{
    SYSI_GetFs()->ReadAtAddr("DIABICON.RAW", IconBuffer, -1);
}

/* @0x8015C850 */
void LoadOptions(void)
{
    sglMasterVolume = ILoad();
    sglMusicVolume = ILoad();
    sglSoundVolume = ILoad();
    sglSpeechVolume = ILoad();

    if (!ADirtyFlagThatGaryWillLove) {
        VID_SetXYOff(ILoad(), ILoad());
    } else {
        DirtyVidx = ILoad();
        DirtyVidY = ILoad();
    }

    RestorePads();
    MONO = BLoad() != 0;
    SetSpeed((enum GM_SPEEDS)BLoad());
}

/* @0x8015C6D4 */
int PSX_OPT_LoadGame(int card_number, int file, BOOL KillHandler)
{
    int result;
    unsigned char *LoadBuff;

    LoadBuff = save_buffer;
    tbuff = LoadBuff;
    result = read_card_file(card_number, file, 0x3001, (char *)LoadBuff);
    if (result == 0) {
        LoadOptions();
        SetLoadedLang((enum LANG_TYPE)ILoad());
    }
    return result;
}

/* @0x8015C730 */
int PSX_OPT_SaveGame(int card_number, char *filename)
{
    int result;
    int tries;
    char TempStr[64];
    unsigned char *SaveBuff;
    int delete_file_number;

    sprintf(TempStr, "%s %s",
        "\x83\x66\x83\x42\x83\x41\x83\x75\x83\x8D",   /* Shift-JIS "ディアブロ" ("Diablo") */
        "\x83\x49\x83\x76\x83\x56\x83\x87\x83\x93");   /* Shift-JIS "オプション" ("Option") */
    SaveBuff = save_buffer;
    tbuff = SaveBuff;
    SaveOptions();
    ISave(LANG_GetLang());
    GetIcon();

    tries = 4;
    do {
        delete_file_number = GetFileNumber(current_card, DiabloOptionFile);
        if (delete_file_number != -1) {
            delete_card_file(current_card, delete_file_number);
        }
        result = write_card_file(card_number, 0x3001, filename, TempStr,
                                  IconBuffer + 0x28, (unsigned short *)(IconBuffer + 8), 0x1B58, SaveBuff);
        tries--;
    } while (tries != -1 && result != 0);

    return result;
}

/* @0x8015C928 */
void SaveOptions(void)
{
    ISave(sglMasterVolume);
    ISave(sglMusicVolume);
    ISave(sglSoundVolume);
    ISave(sglSpeechVolume);
    ISave(VID_GetXOff());
    ISave(VID_GetYOff());
    StorePads();
    BSave(MONO);
    BSave((char)GetSpeed());
}
