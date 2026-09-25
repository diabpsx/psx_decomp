.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching On_OPENDOOR__FPC4TCmdi, 0x7C

glabel On_OPENDOOR__FPC4TCmdi
    /* 41C8C 80051C8C E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 41C90 80051C90 1000B0AF */  sw         $s0, 0x10($sp)
    /* 41C94 80051C94 2180A000 */  addu       $s0, $a1, $zero
    /* 41C98 80051C98 1400B1AF */  sw         $s1, 0x14($sp)
    /* 41C9C 80051C9C 02009194 */  lhu        $s1, 0x2($a0)
    /* 41CA0 80051CA0 21200002 */  addu       $a0, $s0, $zero
    /* 41CA4 80051CA4 2B000524 */  addiu      $a1, $zero, 0x2B
    /* 41CA8 80051CA8 1800BFAF */  sw         $ra, 0x18($sp)
    /* 41CAC 80051CAC 6978010C */  jal        SyncOpObject__Fiii
    /* 41CB0 80051CB0 21302002 */   addu      $a2, $s1, $zero
    /* 41CB4 80051CB4 21202002 */  addu       $a0, $s1, $zero
    /* 41CB8 80051CB8 40101000 */  sll        $v0, $s0, 1
    /* 41CBC 80051CBC 21105000 */  addu       $v0, $v0, $s0
    /* 41CC0 80051CC0 80100200 */  sll        $v0, $v0, 2
    /* 41CC4 80051CC4 21105000 */  addu       $v0, $v0, $s0
    /* 41CC8 80051CC8 00110200 */  sll        $v0, $v0, 4
    /* 41CCC 80051CCC 23105000 */  subu       $v0, $v0, $s0
    /* 41CD0 80051CD0 80100200 */  sll        $v0, $v0, 2
    /* 41CD4 80051CD4 21105000 */  addu       $v0, $v0, $s0
    /* 41CD8 80051CD8 C0100200 */  sll        $v0, $v0, 3
    /* 41CDC 80051CDC 0E80013C */  lui        $at, %hi(plr + 0x24)
    /* 41CE0 80051CE0 21082200 */  addu       $at, $at, $v0
    /* 41CE4 80051CE4 5CA52690 */  lbu        $a2, %lo(plr + 0x24)($at)
    /* 41CE8 80051CE8 CE3B010C */  jal        delta_sync_object__FiUcUc
    /* 41CEC 80051CEC 2B000524 */   addiu     $a1, $zero, 0x2B
    /* 41CF0 80051CF0 1800BF8F */  lw         $ra, 0x18($sp)
    /* 41CF4 80051CF4 1400B18F */  lw         $s1, 0x14($sp)
    /* 41CF8 80051CF8 1000B08F */  lw         $s0, 0x10($sp)
    /* 41CFC 80051CFC 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 41D00 80051D00 0800E003 */  jr         $ra
    /* 41D04 80051D04 00000000 */   nop
endlabel On_OPENDOOR__FPC4TCmdi
