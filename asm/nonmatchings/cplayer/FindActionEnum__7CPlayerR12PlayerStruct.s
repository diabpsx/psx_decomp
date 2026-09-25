.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FindActionEnum__7CPlayerR12PlayerStruct, 0x84

glabel FindActionEnum__7CPlayerR12PlayerStruct
    /* 86448 80096448 0000A58C */  lw         $a1, 0x0($a1)
    /* 8644C 8009644C 00000000 */  nop
    /* 86450 80096450 0C00A22C */  sltiu      $v0, $a1, 0xC
    /* 86454 80096454 1A004010 */  beqz       $v0, .L800964C0
    /* 86458 80096458 80100500 */   sll       $v0, $a1, 2
    /* 8645C 8009645C 1180013C */  lui        $at, %hi(jtbl_801106A4)
    /* 86460 80096460 21082200 */  addu       $at, $at, $v0
    /* 86464 80096464 A406228C */  lw         $v0, %lo(jtbl_801106A4)($at)
    /* 86468 80096468 00000000 */  nop
    /* 8646C 8009646C 08004000 */  jr         $v0
    /* 86470 80096470 00000000 */   nop
  jlabel .L80096474
    /* 86474 80096474 31590208 */  j          .L800964C4
    /* 86478 80096478 02000224 */   addiu     $v0, $zero, 0x2
  jlabel .L8009647C
    /* 8647C 8009647C 31590208 */  j          .L800964C4
    /* 86480 80096480 01000224 */   addiu     $v0, $zero, 0x1
  jlabel .L80096484
    /* 86484 80096484 31590208 */  j          .L800964C4
    /* 86488 80096488 03000224 */   addiu     $v0, $zero, 0x3
  jlabel .L8009648C
    /* 8648C 8009648C 31590208 */  j          .L800964C4
    /* 86490 80096490 05000224 */   addiu     $v0, $zero, 0x5
  jlabel .L80096494
    /* 86494 80096494 1280033C */  lui        $v1, %hi(leveltype)
    /* 86498 80096498 0DC16390 */  lbu        $v1, %lo(leveltype)($v1)
    /* 8649C 8009649C 00000000 */  nop
    /* 864A0 800964A0 08006010 */  beqz       $v1, .L800964C4
    /* 864A4 800964A4 02000224 */   addiu     $v0, $zero, 0x2
    /* 864A8 800964A8 31590208 */  j          .L800964C4
    /* 864AC 800964AC 09000224 */   addiu     $v0, $zero, 0x9
  jlabel .L800964B0
    /* 864B0 800964B0 31590208 */  j          .L800964C4
    /* 864B4 800964B4 04000224 */   addiu     $v0, $zero, 0x4
  jlabel .L800964B8
    /* 864B8 800964B8 31590208 */  j          .L800964C4
    /* 864BC 800964BC 06000224 */   addiu     $v0, $zero, 0x6
  .L800964C0:
    /* 864C0 800964C0 21100000 */  addu       $v0, $zero, $zero
  .L800964C4:
    /* 864C4 800964C4 0800E003 */  jr         $ra
    /* 864C8 800964C8 00000000 */   nop
endlabel FindActionEnum__7CPlayerR12PlayerStruct
