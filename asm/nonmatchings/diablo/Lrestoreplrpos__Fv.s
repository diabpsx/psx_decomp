.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching Lrestoreplrpos__Fv, 0x50

glabel Lrestoreplrpos__Fv
    /* 29220 80039220 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 29224 80039224 01000424 */  addiu      $a0, $zero, 0x1
    /* 29228 80039228 0E80053C */  lui        $a1, %hi(plr + 0x1B42)
    /* 2922C 8003922C 7AC0A584 */  lh         $a1, %lo(plr + 0x1B42)($a1)
    /* 29230 80039230 0E80063C */  lui        $a2, %hi(plr + 0x1B44)
    /* 29234 80039234 7CC0C684 */  lh         $a2, %lo(plr + 0x1B44)($a2)
    /* 29238 80039238 1000BFAF */  sw         $ra, 0x10($sp)
    /* 2923C 8003923C 2090020C */  jal        PlacePlayer__FiiiUc
    /* 29240 80039240 21380000 */   addu      $a3, $zero, $zero
    /* 29244 80039244 21200000 */  addu       $a0, $zero, $zero
    /* 29248 80039248 0E80053C */  lui        $a1, %hi(plr + 0x1B46)
    /* 2924C 8003924C 7EC0A584 */  lh         $a1, %lo(plr + 0x1B46)($a1)
    /* 29250 80039250 0E80063C */  lui        $a2, %hi(plr + 0x1B48)
    /* 29254 80039254 80C0C684 */  lh         $a2, %lo(plr + 0x1B48)($a2)
    /* 29258 80039258 2090020C */  jal        PlacePlayer__FiiiUc
    /* 2925C 8003925C 21380000 */   addu      $a3, $zero, $zero
    /* 29260 80039260 1000BF8F */  lw         $ra, 0x10($sp)
    /* 29264 80039264 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 29268 80039268 0800E003 */  jr         $ra
    /* 2926C 8003926C 00000000 */   nop
endlabel Lrestoreplrpos__Fv
