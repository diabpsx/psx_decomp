.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetDrawLoad, 0x6C

glabel SetDrawLoad
    /* 34AC 800134AC 0400A384 */  lh         $v1, 0x4($a1)
    /* 34B0 800134B0 0600A284 */  lh         $v0, 0x6($a1)
    /* 34B4 800134B4 00000000 */  nop
    /* 34B8 800134B8 18006200 */  mult       $v1, $v0
    /* 34BC 800134BC 12300000 */  mflo       $a2
    /* 34C0 800134C0 0100C224 */  addiu      $v0, $a2, 0x1
    /* 34C4 800134C4 C21F0200 */  srl        $v1, $v0, 31
    /* 34C8 800134C8 21104300 */  addu       $v0, $v0, $v1
    /* 34CC 800134CC 43100200 */  sra        $v0, $v0, 1
    /* 34D0 800134D0 04004324 */  addiu      $v1, $v0, 0x4
    /* 34D4 800134D4 0D00422C */  sltiu      $v0, $v0, 0xD
    /* 34D8 800134D8 02004014 */  bnez       $v0, .L800134E4
    /* 34DC 800134DC 00A0023C */   lui       $v0, (0xA0000000 >> 16)
    /* 34E0 800134E0 21180000 */  addu       $v1, $zero, $zero
  .L800134E4:
    /* 34E4 800134E4 030083A0 */  sb         $v1, 0x3($a0)
    /* 34E8 800134E8 040082AC */  sw         $v0, 0x4($a0)
    /* 34EC 800134EC 0000A28C */  lw         $v0, 0x0($a1)
    /* 34F0 800134F0 00000000 */  nop
    /* 34F4 800134F4 080082AC */  sw         $v0, 0x8($a0)
    /* 34F8 800134F8 0400A28C */  lw         $v0, 0x4($a1)
    /* 34FC 800134FC 00000000 */  nop
    /* 3500 80013500 0C0082AC */  sw         $v0, 0xC($a0)
    /* 3504 80013504 80100300 */  sll        $v0, $v1, 2
    /* 3508 80013508 21108200 */  addu       $v0, $a0, $v0
    /* 350C 8001350C 0001033C */  lui        $v1, (0x1000000 >> 16)
    /* 3510 80013510 0800E003 */  jr         $ra
    /* 3514 80013514 000043AC */   sw        $v1, 0x0($v0)
endlabel SetDrawLoad
