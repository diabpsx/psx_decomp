.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DoorSet__Fiii, 0x264

glabel DoorSet__Fiii
    /* 459BC 800559BC D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 459C0 800559C0 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 459C4 800559C4 21988000 */  addu       $s3, $a0, $zero
    /* 459C8 800559C8 1000B0AF */  sw         $s0, 0x10($sp)
    /* 459CC 800559CC 2180A000 */  addu       $s0, $a1, $zero
    /* 459D0 800559D0 1400B1AF */  sw         $s1, 0x14($sp)
    /* 459D4 800559D4 2188C000 */  addu       $s1, $a2, $zero
    /* 459D8 800559D8 21200002 */  addu       $a0, $s0, $zero
    /* 459DC 800559DC 21282002 */  addu       $a1, $s1, $zero
    /* 459E0 800559E0 2000BFAF */  sw         $ra, 0x20($sp)
    /* 459E4 800559E4 80D4010C */  jal        FindBlock__Fii
    /* 459E8 800559E8 1800B2AF */   sw        $s2, 0x18($sp)
    /* 459EC 800559EC 21904000 */  addu       $s2, $v0, $zero
    /* 459F0 800559F0 2B000224 */  addiu      $v0, $zero, 0x2B
    /* 459F4 800559F4 06004216 */  bne        $s2, $v0, .L80055A10
    /* 459F8 800559F8 2D000224 */   addiu     $v0, $zero, 0x2D
    /* 459FC 800559FC 21200002 */  addu       $a0, $s0, $zero
    /* 45A00 80055A00 21282002 */  addu       $a1, $s1, $zero
    /* 45A04 80055A04 D555010C */  jal        ObjSetMicro__Fiii
    /* 45A08 80055A08 88010624 */   addiu     $a2, $zero, 0x188
    /* 45A0C 80055A0C 2D000224 */  addiu      $v0, $zero, 0x2D
  .L80055A10:
    /* 45A10 80055A10 06004216 */  bne        $s2, $v0, .L80055A2C
    /* 45A14 80055A14 32000224 */   addiu     $v0, $zero, 0x32
    /* 45A18 80055A18 21200002 */  addu       $a0, $s0, $zero
    /* 45A1C 80055A1C 21282002 */  addu       $a1, $s1, $zero
    /* 45A20 80055A20 D555010C */  jal        ObjSetMicro__Fiii
    /* 45A24 80055A24 8A010624 */   addiu     $a2, $zero, 0x18A
    /* 45A28 80055A28 32000224 */  addiu      $v0, $zero, 0x32
  .L80055A2C:
    /* 45A2C 80055A2C 1B004216 */  bne        $s2, $v0, .L80055A9C
    /* 45A30 80055A30 36000224 */   addiu     $v0, $zero, 0x36
    /* 45A34 80055A34 40101300 */  sll        $v0, $s3, 1
    /* 45A38 80055A38 21105300 */  addu       $v0, $v0, $s3
    /* 45A3C 80055A3C 80100200 */  sll        $v0, $v0, 2
    /* 45A40 80055A40 23105300 */  subu       $v0, $v0, $s3
    /* 45A44 80055A44 80980200 */  sll        $s3, $v0, 2
    /* 45A48 80055A48 0E80013C */  lui        $at, %hi(object + 0x1E)
    /* 45A4C 80055A4C 21083300 */  addu       $at, $at, $s3
    /* 45A50 80055A50 6A8C2380 */  lb         $v1, %lo(object + 0x1E)($at)
    /* 45A54 80055A54 01000224 */  addiu      $v0, $zero, 0x1
    /* 45A58 80055A58 09006214 */  bne        $v1, $v0, .L80055A80
    /* 45A5C 80055A5C 02000224 */   addiu     $v0, $zero, 0x2
    /* 45A60 80055A60 21200002 */  addu       $a0, $s0, $zero
    /* 45A64 80055A64 21282002 */  addu       $a1, $s1, $zero
    /* 45A68 80055A68 D555010C */  jal        ObjSetMicro__Fiii
    /* 45A6C 80055A6C 9B010624 */   addiu     $a2, $zero, 0x19B
    /* 45A70 80055A70 0E80013C */  lui        $at, %hi(object + 0x1E)
    /* 45A74 80055A74 21083300 */  addu       $at, $at, $s3
    /* 45A78 80055A78 6A8C2380 */  lb         $v1, %lo(object + 0x1E)($at)
    /* 45A7C 80055A7C 02000224 */  addiu      $v0, $zero, 0x2
  .L80055A80:
    /* 45A80 80055A80 06006214 */  bne        $v1, $v0, .L80055A9C
    /* 45A84 80055A84 36000224 */   addiu     $v0, $zero, 0x36
    /* 45A88 80055A88 21200002 */  addu       $a0, $s0, $zero
    /* 45A8C 80055A8C 21282002 */  addu       $a1, $s1, $zero
    /* 45A90 80055A90 D555010C */  jal        ObjSetMicro__Fiii
    /* 45A94 80055A94 9C010624 */   addiu     $a2, $zero, 0x19C
    /* 45A98 80055A98 36000224 */  addiu      $v0, $zero, 0x36
  .L80055A9C:
    /* 45A9C 80055A9C 06004216 */  bne        $s2, $v0, .L80055AB8
    /* 45AA0 80055AA0 37000224 */   addiu     $v0, $zero, 0x37
    /* 45AA4 80055AA4 21200002 */  addu       $a0, $s0, $zero
    /* 45AA8 80055AA8 21282002 */  addu       $a1, $s1, $zero
    /* 45AAC 80055AAC D555010C */  jal        ObjSetMicro__Fiii
    /* 45AB0 80055AB0 8D010624 */   addiu     $a2, $zero, 0x18D
    /* 45AB4 80055AB4 37000224 */  addiu      $v0, $zero, 0x37
  .L80055AB8:
    /* 45AB8 80055AB8 06004216 */  bne        $s2, $v0, .L80055AD4
    /* 45ABC 80055ABC 3D000224 */   addiu     $v0, $zero, 0x3D
    /* 45AC0 80055AC0 21200002 */  addu       $a0, $s0, $zero
    /* 45AC4 80055AC4 21282002 */  addu       $a1, $s1, $zero
    /* 45AC8 80055AC8 D555010C */  jal        ObjSetMicro__Fiii
    /* 45ACC 80055ACC 8E010624 */   addiu     $a2, $zero, 0x18E
    /* 45AD0 80055AD0 3D000224 */  addiu      $v0, $zero, 0x3D
  .L80055AD4:
    /* 45AD4 80055AD4 06004216 */  bne        $s2, $v0, .L80055AF0
    /* 45AD8 80055AD8 43000224 */   addiu     $v0, $zero, 0x43
    /* 45ADC 80055ADC 21200002 */  addu       $a0, $s0, $zero
    /* 45AE0 80055AE0 21282002 */  addu       $a1, $s1, $zero
    /* 45AE4 80055AE4 D555010C */  jal        ObjSetMicro__Fiii
    /* 45AE8 80055AE8 8F010624 */   addiu     $a2, $zero, 0x18F
    /* 45AEC 80055AEC 43000224 */  addiu      $v0, $zero, 0x43
  .L80055AF0:
    /* 45AF0 80055AF0 06004216 */  bne        $s2, $v0, .L80055B0C
    /* 45AF4 80055AF4 44000224 */   addiu     $v0, $zero, 0x44
    /* 45AF8 80055AF8 21200002 */  addu       $a0, $s0, $zero
    /* 45AFC 80055AFC 21282002 */  addu       $a1, $s1, $zero
    /* 45B00 80055B00 D555010C */  jal        ObjSetMicro__Fiii
    /* 45B04 80055B04 90010624 */   addiu     $a2, $zero, 0x190
    /* 45B08 80055B08 44000224 */  addiu      $v0, $zero, 0x44
  .L80055B0C:
    /* 45B0C 80055B0C 06004216 */  bne        $s2, $v0, .L80055B28
    /* 45B10 80055B10 45000224 */   addiu     $v0, $zero, 0x45
    /* 45B14 80055B14 21200002 */  addu       $a0, $s0, $zero
    /* 45B18 80055B18 21282002 */  addu       $a1, $s1, $zero
    /* 45B1C 80055B1C D555010C */  jal        ObjSetMicro__Fiii
    /* 45B20 80055B20 91010624 */   addiu     $a2, $zero, 0x191
    /* 45B24 80055B24 45000224 */  addiu      $v0, $zero, 0x45
  .L80055B28:
    /* 45B28 80055B28 06004216 */  bne        $s2, $v0, .L80055B44
    /* 45B2C 80055B2C 46000224 */   addiu     $v0, $zero, 0x46
    /* 45B30 80055B30 21200002 */  addu       $a0, $s0, $zero
    /* 45B34 80055B34 21282002 */  addu       $a1, $s1, $zero
    /* 45B38 80055B38 D555010C */  jal        ObjSetMicro__Fiii
    /* 45B3C 80055B3C 93010624 */   addiu     $a2, $zero, 0x193
    /* 45B40 80055B40 46000224 */  addiu      $v0, $zero, 0x46
  .L80055B44:
    /* 45B44 80055B44 06004216 */  bne        $s2, $v0, .L80055B60
    /* 45B48 80055B48 48000224 */   addiu     $v0, $zero, 0x48
    /* 45B4C 80055B4C 21200002 */  addu       $a0, $s0, $zero
    /* 45B50 80055B50 21282002 */  addu       $a1, $s1, $zero
    /* 45B54 80055B54 D555010C */  jal        ObjSetMicro__Fiii
    /* 45B58 80055B58 94010624 */   addiu     $a2, $zero, 0x194
    /* 45B5C 80055B5C 48000224 */  addiu      $v0, $zero, 0x48
  .L80055B60:
    /* 45B60 80055B60 06004216 */  bne        $s2, $v0, .L80055B7C
    /* 45B64 80055B64 D4000224 */   addiu     $v0, $zero, 0xD4
    /* 45B68 80055B68 21200002 */  addu       $a0, $s0, $zero
    /* 45B6C 80055B6C 21282002 */  addu       $a1, $s1, $zero
    /* 45B70 80055B70 D555010C */  jal        ObjSetMicro__Fiii
    /* 45B74 80055B74 96010624 */   addiu     $a2, $zero, 0x196
    /* 45B78 80055B78 D4000224 */  addiu      $v0, $zero, 0xD4
  .L80055B7C:
    /* 45B7C 80055B7C 06004216 */  bne        $s2, $v0, .L80055B98
    /* 45B80 80055B80 62010224 */   addiu     $v0, $zero, 0x162
    /* 45B84 80055B84 21200002 */  addu       $a0, $s0, $zero
    /* 45B88 80055B88 21282002 */  addu       $a1, $s1, $zero
    /* 45B8C 80055B8C D555010C */  jal        ObjSetMicro__Fiii
    /* 45B90 80055B90 97010624 */   addiu     $a2, $zero, 0x197
    /* 45B94 80055B94 62010224 */  addiu      $v0, $zero, 0x162
  .L80055B98:
    /* 45B98 80055B98 06004216 */  bne        $s2, $v0, .L80055BB4
    /* 45B9C 80055B9C 63010224 */   addiu     $v0, $zero, 0x163
    /* 45BA0 80055BA0 21200002 */  addu       $a0, $s0, $zero
    /* 45BA4 80055BA4 21282002 */  addu       $a1, $s1, $zero
    /* 45BA8 80055BA8 D555010C */  jal        ObjSetMicro__Fiii
    /* 45BAC 80055BAC 99010624 */   addiu     $a2, $zero, 0x199
    /* 45BB0 80055BB0 63010224 */  addiu      $v0, $zero, 0x163
  .L80055BB4:
    /* 45BB4 80055BB4 06004216 */  bne        $s2, $v0, .L80055BD0
    /* 45BB8 80055BB8 9B010224 */   addiu     $v0, $zero, 0x19B
    /* 45BBC 80055BBC 21200002 */  addu       $a0, $s0, $zero
    /* 45BC0 80055BC0 21282002 */  addu       $a1, $s1, $zero
    /* 45BC4 80055BC4 D555010C */  jal        ObjSetMicro__Fiii
    /* 45BC8 80055BC8 9A010624 */   addiu     $a2, $zero, 0x19A
    /* 45BCC 80055BCC 9B010224 */  addiu      $v0, $zero, 0x19B
  .L80055BD0:
    /* 45BD0 80055BD0 06004216 */  bne        $s2, $v0, .L80055BEC
    /* 45BD4 80055BD4 9C010224 */   addiu     $v0, $zero, 0x19C
    /* 45BD8 80055BD8 21200002 */  addu       $a0, $s0, $zero
    /* 45BDC 80055BDC 21282002 */  addu       $a1, $s1, $zero
    /* 45BE0 80055BE0 D555010C */  jal        ObjSetMicro__Fiii
    /* 45BE4 80055BE4 8C010624 */   addiu     $a2, $zero, 0x18C
    /* 45BE8 80055BE8 9C010224 */  addiu      $v0, $zero, 0x19C
  .L80055BEC:
    /* 45BEC 80055BEC 04004216 */  bne        $s2, $v0, .L80055C00
    /* 45BF0 80055BF0 21200002 */   addu      $a0, $s0, $zero
    /* 45BF4 80055BF4 21282002 */  addu       $a1, $s1, $zero
    /* 45BF8 80055BF8 D555010C */  jal        ObjSetMicro__Fiii
    /* 45BFC 80055BFC 8C010624 */   addiu     $a2, $zero, 0x18C
  .L80055C00:
    /* 45C00 80055C00 2000BF8F */  lw         $ra, 0x20($sp)
    /* 45C04 80055C04 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 45C08 80055C08 1800B28F */  lw         $s2, 0x18($sp)
    /* 45C0C 80055C0C 1400B18F */  lw         $s1, 0x14($sp)
    /* 45C10 80055C10 1000B08F */  lw         $s0, 0x10($sp)
    /* 45C14 80055C14 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 45C18 80055C18 0800E003 */  jr         $ra
    /* 45C1C 80055C1C 00000000 */   nop
endlabel DoorSet__Fiii
