.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching OperateL3Door__FiiUc, 0x15C

glabel OperateL3Door__FiiUc
    /* 49AB0 80059AB0 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 49AB4 80059AB4 1800B2AF */  sw         $s2, 0x18($sp)
    /* 49AB8 80059AB8 21908000 */  addu       $s2, $a0, $zero
    /* 49ABC 80059ABC 1400B1AF */  sw         $s1, 0x14($sp)
    /* 49AC0 80059AC0 2188A000 */  addu       $s1, $a1, $zero
    /* 49AC4 80059AC4 40101100 */  sll        $v0, $s1, 1
    /* 49AC8 80059AC8 21105100 */  addu       $v0, $v0, $s1
    /* 49ACC 80059ACC 80100200 */  sll        $v0, $v0, 2
    /* 49AD0 80059AD0 23105100 */  subu       $v0, $v0, $s1
    /* 49AD4 80059AD4 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 49AD8 80059AD8 80980200 */  sll        $s3, $v0, 2
    /* 49ADC 80059ADC 1000B0AF */  sw         $s0, 0x10($sp)
    /* 49AE0 80059AE0 40801200 */  sll        $s0, $s2, 1
    /* 49AE4 80059AE4 21801202 */  addu       $s0, $s0, $s2
    /* 49AE8 80059AE8 80801000 */  sll        $s0, $s0, 2
    /* 49AEC 80059AEC 21801202 */  addu       $s0, $s0, $s2
    /* 49AF0 80059AF0 00811000 */  sll        $s0, $s0, 4
    /* 49AF4 80059AF4 23801202 */  subu       $s0, $s0, $s2
    /* 49AF8 80059AF8 80801000 */  sll        $s0, $s0, 2
    /* 49AFC 80059AFC 21801202 */  addu       $s0, $s0, $s2
    /* 49B00 80059B00 C0801000 */  sll        $s0, $s0, 3
    /* 49B04 80059B04 2800BFAF */  sw         $ra, 0x28($sp)
    /* 49B08 80059B08 2400B5AF */  sw         $s5, 0x24($sp)
    /* 49B0C 80059B0C 2000B4AF */  sw         $s4, 0x20($sp)
    /* 49B10 80059B10 0E80013C */  lui        $at, %hi(object + 0x1F)
    /* 49B14 80059B14 21083300 */  addu       $at, $at, $s3
    /* 49B18 80059B18 6B8C2280 */  lb         $v0, %lo(object + 0x1F)($at)
    /* 49B1C 80059B1C 0E80013C */  lui        $at, %hi(plr + 0x30)
    /* 49B20 80059B20 21083000 */  addu       $at, $at, $s0
    /* 49B24 80059B24 68A52484 */  lh         $a0, %lo(plr + 0x30)($at)
    /* 49B28 80059B28 21A8C000 */  addu       $s5, $a2, $zero
    /* 49B2C 80059B2C 6D41000C */  jal        abs
    /* 49B30 80059B30 23204400 */   subu      $a0, $v0, $a0
    /* 49B34 80059B34 0E80013C */  lui        $at, %hi(object + 0x20)
    /* 49B38 80059B38 21083300 */  addu       $at, $at, $s3
    /* 49B3C 80059B3C 6C8C2380 */  lb         $v1, %lo(object + 0x20)($at)
    /* 49B40 80059B40 0E80013C */  lui        $at, %hi(plr + 0x32)
    /* 49B44 80059B44 21083000 */  addu       $at, $at, $s0
    /* 49B48 80059B48 6AA52484 */  lh         $a0, %lo(plr + 0x32)($at)
    /* 49B4C 80059B4C 21804000 */  addu       $s0, $v0, $zero
    /* 49B50 80059B50 6D41000C */  jal        abs
    /* 49B54 80059B54 23206400 */   subu      $a0, $v1, $a0
    /* 49B58 80059B58 21A04000 */  addu       $s4, $v0, $zero
    /* 49B5C 80059B5C 01000224 */  addiu      $v0, $zero, 0x1
    /* 49B60 80059B60 0F000216 */  bne        $s0, $v0, .L80059BA0
    /* 49B64 80059B64 0200022A */   slti      $v0, $s0, 0x2
    /* 49B68 80059B68 0200822A */  slti       $v0, $s4, 0x2
    /* 49B6C 80059B6C 0B004010 */  beqz       $v0, .L80059B9C
    /* 49B70 80059B70 4B000224 */   addiu     $v0, $zero, 0x4B
    /* 49B74 80059B74 0E80013C */  lui        $at, %hi(object + 0x1E)
    /* 49B78 80059B78 21083300 */  addu       $at, $at, $s3
    /* 49B7C 80059B7C 6A8C2380 */  lb         $v1, %lo(object + 0x1E)($at)
    /* 49B80 80059B80 00000000 */  nop
    /* 49B84 80059B84 06006214 */  bne        $v1, $v0, .L80059BA0
    /* 49B88 80059B88 0200022A */   slti      $v0, $s0, 0x2
    /* 49B8C 80059B8C 21204002 */  addu       $a0, $s2, $zero
    /* 49B90 80059B90 21282002 */  addu       $a1, $s1, $zero
    /* 49B94 80059B94 A55A010C */  jal        OperateL3RDoor__FiiUc
    /* 49B98 80059B98 FF00A632 */   andi      $a2, $s5, 0xFF
  .L80059B9C:
    /* 49B9C 80059B9C 0200022A */  slti       $v0, $s0, 0x2
  .L80059BA0:
    /* 49BA0 80059BA0 10004010 */  beqz       $v0, .L80059BE4
    /* 49BA4 80059BA4 01000224 */   addiu     $v0, $zero, 0x1
    /* 49BA8 80059BA8 0E008216 */  bne        $s4, $v0, .L80059BE4
    /* 49BAC 80059BAC 40101100 */   sll       $v0, $s1, 1
    /* 49BB0 80059BB0 21105100 */  addu       $v0, $v0, $s1
    /* 49BB4 80059BB4 80100200 */  sll        $v0, $v0, 2
    /* 49BB8 80059BB8 23105100 */  subu       $v0, $v0, $s1
    /* 49BBC 80059BBC 80100200 */  sll        $v0, $v0, 2
    /* 49BC0 80059BC0 0E80013C */  lui        $at, %hi(object + 0x1E)
    /* 49BC4 80059BC4 21082200 */  addu       $at, $at, $v0
    /* 49BC8 80059BC8 6A8C2380 */  lb         $v1, %lo(object + 0x1E)($at)
    /* 49BCC 80059BCC 4A000224 */  addiu      $v0, $zero, 0x4A
    /* 49BD0 80059BD0 04006214 */  bne        $v1, $v0, .L80059BE4
    /* 49BD4 80059BD4 21204002 */   addu      $a0, $s2, $zero
    /* 49BD8 80059BD8 21282002 */  addu       $a1, $s1, $zero
    /* 49BDC 80059BDC 5C5B010C */  jal        OperateL3LDoor__FiiUc
    /* 49BE0 80059BE0 FF00A632 */   andi      $a2, $s5, 0xFF
  .L80059BE4:
    /* 49BE4 80059BE4 2800BF8F */  lw         $ra, 0x28($sp)
    /* 49BE8 80059BE8 2400B58F */  lw         $s5, 0x24($sp)
    /* 49BEC 80059BEC 2000B48F */  lw         $s4, 0x20($sp)
    /* 49BF0 80059BF0 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 49BF4 80059BF4 1800B28F */  lw         $s2, 0x18($sp)
    /* 49BF8 80059BF8 1400B18F */  lw         $s1, 0x14($sp)
    /* 49BFC 80059BFC 1000B08F */  lw         $s0, 0x10($sp)
    /* 49C00 80059C00 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 49C04 80059C04 0800E003 */  jr         $ra
    /* 49C08 80059C08 00000000 */   nop
endlabel OperateL3Door__FiiUc
