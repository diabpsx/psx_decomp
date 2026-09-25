.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching func_8001FAE0, 0x34

glabel func_8001FAE0
    /* FAE0 8001FAE0 02800E3C */  lui        $t6, %hi(D_8001FA08)
    /* FAE4 8001FAE4 08FACE25 */  addiu      $t6, $t6, %lo(D_8001FA08)
    /* FAE8 8001FAE8 1280013C */  lui        $at, %hi(D_8011C928)
    /* FAEC 8001FAEC 28C92EAC */  sw         $t6, %lo(D_8011C928)($at)
    /* FAF0 8001FAF0 02800F3C */  lui        $t7, %hi(D_8001FA98)
    /* FAF4 8001FAF4 98FAEF25 */  addiu      $t7, $t7, %lo(D_8001FA98)
    /* FAF8 8001FAF8 1280013C */  lui        $at, %hi(D_8011C92C)
    /* FAFC 8001FAFC 2CC92FAC */  sw         $t7, %lo(D_8011C92C)($at)
    /* FB00 8001FB00 1280013C */  lui        $at, %hi(D_8011C924)
    /* FB04 8001FB04 24C920AC */  sw         $zero, %lo(D_8011C924)($at)
    /* FB08 8001FB08 1280013C */  lui        $at, %hi(D_8011C930)
    /* FB0C 8001FB0C 0800E003 */  jr         $ra
    /* FB10 8001FB10 30C920AC */   sw        $zero, %lo(D_8011C930)($at)
endlabel func_8001FAE0
