/* LIGHTING.CPP -- Diablo PSX (Climax 1998) reconstruction (main image).
 * Twin: refs/devilution/Source/lighting.cpp for the generic light/vision LIST management
 * (AddLight, the Change-light/vision setters, Process(Light|Vision)List, InitLighting, InitVision,
 * AddVision, the Change-vision setters, DoUnVision) --
 * these match the PC 1.09 shape closely (minus the lightflag/dolighting/undo-tracking PC keeps
 * for Light; PSX drops that bookkeeping for LightList entirely -- Change*() write the fields
 * directly, no lightflag guard, no _lunflag/_lunx/_luny/_lunr history kept for lights).
 * DoLighting/DoVision/DoUnLight/MakeLightTable/veclen2/set_light_bands/SetLightFX/SetWeirdFX are
 * PSX-ONLY: Climax replaced the PC's greyscale dLight[]/lightblock[] radius engine with a
 * dynamic COLOURED light engine (dung_map_r/g/b[56][56], a packed-bitfield nRadius encoding
 * colour_mask/shift_mask/weirdy/cont, and a screen-space "weird cheat" colour-cycle effect) --
 * there is no PC source for these; they are transcribed directly from the oracle disassembly. */
#include "diabpsx_types.h"
#include "psxsrc/textdat_header.h"
#include "source/gen/structs_lighting.h"
#include "source/gen/externs_lighting.h"
#include "source/gen/protos_lighting.h"
#include "source/diablo.h"

#define MAXLIGHTS 80
#define MAXVISION 32

int AddLight(int x, int y, int r);
void ChangeLightColour(int i, int c);
void DoLighting(int nXPos, int nYPos, int nRadius, int Lnum);
void DoUnLight(void);
void DoUnVision(int nXPos, int nYPos, int nRadius, int num);
void DoVision(int nXPos, int nYPos, int nRadius, unsigned char doautomap, unsigned char visible);
void SetAutomapView(int x, int y);

int weird_cheat = 0; /* @0x8011B8F4 */
int restore_r = 16; /* @0x8011B8F8 */
int restore_g = 16; /* @0x8011B8FC */
int restore_b = 16; /* @0x8011B900 */
char light_level[5] = { 10, 0, 0, 0, 0 }; /* @0x8011B904 */
char level_lamp[5] = { 0, 1, 1, 1, 1 }; /* @0x8011B90C */
int numlights = 0; /* @0x8011B914 */
char lightmax = 0; /* @0x8011B918 */
int numvision = 0; /* @0x8011B91C */
unsigned char dovision = 0; /* @0x8011B920 */
int visionid = 0; /* @0x8011B924 */

static int disp_mask; /* @0x8011C7DC */
static int weird; /* @0x8011C7E0 */
static int disp_tab_r; /* @0x8011C7E4 */
static int dispy_r; /* @0x8011C7E8 */
static int disp_tab_g; /* @0x8011C7EC */
static int dispy_g; /* @0x8011C7F0 */
static int disp_tab_b; /* @0x8011C7F4 */
static int dispy_b; /* @0x8011C7F8 */
static int radius; /* @0x8011C7FC */
static int bright; /* @0x8011C800 */
static int max_bright; /* @0x8011C804 */
static unsigned char mult_tab[128]; /* @0x8012ED58 */

/* @0x800D5554: original refs/diablo-hellfire/src/LIGHTING.CPP CrawlTable.
 * All 2749 bytes agree with retail; the remaining tables retain their PSX sizes. */
