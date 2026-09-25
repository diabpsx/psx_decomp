.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SpuInitMalloc, 0x54

glabel SpuInitMalloc
    /* 735C 8001735C 21108000 */  addu       $v0, $a0, $zero
    /* 7360 80017360 0300401C */  bgtz       $v0, .L80017370
    /* 7364 80017364 0040033C */   lui       $v1, (0x40001010 >> 16)
    /* 7368 80017368 EA5C0008 */  j          .L800173A8
    /* 736C 8001736C 21100000 */   addu      $v0, $zero, $zero
  .L80017370:
    /* 7370 80017370 0B80043C */  lui        $a0, %hi(_spu_mem_mode_plus)
    /* 7374 80017374 745A848C */  lw         $a0, %lo(_spu_mem_mode_plus)($a0)
    /* 7378 80017378 10106334 */  ori        $v1, $v1, (0x40001010 & 0xFFFF)
    /* 737C 8001737C 0000A3AC */  sw         $v1, 0x0($a1)
    /* 7380 80017380 0100033C */  lui        $v1, (0x10000 >> 16)
    /* 7384 80017384 0B80013C */  lui        $at, %hi(_spu_memList)
    /* 7388 80017388 B45A25AC */  sw         $a1, %lo(_spu_memList)($at)
    /* 738C 8001738C 0B80013C */  lui        $at, %hi(_spu_AllocLastNum)
    /* 7390 80017390 B05A20AC */  sw         $zero, %lo(_spu_AllocLastNum)($at)
    /* 7394 80017394 0B80013C */  lui        $at, %hi(_spu_AllocBlockNum)
    /* 7398 80017398 AC5A22AC */  sw         $v0, %lo(_spu_AllocBlockNum)($at)
    /* 739C 8001739C 04188300 */  sllv       $v1, $v1, $a0
    /* 73A0 800173A0 F0EF6324 */  addiu      $v1, $v1, -0x1010
    /* 73A4 800173A4 0400A3AC */  sw         $v1, 0x4($a1)
  .L800173A8:
    /* 73A8 800173A8 0800E003 */  jr         $ra
    /* 73AC 800173AC 00000000 */   nop
endlabel SpuInitMalloc
    /* 73B0 800173B0 00000000 */  nop
    /* 73B4 800173B4 00000000 */  nop
    /* 73B8 800173B8 00000000 */  nop
