.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SCR_DumpClut__Fv, 0x74

glabel SCR_DumpClut__Fv
    /* 8ACBC 8009ACBC 60FFBD27 */  addiu      $sp, $sp, -0xA0
    /* 8ACC0 8009ACC0 9800BFAF */  sw         $ra, 0x98($sp)
    /* 8ACC4 8009ACC4 00800434 */  ori        $a0, $zero, 0x8000
    /* 8ACC8 8009ACC8 3F000324 */  addiu      $v1, $zero, 0x3F
    /* 8ACCC 8009ACCC 8E00A227 */  addiu      $v0, $sp, 0x8E
  .L8009ACD0:
    /* 8ACD0 8009ACD0 080044A4 */  sh         $a0, 0x8($v0)
    /* 8ACD4 8009ACD4 FFFF6324 */  addiu      $v1, $v1, -0x1
    /* 8ACD8 8009ACD8 FDFF6104 */  bgez       $v1, .L8009ACD0
    /* 8ACDC 8009ACDC FEFF4224 */   addiu     $v0, $v0, -0x2
    /* 8ACE0 8009ACE0 1000A427 */  addiu      $a0, $sp, 0x10
    /* 8ACE4 8009ACE4 40010224 */  addiu      $v0, $zero, 0x140
    /* 8ACE8 8009ACE8 1000A2A7 */  sh         $v0, 0x10($sp)
    /* 8ACEC 8009ACEC FF000224 */  addiu      $v0, $zero, 0xFF
    /* 8ACF0 8009ACF0 1200A2A7 */  sh         $v0, 0x12($sp)
    /* 8ACF4 8009ACF4 40000224 */  addiu      $v0, $zero, 0x40
    /* 8ACF8 8009ACF8 1400A2A7 */  sh         $v0, 0x14($sp)
    /* 8ACFC 8009ACFC 01000224 */  addiu      $v0, $zero, 0x1
    /* 8AD00 8009AD00 1800A527 */  addiu      $a1, $sp, 0x18
    /* 8AD04 8009AD04 1800A0A7 */  sh         $zero, 0x18($sp)
    /* 8AD08 8009AD08 494F000C */  jal        LoadImage
    /* 8AD0C 8009AD0C 1600A2A7 */   sh        $v0, 0x16($sp)
    /* 8AD10 8009AD10 9E4E000C */  jal        DrawSync
    /* 8AD14 8009AD14 21200000 */   addu      $a0, $zero, $zero
    /* 8AD18 8009AD18 D43F0224 */  addiu      $v0, $zero, 0x3FD4
    /* 8AD1C 8009AD1C A40682A7 */  sh         $v0, %gp_rel(ShadClut)($gp)
    /* 8AD20 8009AD20 9800BF8F */  lw         $ra, 0x98($sp)
    /* 8AD24 8009AD24 A000BD27 */  addiu      $sp, $sp, 0xA0
    /* 8AD28 8009AD28 0800E003 */  jr         $ra
    /* 8AD2C 8009AD2C 00000000 */   nop
endlabel SCR_DumpClut__Fv
