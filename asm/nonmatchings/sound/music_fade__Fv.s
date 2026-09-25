.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching music_fade__Fv, 0x40

glabel music_fade__Fv
    /* 67E90 80077E90 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 67E94 80077E94 1280033C */  lui        $v1, %hi(FileSYS)
    /* 67E98 80077E98 ECAA638C */  lw         $v1, %lo(FileSYS)($v1)
    /* 67E9C 80077E9C 02000224 */  addiu      $v0, $zero, 0x2
    /* 67EA0 80077EA0 07006214 */  bne        $v1, $v0, .L80077EC0
    /* 67EA4 80077EA4 1000BFAF */   sw        $ra, 0x10($sp)
    /* 67EA8 80077EA8 3414848F */  lw         $a0, %gp_rel(sghMusic)($gp)
    /* 67EAC 80077EAC 00000000 */  nop
    /* 67EB0 80077EB0 03008010 */  beqz       $a0, .L80077EC0
    /* 67EB4 80077EB4 00000000 */   nop
    /* 67EB8 80077EB8 E264020C */  jal        STR_SoundCommand__FP6SFXHDRi
    /* 67EBC 80077EBC 05000524 */   addiu     $a1, $zero, 0x5
  .L80077EC0:
    /* 67EC0 80077EC0 1000BF8F */  lw         $ra, 0x10($sp)
    /* 67EC4 80077EC4 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 67EC8 80077EC8 0800E003 */  jr         $ra
    /* 67ECC 80077ECC 00000000 */   nop
endlabel music_fade__Fv
