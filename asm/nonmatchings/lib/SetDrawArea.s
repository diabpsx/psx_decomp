.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetDrawArea, 0x80

glabel SetDrawArea
    /* 4778 80014778 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 477C 8001477C 1400B1AF */  sw         $s1, 0x14($sp)
    /* 4780 80014780 21888000 */  addu       $s1, $a0, $zero
    /* 4784 80014784 1000B0AF */  sw         $s0, 0x10($sp)
    /* 4788 80014788 2180A000 */  addu       $s0, $a1, $zero
    /* 478C 8001478C 02000224 */  addiu      $v0, $zero, 0x2
    /* 4790 80014790 1800BFAF */  sw         $ra, 0x18($sp)
    /* 4794 80014794 030022A2 */  sb         $v0, 0x3($s1)
    /* 4798 80014798 00000486 */  lh         $a0, 0x0($s0)
    /* 479C 8001479C 02000586 */  lh         $a1, 0x2($s0)
    /* 47A0 800147A0 5953000C */  jal        func_80014D64
    /* 47A4 800147A4 00000000 */   nop
    /* 47A8 800147A8 040022AE */  sw         $v0, 0x4($s1)
    /* 47AC 800147AC 00000496 */  lhu        $a0, 0x0($s0)
    /* 47B0 800147B0 04000296 */  lhu        $v0, 0x4($s0)
    /* 47B4 800147B4 02000596 */  lhu        $a1, 0x2($s0)
    /* 47B8 800147B8 21208200 */  addu       $a0, $a0, $v0
    /* 47BC 800147BC FFFF8424 */  addiu      $a0, $a0, -0x1
    /* 47C0 800147C0 00240400 */  sll        $a0, $a0, 16
    /* 47C4 800147C4 06000296 */  lhu        $v0, 0x6($s0)
    /* 47C8 800147C8 03240400 */  sra        $a0, $a0, 16
    /* 47CC 800147CC 2128A200 */  addu       $a1, $a1, $v0
    /* 47D0 800147D0 FFFFA524 */  addiu      $a1, $a1, -0x1
    /* 47D4 800147D4 002C0500 */  sll        $a1, $a1, 16
    /* 47D8 800147D8 7F53000C */  jal        func_80014DFC
    /* 47DC 800147DC 032C0500 */   sra       $a1, $a1, 16
    /* 47E0 800147E0 080022AE */  sw         $v0, 0x8($s1)
    /* 47E4 800147E4 1800BF8F */  lw         $ra, 0x18($sp)
    /* 47E8 800147E8 1400B18F */  lw         $s1, 0x14($sp)
    /* 47EC 800147EC 1000B08F */  lw         $s0, 0x10($sp)
    /* 47F0 800147F0 0800E003 */  jr         $ra
    /* 47F4 800147F4 2000BD27 */   addiu     $sp, $sp, 0x20
endlabel SetDrawArea