char CrawlTable[2749] = {
  1,  0,  0,
  4,  0,  1,  0, -1, -1,  0,  1,  0,
 16,  0,  2,  0, -2, -1,  2,  1,  2, -1, -2,  1, -2, -1,  1,  1,  1, -1, -1,  1, -1, -2,  1,  2,  1, -2, -1,  2, -1,
     -2,  0,  2,  0,
 24,  0,  3,  0, -3, -1,  3,  1,  3, -1, -3,  1, -3, -2,  3,  2,  3, -2, -3,  2, -3, -2,  2,  2,  2, -2, -2,  2, -2,
     -3,  2,  3,  2, -3, -2,  3, -2, -3,  1,  3,  1, -3, -1,  3, -1, -3,  0,  3,  0,
 32,  0,  4,  0, -4, -1,  4,  1,  4, -1, -4,  1, -4, -2,  4,  2,  4, -2, -4,  2, -4, -3,  4,  3,  4, -3, -4,  3, -4,
     -3,  3,  3,  3, -3, -3,  3, -3, -4,  3,  4,  3, -4, -3,  4, -3, -4,  2,  4,  2, -4, -2,  4, -2,
     -4,  1,  4,  1, -4, -1,  4, -1, -4,  0,  4,  0,
 40,  0,  5,  0, -5, -1,  5,  1,  5, -1, -5,  1, -5, -2,  5,  2,  5, -2, -5,  2, -5, -3,  5,  3,  5, -3, -5,  3, -5,
     -4,  5,  4,  5, -4, -5,  4, -5, -4,  4,  4,  4, -4, -4,  4, -4, -5,  4,  5,  4, -5, -4,  5, -4,
     -5,  3,  5,  3, -5, -3,  5, -3, -5,  2,  5,  2, -5, -2,  5, -2, -5,  1,  5,  1, -5, -1,  5, -1,
     -5,  0,  5,  0,
 48,  0,  6,  0, -6, -1,  6,  1,  6, -1, -6,  1, -6, -2,  6,  2,  6, -2, -6,  2, -6, -3,  6,  3,  6, -3, -6,  3, -6,
     -4,  6,  4,  6, -4, -6,  4, -6, -5,  6,  5,  6, -5, -6,  5, -6, -5,  5,  5,  5, -5, -5,  5, -5,
     -6,  5,  6,  5, -6, -5,  6, -5, -6,  4,  6,  4, -6, -4,  6, -4, -6,  3,  6,  3, -6, -3,  6, -3,
     -6,  2,  6,  2, -6, -2,  6, -2, -6,  1,  6,  1, -6, -1,  6, -1, -6,  0,  6,  0,
 56,  0,  7,  0, -7, -1,  7,  1,  7, -1, -7,  1, -7, -2,  7,  2,  7, -2, -7,  2, -7, -3,  7,  3,  7, -3, -7,  3, -7,
     -4,  7,  4,  7, -4, -7,  4, -7, -5,  7,  5,  7, -5, -7,  5, -7, -6,  7,  6,  7, -6, -7,  6, -7,
     -6,  6,  6,  6, -6, -6,  6, -6, -7,  6,  7,  6, -7, -6,  7, -6, -7,  5,  7,  5, -7, -5,  7, -5,
     -7,  4,  7,  4, -7, -4,  7, -4, -7,  3,  7,  3, -7, -3,  7, -3, -7,  2,  7,  2, -7, -2,  7, -2,
     -7,  1,  7,  1, -7, -1,  7, -1, -7,  0,  7,  0,
 64,  0,  8,  0, -8, -1,  8,  1,  8, -1, -8,  1, -8, -2,  8,  2,  8, -2, -8,  2, -8, -3,  8,  3,  8, -3, -8,  3, -8,
     -4,  8,  4,  8, -4, -8,  4, -8, -5,  8,  5,  8, -5, -8,  5, -8, -6,  8,  6,  8, -6, -8,  6, -8,
     -7,  8,  7,  8, -7, -8,  7, -8, -7,  7,  7,  7, -7, -7,  7, -7, -8,  7,  8,  7, -8, -7,  8, -7,
     -8,  6,  8,  6, -8, -6,  8, -6, -8,  5,  8,  5, -8, -5,  8, -5, -8,  4,  8,  4, -8, -4,  8, -4,
     -8,  3,  8,  3, -8, -3,  8, -3, -8,  2,  8,  2, -8, -2,  8, -2, -8,  1,  8,  1, -8, -1,  8, -1,
     -8,  0,  8,  0,
 72,  0,  9,  0, -9, -1,  9,  1,  9, -1, -9,  1, -9, -2,  9,  2,  9, -2, -9,  2, -9, -3,  9,  3,  9, -3, -9,  3, -9,
     -4,  9,  4,  9, -4, -9,  4, -9, -5,  9,  5,  9, -5, -9,  5, -9, -6,  9,  6,  9, -6, -9,  6, -9,
     -7,  9,  7,  9, -7, -9,  7, -9, -8,  9,  8,  9, -8, -9,  8, -9, -8,  8,  8,  8, -8, -8,  8, -8,
     -9,  8,  9,  8, -9, -8,  9, -8, -9,  7,  9,  7, -9, -7,  9, -7, -9,  6,  9,  6, -9, -6,  9, -6,
     -9,  5,  9,  5, -9, -5,  9, -5, -9,  4,  9,  4, -9, -4,  9, -4, -9,  3,  9,  3, -9, -3,  9, -3,
     -9,  2,  9,  2, -9, -2,  9, -2, -9,  1,  9,  1, -9, -1,  9, -1, -9,  0,  9,  0,
 80,  0, 10,  0,-10, -1, 10,  1, 10, -1,-10,  1,-10, -2, 10,  2, 10, -2,-10,  2,-10, -3, 10,  3, 10, -3,-10,  3,-10,
     -4, 10,  4, 10, -4,-10,  4,-10, -5, 10,  5, 10, -5,-10,  5,-10, -6, 10,  6, 10, -6,-10,  6,-10,
     -7, 10,  7, 10, -7,-10,  7,-10, -8, 10,  8, 10, -8,-10,  8,-10, -9, 10,  9, 10, -9,-10,  9,-10,
     -9,  9,  9,  9, -9, -9,  9, -9,-10,  9, 10,  9,-10, -9, 10, -9,-10,  8, 10,  8,-10, -8, 10, -8,
    -10,  7, 10,  7,-10, -7, 10, -7,-10,  6, 10,  6,-10, -6, 10, -6,-10,  5, 10,  5,-10, -5, 10, -5,
    -10,  4, 10,  4,-10, -4, 10, -4,-10,  3, 10,  3,-10, -3, 10, -3,-10,  2, 10,  2,-10, -2, 10, -2,
    -10,  1, 10,  1,-10, -1, 10, -1,-10,  0, 10,  0,
 88,  0, 11,  0,-11, -1, 11,  1, 11, -1,-11,  1,-11, -2, 11,  2, 11, -2,-11,  2,-11, -3, 11,  3, 11, -3,-11,  3,-11,
     -4, 11,  4, 11, -4,-11,  4,-11, -5, 11,  5, 11, -5,-11,  5,-11, -6, 11,  6, 11, -6,-11,  6,-11,
     -7, 11,  7, 11, -7,-11,  7,-11, -8, 11,  8, 11, -8,-11,  8,-11, -9, 11,  9, 11, -9,-11,  9,-11,
    -10, 11, 10, 11,-10,-11, 10,-11,-10, 10, 10, 10,-10,-10, 10,-10,-11, 10, 11, 10,-11,-10, 11,-10,
    -11,  9, 11,  9,-11, -9, 11, -9,-11,  8, 11,  8,-11, -8, 11, -8,-11,  7, 11,  7,-11, -7, 11, -7,
    -11,  6, 11,  6,-11, -6, 11, -6,-11,  5, 11,  5,-11, -5, 11, -5,-11,  4, 11,  4,-11, -4, 11, -4,
    -11,  3, 11,  3,-11, -3, 11, -3,-11,  2, 11,  2,-11, -2, 11, -2,-11,  1, 11,  1,-11, -1, 11, -1,
    -11,  0, 11,  0,
 96,  0, 12,  0,-12, -1, 12,  1, 12, -1,-12,  1,-12, -2, 12,  2, 12, -2,-12,  2,-12, -3, 12,  3, 12, -3,-12,  3,-12,
     -4, 12,  4, 12, -4,-12,  4,-12, -5, 12,  5, 12, -5,-12,  5,-12, -6, 12,  6, 12, -6,-12,  6,-12,
     -7, 12,  7, 12, -7,-12,  7,-12, -8, 12,  8, 12, -8,-12,  8,-12, -9, 12,  9, 12, -9,-12,  9,-12,
    -10, 12, 10, 12,-10,-12, 10,-12,-11, 12, 11, 12,-11,-12, 11,-12,-11, 11, 11, 11,-11,-11, 11,-11,
    -12, 11, 12, 11,-12,-11, 12,-11,-12, 10, 12, 10,-12,-10, 12,-10,-12,  9, 12,  9,-12, -9, 12, -9,
    -12,  8, 12,  8,-12, -8, 12, -8,-12,  7, 12,  7,-12, -7, 12, -7,-12,  6, 12,  6,-12, -6, 12, -6,
    -12,  5, 12,  5,-12, -5, 12, -5,-12,  4, 12,  4,-12, -4, 12, -4,-12,  3, 12,  3,-12, -3, 12, -3,
    -12,  2, 12,  2,-12, -2, 12, -2,-12,  1, 12,  1,-12, -1, 12, -1,-12,  0, 12,  0,
104,  0, 13,  0,-13, -1, 13,  1, 13, -1,-13,  1,-13, -2, 13,  2, 13, -2,-13,  2,-13, -3, 13,  3, 13, -3,-13,  3,-13,
     -4, 13,  4, 13, -4,-13,  4,-13, -5, 13,  5, 13, -5,-13,  5,-13, -6, 13,  6, 13, -6,-13,  6,-13,
     -7, 13,  7, 13, -7,-13,  7,-13, -8, 13,  8, 13, -8,-13,  8,-13, -9, 13,  9, 13, -9,-13,  9,-13,
    -10, 13, 10, 13,-10,-13, 10,-13,-11, 13, 11, 13,-11,-13, 11,-13,-12, 13, 12, 13,-12,-13, 12,-13,
    -12, 12, 12, 12,-12,-12, 12,-12,-13, 12, 13, 12,-13,-12, 13,-12,-13, 11, 13, 11,-13,-11, 13,-11,
    -13, 10, 13, 10,-13,-10, 13,-10,-13,  9, 13,  9,-13, -9, 13, -9,-13,  8, 13,  8,-13, -8, 13, -8,
    -13,  7, 13,  7,-13, -7, 13, -7,-13,  6, 13,  6,-13, -6, 13, -6,-13,  5, 13,  5,-13, -5, 13, -5,
    -13,  4, 13,  4,-13, -4, 13, -4,-13,  3, 13,  3,-13, -3, 13, -3,-13,  2, 13,  2,-13, -2, 13, -2,
    -13,  1, 13,  1,-13, -1, 13, -1,-13,  0, 13,  0,
112,  0, 14,  0,-14, -1, 14,  1, 14, -1,-14,  1,-14, -2, 14,  2, 14, -2,-14,  2,-14, -3, 14,  3, 14, -3,-14,  3,-14,
     -4, 14,  4, 14, -4,-14,  4,-14, -5, 14,  5, 14, -5,-14,  5,-14, -6, 14,  6, 14, -6,-14,  6,-14,
     -7, 14,  7, 14, -7,-14,  7,-14, -8, 14,  8, 14, -8,-14,  8,-14, -9, 14,  9, 14, -9,-14,  9,-14,
    -10, 14, 10, 14,-10,-14, 10,-14,-11, 14, 11, 14,-11,-14, 11,-14,-12, 14, 12, 14,-12,-14, 12,-14,
    -13, 14, 13, 14,-13,-14, 13,-14,-13, 13, 13, 13,-13,-13, 13,-13,-14, 13, 14, 13,-14,-13, 14,-13,
    -14, 12, 14, 12,-14,-12, 14,-12,-14, 11, 14, 11,-14,-11, 14,-11,-14, 10, 14, 10,-14,-10, 14,-10,
    -14,  9, 14,  9,-14, -9, 14, -9,-14,  8, 14,  8,-14, -8, 14, -8,-14,  7, 14,  7,-14, -7, 14, -7,
    -14,  6, 14,  6,-14, -6, 14, -6,-14,  5, 14,  5,-14, -5, 14, -5,-14,  4, 14,  4,-14, -4, 14, -4,
    -14,  3, 14,  3,-14, -3, 14, -3,-14,  2, 14,  2,-14, -2, 14, -2,-14,  1, 14,  1,-14, -1, 14, -1,
    -14,  0, 14,  0,
120,  0, 15,  0,-15, -1, 15,  1, 15, -1,-15,  1,-15, -2, 15,  2, 15, -2,-15,  2,-15, -3, 15,  3, 15, -3,-15,  3,-15,
     -4, 15,  4, 15, -4,-15,  4,-15, -5, 15,  5, 15, -5,-15,  5,-15, -6, 15,  6, 15, -6,-15,  6,-15,
     -7, 15,  7, 15, -7,-15,  7,-15, -8, 15,  8, 15, -8,-15,  8,-15, -9, 15,  9, 15, -9,-15,  9,-15,
    -10, 15, 10, 15,-10,-15, 10,-15,-11, 15, 11, 15,-11,-15, 11,-15,-12, 15, 12, 15,-12,-15, 12,-15,
    -13, 15, 13, 15,-13,-15, 13,-15,-14, 15, 14, 15,-14,-15, 14,-15,-14, 14, 14, 14,-14,-14, 14,-14,
    -15, 14, 15, 14,-15,-14, 15,-14,-15, 13, 15, 13,-15,-13, 15,-13,-15, 12, 15, 12,-15,-12, 15,-12,
    -15, 11, 15, 11,-15,-11, 15,-11,-15, 10, 15, 10,-15,-10, 15,-10,-15,  9, 15,  9,-15, -9, 15, -9,
    -15,  8, 15,  8,-15, -8, 15, -8,-15,  7, 15,  7,-15, -7, 15, -7,-15,  6, 15,  6,-15, -6, 15, -6,
    -15,  5, 15,  5,-15, -5, 15, -5,-15,  4, 15,  4,-15, -4, 15, -4,-15,  3, 15,  3,-15, -3, 15, -3,
    -15,  2, 15,  2,-15, -2, 15, -2,-15,  1, 15,  1,-15, -1, 15, -1,-15,  0, 15,  0,
(char)128,  0, 16,  0,-16, -1, 16,  1, 16, -1,-16,  1,-16, -2, 16,  2, 16, -2,-16,  2,-16, -3, 16,  3, 16, -3,-16,  3,-16,
     -4, 16,  4, 16, -4,-16,  4,-16, -5, 16,  5, 16, -5,-16,  5,-16, -6, 16,  6, 16, -6,-16,  6,-16,
     -7, 16,  7, 16, -7,-16,  7,-16, -8, 16,  8, 16, -8,-16,  8,-16, -9, 16,  9, 16, -9,-16,  9,-16,
    -10, 16, 10, 16,-10,-16, 10,-16,-11, 16, 11, 16,-11,-16, 11,-16,-12, 16, 12, 16,-12,-16, 12,-16,
    -13, 16, 13, 16,-13,-16, 13,-16,-14, 16, 14, 16,-14,-16, 14,-16,-15, 16, 15, 16,-15,-16, 15,-16,
    -15, 15, 15, 15,-15,-15, 15,-15,-16, 15, 16, 15,-16,-15, 16,-15,-16, 14, 16, 14,-16,-14, 16,-14,
    -16, 13, 16, 13,-16,-13, 16,-13,-16, 12, 16, 12,-16,-12, 16,-12,-16, 11, 16, 11,-16,-11, 16,-11,
    -16, 10, 16, 10,-16,-10, 16,-10,-16,  9, 16,  9,-16, -9, 16, -9,-16,  8, 16,  8,-16, -8, 16, -8,
    -16,  7, 16,  7,-16, -7, 16, -7,-16,  6, 16,  6,-16, -6, 16, -6,-16,  5, 16,  5,-16, -5, 16, -5,
    -16,  4, 16,  4,-16, -4, 16, -4,-16,  3, 16,  3,-16, -3, 16, -3,-16,  2, 16,  2,-16, -2, 16, -2,
    -16,  1, 16,  1,-16, -1, 16, -1,-16,  0, 16,  0,
(char)136,  0, 17,  0,-17, -1, 17,  1, 17, -1,-17,  1,-17, -2, 17,  2, 17, -2,-17,  2,-17, -3, 17,  3, 17, -3,-17,  3,-17,
     -4, 17,  4, 17, -4,-17,  4,-17, -5, 17,  5, 17, -5,-17,  5,-17, -6, 17,  6, 17, -6,-17,  6,-17,
     -7, 17,  7, 17, -7,-17,  7,-17, -8, 17,  8, 17, -8,-17,  8,-17, -9, 17,  9, 17, -9,-17,  9,-17,
    -10, 17, 10, 17,-10,-17, 10,-17,-11, 17, 11, 17,-11,-17, 11,-17,-12, 17, 12, 17,-12,-17, 12,-17,
    -13, 17, 13, 17,-13,-17, 13,-17,-14, 17, 14, 17,-14,-17, 14,-17,-15, 17, 15, 17,-15,-17, 15,-17,
    -16, 17, 16, 17,-16,-17, 16,-17,-16, 16, 16, 16,-16,-16, 16,-16,-17, 16, 17, 16,-17,-16, 17,-16,
    -17, 15, 17, 15,-17,-15, 17,-15,-17, 14, 17, 14,-17,-14, 17,-14,-17, 13, 17, 13,-17,-13, 17,-13,
    -17, 12, 17, 12,-17,-12, 17,-12,-17, 11, 17, 11,-17,-11, 17,-11,-17, 10, 17, 10,-17,-10, 17,-10,
    -17,  9, 17,  9,-17, -9, 17, -9,-17,  8, 17,  8,-17, -8, 17, -8,-17,  7, 17,  7,-17, -7, 17, -7,
    -17,  6, 17,  6,-17, -6, 17, -6,-17,  5, 17,  5,-17, -5, 17, -5,-17,  4, 17,  4,-17, -4, 17, -4,
    -17,  3, 17,  3,-17, -3, 17, -3,-17,  2, 17,  2,-17, -2, 17, -2,-17,  1, 17,  1,-17, -1, 17, -1,
    -17,  0, 17,  0,
(char)144,  0, 18,  0,-18, -1, 18,  1, 18, -1,-18,  1,-18, -2, 18,  2, 18, -2,-18,  2,-18, -3, 18,  3, 18, -3,-18,  3,-18,
     -4, 18,  4, 18, -4,-18,  4,-18, -5, 18,  5, 18, -5,-18,  5,-18, -6, 18,  6, 18, -6,-18,  6,-18,
     -7, 18,  7, 18, -7,-18,  7,-18, -8, 18,  8, 18, -8,-18,  8,-18, -9, 18,  9, 18, -9,-18,  9,-18,
    -10, 18, 10, 18,-10,-18, 10,-18,-11, 18, 11, 18,-11,-18, 11,-18,-12, 18, 12, 18,-12,-18, 12,-18,
    -13, 18, 13, 18,-13,-18, 13,-18,-14, 18, 14, 18,-14,-18, 14,-18,-15, 18, 15, 18,-15,-18, 15,-18,
    -16, 18, 16, 18,-16,-18, 16,-18,-17, 18, 17, 18,-17,-18, 17,-18,-17, 17, 17, 17,-17,-17, 17,-17,
    -18, 17, 18, 17,-18,-17, 18,-17,-18, 16, 18, 16,-18,-16, 18,-16,-18, 15, 18, 15,-18,-15, 18,-15,
    -18, 14, 18, 14,-18,-14, 18,-14,-18, 13, 18, 13,-18,-13, 18,-13,-18, 12, 18, 12,-18,-12, 18,-12,
    -18, 11, 18, 11,-18,-11, 18,-11,-18, 10, 18, 10,-18,-10, 18,-10,-18,  9, 18,  9,-18, -9, 18, -9,
    -18,  8, 18,  8,-18, -8, 18, -8,-18,  7, 18,  7,-18, -7, 18, -7,-18,  6, 18,  6,-18, -6, 18, -6,
    -18,  5, 18,  5,-18, -5, 18, -5,-18,  4, 18,  4,-18, -4, 18, -4,-18,  3, 18,  3,-18, -3, 18, -3,
    -18,  2, 18,  2,-18, -2, 18, -2,-18,  1, 18,  1,-18, -1, 18, -1,-18,  0, 18,  0
};

