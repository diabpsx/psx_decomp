.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching NewVal__4CPadUs, 0x74

glabel NewVal__4CPadUs
    /* 798A4 800898A4 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 798A8 800898A8 1000B0AF */  sw         $s0, 0x10($sp)
    /* 798AC 800898AC 21808000 */  addu       $s0, $a0, $zero
    /* 798B0 800898B0 1400BFAF */  sw         $ra, 0x14($sp)
    /* 798B4 800898B4 6B26020C */  jal        Trans__4CPadUs
    /* 798B8 800898B8 FFFFA530 */   andi      $a1, $a1, 0xFFFF
    /* 798BC 800898BC 08000396 */  lhu        $v1, 0x8($s0)
    /* 798C0 800898C0 080002A6 */  sh         $v0, 0x8($s0)
    /* 798C4 800898C4 08000496 */  lhu        $a0, 0x8($s0)
    /* 798C8 800898C8 CC000726 */  addiu      $a3, $s0, 0xCC
    /* 798CC 800898CC 100003A6 */  sh         $v1, 0x10($s0)
    /* 798D0 800898D0 10000396 */  lhu        $v1, 0x10($s0)
    /* 798D4 800898D4 03000692 */  lbu        $a2, 0x3($s0)
    /* 798D8 800898D8 26184300 */  xor        $v1, $v0, $v1
    /* 798DC 800898DC 24104300 */  and        $v0, $v0, $v1
    /* 798E0 800898E0 0C0002A6 */  sh         $v0, 0xC($s0)
    /* 798E4 800898E4 0C000596 */  lhu        $a1, 0xC($s0)
    /* 798E8 800898E8 08000296 */  lhu        $v0, 0x8($s0)
    /* 798EC 800898EC 10000396 */  lhu        $v1, 0x10($s0)
    /* 798F0 800898F0 27100200 */  nor        $v0, $zero, $v0
    /* 798F4 800898F4 24186200 */  and        $v1, $v1, $v0
    /* 798F8 800898F8 D126020C */  jal        MakeClickBits__FiiiPUs
    /* 798FC 800898FC 0A0003A6 */   sh        $v1, 0xA($s0)
    /* 79900 80089900 0E0002A6 */  sh         $v0, 0xE($s0)
    /* 79904 80089904 1400BF8F */  lw         $ra, 0x14($sp)
    /* 79908 80089908 1000B08F */  lw         $s0, 0x10($sp)
    /* 7990C 8008990C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 79910 80089910 0800E003 */  jr         $ra
    /* 79914 80089914 00000000 */   nop
endlabel NewVal__4CPadUs
