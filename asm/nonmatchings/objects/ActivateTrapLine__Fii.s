.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ActivateTrapLine__Fii, 0x110

glabel ActivateTrapLine__Fii
    /* 44B5C 80054B5C 4C12828F */  lw         $v0, %gp_rel(numobjects)($gp)
    /* 44B60 80054B60 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 44B64 80054B64 2400B3AF */  sw         $s3, 0x24($sp)
    /* 44B68 80054B68 21988000 */  addu       $s3, $a0, $zero
    /* 44B6C 80054B6C 2800B4AF */  sw         $s4, 0x28($sp)
    /* 44B70 80054B70 21A0A000 */  addu       $s4, $a1, $zero
    /* 44B74 80054B74 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 44B78 80054B78 21880000 */  addu       $s1, $zero, $zero
    /* 44B7C 80054B7C 2C00BFAF */  sw         $ra, 0x2C($sp)
    /* 44B80 80054B80 2000B2AF */  sw         $s2, 0x20($sp)
    /* 44B84 80054B84 30004018 */  blez       $v0, .L80054C48
    /* 44B88 80054B88 1800B0AF */   sw        $s0, 0x18($sp)
    /* 44B8C 80054B8C 01001224 */  addiu      $s2, $zero, 0x1
  .L80054B90:
    /* 44B90 80054B90 0E80013C */  lui        $at, %hi(objectactive)
    /* 44B94 80054B94 21083100 */  addu       $at, $at, $s1
    /* 44B98 80054B98 20A22280 */  lb         $v0, %lo(objectactive)($at)
    /* 44B9C 80054B9C 00000000 */  nop
    /* 44BA0 80054BA0 40180200 */  sll        $v1, $v0, 1
    /* 44BA4 80054BA4 21186200 */  addu       $v1, $v1, $v0
    /* 44BA8 80054BA8 80180300 */  sll        $v1, $v1, 2
    /* 44BAC 80054BAC 23186200 */  subu       $v1, $v1, $v0
    /* 44BB0 80054BB0 80800300 */  sll        $s0, $v1, 2
    /* 44BB4 80054BB4 0E80013C */  lui        $at, %hi(object + 0x1E)
    /* 44BB8 80054BB8 21083000 */  addu       $at, $at, $s0
    /* 44BBC 80054BBC 6A8C2280 */  lb         $v0, %lo(object + 0x1E)($at)
    /* 44BC0 80054BC0 00000000 */  nop
    /* 44BC4 80054BC4 1B005314 */  bne        $v0, $s3, .L80054C34
    /* 44BC8 80054BC8 00000000 */   nop
    /* 44BCC 80054BCC 0E80013C */  lui        $at, %hi(object + 0xE)
    /* 44BD0 80054BD0 21083000 */  addu       $at, $at, $s0
    /* 44BD4 80054BD4 5A8C2284 */  lh         $v0, %lo(object + 0xE)($at)
    /* 44BD8 80054BD8 00000000 */  nop
    /* 44BDC 80054BDC 15005414 */  bne        $v0, $s4, .L80054C34
    /* 44BE0 80054BE0 00000000 */   nop
    /* 44BE4 80054BE4 0E80013C */  lui        $at, %hi(object + 0x1F)
    /* 44BE8 80054BE8 21083000 */  addu       $at, $at, $s0
    /* 44BEC 80054BEC 6B8C2480 */  lb         $a0, %lo(object + 0x1F)($at)
    /* 44BF0 80054BF0 0E80013C */  lui        $at, %hi(object + 0x20)
    /* 44BF4 80054BF4 21083000 */  addu       $at, $at, $s0
    /* 44BF8 80054BF8 6C8C2580 */  lb         $a1, %lo(object + 0x20)($at)
    /* 44BFC 80054BFC 0E80013C */  lui        $at, %hi(object + 0x14)
    /* 44C00 80054C00 21083000 */  addu       $at, $at, $s0
    /* 44C04 80054C04 608C32A4 */  sh         $s2, %lo(object + 0x14)($at)
    /* 44C08 80054C08 0E80013C */  lui        $at, %hi(object + 0x25)
    /* 44C0C 80054C0C 21083000 */  addu       $at, $at, $s0
    /* 44C10 80054C10 718C32A0 */  sb         $s2, %lo(object + 0x25)($at)
    /* 44C14 80054C14 0E80013C */  lui        $at, %hi(object + 0x8)
    /* 44C18 80054C18 21083000 */  addu       $at, $at, $s0
    /* 44C1C 80054C1C 548C32A4 */  sh         $s2, %lo(object + 0x8)($at)
    /* 44C20 80054C20 BA34010C */  jal        AddLight__Fiii
    /* 44C24 80054C24 26010624 */   addiu     $a2, $zero, 0x126
    /* 44C28 80054C28 0E80013C */  lui        $at, %hi(object)
    /* 44C2C 80054C2C 21083000 */  addu       $at, $at, $s0
    /* 44C30 80054C30 4C8C22A4 */  sh         $v0, %lo(object)($at)
  .L80054C34:
    /* 44C34 80054C34 4C12828F */  lw         $v0, %gp_rel(numobjects)($gp)
    /* 44C38 80054C38 01003126 */  addiu      $s1, $s1, 0x1
    /* 44C3C 80054C3C 2A102202 */  slt        $v0, $s1, $v0
    /* 44C40 80054C40 D3FF4014 */  bnez       $v0, .L80054B90
    /* 44C44 80054C44 00000000 */   nop
  .L80054C48:
    /* 44C48 80054C48 2C00BF8F */  lw         $ra, 0x2C($sp)
    /* 44C4C 80054C4C 2800B48F */  lw         $s4, 0x28($sp)
    /* 44C50 80054C50 2400B38F */  lw         $s3, 0x24($sp)
    /* 44C54 80054C54 2000B28F */  lw         $s2, 0x20($sp)
    /* 44C58 80054C58 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 44C5C 80054C5C 1800B08F */  lw         $s0, 0x18($sp)
    /* 44C60 80054C60 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 44C64 80054C64 0800E003 */  jr         $ra
    /* 44C68 80054C68 00000000 */   nop
endlabel ActivateTrapLine__Fii
