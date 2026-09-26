.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetLoadStatusMessage__FPc, 0xB4

glabel GetLoadStatusMessage__FPc
    /* 209D0 8015A5C8 21288000 */  addu       $a1, $a0, $zero
    /* 209D4 8015A5CC E00C848F */  lw         $a0, %gp_rel(current_card)($gp)
    /* 209D8 8015A5D0 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 209DC 8015A5D4 1000BFAF */  sw         $ra, 0x10($sp)
    /* 209E0 8015A5D8 80300400 */  sll        $a2, $a0, 2
    /* 209E4 8015A5DC 1280013C */  lui        $at, %hi(card_status)
    /* 209E8 8015A5E0 21082600 */  addu       $at, $at, $a2
    /* 209EC 8015A5E4 DCB3238C */  lw         $v1, %lo(card_status)($at)
    /* 209F0 8015A5E8 02000224 */  addiu      $v0, $zero, 0x2
    /* 209F4 8015A5EC 07006210 */  beq        $v1, $v0, .L8015A60C
    /* 209F8 8015A5F0 00000000 */   nop
    /* 209FC 8015A5F4 1280013C */  lui        $at, %hi(card_dirty)
    /* 20A00 8015A5F8 21082600 */  addu       $at, $at, $a2
    /* 20A04 8015A5FC E8B1228C */  lw         $v0, %lo(card_dirty)($at)
    /* 20A08 8015A600 00000000 */  nop
    /* 20A0C 8015A604 08004010 */  beqz       $v0, .L8015A628
    /* 20A10 8015A608 00000000 */   nop
  .L8015A60C:
    /* 20A14 8015A60C 1280013C */  lui        $at, %hi(card_side_empty)
    /* 20A18 8015A610 21082600 */  addu       $at, $at, $a2
    /* 20A1C 8015A614 88B1238C */  lw         $v1, %lo(card_side_empty)($at)
    /* 20A20 8015A618 00000000 */  nop
    /* 20A24 8015A61C D80C83AF */  sw         $v1, %gp_rel(AlertTxt)($gp)
    /* 20A28 8015A620 9B690508 */  j          .L8015A66C
    /* 20A2C 8015A624 21100000 */   addu      $v0, $zero, $zero
  .L8015A628:
    /* 20A30 8015A628 1280013C */  lui        $at, %hi(card_usable)
    /* 20A34 8015A62C 21082600 */  addu       $at, $at, $a2
    /* 20A38 8015A630 E4B3228C */  lw         $v0, %lo(card_usable)($at)
    /* 20A3C 8015A634 00000000 */  nop
    /* 20A40 8015A638 0A004010 */  beqz       $v0, .L8015A664
    /* 20A44 8015A63C 09050224 */   addiu     $v0, $zero, 0x509
    /* 20A48 8015A640 6465050C */  jal        GetFileNumber__FiPc
    /* 20A4C 8015A644 00000000 */   nop
    /* 20A50 8015A648 FFFF0324 */  addiu      $v1, $zero, -0x1
    /* 20A54 8015A64C 04004310 */  beq        $v0, $v1, .L8015A660
    /* 20A58 8015A650 01000224 */   addiu     $v0, $zero, 0x1
    /* 20A5C 8015A654 D80C80AF */  sw         $zero, %gp_rel(AlertTxt)($gp)
    /* 20A60 8015A658 9B690508 */  j          .L8015A66C
    /* 20A64 8015A65C 00000000 */   nop
  .L8015A660:
    /* 20A68 8015A660 BE020224 */  addiu      $v0, $zero, 0x2BE
  .L8015A664:
    /* 20A6C 8015A664 D80C82AF */  sw         $v0, %gp_rel(AlertTxt)($gp)
    /* 20A70 8015A668 21100000 */  addu       $v0, $zero, $zero
  .L8015A66C:
    /* 20A74 8015A66C 1000BF8F */  lw         $ra, 0x10($sp)
    /* 20A78 8015A670 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 20A7C 8015A674 0800E003 */  jr         $ra
    /* 20A80 8015A678 00000000 */   nop
endlabel GetLoadStatusMessage__FPc
