.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CreateSpellBook__FiiiUcUc, 0x190

glabel CreateSpellBook__FiiiUcUc
    /* 38BA0 80048BA0 B8FFBD27 */  addiu      $sp, $sp, -0x48
    /* 38BA4 80048BA4 2000B0AF */  sw         $s0, 0x20($sp)
    /* 38BA8 80048BA8 21808000 */  addu       $s0, $a0, $zero
    /* 38BAC 80048BAC 2400B1AF */  sw         $s1, 0x24($sp)
    /* 38BB0 80048BB0 2188A000 */  addu       $s1, $a1, $zero
    /* 38BB4 80048BB4 3C00B7AF */  sw         $s7, 0x3C($sp)
    /* 38BB8 80048BB8 21B8C000 */  addu       $s7, $a2, $zero
    /* 38BBC 80048BBC 2C00B3AF */  sw         $s3, 0x2C($sp)
    /* 38BC0 80048BC0 21980000 */  addu       $s3, $zero, $zero
    /* 38BC4 80048BC4 21200000 */  addu       $a0, $zero, $zero
    /* 38BC8 80048BC8 3000B4AF */  sw         $s4, 0x30($sp)
    /* 38BCC 80048BCC 5800B493 */  lbu        $s4, 0x58($sp)
    /* 38BD0 80048BD0 18000524 */  addiu      $a1, $zero, 0x18
    /* 38BD4 80048BD4 4000BEAF */  sw         $fp, 0x40($sp)
    /* 38BD8 80048BD8 21F0E000 */  addu       $fp, $a3, $zero
    /* 38BDC 80048BDC 4400BFAF */  sw         $ra, 0x44($sp)
    /* 38BE0 80048BE0 3800B6AF */  sw         $s6, 0x38($sp)
    /* 38BE4 80048BE4 3400B5AF */  sw         $s5, 0x34($sp)
    /* 38BE8 80048BE8 100F010C */  jal        RndTypeItems__Fii
    /* 38BEC 80048BEC 2800B2AF */   sw        $s2, 0x28($sp)
    /* 38BF0 80048BF0 0811838F */  lw         $v1, %gp_rel(numitems)($gp)
    /* 38BF4 80048BF4 00000000 */  nop
    /* 38BF8 80048BF8 7F006328 */  slti       $v1, $v1, 0x7F
    /* 38BFC 80048BFC 3F006010 */  beqz       $v1, .L80048CFC
    /* 38C00 80048C00 21B04000 */   addu      $s6, $v0, $zero
    /* 38C04 80048C04 21200002 */  addu       $a0, $s0, $zero
    /* 38C08 80048C08 21282002 */  addu       $a1, $s1, $zero
    /* 38C0C 80048C0C 0D80103C */  lui        $s0, %hi(itemavail)
    /* 38C10 80048C10 D4531026 */  addiu      $s0, $s0, %lo(itemavail)
    /* 38C14 80048C14 00001182 */  lb         $s1, 0x0($s0)
    /* 38C18 80048C18 01001524 */  addiu      $s5, $zero, 0x1
    /* 38C1C 80048C1C 2902010C */  jal        GetSuperItemSpace__Fiic
    /* 38C20 80048C20 21302002 */   addu      $a2, $s1, $zero
    /* 38C24 80048C24 7E000326 */  addiu      $v1, $s0, 0x7E
    /* 38C28 80048C28 C0101100 */  sll        $v0, $s1, 3
    /* 38C2C 80048C2C 23105100 */  subu       $v0, $v0, $s1
    /* 38C30 80048C30 80100200 */  sll        $v0, $v0, 2
    /* 38C34 80048C34 0811848F */  lw         $a0, %gp_rel(numitems)($gp)
    /* 38C38 80048C38 23105100 */  subu       $v0, $v0, $s1
    /* 38C3C 80048C3C 23186400 */  subu       $v1, $v1, $a0
    /* 38C40 80048C40 00006390 */  lbu        $v1, 0x0($v1)
    /* 38C44 80048C44 80900200 */  sll        $s2, $v0, 2
    /* 38C48 80048C48 000003A2 */  sb         $v1, 0x0($s0)
    /* 38C4C 80048C4C 0D80013C */  lui        $at, %hi(itemactive)
    /* 38C50 80048C50 21082400 */  addu       $at, $at, $a0
    /* 38C54 80048C54 545331A0 */  sb         $s1, %lo(itemactive)($at)
  .L80048C58:
    /* 38C58 80048C58 B7F6000C */  jal        GetRndSeed__Fv
    /* 38C5C 80048C5C 00000000 */   nop
    /* 38C60 80048C60 21202002 */  addu       $a0, $s1, $zero
    /* 38C64 80048C64 2128C002 */  addu       $a1, $s6, $zero
    /* 38C68 80048C68 1280073C */  lui        $a3, %hi(currlevel)
    /* 38C6C 80048C6C 0CC1E790 */  lbu        $a3, %lo(currlevel)($a3)
    /* 38C70 80048C70 21304000 */  addu       $a2, $v0, $zero
    /* 38C74 80048C74 1000B5AF */  sw         $s5, 0x10($sp)
    /* 38C78 80048C78 1400B5AF */  sw         $s5, 0x14($sp)
    /* 38C7C 80048C7C 1800A0AF */  sw         $zero, 0x18($sp)
    /* 38C80 80048C80 1C00B4AF */  sw         $s4, 0x1C($sp)
    /* 38C84 80048C84 2411010C */  jal        SetupAllItems__FiiiiiUcUcUc
    /* 38C88 80048C88 40380700 */   sll       $a3, $a3, 1
    /* 38C8C 80048C8C 0D80013C */  lui        $at, %hi(item + 0x4D)
    /* 38C90 80048C90 21083200 */  addu       $at, $at, $s2
    /* 38C94 80048C94 A11D2390 */  lbu        $v1, %lo(item + 0x4D)($at)
    /* 38C98 80048C98 18000224 */  addiu      $v0, $zero, 0x18
    /* 38C9C 80048C9C 09006214 */  bne        $v1, $v0, .L80048CC4
    /* 38CA0 80048CA0 FF006232 */   andi      $v0, $s3, 0xFF
    /* 38CA4 80048CA4 0D80013C */  lui        $at, %hi(item + 0x3D)
    /* 38CA8 80048CA8 21083200 */  addu       $at, $at, $s2
    /* 38CAC 80048CAC 911D2280 */  lb         $v0, %lo(item + 0x3D)($at)
    /* 38CB0 80048CB0 00000000 */  nop
    /* 38CB4 80048CB4 03005714 */  bne        $v0, $s7, .L80048CC4
    /* 38CB8 80048CB8 FF006232 */   andi      $v0, $s3, 0xFF
    /* 38CBC 80048CBC 01001324 */  addiu      $s3, $zero, 0x1
    /* 38CC0 80048CC0 FF006232 */  andi       $v0, $s3, 0xFF
  .L80048CC4:
    /* 38CC4 80048CC4 E4FF4010 */  beqz       $v0, .L80048C58
    /* 38CC8 80048CC8 FF00C233 */   andi      $v0, $fp, 0xFF
    /* 38CCC 80048CCC 03004010 */  beqz       $v0, .L80048CDC
    /* 38CD0 80048CD0 21200000 */   addu      $a0, $zero, $zero
    /* 38CD4 80048CD4 723F010C */  jal        NetSendCmdDItem__FUci
    /* 38CD8 80048CD8 21282002 */   addu      $a1, $s1, $zero
  .L80048CDC:
    /* 38CDC 80048CDC 03008012 */  beqz       $s4, .L80048CEC
    /* 38CE0 80048CE0 00000000 */   nop
    /* 38CE4 80048CE4 CE3C010C */  jal        DeltaAddItem__Fi
    /* 38CE8 80048CE8 21202002 */   addu      $a0, $s1, $zero
  .L80048CEC:
    /* 38CEC 80048CEC 0811828F */  lw         $v0, %gp_rel(numitems)($gp)
    /* 38CF0 80048CF0 00000000 */  nop
    /* 38CF4 80048CF4 01004224 */  addiu      $v0, $v0, 0x1
    /* 38CF8 80048CF8 081182AF */  sw         $v0, %gp_rel(numitems)($gp)
  .L80048CFC:
    /* 38CFC 80048CFC 4400BF8F */  lw         $ra, 0x44($sp)
    /* 38D00 80048D00 4000BE8F */  lw         $fp, 0x40($sp)
    /* 38D04 80048D04 3C00B78F */  lw         $s7, 0x3C($sp)
    /* 38D08 80048D08 3800B68F */  lw         $s6, 0x38($sp)
    /* 38D0C 80048D0C 3400B58F */  lw         $s5, 0x34($sp)
    /* 38D10 80048D10 3000B48F */  lw         $s4, 0x30($sp)
    /* 38D14 80048D14 2C00B38F */  lw         $s3, 0x2C($sp)
    /* 38D18 80048D18 2800B28F */  lw         $s2, 0x28($sp)
    /* 38D1C 80048D1C 2400B18F */  lw         $s1, 0x24($sp)
    /* 38D20 80048D20 2000B08F */  lw         $s0, 0x20($sp)
    /* 38D24 80048D24 4800BD27 */  addiu      $sp, $sp, 0x48
    /* 38D28 80048D28 0800E003 */  jr         $ra
    /* 38D2C 80048D2C 00000000 */   nop
endlabel CreateSpellBook__FiiiUcUc
