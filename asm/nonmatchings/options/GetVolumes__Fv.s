.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetVolumes__Fv, 0x9C

glabel GetVolumes__Fv
    /* 9A0B8 800AA0B8 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 9A0BC 800AA0BC 1800BFAF */  sw         $ra, 0x18($sp)
    /* 9A0C0 800AA0C0 02A8020C */  jal        SetLoadedVolumes__Fv
    /* 9A0C4 800AA0C4 00000000 */   nop
    /* 9A0C8 800AA0C8 21300000 */  addu       $a2, $zero, $zero
    /* 9A0CC 800AA0CC 0D80083C */  lui        $t0, %hi(MenuList)
    /* 9A0D0 800AA0D0 40D20825 */  addiu      $t0, $t0, %lo(MenuList)
    /* 9A0D4 800AA0D4 741F878F */  lw         $a3, %gp_rel(D_8011C6F4)($gp)
  .L800AA0D8:
    /* 9A0D8 800AA0D8 0A00C228 */  slti       $v0, $a2, 0xA
    /* 9A0DC 800AA0DC 19004010 */  beqz       $v0, .L800AA144
    /* 9A0E0 800AA0E0 C0100600 */   sll       $v0, $a2, 3
    /* 9A0E4 800AA0E4 21284800 */  addu       $a1, $v0, $t0
    /* 9A0E8 800AA0E8 0300A290 */  lbu        $v0, 0x3($a1)
    /* 9A0EC 800AA0EC 0400A38C */  lw         $v1, 0x4($a1)
    /* 9A0F0 800AA0F0 12004018 */  blez       $v0, .L800AA13C
    /* 9A0F4 800AA0F4 21200000 */   addu      $a0, $zero, $zero
    /* 9A0F8 800AA0F8 0C006324 */  addiu      $v1, $v1, 0xC
  .L800AA0FC:
    /* 9A0FC 800AA0FC 0400628C */  lw         $v0, 0x4($v1)
    /* 9A100 800AA100 00000000 */  nop
    /* 9A104 800AA104 08004010 */  beqz       $v0, .L800AA128
    /* 9A108 800AA108 00000000 */   nop
    /* 9A10C 800AA10C 0000428C */  lw         $v0, 0x0($v0)
    /* 9A110 800AA110 00000000 */  nop
    /* 9A114 800AA114 000062AC */  sw         $v0, 0x0($v1)
    /* 9A118 800AA118 2A10E200 */  slt        $v0, $a3, $v0
    /* 9A11C 800AA11C 02004010 */  beqz       $v0, .L800AA128
    /* 9A120 800AA120 00000000 */   nop
    /* 9A124 800AA124 000067AC */  sw         $a3, 0x0($v1)
  .L800AA128:
    /* 9A128 800AA128 0300A290 */  lbu        $v0, 0x3($a1)
    /* 9A12C 800AA12C 01008424 */  addiu      $a0, $a0, 0x1
    /* 9A130 800AA130 2A108200 */  slt        $v0, $a0, $v0
    /* 9A134 800AA134 F1FF4014 */  bnez       $v0, .L800AA0FC
    /* 9A138 800AA138 18006324 */   addiu     $v1, $v1, 0x18
  .L800AA13C:
    /* 9A13C 800AA13C 36A80208 */  j          .L800AA0D8
    /* 9A140 800AA140 0100C624 */   addiu     $a2, $a2, 0x1
  .L800AA144:
    /* 9A144 800AA144 1800BF8F */  lw         $ra, 0x18($sp)
    /* 9A148 800AA148 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 9A14C 800AA14C 0800E003 */  jr         $ra
    /* 9A150 800AA150 00000000 */   nop
endlabel GetVolumes__Fv
