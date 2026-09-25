.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SortWitch__Fv, 0x190

glabel SortWitch__Fv
    /* 39AB8 80049AB8 1280033C */  lui        $v1, %hi(StorePlrNo)
    /* 39ABC 80049ABC B4BA638C */  lw         $v1, %lo(StorePlrNo)($v1)
    /* 39AC0 80049AC0 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 39AC4 80049AC4 1400B1AF */  sw         $s1, 0x14($sp)
    /* 39AC8 80049AC8 2000BFAF */  sw         $ra, 0x20($sp)
    /* 39ACC 80049ACC 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 39AD0 80049AD0 1800B2AF */  sw         $s2, 0x18($sp)
    /* 39AD4 80049AD4 1000B0AF */  sw         $s0, 0x10($sp)
    /* 39AD8 80049AD8 00110300 */  sll        $v0, $v1, 4
    /* 39ADC 80049ADC 21104300 */  addu       $v0, $v0, $v1
    /* 39AE0 80049AE0 C0100200 */  sll        $v0, $v0, 3
    /* 39AE4 80049AE4 23104300 */  subu       $v0, $v0, $v1
    /* 39AE8 80049AE8 00210200 */  sll        $a0, $v0, 4
    /* 39AEC 80049AEC 0E80013C */  lui        $at, %hi(_witchitem + 0x1DC)
    /* 39AF0 80049AF0 21082400 */  addu       $at, $at, $a0
    /* 39AF4 80049AF4 F4FB2384 */  lh         $v1, %lo(_witchitem + 0x1DC)($at)
    /* 39AF8 80049AF8 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 39AFC 80049AFC 13006210 */  beq        $v1, $v0, .L80049B4C
    /* 39B00 80049B00 03001124 */   addiu     $s1, $zero, 0x3
    /* 39B04 80049B04 FFFF0524 */  addiu      $a1, $zero, -0x1
    /* 39B08 80049B08 01002326 */  addiu      $v1, $s1, 0x1
  .L80049B0C:
    /* 39B0C 80049B0C 14006228 */  slti       $v0, $v1, 0x14
    /* 39B10 80049B10 0E004010 */  beqz       $v0, .L80049B4C
    /* 39B14 80049B14 01006224 */   addiu     $v0, $v1, 0x1
    /* 39B18 80049B18 21886000 */  addu       $s1, $v1, $zero
    /* 39B1C 80049B1C C0180200 */  sll        $v1, $v0, 3
    /* 39B20 80049B20 23186200 */  subu       $v1, $v1, $v0
    /* 39B24 80049B24 80180300 */  sll        $v1, $v1, 2
    /* 39B28 80049B28 23186200 */  subu       $v1, $v1, $v0
    /* 39B2C 80049B2C 80180300 */  sll        $v1, $v1, 2
    /* 39B30 80049B30 21186400 */  addu       $v1, $v1, $a0
    /* 39B34 80049B34 0E80013C */  lui        $at, %hi(_witchitem + 0x2C)
    /* 39B38 80049B38 21082300 */  addu       $at, $at, $v1
    /* 39B3C 80049B3C 44FA2284 */  lh         $v0, %lo(_witchitem + 0x2C)($at)
    /* 39B40 80049B40 00000000 */  nop
    /* 39B44 80049B44 F1FF4514 */  bne        $v0, $a1, .L80049B0C
    /* 39B48 80049B48 01002326 */   addiu     $v1, $s1, 0x1
  .L80049B4C:
    /* 39B4C 80049B4C 0400222A */  slti       $v0, $s1, 0x4
    /* 39B50 80049B50 35004014 */  bnez       $v0, .L80049C28
    /* 39B54 80049B54 03000424 */   addiu     $a0, $zero, 0x3
    /* 39B58 80049B58 0E80123C */  lui        $s2, %hi(_witchitem)
    /* 39B5C 80049B5C 18FA5226 */  addiu      $s2, $s2, %lo(_witchitem)
    /* 39B60 80049B60 6C005326 */  addiu      $s3, $s2, 0x6C
  .L80049B64:
    /* 39B64 80049B64 2A109100 */  slt        $v0, $a0, $s1
    /* 39B68 80049B68 29004010 */  beqz       $v0, .L80049C10
    /* 39B6C 80049B6C 01000524 */   addiu     $a1, $zero, 0x1
    /* 39B70 80049B70 C0100400 */  sll        $v0, $a0, 3
  .L80049B74:
    /* 39B74 80049B74 23104400 */  subu       $v0, $v0, $a0
    /* 39B78 80049B78 80100200 */  sll        $v0, $v0, 2
    /* 39B7C 80049B7C 23104400 */  subu       $v0, $v0, $a0
    /* 39B80 80049B80 80380200 */  sll        $a3, $v0, 2
    /* 39B84 80049B84 1280033C */  lui        $v1, %hi(StorePlrNo)
    /* 39B88 80049B88 B4BA638C */  lw         $v1, %lo(StorePlrNo)($v1)
    /* 39B8C 80049B8C 01009024 */  addiu      $s0, $a0, 0x1
    /* 39B90 80049B90 00110300 */  sll        $v0, $v1, 4
    /* 39B94 80049B94 21104300 */  addu       $v0, $v0, $v1
    /* 39B98 80049B98 C0100200 */  sll        $v0, $v0, 3
    /* 39B9C 80049B9C 23104300 */  subu       $v0, $v0, $v1
    /* 39BA0 80049BA0 00310200 */  sll        $a2, $v0, 4
    /* 39BA4 80049BA4 2118E600 */  addu       $v1, $a3, $a2
    /* 39BA8 80049BA8 C0101000 */  sll        $v0, $s0, 3
    /* 39BAC 80049BAC 23105000 */  subu       $v0, $v0, $s0
    /* 39BB0 80049BB0 80100200 */  sll        $v0, $v0, 2
    /* 39BB4 80049BB4 23105000 */  subu       $v0, $v0, $s0
    /* 39BB8 80049BB8 80100200 */  sll        $v0, $v0, 2
    /* 39BBC 80049BBC 21104600 */  addu       $v0, $v0, $a2
    /* 39BC0 80049BC0 0E80013C */  lui        $at, %hi(_witchitem + 0x2E)
    /* 39BC4 80049BC4 21082300 */  addu       $at, $at, $v1
    /* 39BC8 80049BC8 46FA2384 */  lh         $v1, %lo(_witchitem + 0x2E)($at)
    /* 39BCC 80049BCC 0E80013C */  lui        $at, %hi(_witchitem + 0x2E)
    /* 39BD0 80049BD0 21082200 */  addu       $at, $at, $v0
    /* 39BD4 80049BD4 46FA2284 */  lh         $v0, %lo(_witchitem + 0x2E)($at)
    /* 39BD8 80049BD8 00000000 */  nop
    /* 39BDC 80049BDC 2A104300 */  slt        $v0, $v0, $v1
    /* 39BE0 80049BE0 08004010 */  beqz       $v0, .L80049C04
    /* 39BE4 80049BE4 21200002 */   addu      $a0, $s0, $zero
    /* 39BE8 80049BE8 2120F200 */  addu       $a0, $a3, $s2
    /* 39BEC 80049BEC 2128D300 */  addu       $a1, $a2, $s3
    /* 39BF0 80049BF0 2120C400 */  addu       $a0, $a2, $a0
    /* 39BF4 80049BF4 6C26010C */  jal        BubbleSwapItem__FP10ItemStructT0
    /* 39BF8 80049BF8 2128A700 */   addu      $a1, $a1, $a3
    /* 39BFC 80049BFC 21280000 */  addu       $a1, $zero, $zero
    /* 39C00 80049C00 21200002 */  addu       $a0, $s0, $zero
  .L80049C04:
    /* 39C04 80049C04 2A109100 */  slt        $v0, $a0, $s1
    /* 39C08 80049C08 DAFF4014 */  bnez       $v0, .L80049B74
    /* 39C0C 80049C0C C0100400 */   sll       $v0, $a0, 3
  .L80049C10:
    /* 39C10 80049C10 FFFF3126 */  addiu      $s1, $s1, -0x1
    /* 39C14 80049C14 0400222A */  slti       $v0, $s1, 0x4
    /* 39C18 80049C18 03004014 */  bnez       $v0, .L80049C28
    /* 39C1C 80049C1C FF00A230 */   andi      $v0, $a1, 0xFF
    /* 39C20 80049C20 D0FF4010 */  beqz       $v0, .L80049B64
    /* 39C24 80049C24 03000424 */   addiu     $a0, $zero, 0x3
  .L80049C28:
    /* 39C28 80049C28 2000BF8F */  lw         $ra, 0x20($sp)
    /* 39C2C 80049C2C 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 39C30 80049C30 1800B28F */  lw         $s2, 0x18($sp)
    /* 39C34 80049C34 1400B18F */  lw         $s1, 0x14($sp)
    /* 39C38 80049C38 1000B08F */  lw         $s0, 0x10($sp)
    /* 39C3C 80049C3C 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 39C40 80049C40 0800E003 */  jr         $ra
    /* 39C44 80049C44 00000000 */   nop
endlabel SortWitch__Fv