unsigned char vCrawlTable[23][30] = {
    { 1, 0, 2, 0, 3, 0, 4, 0, 5, 0, 6, 0, 7, 0, 8, 0, 9, 0, 10, 0, 11, 0, 12, 0, 13, 0, 14, 0, 15, 0 },
    { 1, 0, 2, 0, 3, 0, 4, 0, 5, 0, 6, 0, 7, 0, 8, 1, 9, 1, 10, 1, 11, 1, 12, 1, 13, 1, 14, 1, 15, 1 },
    { 1, 0, 2, 0, 3, 0, 4, 1, 5, 1, 6, 1, 7, 1, 8, 1, 9, 1, 10, 1, 11, 1, 12, 2, 13, 2, 14, 2, 15, 2 },
    { 1, 0, 2, 0, 3, 1, 4, 1, 5, 1, 6, 1, 7, 1, 8, 2, 9, 2, 10, 2, 11, 2, 12, 2, 13, 3, 14, 3, 15, 3 },
    { 1, 0, 2, 1, 3, 1, 4, 1, 5, 1, 6, 2, 7, 2, 8, 2, 9, 3, 10, 3, 11, 3, 12, 3, 13, 4, 14, 4, 0, 0 },
    { 1, 0, 2, 1, 3, 1, 4, 1, 5, 2, 6, 2, 7, 3, 8, 3, 9, 3, 10, 4, 11, 4, 12, 4, 13, 5, 14, 5, 0, 0 },
    { 1, 0, 2, 1, 3, 1, 4, 2, 5, 2, 6, 3, 7, 3, 8, 3, 9, 4, 10, 4, 11, 5, 12, 5, 13, 6, 14, 6, 0, 0 },
    { 1, 1, 2, 1, 3, 2, 4, 2, 5, 3, 6, 3, 7, 4, 8, 4, 9, 5, 10, 5, 11, 6, 12, 6, 13, 7, 0, 0, 0, 0 },
    { 1, 1, 2, 1, 3, 2, 4, 2, 5, 3, 6, 4, 7, 4, 8, 5, 9, 6, 10, 6, 11, 7, 12, 7, 12, 8, 13, 8, 0, 0 },
    { 1, 1, 2, 2, 3, 2, 4, 3, 5, 4, 6, 5, 7, 5, 8, 6, 9, 7, 10, 7, 10, 8, 11, 8, 12, 9, 0, 0, 0, 0 },
    { 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 5, 7, 6, 8, 7, 9, 8, 10, 9, 11, 9, 11, 10, 0, 0, 0, 0, 0, 0 },
    { 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8, 9, 9, 10, 10, 11, 11, 0, 0, 0, 0, 0, 0, 0, 0 },
    { 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 5, 6, 6, 7, 7, 8, 8, 9, 9, 10, 9, 11, 10, 11, 0, 0, 0, 0, 0, 0 },
    { 1, 1, 2, 2, 2, 3, 3, 4, 4, 5, 5, 6, 5, 7, 6, 8, 7, 9, 7, 10, 8, 10, 8, 11, 9, 12, 0, 0, 0, 0 },
    { 1, 1, 1, 2, 2, 3, 2, 4, 3, 5, 4, 6, 4, 7, 5, 8, 6, 9, 6, 10, 7, 11, 7, 12, 8, 12, 8, 13, 0, 0 },
    { 1, 1, 1, 2, 2, 3, 2, 4, 3, 5, 3, 6, 4, 7, 4, 8, 5, 9, 5, 10, 6, 11, 6, 12, 7, 13, 0, 0, 0, 0 },
    { 0, 1, 1, 2, 1, 3, 2, 4, 2, 5, 3, 6, 3, 7, 3, 8, 4, 9, 4, 10, 5, 11, 5, 12, 6, 13, 6, 14, 0, 0 },
    { 0, 1, 1, 2, 1, 3, 1, 4, 2, 5, 2, 6, 3, 7, 3, 8, 3, 9, 4, 10, 4, 11, 4, 12, 5, 13, 5, 14, 0, 0 },
    { 0, 1, 1, 2, 1, 3, 1, 4, 1, 5, 2, 6, 2, 7, 2, 8, 3, 9, 3, 10, 3, 11, 3, 12, 4, 13, 4, 14, 0, 0 },
    { 0, 1, 0, 2, 1, 3, 1, 4, 1, 5, 1, 6, 1, 7, 2, 8, 2, 9, 2, 10, 2, 11, 2, 12, 3, 13, 3, 14, 3, 15 },
    { 0, 1, 0, 2, 0, 3, 1, 4, 1, 5, 1, 6, 1, 7, 1, 8, 1, 9, 1, 10, 1, 11, 2, 12, 2, 13, 2, 14, 2, 15 },
    { 0, 1, 0, 2, 0, 3, 0, 4, 0, 5, 0, 6, 0, 7, 1, 8, 1, 9, 1, 10, 1, 11, 1, 12, 1, 13, 1, 14, 1, 15 },
    { 0, 1, 0, 2, 0, 3, 0, 4, 0, 5, 0, 6, 0, 7, 0, 8, 0, 9, 0, 10, 0, 11, 0, 12, 0, 13, 0, 14, 0, 15 },
};

