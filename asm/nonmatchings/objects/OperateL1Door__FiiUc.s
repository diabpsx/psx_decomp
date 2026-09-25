.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching OperateL1Door__FiiUc, 0x15C

glabel OperateL1Door__FiiUc
    /* 47AF0 80057AF0 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 47AF4 80057AF4 1800B2AF */  sw         $s2, 0x18($sp)
    /* 47AF8 80057AF8 21908000 */  addu       $s2, $a0, $zero
    /* 47AFC 80057AFC 1400B1AF */  sw         $s1, 0x14($sp)
    /* 47B00 80057B00 2188A000 */  addu       $s1, $a1, $zero
    /* 47B04 80057B04 40101100 */  sll        $v0, $s1, 1
    /* 47B08 80057B08 21105100 */  addu       $v0, $v0, $s1
    /* 47B0C 80057B0C 80100200 */  sll        $v0, $v0, 2
    /* 47B10 80057B10 23105100 */  subu       $v0, $v0, $s1
    /* 47B14 80057B14 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 47B18 80057B18 80980200 */  sll        $s3, $v0, 2
    /* 47B1C 80057B1C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 47B20 80057B20 40801200 */  sll        $s0, $s2, 1
    /* 47B24 80057B24 21801202 */  addu       $s0, $s0, $s2
    /* 47B28 80057B28 80801000 */  sll        $s0, $s0, 2
    /* 47B2C 80057B2C 21801202 */  addu       $s0, $s0, $s2
    /* 47B30 80057B30 00811000 */  sll        $s0, $s0, 4
    /* 47B34 80057B34 23801202 */  subu       $s0, $s0, $s2
    /* 47B38 80057B38 80801000 */  sll        $s0, $s0, 2
    /* 47B3C 80057B3C 21801202 */  addu       $s0, $s0, $s2
    /* 47B40 80057B40 C0801000 */  sll        $s0, $s0, 3
    /* 47B44 80057B44 2800BFAF */  sw         $ra, 0x28($sp)
    /* 47B48 80057B48 2400B5AF */  sw         $s5, 0x24($sp)
    /* 47B4C 80057B4C 2000B4AF */  sw         $s4, 0x20($sp)
    /* 47B50 80057B50 0E80013C */  lui        $at, %hi(object + 0x1F)
    /* 47B54 80057B54 21083300 */  addu       $at, $at, $s3
    /* 47B58 80057B58 6B8C2280 */  lb         $v0, %lo(object + 0x1F)($at)
    /* 47B5C 80057B5C 0E80013C */  lui        $at, %hi(plr + 0x30)
    /* 47B60 80057B60 21083000 */  addu       $at, $at, $s0
    /* 47B64 80057B64 68A52484 */  lh         $a0, %lo(plr + 0x30)($at)
    /* 47B68 80057B68 21A8C000 */  addu       $s5, $a2, $zero
    /* 47B6C 80057B6C 6D41000C */  jal        abs
    /* 47B70 80057B70 23204400 */   subu      $a0, $v0, $a0
    /* 47B74 80057B74 0E80013C */  lui        $at, %hi(object + 0x20)
    /* 47B78 80057B78 21083300 */  addu       $at, $at, $s3
    /* 47B7C 80057B7C 6C8C2380 */  lb         $v1, %lo(object + 0x20)($at)
    /* 47B80 80057B80 0E80013C */  lui        $at, %hi(plr + 0x32)
    /* 47B84 80057B84 21083000 */  addu       $at, $at, $s0
    /* 47B88 80057B88 6AA52484 */  lh         $a0, %lo(plr + 0x32)($at)
    /* 47B8C 80057B8C 21804000 */  addu       $s0, $v0, $zero
    /* 47B90 80057B90 6D41000C */  jal        abs
    /* 47B94 80057B94 23206400 */   subu      $a0, $v1, $a0
    /* 47B98 80057B98 21A04000 */  addu       $s4, $v0, $zero
    /* 47B9C 80057B9C 01000224 */  addiu      $v0, $zero, 0x1
    /* 47BA0 80057BA0 0F000216 */  bne        $s0, $v0, .L80057BE0
    /* 47BA4 80057BA4 0200022A */   slti      $v0, $s0, 0x2
    /* 47BA8 80057BA8 0200822A */  slti       $v0, $s4, 0x2
    /* 47BAC 80057BAC 0C004010 */  beqz       $v0, .L80057BE0
    /* 47BB0 80057BB0 0200022A */   slti      $v0, $s0, 0x2
    /* 47BB4 80057BB4 0E80013C */  lui        $at, %hi(object + 0x1E)
    /* 47BB8 80057BB8 21083300 */  addu       $at, $at, $s3
    /* 47BBC 80057BBC 6A8C2280 */  lb         $v0, %lo(object + 0x1E)($at)
    /* 47BC0 80057BC0 00000000 */  nop
    /* 47BC4 80057BC4 06005014 */  bne        $v0, $s0, .L80057BE0
    /* 47BC8 80057BC8 0200022A */   slti      $v0, $s0, 0x2
    /* 47BCC 80057BCC 21204002 */  addu       $a0, $s2, $zero
    /* 47BD0 80057BD0 21282002 */  addu       $a1, $s1, $zero
    /* 47BD4 80057BD4 0958010C */  jal        OperateL1LDoor__FiiUc
    /* 47BD8 80057BD8 FF00A632 */   andi      $a2, $s5, 0xFF
    /* 47BDC 80057BDC 0200022A */  slti       $v0, $s0, 0x2
  .L80057BE0:
    /* 47BE0 80057BE0 10004010 */  beqz       $v0, .L80057C24
    /* 47BE4 80057BE4 01000224 */   addiu     $v0, $zero, 0x1
    /* 47BE8 80057BE8 0E008216 */  bne        $s4, $v0, .L80057C24
    /* 47BEC 80057BEC 40101100 */   sll       $v0, $s1, 1
    /* 47BF0 80057BF0 21105100 */  addu       $v0, $v0, $s1
    /* 47BF4 80057BF4 80100200 */  sll        $v0, $v0, 2
    /* 47BF8 80057BF8 23105100 */  subu       $v0, $v0, $s1
    /* 47BFC 80057BFC 80100200 */  sll        $v0, $v0, 2
    /* 47C00 80057C00 0E80013C */  lui        $at, %hi(object + 0x1E)
    /* 47C04 80057C04 21082200 */  addu       $at, $at, $v0
    /* 47C08 80057C08 6A8C2380 */  lb         $v1, %lo(object + 0x1E)($at)
    /* 47C0C 80057C0C 02000224 */  addiu      $v0, $zero, 0x2
    /* 47C10 80057C10 04006214 */  bne        $v1, $v0, .L80057C24
    /* 47C14 80057C14 21204002 */   addu      $a0, $s2, $zero
    /* 47C18 80057C18 21282002 */  addu       $a1, $s1, $zero
    /* 47C1C 80057C1C 3157010C */  jal        OperateL1RDoor__FiiUc
    /* 47C20 80057C20 FF00A632 */   andi      $a2, $s5, 0xFF
  .L80057C24:
    /* 47C24 80057C24 2800BF8F */  lw         $ra, 0x28($sp)
    /* 47C28 80057C28 2400B58F */  lw         $s5, 0x24($sp)
    /* 47C2C 80057C2C 2000B48F */  lw         $s4, 0x20($sp)
    /* 47C30 80057C30 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 47C34 80057C34 1800B28F */  lw         $s2, 0x18($sp)
    /* 47C38 80057C38 1400B18F */  lw         $s1, 0x14($sp)
    /* 47C3C 80057C3C 1000B08F */  lw         $s0, 0x10($sp)
    /* 47C40 80057C40 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 47C44 80057C44 0800E003 */  jr         $ra
    /* 47C48 80057C48 00000000 */   nop
endlabel OperateL1Door__FiiUc
