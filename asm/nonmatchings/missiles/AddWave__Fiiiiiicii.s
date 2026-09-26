.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddWave__Fiiiiiicii, 0x8C

glabel AddWave__Fiiiiiicii
    /* 7A2C 80141624 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 7A30 80141628 80100400 */  sll        $v0, $a0, 2
    /* 7A34 8014162C 21104400 */  addu       $v0, $v0, $a0
    /* 7A38 80141630 80100200 */  sll        $v0, $v0, 2
    /* 7A3C 80141634 23104400 */  subu       $v0, $v0, $a0
    /* 7A40 80141638 80100200 */  sll        $v0, $v0, 2
    /* 7A44 8014163C 01000324 */  addiu      $v1, $zero, 0x1
    /* 7A48 80141640 1000BFAF */  sw         $ra, 0x10($sp)
    /* 7A4C 80141644 1080013C */  lui        $at, %hi(missile + 0x1E)
    /* 7A50 80141648 21082200 */  addu       $at, $at, $v0
    /* 7A54 8014164C 762C27A4 */  sh         $a3, %lo(missile + 0x1E)($at)
    /* 7A58 80141650 1080013C */  lui        $at, %hi(missile + 0x22)
    /* 7A5C 80141654 21082200 */  addu       $at, $at, $v0
    /* 7A60 80141658 7A2C20A4 */  sh         $zero, %lo(missile + 0x22)($at)
    /* 7A64 8014165C 1080013C */  lui        $at, %hi(missile + 0x24)
    /* 7A68 80141660 21082200 */  addu       $at, $at, $v0
    /* 7A6C 80141664 7C2C20A4 */  sh         $zero, %lo(missile + 0x24)($at)
    /* 7A70 80141668 1080013C */  lui        $at, %hi(missile + 0x18)
    /* 7A74 8014166C 21082200 */  addu       $at, $at, $v0
    /* 7A78 80141670 702C23A4 */  sh         $v1, %lo(missile + 0x18)($at)
    /* 7A7C 80141674 2800A48F */  lw         $a0, 0x28($sp)
    /* 7A80 80141678 04000324 */  addiu      $v1, $zero, 0x4
    /* 7A84 8014167C 1080013C */  lui        $at, %hi(missile + 0x47)
    /* 7A88 80141680 21082200 */  addu       $at, $at, $v0
    /* 7A8C 80141684 9F2C23A0 */  sb         $v1, %lo(missile + 0x47)($at)
    /* 7A90 80141688 1080013C */  lui        $at, %hi(missile + 0x20)
    /* 7A94 8014168C 21082200 */  addu       $at, $at, $v0
    /* 7A98 80141690 782C24A4 */  sh         $a0, %lo(missile + 0x20)($at)
    /* 7A9C 80141694 3400A48F */  lw         $a0, 0x34($sp)
    /* 7AA0 80141698 C2DC010C */  jal        UseMana__Fii
    /* 7AA4 8014169C 0F000524 */   addiu     $a1, $zero, 0xF
    /* 7AA8 801416A0 1000BF8F */  lw         $ra, 0x10($sp)
    /* 7AAC 801416A4 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 7AB0 801416A8 0800E003 */  jr         $ra
    /* 7AB4 801416AC 00000000 */   nop
endlabel AddWave__Fiiiiiicii