unsigned char RadiusAdj[23] = { 0, 0, 0, 0, 1, 1, 1, 2, 2, 2, 3, 4, 3, 2, 2, 2, 1, 1, 1, 0, 0, 0, 0 };

static char radius_tab[16] = { -1, 24, 26, 29, 32, 35, 37, 40, 43, 46, 49, 51, 54, 57, 60, 64 };
static char bright_tab[16] = { -1, 2, 2, 2, 3, 3, 4, 4, 4, 4, 3, 3, 3, 2, 2, 2 };
LightListStruct2 LightList[80] = { 0 };
unsigned char lightactive[80] = { 0 };
LightListStruct VisionList[32] = { 0 };

int veclen2(int ix, int iy)
{
    int t;

    ix = ix < 0 ? -ix : ix;
    iy = iy < 0 ? -iy : iy;
    if (ix < iy) {
        ix ^= iy;
        iy ^= ix;
        ix ^= iy;
    }
    t = iy + (iy >> 1);
    return ix - (ix >> 5) - (ix >> 7) + (t >> 2) + (t >> 6);
}

void set_light_bands(void)
{
    int v, y;
    unsigned char *l;

    y = 0;
    l = mult_tab;
    v = 0x7E;
    disp_mask = 0x7F;
    max_bright = 0x80;
    do {
        *l++ = 0;
    } while (--v >= 0);
    l = mult_tab;
    v = 0x1F;
    do {
        *l = y;
        y++;
        l++;
    } while (--v >= 0);
    v = 0x1F;
    do {
        *l = y;
        y--;
        l++;
    } while (--v >= 0);
}

