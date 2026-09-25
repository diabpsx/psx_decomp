.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

/* Handwritten function */
nonmatching _send_pad, 0x90

glabel _send_pad
    /* 1F48 80011F48 1380013C */  lui        $at, %hi(D_8012FFB0)
    /* 1F4C 80011F4C B0FF3FAC */  sw         $ra, %lo(D_8012FFB0)($at)
    /* 1F50 80011F50 6346000C */  jal        EnterCriticalSection
    /* 1F54 80011F54 00000000 */   nop
    /* 1F58 80011F58 57000924 */  addiu      $t1, $zero, 0x57
    /* 1F5C 80011F5C B0000A24 */  addiu      $t2, $zero, 0xB0
    /* 1F60 80011F60 09F84001 */  jalr       $t2
    /* 1F64 80011F64 00000000 */   nop
    /* 1F68 80011F68 01800A3C */  lui        $t2, %hi(D_80011FD4)
    /* 1F6C 80011F6C D41F4A25 */  addiu      $t2, $t2, %lo(D_80011FD4)
    /* 1F70 80011F70 0180093C */  lui        $t1, %hi(D_80011FE4)
    /* 1F74 80011F74 E41F2925 */  addiu      $t1, $t1, %lo(D_80011FE4)
    /* 1F78 80011F78 6C01428C */  lw         $v0, 0x16C($v0)
    /* 1F7C 80011F7C 00000000 */  nop
    /* 1F80 80011F80 A0074320 */  addi       $v1, $v0, 0x7A0 /* handwritten instruction */
    /* 1F84 80011F84 1380013C */  lui        $at, %hi(D_8012FFB4)
    /* 1F88 80011F88 B4FF23AC */  sw         $v1, %lo(D_8012FFB4)($at)
  .L80011F8C:
    /* 1F8C 80011F8C 0000438D */  lw         $v1, 0x0($t2)
    /* 1F90 80011F90 00000000 */  nop
    /* 1F94 80011F94 D80343AC */  sw         $v1, 0x3D8($v0)
    /* 1F98 80011F98 E00443AC */  sw         $v1, 0x4E0($v0)
    /* 1F9C 80011F9C 04004224 */  addiu      $v0, $v0, 0x4
    /* 1FA0 80011FA0 04004A25 */  addiu      $t2, $t2, 0x4
    /* 1FA4 80011FA4 F9FF4915 */  bne        $t2, $t1, .L80011F8C
    /* 1FA8 80011FA8 00000000 */   nop
    /* 1FAC 80011FAC 4F46000C */  jal        FlushCache
    /* 1FB0 80011FB0 00000000 */   nop
    /* 1FB4 80011FB4 6746000C */  jal        ExitCriticalSection
    /* 1FB8 80011FB8 00000000 */   nop
    /* 1FBC 80011FBC 13801F3C */  lui        $ra, %hi(D_8012FFB0)
    /* 1FC0 80011FC0 B0FFFF8F */  lw         $ra, %lo(D_8012FFB0)($ra)
    /* 1FC4 80011FC4 1380023C */  lui        $v0, %hi(D_8012FFB4)
    /* 1FC8 80011FC8 B4FF428C */  lw         $v0, %lo(D_8012FFB4)($v0)
    /* 1FCC 80011FCC 0800E003 */  jr         $ra
    /* 1FD0 80011FD0 00000000 */   nop
  alabel D_80011FD4
    /* 1FD4 80011FD4 24105500 */  and        $v0, $v0, $s5
endlabel _send_pad
    /* 1FD8 80011FD8 00000000 */  nop
    /* 1FDC 80011FDC 00000000 */  nop
    /* 1FE0 80011FE0 00000000 */  nop
  alabel D_80011FE4
    /* 1FE4 80011FE4 00000000 */  nop
    /* 1FE8 80011FE8 00000000 */  nop
