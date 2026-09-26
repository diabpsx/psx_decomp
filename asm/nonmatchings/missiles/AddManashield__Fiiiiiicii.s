.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddManashield__Fiiiiiicii, 0xD4

glabel AddManashield__Fiiiiiicii
    /* 5C44 8013F83C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 5C48 8013F840 80280400 */  sll        $a1, $a0, 2
    /* 5C4C 8013F844 2128A400 */  addu       $a1, $a1, $a0
    /* 5C50 8013F848 80280500 */  sll        $a1, $a1, 2
    /* 5C54 8013F84C 3400A68F */  lw         $a2, 0x34($sp)
    /* 5C58 8013F850 2328A400 */  subu       $a1, $a1, $a0
    /* 5C5C 8013F854 1000BFAF */  sw         $ra, 0x10($sp)
    /* 5C60 8013F858 40100600 */  sll        $v0, $a2, 1
    /* 5C64 8013F85C 21104600 */  addu       $v0, $v0, $a2
    /* 5C68 8013F860 80100200 */  sll        $v0, $v0, 2
    /* 5C6C 8013F864 21104600 */  addu       $v0, $v0, $a2
    /* 5C70 8013F868 00110200 */  sll        $v0, $v0, 4
    /* 5C74 8013F86C 23104600 */  subu       $v0, $v0, $a2
    /* 5C78 8013F870 80100200 */  sll        $v0, $v0, 2
    /* 5C7C 8013F874 21104600 */  addu       $v0, $v0, $a2
    /* 5C80 8013F878 C0100200 */  sll        $v0, $v0, 3
    /* 5C84 8013F87C 0E80013C */  lui        $at, %hi(plr + 0x13C)
    /* 5C88 8013F880 21082200 */  addu       $at, $at, $v0
    /* 5C8C 8013F884 74A62390 */  lbu        $v1, %lo(plr + 0x13C)($at)
    /* 5C90 8013F888 80280500 */  sll        $a1, $a1, 2
    /* 5C94 8013F88C 001E0300 */  sll        $v1, $v1, 24
    /* 5C98 8013F890 C3240300 */  sra        $a0, $v1, 19
    /* 5C9C 8013F894 031D0300 */  sra        $v1, $v1, 20
    /* 5CA0 8013F898 21208300 */  addu       $a0, $a0, $v1
    /* 5CA4 8013F89C 1080013C */  lui        $at, %hi(missile + 0x18)
    /* 5CA8 8013F8A0 21082500 */  addu       $at, $at, $a1
    /* 5CAC 8013F8A4 702C24A4 */  sh         $a0, %lo(missile + 0x18)($at)
    /* 5CB0 8013F8A8 0E80013C */  lui        $at, %hi(plr + 0x11C)
    /* 5CB4 8013F8AC 21082200 */  addu       $at, $at, $v0
    /* 5CB8 8013F8B0 54A6238C */  lw         $v1, %lo(plr + 0x11C)($at)
    /* 5CBC 8013F8B4 1080013C */  lui        $at, %hi(missile + 0x1E)
    /* 5CC0 8013F8B8 21082500 */  addu       $at, $at, $a1
    /* 5CC4 8013F8BC 762C23A4 */  sh         $v1, %lo(missile + 0x1E)($at)
    /* 5CC8 8013F8C0 3000A38F */  lw         $v1, 0x30($sp)
    /* 5CCC 8013F8C4 0E80013C */  lui        $at, %hi(plr + 0x114)
    /* 5CD0 8013F8C8 21082200 */  addu       $at, $at, $v0
    /* 5CD4 8013F8CC 4CA6248C */  lw         $a0, %lo(plr + 0x114)($at)
    /* 5CD8 8013F8D0 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 5CDC 8013F8D4 1080013C */  lui        $at, %hi(missile + 0x2C)
    /* 5CE0 8013F8D8 21082500 */  addu       $at, $at, $a1
    /* 5CE4 8013F8DC 842C22A4 */  sh         $v0, %lo(missile + 0x2C)($at)
    /* 5CE8 8013F8E0 001E0300 */  sll        $v1, $v1, 24
    /* 5CEC 8013F8E4 1080013C */  lui        $at, %hi(missile + 0x20)
    /* 5CF0 8013F8E8 21082500 */  addu       $at, $at, $a1
    /* 5CF4 8013F8EC 782C24A4 */  sh         $a0, %lo(missile + 0x20)($at)
    /* 5CF8 8013F8F0 03006014 */  bnez       $v1, .L8013F900
    /* 5CFC 8013F8F4 2120C000 */   addu      $a0, $a2, $zero
    /* 5D00 8013F8F8 C2DC010C */  jal        UseMana__Fii
    /* 5D04 8013F8FC 0B000524 */   addiu     $a1, $zero, 0xB
  .L8013F900:
    /* 5D08 8013F900 1000BF8F */  lw         $ra, 0x10($sp)
    /* 5D0C 8013F904 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 5D10 8013F908 0800E003 */  jr         $ra
    /* 5D14 8013F90C 00000000 */   nop
endlabel AddManashield__Fiiiiiicii
