.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SpuSetTransferMode, 0x30

glabel SpuSetTransferMode
    /* 8F1C 80018F1C 05008010 */  beqz       $a0, .L80018F34
    /* 8F20 80018F20 01000224 */   addiu     $v0, $zero, 0x1
    /* 8F24 80018F24 04008214 */  bne        $a0, $v0, .L80018F38
    /* 8F28 80018F28 21100000 */   addu      $v0, $zero, $zero
    /* 8F2C 80018F2C CE630008 */  j          .L80018F38
    /* 8F30 80018F30 01000224 */   addiu     $v0, $zero, 0x1
  .L80018F34:
    /* 8F34 80018F34 21100000 */  addu       $v0, $zero, $zero
  .L80018F38:
    /* 8F38 80018F38 0B80013C */  lui        $at, %hi(_spu_trans_mode)
    /* 8F3C 80018F3C DC5524AC */  sw         $a0, %lo(_spu_trans_mode)($at)
    /* 8F40 80018F40 0B80013C */  lui        $at, %hi(_spu_transMode)
    /* 8F44 80018F44 0800E003 */  jr         $ra
    /* 8F48 80018F48 685A22AC */   sw        $v0, %lo(_spu_transMode)($at)
endlabel SpuSetTransferMode
