.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching setasyncfile, 0x70

glabel setasyncfile
    /* 13DA4 80023DA4 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 13DA8 80023DA8 21288000 */  addu       $a1, $a0, $zero
    /* 13DAC 80023DAC 1380043C */  lui        $a0, %hi(D_8013504C)
    /* 13DB0 80023DB0 4C508424 */  addiu      $a0, $a0, %lo(D_8013504C)
    /* 13DB4 80023DB4 1000BFAF */  sw         $ra, 0x10($sp)
    /* 13DB8 80023DB8 0000828C */  lw         $v0, 0x0($a0)
    /* 13DBC 80023DBC 00000000 */  nop
    /* 13DC0 80023DC0 0E004014 */  bnez       $v0, .L80023DFC
    /* 13DC4 80023DC4 18008424 */   addiu     $a0, $a0, 0x18
    /* 13DC8 80023DC8 1180043C */  lui        $a0, %hi(D_8010E9A4)
    /* 13DCC 80023DCC A4E98424 */  addiu      $a0, $a0, %lo(D_8010E9A4)
    /* 13DD0 80023DD0 1180023C */  lui        $v0, %hi(D_8010E950)
    /* 13DD4 80023DD4 50E94224 */  addiu      $v0, $v0, %lo(D_8010E950)
    /* 13DD8 80023DD8 1280013C */  lui        $at, %hi(abortfile)
    /* 13DDC 80023DDC B8C322AC */  sw         $v0, %lo(abortfile)($at)
    /* 13DE0 80023DE0 54030224 */  addiu      $v0, $zero, 0x354
    /* 13DE4 80023DE4 1280013C */  lui        $at, %hi(abortline)
    /* 13DE8 80023DE8 BCC322AC */  sw         $v0, %lo(abortline)($at)
    /* 13DEC 80023DEC 0F95000C */  jal        abortmessage
    /* 13DF0 80023DF0 00000000 */   nop
    /* 13DF4 80023DF4 818F0008 */  j          .L80023E04
    /* 13DF8 80023DF8 00000000 */   nop
  .L80023DFC:
    /* 13DFC 80023DFC 8367000C */  jal        strncpy
    /* 13E00 80023E00 8F000624 */   addiu     $a2, $zero, 0x8F
  .L80023E04:
    /* 13E04 80023E04 1000BF8F */  lw         $ra, 0x10($sp)
    /* 13E08 80023E08 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 13E0C 80023E0C 0800E003 */  jr         $ra
    /* 13E10 80023E10 00000000 */   nop
endlabel setasyncfile
