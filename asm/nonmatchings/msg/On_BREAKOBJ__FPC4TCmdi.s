.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching On_BREAKOBJ__FPC4TCmdi, 0x78

glabel On_BREAKOBJ__FPC4TCmdi
    /* 41E7C 80051E7C E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 41E80 80051E80 1400B1AF */  sw         $s1, 0x14($sp)
    /* 41E84 80051E84 04009194 */  lhu        $s1, 0x4($a0)
    /* 41E88 80051E88 02008494 */  lhu        $a0, 0x2($a0)
    /* 41E8C 80051E8C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 41E90 80051E90 2180A000 */  addu       $s0, $a1, $zero
    /* 41E94 80051E94 1800BFAF */  sw         $ra, 0x18($sp)
    /* 41E98 80051E98 297B010C */  jal        SyncBreakObj__Fii
    /* 41E9C 80051E9C 21282002 */   addu      $a1, $s1, $zero
    /* 41EA0 80051EA0 21202002 */  addu       $a0, $s1, $zero
    /* 41EA4 80051EA4 40101000 */  sll        $v0, $s0, 1
    /* 41EA8 80051EA8 21105000 */  addu       $v0, $v0, $s0
    /* 41EAC 80051EAC 80100200 */  sll        $v0, $v0, 2
    /* 41EB0 80051EB0 21105000 */  addu       $v0, $v0, $s0
    /* 41EB4 80051EB4 00110200 */  sll        $v0, $v0, 4
    /* 41EB8 80051EB8 23105000 */  subu       $v0, $v0, $s0
    /* 41EBC 80051EBC 80100200 */  sll        $v0, $v0, 2
    /* 41EC0 80051EC0 21105000 */  addu       $v0, $v0, $s0
    /* 41EC4 80051EC4 C0100200 */  sll        $v0, $v0, 3
    /* 41EC8 80051EC8 0E80013C */  lui        $at, %hi(plr + 0x24)
    /* 41ECC 80051ECC 21082200 */  addu       $at, $at, $v0
    /* 41ED0 80051ED0 5CA52690 */  lbu        $a2, %lo(plr + 0x24)($at)
    /* 41ED4 80051ED4 CE3B010C */  jal        delta_sync_object__FiUcUc
    /* 41ED8 80051ED8 2F000524 */   addiu     $a1, $zero, 0x2F
    /* 41EDC 80051EDC 1800BF8F */  lw         $ra, 0x18($sp)
    /* 41EE0 80051EE0 1400B18F */  lw         $s1, 0x14($sp)
    /* 41EE4 80051EE4 1000B08F */  lw         $s0, 0x10($sp)
    /* 41EE8 80051EE8 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 41EEC 80051EEC 0800E003 */  jr         $ra
    /* 41EF0 80051EF0 00000000 */   nop
endlabel On_BREAKOBJ__FPC4TCmdi
