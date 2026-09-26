.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DRLG_L3Anvil__Fv, 0x258

glabel DRLG_L3Anvil__Fv
    /* 12880 8014C478 B8FFBD27 */  addiu      $sp, $sp, -0x48
    /* 12884 8014C47C 3400B1AF */  sw         $s1, 0x34($sp)
    /* 12888 8014C480 1580113C */  lui        $s1, %hi(L3ANVIL)
    /* 1288C 8014C484 64883192 */  lbu        $s1, %lo(L3ANVIL)($s1)
    /* 12890 8014C488 3C00B3AF */  sw         $s3, 0x3C($sp)
    /* 12894 8014C48C 1580133C */  lui        $s3, %hi(L3ANVIL + 0x1)
    /* 12898 8014C490 65887392 */  lbu        $s3, %lo(L3ANVIL + 0x1)($s3)
    /* 1289C 8014C494 3000B0AF */  sw         $s0, 0x30($sp)
    /* 128A0 8014C498 28001024 */  addiu      $s0, $zero, 0x28
    /* 128A4 8014C49C 4000BFAF */  sw         $ra, 0x40($sp)
    /* 128A8 8014C4A0 3800B2AF */  sw         $s2, 0x38($sp)
    /* 128AC 8014C4A4 C9F6000C */  jal        ENG_random__Fl
    /* 128B0 8014C4A8 23201102 */   subu      $a0, $s0, $s1
    /* 128B4 8014C4AC 21904000 */  addu       $s2, $v0, $zero
    /* 128B8 8014C4B0 23801302 */  subu       $s0, $s0, $s3
    /* 128BC 8014C4B4 C9F6000C */  jal        ENG_random__Fl
    /* 128C0 8014C4B8 21200002 */   addu      $a0, $s0, $zero
    /* 128C4 8014C4BC 21584000 */  addu       $t3, $v0, $zero
    /* 128C8 8014C4C0 21600000 */  addu       $t4, $zero, $zero
    /* 128CC 8014C4C4 01000D24 */  addiu      $t5, $zero, 0x1
    /* 128D0 8014C4C8 0E800F3C */  lui        $t7, %hi(dungeon)
    /* 128D4 8014C4CC C440EF25 */  addiu      $t7, $t7, %lo(dungeon)
    /* 128D8 8014C4D0 28001824 */  addiu      $t8, $zero, 0x28
    /* 128DC 8014C4D4 12800E3C */  lui        $t6, %hi(mydflags)
    /* 128E0 8014C4D8 D8C0CE8D */  lw         $t6, %lo(mydflags)($t6)
    /* 128E4 8014C4DC C8008229 */  slti       $v0, $t4, 0xC8
  .L8014C4E0:
    /* 128E8 8014C4E0 3E004010 */  beqz       $v0, .L8014C5DC
    /* 128EC 8014C4E4 01008C25 */   addiu     $t4, $t4, 0x1
    /* 128F0 8014C4E8 01000624 */  addiu      $a2, $zero, 0x1
    /* 128F4 8014C4EC 02000824 */  addiu      $t0, $zero, 0x2
    /* 128F8 8014C4F0 2C006012 */  beqz       $s3, .L8014C5A4
    /* 128FC 8014C4F4 21380000 */   addu      $a3, $zero, $zero
  .L8014C4F8:
    /* 12900 8014C4F8 2A00CD14 */  bne        $a2, $t5, .L8014C5A4
    /* 12904 8014C4FC 00000000 */   nop
    /* 12908 8014C500 24002012 */  beqz       $s1, .L8014C594
    /* 1290C 8014C504 21280000 */   addu      $a1, $zero, $zero
    /* 12910 8014C508 21186701 */  addu       $v1, $t3, $a3
    /* 12914 8014C50C 40500300 */  sll        $t2, $v1, 1
    /* 12918 8014C510 80100300 */  sll        $v0, $v1, 2
    /* 1291C 8014C514 21104300 */  addu       $v0, $v0, $v1
    /* 12920 8014C518 C0480200 */  sll        $t1, $v0, 3
    /* 12924 8014C51C 21184002 */  addu       $v1, $s2, $zero
  .L8014C520:
    /* 12928 8014C520 1C00CD14 */  bne        $a2, $t5, .L8014C594
    /* 1292C 8014C524 00000000 */   nop
    /* 12930 8014C528 1580013C */  lui        $at, %hi(L3ANVIL)
    /* 12934 8014C52C 21082800 */  addu       $at, $at, $t0
    /* 12938 8014C530 64882490 */  lbu        $a0, %lo(L3ANVIL)($at)
    /* 1293C 8014C534 00000000 */  nop
    /* 12940 8014C538 0A008010 */  beqz       $a0, .L8014C564
    /* 12944 8014C53C 40100300 */   sll       $v0, $v1, 1
    /* 12948 8014C540 21104300 */  addu       $v0, $v0, $v1
    /* 1294C 8014C544 40110200 */  sll        $v0, $v0, 5
    /* 12950 8014C548 21104F00 */  addu       $v0, $v0, $t7
    /* 12954 8014C54C 21104201 */  addu       $v0, $t2, $v0
    /* 12958 8014C550 00004294 */  lhu        $v0, 0x0($v0)
    /* 1295C 8014C554 00000000 */  nop
    /* 12960 8014C558 03004410 */  beq        $v0, $a0, .L8014C568
    /* 12964 8014C55C 21102301 */   addu      $v0, $t1, $v1
    /* 12968 8014C560 21300000 */  addu       $a2, $zero, $zero
  .L8014C564:
    /* 1296C 8014C564 21102301 */  addu       $v0, $t1, $v1
  .L8014C568:
    /* 12970 8014C568 2110C201 */  addu       $v0, $t6, $v0
    /* 12974 8014C56C 00004290 */  lbu        $v0, 0x0($v0)
    /* 12978 8014C570 00000000 */  nop
    /* 1297C 8014C574 02004010 */  beqz       $v0, .L8014C580
    /* 12980 8014C578 00000000 */   nop
    /* 12984 8014C57C 21300000 */  addu       $a2, $zero, $zero
  .L8014C580:
    /* 12988 8014C580 01000825 */  addiu      $t0, $t0, 0x1
    /* 1298C 8014C584 0100A524 */  addiu      $a1, $a1, 0x1
    /* 12990 8014C588 2A10B100 */  slt        $v0, $a1, $s1
    /* 12994 8014C58C E4FF4014 */  bnez       $v0, .L8014C520
    /* 12998 8014C590 01006324 */   addiu     $v1, $v1, 0x1
  .L8014C594:
    /* 1299C 8014C594 0100E724 */  addiu      $a3, $a3, 0x1
    /* 129A0 8014C598 2A10F300 */  slt        $v0, $a3, $s3
    /* 129A4 8014C59C D6FF4014 */  bnez       $v0, .L8014C4F8
    /* 129A8 8014C5A0 00000000 */   nop
  .L8014C5A4:
    /* 129AC 8014C5A4 0A00C014 */  bnez       $a2, .L8014C5D0
    /* 129B0 8014C5A8 23101103 */   subu      $v0, $t8, $s1
    /* 129B4 8014C5AC 01005226 */  addiu      $s2, $s2, 0x1
    /* 129B8 8014C5B0 05004216 */  bne        $s2, $v0, .L8014C5C8
    /* 129BC 8014C5B4 00000000 */   nop
    /* 129C0 8014C5B8 01006B25 */  addiu      $t3, $t3, 0x1
    /* 129C4 8014C5BC 02007015 */  bne        $t3, $s0, .L8014C5C8
    /* 129C8 8014C5C0 21900000 */   addu      $s2, $zero, $zero
    /* 129CC 8014C5C4 21580000 */  addu       $t3, $zero, $zero
  .L8014C5C8:
    /* 129D0 8014C5C8 C5FFC010 */  beqz       $a2, .L8014C4E0
    /* 129D4 8014C5CC C8008229 */   slti      $v0, $t4, 0xC8
  .L8014C5D0:
    /* 129D8 8014C5D0 C8008229 */  slti       $v0, $t4, 0xC8
    /* 129DC 8014C5D4 03004014 */  bnez       $v0, .L8014C5E4
    /* 129E0 8014C5D8 18007102 */   mult      $s3, $s1
  .L8014C5DC:
    /* 129E4 8014C5DC AC310508 */  j          .L8014C6B0
    /* 129E8 8014C5E0 01000224 */   addiu     $v0, $zero, 0x1
  .L8014C5E4:
    /* 129EC 8014C5E4 21380000 */  addu       $a3, $zero, $zero
    /* 129F0 8014C5E8 12C80000 */  mflo       $t9
    /* 129F4 8014C5EC 27006012 */  beqz       $s3, .L8014C68C
    /* 129F8 8014C5F0 02002827 */   addiu     $t0, $t9, 0x2
    /* 129FC 8014C5F4 0E800A3C */  lui        $t2, %hi(dungeon)
    /* 12A00 8014C5F8 C4404A25 */  addiu      $t2, $t2, %lo(dungeon)
  .L8014C5FC:
    /* 12A04 8014C5FC 1F002012 */  beqz       $s1, .L8014C67C
    /* 12A08 8014C600 21280000 */   addu      $a1, $zero, $zero
    /* 12A0C 8014C604 21186701 */  addu       $v1, $t3, $a3
    /* 12A10 8014C608 40480300 */  sll        $t1, $v1, 1
    /* 12A14 8014C60C 80100300 */  sll        $v0, $v1, 2
    /* 12A18 8014C610 21104300 */  addu       $v0, $v0, $v1
    /* 12A1C 8014C614 C0300200 */  sll        $a2, $v0, 3
    /* 12A20 8014C618 21204002 */  addu       $a0, $s2, $zero
  .L8014C61C:
    /* 12A24 8014C61C 1580013C */  lui        $at, %hi(L3ANVIL)
    /* 12A28 8014C620 21082800 */  addu       $at, $at, $t0
    /* 12A2C 8014C624 64882390 */  lbu        $v1, %lo(L3ANVIL)($at)
    /* 12A30 8014C628 00000000 */  nop
    /* 12A34 8014C62C 06006010 */  beqz       $v1, .L8014C648
    /* 12A38 8014C630 40100400 */   sll       $v0, $a0, 1
    /* 12A3C 8014C634 21104400 */  addu       $v0, $v0, $a0
    /* 12A40 8014C638 40110200 */  sll        $v0, $v0, 5
    /* 12A44 8014C63C 21104A00 */  addu       $v0, $v0, $t2
    /* 12A48 8014C640 21102201 */  addu       $v0, $t1, $v0
    /* 12A4C 8014C644 000043A4 */  sh         $v1, 0x0($v0)
  .L8014C648:
    /* 12A50 8014C648 01000825 */  addiu      $t0, $t0, 0x1
    /* 12A54 8014C64C 2110C400 */  addu       $v0, $a2, $a0
    /* 12A58 8014C650 1280033C */  lui        $v1, %hi(mydflags)
    /* 12A5C 8014C654 D8C0638C */  lw         $v1, %lo(mydflags)($v1)
    /* 12A60 8014C658 00000000 */  nop
    /* 12A64 8014C65C 21186200 */  addu       $v1, $v1, $v0
    /* 12A68 8014C660 00006290 */  lbu        $v0, 0x0($v1)
    /* 12A6C 8014C664 0100A524 */  addiu      $a1, $a1, 0x1
    /* 12A70 8014C668 80004234 */  ori        $v0, $v0, 0x80
    /* 12A74 8014C66C 000062A0 */  sb         $v0, 0x0($v1)
    /* 12A78 8014C670 2A10B100 */  slt        $v0, $a1, $s1
    /* 12A7C 8014C674 E9FF4014 */  bnez       $v0, .L8014C61C
    /* 12A80 8014C678 01008424 */   addiu     $a0, $a0, 0x1
  .L8014C67C:
    /* 12A84 8014C67C 0100E724 */  addiu      $a3, $a3, 0x1
    /* 12A88 8014C680 2A10F300 */  slt        $v0, $a3, $s3
    /* 12A8C 8014C684 DDFF4014 */  bnez       $v0, .L8014C5FC
    /* 12A90 8014C688 00000000 */   nop
  .L8014C68C:
    /* 12A94 8014C68C 21100000 */  addu       $v0, $zero, $zero
    /* 12A98 8014C690 1280013C */  lui        $at, %hi(setpc_x)
    /* 12A9C 8014C694 E4C032AC */  sw         $s2, %lo(setpc_x)($at)
    /* 12AA0 8014C698 1280013C */  lui        $at, %hi(setpc_y)
    /* 12AA4 8014C69C E8C02BAC */  sw         $t3, %lo(setpc_y)($at)
    /* 12AA8 8014C6A0 1280013C */  lui        $at, %hi(setpc_w)
    /* 12AAC 8014C6A4 ECC031AC */  sw         $s1, %lo(setpc_w)($at)
    /* 12AB0 8014C6A8 1280013C */  lui        $at, %hi(setpc_h)
    /* 12AB4 8014C6AC F0C033AC */  sw         $s3, %lo(setpc_h)($at)
  .L8014C6B0:
    /* 12AB8 8014C6B0 4000BF8F */  lw         $ra, 0x40($sp)
    /* 12ABC 8014C6B4 3C00B38F */  lw         $s3, 0x3C($sp)
    /* 12AC0 8014C6B8 3800B28F */  lw         $s2, 0x38($sp)
    /* 12AC4 8014C6BC 3400B18F */  lw         $s1, 0x34($sp)
    /* 12AC8 8014C6C0 3000B08F */  lw         $s0, 0x30($sp)
    /* 12ACC 8014C6C4 4800BD27 */  addiu      $sp, $sp, 0x48
    /* 12AD0 8014C6C8 0800E003 */  jr         $ra
    /* 12AD4 8014C6CC 00000000 */   nop
endlabel DRLG_L3Anvil__Fv
