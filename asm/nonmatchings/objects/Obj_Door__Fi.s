.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching Obj_Door__Fi, 0x170

glabel Obj_Door__Fi
    /* 449A0 800549A0 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 449A4 800549A4 1400B1AF */  sw         $s1, 0x14($sp)
    /* 449A8 800549A8 21888000 */  addu       $s1, $a0, $zero
    /* 449AC 800549AC 40101100 */  sll        $v0, $s1, 1
    /* 449B0 800549B0 21105100 */  addu       $v0, $v0, $s1
    /* 449B4 800549B4 80100200 */  sll        $v0, $v0, 2
    /* 449B8 800549B8 23105100 */  subu       $v0, $v0, $s1
    /* 449BC 800549BC 80200200 */  sll        $a0, $v0, 2
    /* 449C0 800549C0 2000BFAF */  sw         $ra, 0x20($sp)
    /* 449C4 800549C4 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 449C8 800549C8 1800B2AF */  sw         $s2, 0x18($sp)
    /* 449CC 800549CC 1000B0AF */  sw         $s0, 0x10($sp)
    /* 449D0 800549D0 0E80013C */  lui        $at, %hi(object + 0x14)
    /* 449D4 800549D4 21082400 */  addu       $at, $at, $a0
    /* 449D8 800549D8 608C2284 */  lh         $v0, %lo(object + 0x14)($at)
    /* 449DC 800549DC 00000000 */  nop
    /* 449E0 800549E0 09004014 */  bnez       $v0, .L80054A08
    /* 449E4 800549E4 03000224 */   addiu     $v0, $zero, 0x3
    /* 449E8 800549E8 0E80013C */  lui        $at, %hi(object + 0x23)
    /* 449EC 800549EC 21082400 */  addu       $at, $at, $a0
    /* 449F0 800549F0 6F8C22A0 */  sb         $v0, %lo(object + 0x23)($at)
    /* 449F4 800549F4 0E80013C */  lui        $at, %hi(object + 0x28)
    /* 449F8 800549F8 21082400 */  addu       $at, $at, $a0
    /* 449FC 800549FC 748C20A0 */  sb         $zero, %lo(object + 0x28)($at)
    /* 44A00 80054A00 BC520108 */  j          .L80054AF0
    /* 44A04 80054A04 00000000 */   nop
  .L80054A08:
    /* 44A08 80054A08 0E80013C */  lui        $at, %hi(object + 0x20)
    /* 44A0C 80054A0C 21082400 */  addu       $at, $at, $a0
    /* 44A10 80054A10 6C8C3380 */  lb         $s3, %lo(object + 0x20)($at)
    /* 44A14 80054A14 0E80013C */  lui        $at, %hi(object + 0x1F)
    /* 44A18 80054A18 21082400 */  addu       $at, $at, $a0
    /* 44A1C 80054A1C 6B8C3280 */  lb         $s2, %lo(object + 0x1F)($at)
    /* 44A20 80054A20 C0181300 */  sll        $v1, $s3, 3
    /* 44A24 80054A24 C0101200 */  sll        $v0, $s2, 3
    /* 44A28 80054A28 23105200 */  subu       $v0, $v0, $s2
    /* 44A2C 80054A2C C0110200 */  sll        $v0, $v0, 7
    /* 44A30 80054A30 21186200 */  addu       $v1, $v1, $v0
    /* 44A34 80054A34 0E80013C */  lui        $at, %hi(dung_map)
    /* 44A38 80054A38 21082300 */  addu       $at, $at, $v1
    /* 44A3C 80054A3C 287A2284 */  lh         $v0, %lo(dung_map)($at)
    /* 44A40 80054A40 0E80013C */  lui        $at, %hi(dung_map + 0x4)
    /* 44A44 80054A44 21082300 */  addu       $at, $at, $v1
    /* 44A48 80054A48 2C7A2380 */  lb         $v1, %lo(dung_map + 0x4)($at)
    /* 44A4C 80054A4C 0100422C */  sltiu      $v0, $v0, 0x1
    /* 44A50 80054A50 02006014 */  bnez       $v1, .L80054A5C
    /* 44A54 80054A54 21800000 */   addu      $s0, $zero, $zero
    /* 44A58 80054A58 21804000 */  addu       $s0, $v0, $zero
  .L80054A5C:
    /* 44A5C 80054A5C 21204002 */  addu       $a0, $s2, $zero
    /* 44A60 80054A60 E80A020C */  jal        GetdDead__Fii
    /* 44A64 80054A64 21286002 */   addu      $a1, $s3, $zero
    /* 44A68 80054A68 FF004230 */  andi       $v0, $v0, 0xFF
    /* 44A6C 80054A6C 02004010 */  beqz       $v0, .L80054A78
    /* 44A70 80054A70 21204002 */   addu      $a0, $s2, $zero
    /* 44A74 80054A74 21800000 */  addu       $s0, $zero, $zero
  .L80054A78:
    /* 44A78 80054A78 447F010C */  jal        IsDplayer__Fii
    /* 44A7C 80054A7C 21286002 */   addu      $a1, $s3, $zero
    /* 44A80 80054A80 FF004230 */  andi       $v0, $v0, 0xFF
    /* 44A84 80054A84 02004010 */  beqz       $v0, .L80054A90
    /* 44A88 80054A88 40101100 */   sll       $v0, $s1, 1
    /* 44A8C 80054A8C 21800000 */  addu       $s0, $zero, $zero
  .L80054A90:
    /* 44A90 80054A90 21105100 */  addu       $v0, $v0, $s1
    /* 44A94 80054A94 80100200 */  sll        $v0, $v0, 2
    /* 44A98 80054A98 23105100 */  subu       $v0, $v0, $s1
    /* 44A9C 80054A9C 80180200 */  sll        $v1, $v0, 2
    /* 44AA0 80054AA0 02000224 */  addiu      $v0, $zero, 0x2
    /* 44AA4 80054AA4 0E80013C */  lui        $at, %hi(object + 0x23)
    /* 44AA8 80054AA8 21082300 */  addu       $at, $at, $v1
    /* 44AAC 80054AAC 6F8C22A0 */  sb         $v0, %lo(object + 0x23)($at)
    /* 44AB0 80054AB0 FF000232 */  andi       $v0, $s0, 0xFF
    /* 44AB4 80054AB4 02004014 */  bnez       $v0, .L80054AC0
    /* 44AB8 80054AB8 01000224 */   addiu     $v0, $zero, 0x1
    /* 44ABC 80054ABC 02000224 */  addiu      $v0, $zero, 0x2
  .L80054AC0:
    /* 44AC0 80054AC0 0E80013C */  lui        $at, %hi(object + 0x14)
    /* 44AC4 80054AC4 21082300 */  addu       $at, $at, $v1
    /* 44AC8 80054AC8 608C22A4 */  sh         $v0, %lo(object + 0x14)($at)
    /* 44ACC 80054ACC 40101100 */  sll        $v0, $s1, 1
    /* 44AD0 80054AD0 21105100 */  addu       $v0, $v0, $s1
    /* 44AD4 80054AD4 80100200 */  sll        $v0, $v0, 2
    /* 44AD8 80054AD8 23105100 */  subu       $v0, $v0, $s1
    /* 44ADC 80054ADC 80100200 */  sll        $v0, $v0, 2
    /* 44AE0 80054AE0 01000324 */  addiu      $v1, $zero, 0x1
    /* 44AE4 80054AE4 0E80013C */  lui        $at, %hi(object + 0x28)
    /* 44AE8 80054AE8 21082200 */  addu       $at, $at, $v0
    /* 44AEC 80054AEC 748C23A0 */  sb         $v1, %lo(object + 0x28)($at)
  .L80054AF0:
    /* 44AF0 80054AF0 2000BF8F */  lw         $ra, 0x20($sp)
    /* 44AF4 80054AF4 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 44AF8 80054AF8 1800B28F */  lw         $s2, 0x18($sp)
    /* 44AFC 80054AFC 1400B18F */  lw         $s1, 0x14($sp)
    /* 44B00 80054B00 1000B08F */  lw         $s0, 0x10($sp)
    /* 44B04 80054B04 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 44B08 80054B08 0800E003 */  jr         $ra
    /* 44B0C 80054B0C 00000000 */   nop
endlabel Obj_Door__Fi
