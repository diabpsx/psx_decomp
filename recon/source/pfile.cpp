/* PFILE.CPP — Diablo PSX (Climax 1998) reconstruction.  Twin: refs/diablo-hellfire/src/PFILE.CPP.
 * PSX deltas: only the UI-hero helpers survive (no save archives); two classes map to UI ids,
 * everything else is the sorcerer; SetupLocalPlayer just marks the save file valid. */
#include "diabpsx_types.h"
#include "source/gen/structs_pfile.h"
#include "source/gen/protos_pfile.h"
#include "source/diablo.h"

extern "C" char *strncpy(char *dst, const char *src, unsigned int n);

#define CLASS_WARRIOR 0
#define CLASS_ROGUE 1
#define UI_WARRIOR 0
#define UI_ROGUE 1
#define UI_SORCERER 2
#define MAX_NAME_LEN 16

unsigned char gbValidSaveFile;

/* @0x8005FC20 PFILE.CPP:380 */
static unsigned char game_2_ui_class(const PlayerStruct *p)
{
    if (p->_pClass == CLASS_WARRIOR)
        return UI_WARRIOR;
    if (p->_pClass == CLASS_ROGUE)
        return UI_ROGUE;
    return UI_SORCERER;
}

/* @0x8005FC4C PFILE.CPP:391 */
void game_2_ui_player(const PlayerStruct *p, _uiheroinfo *heroinfo, unsigned char bHasSaveFile)
{
    memset(heroinfo, 0, sizeof(_uiheroinfo));
    strncpy(heroinfo->name, p->_pName, MAX_NAME_LEN - 1);
    heroinfo->name[MAX_NAME_LEN - 1] = 0;
    heroinfo->level = p->_pLevel;
    heroinfo->heroclass = game_2_ui_class(p);
    heroinfo->strength = p->_pStrength;
    heroinfo->magic = p->_pMagic;
    heroinfo->dexterity = p->_pDexterity;
    heroinfo->vitality = p->_pVitality;
    heroinfo->gold = p->_pGold;
    heroinfo->hassaved = bHasSaveFile;
    heroinfo->herorank = (unsigned char)p->pDiabloKillLevel;
    heroinfo->spawned = 0;
}

/* @0x8005FD00 PFILE.CPP:449 */
void SetupLocalPlayer(void)
{
    gbValidSaveFile = 1;
}
