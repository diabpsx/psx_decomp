.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetComboDownButton__7GamePadiPFi_v, 0x44

glabel SetComboDownButton__7GamePadiPFi_v
    /* 6867C 8007867C E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 68680 80078680 1000B0AF */  sw         $s0, 0x10($sp)
    /* 68684 80078684 21808000 */  addu       $s0, $a0, $zero
    /* 68688 80078688 1400B1AF */  sw         $s1, 0x14($sp)
    /* 6868C 8007868C 2188C000 */  addu       $s1, $a2, $zero
    /* 68690 80078690 1800BFAF */  sw         $ra, 0x18($sp)
    /* 68694 80078694 CA71020C */  jal        get_key_pad__Fi
    /* 68698 80078698 2120A000 */   addu      $a0, $a1, $zero
    /* 6869C 8007869C 80100200 */  sll        $v0, $v0, 2
    /* 686A0 800786A0 21105000 */  addu       $v0, $v0, $s0
    /* 686A4 800786A4 980051AC */  sw         $s1, 0x98($v0)
    /* 686A8 800786A8 1800BF8F */  lw         $ra, 0x18($sp)
    /* 686AC 800786AC 1400B18F */  lw         $s1, 0x14($sp)
    /* 686B0 800786B0 1000B08F */  lw         $s0, 0x10($sp)
    /* 686B4 800786B4 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 686B8 800786B8 0800E003 */  jr         $ra
    /* 686BC 800786BC 00000000 */   nop
endlabel SetComboDownButton__7GamePadiPFi_v
