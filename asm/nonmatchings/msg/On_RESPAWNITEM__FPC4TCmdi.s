.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching On_RESPAWNITEM__FPC4TCmdi, 0x11C

glabel On_RESPAWNITEM__FPC4TCmdi
    /* 40A7C 80050A7C B8FFBD27 */  addiu      $sp, $sp, -0x48
    /* 40A80 80050A80 3C00B1AF */  sw         $s1, 0x3C($sp)
    /* 40A84 80050A84 2188A000 */  addu       $s1, $a1, $zero
    /* 40A88 80050A88 40101100 */  sll        $v0, $s1, 1
    /* 40A8C 80050A8C 21105100 */  addu       $v0, $v0, $s1
    /* 40A90 80050A90 80100200 */  sll        $v0, $v0, 2
    /* 40A94 80050A94 21105100 */  addu       $v0, $v0, $s1
    /* 40A98 80050A98 00110200 */  sll        $v0, $v0, 4
    /* 40A9C 80050A9C 23105100 */  subu       $v0, $v0, $s1
    /* 40AA0 80050AA0 80100200 */  sll        $v0, $v0, 2
    /* 40AA4 80050AA4 21105100 */  addu       $v0, $v0, $s1
    /* 40AA8 80050AA8 1280033C */  lui        $v1, %hi(currlevel)
    /* 40AAC 80050AAC 0CC16390 */  lbu        $v1, %lo(currlevel)($v1)
    /* 40AB0 80050AB0 C0100200 */  sll        $v0, $v0, 3
    /* 40AB4 80050AB4 4000BFAF */  sw         $ra, 0x40($sp)
    /* 40AB8 80050AB8 3800B0AF */  sw         $s0, 0x38($sp)
    /* 40ABC 80050ABC 0E80013C */  lui        $at, %hi(plr + 0x24)
    /* 40AC0 80050AC0 21082200 */  addu       $at, $at, $v0
    /* 40AC4 80050AC4 5CA5228C */  lw         $v0, %lo(plr + 0x24)($at)
    /* 40AC8 80050AC8 00000000 */  nop
    /* 40ACC 80050ACC 1C006214 */  bne        $v1, $v0, .L80050B40
    /* 40AD0 80050AD0 21808000 */   addu      $s0, $a0, $zero
    /* 40AD4 80050AD4 1280023C */  lui        $v0, %hi(myplr)
    /* 40AD8 80050AD8 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 40ADC 80050ADC 00000000 */  nop
    /* 40AE0 80050AE0 17002212 */  beq        $s1, $v0, .L80050B40
    /* 40AE4 80050AE4 21202002 */   addu      $a0, $s1, $zero
    /* 40AE8 80050AE8 01000592 */  lbu        $a1, 0x1($s0)
    /* 40AEC 80050AEC 02000692 */  lbu        $a2, 0x2($s0)
    /* 40AF0 80050AF0 0A000796 */  lhu        $a3, 0xA($s0)
    /* 40AF4 80050AF4 0C000296 */  lhu        $v0, 0xC($s0)
    /* 40AF8 80050AF8 1000038E */  lw         $v1, 0x10($s0)
    /* 40AFC 80050AFC 03000892 */  lbu        $t0, 0x3($s0)
    /* 40B00 80050B00 04000992 */  lbu        $t1, 0x4($s0)
    /* 40B04 80050B04 05000A92 */  lbu        $t2, 0x5($s0)
    /* 40B08 80050B08 06000B92 */  lbu        $t3, 0x6($s0)
    /* 40B0C 80050B0C 07000C92 */  lbu        $t4, 0x7($s0)
    /* 40B10 80050B10 08000D96 */  lhu        $t5, 0x8($s0)
    /* 40B14 80050B14 14000E8E */  lw         $t6, 0x14($s0)
    /* 40B18 80050B18 1000A2AF */  sw         $v0, 0x10($sp)
    /* 40B1C 80050B1C 1400A3AF */  sw         $v1, 0x14($sp)
    /* 40B20 80050B20 1800A8AF */  sw         $t0, 0x18($sp)
    /* 40B24 80050B24 1C00A9AF */  sw         $t1, 0x1C($sp)
    /* 40B28 80050B28 2000AAAF */  sw         $t2, 0x20($sp)
    /* 40B2C 80050B2C 2400ABAF */  sw         $t3, 0x24($sp)
    /* 40B30 80050B30 2800ACAF */  sw         $t4, 0x28($sp)
    /* 40B34 80050B34 2C00ADAF */  sw         $t5, 0x2C($sp)
    /* 40B38 80050B38 417D050C */  jal        func_8015F504
    /* 40B3C 80050B3C 3000AEAF */   sw        $t6, 0x30($sp)
  .L80050B40:
    /* 40B40 80050B40 40101100 */  sll        $v0, $s1, 1
    /* 40B44 80050B44 21105100 */  addu       $v0, $v0, $s1
    /* 40B48 80050B48 80100200 */  sll        $v0, $v0, 2
    /* 40B4C 80050B4C 21105100 */  addu       $v0, $v0, $s1
    /* 40B50 80050B50 00110200 */  sll        $v0, $v0, 4
    /* 40B54 80050B54 23105100 */  subu       $v0, $v0, $s1
    /* 40B58 80050B58 80100200 */  sll        $v0, $v0, 2
    /* 40B5C 80050B5C 21105100 */  addu       $v0, $v0, $s1
    /* 40B60 80050B60 C0100200 */  sll        $v0, $v0, 3
    /* 40B64 80050B64 01000592 */  lbu        $a1, 0x1($s0)
    /* 40B68 80050B68 02000692 */  lbu        $a2, 0x2($s0)
    /* 40B6C 80050B6C 0E80013C */  lui        $at, %hi(plr + 0x24)
    /* 40B70 80050B70 21082200 */  addu       $at, $at, $v0
    /* 40B74 80050B74 5CA52790 */  lbu        $a3, %lo(plr + 0x24)($at)
    /* 40B78 80050B78 593C010C */  jal        delta_put_item__FPC9TCmdPItemiiUc
    /* 40B7C 80050B7C 21200002 */   addu      $a0, $s0, $zero
    /* 40B80 80050B80 4000BF8F */  lw         $ra, 0x40($sp)
    /* 40B84 80050B84 3C00B18F */  lw         $s1, 0x3C($sp)
    /* 40B88 80050B88 3800B08F */  lw         $s0, 0x38($sp)
    /* 40B8C 80050B8C 4800BD27 */  addiu      $sp, $sp, 0x48
    /* 40B90 80050B90 0800E003 */  jr         $ra
    /* 40B94 80050B94 00000000 */   nop
endlabel On_RESPAWNITEM__FPC4TCmdi
