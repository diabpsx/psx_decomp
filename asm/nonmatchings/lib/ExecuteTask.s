.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ExecuteTask, 0x50

glabel ExecuteTask
    /* 10A38 80020A38 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 10A3C 80020A3C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 10A40 80020A40 21808000 */  addu       $s0, $a0, $zero
    /* 10A44 80020A44 1400BFAF */  sw         $ra, 0x14($sp)
    /* 10A48 80020A48 5000028E */  lw         $v0, 0x50($s0)
    /* 10A4C 80020A4C 00000000 */  nop
    /* 10A50 80020A50 09F84000 */  jalr       $v0
    /* 10A54 80020A54 00000000 */   nop
    /* 10A58 80020A58 BF7F000C */  jal        DoEpi
    /* 10A5C 80020A5C 21200002 */   addu      $a0, $s0, $zero
    /* 10A60 80020A60 1000028E */  lw         $v0, 0x10($s0)
    /* 10A64 80020A64 21200002 */  addu       $a0, $s0, $zero
    /* 10A68 80020A68 02004234 */  ori        $v0, $v0, 0x2
    /* 10A6C 80020A6C 2581000C */  jal        ReturnToSchedulerIfCurrentTask
    /* 10A70 80020A70 100082AC */   sw        $v0, 0x10($a0)
    /* 10A74 80020A74 1400BF8F */  lw         $ra, 0x14($sp)
    /* 10A78 80020A78 1000B08F */  lw         $s0, 0x10($sp)
    /* 10A7C 80020A7C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 10A80 80020A80 0800E003 */  jr         $ra
    /* 10A84 80020A84 00000000 */   nop
endlabel ExecuteTask
