.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching S_WRechargeEnter__Fv, 0x164

glabel S_WRechargeEnter__Fv
    /* 62AD4 80072AD4 0421838F */  lw         $v1, %gp_rel(D_8011C884)($gp)
    /* 62AD8 80072AD8 08000224 */  addiu      $v0, $zero, 0x8
    /* 62ADC 80072ADC 0C2182AF */  sw         $v0, %gp_rel(D_8011C88C)($gp)
    /* 62AE0 80072AE0 1C21828F */  lw         $v0, %gp_rel(D_8011C89C)($gp)
    /* 62AE4 80072AE4 1421848F */  lw         $a0, %gp_rel(D_8011C894)($gp)
    /* 62AE8 80072AE8 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 62AEC 80072AEC 1000BFAF */  sw         $ra, 0x10($sp)
    /* 62AF0 80072AF0 23106200 */  subu       $v0, $v1, $v0
    /* 62AF4 80072AF4 082183AF */  sw         $v1, %gp_rel(D_8011C888)($gp)
    /* 62AF8 80072AF8 102184AF */  sw         $a0, %gp_rel(D_8011C890)($gp)
    /* 62AFC 80072AFC 02004104 */  bgez       $v0, .L80072B08
    /* 62B00 80072B00 00000000 */   nop
    /* 62B04 80072B04 07004224 */  addiu      $v0, $v0, 0x7
  .L80072B08:
    /* 62B08 80072B08 C3100200 */  sra        $v0, $v0, 3
    /* 62B0C 80072B0C 21404400 */  addu       $t0, $v0, $a0
    /* 62B10 80072B10 0E80033C */  lui        $v1, %hi(storehold)
    /* 62B14 80072B14 881D6324 */  addiu      $v1, $v1, %lo(storehold)
    /* 62B18 80072B18 C0100800 */  sll        $v0, $t0, 3
    /* 62B1C 80072B1C 23104800 */  subu       $v0, $v0, $t0
    /* 62B20 80072B20 80100200 */  sll        $v0, $v0, 2
    /* 62B24 80072B24 23104800 */  subu       $v0, $v0, $t0
    /* 62B28 80072B28 80100200 */  sll        $v0, $v0, 2
    /* 62B2C 80072B2C 21384300 */  addu       $a3, $v0, $v1
    /* 62B30 80072B30 1280033C */  lui        $v1, %hi(myplr)
    /* 62B34 80072B34 08BA638C */  lw         $v1, %lo(myplr)($v1)
    /* 62B38 80072B38 6000E924 */  addiu      $t1, $a3, 0x60
    /* 62B3C 80072B3C 40100300 */  sll        $v0, $v1, 1
    /* 62B40 80072B40 21104300 */  addu       $v0, $v0, $v1
    /* 62B44 80072B44 80100200 */  sll        $v0, $v0, 2
    /* 62B48 80072B48 21104300 */  addu       $v0, $v0, $v1
    /* 62B4C 80072B4C 00110200 */  sll        $v0, $v0, 4
    /* 62B50 80072B50 23104300 */  subu       $v0, $v0, $v1
    /* 62B54 80072B54 80100200 */  sll        $v0, $v0, 2
    /* 62B58 80072B58 21104300 */  addu       $v0, $v0, $v1
    /* 62B5C 80072B5C C0100200 */  sll        $v0, $v0, 3
    /* 62B60 80072B60 0E80033C */  lui        $v1, %hi(plr + 0x1910)
    /* 62B64 80072B64 48BE6324 */  addiu      $v1, $v1, %lo(plr + 0x1910)
    /* 62B68 80072B68 21304300 */  addu       $a2, $v0, $v1
  .L80072B6C:
    /* 62B6C 80072B6C 0000E28C */  lw         $v0, 0x0($a3)
    /* 62B70 80072B70 0400E38C */  lw         $v1, 0x4($a3)
    /* 62B74 80072B74 0800E48C */  lw         $a0, 0x8($a3)
    /* 62B78 80072B78 0C00E58C */  lw         $a1, 0xC($a3)
    /* 62B7C 80072B7C 0000C2AC */  sw         $v0, 0x0($a2)
    /* 62B80 80072B80 0400C3AC */  sw         $v1, 0x4($a2)
    /* 62B84 80072B84 0800C4AC */  sw         $a0, 0x8($a2)
    /* 62B88 80072B88 0C00C5AC */  sw         $a1, 0xC($a2)
    /* 62B8C 80072B8C 1000E724 */  addiu      $a3, $a3, 0x10
    /* 62B90 80072B90 F6FFE914 */  bne        $a3, $t1, .L80072B6C
    /* 62B94 80072B94 1000C624 */   addiu     $a2, $a2, 0x10
    /* 62B98 80072B98 0000E28C */  lw         $v0, 0x0($a3)
    /* 62B9C 80072B9C 0400E38C */  lw         $v1, 0x4($a3)
    /* 62BA0 80072BA0 0800E48C */  lw         $a0, 0x8($a3)
    /* 62BA4 80072BA4 0000C2AC */  sw         $v0, 0x0($a2)
    /* 62BA8 80072BA8 0400C3AC */  sw         $v1, 0x4($a2)
    /* 62BAC 80072BAC 0800C4AC */  sw         $a0, 0x8($a2)
    /* 62BB0 80072BB0 1280033C */  lui        $v1, %hi(myplr)
    /* 62BB4 80072BB4 08BA638C */  lw         $v1, %lo(myplr)($v1)
    /* 62BB8 80072BB8 00000000 */  nop
    /* 62BBC 80072BBC 40100300 */  sll        $v0, $v1, 1
    /* 62BC0 80072BC0 21104300 */  addu       $v0, $v0, $v1
    /* 62BC4 80072BC4 80100200 */  sll        $v0, $v0, 2
    /* 62BC8 80072BC8 21104300 */  addu       $v0, $v0, $v1
    /* 62BCC 80072BCC 00110200 */  sll        $v0, $v0, 4
    /* 62BD0 80072BD0 23104300 */  subu       $v0, $v0, $v1
    /* 62BD4 80072BD4 80100200 */  sll        $v0, $v0, 2
    /* 62BD8 80072BD8 21104300 */  addu       $v0, $v0, $v1
    /* 62BDC 80072BDC C0100200 */  sll        $v0, $v0, 3
    /* 62BE0 80072BE0 C0180800 */  sll        $v1, $t0, 3
    /* 62BE4 80072BE4 23186800 */  subu       $v1, $v1, $t0
    /* 62BE8 80072BE8 80180300 */  sll        $v1, $v1, 2
    /* 62BEC 80072BEC 23186800 */  subu       $v1, $v1, $t0
    /* 62BF0 80072BF0 80180300 */  sll        $v1, $v1, 2
    /* 62BF4 80072BF4 0E80013C */  lui        $at, %hi(plr + 0x150)
    /* 62BF8 80072BF8 21082200 */  addu       $at, $at, $v0
    /* 62BFC 80072BFC 88A6228C */  lw         $v0, %lo(plr + 0x150)($at)
    /* 62C00 80072C00 0E80013C */  lui        $at, %hi(storehold + 0x18)
    /* 62C04 80072C04 21082300 */  addu       $at, $at, $v1
    /* 62C08 80072C08 A01D238C */  lw         $v1, %lo(storehold + 0x18)($at)
    /* 62C0C 80072C0C 681388AF */  sw         $t0, %gp_rel(SellIdx)($gp)
    /* 62C10 80072C10 2A104300 */  slt        $v0, $v0, $v1
    /* 62C14 80072C14 02004010 */  beqz       $v0, .L80072C20
    /* 62C18 80072C18 0B000424 */   addiu     $a0, $zero, 0xB
    /* 62C1C 80072C1C 09000424 */  addiu      $a0, $zero, 0x9
  .L80072C20:
    /* 62C20 80072C20 5BBE010C */  jal        StartStore__Fc
    /* 62C24 80072C24 00000000 */   nop
    /* 62C28 80072C28 1000BF8F */  lw         $ra, 0x10($sp)
    /* 62C2C 80072C2C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 62C30 80072C30 0800E003 */  jr         $ra
    /* 62C34 80072C34 00000000 */   nop
endlabel S_WRechargeEnter__Fv
