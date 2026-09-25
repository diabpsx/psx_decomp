.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching KanjiPrintChar__5CFontUsUsUsUcUcUc, 0x138

glabel KanjiPrintChar__5CFontUsUsUsUcUcUc
    /* 79DB4 80089DB4 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 79DB8 80089DB8 1800B2AF */  sw         $s2, 0x18($sp)
    /* 79DBC 80089DBC 4000B293 */  lbu        $s2, 0x40($sp)
    /* 79DC0 80089DC0 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 79DC4 80089DC4 4400B393 */  lbu        $s3, 0x44($sp)
    /* 79DC8 80089DC8 2400B5AF */  sw         $s5, 0x24($sp)
    /* 79DCC 80089DCC 21A88000 */  addu       $s5, $a0, $zero
    /* 79DD0 80089DD0 1000B0AF */  sw         $s0, 0x10($sp)
    /* 79DD4 80089DD4 2180A000 */  addu       $s0, $a1, $zero
    /* 79DD8 80089DD8 1400B1AF */  sw         $s1, 0x14($sp)
    /* 79DDC 80089DDC 2188C000 */  addu       $s1, $a2, $zero
    /* 79DE0 80089DE0 2000B4AF */  sw         $s4, 0x20($sp)
    /* 79DE4 80089DE4 4800B493 */  lbu        $s4, 0x48($sp)
    /* 79DE8 80089DE8 2800BFAF */  sw         $ra, 0x28($sp)
    /* 79DEC 80089DEC 0BB7020C */  jal        GetKanjiFrm__FUs
    /* 79DF0 80089DF0 FFFFE430 */   andi      $a0, $a3, 0xFFFF
    /* 79DF4 80089DF4 21200002 */  addu       $a0, $s0, $zero
    /* 79DF8 80089DF8 F6FF2326 */  addiu      $v1, $s1, -0xA
    /* 79DFC 80089DFC 0C001026 */  addiu      $s0, $s0, 0xC
    /* 79E00 80089E00 640482AF */  sw         $v0, %gp_rel(CharFt4)($gp)
    /* 79E04 80089E04 0A0043A4 */  sh         $v1, 0xA($v0)
    /* 79E08 80089E08 120043A4 */  sh         $v1, 0x12($v0)
    /* 79E0C 80089E0C 040052A0 */  sb         $s2, 0x4($v0)
    /* 79E10 80089E10 6404838F */  lw         $v1, %gp_rel(CharFt4)($gp)
    /* 79E14 80089E14 02003126 */  addiu      $s1, $s1, 0x2
    /* 79E18 80089E18 080044A4 */  sh         $a0, 0x8($v0)
    /* 79E1C 80089E1C 100050A4 */  sh         $s0, 0x10($v0)
    /* 79E20 80089E20 180044A4 */  sh         $a0, 0x18($v0)
    /* 79E24 80089E24 1A0051A4 */  sh         $s1, 0x1A($v0)
    /* 79E28 80089E28 200050A4 */  sh         $s0, 0x20($v0)
    /* 79E2C 80089E2C 220051A4 */  sh         $s1, 0x22($v0)
    /* 79E30 80089E30 050073A0 */  sb         $s3, 0x5($v1)
    /* 79E34 80089E34 6404828F */  lw         $v0, %gp_rel(CharFt4)($gp)
    /* 79E38 80089E38 00000000 */  nop
    /* 79E3C 80089E3C 060054A0 */  sb         $s4, 0x6($v0)
    /* 79E40 80089E40 6404838F */  lw         $v1, %gp_rel(CharFt4)($gp)
    /* 79E44 80089E44 00000000 */  nop
    /* 79E48 80089E48 07006290 */  lbu        $v0, 0x7($v1)
    /* 79E4C 80089E4C FF00063C */  lui        $a2, (0xFFFFFF >> 16)
    /* 79E50 80089E50 FD004230 */  andi       $v0, $v0, 0xFD
    /* 79E54 80089E54 070062A0 */  sb         $v0, 0x7($v1)
    /* 79E58 80089E58 6404838F */  lw         $v1, %gp_rel(CharFt4)($gp)
    /* 79E5C 80089E5C FFFFC634 */  ori        $a2, $a2, (0xFFFFFF & 0xFFFF)
    /* 79E60 80089E60 07006290 */  lbu        $v0, 0x7($v1)
    /* 79E64 80089E64 00FF083C */  lui        $t0, (0xFF000000 >> 16)
    /* 79E68 80089E68 FE004230 */  andi       $v0, $v0, 0xFE
    /* 79E6C 80089E6C 070062A0 */  sb         $v0, 0x7($v1)
    /* 79E70 80089E70 6404858F */  lw         $a1, %gp_rel(CharFt4)($gp)
    /* 79E74 80089E74 0402A28E */  lw         $v0, 0x204($s5)
    /* 79E78 80089E78 1280073C */  lui        $a3, %hi(ThisOt)
    /* 79E7C 80089E7C B4AAE78C */  lw         $a3, %lo(ThisOt)($a3)
    /* 79E80 80089E80 80100200 */  sll        $v0, $v0, 2
    /* 79E84 80089E84 21104700 */  addu       $v0, $v0, $a3
    /* 79E88 80089E88 0000A38C */  lw         $v1, 0x0($a1)
    /* 79E8C 80089E8C 0400428C */  lw         $v0, 0x4($v0)
    /* 79E90 80089E90 24186800 */  and        $v1, $v1, $t0
    /* 79E94 80089E94 24104600 */  and        $v0, $v0, $a2
    /* 79E98 80089E98 25186200 */  or         $v1, $v1, $v0
    /* 79E9C 80089E9C 0000A3AC */  sw         $v1, 0x0($a1)
    /* 79EA0 80089EA0 0402A48E */  lw         $a0, 0x204($s5)
    /* 79EA4 80089EA4 0C000224 */  addiu      $v0, $zero, 0xC
    /* 79EA8 80089EA8 80200400 */  sll        $a0, $a0, 2
    /* 79EAC 80089EAC 21208700 */  addu       $a0, $a0, $a3
    /* 79EB0 80089EB0 0400838C */  lw         $v1, 0x4($a0)
    /* 79EB4 80089EB4 2428A600 */  and        $a1, $a1, $a2
    /* 79EB8 80089EB8 24186800 */  and        $v1, $v1, $t0
    /* 79EBC 80089EBC 25186500 */  or         $v1, $v1, $a1
    /* 79EC0 80089EC0 040083AC */  sw         $v1, 0x4($a0)
    /* 79EC4 80089EC4 2800BF8F */  lw         $ra, 0x28($sp)
    /* 79EC8 80089EC8 2400B58F */  lw         $s5, 0x24($sp)
    /* 79ECC 80089ECC 2000B48F */  lw         $s4, 0x20($sp)
    /* 79ED0 80089ED0 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 79ED4 80089ED4 1800B28F */  lw         $s2, 0x18($sp)
    /* 79ED8 80089ED8 1400B18F */  lw         $s1, 0x14($sp)
    /* 79EDC 80089EDC 1000B08F */  lw         $s0, 0x10($sp)
    /* 79EE0 80089EE0 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 79EE4 80089EE4 0800E003 */  jr         $ra
    /* 79EE8 80089EE8 00000000 */   nop
endlabel KanjiPrintChar__5CFontUsUsUsUcUcUc
