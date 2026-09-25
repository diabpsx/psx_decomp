.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching stream_fade__Fv, 0x40

glabel stream_fade__Fv
    /* 2D9E8 8003D9E8 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 2D9EC 8003D9EC 1280033C */  lui        $v1, %hi(FileSYS)
    /* 2D9F0 8003D9F0 ECAA638C */  lw         $v1, %lo(FileSYS)($v1)
    /* 2D9F4 8003D9F4 02000224 */  addiu      $v0, $zero, 0x2
    /* 2D9F8 8003D9F8 07006214 */  bne        $v1, $v0, .L8003DA18
    /* 2D9FC 8003D9FC 1000BFAF */   sw        $ra, 0x10($sp)
    /* 2DA00 8003DA00 B410848F */  lw         $a0, %gp_rel(sghStream)($gp)
    /* 2DA04 8003DA04 00000000 */  nop
    /* 2DA08 8003DA08 03008010 */  beqz       $a0, .L8003DA18
    /* 2DA0C 8003DA0C 00000000 */   nop
    /* 2DA10 8003DA10 E264020C */  jal        STR_SoundCommand__FP6SFXHDRi
    /* 2DA14 8003DA14 05000524 */   addiu     $a1, $zero, 0x5
  .L8003DA18:
    /* 2DA18 8003DA18 1000BF8F */  lw         $ra, 0x10($sp)
    /* 2DA1C 8003DA1C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 2DA20 8003DA20 0800E003 */  jr         $ra
    /* 2DA24 8003DA24 00000000 */   nop
endlabel stream_fade__Fv
