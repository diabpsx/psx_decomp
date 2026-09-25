.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetPlayer__7CPlayeri, 0x50

glabel GetPlayer__7CPlayeri
    /* 57440 80067440 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 57444 80067444 1000B0AF */  sw         $s0, 0x10($sp)
    /* 57448 80067448 21808000 */  addu       $s0, $a0, $zero
    /* 5744C 8006744C 0200022E */  sltiu      $v0, $s0, 0x2
    /* 57450 80067450 06004014 */  bnez       $v0, .L8006746C
    /* 57454 80067454 1400BFAF */   sw        $ra, 0x14($sp)
    /* 57458 80067458 21200000 */  addu       $a0, $zero, $zero
    /* 5745C 8006745C 1180053C */  lui        $a1, %hi(D_8011775C)
    /* 57460 80067460 5C77A524 */  addiu      $a1, $a1, %lo(D_8011775C)
    /* 57464 80067464 A583000C */  jal        DBG_Error
    /* 57468 80067468 41000624 */   addiu     $a2, $zero, 0x41
  .L8006746C:
    /* 5746C 8006746C 80101000 */  sll        $v0, $s0, 2
    /* 57470 80067470 1280013C */  lui        $at, %hi(_7CPlayer_PActiveArray)
    /* 57474 80067474 21082200 */  addu       $at, $at, $v0
    /* 57478 80067478 50AD228C */  lw         $v0, %lo(_7CPlayer_PActiveArray)($at)
    /* 5747C 8006747C 1400BF8F */  lw         $ra, 0x14($sp)
    /* 57480 80067480 1000B08F */  lw         $s0, 0x10($sp)
    /* 57484 80067484 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 57488 80067488 0800E003 */  jr         $ra
    /* 5748C 8006748C 00000000 */   nop
endlabel GetPlayer__7CPlayeri
