.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching LANG_SetLang__F9LANG_TYPE, 0x118

glabel LANG_SetLang__F9LANG_TYPE
    /* 6B5E8 8007B5E8 6C14828F */  lw         $v0, %gp_rel(LanguageType)($gp)
    /* 6B5EC 8007B5EC B0FFBD27 */  addiu      $sp, $sp, -0x50
    /* 6B5F0 8007B5F0 4400B1AF */  sw         $s1, 0x44($sp)
    /* 6B5F4 8007B5F4 21888000 */  addu       $s1, $a0, $zero
    /* 6B5F8 8007B5F8 4800BFAF */  sw         $ra, 0x48($sp)
    /* 6B5FC 8007B5FC 3A002212 */  beq        $s1, $v0, .L8007B6E8
    /* 6B600 8007B600 4000B0AF */   sw        $s0, 0x40($sp)
    /* 6B604 8007B604 1D11020C */  jal        SYSI_GetFs__Fv
    /* 6B608 8007B608 00000000 */   nop
    /* 6B60C 8007B60C C0ED010C */  jal        DumpCurrentText__Fv
    /* 6B610 8007B610 21804000 */   addu      $s0, $v0, $zero
    /* 6B614 8007B614 21202002 */  addu       $a0, $s1, $zero
    /* 6B618 8007B618 D9ED010C */  jal        GetLangFileName__F9LANG_TYPEPc
    /* 6B61C 8007B61C 1000A527 */   addiu     $a1, $sp, 0x10
    /* 6B620 8007B620 21200002 */  addu       $a0, $s0, $zero
    /* 6B624 8007B624 1000A527 */  addiu      $a1, $sp, 0x10
    /* 6B628 8007B628 01000224 */  addiu      $v0, $zero, 0x1
    /* 6B62C 8007B62C 1280013C */  lui        $at, %hi(CDWAIT)
    /* 6B630 8007B630 ECAD22AC */  sw         $v0, %lo(CDWAIT)($at)
    /* 6B634 8007B634 4816020C */  jal        Read__6FileIOPCcUl
    /* 6B638 8007B638 01000624 */   addiu     $a2, $zero, 0x1
    /* 6B63C 8007B63C FFFF0324 */  addiu      $v1, $zero, -0x1
    /* 6B640 8007B640 701482AF */  sw         $v0, %gp_rel(hndText)($gp)
    /* 6B644 8007B644 05004314 */  bne        $v0, $v1, .L8007B65C
    /* 6B648 8007B648 21200000 */   addu      $a0, $zero, $zero
    /* 6B64C 8007B64C 1280053C */  lui        $a1, %hi(D_80118C40)
    /* 6B650 8007B650 408CA524 */  addiu      $a1, $a1, %lo(D_80118C40)
    /* 6B654 8007B654 A583000C */  jal        DBG_Error
    /* 6B658 8007B658 F3000624 */   addiu     $a2, $zero, 0xF3
  .L8007B65C:
    /* 6B65C 8007B65C 7014848F */  lw         $a0, %gp_rel(hndText)($gp)
    /* 6B660 8007B660 1280053C */  lui        $a1, %hi(D_8011BBFC)
    /* 6B664 8007B664 FCBBA524 */  addiu      $a1, $a1, %lo(D_8011BBFC)
    /* 6B668 8007B668 1280013C */  lui        $at, %hi(CDWAIT)
    /* 6B66C 8007B66C ECAD20AC */  sw         $zero, %lo(CDWAIT)($at)
    /* 6B670 8007B670 9C88000C */  jal        GAL_SetMemName
    /* 6B674 8007B674 00000000 */   nop
    /* 6B678 8007B678 7014848F */  lw         $a0, %gp_rel(hndText)($gp)
    /* 6B67C 8007B67C DD85000C */  jal        GAL_Lock
    /* 6B680 8007B680 00000000 */   nop
    /* 6B684 8007B684 741482AF */  sw         $v0, %gp_rel(TextPtr)($gp)
    /* 6B688 8007B688 06004014 */  bnez       $v0, .L8007B6A4
    /* 6B68C 8007B68C 00000000 */   nop
    /* 6B690 8007B690 21200000 */  addu       $a0, $zero, $zero
    /* 6B694 8007B694 1280053C */  lui        $a1, %hi(D_80118C40)
    /* 6B698 8007B698 408CA524 */  addiu      $a1, $a1, %lo(D_80118C40)
    /* 6B69C 8007B69C A583000C */  jal        DBG_Error
    /* 6B6A0 8007B6A0 FA000624 */   addiu     $a2, $zero, 0xFA
  .L8007B6A4:
    /* 6B6A4 8007B6A4 7414848F */  lw         $a0, %gp_rel(TextPtr)($gp)
    /* 6B6A8 8007B6A8 D6ED010C */  jal        CalcNumOfStrings__FPPc
    /* 6B6AC 8007B6AC 00000000 */   nop
    /* 6B6B0 8007B6B0 981482AF */  sw         $v0, %gp_rel(NumOfStrings)($gp)
    /* 6B6B4 8007B6B4 0B004018 */  blez       $v0, .L8007B6E4
    /* 6B6B8 8007B6B8 21200000 */   addu      $a0, $zero, $zero
    /* 6B6BC 8007B6BC 7414858F */  lw         $a1, %gp_rel(TextPtr)($gp)
    /* 6B6C0 8007B6C0 21304000 */  addu       $a2, $v0, $zero
    /* 6B6C4 8007B6C4 2118A000 */  addu       $v1, $a1, $zero
  .L8007B6C8:
    /* 6B6C8 8007B6C8 0000628C */  lw         $v0, 0x0($v1)
    /* 6B6CC 8007B6CC 01008424 */  addiu      $a0, $a0, 0x1
    /* 6B6D0 8007B6D0 21104500 */  addu       $v0, $v0, $a1
    /* 6B6D4 8007B6D4 000062AC */  sw         $v0, 0x0($v1)
    /* 6B6D8 8007B6D8 2A108600 */  slt        $v0, $a0, $a2
    /* 6B6DC 8007B6DC FAFF4014 */  bnez       $v0, .L8007B6C8
    /* 6B6E0 8007B6E0 04006324 */   addiu     $v1, $v1, 0x4
  .L8007B6E4:
    /* 6B6E4 8007B6E4 6C1491AF */  sw         $s1, %gp_rel(LanguageType)($gp)
  .L8007B6E8:
    /* 6B6E8 8007B6E8 4800BF8F */  lw         $ra, 0x48($sp)
    /* 6B6EC 8007B6EC 4400B18F */  lw         $s1, 0x44($sp)
    /* 6B6F0 8007B6F0 4000B08F */  lw         $s0, 0x40($sp)
    /* 6B6F4 8007B6F4 5000BD27 */  addiu      $sp, $sp, 0x50
    /* 6B6F8 8007B6F8 0800E003 */  jr         $ra
    /* 6B6FC 8007B6FC 00000000 */   nop
endlabel LANG_SetLang__F9LANG_TYPE
