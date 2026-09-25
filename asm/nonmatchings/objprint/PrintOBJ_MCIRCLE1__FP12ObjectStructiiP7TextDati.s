.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PrintOBJ_MCIRCLE1__FP12ObjectStructiiP7TextDati, 0x19C

glabel PrintOBJ_MCIRCLE1__FP12ObjectStructiiP7TextDati
    /* 6E8E4 8007E8E4 C0FFBD27 */  addiu      $sp, $sp, -0x40
    /* 6E8E8 8007E8E8 5000A28F */  lw         $v0, 0x50($sp)
    /* 6E8EC 8007E8EC 2400B1AF */  sw         $s1, 0x24($sp)
    /* 6E8F0 8007E8F0 2188A000 */  addu       $s1, $a1, $zero
    /* 6E8F4 8007E8F4 3400B5AF */  sw         $s5, 0x34($sp)
    /* 6E8F8 8007E8F8 21A8C000 */  addu       $s5, $a2, $zero
    /* 6E8FC 8007E8FC 2000B0AF */  sw         $s0, 0x20($sp)
    /* 6E900 8007E900 2180E000 */  addu       $s0, $a3, $zero
    /* 6E904 8007E904 3800BFAF */  sw         $ra, 0x38($sp)
    /* 6E908 8007E908 3000B4AF */  sw         $s4, 0x30($sp)
    /* 6E90C 8007E90C 2C00B3AF */  sw         $s3, 0x2C($sp)
    /* 6E910 8007E910 2800B2AF */  sw         $s2, 0x28($sp)
    /* 6E914 8007E914 21008380 */  lb         $v1, 0x21($a0)
    /* 6E918 8007E918 E0FF5224 */  addiu      $s2, $v0, -0x20
    /* 6E91C 8007E91C 02004106 */  bgez       $s2, .L8007E928
    /* 6E920 8007E920 FFFF7324 */   addiu     $s3, $v1, -0x1
    /* 6E924 8007E924 21900000 */  addu       $s2, $zero, $zero
  .L8007E928:
    /* 6E928 8007E928 1E008380 */  lb         $v1, 0x1E($a0)
    /* 6E92C 8007E92C 21200002 */  addu       $a0, $s0, $zero
    /* 6E930 8007E930 C0100300 */  sll        $v0, $v1, 3
    /* 6E934 8007E934 21104300 */  addu       $v0, $v0, $v1
    /* 6E938 8007E938 40100200 */  sll        $v0, $v0, 1
    /* 6E93C 8007E93C 0E80013C */  lui        $at, %hi(AllObjects + 0x1)
    /* 6E940 8007E940 21082200 */  addu       $at, $at, $v0
    /* 6E944 8007E944 B1842280 */  lb         $v0, %lo(AllObjects + 0x1)($at)
    /* 6E948 8007E948 21300000 */  addu       $a2, $zero, $zero
    /* 6E94C 8007E94C 80100200 */  sll        $v0, $v0, 2
    /* 6E950 8007E950 1180013C */  lui        $at, %hi(ObjMasterLoadList)
    /* 6E954 8007E954 21082200 */  addu       $at, $at, $v0
    /* 6E958 8007E958 F0692584 */  lh         $a1, %lo(ObjMasterLoadList)($at)
    /* 6E95C 8007E95C 21380000 */  addu       $a3, $zero, $zero
    /* 6E960 8007E960 A64F020C */  jal        GetFrNum__7TextDatiiii
    /* 6E964 8007E964 1000A0AF */   sw        $zero, 0x10($sp)
    /* 6E968 8007E968 21200002 */  addu       $a0, $s0, $zero
    /* 6E96C 8007E96C 21A04000 */  addu       $s4, $v0, $zero
    /* 6E970 8007E970 21288002 */  addu       $a1, $s4, $zero
    /* 6E974 8007E974 21302002 */  addu       $a2, $s1, $zero
    /* 6E978 8007E978 2138A002 */  addu       $a3, $s5, $zero
    /* 6E97C 8007E97C 1000A0AF */  sw         $zero, 0x10($sp)
    /* 6E980 8007E980 1400B2AF */  sw         $s2, 0x14($sp)
    /* 6E984 8007E984 064D020C */  jal        PrintFt4__7TextDatiiiiii
    /* 6E988 8007E988 1800A0AF */   sw        $zero, 0x18($sp)
    /* 6E98C 8007E98C 21884000 */  addu       $s1, $v0, $zero
    /* 6E990 8007E990 07002292 */  lbu        $v0, 0x7($s1)
    /* 6E994 8007E994 00000000 */  nop
    /* 6E998 8007E998 FE004230 */  andi       $v0, $v0, 0xFE
    /* 6E99C 8007E99C 070022A2 */  sb         $v0, 0x7($s1)
    /* 6E9A0 8007E9A0 01000224 */  addiu      $v0, $zero, 0x1
    /* 6E9A4 8007E9A4 03006212 */  beq        $s3, $v0, .L8007E9B4
    /* 6E9A8 8007E9A8 03000224 */   addiu     $v0, $zero, 0x3
    /* 6E9AC 8007E9AC 06006216 */  bne        $s3, $v0, .L8007E9C8
    /* 6E9B0 8007E9B0 21200002 */   addu      $a0, $s0, $zero
  .L8007E9B4:
    /* 6E9B4 8007E9B4 80000224 */  addiu      $v0, $zero, 0x80
    /* 6E9B8 8007E9B8 040022A2 */  sb         $v0, 0x4($s1)
    /* 6E9BC 8007E9BC 050020A2 */  sb         $zero, 0x5($s1)
    /* 6E9C0 8007E9C0 060020A2 */  sb         $zero, 0x6($s1)
    /* 6E9C4 8007E9C4 21200002 */  addu       $a0, $s0, $zero
  .L8007E9C8:
    /* 6E9C8 8007E9C8 92FB010C */  jal        GetFr__7TextDati_8007ee48
    /* 6E9CC 8007E9CC 21288002 */   addu      $a1, $s4, $zero
    /* 6E9D0 8007E9D0 0400428C */  lw         $v0, 0x4($v0)
    /* 6E9D4 8007E9D4 0001033C */  lui        $v1, (0x1000000 >> 16)
    /* 6E9D8 8007E9D8 24104300 */  and        $v0, $v0, $v1
    /* 6E9DC 8007E9DC 19004010 */  beqz       $v0, .L8007EA44
    /* 6E9E0 8007E9E0 01000224 */   addiu     $v0, $zero, 0x1
    /* 6E9E4 8007E9E4 45FB010C */  jal        PRIM_GetCopy__FP8POLY_FT4
    /* 6E9E8 8007E9E8 21202002 */   addu      $a0, $s1, $zero
    /* 6E9EC 8007E9EC 21804000 */  addu       $s0, $v0, $zero
    /* 6E9F0 8007E9F0 4C46020C */  jal        ShadScaleSkew__7CBlocksP8POLY_FT4
    /* 6E9F4 8007E9F4 21200002 */   addu      $a0, $s0, $zero
    /* 6E9F8 8007E9F8 FF00053C */  lui        $a1, (0xFFFFFF >> 16)
    /* 6E9FC 8007E9FC FFFFA534 */  ori        $a1, $a1, (0xFFFFFF & 0xFFFF)
    /* 6EA00 8007EA00 80201200 */  sll        $a0, $s2, 2
    /* 6EA04 8007EA04 00FF063C */  lui        $a2, (0xFF000000 >> 16)
    /* 6EA08 8007EA08 1280023C */  lui        $v0, %hi(ThisOt)
    /* 6EA0C 8007EA0C B4AA428C */  lw         $v0, %lo(ThisOt)($v0)
    /* 6EA10 8007EA10 0000038E */  lw         $v1, 0x0($s0)
    /* 6EA14 8007EA14 21208200 */  addu       $a0, $a0, $v0
    /* 6EA18 8007EA18 0000828C */  lw         $v0, 0x0($a0)
    /* 6EA1C 8007EA1C 24186600 */  and        $v1, $v1, $a2
    /* 6EA20 8007EA20 24104500 */  and        $v0, $v0, $a1
    /* 6EA24 8007EA24 25186200 */  or         $v1, $v1, $v0
    /* 6EA28 8007EA28 000003AE */  sw         $v1, 0x0($s0)
    /* 6EA2C 8007EA2C 0000828C */  lw         $v0, 0x0($a0)
    /* 6EA30 8007EA30 24800502 */  and        $s0, $s0, $a1
    /* 6EA34 8007EA34 24104600 */  and        $v0, $v0, $a2
    /* 6EA38 8007EA38 25105000 */  or         $v0, $v0, $s0
    /* 6EA3C 8007EA3C 000082AC */  sw         $v0, 0x0($a0)
    /* 6EA40 8007EA40 01000224 */  addiu      $v0, $zero, 0x1
  .L8007EA44:
    /* 6EA44 8007EA44 03006212 */  beq        $s3, $v0, .L8007EA54
    /* 6EA48 8007EA48 03000224 */   addiu     $v0, $zero, 0x3
    /* 6EA4C 8007EA4C 02006216 */  bne        $s3, $v0, .L8007EA58
    /* 6EA50 8007EA50 21102002 */   addu      $v0, $s1, $zero
  .L8007EA54:
    /* 6EA54 8007EA54 21100000 */  addu       $v0, $zero, $zero
  .L8007EA58:
    /* 6EA58 8007EA58 3800BF8F */  lw         $ra, 0x38($sp)
    /* 6EA5C 8007EA5C 3400B58F */  lw         $s5, 0x34($sp)
    /* 6EA60 8007EA60 3000B48F */  lw         $s4, 0x30($sp)
    /* 6EA64 8007EA64 2C00B38F */  lw         $s3, 0x2C($sp)
    /* 6EA68 8007EA68 2800B28F */  lw         $s2, 0x28($sp)
    /* 6EA6C 8007EA6C 2400B18F */  lw         $s1, 0x24($sp)
    /* 6EA70 8007EA70 2000B08F */  lw         $s0, 0x20($sp)
    /* 6EA74 8007EA74 4000BD27 */  addiu      $sp, $sp, 0x40
    /* 6EA78 8007EA78 0800E003 */  jr         $ra
    /* 6EA7C 8007EA7C 00000000 */   nop
endlabel PrintOBJ_MCIRCLE1__FP12ObjectStructiiP7TextDati
