.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ShowGameFiles__FPciiG4RECTi, 0x170

glabel ShowGameFiles__FPciiG4RECTi
    /* 20BA4 8015A79C B8FFBD27 */  addiu      $sp, $sp, -0x48
    /* 20BA8 8015A7A0 4000B6AF */  sw         $s6, 0x40($sp)
    /* 20BAC 8015A7A4 5C00B68F */  lw         $s6, 0x5C($sp)
    /* 20BB0 8015A7A8 3C00B5AF */  sw         $s5, 0x3C($sp)
    /* 20BB4 8015A7AC 21A88000 */  addu       $s5, $a0, $zero
    /* 20BB8 8015A7B0 3800B4AF */  sw         $s4, 0x38($sp)
    /* 20BBC 8015A7B4 21A0C000 */  addu       $s4, $a2, $zero
    /* 20BC0 8015A7B8 4400BFAF */  sw         $ra, 0x44($sp)
    /* 20BC4 8015A7BC 3400B3AF */  sw         $s3, 0x34($sp)
    /* 20BC8 8015A7C0 3000B2AF */  sw         $s2, 0x30($sp)
    /* 20BCC 8015A7C4 2C00B1AF */  sw         $s1, 0x2C($sp)
    /* 20BD0 8015A7C8 2800B0AF */  sw         $s0, 0x28($sp)
    /* 20BD4 8015A7CC 4400A014 */  bnez       $a1, .L8015A8E0
    /* 20BD8 8015A7D0 5400A7AF */   sw        $a3, 0x54($sp)
    /* 20BDC 8015A7D4 DC0C828F */  lw         $v0, %gp_rel(StatusTxt)($gp)
    /* 20BE0 8015A7D8 00000000 */  nop
    /* 20BE4 8015A7DC 40004014 */  bnez       $v0, .L8015A8E0
    /* 20BE8 8015A7E0 21880000 */   addu      $s1, $zero, $zero
    /* 20BEC 8015A7E4 1280123C */  lui        $s2, %hi(McState)
    /* 20BF0 8015A7E8 20B45226 */  addiu      $s2, $s2, %lo(McState)
    /* 20BF4 8015A7EC 21984002 */  addu       $s3, $s2, $zero
    /* 20BF8 8015A7F0 21800000 */  addu       $s0, $zero, $zero
    /* 20BFC 8015A7F4 0200222A */  slti       $v0, $s1, 0x2
  .L8015A7F8:
    /* 20C00 8015A7F8 39004010 */  beqz       $v0, .L8015A8E0
    /* 20C04 8015A7FC 21202002 */   addu      $a0, $s1, $zero
    /* 20C08 8015A800 6465050C */  jal        GetFileNumber__FiPc
    /* 20C0C 8015A804 2128A002 */   addu      $a1, $s5, $zero
    /* 20C10 8015A808 21284000 */  addu       $a1, $v0, $zero
    /* 20C14 8015A80C 1280013C */  lui        $at, %hi(card_status)
    /* 20C18 8015A810 21083000 */  addu       $at, $at, $s0
    /* 20C1C 8015A814 DCB3238C */  lw         $v1, %lo(card_status)($at)
    /* 20C20 8015A818 02000224 */  addiu      $v0, $zero, 0x2
    /* 20C24 8015A81C 14006210 */  beq        $v1, $v0, .L8015A870
    /* 20C28 8015A820 0D050424 */   addiu     $a0, $zero, 0x50D
    /* 20C2C 8015A824 1280013C */  lui        $at, %hi(card_dirty)
    /* 20C30 8015A828 21083000 */  addu       $at, $at, $s0
    /* 20C34 8015A82C E8B1228C */  lw         $v0, %lo(card_dirty)($at)
    /* 20C38 8015A830 00000000 */  nop
    /* 20C3C 8015A834 0E004014 */  bnez       $v0, .L8015A870
    /* 20C40 8015A838 FFFF0224 */   addiu     $v0, $zero, -0x1
    /* 20C44 8015A83C 0500A210 */  beq        $a1, $v0, .L8015A854
    /* 20C48 8015A840 00000000 */   nop
    /* 20C4C 8015A844 086D050C */  jal        ReconstructSlotName__Fii
    /* 20C50 8015A848 21202002 */   addu      $a0, $s1, $zero
    /* 20C54 8015A84C 1F6A0508 */  j          .L8015A87C
    /* 20C58 8015A850 21181302 */   addu      $v1, $s0, $s3
  .L8015A854:
    /* 20C5C 8015A854 1280013C */  lui        $at, %hi(card_usable)
    /* 20C60 8015A858 21083000 */  addu       $at, $at, $s0
    /* 20C64 8015A85C E4B3228C */  lw         $v0, %lo(card_usable)($at)
    /* 20C68 8015A860 00000000 */  nop
    /* 20C6C 8015A864 02004010 */  beqz       $v0, .L8015A870
    /* 20C70 8015A868 09050424 */   addiu     $a0, $zero, 0x509
    /* 20C74 8015A86C 2C010424 */  addiu      $a0, $zero, 0x12C
  .L8015A870:
    /* 20C78 8015A870 4AED010C */  jal        GetStr__Fi
    /* 20C7C 8015A874 00000000 */   nop
    /* 20C80 8015A878 21181302 */  addu       $v1, $s0, $s3
  .L8015A87C:
    /* 20C84 8015A87C 000062AC */  sw         $v0, 0x0($v1)
    /* 20C88 8015A880 0C80043C */  lui        $a0, %hi(MediumFont)
    /* 20C8C 8015A884 D8828424 */  addiu      $a0, $a0, %lo(MediumFont)
    /* 20C90 8015A888 21280000 */  addu       $a1, $zero, $zero
    /* 20C94 8015A88C 01000224 */  addiu      $v0, $zero, 0x1
    /* 20C98 8015A890 1000A2AF */  sw         $v0, 0x10($sp)
    /* 20C9C 8015A894 40101100 */  sll        $v0, $s1, 1
    /* 20CA0 8015A898 03004224 */  addiu      $v0, $v0, 0x3
    /* 20CA4 8015A89C 18005400 */  mult       $v0, $s4
    /* 20CA8 8015A8A0 5400A227 */  addiu      $v0, $sp, 0x54
    /* 20CAC 8015A8A4 1400A2AF */  sw         $v0, 0x14($sp)
    /* 20CB0 8015A8A8 A4000224 */  addiu      $v0, $zero, 0xA4
    /* 20CB4 8015A8AC 1800A2AF */  sw         $v0, 0x18($sp)
    /* 20CB8 8015A8B0 70000224 */  addiu      $v0, $zero, 0x70
    /* 20CBC 8015A8B4 1C00A2AF */  sw         $v0, 0x1C($sp)
    /* 20CC0 8015A8B8 2000A2AF */  sw         $v0, 0x20($sp)
    /* 20CC4 8015A8BC 0000478E */  lw         $a3, 0x0($s2)
    /* 20CC8 8015A8C0 04005226 */  addiu      $s2, $s2, 0x4
    /* 20CCC 8015A8C4 04001026 */  addiu      $s0, $s0, 0x4
    /* 20CD0 8015A8C8 01003126 */  addiu      $s1, $s1, 0x1
    /* 20CD4 8015A8CC 12400000 */  mflo       $t0
    /* 20CD8 8015A8D0 2428020C */  jal        Print__5CFontiiPc8TXT_JUSTP4RECTUcUcUc
    /* 20CDC 8015A8D4 21301601 */   addu      $a2, $t0, $s6
    /* 20CE0 8015A8D8 FE690508 */  j          .L8015A7F8
    /* 20CE4 8015A8DC 0200222A */   slti      $v0, $s1, 0x2
  .L8015A8E0:
    /* 20CE8 8015A8E0 4400BF8F */  lw         $ra, 0x44($sp)
    /* 20CEC 8015A8E4 4000B68F */  lw         $s6, 0x40($sp)
    /* 20CF0 8015A8E8 3C00B58F */  lw         $s5, 0x3C($sp)
    /* 20CF4 8015A8EC 3800B48F */  lw         $s4, 0x38($sp)
    /* 20CF8 8015A8F0 3400B38F */  lw         $s3, 0x34($sp)
    /* 20CFC 8015A8F4 3000B28F */  lw         $s2, 0x30($sp)
    /* 20D00 8015A8F8 2C00B18F */  lw         $s1, 0x2C($sp)
    /* 20D04 8015A8FC 2800B08F */  lw         $s0, 0x28($sp)
    /* 20D08 8015A900 4800BD27 */  addiu      $sp, $sp, 0x48
    /* 20D0C 8015A904 0800E003 */  jr         $ra
    /* 20D10 8015A908 00000000 */   nop
endlabel ShowGameFiles__FPciiG4RECTi
