.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching __do_global_dtors, 0x68

glabel __do_global_dtors
    /* 1038 80011038 0B80083C */  lui        $t0, %hi(D_800B4290)
    /* 103C 8001103C 9042088D */  lw         $t0, %lo(D_800B4290)($t0)
    /* 1040 80011040 F0FFBD27 */  addiu      $sp, $sp, -0x10
    /* 1044 80011044 0400B0AF */  sw         $s0, 0x4($sp)
    /* 1048 80011048 0800B1AF */  sw         $s1, 0x8($sp)
    /* 104C 8001104C 0C00BFAF */  sw         $ra, 0xC($sp)
    /* 1050 80011050 0D000011 */  beqz       $t0, .L80011088
    /* 1054 80011054 00000000 */   nop
    /* 1058 80011058 0B80103C */  lui        $s0, %hi(D_800B0CD4)
    /* 105C 8001105C D40C1026 */  addiu      $s0, $s0, %lo(D_800B0CD4)
    /* 1060 80011060 0000113C */  lui        $s1, %hi(D_B)
    /* 1064 80011064 0B003126 */  addiu      $s1, $s1, %lo(D_B)
    /* 1068 80011068 07002012 */  beqz       $s1, .L80011088
    /* 106C 8001106C 00000000 */   nop
  .L80011070:
    /* 1070 80011070 0000088E */  lw         $t0, 0x0($s0)
    /* 1074 80011074 04001026 */  addiu      $s0, $s0, 0x4
    /* 1078 80011078 09F80001 */  jalr       $t0
    /* 107C 8001107C FFFF3126 */   addiu     $s1, $s1, -0x1
    /* 1080 80011080 FBFF2016 */  bnez       $s1, .L80011070
    /* 1084 80011084 00000000 */   nop
  .L80011088:
    /* 1088 80011088 0C00BF8F */  lw         $ra, 0xC($sp)
    /* 108C 8001108C 0800B18F */  lw         $s1, 0x8($sp)
    /* 1090 80011090 0400B08F */  lw         $s0, 0x4($sp)
    /* 1094 80011094 1000BD27 */  addiu      $sp, $sp, 0x10
    /* 1098 80011098 0800E003 */  jr         $ra
    /* 109C 8001109C 00000000 */   nop
endlabel __do_global_dtors
