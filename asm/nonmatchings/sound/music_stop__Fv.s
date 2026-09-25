.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching music_stop__Fv, 0x40

glabel music_stop__Fv
    /* 67E50 80077E50 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 67E54 80077E54 1280033C */  lui        $v1, %hi(FileSYS)
    /* 67E58 80077E58 ECAA638C */  lw         $v1, %lo(FileSYS)($v1)
    /* 67E5C 80077E5C 02000224 */  addiu      $v0, $zero, 0x2
    /* 67E60 80077E60 07006214 */  bne        $v1, $v0, .L80077E80
    /* 67E64 80077E64 1000BFAF */   sw        $ra, 0x10($sp)
    /* 67E68 80077E68 3414848F */  lw         $a0, %gp_rel(sghMusic)($gp)
    /* 67E6C 80077E6C 00000000 */  nop
    /* 67E70 80077E70 03008010 */  beqz       $a0, .L80077E80
    /* 67E74 80077E74 00000000 */   nop
    /* 67E78 80077E78 E264020C */  jal        STR_SoundCommand__FP6SFXHDRi
    /* 67E7C 80077E7C 08000524 */   addiu     $a1, $zero, 0x8
  .L80077E80:
    /* 67E80 80077E80 1000BF8F */  lw         $ra, 0x10($sp)
    /* 67E84 80077E84 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 67E88 80077E88 0800E003 */  jr         $ra
    /* 67E8C 80077E8C 00000000 */   nop
endlabel music_stop__Fv
