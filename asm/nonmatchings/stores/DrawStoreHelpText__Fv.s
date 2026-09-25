.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DrawStoreHelpText__Fv, 0x9C

glabel DrawStoreHelpText__Fv
    /* 5FCC8 8006FCC8 60138293 */  lbu        $v0, %gp_rel(stextflag)($gp)
    /* 5FCCC 8006FCCC D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 5FCD0 8006FCD0 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 5FCD4 8006FCD4 00160200 */  sll        $v0, $v0, 24
    /* 5FCD8 8006FCD8 031E0200 */  sra        $v1, $v0, 24
    /* 5FCDC 8006FCDC 1800622C */  sltiu      $v0, $v1, 0x18
    /* 5FCE0 8006FCE0 1C004010 */  beqz       $v0, .L8006FD54
    /* 5FCE4 8006FCE4 2800BFAF */   sw        $ra, 0x28($sp)
    /* 5FCE8 8006FCE8 80100300 */  sll        $v0, $v1, 2
    /* 5FCEC 8006FCEC 1180013C */  lui        $at, %hi(jtbl_80117A28)
    /* 5FCF0 8006FCF0 21082200 */  addu       $at, $at, $v0
    /* 5FCF4 8006FCF4 287A228C */  lw         $v0, %lo(jtbl_80117A28)($at)
    /* 5FCF8 8006FCF8 00000000 */  nop
    /* 5FCFC 8006FCFC 08004000 */  jr         $v0
    /* 5FD00 8006FD00 00000000 */   nop
  jlabel .L8006FD04
    /* 5FD04 8006FD04 4AED010C */  jal        GetStr__Fi
    /* 5FD08 8006FD08 E6040424 */   addiu     $a0, $zero, 0x4E6
    /* 5FD0C 8006FD0C 0C80043C */  lui        $a0, %hi(MediumFont)
    /* 5FD10 8006FD10 D8828424 */  addiu      $a0, $a0, %lo(MediumFont)
    /* 5FD14 8006FD14 1280053C */  lui        $a1, %hi(WHITER)
    /* 5FD18 8006FD18 D1ABA590 */  lbu        $a1, %lo(WHITER)($a1)
    /* 5FD1C 8006FD1C 1280063C */  lui        $a2, %hi(WHITEG)
    /* 5FD20 8006FD20 D2ABC690 */  lbu        $a2, %lo(WHITEG)($a2)
    /* 5FD24 8006FD24 1280073C */  lui        $a3, %hi(WHITEB)
    /* 5FD28 8006FD28 D3ABE790 */  lbu        $a3, %lo(WHITEB)($a3)
    /* 5FD2C 8006FD2C 01000324 */  addiu      $v1, $zero, 0x1
    /* 5FD30 8006FD30 1000A3AF */  sw         $v1, 0x10($sp)
    /* 5FD34 8006FD34 1400A0AF */  sw         $zero, 0x14($sp)
    /* 5FD38 8006FD38 1800A5AF */  sw         $a1, 0x18($sp)
    /* 5FD3C 8006FD3C 21280000 */  addu       $a1, $zero, $zero
    /* 5FD40 8006FD40 1C00A6AF */  sw         $a2, 0x1C($sp)
    /* 5FD44 8006FD44 DE000624 */  addiu      $a2, $zero, 0xDE
    /* 5FD48 8006FD48 2000A7AF */  sw         $a3, 0x20($sp)
    /* 5FD4C 8006FD4C 2428020C */  jal        Print__5CFontiiPc8TXT_JUSTP4RECTUcUcUc
    /* 5FD50 8006FD50 21384000 */   addu      $a3, $v0, $zero
  jlabel .L8006FD54
    /* 5FD54 8006FD54 2800BF8F */  lw         $ra, 0x28($sp)
    /* 5FD58 8006FD58 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 5FD5C 8006FD5C 0800E003 */  jr         $ra
    /* 5FD60 8006FD60 00000000 */   nop
endlabel DrawStoreHelpText__Fv
