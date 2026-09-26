.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DrawButcher__Fv, 0x44

glabel DrawButcher__Fv
    /* 25194 8015ED8C 1280063C */  lui        $a2, %hi(setpc_x)
    /* 25198 8015ED90 E4C0C68C */  lw         $a2, %lo(setpc_x)($a2)
    /* 2519C 8015ED94 1280073C */  lui        $a3, %hi(setpc_y)
    /* 251A0 8015ED98 E8C0E78C */  lw         $a3, %lo(setpc_y)($a3)
    /* 251A4 8015ED9C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 251A8 8015EDA0 1000BFAF */  sw         $ra, 0x10($sp)
    /* 251AC 8015EDA4 40300600 */  sll        $a2, $a2, 1
    /* 251B0 8015EDA8 40380700 */  sll        $a3, $a3, 1
    /* 251B4 8015EDAC 1300C424 */  addiu      $a0, $a2, 0x13
    /* 251B8 8015EDB0 1300E524 */  addiu      $a1, $a3, 0x13
    /* 251BC 8015EDB4 1A00C624 */  addiu      $a2, $a2, 0x1A
    /* 251C0 8015EDB8 3968050C */  jal        DRLG_RectTrans__Fiiii
    /* 251C4 8015EDBC 1A00E724 */   addiu     $a3, $a3, 0x1A
    /* 251C8 8015EDC0 1000BF8F */  lw         $ra, 0x10($sp)
    /* 251CC 8015EDC4 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 251D0 8015EDC8 0800E003 */  jr         $ra
    /* 251D4 8015EDCC 00000000 */   nop
endlabel DrawButcher__Fv
