.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DrawUniqueInfo__Fv, 0x170

glabel DrawUniqueInfo__Fv
    /* 39028 80049028 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 3902C 8004902C 1380053C */  lui        $a1, %hi(D_8012EC8C)
    /* 39030 80049030 8CECA524 */  addiu      $a1, $a1, %lo(D_8012EC8C)
    /* 39034 80049034 2000BFAF */  sw         $ra, 0x20($sp)
    /* 39038 80049038 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 3903C 8004903C 1800B2AF */  sw         $s2, 0x18($sp)
    /* 39040 80049040 1400B1AF */  sw         $s1, 0x14($sp)
    /* 39044 80049044 1000B0AF */  sw         $s0, 0x10($sp)
    /* 39048 80049048 0000A380 */  lb         $v1, 0x0($a1)
    /* 3904C 8004904C CCFFB324 */  addiu      $s3, $a1, -0x34
    /* 39050 80049050 80100300 */  sll        $v0, $v1, 2
    /* 39054 80049054 21104300 */  addu       $v0, $v0, $v1
    /* 39058 80049058 80100200 */  sll        $v0, $v0, 2
    /* 3905C 8004905C 21104300 */  addu       $v0, $v0, $v1
    /* 39060 80049060 80800200 */  sll        $s0, $v0, 2
    /* 39064 80049064 1180013C */  lui        $at, %hi(UniqueItemList + 0xC)
    /* 39068 80049068 21083000 */  addu       $at, $at, $s0
    /* 3906C 8004906C 70432480 */  lb         $a0, %lo(UniqueItemList + 0xC)($at)
    /* 39070 80049070 9618010C */  jal        PrintItemPower__FcPC10ItemStruct
    /* 39074 80049074 21286002 */   addu      $a1, $s3, $zero
    /* 39078 80049078 0D80123C */  lui        $s2, %hi(tempstr)
    /* 3907C 8004907C 10EA5226 */  addiu      $s2, $s2, %lo(tempstr)
    /* 39080 80049080 21204002 */  addu       $a0, $s2, $zero
    /* 39084 80049084 98C7000C */  jal        AddPanelString__FPCci
    /* 39088 80049088 01000524 */   addiu     $a1, $zero, 0x1
    /* 3908C 8004908C 1180013C */  lui        $at, %hi(UniqueItemList + 0x6)
    /* 39090 80049090 21083000 */  addu       $at, $at, $s0
    /* 39094 80049094 6A433180 */  lb         $s1, %lo(UniqueItemList + 0x6)($at)
    /* 39098 80049098 00000000 */  nop
    /* 3909C 8004909C 0200222A */  slti       $v0, $s1, 0x2
    /* 390A0 800490A0 0A004014 */  bnez       $v0, .L800490CC
    /* 390A4 800490A4 0300222A */   slti      $v0, $s1, 0x3
    /* 390A8 800490A8 1180013C */  lui        $at, %hi(UniqueItemList + 0x18)
    /* 390AC 800490AC 21083000 */  addu       $at, $at, $s0
    /* 390B0 800490B0 7C432480 */  lb         $a0, %lo(UniqueItemList + 0x18)($at)
    /* 390B4 800490B4 9618010C */  jal        PrintItemPower__FcPC10ItemStruct
    /* 390B8 800490B8 21286002 */   addu      $a1, $s3, $zero
    /* 390BC 800490BC 21204002 */  addu       $a0, $s2, $zero
    /* 390C0 800490C0 98C7000C */  jal        AddPanelString__FPCci
    /* 390C4 800490C4 01000524 */   addiu     $a1, $zero, 0x1
    /* 390C8 800490C8 0300222A */  slti       $v0, $s1, 0x3
  .L800490CC:
    /* 390CC 800490CC 0A004014 */  bnez       $v0, .L800490F8
    /* 390D0 800490D0 0400222A */   slti      $v0, $s1, 0x4
    /* 390D4 800490D4 1180013C */  lui        $at, %hi(UniqueItemList + 0x24)
    /* 390D8 800490D8 21083000 */  addu       $at, $at, $s0
    /* 390DC 800490DC 88432480 */  lb         $a0, %lo(UniqueItemList + 0x24)($at)
    /* 390E0 800490E0 9618010C */  jal        PrintItemPower__FcPC10ItemStruct
    /* 390E4 800490E4 21286002 */   addu      $a1, $s3, $zero
    /* 390E8 800490E8 21204002 */  addu       $a0, $s2, $zero
    /* 390EC 800490EC 98C7000C */  jal        AddPanelString__FPCci
    /* 390F0 800490F0 01000524 */   addiu     $a1, $zero, 0x1
    /* 390F4 800490F4 0400222A */  slti       $v0, $s1, 0x4
  .L800490F8:
    /* 390F8 800490F8 0A004014 */  bnez       $v0, .L80049124
    /* 390FC 800490FC 0500222A */   slti      $v0, $s1, 0x5
    /* 39100 80049100 1180013C */  lui        $at, %hi(UniqueItemList + 0x30)
    /* 39104 80049104 21083000 */  addu       $at, $at, $s0
    /* 39108 80049108 94432480 */  lb         $a0, %lo(UniqueItemList + 0x30)($at)
    /* 3910C 8004910C 9618010C */  jal        PrintItemPower__FcPC10ItemStruct
    /* 39110 80049110 21286002 */   addu      $a1, $s3, $zero
    /* 39114 80049114 21204002 */  addu       $a0, $s2, $zero
    /* 39118 80049118 98C7000C */  jal        AddPanelString__FPCci
    /* 3911C 8004911C 01000524 */   addiu     $a1, $zero, 0x1
    /* 39120 80049120 0500222A */  slti       $v0, $s1, 0x5
  .L80049124:
    /* 39124 80049124 0A004014 */  bnez       $v0, .L80049150
    /* 39128 80049128 0600222A */   slti      $v0, $s1, 0x6
    /* 3912C 8004912C 1180013C */  lui        $at, %hi(UniqueItemList + 0x3C)
    /* 39130 80049130 21083000 */  addu       $at, $at, $s0
    /* 39134 80049134 A0432480 */  lb         $a0, %lo(UniqueItemList + 0x3C)($at)
    /* 39138 80049138 9618010C */  jal        PrintItemPower__FcPC10ItemStruct
    /* 3913C 8004913C 21286002 */   addu      $a1, $s3, $zero
    /* 39140 80049140 21204002 */  addu       $a0, $s2, $zero
    /* 39144 80049144 98C7000C */  jal        AddPanelString__FPCci
    /* 39148 80049148 01000524 */   addiu     $a1, $zero, 0x1
    /* 3914C 8004914C 0600222A */  slti       $v0, $s1, 0x6
  .L80049150:
    /* 39150 80049150 09004014 */  bnez       $v0, .L80049178
    /* 39154 80049154 00000000 */   nop
    /* 39158 80049158 1180013C */  lui        $at, %hi(UniqueItemList + 0x48)
    /* 3915C 8004915C 21083000 */  addu       $at, $at, $s0
    /* 39160 80049160 AC432480 */  lb         $a0, %lo(UniqueItemList + 0x48)($at)
    /* 39164 80049164 9618010C */  jal        PrintItemPower__FcPC10ItemStruct
    /* 39168 80049168 21286002 */   addu      $a1, $s3, $zero
    /* 3916C 8004916C 21204002 */  addu       $a0, $s2, $zero
    /* 39170 80049170 98C7000C */  jal        AddPanelString__FPCci
    /* 39174 80049174 01000524 */   addiu     $a1, $zero, 0x1
  .L80049178:
    /* 39178 80049178 2000BF8F */  lw         $ra, 0x20($sp)
    /* 3917C 8004917C 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 39180 80049180 1800B28F */  lw         $s2, 0x18($sp)
    /* 39184 80049184 1400B18F */  lw         $s1, 0x14($sp)
    /* 39188 80049188 1000B08F */  lw         $s0, 0x10($sp)
    /* 3918C 8004918C 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 39190 80049190 0800E003 */  jr         $ra
    /* 39194 80049194 00000000 */   nop
endlabel DrawUniqueInfo__Fv
