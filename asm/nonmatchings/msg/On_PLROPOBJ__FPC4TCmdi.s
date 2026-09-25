.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching On_PLROPOBJ__FPC4TCmdi, 0x7C

glabel On_PLROPOBJ__FPC4TCmdi
    /* 41E00 80051E00 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 41E04 80051E04 1000B0AF */  sw         $s0, 0x10($sp)
    /* 41E08 80051E08 2180A000 */  addu       $s0, $a1, $zero
    /* 41E0C 80051E0C 1400B1AF */  sw         $s1, 0x14($sp)
    /* 41E10 80051E10 04009194 */  lhu        $s1, 0x4($a0)
    /* 41E14 80051E14 02008494 */  lhu        $a0, 0x2($a0)
    /* 41E18 80051E18 2E000524 */  addiu      $a1, $zero, 0x2E
    /* 41E1C 80051E1C 1800BFAF */  sw         $ra, 0x18($sp)
    /* 41E20 80051E20 6978010C */  jal        SyncOpObject__Fiii
    /* 41E24 80051E24 21302002 */   addu      $a2, $s1, $zero
    /* 41E28 80051E28 21202002 */  addu       $a0, $s1, $zero
    /* 41E2C 80051E2C 40101000 */  sll        $v0, $s0, 1
    /* 41E30 80051E30 21105000 */  addu       $v0, $v0, $s0
    /* 41E34 80051E34 80100200 */  sll        $v0, $v0, 2
    /* 41E38 80051E38 21105000 */  addu       $v0, $v0, $s0
    /* 41E3C 80051E3C 00110200 */  sll        $v0, $v0, 4
    /* 41E40 80051E40 23105000 */  subu       $v0, $v0, $s0
    /* 41E44 80051E44 80100200 */  sll        $v0, $v0, 2
    /* 41E48 80051E48 21105000 */  addu       $v0, $v0, $s0
    /* 41E4C 80051E4C C0100200 */  sll        $v0, $v0, 3
    /* 41E50 80051E50 0E80013C */  lui        $at, %hi(plr + 0x24)
    /* 41E54 80051E54 21082200 */  addu       $at, $at, $v0
    /* 41E58 80051E58 5CA52690 */  lbu        $a2, %lo(plr + 0x24)($at)
    /* 41E5C 80051E5C CE3B010C */  jal        delta_sync_object__FiUcUc
    /* 41E60 80051E60 2E000524 */   addiu     $a1, $zero, 0x2E
    /* 41E64 80051E64 1800BF8F */  lw         $ra, 0x18($sp)
    /* 41E68 80051E68 1400B18F */  lw         $s1, 0x14($sp)
    /* 41E6C 80051E6C 1000B08F */  lw         $s0, 0x10($sp)
    /* 41E70 80051E70 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 41E74 80051E74 0800E003 */  jr         $ra
    /* 41E78 80051E78 00000000 */   nop
endlabel On_PLROPOBJ__FPC4TCmdi
