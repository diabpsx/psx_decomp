.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching On_CLOSEDOOR__FPC4TCmdi, 0x7C

glabel On_CLOSEDOOR__FPC4TCmdi
    /* 41D08 80051D08 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 41D0C 80051D0C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 41D10 80051D10 2180A000 */  addu       $s0, $a1, $zero
    /* 41D14 80051D14 1400B1AF */  sw         $s1, 0x14($sp)
    /* 41D18 80051D18 02009194 */  lhu        $s1, 0x2($a0)
    /* 41D1C 80051D1C 21200002 */  addu       $a0, $s0, $zero
    /* 41D20 80051D20 2C000524 */  addiu      $a1, $zero, 0x2C
    /* 41D24 80051D24 1800BFAF */  sw         $ra, 0x18($sp)
    /* 41D28 80051D28 6978010C */  jal        SyncOpObject__Fiii
    /* 41D2C 80051D2C 21302002 */   addu      $a2, $s1, $zero
    /* 41D30 80051D30 21202002 */  addu       $a0, $s1, $zero
    /* 41D34 80051D34 40101000 */  sll        $v0, $s0, 1
    /* 41D38 80051D38 21105000 */  addu       $v0, $v0, $s0
    /* 41D3C 80051D3C 80100200 */  sll        $v0, $v0, 2
    /* 41D40 80051D40 21105000 */  addu       $v0, $v0, $s0
    /* 41D44 80051D44 00110200 */  sll        $v0, $v0, 4
    /* 41D48 80051D48 23105000 */  subu       $v0, $v0, $s0
    /* 41D4C 80051D4C 80100200 */  sll        $v0, $v0, 2
    /* 41D50 80051D50 21105000 */  addu       $v0, $v0, $s0
    /* 41D54 80051D54 C0100200 */  sll        $v0, $v0, 3
    /* 41D58 80051D58 0E80013C */  lui        $at, %hi(plr + 0x24)
    /* 41D5C 80051D5C 21082200 */  addu       $at, $at, $v0
    /* 41D60 80051D60 5CA52690 */  lbu        $a2, %lo(plr + 0x24)($at)
    /* 41D64 80051D64 CE3B010C */  jal        delta_sync_object__FiUcUc
    /* 41D68 80051D68 2C000524 */   addiu     $a1, $zero, 0x2C
    /* 41D6C 80051D6C 1800BF8F */  lw         $ra, 0x18($sp)
    /* 41D70 80051D70 1400B18F */  lw         $s1, 0x14($sp)
    /* 41D74 80051D74 1000B08F */  lw         $s0, 0x10($sp)
    /* 41D78 80051D78 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 41D7C 80051D7C 0800E003 */  jr         $ra
    /* 41D80 80051D80 00000000 */   nop
endlabel On_CLOSEDOOR__FPC4TCmdi
