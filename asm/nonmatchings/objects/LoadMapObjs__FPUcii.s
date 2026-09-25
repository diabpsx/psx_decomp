.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching LoadMapObjs__FPUcii, 0x108

glabel LoadMapObjs__FPUcii
    /* 49C0C 80059C0C B8FFBD27 */  addiu      $sp, $sp, -0x48
    /* 49C10 80059C10 2400B1AF */  sw         $s1, 0x24($sp)
    /* 49C14 80059C14 21888000 */  addu       $s1, $a0, $zero
    /* 49C18 80059C18 01000224 */  addiu      $v0, $zero, 0x1
    /* 49C1C 80059C1C 4000BFAF */  sw         $ra, 0x40($sp)
    /* 49C20 80059C20 3C00B7AF */  sw         $s7, 0x3C($sp)
    /* 49C24 80059C24 3800B6AF */  sw         $s6, 0x38($sp)
    /* 49C28 80059C28 3400B5AF */  sw         $s5, 0x34($sp)
    /* 49C2C 80059C2C 3000B4AF */  sw         $s4, 0x30($sp)
    /* 49C30 80059C30 2C00B3AF */  sw         $s3, 0x2C($sp)
    /* 49C34 80059C34 2800B2AF */  sw         $s2, 0x28($sp)
    /* 49C38 80059C38 2000B0AF */  sw         $s0, 0x20($sp)
    /* 49C3C 80059C3C 501282A3 */  sb         $v0, %gp_rel(InitObjFlag)($gp)
    /* 49C40 80059C40 00003392 */  lbu        $s3, 0x0($s1)
    /* 49C44 80059C44 02003126 */  addiu      $s1, $s1, 0x2
    /* 49C48 80059C48 00003492 */  lbu        $s4, 0x0($s1)
    /* 49C4C 80059C4C 00000000 */  nop
    /* 49C50 80059C50 18007402 */  mult       $s3, $s4
    /* 49C54 80059C54 12100000 */  mflo       $v0
    /* 49C58 80059C58 40981300 */  sll        $s3, $s3, 1
    /* 49C5C 80059C5C 40A01400 */  sll        $s4, $s4, 1
    /* 49C60 80059C60 18007402 */  mult       $s3, $s4
    /* 49C64 80059C64 21900000 */  addu       $s2, $zero, $zero
    /* 49C68 80059C68 40100200 */  sll        $v0, $v0, 1
    /* 49C6C 80059C6C 02004224 */  addiu      $v0, $v0, 0x2
    /* 49C70 80059C70 12180000 */  mflo       $v1
    /* 49C74 80059C74 80180300 */  sll        $v1, $v1, 2
    /* 49C78 80059C78 21104300 */  addu       $v0, $v0, $v1
    /* 49C7C 80059C7C 18008012 */  beqz       $s4, .L80059CE0
    /* 49C80 80059C80 21882202 */   addu      $s1, $s1, $v0
    /* 49C84 80059C84 1000B624 */  addiu      $s6, $a1, 0x10
    /* 49C88 80059C88 1000D524 */  addiu      $s5, $a2, 0x10
    /* 49C8C 80059C8C 0E80173C */  lui        $s7, %hi(ObjTypeConv)
    /* 49C90 80059C90 EC82F726 */  addiu      $s7, $s7, %lo(ObjTypeConv)
  .L80059C94:
    /* 49C94 80059C94 0E006012 */  beqz       $s3, .L80059CD0
    /* 49C98 80059C98 21800000 */   addu      $s0, $zero, $zero
  .L80059C9C:
    /* 49C9C 80059C9C 00002292 */  lbu        $v0, 0x0($s1)
    /* 49CA0 80059CA0 00000000 */  nop
    /* 49CA4 80059CA4 06004010 */  beqz       $v0, .L80059CC0
    /* 49CA8 80059CA8 80100200 */   sll       $v0, $v0, 2
    /* 49CAC 80059CAC 21105700 */  addu       $v0, $v0, $s7
    /* 49CB0 80059CB0 0000448C */  lw         $a0, 0x0($v0)
    /* 49CB4 80059CB4 21281602 */  addu       $a1, $s0, $s6
    /* 49CB8 80059CB8 024F010C */  jal        PostAddObject__Fiii
    /* 49CBC 80059CBC 21305502 */   addu      $a2, $s2, $s5
  .L80059CC0:
    /* 49CC0 80059CC0 01001026 */  addiu      $s0, $s0, 0x1
    /* 49CC4 80059CC4 2A101302 */  slt        $v0, $s0, $s3
    /* 49CC8 80059CC8 F4FF4014 */  bnez       $v0, .L80059C9C
    /* 49CCC 80059CCC 02003126 */   addiu     $s1, $s1, 0x2
  .L80059CD0:
    /* 49CD0 80059CD0 01005226 */  addiu      $s2, $s2, 0x1
    /* 49CD4 80059CD4 2A105402 */  slt        $v0, $s2, $s4
    /* 49CD8 80059CD8 EEFF4014 */  bnez       $v0, .L80059C94
    /* 49CDC 80059CDC 00000000 */   nop
  .L80059CE0:
    /* 49CE0 80059CE0 501280A3 */  sb         $zero, %gp_rel(InitObjFlag)($gp)
    /* 49CE4 80059CE4 4000BF8F */  lw         $ra, 0x40($sp)
    /* 49CE8 80059CE8 3C00B78F */  lw         $s7, 0x3C($sp)
    /* 49CEC 80059CEC 3800B68F */  lw         $s6, 0x38($sp)
    /* 49CF0 80059CF0 3400B58F */  lw         $s5, 0x34($sp)
    /* 49CF4 80059CF4 3000B48F */  lw         $s4, 0x30($sp)
    /* 49CF8 80059CF8 2C00B38F */  lw         $s3, 0x2C($sp)
    /* 49CFC 80059CFC 2800B28F */  lw         $s2, 0x28($sp)
    /* 49D00 80059D00 2400B18F */  lw         $s1, 0x24($sp)
    /* 49D04 80059D04 2000B08F */  lw         $s0, 0x20($sp)
    /* 49D08 80059D08 4800BD27 */  addiu      $sp, $sp, 0x48
    /* 49D0C 80059D0C 0800E003 */  jr         $ra
    /* 49D10 80059D10 00000000 */   nop
endlabel LoadMapObjs__FPUcii
