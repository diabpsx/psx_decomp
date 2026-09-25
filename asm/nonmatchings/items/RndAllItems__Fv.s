.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching RndAllItems__Fv, 0x164

glabel RndAllItems__Fv
    /* 33ADC 80043ADC E8F7BD27 */  addiu      $sp, $sp, -0x818
    /* 33AE0 80043AE0 1008BFAF */  sw         $ra, 0x810($sp)
    /* 33AE4 80043AE4 C9F6000C */  jal        ENG_random__Fl
    /* 33AE8 80043AE8 64000424 */   addiu     $a0, $zero, 0x64
    /* 33AEC 80043AEC 1A004228 */  slti       $v0, $v0, 0x1A
    /* 33AF0 80043AF0 03004014 */  bnez       $v0, .L80043B00
    /* 33AF4 80043AF4 21200000 */   addu      $a0, $zero, $zero
    /* 33AF8 80043AF8 0C0F0108 */  j          .L80043C30
    /* 33AFC 80043AFC 21100000 */   addu      $v0, $zero, $zero
  .L80043B00:
    /* 33B00 80043B00 1180033C */  lui        $v1, %hi(AllItemsList + 0x2)
    /* 33B04 80043B04 A6136380 */  lb         $v1, %lo(AllItemsList + 0x2)($v1)
    /* 33B08 80043B08 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 33B0C 80043B0C 43006210 */  beq        $v1, $v0, .L80043C1C
    /* 33B10 80043B10 21380000 */   addu      $a3, $zero, $zero
    /* 33B14 80043B14 21280000 */  addu       $a1, $zero, $zero
    /* 33B18 80043B18 1280023C */  lui        $v0, %hi(currlevel)
    /* 33B1C 80043B1C 0CC14290 */  lbu        $v0, %lo(currlevel)($v0)
    /* 33B20 80043B20 1280063C */  lui        $a2, %hi(FePlayerNo)
    /* 33B24 80043B24 78B3C68C */  lw         $a2, %lo(FePlayerNo)($a2)
    /* 33B28 80043B28 40400200 */  sll        $t0, $v0, 1
  .L80043B2C:
    /* 33B2C 80043B2C 1180013C */  lui        $at, %hi(AllItemsList)
    /* 33B30 80043B30 21082500 */  addu       $at, $at, $a1
    /* 33B34 80043B34 A4132290 */  lbu        $v0, %lo(AllItemsList)($at)
    /* 33B38 80043B38 00000000 */  nop
    /* 33B3C 80043B3C 0C004010 */  beqz       $v0, .L80043B70
    /* 33B40 80043B40 00000000 */   nop
    /* 33B44 80043B44 1180013C */  lui        $at, %hi(AllItemsList + 0xA)
    /* 33B48 80043B48 21082500 */  addu       $at, $at, $a1
    /* 33B4C 80043B4C AE132280 */  lb         $v0, %lo(AllItemsList + 0xA)($at)
    /* 33B50 80043B50 00000000 */  nop
    /* 33B54 80043B54 2A100201 */  slt        $v0, $t0, $v0
    /* 33B58 80043B58 05004014 */  bnez       $v0, .L80043B70
    /* 33B5C 80043B5C 80100400 */   sll       $v0, $a0, 2
    /* 33B60 80043B60 1000A327 */  addiu      $v1, $sp, 0x10
    /* 33B64 80043B64 21104300 */  addu       $v0, $v0, $v1
    /* 33B68 80043B68 000047AC */  sw         $a3, 0x0($v0)
    /* 33B6C 80043B6C 01008424 */  addiu      $a0, $a0, 0x1
  .L80043B70:
    /* 33B70 80043B70 1180013C */  lui        $at, %hi(AllItemsList + 0x19)
    /* 33B74 80043B74 21082500 */  addu       $at, $at, $a1
    /* 33B78 80043B78 BD132390 */  lbu        $v1, %lo(AllItemsList + 0x19)($at)
    /* 33B7C 80043B7C 20000224 */  addiu      $v0, $zero, 0x20
    /* 33B80 80043B80 07006214 */  bne        $v1, $v0, .L80043BA0
    /* 33B84 80043B84 00000000 */   nop
    /* 33B88 80043B88 0600C014 */  bnez       $a2, .L80043BA4
    /* 33B8C 80043B8C 22000224 */   addiu     $v0, $zero, 0x22
    /* 33B90 80043B90 FFFF8424 */  addiu      $a0, $a0, -0x1
    /* 33B94 80043B94 1180013C */  lui        $at, %hi(AllItemsList + 0x19)
    /* 33B98 80043B98 21082500 */  addu       $at, $at, $a1
    /* 33B9C 80043B9C BD132390 */  lbu        $v1, %lo(AllItemsList + 0x19)($at)
  .L80043BA0:
    /* 33BA0 80043BA0 22000224 */  addiu      $v0, $zero, 0x22
  .L80043BA4:
    /* 33BA4 80043BA4 04006214 */  bne        $v1, $v0, .L80043BB8
    /* 33BA8 80043BA8 00000000 */   nop
    /* 33BAC 80043BAC 0200C014 */  bnez       $a2, .L80043BB8
    /* 33BB0 80043BB0 00000000 */   nop
    /* 33BB4 80043BB4 FFFF8424 */  addiu      $a0, $a0, -0x1
  .L80043BB8:
    /* 33BB8 80043BB8 1180013C */  lui        $at, %hi(AllItemsList + 0x19)
    /* 33BBC 80043BBC 21082500 */  addu       $at, $at, $a1
    /* 33BC0 80043BC0 BD132390 */  lbu        $v1, %lo(AllItemsList + 0x19)($at)
    /* 33BC4 80043BC4 17000224 */  addiu      $v0, $zero, 0x17
    /* 33BC8 80043BC8 07006214 */  bne        $v1, $v0, .L80043BE8
    /* 33BCC 80043BCC 00000000 */   nop
    /* 33BD0 80043BD0 0600C010 */  beqz       $a2, .L80043BEC
    /* 33BD4 80043BD4 0A000224 */   addiu     $v0, $zero, 0xA
    /* 33BD8 80043BD8 FFFF8424 */  addiu      $a0, $a0, -0x1
    /* 33BDC 80043BDC 1180013C */  lui        $at, %hi(AllItemsList + 0x19)
    /* 33BE0 80043BE0 21082500 */  addu       $at, $at, $a1
    /* 33BE4 80043BE4 BD132390 */  lbu        $v1, %lo(AllItemsList + 0x19)($at)
  .L80043BE8:
    /* 33BE8 80043BE8 0A000224 */  addiu      $v0, $zero, 0xA
  .L80043BEC:
    /* 33BEC 80043BEC 04006214 */  bne        $v1, $v0, .L80043C00
    /* 33BF0 80043BF0 00000000 */   nop
    /* 33BF4 80043BF4 0200C010 */  beqz       $a2, .L80043C00
    /* 33BF8 80043BF8 00000000 */   nop
    /* 33BFC 80043BFC FFFF8424 */  addiu      $a0, $a0, -0x1
  .L80043C00:
    /* 33C00 80043C00 2000A524 */  addiu      $a1, $a1, 0x20
    /* 33C04 80043C04 1180013C */  lui        $at, %hi(AllItemsList + 0x2)
    /* 33C08 80043C08 21082500 */  addu       $at, $at, $a1
    /* 33C0C 80043C0C A6132380 */  lb         $v1, %lo(AllItemsList + 0x2)($at)
    /* 33C10 80043C10 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 33C14 80043C14 C5FF6214 */  bne        $v1, $v0, .L80043B2C
    /* 33C18 80043C18 0100E724 */   addiu     $a3, $a3, 0x1
  .L80043C1C:
    /* 33C1C 80043C1C C9F6000C */  jal        ENG_random__Fl
    /* 33C20 80043C20 00000000 */   nop
    /* 33C24 80043C24 80100200 */  sll        $v0, $v0, 2
    /* 33C28 80043C28 2110A203 */  addu       $v0, $sp, $v0
    /* 33C2C 80043C2C 1000428C */  lw         $v0, 0x10($v0)
  .L80043C30:
    /* 33C30 80043C30 1008BF8F */  lw         $ra, 0x810($sp)
    /* 33C34 80043C34 1808BD27 */  addiu      $sp, $sp, 0x818
    /* 33C38 80043C38 0800E003 */  jr         $ra
    /* 33C3C 80043C3C 00000000 */   nop
endlabel RndAllItems__Fv
