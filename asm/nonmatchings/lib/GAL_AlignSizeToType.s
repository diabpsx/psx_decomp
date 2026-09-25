.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GAL_AlignSizeToType, 0x50

glabel GAL_AlignSizeToType
    /* 127E0 800227E0 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 127E4 800227E4 1000B0AF */  sw         $s0, 0x10($sp)
    /* 127E8 800227E8 21808000 */  addu       $s0, $a0, $zero
    /* 127EC 800227EC FFFF043C */  lui        $a0, (0xFFFF7FFF >> 16)
    /* 127F0 800227F0 FF7F8434 */  ori        $a0, $a0, (0xFFFF7FFF & 0xFFFF)
    /* 127F4 800227F4 1400BFAF */  sw         $ra, 0x14($sp)
    /* 127F8 800227F8 2687000C */  jal        GetMemInitInfoBlockFromType
    /* 127FC 800227FC 2420A400 */   and       $a0, $a1, $a0
    /* 12800 80022800 03004014 */  bnez       $v0, .L80022810
    /* 12804 80022804 00000000 */   nop
    /* 12808 80022808 078A0008 */  j          .L8002281C
    /* 1280C 8002280C FFFF0224 */   addiu     $v0, $zero, -0x1
  .L80022810:
    /* 12810 80022810 10004594 */  lhu        $a1, 0x10($v0)
    /* 12814 80022814 D086000C */  jal        AlignSize
    /* 12818 80022818 21200002 */   addu      $a0, $s0, $zero
  .L8002281C:
    /* 1281C 8002281C 1400BF8F */  lw         $ra, 0x14($sp)
    /* 12820 80022820 1000B08F */  lw         $s0, 0x10($sp)
    /* 12824 80022824 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 12828 80022828 0800E003 */  jr         $ra
    /* 1282C 8002282C 00000000 */   nop
endlabel GAL_AlignSizeToType
