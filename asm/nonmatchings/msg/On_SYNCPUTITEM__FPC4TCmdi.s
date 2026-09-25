.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching On_SYNCPUTITEM__FPC4TCmdi, 0x104

glabel On_SYNCPUTITEM__FPC4TCmdi
    /* 40978 80050978 B8FFBD27 */  addiu      $sp, $sp, -0x48
    /* 4097C 8005097C 3800B0AF */  sw         $s0, 0x38($sp)
    /* 40980 80050980 21808000 */  addu       $s0, $a0, $zero
    /* 40984 80050984 3C00B1AF */  sw         $s1, 0x3C($sp)
    /* 40988 80050988 2188A000 */  addu       $s1, $a1, $zero
    /* 4098C 8005098C 01000592 */  lbu        $a1, 0x1($s0)
    /* 40990 80050990 02000692 */  lbu        $a2, 0x2($s0)
    /* 40994 80050994 0A000796 */  lhu        $a3, 0xA($s0)
    /* 40998 80050998 0C000296 */  lhu        $v0, 0xC($s0)
    /* 4099C 8005099C 1000038E */  lw         $v1, 0x10($s0)
    /* 409A0 800509A0 03000892 */  lbu        $t0, 0x3($s0)
    /* 409A4 800509A4 04000992 */  lbu        $t1, 0x4($s0)
    /* 409A8 800509A8 05000A92 */  lbu        $t2, 0x5($s0)
    /* 409AC 800509AC 06000B92 */  lbu        $t3, 0x6($s0)
    /* 409B0 800509B0 07000C92 */  lbu        $t4, 0x7($s0)
    /* 409B4 800509B4 08000D96 */  lhu        $t5, 0x8($s0)
    /* 409B8 800509B8 14000E8E */  lw         $t6, 0x14($s0)
    /* 409BC 800509BC 21202002 */  addu       $a0, $s1, $zero
    /* 409C0 800509C0 4000BFAF */  sw         $ra, 0x40($sp)
    /* 409C4 800509C4 1000A2AF */  sw         $v0, 0x10($sp)
    /* 409C8 800509C8 1400A3AF */  sw         $v1, 0x14($sp)
    /* 409CC 800509CC 1800A8AF */  sw         $t0, 0x18($sp)
    /* 409D0 800509D0 1C00A9AF */  sw         $t1, 0x1C($sp)
    /* 409D4 800509D4 2000AAAF */  sw         $t2, 0x20($sp)
    /* 409D8 800509D8 2400ABAF */  sw         $t3, 0x24($sp)
    /* 409DC 800509DC 2800ACAF */  sw         $t4, 0x28($sp)
    /* 409E0 800509E0 2C00ADAF */  sw         $t5, 0x2C($sp)
    /* 409E4 800509E4 417D050C */  jal        func_8015F504
    /* 409E8 800509E8 3000AEAF */   sw        $t6, 0x30($sp)
    /* 409EC 800509EC 21184000 */  addu       $v1, $v0, $zero
    /* 409F0 800509F0 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 409F4 800509F4 1B006210 */  beq        $v1, $v0, .L80050A64
    /* 409F8 800509F8 C0100300 */   sll       $v0, $v1, 3
    /* 409FC 800509FC 23104300 */  subu       $v0, $v0, $v1
    /* 40A00 80050A00 80100200 */  sll        $v0, $v0, 2
    /* 40A04 80050A04 23104300 */  subu       $v0, $v0, $v1
    /* 40A08 80050A08 80100200 */  sll        $v0, $v0, 2
    /* 40A0C 80050A0C 0D80013C */  lui        $at, %hi(item + 0x52)
    /* 40A10 80050A10 21082200 */  addu       $at, $at, $v0
    /* 40A14 80050A14 A61D2580 */  lb         $a1, %lo(item + 0x52)($at)
    /* 40A18 80050A18 0D80013C */  lui        $at, %hi(item + 0x53)
    /* 40A1C 80050A1C 21082200 */  addu       $at, $at, $v0
    /* 40A20 80050A20 A71D2680 */  lb         $a2, %lo(item + 0x53)($at)
    /* 40A24 80050A24 40101100 */  sll        $v0, $s1, 1
    /* 40A28 80050A28 21105100 */  addu       $v0, $v0, $s1
    /* 40A2C 80050A2C 80100200 */  sll        $v0, $v0, 2
    /* 40A30 80050A30 21105100 */  addu       $v0, $v0, $s1
    /* 40A34 80050A34 00110200 */  sll        $v0, $v0, 4
    /* 40A38 80050A38 23105100 */  subu       $v0, $v0, $s1
    /* 40A3C 80050A3C 80100200 */  sll        $v0, $v0, 2
    /* 40A40 80050A40 21105100 */  addu       $v0, $v0, $s1
    /* 40A44 80050A44 C0100200 */  sll        $v0, $v0, 3
    /* 40A48 80050A48 0E80013C */  lui        $at, %hi(plr + 0x24)
    /* 40A4C 80050A4C 21082200 */  addu       $at, $at, $v0
    /* 40A50 80050A50 5CA52790 */  lbu        $a3, %lo(plr + 0x24)($at)
    /* 40A54 80050A54 593C010C */  jal        delta_put_item__FPC9TCmdPItemiiUc
    /* 40A58 80050A58 21200002 */   addu      $a0, $s0, $zero
    /* 40A5C 80050A5C DB3F010C */  jal        check_update_plr__Fi
    /* 40A60 80050A60 21202002 */   addu      $a0, $s1, $zero
  .L80050A64:
    /* 40A64 80050A64 4000BF8F */  lw         $ra, 0x40($sp)
    /* 40A68 80050A68 3C00B18F */  lw         $s1, 0x3C($sp)
    /* 40A6C 80050A6C 3800B08F */  lw         $s0, 0x38($sp)
    /* 40A70 80050A70 4800BD27 */  addiu      $sp, $sp, 0x48
    /* 40A74 80050A74 0800E003 */  jr         $ra
    /* 40A78 80050A78 00000000 */   nop
endlabel On_SYNCPUTITEM__FPC4TCmdi
