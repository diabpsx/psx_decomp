.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching func_8001E934, 0x1A8

glabel func_8001E934
    /* E934 8001E934 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* E938 8001E938 1800B0AF */  sw         $s0, 0x18($sp)
    /* E93C 8001E93C 21808000 */  addu       $s0, $a0, $zero
    /* E940 8001E940 2000B2AF */  sw         $s2, 0x20($sp)
    /* E944 8001E944 2190A000 */  addu       $s2, $a1, $zero
    /* E948 8001E948 2400B3AF */  sw         $s3, 0x24($sp)
    /* E94C 8001E94C 2198C000 */  addu       $s3, $a2, $zero
    /* E950 8001E950 2800B4AF */  sw         $s4, 0x28($sp)
    /* E954 8001E954 21A0E000 */  addu       $s4, $a3, $zero
    /* E958 8001E958 21200000 */  addu       $a0, $zero, $zero
    /* E95C 8001E95C 00291000 */  sll        $a1, $s0, 4
    /* E960 8001E960 0001033C */  lui        $v1, (0x1000000 >> 16)
    /* E964 8001E964 2C00BFAF */  sw         $ra, 0x2C($sp)
    /* E968 8001E968 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* E96C 8001E96C 801F023C */  lui        $v0, (0x1F801088 >> 16)
    /* E970 8001E970 21104500 */  addu       $v0, $v0, $a1
    /* E974 8001E974 8810428C */  lw         $v0, (0x1F801088 & 0xFFFF)($v0)
    /* E978 8001E978 4400B193 */  lbu        $s1, 0x44($sp)
    /* E97C 8001E97C 24104300 */  and        $v0, $v0, $v1
    /* E980 8001E980 0A004010 */  beqz       $v0, .L8001E9AC
    /* E984 8001E984 0100063C */   lui       $a2, (0x10000 >> 16)
  .L8001E988:
    /* E988 8001E988 12008610 */  beq        $a0, $a2, .L8001E9D4
    /* E98C 8001E98C 00000000 */   nop
    /* E990 8001E990 801F023C */  lui        $v0, (0x1F801088 >> 16)
    /* E994 8001E994 21104500 */  addu       $v0, $v0, $a1
    /* E998 8001E998 8810428C */  lw         $v0, (0x1F801088 & 0xFFFF)($v0)
    /* E99C 8001E99C 00000000 */  nop
    /* E9A0 8001E9A0 24104300 */  and        $v0, $v0, $v1
    /* E9A4 8001E9A4 F8FF4014 */  bnez       $v0, .L8001E988
    /* E9A8 8001E9A8 01008424 */   addiu     $a0, $a0, 0x1
  .L8001E9AC:
    /* E9AC 8001E9AC 01000224 */  addiu      $v0, $zero, 0x1
  .L8001E9B0:
    /* E9B0 8001E9B0 10002216 */  bne        $s1, $v0, .L8001E9F4
    /* E9B4 8001E9B4 00000000 */   nop
    /* E9B8 8001E9B8 0B80033C */  lui        $v1, %hi(D_800B62D8)
    /* E9BC 8001E9BC D862638C */  lw         $v1, %lo(D_800B62D8)($v1)
    /* E9C0 8001E9C0 00000000 */  nop
    /* E9C4 8001E9C4 02006490 */  lbu        $a0, 0x2($v1)
    /* E9C8 8001E9C8 04100202 */  sllv       $v0, $v0, $s0
    /* E9CC 8001E9CC 837A0008 */  j          .L8001EA0C
    /* E9D0 8001E9D0 25108200 */   or        $v0, $a0, $v0
  .L8001E9D4:
    /* E9D4 8001E9D4 801F013C */  lui        $at, (0x1F801088 >> 16)
    /* E9D8 8001E9D8 21082500 */  addu       $at, $at, $a1
    /* E9DC 8001E9DC 8810258C */  lw         $a1, (0x1F801088 & 0xFFFF)($at)
    /* E9E0 8001E9E0 1180043C */  lui        $a0, %hi(D_8010E708)
    /* E9E4 8001E9E4 9367000C */  jal        printf
    /* E9E8 8001E9E8 08E78424 */   addiu     $a0, $a0, %lo(D_8010E708)
    /* E9EC 8001E9EC 6C7A0008 */  j          .L8001E9B0
    /* E9F0 8001E9F0 01000224 */   addiu     $v0, $zero, 0x1
  .L8001E9F4:
    /* E9F4 8001E9F4 0B80033C */  lui        $v1, %hi(D_800B62D8)
    /* E9F8 8001E9F8 D862638C */  lw         $v1, %lo(D_800B62D8)($v1)
    /* E9FC 8001E9FC 04100202 */  sllv       $v0, $v0, $s0
    /* EA00 8001EA00 02006490 */  lbu        $a0, 0x2($v1)
    /* EA04 8001EA04 27100200 */  nor        $v0, $zero, $v0
    /* EA08 8001EA08 24108200 */  and        $v0, $a0, $v0
  .L8001EA0C:
    /* EA0C 8001EA0C 020062A0 */  sb         $v0, 0x2($v1)
    /* EA10 8001EA10 0B80023C */  lui        $v0, %hi(D_800B62D8)
    /* EA14 8001EA14 D862428C */  lw         $v0, %lo(D_800B62D8)($v0)
    /* EA18 8001EA18 00000000 */  nop
    /* EA1C 8001EA1C 0000428C */  lw         $v0, 0x0($v0)
    /* EA20 8001EA20 00000000 */  nop
    /* EA24 8001EA24 1000A2AF */  sw         $v0, 0x10($sp)
    /* EA28 8001EA28 80301000 */  sll        $a2, $s0, 2
    /* EA2C 8001EA2C 0300C624 */  addiu      $a2, $a2, 0x3
    /* EA30 8001EA30 01000324 */  addiu      $v1, $zero, 0x1
    /* EA34 8001EA34 0418C300 */  sllv       $v1, $v1, $a2
    /* EA38 8001EA38 801F053C */  lui        $a1, (0x1F801080 >> 16)
    /* EA3C 8001EA3C 8010A534 */  ori        $a1, $a1, (0x1F801080 & 0xFFFF)
    /* EA40 8001EA40 00111000 */  sll        $v0, $s0, 4
    /* EA44 8001EA44 21284500 */  addu       $a1, $v0, $a1
    /* EA48 8001EA48 0B80043C */  lui        $a0, %hi(D_800B62D4)
    /* EA4C 8001EA4C D462848C */  lw         $a0, %lo(D_800B62D4)($a0)
    /* EA50 8001EA50 00141300 */  sll        $v0, $s3, 16
    /* EA54 8001EA54 0000868C */  lw         $a2, 0x0($a0)
    /* EA58 8001EA58 25105400 */  or         $v0, $v0, $s4
    /* EA5C 8001EA5C 2530C300 */  or         $a2, $a2, $v1
    /* EA60 8001EA60 000086AC */  sw         $a2, 0x0($a0)
    /* EA64 8001EA64 0000B2AC */  sw         $s2, 0x0($a1)
    /* EA68 8001EA68 0400A524 */  addiu      $a1, $a1, 0x4
    /* EA6C 8001EA6C 0000A2AC */  sw         $v0, 0x0($a1)
    /* EA70 8001EA70 0B80033C */  lui        $v1, %hi(D_800B62BC)
    /* EA74 8001EA74 BC62638C */  lw         $v1, %lo(D_800B62BC)($v1)
    /* EA78 8001EA78 00000000 */  nop
    /* EA7C 8001EA7C 00006290 */  lbu        $v0, 0x0($v1)
    /* EA80 8001EA80 00000000 */  nop
    /* EA84 8001EA84 40004230 */  andi       $v0, $v0, 0x40
    /* EA88 8001EA88 06004014 */  bnez       $v0, .L8001EAA4
    /* EA8C 8001EA8C 0400A524 */   addiu     $a1, $a1, 0x4
  .L8001EA90:
    /* EA90 8001EA90 00006290 */  lbu        $v0, 0x0($v1)
    /* EA94 8001EA94 00000000 */  nop
    /* EA98 8001EA98 40004230 */  andi       $v0, $v0, 0x40
    /* EA9C 8001EA9C FCFF4010 */  beqz       $v0, .L8001EA90
    /* EAA0 8001EAA0 00000000 */   nop
  .L8001EAA4:
    /* EAA4 8001EAA4 4000A28F */  lw         $v0, 0x40($sp)
    /* EAA8 8001EAA8 00000000 */  nop
    /* EAAC 8001EAAC 0000A2AC */  sw         $v0, 0x0($a1)
    /* EAB0 8001EAB0 0000A28C */  lw         $v0, 0x0($a1)
    /* EAB4 8001EAB4 00000000 */  nop
    /* EAB8 8001EAB8 1000A2AF */  sw         $v0, 0x10($sp)
    /* EABC 8001EABC 2C00BF8F */  lw         $ra, 0x2C($sp)
    /* EAC0 8001EAC0 2800B48F */  lw         $s4, 0x28($sp)
    /* EAC4 8001EAC4 2400B38F */  lw         $s3, 0x24($sp)
    /* EAC8 8001EAC8 2000B28F */  lw         $s2, 0x20($sp)
    /* EACC 8001EACC 1C00B18F */  lw         $s1, 0x1C($sp)
    /* EAD0 8001EAD0 1800B08F */  lw         $s0, 0x18($sp)
    /* EAD4 8001EAD4 0800E003 */  jr         $ra
    /* EAD8 8001EAD8 3000BD27 */   addiu     $sp, $sp, 0x30
endlabel func_8001E934