void SetLightFX(int x, int y, short s_r, short s_g, short s_b, unsigned char d_r, unsigned char d_g, unsigned char d_b)
{
    disp_tab_r = d_r << 8;
    disp_tab_g = d_g << 8;
    disp_tab_b = d_b << 8;
    dispy_r = s_r;
    dispy_g = s_g;
    dispy_b = s_b;
    AddLight(x, y, 0x6070);
}

void SetWeirdFX(void)
{
    if (weird_cheat)
        return;

    disp_tab_r = 0x4000;
    disp_tab_g = 0x2000;
    disp_tab_b = 0x1000;
    dispy_r = 0xA80;
    dispy_g = -0xA10;
    restore_b = 0;
    restore_g = 0;
    restore_r = 0;
    dispy_b = 0xAA0;
    ChangeLightColour(plr[0]._plid, 0xE070);
    weird_cheat = 1;
}

/* @0x8004BE20 -- PSX-only coloured radial light-fill (no PC twin). Four paint arms:
 * clipped/unclipped x shift_mask==0/!=0, every row loop counted by y from 0 with the row written as
 * block_y + y (nYPos is only the entry parameter). Loop optimisation then gives retail's shape:
 * the row expression becomes a strength-reduced induction register; in the clipped arms the per-row
 * bounds test lets y itself be eliminated; in the shift arms the unconditional channel loads are
 * hoisted out of the x loop, leaving the two row copies (one shared with dist_y's spelling for the
 * red load, one for the other accesses) and the caller-save spills around veclen2 that the oracle has.
 * Spelling of the row term (block_y + y vs y + block_y) is therefore load-bearing; it is the measured
 * byte/SYM-exact form, not a claim of the literal original text. The shake jitter (two GU_GetRnd
 * calls) is dead in this build: shake is the constant 1. */
