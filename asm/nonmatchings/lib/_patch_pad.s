.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

/* Handwritten function */
nonmatching _patch_pad, 0x70

glabel _patch_pad
    /* 1EA4 80011EA4 1380013C */  lui        $at, %hi(D_8012FFA0)
    /* 1EA8 80011EA8 A0FF3FAC */  sw         $ra, %lo(D_8012FFA0)($at)
    /* 1EAC 80011EAC 6346000C */  jal        EnterCriticalSection
    /* 1EB0 80011EB0 00000000 */   nop
    /* 1EB4 80011EB4 57000924 */  addiu      $t1, $zero, 0x57
    /* 1EB8 80011EB8 B0000A24 */  addiu      $t2, $zero, 0xB0
    /* 1EBC 80011EBC 09F84001 */  jalr       $t2
    /* 1EC0 80011EC0 00000000 */   nop
    /* 1EC4 80011EC4 6C01428C */  lw         $v0, 0x16C($v0)
    /* 1EC8 80011EC8 0B000924 */  addiu      $t1, $zero, 0xB
    /* 1ECC 80011ECC 84084320 */  addi       $v1, $v0, 0x884 /* handwritten instruction */
    /* 1ED0 80011ED0 1380013C */  lui        $at, %hi(jtbl_8012FFA8)
    /* 1ED4 80011ED4 A8FF23AC */  sw         $v1, %lo(jtbl_8012FFA8)($at)
    /* 1ED8 80011ED8 94084320 */  addi       $v1, $v0, 0x894 /* handwritten instruction */
    /* 1EDC 80011EDC 1380013C */  lui        $at, %hi(jtbl_8012FFAC)
    /* 1EE0 80011EE0 ACFF23AC */  sw         $v1, %lo(jtbl_8012FFAC)($at)
  .L80011EE4:
    /* 1EE4 80011EE4 940540AC */  sw         $zero, 0x594($v0)
    /* 1EE8 80011EE8 04004224 */  addiu      $v0, $v0, 0x4
    /* 1EEC 80011EEC FFFF2925 */  addiu      $t1, $t1, -0x1
    /* 1EF0 80011EF0 FCFF2015 */  bnez       $t1, .L80011EE4
    /* 1EF4 80011EF4 00000000 */   nop
    /* 1EF8 80011EF8 4F46000C */  jal        FlushCache
    /* 1EFC 80011EFC 00000000 */   nop
    /* 1F00 80011F00 13801F3C */  lui        $ra, %hi(D_8012FFA0)
    /* 1F04 80011F04 A0FFFF8F */  lw         $ra, %lo(D_8012FFA0)($ra)
    /* 1F08 80011F08 00000000 */  nop
    /* 1F0C 80011F0C 0800E003 */  jr         $ra
    /* 1F10 80011F10 00000000 */   nop
endlabel _patch_pad
    /* 1F14 80011F14 00000000 */  nop
    /* 1F18 80011F18 00000000 */  nop
