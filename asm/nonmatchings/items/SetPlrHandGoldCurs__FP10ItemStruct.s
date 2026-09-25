.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetPlrHandGoldCurs__FP10ItemStruct, 0x30

glabel SetPlrHandGoldCurs__FP10ItemStruct
    /* 2FE7C 8003FE7C 1400838C */  lw         $v1, 0x14($a0)
    /* 2FE80 8003FE80 00000000 */  nop
    /* 2FE84 8003FE84 C4096228 */  slti       $v0, $v1, 0x9C4
    /* 2FE88 8003FE88 03004014 */  bnez       $v0, .L8003FE98
    /* 2FE8C 8003FE8C E9036228 */   slti      $v0, $v1, 0x3E9
    /* 2FE90 8003FE90 A9FF0008 */  j          .L8003FEA4
    /* 2FE94 8003FE94 06000224 */   addiu     $v0, $zero, 0x6
  .L8003FE98:
    /* 2FE98 8003FE98 02004014 */  bnez       $v0, .L8003FEA4
    /* 2FE9C 8003FE9C 04000224 */   addiu     $v0, $zero, 0x4
    /* 2FEA0 8003FEA0 05000224 */  addiu      $v0, $zero, 0x5
  .L8003FEA4:
    /* 2FEA4 8003FEA4 0800E003 */  jr         $ra
    /* 2FEA8 8003FEA8 4C0082A0 */   sb        $v0, 0x4C($a0)
endlabel SetPlrHandGoldCurs__FP10ItemStruct
