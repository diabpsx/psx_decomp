.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching HealotherStart__Fi, 0x38

glabel HealotherStart__Fi
    /* 90314 800A0314 01008438 */  xori       $a0, $a0, 0x1
    /* 90318 800A0318 C0100400 */  sll        $v0, $a0, 3
    /* 9031C 800A031C 21104400 */  addu       $v0, $v0, $a0
    /* 90320 800A0320 C0100200 */  sll        $v0, $v0, 3
    /* 90324 800A0324 01000324 */  addiu      $v1, $zero, 0x1
    /* 90328 800A0328 0D80013C */  lui        $at, %hi(SpellFXDat + 0x4)
    /* 9032C 800A032C 21082200 */  addu       $at, $at, $v0
    /* 90330 800A0330 E0C623AC */  sw         $v1, %lo(SpellFXDat + 0x4)($at)
    /* 90334 800A0334 14000324 */  addiu      $v1, $zero, 0x14
    /* 90338 800A0338 0D80013C */  lui        $at, %hi(SpellFXDat + 0x44)
    /* 9033C 800A033C 21082200 */  addu       $at, $at, $v0
    /* 90340 800A0340 20C723AC */  sw         $v1, %lo(SpellFXDat + 0x44)($at)
    /* 90344 800A0344 0800E003 */  jr         $ra
    /* 90348 800A0348 00000000 */   nop
endlabel HealotherStart__Fi
