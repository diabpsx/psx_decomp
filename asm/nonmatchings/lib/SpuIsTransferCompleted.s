.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SpuIsTransferCompleted, 0xA4

glabel SpuIsTransferCompleted
    /* 8F4C 80018F4C 0B80023C */  lui        $v0, %hi(_spu_trans_mode)
    /* 8F50 80018F50 DC55428C */  lw         $v0, %lo(_spu_trans_mode)($v0)
    /* 8F54 80018F54 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 8F58 80018F58 1400B1AF */  sw         $s1, 0x14($sp)
    /* 8F5C 80018F5C 21888000 */  addu       $s1, $a0, $zero
    /* 8F60 80018F60 1000B0AF */  sw         $s0, 0x10($sp)
    /* 8F64 80018F64 01001024 */  addiu      $s0, $zero, 0x1
    /* 8F68 80018F68 06005010 */  beq        $v0, $s0, .L80018F84
    /* 8F6C 80018F6C 1800BFAF */   sw        $ra, 0x18($sp)
    /* 8F70 80018F70 0B80023C */  lui        $v0, %hi(_spu_inTransfer)
    /* 8F74 80018F74 805A428C */  lw         $v0, %lo(_spu_inTransfer)($v0)
    /* 8F78 80018F78 00000000 */  nop
    /* 8F7C 80018F7C 03005014 */  bne        $v0, $s0, .L80018F8C
    /* 8F80 80018F80 00000000 */   nop
  .L80018F84:
    /* 8F84 80018F84 F7630008 */  j          .L80018FDC
    /* 8F88 80018F88 01000224 */   addiu     $v0, $zero, 0x1
  .L80018F8C:
    /* 8F8C 80018F8C 0B80043C */  lui        $a0, %hi(_spu_EVdma)
    /* 8F90 80018F90 D455848C */  lw         $a0, %lo(_spu_EVdma)($a0)
    /* 8F94 80018F94 5B46000C */  jal        TestEvent
    /* 8F98 80018F98 00000000 */   nop
    /* 8F9C 80018F9C 0B003016 */  bne        $s1, $s0, .L80018FCC
    /* 8FA0 80018FA0 00000000 */   nop
    /* 8FA4 80018FA4 0B004014 */  bnez       $v0, .L80018FD4
    /* 8FA8 80018FA8 01000224 */   addiu     $v0, $zero, 0x1
  .L80018FAC:
    /* 8FAC 80018FAC 0B80043C */  lui        $a0, %hi(_spu_EVdma)
    /* 8FB0 80018FB0 D455848C */  lw         $a0, %lo(_spu_EVdma)($a0)
    /* 8FB4 80018FB4 5B46000C */  jal        TestEvent
    /* 8FB8 80018FB8 00000000 */   nop
    /* 8FBC 80018FBC FBFF4010 */  beqz       $v0, .L80018FAC
    /* 8FC0 80018FC0 01000224 */   addiu     $v0, $zero, 0x1
    /* 8FC4 80018FC4 F5630008 */  j          .L80018FD4
    /* 8FC8 80018FC8 00000000 */   nop
  .L80018FCC:
    /* 8FCC 80018FCC 03005014 */  bne        $v0, $s0, .L80018FDC
    /* 8FD0 80018FD0 00000000 */   nop
  .L80018FD4:
    /* 8FD4 80018FD4 0B80013C */  lui        $at, %hi(_spu_inTransfer)
    /* 8FD8 80018FD8 805A22AC */  sw         $v0, %lo(_spu_inTransfer)($at)
  .L80018FDC:
    /* 8FDC 80018FDC 1800BF8F */  lw         $ra, 0x18($sp)
    /* 8FE0 80018FE0 1400B18F */  lw         $s1, 0x14($sp)
    /* 8FE4 80018FE4 1000B08F */  lw         $s0, 0x10($sp)
    /* 8FE8 80018FE8 0800E003 */  jr         $ra
    /* 8FEC 80018FEC 2000BD27 */   addiu     $sp, $sp, 0x20
endlabel SpuIsTransferCompleted
    /* 8FF0 80018FF0 00000000 */  nop
    /* 8FF4 80018FF4 00000000 */  nop
    /* 8FF8 80018FF8 00000000 */  nop
