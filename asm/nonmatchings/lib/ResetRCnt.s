.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ResetRCnt, 0x34

glabel ResetRCnt
    /* 11134 80021134 FFFF8330 */  andi       $v1, $a0, 0xFFFF
    /* 11138 80021138 03006228 */  slti       $v0, $v1, 0x3
    /* 1113C 8002113C 07004010 */  beqz       $v0, .L8002115C
    /* 11140 80021140 01000224 */   addiu     $v0, $zero, 0x1
    /* 11144 80021144 0B80043C */  lui        $a0, %hi(D_800B6378)
    /* 11148 80021148 7863848C */  lw         $a0, %lo(D_800B6378)($a0)
    /* 1114C 8002114C 00190300 */  sll        $v1, $v1, 4
    /* 11150 80021150 21186400 */  addu       $v1, $v1, $a0
    /* 11154 80021154 58840008 */  j          .L80021160
    /* 11158 80021158 000060A4 */   sh        $zero, 0x0($v1)
  .L8002115C:
    /* 1115C 8002115C 21100000 */  addu       $v0, $zero, $zero
  .L80021160:
    /* 11160 80021160 0800E003 */  jr         $ra
    /* 11164 80021164 00000000 */   nop
endlabel ResetRCnt
    /* 11168 80021168 00000000 */  nop
