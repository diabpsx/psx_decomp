.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching M_SyncStartKill__Fiiii, 0x110

glabel M_SyncStartKill__Fiiii
    /* 128E8 8014C4E0 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 128EC 8014C4E4 1400B1AF */  sw         $s1, 0x14($sp)
    /* 128F0 8014C4E8 21888000 */  addu       $s1, $a0, $zero
    /* 128F4 8014C4EC 1800B2AF */  sw         $s2, 0x18($sp)
    /* 128F8 8014C4F0 2190A000 */  addu       $s2, $a1, $zero
    /* 128FC 8014C4F4 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 12900 8014C4F8 2198C000 */  addu       $s3, $a2, $zero
    /* 12904 8014C4FC 40101100 */  sll        $v0, $s1, 1
    /* 12908 8014C500 21105100 */  addu       $v0, $v0, $s1
    /* 1290C 8014C504 80100200 */  sll        $v0, $v0, 2
    /* 12910 8014C508 21105100 */  addu       $v0, $v0, $s1
    /* 12914 8014C50C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 12918 8014C510 C0800200 */  sll        $s0, $v0, 3
    /* 1291C 8014C514 2400BFAF */  sw         $ra, 0x24($sp)
    /* 12920 8014C518 2000B4AF */  sw         $s4, 0x20($sp)
    /* 12924 8014C51C 1080013C */  lui        $at, %hi(monster + 0x10)
    /* 12928 8014C520 21083000 */  addu       $at, $at, $s0
    /* 1292C 8014C524 A453228C */  lw         $v0, %lo(monster + 0x10)($at)
    /* 12930 8014C528 00000000 */  nop
    /* 12934 8014C52C 27004010 */  beqz       $v0, .L8014C5CC
    /* 12938 8014C530 21A0E000 */   addu      $s4, $a3, $zero
    /* 1293C 8014C534 1080013C */  lui        $at, %hi(monster + 0x33)
    /* 12940 8014C538 21083000 */  addu       $at, $at, $s0
    /* 12944 8014C53C C7532380 */  lb         $v1, %lo(monster + 0x33)($at)
    /* 12948 8014C540 06000224 */  addiu      $v0, $zero, 0x6
    /* 1294C 8014C544 21006210 */  beq        $v1, $v0, .L8014C5CC
    /* 12950 8014C548 C0101300 */   sll       $v0, $s3, 3
    /* 12954 8014C54C C0181200 */  sll        $v1, $s2, 3
    /* 12958 8014C550 23187200 */  subu       $v1, $v1, $s2
    /* 1295C 8014C554 C0190300 */  sll        $v1, $v1, 7
    /* 12960 8014C558 21104300 */  addu       $v0, $v0, $v1
    /* 12964 8014C55C 0E80013C */  lui        $at, %hi(dung_map)
    /* 12968 8014C560 21082200 */  addu       $at, $at, $v0
    /* 1296C 8014C564 287A2284 */  lh         $v0, %lo(dung_map)($at)
    /* 12970 8014C568 00000000 */  nop
    /* 12974 8014C56C 0F004014 */  bnez       $v0, .L8014C5AC
    /* 12978 8014C570 00000000 */   nop
    /* 1297C 8014C574 D7FC010C */  jal        M_ClearSquares__Fi
    /* 12980 8014C578 00000000 */   nop
    /* 12984 8014C57C 1080013C */  lui        $at, %hi(monster + 0x34)
    /* 12988 8014C580 21083000 */  addu       $at, $at, $s0
    /* 1298C 8014C584 C85332A0 */  sb         $s2, %lo(monster + 0x34)($at)
    /* 12990 8014C588 1080013C */  lui        $at, %hi(monster + 0x35)
    /* 12994 8014C58C 21083000 */  addu       $at, $at, $s0
    /* 12998 8014C590 C95333A0 */  sb         $s3, %lo(monster + 0x35)($at)
    /* 1299C 8014C594 1080013C */  lui        $at, %hi(monster + 0x38)
    /* 129A0 8014C598 21083000 */  addu       $at, $at, $s0
    /* 129A4 8014C59C CC5332A0 */  sb         $s2, %lo(monster + 0x38)($at)
    /* 129A8 8014C5A0 1080013C */  lui        $at, %hi(monster + 0x39)
    /* 129AC 8014C5A4 21083000 */  addu       $at, $at, $s0
    /* 129B0 8014C5A8 CD5333A0 */  sb         $s3, %lo(monster + 0x39)($at)
  .L8014C5AC:
    /* 129B4 8014C5AC 1280023C */  lui        $v0, %hi(deltaload)
    /* 129B8 8014C5B0 7DB94290 */  lbu        $v0, %lo(deltaload)($v0)
    /* 129BC 8014C5B4 00000000 */  nop
    /* 129C0 8014C5B8 04004010 */  beqz       $v0, .L8014C5CC
    /* 129C4 8014C5BC 21202002 */   addu      $a0, $s1, $zero
    /* 129C8 8014C5C0 21288002 */  addu       $a1, $s4, $zero
    /* 129CC 8014C5C4 B02F050C */  jal        SyncMonstStartKill__FiiUc
    /* 129D0 8014C5C8 21300000 */   addu      $a2, $zero, $zero
  .L8014C5CC:
    /* 129D4 8014C5CC 2400BF8F */  lw         $ra, 0x24($sp)
    /* 129D8 8014C5D0 2000B48F */  lw         $s4, 0x20($sp)
    /* 129DC 8014C5D4 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 129E0 8014C5D8 1800B28F */  lw         $s2, 0x18($sp)
    /* 129E4 8014C5DC 1400B18F */  lw         $s1, 0x14($sp)
    /* 129E8 8014C5E0 1000B08F */  lw         $s0, 0x10($sp)
    /* 129EC 8014C5E4 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 129F0 8014C5E8 0800E003 */  jr         $ra
    /* 129F4 8014C5EC 00000000 */   nop
endlabel M_SyncStartKill__Fiiii
