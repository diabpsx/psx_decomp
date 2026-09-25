.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PrintSelectBack__FUs, 0x90

glabel PrintSelectBack__FUs
    /* 968D0 800A68D0 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 968D4 800A68D4 FFFF8430 */  andi       $a0, $a0, 0xFFFF
    /* 968D8 800A68D8 9E040224 */  addiu      $v0, $zero, 0x49E
    /* 968DC 800A68DC 08008214 */  bne        $a0, $v0, .L800A6900
    /* 968E0 800A68E0 2800BFAF */   sw        $ra, 0x28($sp)
    /* 968E4 800A68E4 4AED010C */  jal        GetStr__Fi
    /* 968E8 800A68E8 9E040424 */   addiu     $a0, $zero, 0x49E
    /* 968EC 800A68EC 0C80043C */  lui        $a0, %hi(MediumFont)
    /* 968F0 800A68F0 D8828424 */  addiu      $a0, $a0, %lo(MediumFont)
    /* 968F4 800A68F4 21280000 */  addu       $a1, $zero, $zero
    /* 968F8 800A68F8 469A0208 */  j          .L800A6918
    /* 968FC 800A68FC DE000624 */   addiu     $a2, $zero, 0xDE
  .L800A6900:
    /* 96900 800A6900 4AED010C */  jal        GetStr__Fi
    /* 96904 800A6904 00000000 */   nop
    /* 96908 800A6908 0C80043C */  lui        $a0, %hi(MediumFont)
    /* 9690C 800A690C D8828424 */  addiu      $a0, $a0, %lo(MediumFont)
    /* 96910 800A6910 21280000 */  addu       $a1, $zero, $zero
    /* 96914 800A6914 E0000624 */  addiu      $a2, $zero, 0xE0
  .L800A6918:
    /* 96918 800A6918 21384000 */  addu       $a3, $v0, $zero
    /* 9691C 800A691C 1280033C */  lui        $v1, %hi(WHITER)
    /* 96920 800A6920 D1AB6390 */  lbu        $v1, %lo(WHITER)($v1)
    /* 96924 800A6924 1280083C */  lui        $t0, %hi(WHITEG)
    /* 96928 800A6928 D2AB0891 */  lbu        $t0, %lo(WHITEG)($t0)
    /* 9692C 800A692C 1280093C */  lui        $t1, %hi(WHITEB)
    /* 96930 800A6930 D3AB2991 */  lbu        $t1, %lo(WHITEB)($t1)
    /* 96934 800A6934 01000224 */  addiu      $v0, $zero, 0x1
    /* 96938 800A6938 1000A2AF */  sw         $v0, 0x10($sp)
    /* 9693C 800A693C 1400A0AF */  sw         $zero, 0x14($sp)
    /* 96940 800A6940 1800A3AF */  sw         $v1, 0x18($sp)
    /* 96944 800A6944 1C00A8AF */  sw         $t0, 0x1C($sp)
    /* 96948 800A6948 2428020C */  jal        Print__5CFontiiPc8TXT_JUSTP4RECTUcUcUc
    /* 9694C 800A694C 2000A9AF */   sw        $t1, 0x20($sp)
    /* 96950 800A6950 2800BF8F */  lw         $ra, 0x28($sp)
    /* 96954 800A6954 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 96958 800A6958 0800E003 */  jr         $ra
    /* 9695C 800A695C 00000000 */   nop
endlabel PrintSelectBack__FUs
