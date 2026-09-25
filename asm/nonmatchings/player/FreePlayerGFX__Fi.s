.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FreePlayerGFX__Fi, 0x4C

glabel FreePlayerGFX__Fi
    /* 570D8 800670D8 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 570DC 800670DC 1000BFAF */  sw         $ra, 0x10($sp)
    /* 570E0 800670E0 40100400 */  sll        $v0, $a0, 1
    /* 570E4 800670E4 21104400 */  addu       $v0, $v0, $a0
    /* 570E8 800670E8 80100200 */  sll        $v0, $v0, 2
    /* 570EC 800670EC 21104400 */  addu       $v0, $v0, $a0
    /* 570F0 800670F0 00110200 */  sll        $v0, $v0, 4
    /* 570F4 800670F4 23104400 */  subu       $v0, $v0, $a0
    /* 570F8 800670F8 80100200 */  sll        $v0, $v0, 2
    /* 570FC 800670FC 21104400 */  addu       $v0, $v0, $a0
    /* 57100 80067100 C0100200 */  sll        $v0, $v0, 3
    /* 57104 80067104 0E80043C */  lui        $a0, %hi(plr)
    /* 57108 80067108 38A58424 */  addiu      $a0, $a0, %lo(plr)
    /* 5710C 8006710C 857F010C */  jal        FreePlayerGFX__FP12PlayerStruct
    /* 57110 80067110 21204400 */   addu      $a0, $v0, $a0
    /* 57114 80067114 1000BF8F */  lw         $ra, 0x10($sp)
    /* 57118 80067118 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 5711C 8006711C 0800E003 */  jr         $ra
    /* 57120 80067120 00000000 */   nop
endlabel FreePlayerGFX__Fi
