.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching get_last_inv__Fv, 0x12C

glabel get_last_inv__Fv
    /* 90AD0 800A0AD0 1280023C */  lui        $v0, %hi(sel_data)
    /* 90AD4 800A0AD4 2CB7428C */  lw         $v0, %lo(sel_data)($v0)
    /* 90AD8 800A0AD8 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 90ADC 800A0ADC 1000BFAF */  sw         $ra, 0x10($sp)
    /* 90AE0 800A0AE0 80100200 */  sll        $v0, $v0, 2
    /* 90AE4 800A0AE4 1280013C */  lui        $at, %hi(_pcurr_inv)
    /* 90AE8 800A0AE8 21082200 */  addu       $at, $at, $v0
    /* 90AEC 800A0AEC D4BB228C */  lw         $v0, %lo(_pcurr_inv)($at)
    /* 90AF0 800A0AF0 00000000 */  nop
    /* 90AF4 800A0AF4 FFFF4424 */  addiu      $a0, $v0, -0x1
    /* 90AF8 800A0AF8 1C008004 */  bltz       $a0, .L800A0B6C
    /* 90AFC 800A0AFC FFFF0524 */   addiu     $a1, $zero, -0x1
    /* 90B00 800A0B00 1280023C */  lui        $v0, %hi(myplr)
    /* 90B04 800A0B04 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 90B08 800A0B08 00000000 */  nop
    /* 90B0C 800A0B0C 40180200 */  sll        $v1, $v0, 1
    /* 90B10 800A0B10 21186200 */  addu       $v1, $v1, $v0
    /* 90B14 800A0B14 80180300 */  sll        $v1, $v1, 2
    /* 90B18 800A0B18 21186200 */  addu       $v1, $v1, $v0
    /* 90B1C 800A0B1C 00190300 */  sll        $v1, $v1, 4
    /* 90B20 800A0B20 23186200 */  subu       $v1, $v1, $v0
    /* 90B24 800A0B24 80180300 */  sll        $v1, $v1, 2
    /* 90B28 800A0B28 21186200 */  addu       $v1, $v1, $v0
    /* 90B2C 800A0B2C C0180300 */  sll        $v1, $v1, 3
    /* 90B30 800A0B30 C0100400 */  sll        $v0, $a0, 3
    /* 90B34 800A0B34 23104400 */  subu       $v0, $v0, $a0
    /* 90B38 800A0B38 80100200 */  sll        $v0, $v0, 2
    /* 90B3C 800A0B3C 23104400 */  subu       $v0, $v0, $a0
    /* 90B40 800A0B40 80100200 */  sll        $v0, $v0, 2
    /* 90B44 800A0B44 21184300 */  addu       $v1, $v0, $v1
  .L800A0B48:
    /* 90B48 800A0B48 0E80013C */  lui        $at, %hi(plr + 0x15DC)
    /* 90B4C 800A0B4C 21082300 */  addu       $at, $at, $v1
    /* 90B50 800A0B50 14BB2284 */  lh         $v0, %lo(plr + 0x15DC)($at)
    /* 90B54 800A0B54 00000000 */  nop
    /* 90B58 800A0B58 14004514 */  bne        $v0, $a1, .L800A0BAC
    /* 90B5C 800A0B5C 00000000 */   nop
    /* 90B60 800A0B60 FFFF8424 */  addiu      $a0, $a0, -0x1
    /* 90B64 800A0B64 F8FF8104 */  bgez       $a0, .L800A0B48
    /* 90B68 800A0B68 94FF6324 */   addiu     $v1, $v1, -0x6C
  .L800A0B6C:
    /* 90B6C 800A0B6C 9A82020C */  jal        any_belt_items__Fv
    /* 90B70 800A0B70 00000000 */   nop
    /* 90B74 800A0B74 FF004230 */  andi       $v0, $v0, 0xFF
    /* 90B78 800A0B78 15004010 */  beqz       $v0, .L800A0BD0
    /* 90B7C 800A0B7C 08000324 */   addiu     $v1, $zero, 0x8
    /* 90B80 800A0B80 1280023C */  lui        $v0, %hi(sel_data)
    /* 90B84 800A0B84 2CB7428C */  lw         $v0, %lo(sel_data)($v0)
    /* 90B88 800A0B88 00000000 */  nop
    /* 90B8C 800A0B8C 80100200 */  sll        $v0, $v0, 2
    /* 90B90 800A0B90 1280013C */  lui        $at, %hi(_pcurr_inv)
    /* 90B94 800A0B94 21082200 */  addu       $at, $at, $v0
    /* 90B98 800A0B98 D4BB23AC */  sw         $v1, %lo(_pcurr_inv)($at)
    /* 90B9C 800A0B9C B482020C */  jal        get_last_inv__Fv
    /* 90BA0 800A0BA0 00000000 */   nop
    /* 90BA4 800A0BA4 FB820208 */  j          .L800A0BEC
    /* 90BA8 800A0BA8 00000000 */   nop
  .L800A0BAC:
    /* 90BAC 800A0BAC 1280023C */  lui        $v0, %hi(sel_data)
    /* 90BB0 800A0BB0 2CB7428C */  lw         $v0, %lo(sel_data)($v0)
    /* 90BB4 800A0BB4 00000000 */  nop
    /* 90BB8 800A0BB8 80100200 */  sll        $v0, $v0, 2
    /* 90BBC 800A0BBC 1280013C */  lui        $at, %hi(_pcurr_inv)
    /* 90BC0 800A0BC0 21082200 */  addu       $at, $at, $v0
    /* 90BC4 800A0BC4 D4BB24AC */  sw         $a0, %lo(_pcurr_inv)($at)
    /* 90BC8 800A0BC8 FB820208 */  j          .L800A0BEC
    /* 90BCC 800A0BCC 00000000 */   nop
  .L800A0BD0:
    /* 90BD0 800A0BD0 1280023C */  lui        $v0, %hi(sel_data)
    /* 90BD4 800A0BD4 2CB7428C */  lw         $v0, %lo(sel_data)($v0)
    /* 90BD8 800A0BD8 FFFF0324 */  addiu      $v1, $zero, -0x1
    /* 90BDC 800A0BDC 80100200 */  sll        $v0, $v0, 2
    /* 90BE0 800A0BE0 1280013C */  lui        $at, %hi(_pcurr_inv)
    /* 90BE4 800A0BE4 21082200 */  addu       $at, $at, $v0
    /* 90BE8 800A0BE8 D4BB23AC */  sw         $v1, %lo(_pcurr_inv)($at)
  .L800A0BEC:
    /* 90BEC 800A0BEC 1000BF8F */  lw         $ra, 0x10($sp)
    /* 90BF0 800A0BF0 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 90BF4 800A0BF4 0800E003 */  jr         $ra
    /* 90BF8 800A0BF8 00000000 */   nop
endlabel get_last_inv__Fv
