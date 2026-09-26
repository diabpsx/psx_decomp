.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DrawInvBack__Fv, 0xAC

glabel DrawInvBack__Fv
    /* 1E990 80158588 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 1E994 8015858C 2800BFAF */  sw         $ra, 0x28($sp)
    /* 1E998 80158590 AA87050C */  jal        __6Dialog_80161ea8
    /* 1E99C 80158594 1800A427 */   addiu     $a0, $sp, 0x18
    /* 1E9A0 80158598 781B858F */  lw         $a1, %gp_rel(D_8011C2F8)($gp)
    /* 1E9A4 8015859C 8A34020C */  jal        SetOTpos__6Dialogi
    /* 1E9A8 801585A0 1800A427 */   addiu     $a0, $sp, 0x18
    /* 1E9AC 801585A4 1800A427 */  addiu      $a0, $sp, 0x18
    /* 1E9B0 801585A8 9E87050C */  jal        SetBack__6Dialogi_80161e78
    /* 1E9B4 801585AC 05000524 */   addiu     $a1, $zero, 0x5
    /* 1E9B8 801585B0 1280053C */  lui        $a1, %hi(BORDERR)
    /* 1E9BC 801585B4 F7ABA590 */  lbu        $a1, %lo(BORDERR)($a1)
    /* 1E9C0 801585B8 1280063C */  lui        $a2, %hi(BORDERG)
    /* 1E9C4 801585BC F8ABC690 */  lbu        $a2, %lo(BORDERG)($a2)
    /* 1E9C8 801585C0 1280073C */  lui        $a3, %hi(BORDERB)
    /* 1E9CC 801585C4 F9ABE790 */  lbu        $a3, %lo(BORDERB)($a3)
    /* 1E9D0 801585C8 9687050C */  jal        SetRGB__6DialogUcUcUc_80161e58
    /* 1E9D4 801585CC 1800A427 */   addiu     $a0, $sp, 0x18
    /* 1E9D8 801585D0 1800A427 */  addiu      $a0, $sp, 0x18
    /* 1E9DC 801585D4 80000524 */  addiu      $a1, $zero, 0x80
    /* 1E9E0 801585D8 B0000724 */  addiu      $a3, $zero, 0xB0
    /* 1E9E4 801585DC B01B868F */  lw         $a2, %gp_rel(InvBackY)($gp)
    /* 1E9E8 801585E0 BE000224 */  addiu      $v0, $zero, 0xBE
    /* 1E9EC 801585E4 1000A2AF */  sw         $v0, 0x10($sp)
    /* 1E9F0 801585E8 23300600 */  negu       $a2, $a2
    /* 1E9F4 801585EC B82F020C */  jal        Back__6Dialogiiii
    /* 1E9F8 801585F0 8000C624 */   addiu     $a2, $a2, 0x80
    /* 1E9FC 801585F4 1800A427 */  addiu      $a0, $sp, 0x18
    /* 1EA00 801585F8 80000524 */  addiu      $a1, $zero, 0x80
    /* 1EA04 801585FC B0000724 */  addiu      $a3, $zero, 0xB0
    /* 1EA08 80158600 B01B868F */  lw         $a2, %gp_rel(InvBackY)($gp)
    /* 1EA0C 80158604 5E000224 */  addiu      $v0, $zero, 0x5E
    /* 1EA10 80158608 1000A2AF */  sw         $v0, 0x10($sp)
    /* 1EA14 8015860C 23300600 */  negu       $a2, $a2
    /* 1EA18 80158610 B82F020C */  jal        Back__6Dialogiiii
    /* 1EA1C 80158614 2000C624 */   addiu     $a2, $a2, 0x20
    /* 1EA20 80158618 1800A427 */  addiu      $a0, $sp, 0x18
    /* 1EA24 8015861C A087050C */  jal        ___6Dialog_80161e80
    /* 1EA28 80158620 02000524 */   addiu     $a1, $zero, 0x2
    /* 1EA2C 80158624 2800BF8F */  lw         $ra, 0x28($sp)
    /* 1EA30 80158628 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 1EA34 8015862C 0800E003 */  jr         $ra
    /* 1EA38 80158630 00000000 */   nop
endlabel DrawInvBack__Fv
