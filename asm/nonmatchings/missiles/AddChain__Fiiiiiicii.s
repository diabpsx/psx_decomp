.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddChain__Fiiiiiicii, 0x64

glabel AddChain__Fiiiiiicii
    /* 62EC 8013FEE4 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 62F0 8013FEE8 80100400 */  sll        $v0, $a0, 2
    /* 62F4 8013FEEC 21104400 */  addu       $v0, $v0, $a0
    /* 62F8 8013FEF0 80100200 */  sll        $v0, $v0, 2
    /* 62FC 8013FEF4 23104400 */  subu       $v0, $v0, $a0
    /* 6300 8013FEF8 80100200 */  sll        $v0, $v0, 2
    /* 6304 8013FEFC 1000BFAF */  sw         $ra, 0x10($sp)
    /* 6308 8013FF00 1080013C */  lui        $at, %hi(missile + 0x1E)
    /* 630C 8013FF04 21082200 */  addu       $at, $at, $v0
    /* 6310 8013FF08 762C27A4 */  sh         $a3, %lo(missile + 0x1E)($at)
    /* 6314 8013FF0C 2800A48F */  lw         $a0, 0x28($sp)
    /* 6318 8013FF10 01000324 */  addiu      $v1, $zero, 0x1
    /* 631C 8013FF14 1080013C */  lui        $at, %hi(missile + 0x18)
    /* 6320 8013FF18 21082200 */  addu       $at, $at, $v0
    /* 6324 8013FF1C 702C23A4 */  sh         $v1, %lo(missile + 0x18)($at)
    /* 6328 8013FF20 1080013C */  lui        $at, %hi(missile + 0x20)
    /* 632C 8013FF24 21082200 */  addu       $at, $at, $v0
    /* 6330 8013FF28 782C24A4 */  sh         $a0, %lo(missile + 0x20)($at)
    /* 6334 8013FF2C 3400A48F */  lw         $a0, 0x34($sp)
    /* 6338 8013FF30 C2DC010C */  jal        UseMana__Fii
    /* 633C 8013FF34 0E000524 */   addiu     $a1, $zero, 0xE
    /* 6340 8013FF38 1000BF8F */  lw         $ra, 0x10($sp)
    /* 6344 8013FF3C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 6348 8013FF40 0800E003 */  jr         $ra
    /* 634C 8013FF44 00000000 */   nop
endlabel AddChain__Fiiiiiicii
