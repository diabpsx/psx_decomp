.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching doshadow__FP10BIRDSTRUCTii, 0x128

glabel doshadow__FP10BIRDSTRUCTii
    /* 9CB44 800ACB44 C0FFBD27 */  addiu      $sp, $sp, -0x40
    /* 9CB48 800ACB48 3400B3AF */  sw         $s3, 0x34($sp)
    /* 9CB4C 800ACB4C 21988000 */  addu       $s3, $a0, $zero
    /* 9CB50 800ACB50 3000B2AF */  sw         $s2, 0x30($sp)
    /* 9CB54 800ACB54 2190A000 */  addu       $s2, $a1, $zero
    /* 9CB58 800ACB58 2C00B1AF */  sw         $s1, 0x2C($sp)
    /* 9CB5C 800ACB5C 2188C000 */  addu       $s1, $a2, $zero
    /* 9CB60 800ACB60 3C00BFAF */  sw         $ra, 0x3C($sp)
    /* 9CB64 800ACB64 3800B4AF */  sw         $s4, 0x38($sp)
    /* 9CB68 800ACB68 7B46020C */  jal        BL_GetCurrentBlocks__Fv
    /* 9CB6C 800ACB6C 2800B0AF */   sw        $s0, 0x28($sp)
    /* 9CB70 800ACB70 21204000 */  addu       $a0, $v0, $zero
    /* 9CB74 800ACB74 13006392 */  lbu        $v1, 0x13($s3)
    /* 9CB78 800ACB78 1280143C */  lui        $s4, %hi(MissDat)
    /* 9CB7C 800ACB7C 28BC948E */  lw         $s4, %lo(MissDat)($s4)
    /* 9CB80 800ACB80 001E0300 */  sll        $v1, $v1, 24
    /* 9CB84 800ACB84 032E0300 */  sra        $a1, $v1, 24
    /* 9CB88 800ACB88 2900A228 */  slti       $v0, $a1, 0x29
    /* 9CB8C 800ACB8C 2E004010 */  beqz       $v0, .L800ACC48
    /* 9CB90 800ACB90 23904502 */   subu      $s2, $s2, $a1
    /* 9CB94 800ACB94 43160300 */  sra        $v0, $v1, 25
    /* 9CB98 800ACB98 23882202 */  subu       $s1, $s1, $v0
    /* 9CB9C 800ACB9C 4001422E */  sltiu      $v0, $s2, 0x140
    /* 9CBA0 800ACBA0 29004010 */  beqz       $v0, .L800ACC48
    /* 9CBA4 800ACBA4 F000222E */   sltiu     $v0, $s1, 0xF0
    /* 9CBA8 800ACBA8 27004010 */  beqz       $v0, .L800ACC48
    /* 9CBAC 800ACBAC 00000000 */   nop
    /* 9CBB0 800ACBB0 C7B3020C */  jal        GetOtPos__7CBlocksi_800acf1c
    /* 9CBB4 800ACBB4 21282002 */   addu      $a1, $s1, $zero
    /* 9CBB8 800ACBB8 2000A427 */  addiu      $a0, $sp, 0x20
    /* 9CBBC 800ACBBC A8B3020C */  jal        PRIM_GetPrim__FPP8POLY_FT4_800acea0
    /* 9CBC0 800ACBC0 21804000 */   addu      $s0, $v0, $zero
    /* 9CBC4 800ACBC4 5FB2020C */  jal        GetBirdFrame__FP10BIRDSTRUCT
    /* 9CBC8 800ACBC8 21206002 */   addu      $a0, $s3, $zero
    /* 9CBCC 800ACBCC 21208002 */  addu       $a0, $s4, $zero
    /* 9CBD0 800ACBD0 21304000 */  addu       $a2, $v0, $zero
    /* 9CBD4 800ACBD4 1000B1AF */  sw         $s1, 0x10($sp)
    /* 9CBD8 800ACBD8 1400A0AF */  sw         $zero, 0x14($sp)
    /* 9CBDC 800ACBDC 1800A0AF */  sw         $zero, 0x18($sp)
    /* 9CBE0 800ACBE0 2000A58F */  lw         $a1, 0x20($sp)
    /* 9CBE4 800ACBE4 A04A020C */  jal        PrepareFt4__7TextDatP8POLY_FT4iiiii
    /* 9CBE8 800ACBE8 21384002 */   addu      $a3, $s2, $zero
    /* 9CBEC 800ACBEC 2000A48F */  lw         $a0, 0x20($sp)
    /* 9CBF0 800ACBF0 13006582 */  lb         $a1, 0x13($s3)
    /* 9CBF4 800ACBF4 85B2020C */  jal        bscale__FP8POLY_FT4i
    /* 9CBF8 800ACBF8 80801000 */   sll       $s0, $s0, 2
    /* 9CBFC 800ACBFC FF00053C */  lui        $a1, (0xFFFFFF >> 16)
    /* 9CC00 800ACC00 FFFFA534 */  ori        $a1, $a1, (0xFFFFFF & 0xFFFF)
    /* 9CC04 800ACC04 00FF063C */  lui        $a2, (0xFF000000 >> 16)
    /* 9CC08 800ACC08 1280023C */  lui        $v0, %hi(ThisOt)
    /* 9CC0C 800ACC0C B4AA428C */  lw         $v0, %lo(ThisOt)($v0)
    /* 9CC10 800ACC10 2000A48F */  lw         $a0, 0x20($sp)
    /* 9CC14 800ACC14 21800202 */  addu       $s0, $s0, $v0
    /* 9CC18 800ACC18 0000838C */  lw         $v1, 0x0($a0)
    /* 9CC1C 800ACC1C 0000028E */  lw         $v0, 0x0($s0)
    /* 9CC20 800ACC20 24186600 */  and        $v1, $v1, $a2
    /* 9CC24 800ACC24 24104500 */  and        $v0, $v0, $a1
    /* 9CC28 800ACC28 25186200 */  or         $v1, $v1, $v0
    /* 9CC2C 800ACC2C 000083AC */  sw         $v1, 0x0($a0)
    /* 9CC30 800ACC30 0000028E */  lw         $v0, 0x0($s0)
    /* 9CC34 800ACC34 24188500 */  and        $v1, $a0, $a1
    /* 9CC38 800ACC38 24104600 */  and        $v0, $v0, $a2
    /* 9CC3C 800ACC3C 25104300 */  or         $v0, $v0, $v1
    /* 9CC40 800ACC40 4C46020C */  jal        ShadScaleSkew__7CBlocksP8POLY_FT4
    /* 9CC44 800ACC44 000002AE */   sw        $v0, 0x0($s0)
  .L800ACC48:
    /* 9CC48 800ACC48 3C00BF8F */  lw         $ra, 0x3C($sp)
    /* 9CC4C 800ACC4C 3800B48F */  lw         $s4, 0x38($sp)
    /* 9CC50 800ACC50 3400B38F */  lw         $s3, 0x34($sp)
    /* 9CC54 800ACC54 3000B28F */  lw         $s2, 0x30($sp)
    /* 9CC58 800ACC58 2C00B18F */  lw         $s1, 0x2C($sp)
    /* 9CC5C 800ACC5C 2800B08F */  lw         $s0, 0x28($sp)
    /* 9CC60 800ACC60 4000BD27 */  addiu      $sp, $sp, 0x40
    /* 9CC64 800ACC64 0800E003 */  jr         $ra
    /* 9CC68 800ACC68 00000000 */   nop
endlabel doshadow__FP10BIRDSTRUCTii
