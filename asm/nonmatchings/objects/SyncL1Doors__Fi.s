.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SyncL1Doors__Fi, 0x118

glabel SyncL1Doors__Fi
    /* 4ED20 8005ED20 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 4ED24 8005ED24 1800B2AF */  sw         $s2, 0x18($sp)
    /* 4ED28 8005ED28 21908000 */  addu       $s2, $a0, $zero
    /* 4ED2C 8005ED2C 40101200 */  sll        $v0, $s2, 1
    /* 4ED30 8005ED30 21105200 */  addu       $v0, $v0, $s2
    /* 4ED34 8005ED34 80100200 */  sll        $v0, $v0, 2
    /* 4ED38 8005ED38 23105200 */  subu       $v0, $v0, $s2
    /* 4ED3C 8005ED3C 80200200 */  sll        $a0, $v0, 2
    /* 4ED40 8005ED40 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 4ED44 8005ED44 1400B1AF */  sw         $s1, 0x14($sp)
    /* 4ED48 8005ED48 1000B0AF */  sw         $s0, 0x10($sp)
    /* 4ED4C 8005ED4C 0E80013C */  lui        $at, %hi(object + 0x14)
    /* 4ED50 8005ED50 21082400 */  addu       $at, $at, $a0
    /* 4ED54 8005ED54 608C2284 */  lh         $v0, %lo(object + 0x14)($at)
    /* 4ED58 8005ED58 00000000 */  nop
    /* 4ED5C 8005ED5C 06004014 */  bnez       $v0, .L8005ED78
    /* 4ED60 8005ED60 01000224 */   addiu     $v0, $zero, 0x1
    /* 4ED64 8005ED64 0E80013C */  lui        $at, %hi(object + 0x28)
    /* 4ED68 8005ED68 21082400 */  addu       $at, $at, $a0
    /* 4ED6C 8005ED6C 748C20A0 */  sb         $zero, %lo(object + 0x28)($at)
    /* 4ED70 8005ED70 877B0108 */  j          .L8005EE1C
    /* 4ED74 8005ED74 00000000 */   nop
  .L8005ED78:
    /* 4ED78 8005ED78 0E80013C */  lui        $at, %hi(object + 0x28)
    /* 4ED7C 8005ED7C 21082400 */  addu       $at, $at, $a0
    /* 4ED80 8005ED80 748C22A0 */  sb         $v0, %lo(object + 0x28)($at)
    /* 4ED84 8005ED84 02000224 */  addiu      $v0, $zero, 0x2
    /* 4ED88 8005ED88 0E80013C */  lui        $at, %hi(object + 0x23)
    /* 4ED8C 8005ED8C 21082400 */  addu       $at, $at, $a0
    /* 4ED90 8005ED90 6F8C22A0 */  sb         $v0, %lo(object + 0x23)($at)
    /* 4ED94 8005ED94 01000224 */  addiu      $v0, $zero, 0x1
    /* 4ED98 8005ED98 0E80013C */  lui        $at, %hi(object + 0x1F)
    /* 4ED9C 8005ED9C 21082400 */  addu       $at, $at, $a0
    /* 4EDA0 8005EDA0 6B8C3080 */  lb         $s0, %lo(object + 0x1F)($at)
    /* 4EDA4 8005EDA4 0E80013C */  lui        $at, %hi(object + 0x1E)
    /* 4EDA8 8005EDA8 21082400 */  addu       $at, $at, $a0
    /* 4EDAC 8005EDAC 6A8C2380 */  lb         $v1, %lo(object + 0x1E)($at)
    /* 4EDB0 8005EDB0 0E80013C */  lui        $at, %hi(object + 0x20)
    /* 4EDB4 8005EDB4 21082400 */  addu       $at, $at, $a0
    /* 4EDB8 8005EDB8 6C8C3180 */  lb         $s1, %lo(object + 0x20)($at)
    /* 4EDBC 8005EDBC 0F006214 */  bne        $v1, $v0, .L8005EDFC
    /* 4EDC0 8005EDC0 21282002 */   addu      $a1, $s1, $zero
    /* 4EDC4 8005EDC4 0E80013C */  lui        $at, %hi(object + 0xE)
    /* 4EDC8 8005EDC8 21082400 */  addu       $at, $at, $a0
    /* 4EDCC 8005EDCC 5A8C2384 */  lh         $v1, %lo(object + 0xE)($at)
    /* 4EDD0 8005EDD0 D6000224 */  addiu      $v0, $zero, 0xD6
    /* 4EDD4 8005EDD4 04006214 */  bne        $v1, $v0, .L8005EDE8
    /* 4EDD8 8005EDD8 21200002 */   addu      $a0, $s0, $zero
    /* 4EDDC 8005EDDC 21282002 */  addu       $a1, $s1, $zero
    /* 4EDE0 8005EDE0 7B7B0108 */  j          .L8005EDEC
    /* 4EDE4 8005EDE4 98010624 */   addiu     $a2, $zero, 0x198
  .L8005EDE8:
    /* 4EDE8 8005EDE8 89010624 */  addiu      $a2, $zero, 0x189
  .L8005EDEC:
    /* 4EDEC 8005EDEC D555010C */  jal        ObjSetMicro__Fiii
    /* 4EDF0 8005EDF0 FFFF3126 */   addiu     $s1, $s1, -0x1
    /* 4EDF4 8005EDF4 847B0108 */  j          .L8005EE10
    /* 4EDF8 8005EDF8 21204002 */   addu      $a0, $s2, $zero
  .L8005EDFC:
    /* 4EDFC 8005EDFC 21200002 */  addu       $a0, $s0, $zero
    /* 4EE00 8005EE00 D555010C */  jal        ObjSetMicro__Fiii
    /* 4EE04 8005EE04 8B010624 */   addiu     $a2, $zero, 0x18B
    /* 4EE08 8005EE08 FFFF1026 */  addiu      $s0, $s0, -0x1
    /* 4EE0C 8005EE0C 21204002 */  addu       $a0, $s2, $zero
  .L8005EE10:
    /* 4EE10 8005EE10 21280002 */  addu       $a1, $s0, $zero
    /* 4EE14 8005EE14 6F56010C */  jal        DoorSet__Fiii
    /* 4EE18 8005EE18 21302002 */   addu      $a2, $s1, $zero
  .L8005EE1C:
    /* 4EE1C 8005EE1C 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 4EE20 8005EE20 1800B28F */  lw         $s2, 0x18($sp)
    /* 4EE24 8005EE24 1400B18F */  lw         $s1, 0x14($sp)
    /* 4EE28 8005EE28 1000B08F */  lw         $s0, 0x10($sp)
    /* 4EE2C 8005EE2C 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 4EE30 8005EE30 0800E003 */  jr         $ra
    /* 4EE34 8005EE34 00000000 */   nop
endlabel SyncL1Doors__Fi
