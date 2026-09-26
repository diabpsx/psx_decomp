.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DrawAutoMapSquare__Fii, 0x134

glabel DrawAutoMapSquare__Fii
    /* 28D44 8016293C D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 28D48 80162940 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 28D4C 80162944 E81B938F */  lw         $s3, %gp_rel(AutoMapScale)($gp)
    /* 28D50 80162948 00000000 */  nop
    /* 28D54 8016294C 18009300 */  mult       $a0, $s3
    /* 28D58 80162950 1000B0AF */  sw         $s0, 0x10($sp)
    /* 28D5C 80162954 12800000 */  mflo       $s0
    /* 28D60 80162958 101C838F */  lw         $v1, %gp_rel(AMPlayerY)($gp)
    /* 28D64 8016295C 00000000 */  nop
    /* 28D68 80162960 1800B300 */  mult       $a1, $s3
    /* 28D6C 80162964 38000624 */  addiu      $a2, $zero, 0x38
    /* 28D70 80162968 2800BFAF */  sw         $ra, 0x28($sp)
    /* 28D74 8016296C 2400B5AF */  sw         $s5, 0x24($sp)
    /* 28D78 80162970 2000B4AF */  sw         $s4, 0x20($sp)
    /* 28D7C 80162974 1800B2AF */  sw         $s2, 0x18($sp)
    /* 28D80 80162978 1400B1AF */  sw         $s1, 0x14($sp)
    /* 28D84 8016297C 5F000424 */  addiu      $a0, $zero, 0x5F
    /* 28D88 80162980 43381300 */  sra        $a3, $s3, 1
    /* 28D8C 80162984 40400700 */  sll        $t0, $a3, 1
    /* 28D90 80162988 40901300 */  sll        $s2, $s3, 1
    /* 28D94 8016298C 58000524 */  addiu      $a1, $zero, 0x58
    /* 28D98 80162990 12100000 */  mflo       $v0
    /* 28D9C 80162994 21885000 */  addu       $s1, $v0, $s0
    /* 28DA0 80162998 23800202 */  subu       $s0, $s0, $v0
    /* 28DA4 8016299C 40801000 */  sll        $s0, $s0, 1
    /* 28DA8 801629A0 23800802 */  subu       $s0, $s0, $t0
    /* 28DAC 801629A4 23882702 */  subu       $s1, $s1, $a3
    /* 28DB0 801629A8 21882302 */  addu       $s1, $s1, $v1
    /* 28DB4 801629AC 21A82702 */  addu       $s5, $s1, $a3
    /* 28DB8 801629B0 21983302 */  addu       $s3, $s1, $s3
    /* 28DBC 801629B4 21883202 */  addu       $s1, $s1, $s2
    /* 28DC0 801629B8 0C1C828F */  lw         $v0, %gp_rel(AMPlayerX)($gp)
    /* 28DC4 801629BC 23882702 */  subu       $s1, $s1, $a3
    /* 28DC8 801629C0 21800202 */  addu       $s0, $s0, $v0
    /* 28DCC 801629C4 23A01202 */  subu       $s4, $s0, $s2
    /* 28DD0 801629C8 21A08802 */  addu       $s4, $s4, $t0
    /* 28DD4 801629CC 21901202 */  addu       $s2, $s0, $s2
    /* 28DD8 801629D0 FA87050C */  jal        AMGetLine__FUcUcUc
    /* 28DDC 801629D4 23904802 */   subu      $s2, $s2, $t0
    /* 28DE0 801629D8 5F000424 */  addiu      $a0, $zero, 0x5F
    /* 28DE4 801629DC 58000524 */  addiu      $a1, $zero, 0x58
    /* 28DE8 801629E0 38000624 */  addiu      $a2, $zero, 0x38
    /* 28DEC 801629E4 080050A4 */  sh         $s0, 0x8($v0)
    /* 28DF0 801629E8 0A0055A4 */  sh         $s5, 0xA($v0)
    /* 28DF4 801629EC 0C0054A4 */  sh         $s4, 0xC($v0)
    /* 28DF8 801629F0 FA87050C */  jal        AMGetLine__FUcUcUc
    /* 28DFC 801629F4 0E0053A4 */   sh        $s3, 0xE($v0)
    /* 28E00 801629F8 5F000424 */  addiu      $a0, $zero, 0x5F
    /* 28E04 801629FC 58000524 */  addiu      $a1, $zero, 0x58
    /* 28E08 80162A00 38000624 */  addiu      $a2, $zero, 0x38
    /* 28E0C 80162A04 080054A4 */  sh         $s4, 0x8($v0)
    /* 28E10 80162A08 0A0053A4 */  sh         $s3, 0xA($v0)
    /* 28E14 80162A0C 0C0050A4 */  sh         $s0, 0xC($v0)
    /* 28E18 80162A10 FA87050C */  jal        AMGetLine__FUcUcUc
    /* 28E1C 80162A14 0E0051A4 */   sh        $s1, 0xE($v0)
    /* 28E20 80162A18 5F000424 */  addiu      $a0, $zero, 0x5F
    /* 28E24 80162A1C 58000524 */  addiu      $a1, $zero, 0x58
    /* 28E28 80162A20 38000624 */  addiu      $a2, $zero, 0x38
    /* 28E2C 80162A24 080050A4 */  sh         $s0, 0x8($v0)
    /* 28E30 80162A28 0A0051A4 */  sh         $s1, 0xA($v0)
    /* 28E34 80162A2C 0C0052A4 */  sh         $s2, 0xC($v0)
    /* 28E38 80162A30 FA87050C */  jal        AMGetLine__FUcUcUc
    /* 28E3C 80162A34 0E0053A4 */   sh        $s3, 0xE($v0)
    /* 28E40 80162A38 080052A4 */  sh         $s2, 0x8($v0)
    /* 28E44 80162A3C 0A0053A4 */  sh         $s3, 0xA($v0)
    /* 28E48 80162A40 0C0050A4 */  sh         $s0, 0xC($v0)
    /* 28E4C 80162A44 0E0055A4 */  sh         $s5, 0xE($v0)
    /* 28E50 80162A48 2800BF8F */  lw         $ra, 0x28($sp)
    /* 28E54 80162A4C 2400B58F */  lw         $s5, 0x24($sp)
    /* 28E58 80162A50 2000B48F */  lw         $s4, 0x20($sp)
    /* 28E5C 80162A54 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 28E60 80162A58 1800B28F */  lw         $s2, 0x18($sp)
    /* 28E64 80162A5C 1400B18F */  lw         $s1, 0x14($sp)
    /* 28E68 80162A60 1000B08F */  lw         $s0, 0x10($sp)
    /* 28E6C 80162A64 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 28E70 80162A68 0800E003 */  jr         $ra
    /* 28E74 80162A6C 00000000 */   nop
endlabel DrawAutoMapSquare__Fii