void DoLighting(int nXPos, int nYPos, int nRadius, int Lnum)
{
    int xoff, yoff;
    int x, y;
    int v;
    int colour_mask, shift_mask, shake;
    int light_x, light_y;
    int block_x, block_y;
    int dist_y;
    int max_x;
    int mult, mult_st;
    int radius_block;
    int scr_x, scr_y;
    int temp_x, temp_y;
    int weirdy, cont;
    int p0 = plr[0].plractive;   /* unused carrier: retail loads plr[0].plractive in the entry block; an unused initialised local leaves no SYM record and cse propagates it into the leveltype==3 test */

    xoff = 0;
    yoff = 0;
    colour_mask = (nRadius >> 4) & 7;
    shift_mask = (nRadius >> 7) & 0x3F;
    shake = 1;
    weirdy = (nRadius >> 14) & 1;
    if (!weirdy && weird == 1)
        return;
    if (weirdy == 1)
        weird = weirdy;
    cont = (nRadius >> 15) & 1;
    nRadius &= 0xF;
    if (leveltype == 3) {
        if (plr[0].plractive && Lnum == plr[0]._plid)
            nRadius = 10;
        if (plr[1].plractive && Lnum == plr[1]._plid)
            nRadius = 10;
    }
    nRadius += light_level[leveltype];
    if (nRadius > 15)
        nRadius = 15;
    radius = radius_tab[nRadius];
    bright = bright_tab[nRadius];
    if (weirdy) {
        radius = 0x40;
        bright = 4;
        max_bright = 0xFF;
        disp_tab_r += dispy_r;
        disp_tab_g += dispy_g;
        disp_tab_b += dispy_b;
        if (!cont && disp_tab_r > 0xC800) {
            weird = 0;
            LightList[Lnum]._ldel = 1;
            max_bright = 0x80;
            return;
        }
    }
    if (Lnum >= 0) {
        xoff = LightList[Lnum]._xoff + 8;
        yoff = LightList[Lnum]._yoff + 8;
    }
    if (leveltype) {
        nXPos = (nXPos - 16) / 2;
        nYPos = (nYPos - 16) / 2;
        light_x = ((nXPos << 4) | xoff) - 8;
        light_y = ((nYPos << 4) | yoff) - 8;
    } else {
        nXPos = (nXPos + 2) / 2 - 2;
        nYPos = (nYPos + 2) / 2 - 2;
        light_x = ((nXPos << 4) | xoff) + 4;
        light_y = ((nYPos << 4) | yoff) + 4;
    }
    if (nRadius < 0)
        return;
    if (!shake) {
        light_x += GU_GetRnd() & 1;
        light_y += GU_GetRnd() & 1;
    }
    temp_x = nXPos;
    temp_y = nYPos;
    block_x = nXPos - (radius >> 4);
    block_y = nYPos - (radius >> 4);
    scr_x = (gr_scrxoff >> 16) / 40 - 2;
    scr_y = (gr_scryoff >> 16) / 40 - 8;
    if (!leveltype) {
        temp_x -= 6;
        temp_y -= 8;
    }
    if (scr_x < temp_x + 8 && temp_x < scr_x + 8 && scr_y < temp_y + 8 && temp_y < scr_y + 8) {
        max_x = 48;
        radius_block = radius >> 3;
        if (block_y < 0 || block_y + radius_block > max_x || block_x < 0 || block_x + radius_block > max_x) {
            if (!shift_mask) {
                for (y = 0; y <= radius_block; y++) {
                    if (block_y + y >= 0) if (block_y + y < 48) {
                        for (x = 0; x <= radius_block; x++) {
                            dist_y = light_y - ((block_y + y) << 4);
                            mult_st = radius - veclen2(light_x - ((block_x + x) << 4), dist_y);
                            if (mult_st < 0)
                                mult_st = 0;
                            if (block_x + x >= 0 && block_x + x < max_x) {
                                if (colour_mask & 1) {
                                    if (weirdy)
                                        mult = mult_tab[(mult_st + (disp_tab_r >> 8)) & disp_mask] * bright;
                                    else
                                        mult = mult_st * bright;
                                    v = dung_map_r[block_x + x][y + block_y] + (mult & 0xFF);
                                    if (v > max_bright)
                                        v = max_bright;
                                    dung_map_r[block_x + x][y + block_y] = v;
                                }
                                if (colour_mask & 2) {
                                    if (weirdy)
                                        mult = mult_tab[(mult_st + (disp_tab_g >> 8)) & disp_mask] * bright;
                                    else
                                        mult = mult_st * bright;
                                    v = dung_map_g[block_x + x][y + block_y] + (mult & 0xFF);
                                    if (v > max_bright)
                                        v = max_bright;
                                    dung_map_g[block_x + x][y + block_y] = v;
                                }
                                if (colour_mask & 4) {
                                    if (weirdy)
                                        mult = mult_tab[(mult_st + (disp_tab_b >> 8)) & disp_mask] * bright;
                                    else
                                        mult = mult_st * bright;
                                    v = dung_map_b[block_x + x][y + block_y] + (mult & 0xFF);
                                    if (v > max_bright)
                                        v = max_bright;
                                    dung_map_b[block_x + x][y + block_y] = v;
                                }
                            }
                        }
                    }
                }
            } else {
                for (y = 0; y <= radius_block; y++) {
                    if (block_y + y >= 0) if (block_y + y < 48) {
                        for (x = 0; x <= radius_block; x++) {
                            dist_y = light_y - ((block_y + y) << 4);
                            mult = (radius - veclen2(light_x - ((block_x + x) << 4), dist_y)) * bright;
                            if (mult < 0)
                                mult = 0;
                            if (block_x + x >= 0 && block_x + x < max_x) {
                                v = dung_map_r[block_x + x][block_y + y];
                                if (colour_mask & 1) {
                                    if (!(shift_mask & 0x9)) {
                                        v += mult;
                                    } else {
                                        if (shift_mask & 1)
                                            v += mult >> 1;
                                        if (shift_mask & 0x8)
                                            v += mult * 2;
                                    }
                                    if (v > max_bright)
                                        v = max_bright;
                                    dung_map_r[block_x + x][y + block_y] = v;
                                }
                                v = dung_map_g[block_x + x][y + block_y];
                                if (colour_mask & 2) {
                                    if (!(shift_mask & 0x12)) {
                                        v += mult;
                                    } else {
                                        if (shift_mask & 2)
                                            v += mult >> 1;
                                        if (shift_mask & 0x10)
                                            v += mult * 2;
                                    }
                                    if (v > max_bright)
                                        v = max_bright;
                                    dung_map_g[block_x + x][y + block_y] = v;
                                }
                                v = dung_map_b[block_x + x][y + block_y];
                                if (colour_mask & 4) {
                                    if (!(shift_mask & 0x24)) {
                                        v += mult;
                                    } else {
                                        if (shift_mask & 4)
                                            v += mult >> 1;
                                        if (shift_mask & 0x20)
                                            v += mult * 2;
                                    }
                                    if (v > max_bright)
                                        v = max_bright;
                                    dung_map_b[block_x + x][y + block_y] = v;
                                }
                            }
                        }
                    }
                }
            }
        } else if (!shift_mask) {
            for (y = 0; y <= radius_block; y++) {
                for (x = 0; x <= radius_block; x++) {
                    dist_y = light_y - ((block_y + y) << 4);
                    mult_st = radius - veclen2(light_x - ((block_x + x) << 4), dist_y);
                    if (mult_st < 0)
                        mult_st = 0;
                    if (colour_mask & 1) {
                        if (weirdy)
                            mult = mult_tab[(mult_st + (disp_tab_r >> 8)) & disp_mask] * bright;
                        else
                            mult = mult_st * bright;
                        v = dung_map_r[block_x + x][y + block_y] + (mult & 0xFF);
                        if (v > max_bright)
                            v = max_bright;
                        dung_map_r[block_x + x][y + block_y] = v;
                    }
                    if (colour_mask & 2) {
                        if (weirdy)
                            mult = mult_tab[(mult_st + (disp_tab_g >> 8)) & disp_mask] * bright;
                        else
                            mult = mult_st * bright;
                        v = dung_map_g[block_x + x][y + block_y] + (mult & 0xFF);
                        if (v > max_bright)
                            v = max_bright;
                        dung_map_g[block_x + x][y + block_y] = v;
                    }
                    if (colour_mask & 4) {
                        if (weirdy)
                            mult = mult_tab[(mult_st + (disp_tab_b >> 8)) & disp_mask] * bright;
                        else
                            mult = mult_st * bright;
                        v = dung_map_b[block_x + x][y + block_y] + (mult & 0xFF);
                        if (v > max_bright)
                            v = max_bright;
                        dung_map_b[block_x + x][y + block_y] = v;
                    }
                }
            }
        } else {
            for (y = 0; y <= radius_block; y++) {
                for (x = 0; x <= radius_block; x++) {
                    dist_y = light_y - ((block_y + y) << 4);
                    mult = (radius - veclen2(light_x - ((block_x + x) << 4), dist_y)) * bright;
                    if (mult < 0)
                        mult = 0;
                    v = dung_map_r[block_x + x][block_y + y];
                    if (colour_mask & 1) {
                        if (!(shift_mask & 0x9)) {
                            v += mult;
                        } else {
                            if (shift_mask & 1)
                                v += mult >> 1;
                            if (shift_mask & 0x8)
                                v += mult * 2;
                        }
                        if (v > max_bright)
                            v = max_bright;
                        dung_map_r[block_x + x][y + block_y] = v;
                    }
                    v = dung_map_g[block_x + x][y + block_y];
                    if (colour_mask & 2) {
                        if (!(shift_mask & 0x12)) {
                            v += mult;
                        } else {
                            if (shift_mask & 2)
                                v += mult >> 1;
                            if (shift_mask & 0x10)
                                v += mult * 2;
                        }
                        if (v > max_bright)
                            v = max_bright;
                        dung_map_g[block_x + x][y + block_y] = v;
                    }
                    v = dung_map_b[block_x + x][y + block_y];
                    if (colour_mask & 4) {
                        if (!(shift_mask & 0x24)) {
                            v += mult;
                        } else {
                            if (shift_mask & 4)
                                v += mult >> 1;
                            if (shift_mask & 0x20)
                                v += mult * 2;
                        }
                        if (v > max_bright)
                            v = max_bright;
                        dung_map_b[block_x + x][y + block_y] = v;
                    }
                }
            }
        }
    }
}

