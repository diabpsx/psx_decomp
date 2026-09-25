.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching On_OPERATEOBJ__FPC4TCmdi, 0x7C

glabel On_OPERATEOBJ__FPC4TCmdi
    /* 41D84 80051D84 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 41D88 80051D88 1000B0AF */  sw         $s0, 0x10($sp)
    /* 41D8C 80051D8C 2180A000 */  addu       $s0, $a1, $zero
    /* 41D90 80051D90 1400B1AF */  sw         $s1, 0x14($sp)
    /* 41D94 80051D94 02009194 */  lhu        $s1, 0x2($a0)
    /* 41D98 80051D98 21200002 */  addu       $a0, $s0, $zero
    /* 41D9C 80051D9C 2D000524 */  addiu      $a1, $zero, 0x2D
    /* 41DA0 80051DA0 1800BFAF */  sw         $ra, 0x18($sp)
    /* 41DA4 80051DA4 6978010C */  jal        SyncOpObject__Fiii
    /* 41DA8 80051DA8 21302002 */   addu      $a2, $s1, $zero
    /* 41DAC 80051DAC 21202002 */  addu       $a0, $s1, $zero
    /* 41DB0 80051DB0 40101000 */  sll        $v0, $s0, 1
    /* 41DB4 80051DB4 21105000 */  addu       $v0, $v0, $s0
    /* 41DB8 80051DB8 80100200 */  sll        $v0, $v0, 2
    /* 41DBC 80051DBC 21105000 */  addu       $v0, $v0, $s0
    /* 41DC0 80051DC0 00110200 */  sll        $v0, $v0, 4
    /* 41DC4 80051DC4 23105000 */  subu       $v0, $v0, $s0
    /* 41DC8 80051DC8 80100200 */  sll        $v0, $v0, 2
    /* 41DCC 80051DCC 21105000 */  addu       $v0, $v0, $s0
    /* 41DD0 80051DD0 C0100200 */  sll        $v0, $v0, 3
    /* 41DD4 80051DD4 0E80013C */  lui        $at, %hi(plr + 0x24)
    /* 41DD8 80051DD8 21082200 */  addu       $at, $at, $v0
    /* 41DDC 80051DDC 5CA52690 */  lbu        $a2, %lo(plr + 0x24)($at)
    /* 41DE0 80051DE0 CE3B010C */  jal        delta_sync_object__FiUcUc
    /* 41DE4 80051DE4 2D000524 */   addiu     $a1, $zero, 0x2D
    /* 41DE8 80051DE8 1800BF8F */  lw         $ra, 0x18($sp)
    /* 41DEC 80051DEC 1400B18F */  lw         $s1, 0x14($sp)
    /* 41DF0 80051DF0 1000B08F */  lw         $s0, 0x10($sp)
    /* 41DF4 80051DF4 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 41DF8 80051DF8 0800E003 */  jr         $ra
    /* 41DFC 80051DFC 00000000 */   nop
endlabel On_OPERATEOBJ__FPC4TCmdi
