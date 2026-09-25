.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching stream_resume__Fv, 0x50

glabel stream_resume__Fv
    /* 2D01C 8003D01C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 2D020 8003D020 1280033C */  lui        $v1, %hi(FileSYS)
    /* 2D024 8003D024 ECAA638C */  lw         $v1, %lo(FileSYS)($v1)
    /* 2D028 8003D028 02000224 */  addiu      $v0, $zero, 0x2
    /* 2D02C 8003D02C 0B006214 */  bne        $v1, $v0, .L8003D05C
    /* 2D030 8003D030 1000BFAF */   sw        $ra, 0x10($sp)
    /* 2D034 8003D034 B410848F */  lw         $a0, %gp_rel(sghStream)($gp)
    /* 2D038 8003D038 00000000 */  nop
    /* 2D03C 8003D03C 07008010 */  beqz       $a0, .L8003D05C
    /* 2D040 8003D040 00000000 */   nop
    /* 2D044 8003D044 00008280 */  lb         $v0, 0x0($a0)
    /* 2D048 8003D048 00000000 */  nop
    /* 2D04C 8003D04C 03004010 */  beqz       $v0, .L8003D05C
    /* 2D050 8003D050 00000000 */   nop
    /* 2D054 8003D054 E264020C */  jal        STR_SoundCommand__FP6SFXHDRi
    /* 2D058 8003D058 04000524 */   addiu     $a1, $zero, 0x4
  .L8003D05C:
    /* 2D05C 8003D05C 1000BF8F */  lw         $ra, 0x10($sp)
    /* 2D060 8003D060 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 2D064 8003D064 0800E003 */  jr         $ra
    /* 2D068 8003D068 00000000 */   nop
endlabel stream_resume__Fv