/* Best-effort transcription from the oracle (PSX-only screen-space colour restore; no PC twin --
 * PC's DoUnLight(x,y,r) just copies dPreLight back over dLight, this build's DoUnLight(void)
 * instead re-paints the visible screen rect of dung_map_r/g/b back to restore_r/g/b). The clip
 * block below was re-derived instruction-by-instruction from asm/nonmatchings/lighting/DoUnLight__Fv.s
 * (the earlier if/goto guess is gone): the oracle's 6-branch sequence reduces to "if the whole
 * 13x14 tile is already in [0,0x30] bounds, paint it unconditionally (X outer, Y inner, matching
 * dung_map_r/g/b[x][y]'s row-major layout); otherwise paint with a per-tile bounds check" -- one
 * of the branches in the oracle's sequence (comparing X+13 against X itself) is PROVABLY always
 * false and never taken, confirmed algebraically, so it is omitted here as genuine dead code, not
 * an approximation. Still not byte-verified past this structural derivation. */
void DoUnLight(void)
{
    int x, y, max_x, max_y, nXPos, nYPos;
    unsigned char *r, *g, *b;
    int radius_block_x, radius_block_y;

    nXPos = (gr_scrxoff >> 16) / 40 - 9;
    nYPos = (gr_scryoff >> 16) / 40 - 13;
    if (!leveltype) {
        nXPos = (gr_scrxoff >> 16) / 40 - 1;
        nYPos = (gr_scryoff >> 16) / 40 - 5;
    }
    radius_block_x = 13;
    radius_block_y = 14;
    max_x = 48;
    max_y = 48;
    if (nYPos < 0 || nYPos + radius_block_y > max_y || nXPos < 0 || nXPos + radius_block_x > max_y) {
        for (x = nXPos; x <= nXPos + radius_block_x; x++) {
            for (y = nYPos; y <= nYPos + radius_block_y; y++) {
                if (x >= 0 && x <= max_x && y >= 0 && y <= max_y) {
                    dung_map_r[x][y] = restore_r;
                    dung_map_g[x][y] = restore_g;
                    dung_map_b[x][y] = restore_b;
                }
            }
        }
    } else {
        for (x = nXPos; x <= nXPos + radius_block_x; x++) {
            r = &dung_map_r[x][nYPos];
            g = &dung_map_g[x][nYPos];
            b = &dung_map_b[x][nYPos];
            for (y = nYPos; y <= nYPos + radius_block_y; y++) {
                *r++ = restore_r;
                *g++ = restore_g;
                *b++ = restore_b;
            }
        }
    }
}

void DoUnVision(int nXPos, int nYPos, int nRadius, int num)
{
    int i, j, x1, y1, x2, y2;
    int vis_flag;

    switch (num) {
    case 0:
        vis_flag = 1;
        break;
    case 1:
        vis_flag = 2;
        break;
    default:
        vis_flag = 3;
        break;
    }
    nRadius++;
    y1 = nYPos - nRadius;
    y2 = nYPos + nRadius;
    x1 = nXPos - nRadius;
    x2 = nXPos + nRadius;
    if (y1 < 0)
        y1 = 0;
    if (y2 > 0x60)
        y2 = 0x60;
    if (x1 < 0)
        x1 = 0;
    if (x2 > 0x60)
        x2 = 0x60;
    for (i = x1; i < x2; i++) {
        for (j = y1; j < y2; j++) {
            if ((dung_map[i][j].dFlags & 1) && (dung_map[i][j].dFlags & 2))
                dung_map[i][j].dFlags &= ~vis_flag;
            else
                dung_map[i][j].dFlags &= ~(vis_flag | 4);
        }
    }
}

/* CORRECTION (this pass): the earlier note was wrong -- the oracle DOES use vCrawlTable/RadiusAdj
 * (confirmed via `lui %hi(vCrawlTable)`/`lui %hi(RadiusAdj)` in the raw .s and their real EXT
 * symbols in configs/symbol_addrs.txt, size 0x2B2=23*30 and 0x17=23). DoVision is in fact devilution's
 * SAME crawl-radius/vCrawlTable algorithm (GetBLOCK__Fii here plays the role of PC's
 * nBlockTable[dPiece[x][y]]), just with PSX's dung_map[][].dFlags field access and a different
 * dFlags bit layout (the oracle ORs in `(visible+1)|4` unconditionally rather than PC's separate
 * BFLAG_LIT/BFLAG_VISIBLE bits -- transcribed literally, not mapped to PC bit names). Data tables
 * copied verbatim from refs/devilution/Source/lighting.cpp (byte-for-byte game data, not prose).
 * Whole-TU native text, data and named SYM records are byte/address verified.
 * OWNERSHIP: vCrawlTable/RadiusAdj are addressed ABSOLUTE (`hi()/lo()`, not %gp_rel) in this TU's
 * own oracle AND in missiles.cpp's oracle (which already `extern`s vCrawlTable, non-static) --
 * defined here (non-static, real initializer) as the true owner; missiles.cpp's existing extern
 * decl is unchanged and now resolves against this definition. */
BOOL GetBLOCK(int x, int y);





void DoVision(int nXPos, int nYPos, int nRadius, unsigned char doautomap, unsigned char visible)
{
    int nCrawlX = 0, nCrawlY = 0;
    int nLineLen;
    int nBlockerFlag;
    int i, j, k, v;
    int x1adj, x2adj, y1adj, y2adj;
    int vis_flag;

    vis_flag = visible + 1;
    if (nXPos >= 0 && nXPos <= 96 && nYPos >= 0 && nYPos <= 96) {
        if (doautomap) {
            if (dung_map[nXPos][nYPos].dFlags >= 0)
                SetAutomapView(nXPos, nXPos);
            dung_map[nXPos][nYPos].dFlags |= 0x80;
        }
        dung_map[nXPos][nYPos].dFlags = dung_map[nXPos][nYPos].dFlags | vis_flag | 4;
    }
    for (k = 0; k < 4; k++) {
        for (j = 0; j < 23; j++) {
            nBlockerFlag = 0;
            nLineLen = (nRadius - RadiusAdj[j]) << 1;
            for (i = 0; i < nLineLen && !nBlockerFlag; i += 2) {
                x1adj = 0;
                x2adj = 0;
                y1adj = 0;
                y2adj = 0;
                switch (k) {
                case 0:
                    nCrawlX = nXPos + vCrawlTable[j][i];
                    nCrawlY = nYPos + vCrawlTable[j][i + 1];
                    if (vCrawlTable[j][i] && vCrawlTable[j][i + 1]) {
                        x1adj = -1;
                        y2adj = -1;
                    }
                    break;
                case 1:
                    nCrawlX = nXPos - vCrawlTable[j][i];
                    nCrawlY = nYPos - vCrawlTable[j][i + 1];
                    if (vCrawlTable[j][i] && vCrawlTable[j][i + 1]) {
                        y1adj = 1;
                        x2adj = 1;
                    }
                    break;
                case 2:
                    nCrawlX = nXPos + vCrawlTable[j][i];
                    nCrawlY = nYPos - vCrawlTable[j][i + 1];
                    if (vCrawlTable[j][i] && vCrawlTable[j][i + 1]) {
                        x1adj = -1;
                        y2adj = 1;
                    }
                    break;
                case 3:
                    nCrawlX = nXPos - vCrawlTable[j][i];
                    nCrawlY = nYPos + vCrawlTable[j][i + 1];
                    if (vCrawlTable[j][i] && vCrawlTable[j][i + 1]) {
                        y1adj = -1;
                        x2adj = 1;
                    }
                    break;
                }
                if (nCrawlX >= 0 && nCrawlX <= 96 && nCrawlY >= 0 && nCrawlY <= 96) {
                    nBlockerFlag = GetBLOCK(nCrawlX, nCrawlY);
                    if (!GetBLOCK(nCrawlX + x1adj, nCrawlY + y1adj) || !GetBLOCK(nCrawlX + x2adj, nCrawlY + y2adj)) {
                        if (doautomap) {
                            if (dung_map[nCrawlX][nCrawlY].dFlags >= 0) {
                                SetAutomapView(nCrawlX, nCrawlY);
                                SetAutomapView(nCrawlX + 1, nCrawlY);
                            }
                            dung_map[nCrawlX][nCrawlY].dFlags |= 0x80;
                        }
                        dung_map[nCrawlX][nCrawlY].dFlags = dung_map[nCrawlX][nCrawlY].dFlags | vis_flag | 4;
                        if (!nBlockerFlag) {
                            v = dung_map[nCrawlX][nCrawlY].dTransVal;
                            if (v != 0)
                                TransList[v] = 1;
                        }
                    }
                }
            }
        }
    }
}

