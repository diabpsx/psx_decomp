.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddHealOther__Fiiiiiicii, 0x70

glabel AddHealOther__Fiiiiiicii
    /* 731C 80140F14 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 7320 80140F18 80100400 */  sll        $v0, $a0, 2
    /* 7324 80140F1C 21104400 */  addu       $v0, $v0, $a0
    /* 7328 80140F20 80100200 */  sll        $v0, $v0, 2
    /* 732C 80140F24 23104400 */  subu       $v0, $v0, $a0
    /* 7330 80140F28 80100200 */  sll        $v0, $v0, 2
    /* 7334 80140F2C 01000324 */  addiu      $v1, $zero, 0x1
    /* 7338 80140F30 1000B0AF */  sw         $s0, 0x10($sp)
    /* 733C 80140F34 3400B08F */  lw         $s0, 0x34($sp)
    /* 7340 80140F38 22000524 */  addiu      $a1, $zero, 0x22
    /* 7344 80140F3C 1400BFAF */  sw         $ra, 0x14($sp)
    /* 7348 80140F40 1080013C */  lui        $at, %hi(missile + 0x38)
    /* 734C 80140F44 21082200 */  addu       $at, $at, $v0
    /* 7350 80140F48 902C23A0 */  sb         $v1, %lo(missile + 0x38)($at)
    /* 7354 80140F4C C2DC010C */  jal        UseMana__Fii
    /* 7358 80140F50 21200002 */   addu      $a0, $s0, $zero
    /* 735C 80140F54 1280023C */  lui        $v0, %hi(myplr)
    /* 7360 80140F58 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 7364 80140F5C 00000000 */  nop
    /* 7368 80140F60 03000216 */  bne        $s0, $v0, .L80140F70
    /* 736C 80140F64 00000000 */   nop
    /* 7370 80140F68 01DE000C */  jal        NewCursor__Fi
    /* 7374 80140F6C 0A000424 */   addiu     $a0, $zero, 0xA
  .L80140F70:
    /* 7378 80140F70 1400BF8F */  lw         $ra, 0x14($sp)
    /* 737C 80140F74 1000B08F */  lw         $s0, 0x10($sp)
    /* 7380 80140F78 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 7384 80140F7C 0800E003 */  jr         $ra
    /* 7388 80140F80 00000000 */   nop
endlabel AddHealOther__Fiiiiiicii
