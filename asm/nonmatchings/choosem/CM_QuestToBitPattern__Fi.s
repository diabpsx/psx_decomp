.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CM_QuestToBitPattern__Fi, 0xD8

glabel CM_QuestToBitPattern__Fi
    /* 1BE0C 80155A04 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1BE10 80155A08 1000B0AF */  sw         $s0, 0x10($sp)
    /* 1BE14 80155A0C 21800000 */  addu       $s0, $zero, $zero
    /* 1BE18 80155A10 FEFF8424 */  addiu      $a0, $a0, -0x2
    /* 1BE1C 80155A14 0E00822C */  sltiu      $v0, $a0, 0xE
    /* 1BE20 80155A18 22004010 */  beqz       $v0, .L80155AA4
    /* 1BE24 80155A1C 1400BFAF */   sw        $ra, 0x14($sp)
    /* 1BE28 80155A20 80100400 */  sll        $v0, $a0, 2
    /* 1BE2C 80155A24 1280013C */  lui        $at, %hi(jtbl_80119774)
    /* 1BE30 80155A28 21082200 */  addu       $at, $at, $v0
    /* 1BE34 80155A2C 7497228C */  lw         $v0, %lo(jtbl_80119774)($at)
    /* 1BE38 80155A30 00000000 */  nop
    /* 1BE3C 80155A34 08004000 */  jr         $v0
    /* 1BE40 80155A38 00000000 */   nop
    /* 1BE44 80155A3C B1560508 */  j          .L80155AC4
    /* 1BE48 80155A40 01001024 */   addiu     $s0, $zero, 0x1
    /* 1BE4C 80155A44 B1560508 */  j          .L80155AC4
    /* 1BE50 80155A48 02001024 */   addiu     $s0, $zero, 0x2
    /* 1BE54 80155A4C B1560508 */  j          .L80155AC4
    /* 1BE58 80155A50 04001024 */   addiu     $s0, $zero, 0x4
    /* 1BE5C 80155A54 B1560508 */  j          .L80155AC4
    /* 1BE60 80155A58 08001024 */   addiu     $s0, $zero, 0x8
    /* 1BE64 80155A5C B1560508 */  j          .L80155AC4
    /* 1BE68 80155A60 10001024 */   addiu     $s0, $zero, 0x10
    /* 1BE6C 80155A64 B1560508 */  j          .L80155AC4
    /* 1BE70 80155A68 20001024 */   addiu     $s0, $zero, 0x20
    /* 1BE74 80155A6C B1560508 */  j          .L80155AC4
    /* 1BE78 80155A70 40001024 */   addiu     $s0, $zero, 0x40
    /* 1BE7C 80155A74 B1560508 */  j          .L80155AC4
    /* 1BE80 80155A78 80001024 */   addiu     $s0, $zero, 0x80
    /* 1BE84 80155A7C B1560508 */  j          .L80155AC4
    /* 1BE88 80155A80 00011024 */   addiu     $s0, $zero, 0x100
    /* 1BE8C 80155A84 B1560508 */  j          .L80155AC4
    /* 1BE90 80155A88 00021024 */   addiu     $s0, $zero, 0x200
    /* 1BE94 80155A8C B1560508 */  j          .L80155AC4
    /* 1BE98 80155A90 00041024 */   addiu     $s0, $zero, 0x400
    /* 1BE9C 80155A94 B1560508 */  j          .L80155AC4
    /* 1BEA0 80155A98 00081024 */   addiu     $s0, $zero, 0x800
    /* 1BEA4 80155A9C B1560508 */  j          .L80155AC4
    /* 1BEA8 80155AA0 00101024 */   addiu     $s0, $zero, 0x1000
  .L80155AA4:
    /* 1BEAC 80155AA4 1280023C */  lui        $v0, %hi(D_8011972C)
    /* 1BEB0 80155AA8 2C974224 */  addiu      $v0, $v0, %lo(D_8011972C)
    /* 1BEB4 80155AAC 05004010 */  beqz       $v0, .L80155AC4
    /* 1BEB8 80155AB0 21200000 */   addu      $a0, $zero, $zero
    /* 1BEBC 80155AB4 1280053C */  lui        $a1, %hi(D_80119740)
    /* 1BEC0 80155AB8 4097A524 */  addiu      $a1, $a1, %lo(D_80119740)
    /* 1BEC4 80155ABC A583000C */  jal        DBG_Error
    /* 1BEC8 80155AC0 C0000624 */   addiu     $a2, $zero, 0xC0
  .L80155AC4:
    /* 1BECC 80155AC4 21100002 */  addu       $v0, $s0, $zero
    /* 1BED0 80155AC8 1400BF8F */  lw         $ra, 0x14($sp)
    /* 1BED4 80155ACC 1000B08F */  lw         $s0, 0x10($sp)
    /* 1BED8 80155AD0 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1BEDC 80155AD4 0800E003 */  jr         $ra
    /* 1BEE0 80155AD8 00000000 */   nop
endlabel CM_QuestToBitPattern__Fi
