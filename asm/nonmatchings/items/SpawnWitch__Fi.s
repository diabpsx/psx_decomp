.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SpawnWitch__Fi, 0x5F0

glabel SpawnWitch__Fi
    /* 3A86C 8004A86C 50FFBD27 */  addiu      $sp, $sp, -0xB0
    /* 3A870 8004A870 9800B4AF */  sw         $s4, 0x98($sp)
    /* 3A874 8004A874 21A08000 */  addu       $s4, $a0, $zero
    /* 3A878 8004A878 1800A727 */  addiu      $a3, $sp, 0x18
    /* 3A87C 8004A87C 0D80063C */  lui        $a2, %hi(item)
    /* 3A880 8004A880 541DC624 */  addiu      $a2, $a2, %lo(item)
    /* 3A884 8004A884 6000C824 */  addiu      $t0, $a2, 0x60
    /* 3A888 8004A888 A800BFAF */  sw         $ra, 0xA8($sp)
    /* 3A88C 8004A88C A400B7AF */  sw         $s7, 0xA4($sp)
    /* 3A890 8004A890 A000B6AF */  sw         $s6, 0xA0($sp)
    /* 3A894 8004A894 9C00B5AF */  sw         $s5, 0x9C($sp)
    /* 3A898 8004A898 9400B3AF */  sw         $s3, 0x94($sp)
    /* 3A89C 8004A89C 9000B2AF */  sw         $s2, 0x90($sp)
    /* 3A8A0 8004A8A0 8C00B1AF */  sw         $s1, 0x8C($sp)
    /* 3A8A4 8004A8A4 8800B0AF */  sw         $s0, 0x88($sp)
  .L8004A8A8:
    /* 3A8A8 8004A8A8 0000C28C */  lw         $v0, 0x0($a2)
    /* 3A8AC 8004A8AC 0400C38C */  lw         $v1, 0x4($a2)
    /* 3A8B0 8004A8B0 0800C48C */  lw         $a0, 0x8($a2)
    /* 3A8B4 8004A8B4 0C00C58C */  lw         $a1, 0xC($a2)
    /* 3A8B8 8004A8B8 0000E2AC */  sw         $v0, 0x0($a3)
    /* 3A8BC 8004A8BC 0400E3AC */  sw         $v1, 0x4($a3)
    /* 3A8C0 8004A8C0 0800E4AC */  sw         $a0, 0x8($a3)
    /* 3A8C4 8004A8C4 0C00E5AC */  sw         $a1, 0xC($a3)
    /* 3A8C8 8004A8C8 1000C624 */  addiu      $a2, $a2, 0x10
    /* 3A8CC 8004A8CC F6FFC814 */  bne        $a2, $t0, .L8004A8A8
    /* 3A8D0 8004A8D0 1000E724 */   addiu     $a3, $a3, 0x10
    /* 3A8D4 8004A8D4 0000C28C */  lw         $v0, 0x0($a2)
    /* 3A8D8 8004A8D8 0400C38C */  lw         $v1, 0x4($a2)
    /* 3A8DC 8004A8DC 0800C48C */  lw         $a0, 0x8($a2)
    /* 3A8E0 8004A8E0 0000E2AC */  sw         $v0, 0x0($a3)
    /* 3A8E4 8004A8E4 0400E3AC */  sw         $v1, 0x4($a3)
    /* 3A8E8 8004A8E8 0800E4AC */  sw         $a0, 0x8($a3)
    /* 3A8EC 8004A8EC 21200000 */  addu       $a0, $zero, $zero
    /* 3A8F0 8004A8F0 19000524 */  addiu      $a1, $zero, 0x19
    /* 3A8F4 8004A8F4 A704010C */  jal        GetItemAttrs__Fiii
    /* 3A8F8 8004A8F8 01000624 */   addiu     $a2, $zero, 0x1
    /* 3A8FC 8004A8FC 0D80073C */  lui        $a3, %hi(item)
    /* 3A900 8004A900 541DE724 */  addiu      $a3, $a3, %lo(item)
    /* 3A904 8004A904 1280033C */  lui        $v1, %hi(StorePlrNo)
    /* 3A908 8004A908 B4BA638C */  lw         $v1, %lo(StorePlrNo)($v1)
    /* 3A90C 8004A90C 6000E824 */  addiu      $t0, $a3, 0x60
    /* 3A910 8004A910 00110300 */  sll        $v0, $v1, 4
    /* 3A914 8004A914 21104300 */  addu       $v0, $v0, $v1
    /* 3A918 8004A918 C0100200 */  sll        $v0, $v0, 3
    /* 3A91C 8004A91C 23104300 */  subu       $v0, $v0, $v1
    /* 3A920 8004A920 00110200 */  sll        $v0, $v0, 4
    /* 3A924 8004A924 0E80033C */  lui        $v1, %hi(_witchitem)
    /* 3A928 8004A928 18FA6324 */  addiu      $v1, $v1, %lo(_witchitem)
    /* 3A92C 8004A92C 21304300 */  addu       $a2, $v0, $v1
  .L8004A930:
    /* 3A930 8004A930 0000E28C */  lw         $v0, 0x0($a3)
    /* 3A934 8004A934 0400E38C */  lw         $v1, 0x4($a3)
    /* 3A938 8004A938 0800E48C */  lw         $a0, 0x8($a3)
    /* 3A93C 8004A93C 0C00E58C */  lw         $a1, 0xC($a3)
    /* 3A940 8004A940 0000C2AC */  sw         $v0, 0x0($a2)
    /* 3A944 8004A944 0400C3AC */  sw         $v1, 0x4($a2)
    /* 3A948 8004A948 0800C4AC */  sw         $a0, 0x8($a2)
    /* 3A94C 8004A94C 0C00C5AC */  sw         $a1, 0xC($a2)
    /* 3A950 8004A950 1000E724 */  addiu      $a3, $a3, 0x10
    /* 3A954 8004A954 F6FFE814 */  bne        $a3, $t0, .L8004A930
    /* 3A958 8004A958 1000C624 */   addiu     $a2, $a2, 0x10
    /* 3A95C 8004A95C 0000E28C */  lw         $v0, 0x0($a3)
    /* 3A960 8004A960 0400E38C */  lw         $v1, 0x4($a3)
    /* 3A964 8004A964 0800E48C */  lw         $a0, 0x8($a3)
    /* 3A968 8004A968 0000C2AC */  sw         $v0, 0x0($a2)
    /* 3A96C 8004A96C 0400C3AC */  sw         $v1, 0x4($a2)
    /* 3A970 8004A970 0800C4AC */  sw         $a0, 0x8($a2)
    /* 3A974 8004A974 21200000 */  addu       $a0, $zero, $zero
    /* 3A978 8004A978 1E000524 */  addiu      $a1, $zero, 0x1E
    /* 3A97C 8004A97C 1280033C */  lui        $v1, %hi(StorePlrNo)
    /* 3A980 8004A980 B4BA638C */  lw         $v1, %lo(StorePlrNo)($v1)
    /* 3A984 8004A984 00000000 */  nop
    /* 3A988 8004A988 00110300 */  sll        $v0, $v1, 4
    /* 3A98C 8004A98C 21104300 */  addu       $v0, $v0, $v1
    /* 3A990 8004A990 C0100200 */  sll        $v0, $v0, 3
    /* 3A994 8004A994 23104300 */  subu       $v0, $v0, $v1
    /* 3A998 8004A998 00110200 */  sll        $v0, $v0, 4
    /* 3A99C 8004A99C 01000324 */  addiu      $v1, $zero, 0x1
    /* 3A9A0 8004A9A0 0E80013C */  lui        $at, %hi(_witchitem + 0x24)
    /* 3A9A4 8004A9A4 21082200 */  addu       $at, $at, $v0
    /* 3A9A8 8004A9A8 3CFA34A4 */  sh         $s4, %lo(_witchitem + 0x24)($at)
    /* 3A9AC 8004A9AC 0E80013C */  lui        $at, %hi(_witchitem + 0x66)
    /* 3A9B0 8004A9B0 21082200 */  addu       $at, $at, $v0
    /* 3A9B4 8004A9B4 7EFA23A0 */  sb         $v1, %lo(_witchitem + 0x66)($at)
    /* 3A9B8 8004A9B8 A704010C */  jal        GetItemAttrs__Fiii
    /* 3A9BC 8004A9BC 01000624 */   addiu     $a2, $zero, 0x1
    /* 3A9C0 8004A9C0 0D80073C */  lui        $a3, %hi(item)
    /* 3A9C4 8004A9C4 541DE724 */  addiu      $a3, $a3, %lo(item)
    /* 3A9C8 8004A9C8 1280033C */  lui        $v1, %hi(StorePlrNo)
    /* 3A9CC 8004A9CC B4BA638C */  lw         $v1, %lo(StorePlrNo)($v1)
    /* 3A9D0 8004A9D0 6000E824 */  addiu      $t0, $a3, 0x60
    /* 3A9D4 8004A9D4 00110300 */  sll        $v0, $v1, 4
    /* 3A9D8 8004A9D8 21104300 */  addu       $v0, $v0, $v1
    /* 3A9DC 8004A9DC C0100200 */  sll        $v0, $v0, 3
    /* 3A9E0 8004A9E0 23104300 */  subu       $v0, $v0, $v1
    /* 3A9E4 8004A9E4 00110200 */  sll        $v0, $v0, 4
    /* 3A9E8 8004A9E8 0E80033C */  lui        $v1, %hi(_witchitem + 0x6C)
    /* 3A9EC 8004A9EC 84FA6324 */  addiu      $v1, $v1, %lo(_witchitem + 0x6C)
    /* 3A9F0 8004A9F0 21304300 */  addu       $a2, $v0, $v1
  .L8004A9F4:
    /* 3A9F4 8004A9F4 0000E28C */  lw         $v0, 0x0($a3)
    /* 3A9F8 8004A9F8 0400E38C */  lw         $v1, 0x4($a3)
    /* 3A9FC 8004A9FC 0800E48C */  lw         $a0, 0x8($a3)
    /* 3AA00 8004AA00 0C00E58C */  lw         $a1, 0xC($a3)
    /* 3AA04 8004AA04 0000C2AC */  sw         $v0, 0x0($a2)
    /* 3AA08 8004AA08 0400C3AC */  sw         $v1, 0x4($a2)
    /* 3AA0C 8004AA0C 0800C4AC */  sw         $a0, 0x8($a2)
    /* 3AA10 8004AA10 0C00C5AC */  sw         $a1, 0xC($a2)
    /* 3AA14 8004AA14 1000E724 */  addiu      $a3, $a3, 0x10
    /* 3AA18 8004AA18 F6FFE814 */  bne        $a3, $t0, .L8004A9F4
    /* 3AA1C 8004AA1C 1000C624 */   addiu     $a2, $a2, 0x10
    /* 3AA20 8004AA20 0000E28C */  lw         $v0, 0x0($a3)
    /* 3AA24 8004AA24 0400E38C */  lw         $v1, 0x4($a3)
    /* 3AA28 8004AA28 0800E48C */  lw         $a0, 0x8($a3)
    /* 3AA2C 8004AA2C 0000C2AC */  sw         $v0, 0x0($a2)
    /* 3AA30 8004AA30 0400C3AC */  sw         $v1, 0x4($a2)
    /* 3AA34 8004AA34 0800C4AC */  sw         $a0, 0x8($a2)
    /* 3AA38 8004AA38 21200000 */  addu       $a0, $zero, $zero
    /* 3AA3C 8004AA3C 1B000524 */  addiu      $a1, $zero, 0x1B
    /* 3AA40 8004AA40 1280033C */  lui        $v1, %hi(StorePlrNo)
    /* 3AA44 8004AA44 B4BA638C */  lw         $v1, %lo(StorePlrNo)($v1)
    /* 3AA48 8004AA48 00000000 */  nop
    /* 3AA4C 8004AA4C 00110300 */  sll        $v0, $v1, 4
    /* 3AA50 8004AA50 21104300 */  addu       $v0, $v0, $v1
    /* 3AA54 8004AA54 C0100200 */  sll        $v0, $v0, 3
    /* 3AA58 8004AA58 23104300 */  subu       $v0, $v0, $v1
    /* 3AA5C 8004AA5C 00110200 */  sll        $v0, $v0, 4
    /* 3AA60 8004AA60 01000324 */  addiu      $v1, $zero, 0x1
    /* 3AA64 8004AA64 0E80013C */  lui        $at, %hi(_witchitem + 0x90)
    /* 3AA68 8004AA68 21082200 */  addu       $at, $at, $v0
    /* 3AA6C 8004AA6C A8FA34A4 */  sh         $s4, %lo(_witchitem + 0x90)($at)
    /* 3AA70 8004AA70 0E80013C */  lui        $at, %hi(_witchitem + 0xD2)
    /* 3AA74 8004AA74 21082200 */  addu       $at, $at, $v0
    /* 3AA78 8004AA78 EAFA23A0 */  sb         $v1, %lo(_witchitem + 0xD2)($at)
    /* 3AA7C 8004AA7C A704010C */  jal        GetItemAttrs__Fiii
    /* 3AA80 8004AA80 01000624 */   addiu     $a2, $zero, 0x1
    /* 3AA84 8004AA84 0D80073C */  lui        $a3, %hi(item)
    /* 3AA88 8004AA88 541DE724 */  addiu      $a3, $a3, %lo(item)
    /* 3AA8C 8004AA8C 1280033C */  lui        $v1, %hi(StorePlrNo)
    /* 3AA90 8004AA90 B4BA638C */  lw         $v1, %lo(StorePlrNo)($v1)
    /* 3AA94 8004AA94 6000E824 */  addiu      $t0, $a3, 0x60
    /* 3AA98 8004AA98 00110300 */  sll        $v0, $v1, 4
    /* 3AA9C 8004AA9C 21104300 */  addu       $v0, $v0, $v1
    /* 3AAA0 8004AAA0 C0100200 */  sll        $v0, $v0, 3
    /* 3AAA4 8004AAA4 23104300 */  subu       $v0, $v0, $v1
    /* 3AAA8 8004AAA8 00110200 */  sll        $v0, $v0, 4
    /* 3AAAC 8004AAAC 0E80033C */  lui        $v1, %hi(_witchitem + 0xD8)
    /* 3AAB0 8004AAB0 F0FA6324 */  addiu      $v1, $v1, %lo(_witchitem + 0xD8)
    /* 3AAB4 8004AAB4 21304300 */  addu       $a2, $v0, $v1
  .L8004AAB8:
    /* 3AAB8 8004AAB8 0000E28C */  lw         $v0, 0x0($a3)
    /* 3AABC 8004AABC 0400E38C */  lw         $v1, 0x4($a3)
    /* 3AAC0 8004AAC0 0800E48C */  lw         $a0, 0x8($a3)
    /* 3AAC4 8004AAC4 0C00E58C */  lw         $a1, 0xC($a3)
    /* 3AAC8 8004AAC8 0000C2AC */  sw         $v0, 0x0($a2)
    /* 3AACC 8004AACC 0400C3AC */  sw         $v1, 0x4($a2)
    /* 3AAD0 8004AAD0 0800C4AC */  sw         $a0, 0x8($a2)
    /* 3AAD4 8004AAD4 0C00C5AC */  sw         $a1, 0xC($a2)
    /* 3AAD8 8004AAD8 1000E724 */  addiu      $a3, $a3, 0x10
    /* 3AADC 8004AADC F6FFE814 */  bne        $a3, $t0, .L8004AAB8
    /* 3AAE0 8004AAE0 1000C624 */   addiu     $a2, $a2, 0x10
    /* 3AAE4 8004AAE4 0000E28C */  lw         $v0, 0x0($a3)
    /* 3AAE8 8004AAE8 0400E38C */  lw         $v1, 0x4($a3)
    /* 3AAEC 8004AAEC 0800E48C */  lw         $a0, 0x8($a3)
    /* 3AAF0 8004AAF0 0000C2AC */  sw         $v0, 0x0($a2)
    /* 3AAF4 8004AAF4 0400C3AC */  sw         $v1, 0x4($a2)
    /* 3AAF8 8004AAF8 0800C4AC */  sw         $a0, 0x8($a2)
    /* 3AAFC 8004AAFC 08000424 */  addiu      $a0, $zero, 0x8
    /* 3AB00 8004AB00 1280033C */  lui        $v1, %hi(StorePlrNo)
    /* 3AB04 8004AB04 B4BA638C */  lw         $v1, %lo(StorePlrNo)($v1)
    /* 3AB08 8004AB08 00000000 */  nop
    /* 3AB0C 8004AB0C 00110300 */  sll        $v0, $v1, 4
    /* 3AB10 8004AB10 21104300 */  addu       $v0, $v0, $v1
    /* 3AB14 8004AB14 C0100200 */  sll        $v0, $v0, 3
    /* 3AB18 8004AB18 23104300 */  subu       $v0, $v0, $v1
    /* 3AB1C 8004AB1C 00110200 */  sll        $v0, $v0, 4
    /* 3AB20 8004AB20 01000324 */  addiu      $v1, $zero, 0x1
    /* 3AB24 8004AB24 0E80013C */  lui        $at, %hi(_witchitem + 0xFC)
    /* 3AB28 8004AB28 21082200 */  addu       $at, $at, $v0
    /* 3AB2C 8004AB2C 14FB34A4 */  sh         $s4, %lo(_witchitem + 0xFC)($at)
    /* 3AB30 8004AB30 0E80013C */  lui        $at, %hi(_witchitem + 0x13E)
    /* 3AB34 8004AB34 21082200 */  addu       $at, $at, $v0
    /* 3AB38 8004AB38 56FB23A0 */  sb         $v1, %lo(_witchitem + 0x13E)($at)
    /* 3AB3C 8004AB3C C9F6000C */  jal        ENG_random__Fl
    /* 3AB40 8004AB40 03001224 */   addiu     $s2, $zero, 0x3
    /* 3AB44 8004AB44 0A005524 */  addiu      $s5, $v0, 0xA
    /* 3AB48 8004AB48 2A105502 */  slt        $v0, $s2, $s5
    /* 3AB4C 8004AB4C 87004010 */  beqz       $v0, .L8004AD6C
    /* 3AB50 8004AB50 00000000 */   nop
    /* 3AB54 8004AB54 0D80173C */  lui        $s7, %hi(item + 0x10)
    /* 3AB58 8004AB58 641DF726 */  addiu      $s7, $s7, %lo(item + 0x10)
    /* 3AB5C 8004AB5C FFFF1624 */  addiu      $s6, $zero, -0x1
    /* 3AB60 8004AB60 44011324 */  addiu      $s3, $zero, 0x144
  .L8004AB64:
    /* 3AB64 8004AB64 B7F6000C */  jal        GetRndSeed__Fv
    /* 3AB68 8004AB68 FFFF1024 */   addiu     $s0, $zero, -0x1
    /* 3AB6C 8004AB6C 0000E2AE */  sw         $v0, 0x0($s7)
    /* 3AB70 8004AB70 B3F6000C */  jal        SetRndSeed__Fl
    /* 3AB74 8004AB74 21204000 */   addu      $a0, $v0, $zero
    /* 3AB78 8004AB78 0126010C */  jal        RndWitchItem__Fi
    /* 3AB7C 8004AB7C 21208002 */   addu      $a0, $s4, $zero
    /* 3AB80 8004AB80 21200000 */  addu       $a0, $zero, $zero
    /* 3AB84 8004AB84 FFFF5124 */  addiu      $s1, $v0, -0x1
    /* 3AB88 8004AB88 21282002 */  addu       $a1, $s1, $zero
    /* 3AB8C 8004AB8C A704010C */  jal        GetItemAttrs__Fiii
    /* 3AB90 8004AB90 21308002 */   addu      $a2, $s4, $zero
    /* 3AB94 8004AB94 C9F6000C */  jal        ENG_random__Fl
    /* 3AB98 8004AB98 64000424 */   addiu     $a0, $zero, 0x64
    /* 3AB9C 8004AB9C 06004228 */  slti       $v0, $v0, 0x6
    /* 3ABA0 8004ABA0 02004010 */  beqz       $v0, .L8004ABAC
    /* 3ABA4 8004ABA4 00000000 */   nop
    /* 3ABA8 8004ABA8 40801400 */  sll        $s0, $s4, 1
  .L8004ABAC:
    /* 3ABAC 8004ABAC 08001616 */  bne        $s0, $s6, .L8004ABD0
    /* 3ABB0 8004ABB0 01000224 */   addiu     $v0, $zero, 0x1
    /* 3ABB4 8004ABB4 3D00E392 */  lbu        $v1, 0x3D($s7)
    /* 3ABB8 8004ABB8 17000224 */  addiu      $v0, $zero, 0x17
    /* 3ABBC 8004ABBC 02006214 */  bne        $v1, $v0, .L8004ABC8
    /* 3ABC0 8004ABC0 00000000 */   nop
    /* 3ABC4 8004ABC4 40801400 */  sll        $s0, $s4, 1
  .L8004ABC8:
    /* 3ABC8 8004ABC8 07001612 */  beq        $s0, $s6, .L8004ABE8
    /* 3ABCC 8004ABCC 01000224 */   addiu     $v0, $zero, 0x1
  .L8004ABD0:
    /* 3ABD0 8004ABD0 1000A2AF */  sw         $v0, 0x10($sp)
    /* 3ABD4 8004ABD4 21200000 */  addu       $a0, $zero, $zero
    /* 3ABD8 8004ABD8 21282002 */  addu       $a1, $s1, $zero
    /* 3ABDC 8004ABDC 43301000 */  sra        $a2, $s0, 1
    /* 3ABE0 8004ABE0 0D0D010C */  jal        GetItemBonus__FiiiiUc
    /* 3ABE4 8004ABE4 21380002 */   addu      $a3, $s0, $zero
  .L8004ABE8:
    /* 3ABE8 8004ABE8 0200023C */  lui        $v0, (0x222E0 >> 16)
    /* 3ABEC 8004ABEC 0D80033C */  lui        $v1, %hi(item + 0x18)
    /* 3ABF0 8004ABF0 6C1D638C */  lw         $v1, %lo(item + 0x18)($v1)
    /* 3ABF4 8004ABF4 E0224234 */  ori        $v0, $v0, (0x222E0 & 0xFFFF)
    /* 3ABF8 8004ABF8 2A104300 */  slt        $v0, $v0, $v1
    /* 3ABFC 8004ABFC D9FF4014 */  bnez       $v0, .L8004AB64
    /* 3AC00 8004AC00 00000000 */   nop
    /* 3AC04 8004AC04 0D80073C */  lui        $a3, %hi(item)
    /* 3AC08 8004AC08 541DE724 */  addiu      $a3, $a3, %lo(item)
    /* 3AC0C 8004AC0C 6000E824 */  addiu      $t0, $a3, 0x60
    /* 3AC10 8004AC10 1280023C */  lui        $v0, %hi(StorePlrNo)
    /* 3AC14 8004AC14 B4BA428C */  lw         $v0, %lo(StorePlrNo)($v0)
    /* 3AC18 8004AC18 0E80043C */  lui        $a0, %hi(_witchitem)
    /* 3AC1C 8004AC1C 18FA8424 */  addiu      $a0, $a0, %lo(_witchitem)
    /* 3AC20 8004AC20 00190200 */  sll        $v1, $v0, 4
    /* 3AC24 8004AC24 21186200 */  addu       $v1, $v1, $v0
    /* 3AC28 8004AC28 C0180300 */  sll        $v1, $v1, 3
    /* 3AC2C 8004AC2C 23186200 */  subu       $v1, $v1, $v0
    /* 3AC30 8004AC30 00190300 */  sll        $v1, $v1, 4
    /* 3AC34 8004AC34 21186400 */  addu       $v1, $v1, $a0
    /* 3AC38 8004AC38 21306302 */  addu       $a2, $s3, $v1
  .L8004AC3C:
    /* 3AC3C 8004AC3C 0000E28C */  lw         $v0, 0x0($a3)
    /* 3AC40 8004AC40 0400E38C */  lw         $v1, 0x4($a3)
    /* 3AC44 8004AC44 0800E48C */  lw         $a0, 0x8($a3)
    /* 3AC48 8004AC48 0C00E58C */  lw         $a1, 0xC($a3)
    /* 3AC4C 8004AC4C 0000C2AC */  sw         $v0, 0x0($a2)
    /* 3AC50 8004AC50 0400C3AC */  sw         $v1, 0x4($a2)
    /* 3AC54 8004AC54 0800C4AC */  sw         $a0, 0x8($a2)
    /* 3AC58 8004AC58 0C00C5AC */  sw         $a1, 0xC($a2)
    /* 3AC5C 8004AC5C 1000E724 */  addiu      $a3, $a3, 0x10
    /* 3AC60 8004AC60 F6FFE814 */  bne        $a3, $t0, .L8004AC3C
    /* 3AC64 8004AC64 1000C624 */   addiu     $a2, $a2, 0x10
    /* 3AC68 8004AC68 0000E28C */  lw         $v0, 0x0($a3)
    /* 3AC6C 8004AC6C 0400E38C */  lw         $v1, 0x4($a3)
    /* 3AC70 8004AC70 0800E48C */  lw         $a0, 0x8($a3)
    /* 3AC74 8004AC74 0000C2AC */  sw         $v0, 0x0($a2)
    /* 3AC78 8004AC78 0400C3AC */  sw         $v1, 0x4($a2)
    /* 3AC7C 8004AC7C 0800C4AC */  sw         $a0, 0x8($a2)
    /* 3AC80 8004AC80 1280033C */  lui        $v1, %hi(StorePlrNo)
    /* 3AC84 8004AC84 B4BA638C */  lw         $v1, %lo(StorePlrNo)($v1)
    /* 3AC88 8004AC88 00000000 */  nop
    /* 3AC8C 8004AC8C 00110300 */  sll        $v0, $v1, 4
    /* 3AC90 8004AC90 21104300 */  addu       $v0, $v0, $v1
    /* 3AC94 8004AC94 C0100200 */  sll        $v0, $v0, 3
    /* 3AC98 8004AC98 23104300 */  subu       $v0, $v0, $v1
    /* 3AC9C 8004AC9C 00110200 */  sll        $v0, $v0, 4
    /* 3ACA0 8004ACA0 1280033C */  lui        $v1, %hi(FePlayerNo)
    /* 3ACA4 8004ACA4 78B3638C */  lw         $v1, %lo(FePlayerNo)($v1)
    /* 3ACA8 8004ACA8 21106202 */  addu       $v0, $s3, $v0
    /* 3ACAC 8004ACAC 0E80013C */  lui        $at, %hi(_witchitem + 0x65)
    /* 3ACB0 8004ACB0 21082200 */  addu       $at, $at, $v0
    /* 3ACB4 8004ACB4 7DFA23A0 */  sb         $v1, %lo(_witchitem + 0x65)($at)
    /* 3ACB8 8004ACB8 1280053C */  lui        $a1, %hi(StorePlrNo)
    /* 3ACBC 8004ACBC B4BAA58C */  lw         $a1, %lo(StorePlrNo)($a1)
    /* 3ACC0 8004ACC0 00208336 */  ori        $v1, $s4, 0x2000
    /* 3ACC4 8004ACC4 0E80013C */  lui        $at, %hi(_witchitem + 0x24)
    /* 3ACC8 8004ACC8 21082200 */  addu       $at, $at, $v0
    /* 3ACCC 8004ACCC 3CFA23A4 */  sh         $v1, %lo(_witchitem + 0x24)($at)
    /* 3ACD0 8004ACD0 01000324 */  addiu      $v1, $zero, 0x1
    /* 3ACD4 8004ACD4 00110500 */  sll        $v0, $a1, 4
    /* 3ACD8 8004ACD8 21104500 */  addu       $v0, $v0, $a1
    /* 3ACDC 8004ACDC C0100200 */  sll        $v0, $v0, 3
    /* 3ACE0 8004ACE0 23104500 */  subu       $v0, $v0, $a1
    /* 3ACE4 8004ACE4 00110200 */  sll        $v0, $v0, 4
    /* 3ACE8 8004ACE8 21106202 */  addu       $v0, $s3, $v0
    /* 3ACEC 8004ACEC 0E80013C */  lui        $at, %hi(_witchitem + 0x69)
    /* 3ACF0 8004ACF0 21082200 */  addu       $at, $at, $v0
    /* 3ACF4 8004ACF4 81FA23A0 */  sb         $v1, %lo(_witchitem + 0x69)($at)
    /* 3ACF8 8004ACF8 6B21010C */  jal        WitchBookLevel__Fi
    /* 3ACFC 8004ACFC 21204002 */   addu      $a0, $s2, $zero
    /* 3AD00 8004AD00 0E80043C */  lui        $a0, %hi(_witchitem)
    /* 3AD04 8004AD04 18FA8424 */  addiu      $a0, $a0, %lo(_witchitem)
    /* 3AD08 8004AD08 1280033C */  lui        $v1, %hi(StorePlrNo)
    /* 3AD0C 8004AD0C B4BA638C */  lw         $v1, %lo(StorePlrNo)($v1)
    /* 3AD10 8004AD10 21206402 */  addu       $a0, $s3, $a0
    /* 3AD14 8004AD14 00110300 */  sll        $v0, $v1, 4
    /* 3AD18 8004AD18 21104300 */  addu       $v0, $v0, $v1
    /* 3AD1C 8004AD1C C0100200 */  sll        $v0, $v0, 3
    /* 3AD20 8004AD20 23104300 */  subu       $v0, $v0, $v1
    /* 3AD24 8004AD24 00110200 */  sll        $v0, $v0, 4
    /* 3AD28 8004AD28 411F010C */  jal        StoreStatOk__FP10ItemStruct
    /* 3AD2C 8004AD2C 21204400 */   addu      $a0, $v0, $a0
    /* 3AD30 8004AD30 1280043C */  lui        $a0, %hi(StorePlrNo)
    /* 3AD34 8004AD34 B4BA848C */  lw         $a0, %lo(StorePlrNo)($a0)
    /* 3AD38 8004AD38 01005226 */  addiu      $s2, $s2, 0x1
    /* 3AD3C 8004AD3C 00190400 */  sll        $v1, $a0, 4
    /* 3AD40 8004AD40 21186400 */  addu       $v1, $v1, $a0
    /* 3AD44 8004AD44 C0180300 */  sll        $v1, $v1, 3
    /* 3AD48 8004AD48 23186400 */  subu       $v1, $v1, $a0
    /* 3AD4C 8004AD4C 00190300 */  sll        $v1, $v1, 4
    /* 3AD50 8004AD50 21186302 */  addu       $v1, $s3, $v1
    /* 3AD54 8004AD54 0E80013C */  lui        $at, %hi(_witchitem + 0x66)
    /* 3AD58 8004AD58 21082300 */  addu       $at, $at, $v1
    /* 3AD5C 8004AD5C 7EFA22A0 */  sb         $v0, %lo(_witchitem + 0x66)($at)
    /* 3AD60 8004AD60 2A105502 */  slt        $v0, $s2, $s5
    /* 3AD64 8004AD64 7FFF4014 */  bnez       $v0, .L8004AB64
    /* 3AD68 8004AD68 6C007326 */   addiu     $s3, $s3, 0x6C
  .L8004AD6C:
    /* 3AD6C 8004AD6C 2190A002 */  addu       $s2, $s5, $zero
    /* 3AD70 8004AD70 1400A22A */  slti       $v0, $s5, 0x14
    /* 3AD74 8004AD74 16004010 */  beqz       $v0, .L8004ADD0
    /* 3AD78 8004AD78 FFFF0424 */   addiu     $a0, $zero, -0x1
    /* 3AD7C 8004AD7C 1280023C */  lui        $v0, %hi(StorePlrNo)
    /* 3AD80 8004AD80 B4BA428C */  lw         $v0, %lo(StorePlrNo)($v0)
    /* 3AD84 8004AD84 00000000 */  nop
    /* 3AD88 8004AD88 00190200 */  sll        $v1, $v0, 4
    /* 3AD8C 8004AD8C 21186200 */  addu       $v1, $v1, $v0
    /* 3AD90 8004AD90 C0180300 */  sll        $v1, $v1, 3
    /* 3AD94 8004AD94 23186200 */  subu       $v1, $v1, $v0
    /* 3AD98 8004AD98 00190300 */  sll        $v1, $v1, 4
    /* 3AD9C 8004AD9C C0101200 */  sll        $v0, $s2, 3
    /* 3ADA0 8004ADA0 23105200 */  subu       $v0, $v0, $s2
    /* 3ADA4 8004ADA4 80100200 */  sll        $v0, $v0, 2
    /* 3ADA8 8004ADA8 23105200 */  subu       $v0, $v0, $s2
    /* 3ADAC 8004ADAC 80100200 */  sll        $v0, $v0, 2
    /* 3ADB0 8004ADB0 21184300 */  addu       $v1, $v0, $v1
  .L8004ADB4:
    /* 3ADB4 8004ADB4 0E80013C */  lui        $at, %hi(_witchitem + 0x2C)
    /* 3ADB8 8004ADB8 21082300 */  addu       $at, $at, $v1
    /* 3ADBC 8004ADBC 44FA24A4 */  sh         $a0, %lo(_witchitem + 0x2C)($at)
    /* 3ADC0 8004ADC0 01005226 */  addiu      $s2, $s2, 0x1
    /* 3ADC4 8004ADC4 1400422A */  slti       $v0, $s2, 0x14
    /* 3ADC8 8004ADC8 FAFF4014 */  bnez       $v0, .L8004ADB4
    /* 3ADCC 8004ADCC 6C006324 */   addiu     $v1, $v1, 0x6C
  .L8004ADD0:
    /* 3ADD0 8004ADD0 AE26010C */  jal        SortWitch__Fv
    /* 3ADD4 8004ADD4 00000000 */   nop
    /* 3ADD8 8004ADD8 0D80073C */  lui        $a3, %hi(item)
    /* 3ADDC 8004ADDC 541DE724 */  addiu      $a3, $a3, %lo(item)
    /* 3ADE0 8004ADE0 1800A627 */  addiu      $a2, $sp, 0x18
    /* 3ADE4 8004ADE4 7800A827 */  addiu      $t0, $sp, 0x78
  .L8004ADE8:
    /* 3ADE8 8004ADE8 0000C28C */  lw         $v0, 0x0($a2)
    /* 3ADEC 8004ADEC 0400C38C */  lw         $v1, 0x4($a2)
    /* 3ADF0 8004ADF0 0800C48C */  lw         $a0, 0x8($a2)
    /* 3ADF4 8004ADF4 0C00C58C */  lw         $a1, 0xC($a2)
    /* 3ADF8 8004ADF8 0000E2AC */  sw         $v0, 0x0($a3)
    /* 3ADFC 8004ADFC 0400E3AC */  sw         $v1, 0x4($a3)
    /* 3AE00 8004AE00 0800E4AC */  sw         $a0, 0x8($a3)
    /* 3AE04 8004AE04 0C00E5AC */  sw         $a1, 0xC($a3)
    /* 3AE08 8004AE08 1000C624 */  addiu      $a2, $a2, 0x10
    /* 3AE0C 8004AE0C F6FFC814 */  bne        $a2, $t0, .L8004ADE8
    /* 3AE10 8004AE10 1000E724 */   addiu     $a3, $a3, 0x10
    /* 3AE14 8004AE14 0000C28C */  lw         $v0, 0x0($a2)
    /* 3AE18 8004AE18 0400C38C */  lw         $v1, 0x4($a2)
    /* 3AE1C 8004AE1C 0800C48C */  lw         $a0, 0x8($a2)
    /* 3AE20 8004AE20 0000E2AC */  sw         $v0, 0x0($a3)
    /* 3AE24 8004AE24 0400E3AC */  sw         $v1, 0x4($a3)
    /* 3AE28 8004AE28 0800E4AC */  sw         $a0, 0x8($a3)
    /* 3AE2C 8004AE2C A800BF8F */  lw         $ra, 0xA8($sp)
    /* 3AE30 8004AE30 A400B78F */  lw         $s7, 0xA4($sp)
    /* 3AE34 8004AE34 A000B68F */  lw         $s6, 0xA0($sp)
    /* 3AE38 8004AE38 9C00B58F */  lw         $s5, 0x9C($sp)
    /* 3AE3C 8004AE3C 9800B48F */  lw         $s4, 0x98($sp)
    /* 3AE40 8004AE40 9400B38F */  lw         $s3, 0x94($sp)
    /* 3AE44 8004AE44 9000B28F */  lw         $s2, 0x90($sp)
    /* 3AE48 8004AE48 8C00B18F */  lw         $s1, 0x8C($sp)
    /* 3AE4C 8004AE4C 8800B08F */  lw         $s0, 0x88($sp)
    /* 3AE50 8004AE50 B000BD27 */  addiu      $sp, $sp, 0xB0
    /* 3AE54 8004AE54 0800E003 */  jr         $ra
    /* 3AE58 8004AE58 00000000 */   nop
endlabel SpawnWitch__Fi
