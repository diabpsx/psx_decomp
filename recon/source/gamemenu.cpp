/* GAMEMENU.CPP — Diablo PSX (Climax 1998) reconstruction.  Twin: refs/devilution/Source/gamemenu.cpp,
 * refs/devilutionx/Source/gamemenu.cpp.
 *
 * PSX DELTA: on PC, gamemenu_off() calls gmenu_set_items(NULL, NULL) to tear down the mouse-driven
 * pause/options menu (devilutionx additionally clears isGameMenuOpen). The PSX port has no PC-style
 * gmenu_* text-menu system at all (its pause/options UI lives in the frontend/GAME overlay's own menu
 * classes) — so on this build gamemenu_off() compiled down to a genuinely EMPTY leaf function: the
 * retail oracle is exactly `jr $ra; nop` (8 bytes, 0x800827D0-0x800827D8), no `jal` to anything. With
 * -fno-inline in force (confirmed project-wide, see 00_current_diablo.md fact 8), a real call to
 * gmenu_set_items would have to show up as a jal; its total absence means the source body itself is
 * empty. Only this one function survives from the whole original GAMEMENU.CPP source file in this
 * build (SYM has no other GAMEMENU.CPP entries) — every other caller-visible gamemenu_* PC routine
 * (gamemenu_on, gamemenu_handle_previous, gamemenu_previous, ...) was dropped entirely; whatever
 * still calls gamemenu_off() elsewhere in this port only needs the empty stub. */
#include "diabpsx_types.h"
#include "source/gen/structs_gamemenu.h"
#include "source/gen/externs_gamemenu.h"
#include "source/gen/protos_gamemenu.h"
#include "source/diablo.h"

void gamemenu_off(void)
{
}
