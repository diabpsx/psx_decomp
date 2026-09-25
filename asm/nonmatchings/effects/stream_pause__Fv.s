.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching stream_pause__Fv, 0x64

glabel stream_pause__Fv
    /* 2CFB8 8003CFB8 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 2CFBC 8003CFBC 1280033C */  lui        $v1, %hi(FileSYS)
    /* 2CFC0 8003CFC0 ECAA638C */  lw         $v1, %lo(FileSYS)($v1)
    /* 2CFC4 8003CFC4 02000224 */  addiu      $v0, $zero, 0x2
    /* 2CFC8 8003CFC8 10006214 */  bne        $v1, $v0, .L8003D00C
    /* 2CFCC 8003CFCC 1000BFAF */   sw        $ra, 0x10($sp)
    /* 2CFD0 8003CFD0 0C80023C */  lui        $v0, %hi(SFXTab + 0x98)
    /* 2CFD4 8003CFD4 789C4224 */  addiu      $v0, $v0, %lo(SFXTab + 0x98)
    /* 2CFD8 8003CFD8 ECFF4424 */  addiu      $a0, $v0, -0x14
    /* 2CFDC 8003CFDC 0464020C */  jal        STR_setvolume__FP6SFXHDR
    /* 2CFE0 8003CFE0 000040AC */   sw        $zero, 0x0($v0)
    /* 2CFE4 8003CFE4 B410848F */  lw         $a0, %gp_rel(sghStream)($gp)
    /* 2CFE8 8003CFE8 00000000 */  nop
    /* 2CFEC 8003CFEC 07008010 */  beqz       $a0, .L8003D00C
    /* 2CFF0 8003CFF0 00000000 */   nop
    /* 2CFF4 8003CFF4 00008280 */  lb         $v0, 0x0($a0)
    /* 2CFF8 8003CFF8 00000000 */  nop
    /* 2CFFC 8003CFFC 03004010 */  beqz       $v0, .L8003D00C
    /* 2D000 8003D000 00000000 */   nop
    /* 2D004 8003D004 E264020C */  jal        STR_SoundCommand__FP6SFXHDRi
    /* 2D008 8003D008 03000524 */   addiu     $a1, $zero, 0x3
  .L8003D00C:
    /* 2D00C 8003D00C 1000BF8F */  lw         $ra, 0x10($sp)
    /* 2D010 8003D010 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 2D014 8003D014 0800E003 */  jr         $ra
    /* 2D018 8003D018 00000000 */   nop
endlabel stream_pause__Fv