void FreeLightTable(void)
{
}

void InitLightTable(void)
{
}

void MakeLightTable(void)
{
}

void InitLightMax(void)
{
    if (light4flag)
        lightmax = 3;
    else
        lightmax = -0x80;
}

void InitLighting(void)
{
    int i;

    numlights = 0;
    for (i = 0; i < MAXLIGHTS; i++)
        lightactive[i] = i;
    set_light_bands();
    weird = 0;
}

int AddLight(int x, int y, int r)
{
    int lid;
    struct LightListStruct2 *ll;

    lid = -1;
    if (numlights < MAXLIGHTS) {
        lid = lightactive[numlights++];
        ll = &LightList[lid];
        ll->_lx = x;
        ll->_ly = y;
        ll->_lradius = r;
        ll->_xoff = 0;
        ll->_yoff = 0;
        ll->_ldel = 0;
    }
    return lid;
}

void AddUnLight(int i)
{
    if (i == -1)
        return;
    LightList[i]._ldel = 1;
}

void ChangeLightRadius(int i, int r)
{
    if (i == -1)
        return;
    LightList[i]._lradius = r;
}

void ChangeLightXY(int i, int x, int y)
{
    struct LightListStruct2 *ll;

    ll = &LightList[i];
    if (i == -1)
        return;
    ll->_lx = x;
    ll->_ly = y;
}

void light_fix(int i)
{
}

void ChangeLightOff(int i, int x, int y)
{
    struct LightListStruct2 *ll;

    if (i == -1)
        return;
    ll = &LightList[i];
    ll->_xoff = x;
    ll->_yoff = y;
}

void ChangeLight(int i, int x, int y, int r)
{
    struct LightListStruct2 *ll;

    if (i == -1)
        return;
    ll = &LightList[i];
    ll->_lx = x;
    ll->_ly = y;
    ll->_lradius = r;
}

void ChangeLightColour(int i, int c)
{
    struct LightListStruct2 *ll;

    ll = &LightList[i];
    ll->_lradius = (ll->_lradius & 0xF) | c;
}

void ProcessLightList(void)
{
    int i, j;
    unsigned char temp;
    struct LightListStruct2 *ll;

    DoUnLight();
    for (j = 0; j < numlights; j++) {
        i = lightactive[j];
        ll = &LightList[i];
        if (!ll->_ldel)
            DoLighting(ll->_lx, ll->_ly, ll->_lradius, i);
    }
    for (j = 0; j < numlights;) {
        i = lightactive[j];
        ll = &LightList[i];
        if (ll->_ldel) {
            temp = lightactive[--numlights];
            lightactive[numlights] = lightactive[j];
            lightactive[j] = temp;
        } else
            j++;
    }
}

void SavePreLighting(void)
{
}

void InitVision(void)
{
    int i;

    numvision = 0;
    dovision = 0;
    visionid = 1;
    for (i = 0; i < TransVal; i++)
        TransList[i] = 0;
}

int AddVision(int x, int y, int r, unsigned char mine)
{
    int vid = 0;

    if (numvision < MAXVISION) {
        struct LightListStruct *vl;

        vl = &VisionList[numvision];
        vl->_lx = x;
        vl->_ly = y;
        vl->_lradius = r;
        vid = visionid++;
        vl->_lid = vid;
        vl->_ldel = 0;
        vl->_lunflag = 0;
        vl->_lflags = mine;
        numvision++;
        dovision = 1;
    }
    return vid;
}

void ChangeVisionRadius(int id, int r)
{
    int i;

    for (i = 0; i < numvision; i++) {
        if (VisionList[i]._lid == id) {
            VisionList[i]._lunflag = 1;
            VisionList[i]._lunx = VisionList[i]._lx;
            VisionList[i]._luny = VisionList[i]._ly;
            VisionList[i]._lunr = VisionList[i]._lradius;
            VisionList[i]._lradius = r;
            dovision = 1;
        }
    }
}

void ChangeVisionXY(int id, int x, int y)
{
    int i;
    struct LightListStruct *vl;

    vl = VisionList;
    for (i = 0; i < numvision; i++) {
        if (vl->_lid == id) {
            vl->_lunflag = 1;
            vl->_lunx = vl->_lx;
            vl->_luny = vl->_ly;
            vl->_lunr = vl->_lradius;
            vl->_lx = x;
            vl->_ly = y;
            dovision = 1;
        }
        vl++;
    }
}

void ProcessVisionList(void)
{
    int i;
    unsigned char delflag;
    struct LightListStruct *vl;

    if (dovision) {
        vl = VisionList;
        for (i = 0; i < numvision; vl++, i++) {
            if (vl->_ldel)
                DoUnVision(vl->_lx, vl->_ly, vl->_lradius, vl->_lflags);
            if (vl->_lunflag) {
                DoUnVision(vl->_lunx, vl->_luny, vl->_lunr, vl->_lflags);
                vl->_lunflag = 0;
            }
        }
        for (i = 0; i < TransVal; i++)
            TransList[i] = 0;
        vl = VisionList;
        for (i = 0; i < numvision; vl++, i++)
            if (!vl->_ldel)
                DoVision(vl->_lx, vl->_ly, vl->_lradius, 1, vl->_lflags);
        do {
            delflag = 0;
            vl = VisionList;
            for (i = 0; i < numvision; vl++, i++) {
                if (vl->_ldel) {
                    numvision--;
                    if (numvision > 0 && i != numvision)
                        *vl = VisionList[numvision];
                    delflag = 1;
                }
            }
        } while (delflag);
    }
    dovision = 0;
}
