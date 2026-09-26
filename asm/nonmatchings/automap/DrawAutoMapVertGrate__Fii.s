.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DrawAutoMapVertGrate__Fii, 0x98

glabel DrawAutoMapVertGrate__Fii
    /* 28C14 8016280C E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 28C18 80162810 1000B0AF */  sw         $s0, 0x10($sp)
    /* 28C1C 80162814 21808000 */  addu       $s0, $a0, $zero
    /* 28C20 80162818 1400B1AF */  sw         $s1, 0x14($sp)
    /* 28C24 8016281C 2188A000 */  addu       $s1, $a1, $zero
    /* 28C28 80162820 3A000424 */  addiu      $a0, $zero, 0x3A
    /* 28C2C 80162824 38000524 */  addiu      $a1, $zero, 0x38
    /* 28C30 80162828 1800BFAF */  sw         $ra, 0x18($sp)
    /* 28C34 8016282C FA87050C */  jal        AMGetLine__FUcUcUc
    /* 28C38 80162830 2D000624 */   addiu     $a2, $zero, 0x2D
    /* 28C3C 80162834 E81B858F */  lw         $a1, %gp_rel(AutoMapScale)($gp)
    /* 28C40 80162838 00000000 */  nop
    /* 28C44 8016283C 18000502 */  mult       $s0, $a1
    /* 28C48 80162840 12800000 */  mflo       $s0
    /* 28C4C 80162844 00000000 */  nop
    /* 28C50 80162848 00000000 */  nop
    /* 28C54 8016284C 18002502 */  mult       $s1, $a1
    /* 28C58 80162850 101C838F */  lw         $v1, %gp_rel(AMPlayerY)($gp)
    /* 28C5C 80162854 12880000 */  mflo       $s1
    /* 28C60 80162858 21203002 */  addu       $a0, $s1, $s0
    /* 28C64 8016285C 21208300 */  addu       $a0, $a0, $v1
    /* 28C68 80162860 23801102 */  subu       $s0, $s0, $s1
    /* 28C6C 80162864 0C1C838F */  lw         $v1, %gp_rel(AMPlayerX)($gp)
    /* 28C70 80162868 40801000 */  sll        $s0, $s0, 1
    /* 28C74 8016286C 0A0044A4 */  sh         $a0, 0xA($v0)
    /* 28C78 80162870 21208500 */  addu       $a0, $a0, $a1
    /* 28C7C 80162874 0E0044A4 */  sh         $a0, 0xE($v0)
    /* 28C80 80162878 21800302 */  addu       $s0, $s0, $v1
    /* 28C84 8016287C 40180500 */  sll        $v1, $a1, 1
    /* 28C88 80162880 080050A4 */  sh         $s0, 0x8($v0)
    /* 28C8C 80162884 23800302 */  subu       $s0, $s0, $v1
    /* 28C90 80162888 0C0050A4 */  sh         $s0, 0xC($v0)
    /* 28C94 8016288C 1800BF8F */  lw         $ra, 0x18($sp)
    /* 28C98 80162890 1400B18F */  lw         $s1, 0x14($sp)
    /* 28C9C 80162894 1000B08F */  lw         $s0, 0x10($sp)
    /* 28CA0 80162898 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 28CA4 8016289C 0800E003 */  jr         $ra
    /* 28CA8 801628A0 00000000 */   nop
endlabel DrawAutoMapVertGrate__Fii
