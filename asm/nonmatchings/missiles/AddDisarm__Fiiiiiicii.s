.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddDisarm__Fiiiiiicii, 0x70

glabel AddDisarm__Fiiiiiicii
    /* 7E38 80141A30 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 7E3C 80141A34 80100400 */  sll        $v0, $a0, 2
    /* 7E40 80141A38 21104400 */  addu       $v0, $v0, $a0
    /* 7E44 80141A3C 80100200 */  sll        $v0, $v0, 2
    /* 7E48 80141A40 23104400 */  subu       $v0, $v0, $a0
    /* 7E4C 80141A44 80100200 */  sll        $v0, $v0, 2
    /* 7E50 80141A48 01000324 */  addiu      $v1, $zero, 0x1
    /* 7E54 80141A4C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 7E58 80141A50 3400B08F */  lw         $s0, 0x34($sp)
    /* 7E5C 80141A54 1C000524 */  addiu      $a1, $zero, 0x1C
    /* 7E60 80141A58 1400BFAF */  sw         $ra, 0x14($sp)
    /* 7E64 80141A5C 1080013C */  lui        $at, %hi(missile + 0x38)
    /* 7E68 80141A60 21082200 */  addu       $at, $at, $v0
    /* 7E6C 80141A64 902C23A0 */  sb         $v1, %lo(missile + 0x38)($at)
    /* 7E70 80141A68 C2DC010C */  jal        UseMana__Fii
    /* 7E74 80141A6C 21200002 */   addu      $a0, $s0, $zero
    /* 7E78 80141A70 1280023C */  lui        $v0, %hi(myplr)
    /* 7E7C 80141A74 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 7E80 80141A78 00000000 */  nop
    /* 7E84 80141A7C 03000216 */  bne        $s0, $v0, .L80141A8C
    /* 7E88 80141A80 00000000 */   nop
    /* 7E8C 80141A84 01DE000C */  jal        NewCursor__Fi
    /* 7E90 80141A88 05000424 */   addiu     $a0, $zero, 0x5
  .L80141A8C:
    /* 7E94 80141A8C 1400BF8F */  lw         $ra, 0x14($sp)
    /* 7E98 80141A90 1000B08F */  lw         $s0, 0x10($sp)
    /* 7E9C 80141A94 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 7EA0 80141A98 0800E003 */  jr         $ra
    /* 7EA4 80141A9C 00000000 */   nop
endlabel AddDisarm__Fiiiiiicii
