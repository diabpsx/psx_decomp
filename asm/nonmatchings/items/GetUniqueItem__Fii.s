.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetUniqueItem__Fii, 0x360

glabel GetUniqueItem__Fii
    /* 33F54 80043F54 C0FFBD27 */  addiu      $sp, $sp, -0x40
    /* 33F58 80043F58 2800B2AF */  sw         $s2, 0x28($sp)
    /* 33F5C 80043F5C 21908000 */  addu       $s2, $a0, $zero
    /* 33F60 80043F60 3400B5AF */  sw         $s5, 0x34($sp)
    /* 33F64 80043F64 21A8A000 */  addu       $s5, $a1, $zero
    /* 33F68 80043F68 2400B1AF */  sw         $s1, 0x24($sp)
    /* 33F6C 80043F6C FF00B132 */  andi       $s1, $s5, 0xFF
    /* 33F70 80043F70 80101100 */  sll        $v0, $s1, 2
    /* 33F74 80043F74 21105100 */  addu       $v0, $v0, $s1
    /* 33F78 80043F78 80100200 */  sll        $v0, $v0, 2
    /* 33F7C 80043F7C 21105100 */  addu       $v0, $v0, $s1
    /* 33F80 80043F80 2000B0AF */  sw         $s0, 0x20($sp)
    /* 33F84 80043F84 80800200 */  sll        $s0, $v0, 2
    /* 33F88 80043F88 1180013C */  lui        $at, %hi(UniqueItemList + 0xC)
    /* 33F8C 80043F8C 21083000 */  addu       $at, $at, $s0
    /* 33F90 80043F90 70432580 */  lb         $a1, %lo(UniqueItemList + 0xC)($at)
    /* 33F94 80043F94 1180013C */  lui        $at, %hi(UniqueItemList + 0x10)
    /* 33F98 80043F98 21083000 */  addu       $at, $at, $s0
    /* 33F9C 80043F9C 7443268C */  lw         $a2, %lo(UniqueItemList + 0x10)($at)
    /* 33FA0 80043FA0 1180013C */  lui        $at, %hi(UniqueItemList + 0x14)
    /* 33FA4 80043FA4 21083000 */  addu       $at, $at, $s0
    /* 33FA8 80043FA8 7843278C */  lw         $a3, %lo(UniqueItemList + 0x14)($at)
    /* 33FAC 80043FAC 3000B4AF */  sw         $s4, 0x30($sp)
    /* 33FB0 80043FB0 01001424 */  addiu      $s4, $zero, 0x1
    /* 33FB4 80043FB4 3C00BFAF */  sw         $ra, 0x3C($sp)
    /* 33FB8 80043FB8 3800B6AF */  sw         $s6, 0x38($sp)
    /* 33FBC 80043FBC 2C00B3AF */  sw         $s3, 0x2C($sp)
    /* 33FC0 80043FC0 1000A0AF */  sw         $zero, 0x10($sp)
    /* 33FC4 80043FC4 1400A0AF */  sw         $zero, 0x14($sp)
    /* 33FC8 80043FC8 2D06010C */  jal        SaveItemPower__Fiiiiiii
    /* 33FCC 80043FCC 1800B4AF */   sw        $s4, 0x18($sp)
    /* 33FD0 80043FD0 1180013C */  lui        $at, %hi(UniqueItemList + 0x6)
    /* 33FD4 80043FD4 21083000 */  addu       $at, $at, $s0
    /* 33FD8 80043FD8 6A433380 */  lb         $s3, %lo(UniqueItemList + 0x6)($at)
    /* 33FDC 80043FDC 00000000 */  nop
    /* 33FE0 80043FE0 0200622A */  slti       $v0, $s3, 0x2
    /* 33FE4 80043FE4 0F004014 */  bnez       $v0, .L80044024
    /* 33FE8 80043FE8 21B0A002 */   addu      $s6, $s5, $zero
    /* 33FEC 80043FEC 1180013C */  lui        $at, %hi(UniqueItemList + 0x18)
    /* 33FF0 80043FF0 21083000 */  addu       $at, $at, $s0
    /* 33FF4 80043FF4 7C432580 */  lb         $a1, %lo(UniqueItemList + 0x18)($at)
    /* 33FF8 80043FF8 1180013C */  lui        $at, %hi(UniqueItemList + 0x1C)
    /* 33FFC 80043FFC 21083000 */  addu       $at, $at, $s0
    /* 34000 80044000 8043268C */  lw         $a2, %lo(UniqueItemList + 0x1C)($at)
    /* 34004 80044004 1180013C */  lui        $at, %hi(UniqueItemList + 0x20)
    /* 34008 80044008 21083000 */  addu       $at, $at, $s0
    /* 3400C 8004400C 8443278C */  lw         $a3, %lo(UniqueItemList + 0x20)($at)
    /* 34010 80044010 21204002 */  addu       $a0, $s2, $zero
    /* 34014 80044014 1000A0AF */  sw         $zero, 0x10($sp)
    /* 34018 80044018 1400A0AF */  sw         $zero, 0x14($sp)
    /* 3401C 8004401C 2D06010C */  jal        SaveItemPower__Fiiiiiii
    /* 34020 80044020 1800B4AF */   sw        $s4, 0x18($sp)
  .L80044024:
    /* 34024 80044024 0300622A */  slti       $v0, $s3, 0x3
    /* 34028 80044028 10004014 */  bnez       $v0, .L8004406C
    /* 3402C 8004402C 0400622A */   slti      $v0, $s3, 0x4
    /* 34030 80044030 1180013C */  lui        $at, %hi(UniqueItemList + 0x24)
    /* 34034 80044034 21083000 */  addu       $at, $at, $s0
    /* 34038 80044038 88432580 */  lb         $a1, %lo(UniqueItemList + 0x24)($at)
    /* 3403C 8004403C 1180013C */  lui        $at, %hi(UniqueItemList + 0x28)
    /* 34040 80044040 21083000 */  addu       $at, $at, $s0
    /* 34044 80044044 8C43268C */  lw         $a2, %lo(UniqueItemList + 0x28)($at)
    /* 34048 80044048 1180013C */  lui        $at, %hi(UniqueItemList + 0x2C)
    /* 3404C 8004404C 21083000 */  addu       $at, $at, $s0
    /* 34050 80044050 9043278C */  lw         $a3, %lo(UniqueItemList + 0x2C)($at)
    /* 34054 80044054 21204002 */  addu       $a0, $s2, $zero
    /* 34058 80044058 1000A0AF */  sw         $zero, 0x10($sp)
    /* 3405C 8004405C 1400A0AF */  sw         $zero, 0x14($sp)
    /* 34060 80044060 2D06010C */  jal        SaveItemPower__Fiiiiiii
    /* 34064 80044064 1800B4AF */   sw        $s4, 0x18($sp)
    /* 34068 80044068 0400622A */  slti       $v0, $s3, 0x4
  .L8004406C:
    /* 3406C 8004406C 10004014 */  bnez       $v0, .L800440B0
    /* 34070 80044070 0500622A */   slti      $v0, $s3, 0x5
    /* 34074 80044074 1180013C */  lui        $at, %hi(UniqueItemList + 0x30)
    /* 34078 80044078 21083000 */  addu       $at, $at, $s0
    /* 3407C 8004407C 94432580 */  lb         $a1, %lo(UniqueItemList + 0x30)($at)
    /* 34080 80044080 1180013C */  lui        $at, %hi(UniqueItemList + 0x34)
    /* 34084 80044084 21083000 */  addu       $at, $at, $s0
    /* 34088 80044088 9843268C */  lw         $a2, %lo(UniqueItemList + 0x34)($at)
    /* 3408C 8004408C 1180013C */  lui        $at, %hi(UniqueItemList + 0x38)
    /* 34090 80044090 21083000 */  addu       $at, $at, $s0
    /* 34094 80044094 9C43278C */  lw         $a3, %lo(UniqueItemList + 0x38)($at)
    /* 34098 80044098 21204002 */  addu       $a0, $s2, $zero
    /* 3409C 8004409C 1000A0AF */  sw         $zero, 0x10($sp)
    /* 340A0 800440A0 1400A0AF */  sw         $zero, 0x14($sp)
    /* 340A4 800440A4 2D06010C */  jal        SaveItemPower__Fiiiiiii
    /* 340A8 800440A8 1800B4AF */   sw        $s4, 0x18($sp)
    /* 340AC 800440AC 0500622A */  slti       $v0, $s3, 0x5
  .L800440B0:
    /* 340B0 800440B0 10004014 */  bnez       $v0, .L800440F4
    /* 340B4 800440B4 0600622A */   slti      $v0, $s3, 0x6
    /* 340B8 800440B8 1180013C */  lui        $at, %hi(UniqueItemList + 0x3C)
    /* 340BC 800440BC 21083000 */  addu       $at, $at, $s0
    /* 340C0 800440C0 A0432580 */  lb         $a1, %lo(UniqueItemList + 0x3C)($at)
    /* 340C4 800440C4 1180013C */  lui        $at, %hi(UniqueItemList + 0x40)
    /* 340C8 800440C8 21083000 */  addu       $at, $at, $s0
    /* 340CC 800440CC A443268C */  lw         $a2, %lo(UniqueItemList + 0x40)($at)
    /* 340D0 800440D0 1180013C */  lui        $at, %hi(UniqueItemList + 0x44)
    /* 340D4 800440D4 21083000 */  addu       $at, $at, $s0
    /* 340D8 800440D8 A843278C */  lw         $a3, %lo(UniqueItemList + 0x44)($at)
    /* 340DC 800440DC 21204002 */  addu       $a0, $s2, $zero
    /* 340E0 800440E0 1000A0AF */  sw         $zero, 0x10($sp)
    /* 340E4 800440E4 1400A0AF */  sw         $zero, 0x14($sp)
    /* 340E8 800440E8 2D06010C */  jal        SaveItemPower__Fiiiiiii
    /* 340EC 800440EC 1800B4AF */   sw        $s4, 0x18($sp)
    /* 340F0 800440F0 0600622A */  slti       $v0, $s3, 0x6
  .L800440F4:
    /* 340F4 800440F4 10004014 */  bnez       $v0, .L80044138
    /* 340F8 800440F8 C0101200 */   sll       $v0, $s2, 3
    /* 340FC 800440FC 1180013C */  lui        $at, %hi(UniqueItemList + 0x48)
    /* 34100 80044100 21083000 */  addu       $at, $at, $s0
    /* 34104 80044104 AC432580 */  lb         $a1, %lo(UniqueItemList + 0x48)($at)
    /* 34108 80044108 1180013C */  lui        $at, %hi(UniqueItemList + 0x4C)
    /* 3410C 8004410C 21083000 */  addu       $at, $at, $s0
    /* 34110 80044110 B043268C */  lw         $a2, %lo(UniqueItemList + 0x4C)($at)
    /* 34114 80044114 1180013C */  lui        $at, %hi(UniqueItemList + 0x50)
    /* 34118 80044118 21083000 */  addu       $at, $at, $s0
    /* 3411C 8004411C B443278C */  lw         $a3, %lo(UniqueItemList + 0x50)($at)
    /* 34120 80044120 21204002 */  addu       $a0, $s2, $zero
    /* 34124 80044124 1000A0AF */  sw         $zero, 0x10($sp)
    /* 34128 80044128 1400A0AF */  sw         $zero, 0x14($sp)
    /* 3412C 8004412C 2D06010C */  jal        SaveItemPower__Fiiiiiii
    /* 34130 80044130 1800B4AF */   sw        $s4, 0x18($sp)
    /* 34134 80044134 C0101200 */  sll        $v0, $s2, 3
  .L80044138:
    /* 34138 80044138 23105200 */  subu       $v0, $v0, $s2
    /* 3413C 8004413C 80100200 */  sll        $v0, $v0, 2
    /* 34140 80044140 23105200 */  subu       $v0, $v0, $s2
    /* 34144 80044144 1180013C */  lui        $at, %hi(UniqueItemList)
    /* 34148 80044148 21083000 */  addu       $at, $at, $s0
    /* 3414C 8004414C 6443238C */  lw         $v1, %lo(UniqueItemList)($at)
    /* 34150 80044150 1180013C */  lui        $at, %hi(UniqueItemList + 0x8)
    /* 34154 80044154 21083000 */  addu       $at, $at, $s0
    /* 34158 80044158 6C43248C */  lw         $a0, %lo(UniqueItemList + 0x8)($at)
    /* 3415C 8004415C 80800200 */  sll        $s0, $v0, 2
    /* 34160 80044160 00FF0224 */  addiu      $v0, $zero, -0x100
    /* 34164 80044164 2410A202 */  and        $v0, $s5, $v0
    /* 34168 80044168 0D80013C */  lui        $at, %hi(item + 0x28)
    /* 3416C 8004416C 21083000 */  addu       $at, $at, $s0
    /* 34170 80044170 7C1D23A4 */  sh         $v1, %lo(item + 0x28)($at)
    /* 34174 80044174 0D80013C */  lui        $at, %hi(item + 0x18)
    /* 34178 80044178 21083000 */  addu       $at, $at, $s0
    /* 3417C 8004417C 6C1D24AC */  sw         $a0, %lo(item + 0x18)($at)
    /* 34180 80044180 0F004010 */  beqz       $v0, .L800441C0
    /* 34184 80044184 00000000 */   nop
    /* 34188 80044188 0D80013C */  lui        $at, %hi(UniqueItemFlag)
    /* 3418C 8004418C 21083100 */  addu       $at, $at, $s1
    /* 34190 80044190 54542290 */  lbu        $v0, %lo(UniqueItemFlag)($at)
    /* 34194 80044194 00000000 */  nop
    /* 34198 80044198 04004014 */  bnez       $v0, .L800441AC
    /* 3419C 8004419C 01004224 */   addiu     $v0, $v0, 0x1
    /* 341A0 800441A0 0D80013C */  lui        $at, %hi(UniqueItemFlag)
    /* 341A4 800441A4 21083100 */  addu       $at, $at, $s1
    /* 341A8 800441A8 545422A0 */  sb         $v0, %lo(UniqueItemFlag)($at)
  .L800441AC:
    /* 341AC 800441AC 0D80013C */  lui        $at, %hi(item + 0x10)
    /* 341B0 800441B0 21083000 */  addu       $at, $at, $s0
    /* 341B4 800441B4 641D36AC */  sw         $s6, %lo(item + 0x10)($at)
    /* 341B8 800441B8 8B100108 */  j          .L8004422C
    /* 341BC 800441BC C0101200 */   sll       $v0, $s2, 3
  .L800441C0:
    /* 341C0 800441C0 0D80013C */  lui        $at, %hi(UniqueItemFlag)
    /* 341C4 800441C4 21083100 */  addu       $at, $at, $s1
    /* 341C8 800441C8 54542290 */  lbu        $v0, %lo(UniqueItemFlag)($at)
    /* 341CC 800441CC 00000000 */  nop
    /* 341D0 800441D0 01004224 */  addiu      $v0, $v0, 0x1
    /* 341D4 800441D4 0D80013C */  lui        $at, %hi(UniqueItemFlag)
    /* 341D8 800441D8 21083100 */  addu       $at, $at, $s1
    /* 341DC 800441DC 545422A0 */  sb         $v0, %lo(UniqueItemFlag)($at)
    /* 341E0 800441E0 B7F6000C */  jal        GetRndSeed__Fv
    /* 341E4 800441E4 00000000 */   nop
    /* 341E8 800441E8 FF00033C */  lui        $v1, (0xFFFF00 >> 16)
    /* 341EC 800441EC 00FF6334 */  ori        $v1, $v1, (0xFFFF00 & 0xFFFF)
    /* 341F0 800441F0 24104300 */  and        $v0, $v0, $v1
    /* 341F4 800441F4 0D80013C */  lui        $at, %hi(item + 0x10)
    /* 341F8 800441F8 21083000 */  addu       $at, $at, $s0
    /* 341FC 800441FC 641D22AC */  sw         $v0, %lo(item + 0x10)($at)
    /* 34200 80044200 0D80013C */  lui        $at, %hi(UniqueItemFlag)
    /* 34204 80044204 21083100 */  addu       $at, $at, $s1
    /* 34208 80044208 54542390 */  lbu        $v1, %lo(UniqueItemFlag)($at)
    /* 3420C 8004420C 00000000 */  nop
    /* 34210 80044210 001E0300 */  sll        $v1, $v1, 24
    /* 34214 80044214 25182302 */  or         $v1, $s1, $v1
    /* 34218 80044218 25104300 */  or         $v0, $v0, $v1
    /* 3421C 8004421C 0D80013C */  lui        $at, %hi(item + 0x10)
    /* 34220 80044220 21083000 */  addu       $at, $at, $s0
    /* 34224 80044224 641D22AC */  sw         $v0, %lo(item + 0x10)($at)
    /* 34228 80044228 C0101200 */  sll        $v0, $s2, 3
  .L8004422C:
    /* 3422C 8004422C 23105200 */  subu       $v0, $v0, $s2
    /* 34230 80044230 80100200 */  sll        $v0, $v0, 2
    /* 34234 80044234 23105200 */  subu       $v0, $v0, $s2
    /* 34238 80044238 80100200 */  sll        $v0, $v0, 2
    /* 3423C 8004423C 02000324 */  addiu      $v1, $zero, 0x2
    /* 34240 80044240 0D80013C */  lui        $at, %hi(item + 0x51)
    /* 34244 80044244 21082200 */  addu       $at, $at, $v0
    /* 34248 80044248 A51D23A0 */  sb         $v1, %lo(item + 0x51)($at)
    /* 3424C 8004424C 0D80013C */  lui        $at, %hi(item + 0x24)
    /* 34250 80044250 21082200 */  addu       $at, $at, $v0
    /* 34254 80044254 781D2394 */  lhu        $v1, %lo(item + 0x24)($at)
    /* 34258 80044258 0D80013C */  lui        $at, %hi(item + 0x34)
    /* 3425C 8004425C 21082200 */  addu       $at, $at, $v0
    /* 34260 80044260 881D31A0 */  sb         $s1, %lo(item + 0x34)($at)
    /* 34264 80044264 1280043C */  lui        $a0, %hi(FePlayerNo)
    /* 34268 80044268 78B3848C */  lw         $a0, %lo(FePlayerNo)($a0)
    /* 3426C 8004426C 00026334 */  ori        $v1, $v1, 0x200
    /* 34270 80044270 0D80013C */  lui        $at, %hi(item + 0x24)
    /* 34274 80044274 21082200 */  addu       $at, $at, $v0
    /* 34278 80044278 781D23A4 */  sh         $v1, %lo(item + 0x24)($at)
    /* 3427C 8004427C 0D80013C */  lui        $at, %hi(item + 0x65)
    /* 34280 80044280 21082200 */  addu       $at, $at, $v0
    /* 34284 80044284 B91D24A0 */  sb         $a0, %lo(item + 0x65)($at)
    /* 34288 80044288 3C00BF8F */  lw         $ra, 0x3C($sp)
    /* 3428C 8004428C 3800B68F */  lw         $s6, 0x38($sp)
    /* 34290 80044290 3400B58F */  lw         $s5, 0x34($sp)
    /* 34294 80044294 3000B48F */  lw         $s4, 0x30($sp)
    /* 34298 80044298 2C00B38F */  lw         $s3, 0x2C($sp)
    /* 3429C 8004429C 2800B28F */  lw         $s2, 0x28($sp)
    /* 342A0 800442A0 2400B18F */  lw         $s1, 0x24($sp)
    /* 342A4 800442A4 2000B08F */  lw         $s0, 0x20($sp)
    /* 342A8 800442A8 4000BD27 */  addiu      $sp, $sp, 0x40
    /* 342AC 800442AC 0800E003 */  jr         $ra
    /* 342B0 800442B0 00000000 */   nop
endlabel GetUniqueItem__Fii
