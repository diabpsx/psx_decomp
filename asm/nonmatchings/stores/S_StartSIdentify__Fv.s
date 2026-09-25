.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching S_StartSIdentify__Fv, 0xAA0

glabel S_StartSIdentify__Fv
    /* 5E824 8006E824 70FFBD27 */  addiu      $sp, $sp, -0x90
    /* 5E828 8006E828 8400B3AF */  sw         $s3, 0x84($sp)
    /* 5E82C 8006E82C 21980000 */  addu       $s3, $zero, $zero
    /* 5E830 8006E830 FFFF0424 */  addiu      $a0, $zero, -0x1
    /* 5E834 8006E834 D4130324 */  addiu      $v1, $zero, 0x13D4
    /* 5E838 8006E838 02000224 */  addiu      $v0, $zero, 0x2
    /* 5E83C 8006E83C 262182A3 */  sb         $v0, %gp_rel(D_8011C8A6)($gp)
    /* 5E840 8006E840 01000224 */  addiu      $v0, $zero, 0x1
    /* 5E844 8006E844 8800BFAF */  sw         $ra, 0x88($sp)
    /* 5E848 8006E848 8000B2AF */  sw         $s2, 0x80($sp)
    /* 5E84C 8006E84C 7C00B1AF */  sw         $s1, 0x7C($sp)
    /* 5E850 8006E850 7800B0AF */  sw         $s0, 0x78($sp)
    /* 5E854 8006E854 611382A3 */  sb         $v0, %gp_rel(stextsize)($gp)
    /* 5E858 8006E858 282180AF */  sw         $zero, %gp_rel(D_8011C8A8)($gp)
  .L8006E85C:
    /* 5E85C 8006E85C 0E80013C */  lui        $at, %hi(storehold + 0x2C)
    /* 5E860 8006E860 21082300 */  addu       $at, $at, $v1
    /* 5E864 8006E864 B41D24A4 */  sh         $a0, %lo(storehold + 0x2C)($at)
    /* 5E868 8006E868 94FF6324 */  addiu      $v1, $v1, -0x6C
    /* 5E86C 8006E86C FBFF6104 */  bgez       $v1, .L8006E85C
    /* 5E870 8006E870 00000000 */   nop
    /* 5E874 8006E874 1280023C */  lui        $v0, %hi(myplr)
    /* 5E878 8006E878 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 5E87C 8006E87C 0E80103C */  lui        $s0, %hi(plr + 0x1B0)
    /* 5E880 8006E880 E8A61026 */  addiu      $s0, $s0, %lo(plr + 0x1B0)
    /* 5E884 8006E884 40200200 */  sll        $a0, $v0, 1
    /* 5E888 8006E888 21208200 */  addu       $a0, $a0, $v0
    /* 5E88C 8006E88C 80200400 */  sll        $a0, $a0, 2
    /* 5E890 8006E890 21208200 */  addu       $a0, $a0, $v0
    /* 5E894 8006E894 00210400 */  sll        $a0, $a0, 4
    /* 5E898 8006E898 23208200 */  subu       $a0, $a0, $v0
    /* 5E89C 8006E89C 80200400 */  sll        $a0, $a0, 2
    /* 5E8A0 8006E8A0 21208200 */  addu       $a0, $a0, $v0
    /* 5E8A4 8006E8A4 C0200400 */  sll        $a0, $a0, 3
    /* 5E8A8 8006E8A8 C5B9010C */  jal        IdItemOk__FP10ItemStruct
    /* 5E8AC 8006E8AC 21209000 */   addu      $a0, $a0, $s0
    /* 5E8B0 8006E8B0 FF004230 */  andi       $v0, $v0, 0xFF
    /* 5E8B4 8006E8B4 31004010 */  beqz       $v0, .L8006E97C
    /* 5E8B8 8006E8B8 1000A827 */   addiu     $t0, $sp, 0x10
    /* 5E8BC 8006E8BC 01001324 */  addiu      $s3, $zero, 0x1
    /* 5E8C0 8006E8C0 1280033C */  lui        $v1, %hi(myplr)
    /* 5E8C4 8006E8C4 08BA638C */  lw         $v1, %lo(myplr)($v1)
    /* 5E8C8 8006E8C8 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 5E8CC 8006E8CC 6C00A2AF */  sw         $v0, 0x6C($sp)
    /* 5E8D0 8006E8D0 40100300 */  sll        $v0, $v1, 1
    /* 5E8D4 8006E8D4 21104300 */  addu       $v0, $v0, $v1
    /* 5E8D8 8006E8D8 80100200 */  sll        $v0, $v0, 2
    /* 5E8DC 8006E8DC 21104300 */  addu       $v0, $v0, $v1
    /* 5E8E0 8006E8E0 00110200 */  sll        $v0, $v0, 4
    /* 5E8E4 8006E8E4 23104300 */  subu       $v0, $v0, $v1
    /* 5E8E8 8006E8E8 80100200 */  sll        $v0, $v0, 2
    /* 5E8EC 8006E8EC 21104300 */  addu       $v0, $v0, $v1
    /* 5E8F0 8006E8F0 C0380200 */  sll        $a3, $v0, 3
    /* 5E8F4 8006E8F4 10000226 */  addiu      $v0, $s0, 0x10
    /* 5E8F8 8006E8F8 2130E200 */  addu       $a2, $a3, $v0
    /* 5E8FC 8006E8FC 5000C924 */  addiu      $t1, $a2, 0x50
  .L8006E900:
    /* 5E900 8006E900 0000C28C */  lw         $v0, 0x0($a2)
    /* 5E904 8006E904 0400C38C */  lw         $v1, 0x4($a2)
    /* 5E908 8006E908 0800C48C */  lw         $a0, 0x8($a2)
    /* 5E90C 8006E90C 0C00C58C */  lw         $a1, 0xC($a2)
    /* 5E910 8006E910 000002AD */  sw         $v0, 0x0($t0)
    /* 5E914 8006E914 040003AD */  sw         $v1, 0x4($t0)
    /* 5E918 8006E918 080004AD */  sw         $a0, 0x8($t0)
    /* 5E91C 8006E91C 0C0005AD */  sw         $a1, 0xC($t0)
    /* 5E920 8006E920 1000C624 */  addiu      $a2, $a2, 0x10
    /* 5E924 8006E924 F6FFC914 */  bne        $a2, $t1, .L8006E900
    /* 5E928 8006E928 10000825 */   addiu     $t0, $t0, 0x10
    /* 5E92C 8006E92C 0000C28C */  lw         $v0, 0x0($a2)
    /* 5E930 8006E930 0400C38C */  lw         $v1, 0x4($a2)
    /* 5E934 8006E934 0800C48C */  lw         $a0, 0x8($a2)
    /* 5E938 8006E938 000002AD */  sw         $v0, 0x0($t0)
    /* 5E93C 8006E93C 040003AD */  sw         $v1, 0x4($t0)
    /* 5E940 8006E940 080004AD */  sw         $a0, 0x8($t0)
    /* 5E944 8006E944 0E80013C */  lui        $at, %hi(plr + 0x1B0)
    /* 5E948 8006E948 21082700 */  addu       $at, $at, $a3
    /* 5E94C 8006E94C E8A6248C */  lw         $a0, %lo(plr + 0x1B0)($at)
    /* 5E950 8006E950 0E80013C */  lui        $at, %hi(plr + 0x1B4)
    /* 5E954 8006E954 21082700 */  addu       $at, $at, $a3
    /* 5E958 8006E958 ECA6258C */  lw         $a1, %lo(plr + 0x1B4)($at)
    /* 5E95C 8006E95C 0E80013C */  lui        $at, %hi(plr + 0x1B8)
    /* 5E960 8006E960 21082700 */  addu       $at, $at, $a3
    /* 5E964 8006E964 F0A6268C */  lw         $a2, %lo(plr + 0x1B8)($at)
    /* 5E968 8006E968 0E80013C */  lui        $at, %hi(plr + 0x1BC)
    /* 5E96C 8006E96C 21082700 */  addu       $at, $at, $a3
    /* 5E970 8006E970 F4A6278C */  lw         $a3, %lo(plr + 0x1BC)($at)
    /* 5E974 8006E974 D2B9010C */  jal        AddStoreHoldId__FG10ItemStructi
    /* 5E978 8006E978 00000000 */   nop
  .L8006E97C:
    /* 5E97C 8006E97C 1280023C */  lui        $v0, %hi(myplr)
    /* 5E980 8006E980 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 5E984 8006E984 0E80103C */  lui        $s0, %hi(plr + 0x1B0)
    /* 5E988 8006E988 E8A61026 */  addiu      $s0, $s0, %lo(plr + 0x1B0)
    /* 5E98C 8006E98C 40200200 */  sll        $a0, $v0, 1
    /* 5E990 8006E990 21208200 */  addu       $a0, $a0, $v0
    /* 5E994 8006E994 80200400 */  sll        $a0, $a0, 2
    /* 5E998 8006E998 21208200 */  addu       $a0, $a0, $v0
    /* 5E99C 8006E99C 00210400 */  sll        $a0, $a0, 4
    /* 5E9A0 8006E9A0 23208200 */  subu       $a0, $a0, $v0
    /* 5E9A4 8006E9A4 80200400 */  sll        $a0, $a0, 2
    /* 5E9A8 8006E9A8 21208200 */  addu       $a0, $a0, $v0
    /* 5E9AC 8006E9AC C0200400 */  sll        $a0, $a0, 3
    /* 5E9B0 8006E9B0 21209000 */  addu       $a0, $a0, $s0
    /* 5E9B4 8006E9B4 C5B9010C */  jal        IdItemOk__FP10ItemStruct
    /* 5E9B8 8006E9B8 88028424 */   addiu     $a0, $a0, 0x288
    /* 5E9BC 8006E9BC FF004230 */  andi       $v0, $v0, 0xFF
    /* 5E9C0 8006E9C0 31004010 */  beqz       $v0, .L8006EA88
    /* 5E9C4 8006E9C4 1000A827 */   addiu     $t0, $sp, 0x10
    /* 5E9C8 8006E9C8 01001324 */  addiu      $s3, $zero, 0x1
    /* 5E9CC 8006E9CC 1280033C */  lui        $v1, %hi(myplr)
    /* 5E9D0 8006E9D0 08BA638C */  lw         $v1, %lo(myplr)($v1)
    /* 5E9D4 8006E9D4 FEFF0224 */  addiu      $v0, $zero, -0x2
    /* 5E9D8 8006E9D8 6C00A2AF */  sw         $v0, 0x6C($sp)
    /* 5E9DC 8006E9DC 40100300 */  sll        $v0, $v1, 1
    /* 5E9E0 8006E9E0 21104300 */  addu       $v0, $v0, $v1
    /* 5E9E4 8006E9E4 80100200 */  sll        $v0, $v0, 2
    /* 5E9E8 8006E9E8 21104300 */  addu       $v0, $v0, $v1
    /* 5E9EC 8006E9EC 00110200 */  sll        $v0, $v0, 4
    /* 5E9F0 8006E9F0 23104300 */  subu       $v0, $v0, $v1
    /* 5E9F4 8006E9F4 80100200 */  sll        $v0, $v0, 2
    /* 5E9F8 8006E9F8 21104300 */  addu       $v0, $v0, $v1
    /* 5E9FC 8006E9FC C0380200 */  sll        $a3, $v0, 3
    /* 5EA00 8006EA00 98020226 */  addiu      $v0, $s0, 0x298
    /* 5EA04 8006EA04 2130E200 */  addu       $a2, $a3, $v0
    /* 5EA08 8006EA08 5000C924 */  addiu      $t1, $a2, 0x50
  .L8006EA0C:
    /* 5EA0C 8006EA0C 0000C28C */  lw         $v0, 0x0($a2)
    /* 5EA10 8006EA10 0400C38C */  lw         $v1, 0x4($a2)
    /* 5EA14 8006EA14 0800C48C */  lw         $a0, 0x8($a2)
    /* 5EA18 8006EA18 0C00C58C */  lw         $a1, 0xC($a2)
    /* 5EA1C 8006EA1C 000002AD */  sw         $v0, 0x0($t0)
    /* 5EA20 8006EA20 040003AD */  sw         $v1, 0x4($t0)
    /* 5EA24 8006EA24 080004AD */  sw         $a0, 0x8($t0)
    /* 5EA28 8006EA28 0C0005AD */  sw         $a1, 0xC($t0)
    /* 5EA2C 8006EA2C 1000C624 */  addiu      $a2, $a2, 0x10
    /* 5EA30 8006EA30 F6FFC914 */  bne        $a2, $t1, .L8006EA0C
    /* 5EA34 8006EA34 10000825 */   addiu     $t0, $t0, 0x10
    /* 5EA38 8006EA38 0000C28C */  lw         $v0, 0x0($a2)
    /* 5EA3C 8006EA3C 0400C38C */  lw         $v1, 0x4($a2)
    /* 5EA40 8006EA40 0800C48C */  lw         $a0, 0x8($a2)
    /* 5EA44 8006EA44 000002AD */  sw         $v0, 0x0($t0)
    /* 5EA48 8006EA48 040003AD */  sw         $v1, 0x4($t0)
    /* 5EA4C 8006EA4C 080004AD */  sw         $a0, 0x8($t0)
    /* 5EA50 8006EA50 0E80013C */  lui        $at, %hi(plr + 0x438)
    /* 5EA54 8006EA54 21082700 */  addu       $at, $at, $a3
    /* 5EA58 8006EA58 70A9248C */  lw         $a0, %lo(plr + 0x438)($at)
    /* 5EA5C 8006EA5C 0E80013C */  lui        $at, %hi(plr + 0x43C)
    /* 5EA60 8006EA60 21082700 */  addu       $at, $at, $a3
    /* 5EA64 8006EA64 74A9258C */  lw         $a1, %lo(plr + 0x43C)($at)
    /* 5EA68 8006EA68 0E80013C */  lui        $at, %hi(plr + 0x440)
    /* 5EA6C 8006EA6C 21082700 */  addu       $at, $at, $a3
    /* 5EA70 8006EA70 78A9268C */  lw         $a2, %lo(plr + 0x440)($at)
    /* 5EA74 8006EA74 0E80013C */  lui        $at, %hi(plr + 0x444)
    /* 5EA78 8006EA78 21082700 */  addu       $at, $at, $a3
    /* 5EA7C 8006EA7C 7CA9278C */  lw         $a3, %lo(plr + 0x444)($at)
    /* 5EA80 8006EA80 D2B9010C */  jal        AddStoreHoldId__FG10ItemStructi
    /* 5EA84 8006EA84 00000000 */   nop
  .L8006EA88:
    /* 5EA88 8006EA88 1280023C */  lui        $v0, %hi(myplr)
    /* 5EA8C 8006EA8C 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 5EA90 8006EA90 0E80103C */  lui        $s0, %hi(plr + 0x1B0)
    /* 5EA94 8006EA94 E8A61026 */  addiu      $s0, $s0, %lo(plr + 0x1B0)
    /* 5EA98 8006EA98 40200200 */  sll        $a0, $v0, 1
    /* 5EA9C 8006EA9C 21208200 */  addu       $a0, $a0, $v0
    /* 5EAA0 8006EAA0 80200400 */  sll        $a0, $a0, 2
    /* 5EAA4 8006EAA4 21208200 */  addu       $a0, $a0, $v0
    /* 5EAA8 8006EAA8 00210400 */  sll        $a0, $a0, 4
    /* 5EAAC 8006EAAC 23208200 */  subu       $a0, $a0, $v0
    /* 5EAB0 8006EAB0 80200400 */  sll        $a0, $a0, 2
    /* 5EAB4 8006EAB4 21208200 */  addu       $a0, $a0, $v0
    /* 5EAB8 8006EAB8 C0200400 */  sll        $a0, $a0, 3
    /* 5EABC 8006EABC 21209000 */  addu       $a0, $a0, $s0
    /* 5EAC0 8006EAC0 C5B9010C */  jal        IdItemOk__FP10ItemStruct
    /* 5EAC4 8006EAC4 B0018424 */   addiu     $a0, $a0, 0x1B0
    /* 5EAC8 8006EAC8 FF004230 */  andi       $v0, $v0, 0xFF
    /* 5EACC 8006EACC 31004010 */  beqz       $v0, .L8006EB94
    /* 5EAD0 8006EAD0 1000A827 */   addiu     $t0, $sp, 0x10
    /* 5EAD4 8006EAD4 01001324 */  addiu      $s3, $zero, 0x1
    /* 5EAD8 8006EAD8 1280033C */  lui        $v1, %hi(myplr)
    /* 5EADC 8006EADC 08BA638C */  lw         $v1, %lo(myplr)($v1)
    /* 5EAE0 8006EAE0 FDFF0224 */  addiu      $v0, $zero, -0x3
    /* 5EAE4 8006EAE4 6C00A2AF */  sw         $v0, 0x6C($sp)
    /* 5EAE8 8006EAE8 40100300 */  sll        $v0, $v1, 1
    /* 5EAEC 8006EAEC 21104300 */  addu       $v0, $v0, $v1
    /* 5EAF0 8006EAF0 80100200 */  sll        $v0, $v0, 2
    /* 5EAF4 8006EAF4 21104300 */  addu       $v0, $v0, $v1
    /* 5EAF8 8006EAF8 00110200 */  sll        $v0, $v0, 4
    /* 5EAFC 8006EAFC 23104300 */  subu       $v0, $v0, $v1
    /* 5EB00 8006EB00 80100200 */  sll        $v0, $v0, 2
    /* 5EB04 8006EB04 21104300 */  addu       $v0, $v0, $v1
    /* 5EB08 8006EB08 C0380200 */  sll        $a3, $v0, 3
    /* 5EB0C 8006EB0C C0010226 */  addiu      $v0, $s0, 0x1C0
    /* 5EB10 8006EB10 2130E200 */  addu       $a2, $a3, $v0
    /* 5EB14 8006EB14 5000C924 */  addiu      $t1, $a2, 0x50
  .L8006EB18:
    /* 5EB18 8006EB18 0000C28C */  lw         $v0, 0x0($a2)
    /* 5EB1C 8006EB1C 0400C38C */  lw         $v1, 0x4($a2)
    /* 5EB20 8006EB20 0800C48C */  lw         $a0, 0x8($a2)
    /* 5EB24 8006EB24 0C00C58C */  lw         $a1, 0xC($a2)
    /* 5EB28 8006EB28 000002AD */  sw         $v0, 0x0($t0)
    /* 5EB2C 8006EB2C 040003AD */  sw         $v1, 0x4($t0)
    /* 5EB30 8006EB30 080004AD */  sw         $a0, 0x8($t0)
    /* 5EB34 8006EB34 0C0005AD */  sw         $a1, 0xC($t0)
    /* 5EB38 8006EB38 1000C624 */  addiu      $a2, $a2, 0x10
    /* 5EB3C 8006EB3C F6FFC914 */  bne        $a2, $t1, .L8006EB18
    /* 5EB40 8006EB40 10000825 */   addiu     $t0, $t0, 0x10
    /* 5EB44 8006EB44 0000C28C */  lw         $v0, 0x0($a2)
    /* 5EB48 8006EB48 0400C38C */  lw         $v1, 0x4($a2)
    /* 5EB4C 8006EB4C 0800C48C */  lw         $a0, 0x8($a2)
    /* 5EB50 8006EB50 000002AD */  sw         $v0, 0x0($t0)
    /* 5EB54 8006EB54 040003AD */  sw         $v1, 0x4($t0)
    /* 5EB58 8006EB58 080004AD */  sw         $a0, 0x8($t0)
    /* 5EB5C 8006EB5C 0E80013C */  lui        $at, %hi(plr + 0x360)
    /* 5EB60 8006EB60 21082700 */  addu       $at, $at, $a3
    /* 5EB64 8006EB64 98A8248C */  lw         $a0, %lo(plr + 0x360)($at)
    /* 5EB68 8006EB68 0E80013C */  lui        $at, %hi(plr + 0x364)
    /* 5EB6C 8006EB6C 21082700 */  addu       $at, $at, $a3
    /* 5EB70 8006EB70 9CA8258C */  lw         $a1, %lo(plr + 0x364)($at)
    /* 5EB74 8006EB74 0E80013C */  lui        $at, %hi(plr + 0x368)
    /* 5EB78 8006EB78 21082700 */  addu       $at, $at, $a3
    /* 5EB7C 8006EB7C A0A8268C */  lw         $a2, %lo(plr + 0x368)($at)
    /* 5EB80 8006EB80 0E80013C */  lui        $at, %hi(plr + 0x36C)
    /* 5EB84 8006EB84 21082700 */  addu       $at, $at, $a3
    /* 5EB88 8006EB88 A4A8278C */  lw         $a3, %lo(plr + 0x36C)($at)
    /* 5EB8C 8006EB8C D2B9010C */  jal        AddStoreHoldId__FG10ItemStructi
    /* 5EB90 8006EB90 00000000 */   nop
  .L8006EB94:
    /* 5EB94 8006EB94 1280023C */  lui        $v0, %hi(myplr)
    /* 5EB98 8006EB98 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 5EB9C 8006EB9C 0E80103C */  lui        $s0, %hi(plr + 0x1B0)
    /* 5EBA0 8006EBA0 E8A61026 */  addiu      $s0, $s0, %lo(plr + 0x1B0)
    /* 5EBA4 8006EBA4 40200200 */  sll        $a0, $v0, 1
    /* 5EBA8 8006EBA8 21208200 */  addu       $a0, $a0, $v0
    /* 5EBAC 8006EBAC 80200400 */  sll        $a0, $a0, 2
    /* 5EBB0 8006EBB0 21208200 */  addu       $a0, $a0, $v0
    /* 5EBB4 8006EBB4 00210400 */  sll        $a0, $a0, 4
    /* 5EBB8 8006EBB8 23208200 */  subu       $a0, $a0, $v0
    /* 5EBBC 8006EBBC 80200400 */  sll        $a0, $a0, 2
    /* 5EBC0 8006EBC0 21208200 */  addu       $a0, $a0, $v0
    /* 5EBC4 8006EBC4 C0200400 */  sll        $a0, $a0, 3
    /* 5EBC8 8006EBC8 21209000 */  addu       $a0, $a0, $s0
    /* 5EBCC 8006EBCC C5B9010C */  jal        IdItemOk__FP10ItemStruct
    /* 5EBD0 8006EBD0 1C028424 */   addiu     $a0, $a0, 0x21C
    /* 5EBD4 8006EBD4 FF004230 */  andi       $v0, $v0, 0xFF
    /* 5EBD8 8006EBD8 31004010 */  beqz       $v0, .L8006ECA0
    /* 5EBDC 8006EBDC 1000A827 */   addiu     $t0, $sp, 0x10
    /* 5EBE0 8006EBE0 01001324 */  addiu      $s3, $zero, 0x1
    /* 5EBE4 8006EBE4 1280033C */  lui        $v1, %hi(myplr)
    /* 5EBE8 8006EBE8 08BA638C */  lw         $v1, %lo(myplr)($v1)
    /* 5EBEC 8006EBEC FCFF0224 */  addiu      $v0, $zero, -0x4
    /* 5EBF0 8006EBF0 6C00A2AF */  sw         $v0, 0x6C($sp)
    /* 5EBF4 8006EBF4 40100300 */  sll        $v0, $v1, 1
    /* 5EBF8 8006EBF8 21104300 */  addu       $v0, $v0, $v1
    /* 5EBFC 8006EBFC 80100200 */  sll        $v0, $v0, 2
    /* 5EC00 8006EC00 21104300 */  addu       $v0, $v0, $v1
    /* 5EC04 8006EC04 00110200 */  sll        $v0, $v0, 4
    /* 5EC08 8006EC08 23104300 */  subu       $v0, $v0, $v1
    /* 5EC0C 8006EC0C 80100200 */  sll        $v0, $v0, 2
    /* 5EC10 8006EC10 21104300 */  addu       $v0, $v0, $v1
    /* 5EC14 8006EC14 C0380200 */  sll        $a3, $v0, 3
    /* 5EC18 8006EC18 2C020226 */  addiu      $v0, $s0, 0x22C
    /* 5EC1C 8006EC1C 2130E200 */  addu       $a2, $a3, $v0
    /* 5EC20 8006EC20 5000C924 */  addiu      $t1, $a2, 0x50
  .L8006EC24:
    /* 5EC24 8006EC24 0000C28C */  lw         $v0, 0x0($a2)
    /* 5EC28 8006EC28 0400C38C */  lw         $v1, 0x4($a2)
    /* 5EC2C 8006EC2C 0800C48C */  lw         $a0, 0x8($a2)
    /* 5EC30 8006EC30 0C00C58C */  lw         $a1, 0xC($a2)
    /* 5EC34 8006EC34 000002AD */  sw         $v0, 0x0($t0)
    /* 5EC38 8006EC38 040003AD */  sw         $v1, 0x4($t0)
    /* 5EC3C 8006EC3C 080004AD */  sw         $a0, 0x8($t0)
    /* 5EC40 8006EC40 0C0005AD */  sw         $a1, 0xC($t0)
    /* 5EC44 8006EC44 1000C624 */  addiu      $a2, $a2, 0x10
    /* 5EC48 8006EC48 F6FFC914 */  bne        $a2, $t1, .L8006EC24
    /* 5EC4C 8006EC4C 10000825 */   addiu     $t0, $t0, 0x10
    /* 5EC50 8006EC50 0000C28C */  lw         $v0, 0x0($a2)
    /* 5EC54 8006EC54 0400C38C */  lw         $v1, 0x4($a2)
    /* 5EC58 8006EC58 0800C48C */  lw         $a0, 0x8($a2)
    /* 5EC5C 8006EC5C 000002AD */  sw         $v0, 0x0($t0)
    /* 5EC60 8006EC60 040003AD */  sw         $v1, 0x4($t0)
    /* 5EC64 8006EC64 080004AD */  sw         $a0, 0x8($t0)
    /* 5EC68 8006EC68 0E80013C */  lui        $at, %hi(plr + 0x3CC)
    /* 5EC6C 8006EC6C 21082700 */  addu       $at, $at, $a3
    /* 5EC70 8006EC70 04A9248C */  lw         $a0, %lo(plr + 0x3CC)($at)
    /* 5EC74 8006EC74 0E80013C */  lui        $at, %hi(plr + 0x3D0)
    /* 5EC78 8006EC78 21082700 */  addu       $at, $at, $a3
    /* 5EC7C 8006EC7C 08A9258C */  lw         $a1, %lo(plr + 0x3D0)($at)
    /* 5EC80 8006EC80 0E80013C */  lui        $at, %hi(plr + 0x3D4)
    /* 5EC84 8006EC84 21082700 */  addu       $at, $at, $a3
    /* 5EC88 8006EC88 0CA9268C */  lw         $a2, %lo(plr + 0x3D4)($at)
    /* 5EC8C 8006EC8C 0E80013C */  lui        $at, %hi(plr + 0x3D8)
    /* 5EC90 8006EC90 21082700 */  addu       $at, $at, $a3
    /* 5EC94 8006EC94 10A9278C */  lw         $a3, %lo(plr + 0x3D8)($at)
    /* 5EC98 8006EC98 D2B9010C */  jal        AddStoreHoldId__FG10ItemStructi
    /* 5EC9C 8006EC9C 00000000 */   nop
  .L8006ECA0:
    /* 5ECA0 8006ECA0 1280023C */  lui        $v0, %hi(myplr)
    /* 5ECA4 8006ECA4 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 5ECA8 8006ECA8 0E80103C */  lui        $s0, %hi(plr + 0x1B0)
    /* 5ECAC 8006ECAC E8A61026 */  addiu      $s0, $s0, %lo(plr + 0x1B0)
    /* 5ECB0 8006ECB0 40200200 */  sll        $a0, $v0, 1
    /* 5ECB4 8006ECB4 21208200 */  addu       $a0, $a0, $v0
    /* 5ECB8 8006ECB8 80200400 */  sll        $a0, $a0, 2
    /* 5ECBC 8006ECBC 21208200 */  addu       $a0, $a0, $v0
    /* 5ECC0 8006ECC0 00210400 */  sll        $a0, $a0, 4
    /* 5ECC4 8006ECC4 23208200 */  subu       $a0, $a0, $v0
    /* 5ECC8 8006ECC8 80200400 */  sll        $a0, $a0, 2
    /* 5ECCC 8006ECCC 21208200 */  addu       $a0, $a0, $v0
    /* 5ECD0 8006ECD0 C0200400 */  sll        $a0, $a0, 3
    /* 5ECD4 8006ECD4 21209000 */  addu       $a0, $a0, $s0
    /* 5ECD8 8006ECD8 C5B9010C */  jal        IdItemOk__FP10ItemStruct
    /* 5ECDC 8006ECDC 6C008424 */   addiu     $a0, $a0, 0x6C
    /* 5ECE0 8006ECE0 FF004230 */  andi       $v0, $v0, 0xFF
    /* 5ECE4 8006ECE4 31004010 */  beqz       $v0, .L8006EDAC
    /* 5ECE8 8006ECE8 1000A827 */   addiu     $t0, $sp, 0x10
    /* 5ECEC 8006ECEC 01001324 */  addiu      $s3, $zero, 0x1
    /* 5ECF0 8006ECF0 1280033C */  lui        $v1, %hi(myplr)
    /* 5ECF4 8006ECF4 08BA638C */  lw         $v1, %lo(myplr)($v1)
    /* 5ECF8 8006ECF8 FBFF0224 */  addiu      $v0, $zero, -0x5
    /* 5ECFC 8006ECFC 6C00A2AF */  sw         $v0, 0x6C($sp)
    /* 5ED00 8006ED00 40100300 */  sll        $v0, $v1, 1
    /* 5ED04 8006ED04 21104300 */  addu       $v0, $v0, $v1
    /* 5ED08 8006ED08 80100200 */  sll        $v0, $v0, 2
    /* 5ED0C 8006ED0C 21104300 */  addu       $v0, $v0, $v1
    /* 5ED10 8006ED10 00110200 */  sll        $v0, $v0, 4
    /* 5ED14 8006ED14 23104300 */  subu       $v0, $v0, $v1
    /* 5ED18 8006ED18 80100200 */  sll        $v0, $v0, 2
    /* 5ED1C 8006ED1C 21104300 */  addu       $v0, $v0, $v1
    /* 5ED20 8006ED20 C0380200 */  sll        $a3, $v0, 3
    /* 5ED24 8006ED24 7C000226 */  addiu      $v0, $s0, 0x7C
    /* 5ED28 8006ED28 2130E200 */  addu       $a2, $a3, $v0
    /* 5ED2C 8006ED2C 5000C924 */  addiu      $t1, $a2, 0x50
  .L8006ED30:
    /* 5ED30 8006ED30 0000C28C */  lw         $v0, 0x0($a2)
    /* 5ED34 8006ED34 0400C38C */  lw         $v1, 0x4($a2)
    /* 5ED38 8006ED38 0800C48C */  lw         $a0, 0x8($a2)
    /* 5ED3C 8006ED3C 0C00C58C */  lw         $a1, 0xC($a2)
    /* 5ED40 8006ED40 000002AD */  sw         $v0, 0x0($t0)
    /* 5ED44 8006ED44 040003AD */  sw         $v1, 0x4($t0)
    /* 5ED48 8006ED48 080004AD */  sw         $a0, 0x8($t0)
    /* 5ED4C 8006ED4C 0C0005AD */  sw         $a1, 0xC($t0)
    /* 5ED50 8006ED50 1000C624 */  addiu      $a2, $a2, 0x10
    /* 5ED54 8006ED54 F6FFC914 */  bne        $a2, $t1, .L8006ED30
    /* 5ED58 8006ED58 10000825 */   addiu     $t0, $t0, 0x10
    /* 5ED5C 8006ED5C 0000C28C */  lw         $v0, 0x0($a2)
    /* 5ED60 8006ED60 0400C38C */  lw         $v1, 0x4($a2)
    /* 5ED64 8006ED64 0800C48C */  lw         $a0, 0x8($a2)
    /* 5ED68 8006ED68 000002AD */  sw         $v0, 0x0($t0)
    /* 5ED6C 8006ED6C 040003AD */  sw         $v1, 0x4($t0)
    /* 5ED70 8006ED70 080004AD */  sw         $a0, 0x8($t0)
    /* 5ED74 8006ED74 0E80013C */  lui        $at, %hi(plr + 0x21C)
    /* 5ED78 8006ED78 21082700 */  addu       $at, $at, $a3
    /* 5ED7C 8006ED7C 54A7248C */  lw         $a0, %lo(plr + 0x21C)($at)
    /* 5ED80 8006ED80 0E80013C */  lui        $at, %hi(plr + 0x220)
    /* 5ED84 8006ED84 21082700 */  addu       $at, $at, $a3
    /* 5ED88 8006ED88 58A7258C */  lw         $a1, %lo(plr + 0x220)($at)
    /* 5ED8C 8006ED8C 0E80013C */  lui        $at, %hi(plr + 0x224)
    /* 5ED90 8006ED90 21082700 */  addu       $at, $at, $a3
    /* 5ED94 8006ED94 5CA7268C */  lw         $a2, %lo(plr + 0x224)($at)
    /* 5ED98 8006ED98 0E80013C */  lui        $at, %hi(plr + 0x228)
    /* 5ED9C 8006ED9C 21082700 */  addu       $at, $at, $a3
    /* 5EDA0 8006EDA0 60A7278C */  lw         $a3, %lo(plr + 0x228)($at)
    /* 5EDA4 8006EDA4 D2B9010C */  jal        AddStoreHoldId__FG10ItemStructi
    /* 5EDA8 8006EDA8 00000000 */   nop
  .L8006EDAC:
    /* 5EDAC 8006EDAC 1280023C */  lui        $v0, %hi(myplr)
    /* 5EDB0 8006EDB0 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 5EDB4 8006EDB4 0E80103C */  lui        $s0, %hi(plr + 0x1B0)
    /* 5EDB8 8006EDB8 E8A61026 */  addiu      $s0, $s0, %lo(plr + 0x1B0)
    /* 5EDBC 8006EDBC 40200200 */  sll        $a0, $v0, 1
    /* 5EDC0 8006EDC0 21208200 */  addu       $a0, $a0, $v0
    /* 5EDC4 8006EDC4 80200400 */  sll        $a0, $a0, 2
    /* 5EDC8 8006EDC8 21208200 */  addu       $a0, $a0, $v0
    /* 5EDCC 8006EDCC 00210400 */  sll        $a0, $a0, 4
    /* 5EDD0 8006EDD0 23208200 */  subu       $a0, $a0, $v0
    /* 5EDD4 8006EDD4 80200400 */  sll        $a0, $a0, 2
    /* 5EDD8 8006EDD8 21208200 */  addu       $a0, $a0, $v0
    /* 5EDDC 8006EDDC C0200400 */  sll        $a0, $a0, 3
    /* 5EDE0 8006EDE0 21209000 */  addu       $a0, $a0, $s0
    /* 5EDE4 8006EDE4 C5B9010C */  jal        IdItemOk__FP10ItemStruct
    /* 5EDE8 8006EDE8 D8008424 */   addiu     $a0, $a0, 0xD8
    /* 5EDEC 8006EDEC FF004230 */  andi       $v0, $v0, 0xFF
    /* 5EDF0 8006EDF0 31004010 */  beqz       $v0, .L8006EEB8
    /* 5EDF4 8006EDF4 1000A827 */   addiu     $t0, $sp, 0x10
    /* 5EDF8 8006EDF8 01001324 */  addiu      $s3, $zero, 0x1
    /* 5EDFC 8006EDFC 1280033C */  lui        $v1, %hi(myplr)
    /* 5EE00 8006EE00 08BA638C */  lw         $v1, %lo(myplr)($v1)
    /* 5EE04 8006EE04 FAFF0224 */  addiu      $v0, $zero, -0x6
    /* 5EE08 8006EE08 6C00A2AF */  sw         $v0, 0x6C($sp)
    /* 5EE0C 8006EE0C 40100300 */  sll        $v0, $v1, 1
    /* 5EE10 8006EE10 21104300 */  addu       $v0, $v0, $v1
    /* 5EE14 8006EE14 80100200 */  sll        $v0, $v0, 2
    /* 5EE18 8006EE18 21104300 */  addu       $v0, $v0, $v1
    /* 5EE1C 8006EE1C 00110200 */  sll        $v0, $v0, 4
    /* 5EE20 8006EE20 23104300 */  subu       $v0, $v0, $v1
    /* 5EE24 8006EE24 80100200 */  sll        $v0, $v0, 2
    /* 5EE28 8006EE28 21104300 */  addu       $v0, $v0, $v1
    /* 5EE2C 8006EE2C C0380200 */  sll        $a3, $v0, 3
    /* 5EE30 8006EE30 E8000226 */  addiu      $v0, $s0, 0xE8
    /* 5EE34 8006EE34 2130E200 */  addu       $a2, $a3, $v0
    /* 5EE38 8006EE38 5000C924 */  addiu      $t1, $a2, 0x50
  .L8006EE3C:
    /* 5EE3C 8006EE3C 0000C28C */  lw         $v0, 0x0($a2)
    /* 5EE40 8006EE40 0400C38C */  lw         $v1, 0x4($a2)
    /* 5EE44 8006EE44 0800C48C */  lw         $a0, 0x8($a2)
    /* 5EE48 8006EE48 0C00C58C */  lw         $a1, 0xC($a2)
    /* 5EE4C 8006EE4C 000002AD */  sw         $v0, 0x0($t0)
    /* 5EE50 8006EE50 040003AD */  sw         $v1, 0x4($t0)
    /* 5EE54 8006EE54 080004AD */  sw         $a0, 0x8($t0)
    /* 5EE58 8006EE58 0C0005AD */  sw         $a1, 0xC($t0)
    /* 5EE5C 8006EE5C 1000C624 */  addiu      $a2, $a2, 0x10
    /* 5EE60 8006EE60 F6FFC914 */  bne        $a2, $t1, .L8006EE3C
    /* 5EE64 8006EE64 10000825 */   addiu     $t0, $t0, 0x10
    /* 5EE68 8006EE68 0000C28C */  lw         $v0, 0x0($a2)
    /* 5EE6C 8006EE6C 0400C38C */  lw         $v1, 0x4($a2)
    /* 5EE70 8006EE70 0800C48C */  lw         $a0, 0x8($a2)
    /* 5EE74 8006EE74 000002AD */  sw         $v0, 0x0($t0)
    /* 5EE78 8006EE78 040003AD */  sw         $v1, 0x4($t0)
    /* 5EE7C 8006EE7C 080004AD */  sw         $a0, 0x8($t0)
    /* 5EE80 8006EE80 0E80013C */  lui        $at, %hi(plr + 0x288)
    /* 5EE84 8006EE84 21082700 */  addu       $at, $at, $a3
    /* 5EE88 8006EE88 C0A7248C */  lw         $a0, %lo(plr + 0x288)($at)
    /* 5EE8C 8006EE8C 0E80013C */  lui        $at, %hi(plr + 0x28C)
    /* 5EE90 8006EE90 21082700 */  addu       $at, $at, $a3
    /* 5EE94 8006EE94 C4A7258C */  lw         $a1, %lo(plr + 0x28C)($at)
    /* 5EE98 8006EE98 0E80013C */  lui        $at, %hi(plr + 0x290)
    /* 5EE9C 8006EE9C 21082700 */  addu       $at, $at, $a3
    /* 5EEA0 8006EEA0 C8A7268C */  lw         $a2, %lo(plr + 0x290)($at)
    /* 5EEA4 8006EEA4 0E80013C */  lui        $at, %hi(plr + 0x294)
    /* 5EEA8 8006EEA8 21082700 */  addu       $at, $at, $a3
    /* 5EEAC 8006EEAC CCA7278C */  lw         $a3, %lo(plr + 0x294)($at)
    /* 5EEB0 8006EEB0 D2B9010C */  jal        AddStoreHoldId__FG10ItemStructi
    /* 5EEB4 8006EEB4 00000000 */   nop
  .L8006EEB8:
    /* 5EEB8 8006EEB8 1280023C */  lui        $v0, %hi(myplr)
    /* 5EEBC 8006EEBC 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 5EEC0 8006EEC0 0E80103C */  lui        $s0, %hi(plr + 0x1B0)
    /* 5EEC4 8006EEC4 E8A61026 */  addiu      $s0, $s0, %lo(plr + 0x1B0)
    /* 5EEC8 8006EEC8 40200200 */  sll        $a0, $v0, 1
    /* 5EECC 8006EECC 21208200 */  addu       $a0, $a0, $v0
    /* 5EED0 8006EED0 80200400 */  sll        $a0, $a0, 2
    /* 5EED4 8006EED4 21208200 */  addu       $a0, $a0, $v0
    /* 5EED8 8006EED8 00210400 */  sll        $a0, $a0, 4
    /* 5EEDC 8006EEDC 23208200 */  subu       $a0, $a0, $v0
    /* 5EEE0 8006EEE0 80200400 */  sll        $a0, $a0, 2
    /* 5EEE4 8006EEE4 21208200 */  addu       $a0, $a0, $v0
    /* 5EEE8 8006EEE8 C0200400 */  sll        $a0, $a0, 3
    /* 5EEEC 8006EEEC 21209000 */  addu       $a0, $a0, $s0
    /* 5EEF0 8006EEF0 C5B9010C */  jal        IdItemOk__FP10ItemStruct
    /* 5EEF4 8006EEF4 44018424 */   addiu     $a0, $a0, 0x144
    /* 5EEF8 8006EEF8 FF004230 */  andi       $v0, $v0, 0xFF
    /* 5EEFC 8006EEFC 31004010 */  beqz       $v0, .L8006EFC4
    /* 5EF00 8006EF00 1000A827 */   addiu     $t0, $sp, 0x10
    /* 5EF04 8006EF04 01001324 */  addiu      $s3, $zero, 0x1
    /* 5EF08 8006EF08 1280033C */  lui        $v1, %hi(myplr)
    /* 5EF0C 8006EF0C 08BA638C */  lw         $v1, %lo(myplr)($v1)
    /* 5EF10 8006EF10 F9FF0224 */  addiu      $v0, $zero, -0x7
    /* 5EF14 8006EF14 6C00A2AF */  sw         $v0, 0x6C($sp)
    /* 5EF18 8006EF18 40100300 */  sll        $v0, $v1, 1
    /* 5EF1C 8006EF1C 21104300 */  addu       $v0, $v0, $v1
    /* 5EF20 8006EF20 80100200 */  sll        $v0, $v0, 2
    /* 5EF24 8006EF24 21104300 */  addu       $v0, $v0, $v1
    /* 5EF28 8006EF28 00110200 */  sll        $v0, $v0, 4
    /* 5EF2C 8006EF2C 23104300 */  subu       $v0, $v0, $v1
    /* 5EF30 8006EF30 80100200 */  sll        $v0, $v0, 2
    /* 5EF34 8006EF34 21104300 */  addu       $v0, $v0, $v1
    /* 5EF38 8006EF38 C0380200 */  sll        $a3, $v0, 3
    /* 5EF3C 8006EF3C 54010226 */  addiu      $v0, $s0, 0x154
    /* 5EF40 8006EF40 2130E200 */  addu       $a2, $a3, $v0
    /* 5EF44 8006EF44 5000C924 */  addiu      $t1, $a2, 0x50
  .L8006EF48:
    /* 5EF48 8006EF48 0000C28C */  lw         $v0, 0x0($a2)
    /* 5EF4C 8006EF4C 0400C38C */  lw         $v1, 0x4($a2)
    /* 5EF50 8006EF50 0800C48C */  lw         $a0, 0x8($a2)
    /* 5EF54 8006EF54 0C00C58C */  lw         $a1, 0xC($a2)
    /* 5EF58 8006EF58 000002AD */  sw         $v0, 0x0($t0)
    /* 5EF5C 8006EF5C 040003AD */  sw         $v1, 0x4($t0)
    /* 5EF60 8006EF60 080004AD */  sw         $a0, 0x8($t0)
    /* 5EF64 8006EF64 0C0005AD */  sw         $a1, 0xC($t0)
    /* 5EF68 8006EF68 1000C624 */  addiu      $a2, $a2, 0x10
    /* 5EF6C 8006EF6C F6FFC914 */  bne        $a2, $t1, .L8006EF48
    /* 5EF70 8006EF70 10000825 */   addiu     $t0, $t0, 0x10
    /* 5EF74 8006EF74 0000C28C */  lw         $v0, 0x0($a2)
    /* 5EF78 8006EF78 0400C38C */  lw         $v1, 0x4($a2)
    /* 5EF7C 8006EF7C 0800C48C */  lw         $a0, 0x8($a2)
    /* 5EF80 8006EF80 000002AD */  sw         $v0, 0x0($t0)
    /* 5EF84 8006EF84 040003AD */  sw         $v1, 0x4($t0)
    /* 5EF88 8006EF88 080004AD */  sw         $a0, 0x8($t0)
    /* 5EF8C 8006EF8C 0E80013C */  lui        $at, %hi(plr + 0x2F4)
    /* 5EF90 8006EF90 21082700 */  addu       $at, $at, $a3
    /* 5EF94 8006EF94 2CA8248C */  lw         $a0, %lo(plr + 0x2F4)($at)
    /* 5EF98 8006EF98 0E80013C */  lui        $at, %hi(plr + 0x2F8)
    /* 5EF9C 8006EF9C 21082700 */  addu       $at, $at, $a3
    /* 5EFA0 8006EFA0 30A8258C */  lw         $a1, %lo(plr + 0x2F8)($at)
    /* 5EFA4 8006EFA4 0E80013C */  lui        $at, %hi(plr + 0x2FC)
    /* 5EFA8 8006EFA8 21082700 */  addu       $at, $at, $a3
    /* 5EFAC 8006EFAC 34A8268C */  lw         $a2, %lo(plr + 0x2FC)($at)
    /* 5EFB0 8006EFB0 0E80013C */  lui        $at, %hi(plr + 0x300)
    /* 5EFB4 8006EFB4 21082700 */  addu       $at, $at, $a3
    /* 5EFB8 8006EFB8 38A8278C */  lw         $a3, %lo(plr + 0x300)($at)
    /* 5EFBC 8006EFBC D2B9010C */  jal        AddStoreHoldId__FG10ItemStructi
    /* 5EFC0 8006EFC0 00000000 */   nop
  .L8006EFC4:
    /* 5EFC4 8006EFC4 1280033C */  lui        $v1, %hi(myplr)
    /* 5EFC8 8006EFC8 08BA638C */  lw         $v1, %lo(myplr)($v1)
    /* 5EFCC 8006EFCC 00000000 */  nop
    /* 5EFD0 8006EFD0 40100300 */  sll        $v0, $v1, 1
    /* 5EFD4 8006EFD4 21104300 */  addu       $v0, $v0, $v1
    /* 5EFD8 8006EFD8 80100200 */  sll        $v0, $v0, 2
    /* 5EFDC 8006EFDC 21104300 */  addu       $v0, $v0, $v1
    /* 5EFE0 8006EFE0 00110200 */  sll        $v0, $v0, 4
    /* 5EFE4 8006EFE4 23104300 */  subu       $v0, $v0, $v1
    /* 5EFE8 8006EFE8 80100200 */  sll        $v0, $v0, 2
    /* 5EFEC 8006EFEC 21104300 */  addu       $v0, $v0, $v1
    /* 5EFF0 8006EFF0 C0100200 */  sll        $v0, $v0, 3
    /* 5EFF4 8006EFF4 0E80013C */  lui        $at, %hi(plr + 0x1584)
    /* 5EFF8 8006EFF8 21082200 */  addu       $at, $at, $v0
    /* 5EFFC 8006EFFC BCBA228C */  lw         $v0, %lo(plr + 0x1584)($at)
    /* 5F000 8006F000 00000000 */  nop
    /* 5F004 8006F004 4E004018 */  blez       $v0, .L8006F140
    /* 5F008 8006F008 21800000 */   addu      $s0, $zero, $zero
    /* 5F00C 8006F00C 0E80123C */  lui        $s2, %hi(plr + 0x4A4)
    /* 5F010 8006F010 DCA95226 */  addiu      $s2, $s2, %lo(plr + 0x4A4)
    /* 5F014 8006F014 21880000 */  addu       $s1, $zero, $zero
  .L8006F018:
    /* 5F018 8006F018 40200300 */  sll        $a0, $v1, 1
    /* 5F01C 8006F01C 21208300 */  addu       $a0, $a0, $v1
    /* 5F020 8006F020 80200400 */  sll        $a0, $a0, 2
    /* 5F024 8006F024 21208300 */  addu       $a0, $a0, $v1
    /* 5F028 8006F028 00210400 */  sll        $a0, $a0, 4
    /* 5F02C 8006F02C 23208300 */  subu       $a0, $a0, $v1
    /* 5F030 8006F030 80200400 */  sll        $a0, $a0, 2
    /* 5F034 8006F034 21208300 */  addu       $a0, $a0, $v1
    /* 5F038 8006F038 C0200400 */  sll        $a0, $a0, 3
    /* 5F03C 8006F03C 21209200 */  addu       $a0, $a0, $s2
    /* 5F040 8006F040 C5B9010C */  jal        IdItemOk__FP10ItemStruct
    /* 5F044 8006F044 21209100 */   addu      $a0, $a0, $s1
    /* 5F048 8006F048 FF004230 */  andi       $v0, $v0, 0xFF
    /* 5F04C 8006F04C 29004010 */  beqz       $v0, .L8006F0F4
    /* 5F050 8006F050 1000A927 */   addiu     $t1, $sp, 0x10
    /* 5F054 8006F054 01001324 */  addiu      $s3, $zero, 0x1
    /* 5F058 8006F058 1280033C */  lui        $v1, %hi(myplr)
    /* 5F05C 8006F05C 08BA638C */  lw         $v1, %lo(myplr)($v1)
    /* 5F060 8006F060 6C00B0AF */  sw         $s0, 0x6C($sp)
    /* 5F064 8006F064 40100300 */  sll        $v0, $v1, 1
    /* 5F068 8006F068 21104300 */  addu       $v0, $v0, $v1
    /* 5F06C 8006F06C 80100200 */  sll        $v0, $v0, 2
    /* 5F070 8006F070 21104300 */  addu       $v0, $v0, $v1
    /* 5F074 8006F074 00110200 */  sll        $v0, $v0, 4
    /* 5F078 8006F078 23104300 */  subu       $v0, $v0, $v1
    /* 5F07C 8006F07C 80100200 */  sll        $v0, $v0, 2
    /* 5F080 8006F080 21104300 */  addu       $v0, $v0, $v1
    /* 5F084 8006F084 C0100200 */  sll        $v0, $v0, 3
    /* 5F088 8006F088 21105200 */  addu       $v0, $v0, $s2
    /* 5F08C 8006F08C 21382202 */  addu       $a3, $s1, $v0
    /* 5F090 8006F090 1000E624 */  addiu      $a2, $a3, 0x10
    /* 5F094 8006F094 6000E824 */  addiu      $t0, $a3, 0x60
  .L8006F098:
    /* 5F098 8006F098 0000C28C */  lw         $v0, 0x0($a2)
    /* 5F09C 8006F09C 0400C38C */  lw         $v1, 0x4($a2)
    /* 5F0A0 8006F0A0 0800C48C */  lw         $a0, 0x8($a2)
    /* 5F0A4 8006F0A4 0C00C58C */  lw         $a1, 0xC($a2)
    /* 5F0A8 8006F0A8 000022AD */  sw         $v0, 0x0($t1)
    /* 5F0AC 8006F0AC 040023AD */  sw         $v1, 0x4($t1)
    /* 5F0B0 8006F0B0 080024AD */  sw         $a0, 0x8($t1)
    /* 5F0B4 8006F0B4 0C0025AD */  sw         $a1, 0xC($t1)
    /* 5F0B8 8006F0B8 1000C624 */  addiu      $a2, $a2, 0x10
    /* 5F0BC 8006F0BC F6FFC814 */  bne        $a2, $t0, .L8006F098
    /* 5F0C0 8006F0C0 10002925 */   addiu     $t1, $t1, 0x10
    /* 5F0C4 8006F0C4 0000C28C */  lw         $v0, 0x0($a2)
    /* 5F0C8 8006F0C8 0400C38C */  lw         $v1, 0x4($a2)
    /* 5F0CC 8006F0CC 0800C48C */  lw         $a0, 0x8($a2)
    /* 5F0D0 8006F0D0 000022AD */  sw         $v0, 0x0($t1)
    /* 5F0D4 8006F0D4 040023AD */  sw         $v1, 0x4($t1)
    /* 5F0D8 8006F0D8 080024AD */  sw         $a0, 0x8($t1)
    /* 5F0DC 8006F0DC 0000E48C */  lw         $a0, 0x0($a3)
    /* 5F0E0 8006F0E0 0400E58C */  lw         $a1, 0x4($a3)
    /* 5F0E4 8006F0E4 0800E68C */  lw         $a2, 0x8($a3)
    /* 5F0E8 8006F0E8 0C00E78C */  lw         $a3, 0xC($a3)
    /* 5F0EC 8006F0EC D2B9010C */  jal        AddStoreHoldId__FG10ItemStructi
    /* 5F0F0 8006F0F0 00000000 */   nop
  .L8006F0F4:
    /* 5F0F4 8006F0F4 1280033C */  lui        $v1, %hi(myplr)
    /* 5F0F8 8006F0F8 08BA638C */  lw         $v1, %lo(myplr)($v1)
    /* 5F0FC 8006F0FC 00000000 */  nop
    /* 5F100 8006F100 40100300 */  sll        $v0, $v1, 1
    /* 5F104 8006F104 21104300 */  addu       $v0, $v0, $v1
    /* 5F108 8006F108 80100200 */  sll        $v0, $v0, 2
    /* 5F10C 8006F10C 21104300 */  addu       $v0, $v0, $v1
    /* 5F110 8006F110 00110200 */  sll        $v0, $v0, 4
    /* 5F114 8006F114 23104300 */  subu       $v0, $v0, $v1
    /* 5F118 8006F118 80100200 */  sll        $v0, $v0, 2
    /* 5F11C 8006F11C 21104300 */  addu       $v0, $v0, $v1
    /* 5F120 8006F120 C0100200 */  sll        $v0, $v0, 3
    /* 5F124 8006F124 0E80013C */  lui        $at, %hi(plr + 0x1584)
    /* 5F128 8006F128 21082200 */  addu       $at, $at, $v0
    /* 5F12C 8006F12C BCBA228C */  lw         $v0, %lo(plr + 0x1584)($at)
    /* 5F130 8006F130 01001026 */  addiu      $s0, $s0, 0x1
    /* 5F134 8006F134 2A100202 */  slt        $v0, $s0, $v0
    /* 5F138 8006F138 B7FF4014 */  bnez       $v0, .L8006F018
    /* 5F13C 8006F13C 6C003126 */   addiu     $s1, $s1, 0x6C
  .L8006F140:
    /* 5F140 8006F140 FF006232 */  andi       $v0, $s3, 0xFF
    /* 5F144 8006F144 23004014 */  bnez       $v0, .L8006F1D4
    /* 5F148 8006F148 00000000 */   nop
    /* 5F14C 8006F14C 621380A3 */  sb         $zero, %gp_rel(stextscrl)($gp)
    /* 5F150 8006F150 4AED010C */  jal        GetStr__Fi
    /* 5F154 8006F154 EC040424 */   addiu     $a0, $zero, 0x4EC
    /* 5F158 8006F158 0D80103C */  lui        $s0, %hi(tempstr)
    /* 5F15C 8006F15C 10EA1026 */  addiu      $s0, $s0, %lo(tempstr)
    /* 5F160 8006F160 1280053C */  lui        $a1, %hi(myplr)
    /* 5F164 8006F164 08BAA58C */  lw         $a1, %lo(myplr)($a1)
    /* 5F168 8006F168 21200002 */  addu       $a0, $s0, $zero
    /* 5F16C 8006F16C 40180500 */  sll        $v1, $a1, 1
    /* 5F170 8006F170 21186500 */  addu       $v1, $v1, $a1
    /* 5F174 8006F174 80180300 */  sll        $v1, $v1, 2
    /* 5F178 8006F178 21186500 */  addu       $v1, $v1, $a1
    /* 5F17C 8006F17C 00190300 */  sll        $v1, $v1, 4
    /* 5F180 8006F180 23186500 */  subu       $v1, $v1, $a1
    /* 5F184 8006F184 80180300 */  sll        $v1, $v1, 2
    /* 5F188 8006F188 21186500 */  addu       $v1, $v1, $a1
    /* 5F18C 8006F18C C0180300 */  sll        $v1, $v1, 3
    /* 5F190 8006F190 0E80013C */  lui        $at, %hi(plr + 0x150)
    /* 5F194 8006F194 21082300 */  addu       $at, $at, $v1
    /* 5F198 8006F198 88A6268C */  lw         $a2, %lo(plr + 0x150)($at)
    /* 5F19C 8006F19C 9767000C */  jal        sprintf
    /* 5F1A0 8006F1A0 21284000 */   addu      $a1, $v0, $zero
    /* 5F1A4 8006F1A4 21200000 */  addu       $a0, $zero, $zero
    /* 5F1A8 8006F1A8 01000524 */  addiu      $a1, $zero, 0x1
    /* 5F1AC 8006F1AC 01000624 */  addiu      $a2, $zero, 0x1
    /* 5F1B0 8006F1B0 21380002 */  addu       $a3, $s0, $zero
    /* 5F1B4 8006F1B4 03000224 */  addiu      $v0, $zero, 0x3
    /* 5F1B8 8006F1B8 1000A2AF */  sw         $v0, 0x10($sp)
    /* 5F1BC 8006F1BC 84A7010C */  jal        AddSText__FiiUcPccUc
    /* 5F1C0 8006F1C0 1400A0AF */   sw        $zero, 0x14($sp)
    /* 5F1C4 8006F1C4 5CA7010C */  jal        AddSLine__Fi
    /* 5F1C8 8006F1C8 02000424 */   addiu     $a0, $zero, 0x2
    /* 5F1CC 8006F1CC A9BC0108 */  j          .L8006F2A4
    /* 5F1D0 8006F1D0 00000000 */   nop
  .L8006F1D4:
    /* 5F1D4 8006F1D4 1280033C */  lui        $v1, %hi(myplr)
    /* 5F1D8 8006F1D8 08BA638C */  lw         $v1, %lo(myplr)($v1)
    /* 5F1DC 8006F1DC 142180AF */  sw         $zero, %gp_rel(D_8011C894)($gp)
    /* 5F1E0 8006F1E0 40100300 */  sll        $v0, $v1, 1
    /* 5F1E4 8006F1E4 21104300 */  addu       $v0, $v0, $v1
    /* 5F1E8 8006F1E8 80100200 */  sll        $v0, $v0, 2
    /* 5F1EC 8006F1EC 21104300 */  addu       $v0, $v0, $v1
    /* 5F1F0 8006F1F0 00110200 */  sll        $v0, $v0, 4
    /* 5F1F4 8006F1F4 23104300 */  subu       $v0, $v0, $v1
    /* 5F1F8 8006F1F8 80100200 */  sll        $v0, $v0, 2
    /* 5F1FC 8006F1FC 21104300 */  addu       $v0, $v0, $v1
    /* 5F200 8006F200 C0100200 */  sll        $v0, $v0, 3
    /* 5F204 8006F204 0E80013C */  lui        $at, %hi(plr + 0x1584)
    /* 5F208 8006F208 21082200 */  addu       $at, $at, $v0
    /* 5F20C 8006F20C BCBA238C */  lw         $v1, %lo(plr + 0x1584)($at)
    /* 5F210 8006F210 01000224 */  addiu      $v0, $zero, 0x1
    /* 5F214 8006F214 621382A3 */  sb         $v0, %gp_rel(stextscrl)($gp)
    /* 5F218 8006F218 182183AF */  sw         $v1, %gp_rel(D_8011C898)($gp)
    /* 5F21C 8006F21C 4AED010C */  jal        GetStr__Fi
    /* 5F220 8006F220 09020424 */   addiu     $a0, $zero, 0x209
    /* 5F224 8006F224 0D80103C */  lui        $s0, %hi(tempstr)
    /* 5F228 8006F228 10EA1026 */  addiu      $s0, $s0, %lo(tempstr)
    /* 5F22C 8006F22C 1280053C */  lui        $a1, %hi(myplr)
    /* 5F230 8006F230 08BAA58C */  lw         $a1, %lo(myplr)($a1)
    /* 5F234 8006F234 21200002 */  addu       $a0, $s0, $zero
    /* 5F238 8006F238 40180500 */  sll        $v1, $a1, 1
    /* 5F23C 8006F23C 21186500 */  addu       $v1, $v1, $a1
    /* 5F240 8006F240 80180300 */  sll        $v1, $v1, 2
    /* 5F244 8006F244 21186500 */  addu       $v1, $v1, $a1
    /* 5F248 8006F248 00190300 */  sll        $v1, $v1, 4
    /* 5F24C 8006F24C 23186500 */  subu       $v1, $v1, $a1
    /* 5F250 8006F250 80180300 */  sll        $v1, $v1, 2
    /* 5F254 8006F254 21186500 */  addu       $v1, $v1, $a1
    /* 5F258 8006F258 C0180300 */  sll        $v1, $v1, 3
    /* 5F25C 8006F25C 0E80013C */  lui        $at, %hi(plr + 0x150)
    /* 5F260 8006F260 21082300 */  addu       $at, $at, $v1
    /* 5F264 8006F264 88A6268C */  lw         $a2, %lo(plr + 0x150)($at)
    /* 5F268 8006F268 9767000C */  jal        sprintf
    /* 5F26C 8006F26C 21284000 */   addu      $a1, $v0, $zero
    /* 5F270 8006F270 21200000 */  addu       $a0, $zero, $zero
    /* 5F274 8006F274 01000524 */  addiu      $a1, $zero, 0x1
    /* 5F278 8006F278 01000624 */  addiu      $a2, $zero, 0x1
    /* 5F27C 8006F27C 21380002 */  addu       $a3, $s0, $zero
    /* 5F280 8006F280 03000224 */  addiu      $v0, $zero, 0x3
    /* 5F284 8006F284 1000A2AF */  sw         $v0, 0x10($sp)
    /* 5F288 8006F288 84A7010C */  jal        AddSText__FiiUcPccUc
    /* 5F28C 8006F28C 1400A0AF */   sw        $zero, 0x14($sp)
    /* 5F290 8006F290 5CA7010C */  jal        AddSLine__Fi
    /* 5F294 8006F294 02000424 */   addiu     $a0, $zero, 0x2
    /* 5F298 8006F298 1421848F */  lw         $a0, %gp_rel(D_8011C894)($gp)
    /* 5F29C 8006F29C 2EAD010C */  jal        S_ScrollSSell__Fi
    /* 5F2A0 8006F2A0 00000000 */   nop
  .L8006F2A4:
    /* 5F2A4 8006F2A4 8800BF8F */  lw         $ra, 0x88($sp)
    /* 5F2A8 8006F2A8 8400B38F */  lw         $s3, 0x84($sp)
    /* 5F2AC 8006F2AC 8000B28F */  lw         $s2, 0x80($sp)
    /* 5F2B0 8006F2B0 7C00B18F */  lw         $s1, 0x7C($sp)
    /* 5F2B4 8006F2B4 7800B08F */  lw         $s0, 0x78($sp)
    /* 5F2B8 8006F2B8 9000BD27 */  addiu      $sp, $sp, 0x90
    /* 5F2BC 8006F2BC 0800E003 */  jr         $ra
    /* 5F2C0 8006F2C0 00000000 */   nop
endlabel S_StartSIdentify__Fv
