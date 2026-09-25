.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching func_8001FCB0, 0xC

glabel func_8001FCB0
    /* FCB0 8001FCB0 1280013C */  lui        $at, %hi(D_8011C934)
    /* FCB4 8001FCB4 0800E003 */  jr         $ra
    /* FCB8 8001FCB8 34C920AC */   sw        $zero, %lo(D_8011C934)($at)
endlabel func_8001FCB0
