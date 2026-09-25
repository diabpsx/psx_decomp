.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching stream_stop__Fv, 0x5C

glabel stream_stop__Fv
    /* 2CF5C 8003CF5C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 2CF60 8003CF60 1280033C */  lui        $v1, %hi(FileSYS)
    /* 2CF64 8003CF64 ECAA638C */  lw         $v1, %lo(FileSYS)($v1)
    /* 2CF68 8003CF68 02000224 */  addiu      $v0, $zero, 0x2
    /* 2CF6C 8003CF6C 0E006214 */  bne        $v1, $v0, .L8003CFA8
    /* 2CF70 8003CF70 1000BFAF */   sw        $ra, 0x10($sp)
    /* 2CF74 8003CF74 0C80023C */  lui        $v0, %hi(SFXTab + 0x98)
    /* 2CF78 8003CF78 789C4224 */  addiu      $v0, $v0, %lo(SFXTab + 0x98)
    /* 2CF7C 8003CF7C ECFF4424 */  addiu      $a0, $v0, -0x14
    /* 2CF80 8003CF80 0464020C */  jal        STR_setvolume__FP6SFXHDR
    /* 2CF84 8003CF84 000040AC */   sw        $zero, 0x0($v0)
    /* 2CF88 8003CF88 B410848F */  lw         $a0, %gp_rel(sghStream)($gp)
    /* 2CF8C 8003CF8C 00000000 */  nop
    /* 2CF90 8003CF90 05008010 */  beqz       $a0, .L8003CFA8
    /* 2CF94 8003CF94 00000000 */   nop
    /* 2CF98 8003CF98 E264020C */  jal        STR_SoundCommand__FP6SFXHDRi
    /* 2CF9C 8003CF9C 08000524 */   addiu     $a1, $zero, 0x8
    /* 2CFA0 8003CFA0 EE80000C */  jal        TSK_Sleep
    /* 2CFA4 8003CFA4 01000424 */   addiu     $a0, $zero, 0x1
  .L8003CFA8:
    /* 2CFA8 8003CFA8 1000BF8F */  lw         $ra, 0x10($sp)
    /* 2CFAC 8003CFAC 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 2CFB0 8003CFB0 0800E003 */  jr         $ra
    /* 2CFB4 8003CFB4 00000000 */   nop
endlabel stream_stop__Fv
