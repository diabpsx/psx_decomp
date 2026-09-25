.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GAL_SetMemName, 0x70

glabel GAL_SetMemName
    /* 12270 80022270 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 12274 80022274 1000B0AF */  sw         $s0, 0x10($sp)
    /* 12278 80022278 21808000 */  addu       $s0, $a0, $zero
    /* 1227C 8002227C 1400B1AF */  sw         $s1, 0x14($sp)
    /* 12280 80022280 1800BFAF */  sw         $ra, 0x18($sp)
    /* 12284 80022284 B686000C */  jal        IsActiveValidHandle
    /* 12288 80022288 2188A000 */   addu      $s1, $a1, $zero
    /* 1228C 8002228C FF004230 */  andi       $v0, $v0, 0xFF
    /* 12290 80022290 0A004010 */  beqz       $v0, .L800222BC
    /* 12294 80022294 C0201000 */   sll       $a0, $s0, 3
    /* 12298 80022298 23209000 */  subu       $a0, $a0, $s0
    /* 1229C 8002229C 80200400 */  sll        $a0, $a0, 2
    /* 122A0 800222A0 1380023C */  lui        $v0, %hi(D_801325D0)
    /* 122A4 800222A4 D0254224 */  addiu      $v0, $v0, %lo(D_801325D0)
    /* 122A8 800222A8 21208200 */  addu       $a0, $a0, $v0
    /* 122AC 800222AC 0D8C000C */  jal        SetBlockName
    /* 122B0 800222B0 21282002 */   addu      $a1, $s1, $zero
    /* 122B4 800222B4 B2880008 */  j          .L800222C8
    /* 122B8 800222B8 01000234 */   ori       $v0, $zero, 0x1
  .L800222BC:
    /* 122BC 800222BC 0389000C */  jal        GSetError
    /* 122C0 800222C0 05000434 */   ori       $a0, $zero, 0x5
    /* 122C4 800222C4 21100000 */  addu       $v0, $zero, $zero
  .L800222C8:
    /* 122C8 800222C8 1800BF8F */  lw         $ra, 0x18($sp)
    /* 122CC 800222CC 1400B18F */  lw         $s1, 0x14($sp)
    /* 122D0 800222D0 1000B08F */  lw         $s0, 0x10($sp)
    /* 122D4 800222D4 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 122D8 800222D8 0800E003 */  jr         $ra
    /* 122DC 800222DC 00000000 */   nop
endlabel GAL_SetMemName
