.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DrawSTextBack__Fv, 0x70

glabel DrawSTextBack__Fv
    /* 595AC 800695AC E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 595B0 800695B0 1800B0AF */  sw         $s0, 0x18($sp)
    /* 595B4 800695B4 0E80103C */  lui        $s0, %hi(SBack)
    /* 595B8 800695B8 04E31026 */  addiu      $s0, $s0, %lo(SBack)
    /* 595BC 800695BC 21200002 */  addu       $a0, $s0, $zero
    /* 595C0 800695C0 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 595C4 800695C4 F0D0010C */  jal        SetBorder__6Dialogi_800743c0
    /* 595C8 800695C8 1A000524 */   addiu     $a1, $zero, 0x1A
    /* 595CC 800695CC 1280053C */  lui        $a1, %hi(BORDERR)
    /* 595D0 800695D0 F7ABA590 */  lbu        $a1, %lo(BORDERR)($a1)
    /* 595D4 800695D4 1280063C */  lui        $a2, %hi(BORDERG)
    /* 595D8 800695D8 F8ABC690 */  lbu        $a2, %lo(BORDERG)($a2)
    /* 595DC 800695DC 1280073C */  lui        $a3, %hi(BORDERB)
    /* 595E0 800695E0 F9ABE790 */  lbu        $a3, %lo(BORDERB)($a3)
    /* 595E4 800695E4 E8D0010C */  jal        SetRGB__6DialogUcUcUc_800743a0
    /* 595E8 800695E8 21200002 */   addu      $a0, $s0, $zero
    /* 595EC 800695EC 21200002 */  addu       $a0, $s0, $zero
    /* 595F0 800695F0 14000524 */  addiu      $a1, $zero, 0x14
    /* 595F4 800695F4 18000624 */  addiu      $a2, $zero, 0x18
    /* 595F8 800695F8 18010724 */  addiu      $a3, $zero, 0x118
    /* 595FC 800695FC CD000224 */  addiu      $v0, $zero, 0xCD
    /* 59600 80069600 B82F020C */  jal        Back__6Dialogiiii
    /* 59604 80069604 1000A2AF */   sw        $v0, 0x10($sp)
    /* 59608 80069608 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 5960C 8006960C 1800B08F */  lw         $s0, 0x18($sp)
    /* 59610 80069610 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 59614 80069614 0800E003 */  jr         $ra
    /* 59618 80069618 00000000 */   nop
endlabel DrawSTextBack__Fv
