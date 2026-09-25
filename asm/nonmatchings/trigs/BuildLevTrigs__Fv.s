.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching BuildLevTrigs__Fv, 0x194

glabel BuildLevTrigs__Fv
    /* 654E8 800754E8 1280033C */  lui        $v1, %hi(leveltype)
    /* 654EC 800754EC 0DC16390 */  lbu        $v1, %lo(leveltype)($v1)
    /* 654F0 800754F0 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 654F4 800754F4 1000BFAF */  sw         $ra, 0x10($sp)
    /* 654F8 800754F8 C01380AF */  sw         $zero, %gp_rel(D_8011BB40)($gp)
    /* 654FC 800754FC C41380AF */  sw         $zero, %gp_rel(D_8011BB44)($gp)
    /* 65500 80075500 0500622C */  sltiu      $v0, $v1, 0x5
    /* 65504 80075504 59004010 */  beqz       $v0, .L8007566C
    /* 65508 80075508 80100300 */   sll       $v0, $v1, 2
    /* 6550C 8007550C 1280013C */  lui        $at, %hi(jtbl_80118974)
    /* 65510 80075510 21082200 */  addu       $at, $at, $v0
    /* 65514 80075514 7489228C */  lw         $v0, %lo(jtbl_80118974)($at)
    /* 65518 80075518 00000000 */  nop
    /* 6551C 8007551C 08004000 */  jr         $v0
    /* 65520 80075520 00000000 */   nop
  jlabel .L80075524
    /* 65524 80075524 0E80043C */  lui        $a0, %hi(TownDownList)
    /* 65528 80075528 F8318424 */  addiu      $a0, $a0, %lo(TownDownList)
    /* 6552C 8007552C 3ED4010C */  jal        ScanMap__FPsi
    /* 65530 80075530 21280000 */   addu      $a1, $zero, $zero
    /* 65534 80075534 0E80043C */  lui        $a0, %hi(TownWarp1List)
    /* 65538 80075538 10328424 */  addiu      $a0, $a0, %lo(TownWarp1List)
    /* 6553C 8007553C 3ED4010C */  jal        ScanMap__FPsi
    /* 65540 80075540 01000524 */   addiu     $a1, $zero, 0x1
    /* 65544 80075544 0E80043C */  lui        $a0, %hi(TownWarp2List)
    /* 65548 80075548 2C328424 */  addiu      $a0, $a0, %lo(TownWarp2List)
    /* 6554C 8007554C 3ED4010C */  jal        ScanMap__FPsi
    /* 65550 80075550 02000524 */   addiu     $a1, $zero, 0x2
    /* 65554 80075554 0E80043C */  lui        $a0, %hi(TownWarp3List)
    /* 65558 80075558 5C328424 */  addiu      $a0, $a0, %lo(TownWarp3List)
    /* 6555C 8007555C 3ED4010C */  jal        ScanMap__FPsi
    /* 65560 80075560 03000524 */   addiu     $a1, $zero, 0x3
    /* 65564 80075564 9BD50108 */  j          .L8007566C
    /* 65568 80075568 00000000 */   nop
  jlabel .L8007556C
    /* 6556C 8007556C 0E80043C */  lui        $a0, %hi(L1UpList)
    /* 65570 80075570 80328424 */  addiu      $a0, $a0, %lo(L1UpList)
    /* 65574 80075574 3ED4010C */  jal        ScanMap__FPsi
    /* 65578 80075578 21280000 */   addu      $a1, $zero, $zero
    /* 6557C 8007557C 0E80043C */  lui        $a0, %hi(L1DownList)
    /* 65580 80075580 98328424 */  addiu      $a0, $a0, %lo(L1DownList)
    /* 65584 80075584 3ED4010C */  jal        ScanMap__FPsi
    /* 65588 80075588 01000524 */   addiu     $a1, $zero, 0x1
    /* 6558C 8007558C 0E80043C */  lui        $a0, %hi(L1BlockList)
    /* 65590 80075590 58338424 */  addiu      $a0, $a0, %lo(L1BlockList)
    /* 65594 80075594 99D50108 */  j          .L80075664
    /* 65598 80075598 00000000 */   nop
  jlabel .L8007559C
    /* 6559C 8007559C 1280043C */  lui        $a0, %hi(L2UpList)
    /* 655A0 800755A0 1CBB8424 */  addiu      $a0, $a0, %lo(L2UpList)
    /* 655A4 800755A4 3ED4010C */  jal        ScanMap__FPsi
    /* 655A8 800755A8 21280000 */   addu      $a1, $zero, $zero
    /* 655AC 800755AC 0E80043C */  lui        $a0, %hi(L2DownList)
    /* 655B0 800755B0 AC328424 */  addiu      $a0, $a0, %lo(L2DownList)
    /* 655B4 800755B4 3ED4010C */  jal        ScanMap__FPsi
    /* 655B8 800755B8 01000524 */   addiu     $a1, $zero, 0x1
    /* 655BC 800755BC 1280043C */  lui        $a0, %hi(L2TWarpUpList)
    /* 655C0 800755C0 24BB8424 */  addiu      $a0, $a0, %lo(L2TWarpUpList)
    /* 655C4 800755C4 3ED4010C */  jal        ScanMap__FPsi
    /* 655C8 800755C8 02000524 */   addiu     $a1, $zero, 0x2
    /* 655CC 800755CC 0E80043C */  lui        $a0, %hi(L2BlockList)
    /* 655D0 800755D0 AC338424 */  addiu      $a0, $a0, %lo(L2BlockList)
    /* 655D4 800755D4 99D50108 */  j          .L80075664
    /* 655D8 800755D8 00000000 */   nop
  jlabel .L800755DC
    /* 655DC 800755DC 0E80043C */  lui        $a0, %hi(L3UpList)
    /* 655E0 800755E0 B8328424 */  addiu      $a0, $a0, %lo(L3UpList)
    /* 655E4 800755E4 3ED4010C */  jal        ScanMap__FPsi
    /* 655E8 800755E8 21280000 */   addu      $a1, $zero, $zero
    /* 655EC 800755EC 0E80043C */  lui        $a0, %hi(L3DownList)
    /* 655F0 800755F0 D8328424 */  addiu      $a0, $a0, %lo(L3DownList)
    /* 655F4 800755F4 3ED4010C */  jal        ScanMap__FPsi
    /* 655F8 800755F8 01000524 */   addiu     $a1, $zero, 0x1
    /* 655FC 800755FC 0E80043C */  lui        $a0, %hi(L3TWarpUpList)
    /* 65600 80075600 EC328424 */  addiu      $a0, $a0, %lo(L3TWarpUpList)
    /* 65604 80075604 3ED4010C */  jal        ScanMap__FPsi
    /* 65608 80075608 02000524 */   addiu     $a1, $zero, 0x2
    /* 6560C 8007560C 0E80043C */  lui        $a0, %hi(L3BlockList)
    /* 65610 80075610 C0338424 */  addiu      $a0, $a0, %lo(L3BlockList)
    /* 65614 80075614 99D50108 */  j          .L80075664
    /* 65618 80075618 00000000 */   nop
  jlabel .L8007561C
    /* 6561C 8007561C 1280043C */  lui        $a0, %hi(L4UpList)
    /* 65620 80075620 2CBB8424 */  addiu      $a0, $a0, %lo(L4UpList)
    /* 65624 80075624 3ED4010C */  jal        ScanMap__FPsi
    /* 65628 80075628 21280000 */   addu      $a1, $zero, $zero
    /* 6562C 8007562C 0E80043C */  lui        $a0, %hi(L4DownList)
    /* 65630 80075630 08338424 */  addiu      $a0, $a0, %lo(L4DownList)
    /* 65634 80075634 3ED4010C */  jal        ScanMap__FPsi
    /* 65638 80075638 01000524 */   addiu     $a1, $zero, 0x1
    /* 6563C 8007563C 1280043C */  lui        $a0, %hi(L4TWarpUpList)
    /* 65640 80075640 34BB8424 */  addiu      $a0, $a0, %lo(L4TWarpUpList)
    /* 65644 80075644 3ED4010C */  jal        ScanMap__FPsi
    /* 65648 80075648 02000524 */   addiu     $a1, $zero, 0x2
    /* 6564C 8007564C 0E80043C */  lui        $a0, %hi(L4PentaList)
    /* 65650 80075650 14338424 */  addiu      $a0, $a0, %lo(L4PentaList)
    /* 65654 80075654 3ED4010C */  jal        ScanMap__FPsi
    /* 65658 80075658 03000524 */   addiu     $a1, $zero, 0x3
    /* 6565C 8007565C 1280043C */  lui        $a0, %hi(L4BlockList)
    /* 65660 80075660 3CBB8424 */  addiu      $a0, $a0, %lo(L4BlockList)
  .L80075664:
    /* 65664 80075664 F8D4010C */  jal        ScanBlocks__FPs
    /* 65668 80075668 00000000 */   nop
  .L8007566C:
    /* 6566C 8007566C 1000BF8F */  lw         $ra, 0x10($sp)
    /* 65670 80075670 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 65674 80075674 0800E003 */  jr         $ra
    /* 65678 80075678 00000000 */   nop
endlabel BuildLevTrigs__Fv
