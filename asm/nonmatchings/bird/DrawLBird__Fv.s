.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DrawLBird__Fv, 0x234

glabel DrawLBird__Fv
    /* 9CC6C 800ACC6C A0FFBD27 */  addiu      $sp, $sp, -0x60
    /* 9CC70 800ACC70 5C00BFAF */  sw         $ra, 0x5C($sp)
    /* 9CC74 800ACC74 5800BEAF */  sw         $fp, 0x58($sp)
    /* 9CC78 800ACC78 5400B7AF */  sw         $s7, 0x54($sp)
    /* 9CC7C 800ACC7C 5000B6AF */  sw         $s6, 0x50($sp)
    /* 9CC80 800ACC80 4C00B5AF */  sw         $s5, 0x4C($sp)
    /* 9CC84 800ACC84 4800B4AF */  sw         $s4, 0x48($sp)
    /* 9CC88 800ACC88 4400B3AF */  sw         $s3, 0x44($sp)
    /* 9CC8C 800ACC8C 4000B2AF */  sw         $s2, 0x40($sp)
    /* 9CC90 800ACC90 3C00B1AF */  sw         $s1, 0x3C($sp)
    /* 9CC94 800ACC94 7B46020C */  jal        BL_GetCurrentBlocks__Fv
    /* 9CC98 800ACC98 3800B0AF */   sw        $s0, 0x38($sp)
    /* 9CC9C 800ACC9C 21F04000 */  addu       $fp, $v0, $zero
    /* 9CCA0 800ACCA0 1280023C */  lui        $v0, %hi(leveltype)
    /* 9CCA4 800ACCA4 0DC14290 */  lbu        $v0, %lo(leveltype)($v0)
    /* 9CCA8 800ACCA8 12800A3C */  lui        $t2, %hi(MissDat)
    /* 9CCAC 800ACCAC 28BC4A8D */  lw         $t2, %lo(MissDat)($t2)
    /* 9CCB0 800ACCB0 0D80143C */  lui        $s4, %hi(BirdList)
    /* 9CCB4 800ACCB4 74D39426 */  addiu      $s4, $s4, %lo(BirdList)
    /* 9CCB8 800ACCB8 6C004014 */  bnez       $v0, .L800ACE6C
    /* 9CCBC 800ACCBC 3000AAAF */   sw        $t2, 0x30($sp)
    /* 9CCC0 800ACCC0 21B00000 */  addu       $s6, $zero, $zero
    /* 9CCC4 800ACCC4 6210173C */  lui        $s7, (0x10624DD3 >> 16)
    /* 9CCC8 800ACCC8 D34DF736 */  ori        $s7, $s7, (0x10624DD3 & 0xFFFF)
    /* 9CCCC 800ACCCC FF00153C */  lui        $s5, (0xFFFFFF >> 16)
    /* 9CCD0 800ACCD0 FFFFB536 */  ori        $s5, $s5, (0xFFFFFF & 0xFFFF)
    /* 9CCD4 800ACCD4 13009126 */  addiu      $s1, $s4, 0x13
    /* 9CCD8 800ACCD8 1000C22A */  slti       $v0, $s6, 0x10
  .L800ACCDC:
    /* 9CCDC 800ACCDC 63004010 */  beqz       $v0, .L800ACE6C
    /* 9CCE0 800ACCE0 2120C003 */   addu      $a0, $fp, $zero
    /* 9CCE4 800ACCE4 F7FF2282 */  lb         $v0, -0x9($s1)
    /* 9CCE8 800ACCE8 00000000 */  nop
    /* 9CCEC 800ACCEC 80400200 */  sll        $t0, $v0, 2
    /* 9CCF0 800ACCF0 21400201 */  addu       $t0, $t0, $v0
    /* 9CCF4 800ACCF4 C0400800 */  sll        $t0, $t0, 3
    /* 9CCF8 800ACCF8 23400201 */  subu       $t0, $t0, $v0
    /* 9CCFC 800ACCFC 00410800 */  sll        $t0, $t0, 4
    /* 9CD00 800ACD00 21400201 */  addu       $t0, $t0, $v0
    /* 9CD04 800ACD04 18001701 */  mult       $t0, $s7
    /* 9CD08 800ACD08 2000A527 */  addiu      $a1, $sp, 0x20
    /* 9CD0C 800ACD0C F8FF2282 */  lb         $v0, -0x8($s1)
    /* 9CD10 800ACD10 C3470800 */  sra        $t0, $t0, 31
    /* 9CD14 800ACD14 80180200 */  sll        $v1, $v0, 2
    /* 9CD18 800ACD18 21186200 */  addu       $v1, $v1, $v0
    /* 9CD1C 800ACD1C C0180300 */  sll        $v1, $v1, 3
    /* 9CD20 800ACD20 23186200 */  subu       $v1, $v1, $v0
    /* 9CD24 800ACD24 00190300 */  sll        $v1, $v1, 4
    /* 9CD28 800ACD28 10480000 */  mfhi       $t1
    /* 9CD2C 800ACD2C 21186200 */  addu       $v1, $v1, $v0
    /* 9CD30 800ACD30 F5FF2282 */  lb         $v0, -0xB($s1)
    /* 9CD34 800ACD34 18007700 */  mult       $v1, $s7
    /* 9CD38 800ACD38 80300200 */  sll        $a2, $v0, 2
    /* 9CD3C 800ACD3C 2130C200 */  addu       $a2, $a2, $v0
    /* 9CD40 800ACD40 F6FF2282 */  lb         $v0, -0xA($s1)
    /* 9CD44 800ACD44 80300600 */  sll        $a2, $a2, 2
    /* 9CD48 800ACD48 80380200 */  sll        $a3, $v0, 2
    /* 9CD4C 800ACD4C 2138E200 */  addu       $a3, $a3, $v0
    /* 9CD50 800ACD50 80380700 */  sll        $a3, $a3, 2
    /* 9CD54 800ACD54 83110900 */  sra        $v0, $t1, 6
    /* 9CD58 800ACD58 23104800 */  subu       $v0, $v0, $t0
    /* 9CD5C 800ACD5C C31F0300 */  sra        $v1, $v1, 31
    /* 9CD60 800ACD60 1000A2AF */  sw         $v0, 0x10($sp)
    /* 9CD64 800ACD64 10580000 */  mfhi       $t3
    /* 9CD68 800ACD68 83110B00 */  sra        $v0, $t3, 6
    /* 9CD6C 800ACD6C 23104300 */  subu       $v0, $v0, $v1
    /* 9CD70 800ACD70 1746020C */  jal        GetScrXY__7CBlocksR4RECTiiii
    /* 9CD74 800ACD74 1400A2AF */   sw        $v0, 0x14($sp)
    /* 9CD78 800ACD78 2000B387 */  lh         $s3, 0x20($sp)
    /* 9CD7C 800ACD7C 2200B287 */  lh         $s2, 0x22($sp)
    /* 9CD80 800ACD80 4001622E */  sltiu      $v0, $s3, 0x140
    /* 9CD84 800ACD84 2E004010 */  beqz       $v0, .L800ACE40
    /* 9CD88 800ACD88 00000000 */   nop
    /* 9CD8C 800ACD8C 2C004006 */  bltz       $s2, .L800ACE40
    /* 9CD90 800ACD90 00000000 */   nop
    /* 9CD94 800ACD94 00002382 */  lb         $v1, 0x0($s1)
    /* 9CD98 800ACD98 00000000 */  nop
    /* 9CD9C 800ACD9C 23104302 */  subu       $v0, $s2, $v1
    /* 9CDA0 800ACDA0 F0004228 */  slti       $v0, $v0, 0xF0
    /* 9CDA4 800ACDA4 26004010 */  beqz       $v0, .L800ACE40
    /* 9CDA8 800ACDA8 2120C003 */   addu      $a0, $fp, $zero
    /* 9CDAC 800ACDAC C7B3020C */  jal        GetOtPos__7CBlocksi_800acf1c
    /* 9CDB0 800ACDB0 21284302 */   addu      $a1, $s2, $v1
    /* 9CDB4 800ACDB4 2800A427 */  addiu      $a0, $sp, 0x28
    /* 9CDB8 800ACDB8 A8B3020C */  jal        PRIM_GetPrim__FPP8POLY_FT4_800acea0
    /* 9CDBC 800ACDBC 21804000 */   addu      $s0, $v0, $zero
    /* 9CDC0 800ACDC0 5FB2020C */  jal        GetBirdFrame__FP10BIRDSTRUCT
    /* 9CDC4 800ACDC4 21208002 */   addu      $a0, $s4, $zero
    /* 9CDC8 800ACDC8 3000A48F */  lw         $a0, 0x30($sp)
    /* 9CDCC 800ACDCC 00002382 */  lb         $v1, 0x0($s1)
    /* 9CDD0 800ACDD0 21304000 */  addu       $a2, $v0, $zero
    /* 9CDD4 800ACDD4 1400A0AF */  sw         $zero, 0x14($sp)
    /* 9CDD8 800ACDD8 1800A0AF */  sw         $zero, 0x18($sp)
    /* 9CDDC 800ACDDC 23184302 */  subu       $v1, $s2, $v1
    /* 9CDE0 800ACDE0 1000A3AF */  sw         $v1, 0x10($sp)
    /* 9CDE4 800ACDE4 2800A58F */  lw         $a1, 0x28($sp)
    /* 9CDE8 800ACDE8 A04A020C */  jal        PrepareFt4__7TextDatP8POLY_FT4iiiii
    /* 9CDEC 800ACDEC 21386002 */   addu      $a3, $s3, $zero
    /* 9CDF0 800ACDF0 80801000 */  sll        $s0, $s0, 2
    /* 9CDF4 800ACDF4 00FF0A3C */  lui        $t2, (0xFF000000 >> 16)
    /* 9CDF8 800ACDF8 1280023C */  lui        $v0, %hi(ThisOt)
    /* 9CDFC 800ACDFC B4AA428C */  lw         $v0, %lo(ThisOt)($v0)
    /* 9CE00 800ACE00 2800A48F */  lw         $a0, 0x28($sp)
    /* 9CE04 800ACE04 21800202 */  addu       $s0, $s0, $v0
    /* 9CE08 800ACE08 0000838C */  lw         $v1, 0x0($a0)
    /* 9CE0C 800ACE0C 0000028E */  lw         $v0, 0x0($s0)
    /* 9CE10 800ACE10 24186A00 */  and        $v1, $v1, $t2
    /* 9CE14 800ACE14 24105500 */  and        $v0, $v0, $s5
    /* 9CE18 800ACE18 25186200 */  or         $v1, $v1, $v0
    /* 9CE1C 800ACE1C 000083AC */  sw         $v1, 0x0($a0)
    /* 9CE20 800ACE20 0000028E */  lw         $v0, 0x0($s0)
    /* 9CE24 800ACE24 24209500 */  and        $a0, $a0, $s5
    /* 9CE28 800ACE28 24104A00 */  and        $v0, $v0, $t2
    /* 9CE2C 800ACE2C 25104400 */  or         $v0, $v0, $a0
    /* 9CE30 800ACE30 000002AE */  sw         $v0, 0x0($s0)
    /* 9CE34 800ACE34 01000224 */  addiu      $v0, $zero, 0x1
    /* 9CE38 800ACE38 91B30208 */  j          .L800ACE44
    /* 9CE3C 800ACE3C 020022A2 */   sb        $v0, 0x2($s1)
  .L800ACE40:
    /* 9CE40 800ACE40 020020A2 */  sb         $zero, 0x2($s1)
  .L800ACE44:
    /* 9CE44 800ACE44 21208002 */  addu       $a0, $s4, $zero
    /* 9CE48 800ACE48 21286002 */  addu       $a1, $s3, $zero
    /* 9CE4C 800ACE4C 00002682 */  lb         $a2, 0x0($s1)
    /* 9CE50 800ACE50 18003126 */  addiu      $s1, $s1, 0x18
    /* 9CE54 800ACE54 18009426 */  addiu      $s4, $s4, 0x18
    /* 9CE58 800ACE58 0100D626 */  addiu      $s6, $s6, 0x1
    /* 9CE5C 800ACE5C D1B2020C */  jal        doshadow__FP10BIRDSTRUCTii
    /* 9CE60 800ACE60 23304602 */   subu      $a2, $s2, $a2
    /* 9CE64 800ACE64 37B30208 */  j          .L800ACCDC
    /* 9CE68 800ACE68 1000C22A */   slti      $v0, $s6, 0x10
  .L800ACE6C:
    /* 9CE6C 800ACE6C 5C00BF8F */  lw         $ra, 0x5C($sp)
    /* 9CE70 800ACE70 5800BE8F */  lw         $fp, 0x58($sp)
    /* 9CE74 800ACE74 5400B78F */  lw         $s7, 0x54($sp)
    /* 9CE78 800ACE78 5000B68F */  lw         $s6, 0x50($sp)
    /* 9CE7C 800ACE7C 4C00B58F */  lw         $s5, 0x4C($sp)
    /* 9CE80 800ACE80 4800B48F */  lw         $s4, 0x48($sp)
    /* 9CE84 800ACE84 4400B38F */  lw         $s3, 0x44($sp)
    /* 9CE88 800ACE88 4000B28F */  lw         $s2, 0x40($sp)
    /* 9CE8C 800ACE8C 3C00B18F */  lw         $s1, 0x3C($sp)
    /* 9CE90 800ACE90 3800B08F */  lw         $s0, 0x38($sp)
    /* 9CE94 800ACE94 6000BD27 */  addiu      $sp, $sp, 0x60
    /* 9CE98 800ACE98 0800E003 */  jr         $ra
    /* 9CE9C 800ACE9C 00000000 */   nop
endlabel DrawLBird__Fv
