.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetDrawOffset, 0x40

glabel SetDrawOffset
    /* 47F8 800147F8 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 47FC 800147FC 1000B0AF */  sw         $s0, 0x10($sp)
    /* 4800 80014800 21808000 */  addu       $s0, $a0, $zero
    /* 4804 80014804 02000224 */  addiu      $v0, $zero, 0x2
    /* 4808 80014808 1400BFAF */  sw         $ra, 0x14($sp)
    /* 480C 8001480C 030002A2 */  sb         $v0, 0x3($s0)
    /* 4810 80014810 0000A484 */  lh         $a0, 0x0($a1)
    /* 4814 80014814 0200A584 */  lh         $a1, 0x2($a1)
    /* 4818 80014818 A553000C */  jal        func_80014E94
    /* 481C 8001481C 00000000 */   nop
    /* 4820 80014820 040002AE */  sw         $v0, 0x4($s0)
    /* 4824 80014824 080000AE */  sw         $zero, 0x8($s0)
    /* 4828 80014828 1400BF8F */  lw         $ra, 0x14($sp)
    /* 482C 8001482C 1000B08F */  lw         $s0, 0x10($sp)
    /* 4830 80014830 0800E003 */  jr         $ra
    /* 4834 80014834 1800BD27 */   addiu     $sp, $sp, 0x18
endlabel SetDrawOffset
