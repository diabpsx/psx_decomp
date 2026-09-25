.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CdSearchFile, 0x2D8

glabel CdSearchFile
    /* CB9C 8001CB9C 0B80033C */  lui        $v1, %hi(D_800B6210)
    /* CBA0 8001CBA0 1062638C */  lw         $v1, %lo(D_800B6210)($v1)
    /* CBA4 8001CBA4 0B80023C */  lui        $v0, %hi(CD_nopen)
    /* CBA8 8001CBA8 0C5F428C */  lw         $v0, %lo(CD_nopen)($v0)
    /* CBAC 8001CBAC B0FFBD27 */  addiu      $sp, $sp, -0x50
    /* CBB0 8001CBB0 4800B6AF */  sw         $s6, 0x48($sp)
    /* CBB4 8001CBB4 21B08000 */  addu       $s6, $a0, $zero
    /* CBB8 8001CBB8 3C00B3AF */  sw         $s3, 0x3C($sp)
    /* CBBC 8001CBBC 2198A000 */  addu       $s3, $a1, $zero
    /* CBC0 8001CBC0 4C00BFAF */  sw         $ra, 0x4C($sp)
    /* CBC4 8001CBC4 4400B5AF */  sw         $s5, 0x44($sp)
    /* CBC8 8001CBC8 4000B4AF */  sw         $s4, 0x40($sp)
    /* CBCC 8001CBCC 3800B2AF */  sw         $s2, 0x38($sp)
    /* CBD0 8001CBD0 3400B1AF */  sw         $s1, 0x34($sp)
    /* CBD4 8001CBD4 09006210 */  beq        $v1, $v0, .L8001CBFC
    /* CBD8 8001CBD8 3000B0AF */   sw        $s0, 0x30($sp)
    /* CBDC 8001CBDC A573000C */  jal        func_8001CE94
    /* CBE0 8001CBE0 00000000 */   nop
    /* CBE4 8001CBE4 99004010 */  beqz       $v0, .L8001CE4C
    /* CBE8 8001CBE8 21100000 */   addu      $v0, $zero, $zero
    /* CBEC 8001CBEC 0B80023C */  lui        $v0, %hi(CD_nopen)
    /* CBF0 8001CBF0 0C5F428C */  lw         $v0, %lo(CD_nopen)($v0)
    /* CBF4 8001CBF4 0B80013C */  lui        $at, %hi(D_800B6210)
    /* CBF8 8001CBF8 106222AC */  sw         $v0, %lo(D_800B6210)($at)
  .L8001CBFC:
    /* CBFC 8001CBFC 00006382 */  lb         $v1, 0x0($s3)
    /* CC00 8001CC00 5C000224 */  addiu      $v0, $zero, 0x5C
    /* CC04 8001CC04 05006210 */  beq        $v1, $v0, .L8001CC1C
    /* CC08 8001CC08 21100000 */   addu      $v0, $zero, $zero
    /* CC0C 8001CC0C 93730008 */  j          .L8001CE4C
    /* CC10 8001CC10 00000000 */   nop
  .L8001CC14:
    /* CC14 8001CC14 29730008 */  j          .L8001CCA4
    /* CC18 8001CC18 1000A0A3 */   sb        $zero, 0x10($sp)
  .L8001CC1C:
    /* CC1C 8001CC1C 1000A0A3 */  sb         $zero, 0x10($sp)
    /* CC20 8001CC20 01000424 */  addiu      $a0, $zero, 0x1
    /* CC24 8001CC24 21806002 */  addu       $s0, $s3, $zero
    /* CC28 8001CC28 21900000 */  addu       $s2, $zero, $zero
    /* CC2C 8001CC2C 5C001524 */  addiu      $s5, $zero, 0x5C
    /* CC30 8001CC30 FFFF1424 */  addiu      $s4, $zero, -0x1
  .L8001CC34:
    /* CC34 8001CC34 00000282 */  lb         $v0, 0x0($s0)
    /* CC38 8001CC38 00000392 */  lbu        $v1, 0x0($s0)
    /* CC3C 8001CC3C 0C005510 */  beq        $v0, $s5, .L8001CC70
    /* CC40 8001CC40 1000B127 */   addiu     $s1, $sp, 0x10
    /* CC44 8001CC44 5C000524 */  addiu      $a1, $zero, 0x5C
  .L8001CC48:
    /* CC48 8001CC48 17006010 */  beqz       $v1, .L8001CCA8
    /* CC4C 8001CC4C 0800422A */   slti      $v0, $s2, 0x8
    /* CC50 8001CC50 01001026 */  addiu      $s0, $s0, 0x1
    /* CC54 8001CC54 000023A2 */  sb         $v1, 0x0($s1)
    /* CC58 8001CC58 00000282 */  lb         $v0, 0x0($s0)
    /* CC5C 8001CC5C 00000392 */  lbu        $v1, 0x0($s0)
    /* CC60 8001CC60 F9FF4514 */  bne        $v0, $a1, .L8001CC48
    /* CC64 8001CC64 01003126 */   addiu     $s1, $s1, 0x1
    /* CC68 8001CC68 00000282 */  lb         $v0, 0x0($s0)
    /* CC6C 8001CC6C 00000000 */  nop
  .L8001CC70:
    /* CC70 8001CC70 0D004010 */  beqz       $v0, .L8001CCA8
    /* CC74 8001CC74 0800422A */   slti      $v0, $s2, 0x8
    /* CC78 8001CC78 01001026 */  addiu      $s0, $s0, 0x1
    /* CC7C 8001CC7C 000020A2 */  sb         $zero, 0x0($s1)
    /* CC80 8001CC80 5674000C */  jal        func_8001D158
    /* CC84 8001CC84 1000A527 */   addiu     $a1, $sp, 0x10
    /* CC88 8001CC88 21204000 */  addu       $a0, $v0, $zero
    /* CC8C 8001CC8C E1FF9410 */  beq        $a0, $s4, .L8001CC14
    /* CC90 8001CC90 00000000 */   nop
    /* CC94 8001CC94 01005226 */  addiu      $s2, $s2, 0x1
    /* CC98 8001CC98 0800422A */  slti       $v0, $s2, 0x8
    /* CC9C 8001CC9C E5FF4014 */  bnez       $v0, .L8001CC34
    /* CCA0 8001CCA0 00000000 */   nop
  .L8001CCA4:
    /* CCA4 8001CCA4 0800422A */  slti       $v0, $s2, 0x8
  .L8001CCA8:
    /* CCA8 8001CCA8 0C004014 */  bnez       $v0, .L8001CCDC
    /* CCAC 8001CCAC 00000000 */   nop
    /* CCB0 8001CCB0 0B80023C */  lui        $v0, %hi(CD_debug)
    /* CCB4 8001CCB4 005F428C */  lw         $v0, %lo(CD_debug)($v0)
    /* CCB8 8001CCB8 00000000 */  nop
    /* CCBC 8001CCBC 62004018 */  blez       $v0, .L8001CE48
    /* CCC0 8001CCC0 21286002 */   addu      $a1, $s3, $zero
    /* CCC4 8001CCC4 1180043C */  lui        $a0, %hi(D_8010E4C8)
    /* CCC8 8001CCC8 C8E48424 */  addiu      $a0, $a0, %lo(D_8010E4C8)
    /* CCCC 8001CCCC 9367000C */  jal        printf
    /* CCD0 8001CCD0 21304002 */   addu      $a2, $s2, $zero
    /* CCD4 8001CCD4 93730008 */  j          .L8001CE4C
    /* CCD8 8001CCD8 21100000 */   addu      $v0, $zero, $zero
  .L8001CCDC:
    /* CCDC 8001CCDC 1000A283 */  lb         $v0, 0x10($sp)
    /* CCE0 8001CCE0 00000000 */  nop
    /* CCE4 8001CCE4 09004014 */  bnez       $v0, .L8001CD0C
    /* CCE8 8001CCE8 00000000 */   nop
    /* CCEC 8001CCEC 0B80023C */  lui        $v0, %hi(CD_debug)
    /* CCF0 8001CCF0 005F428C */  lw         $v0, %lo(CD_debug)($v0)
    /* CCF4 8001CCF4 00000000 */  nop
    /* CCF8 8001CCF8 53004018 */  blez       $v0, .L8001CE48
    /* CCFC 8001CCFC 21286002 */   addu      $a1, $s3, $zero
    /* CD00 8001CD00 1180043C */  lui        $a0, %hi(D_8010E4E4)
    /* CD04 8001CD04 90730008 */  j          .L8001CE40
    /* CD08 8001CD08 E4E48424 */   addiu     $a0, $a0, %lo(D_8010E4E4)
  .L8001CD0C:
    /* CD0C 8001CD0C 7F74000C */  jal        func_8001D1FC
    /* CD10 8001CD10 000020A2 */   sb        $zero, 0x0($s1)
    /* CD14 8001CD14 0B004014 */  bnez       $v0, .L8001CD44
    /* CD18 8001CD18 00000000 */   nop
    /* CD1C 8001CD1C 0B80023C */  lui        $v0, %hi(CD_debug)
    /* CD20 8001CD20 005F428C */  lw         $v0, %lo(CD_debug)($v0)
    /* CD24 8001CD24 00000000 */  nop
    /* CD28 8001CD28 48004018 */  blez       $v0, .L8001CE4C
    /* CD2C 8001CD2C 21100000 */   addu      $v0, $zero, $zero
    /* CD30 8001CD30 1180043C */  lui        $a0, %hi(D_8010E4FC)
    /* CD34 8001CD34 9367000C */  jal        printf
    /* CD38 8001CD38 FCE48424 */   addiu     $a0, $a0, %lo(D_8010E4FC)
    /* CD3C 8001CD3C 93730008 */  j          .L8001CE4C
    /* CD40 8001CD40 21100000 */   addu      $v0, $zero, $zero
  .L8001CD44:
    /* CD44 8001CD44 0B80023C */  lui        $v0, %hi(CD_debug)
    /* CD48 8001CD48 005F428C */  lw         $v0, %lo(CD_debug)($v0)
    /* CD4C 8001CD4C 00000000 */  nop
    /* CD50 8001CD50 02004228 */  slti       $v0, $v0, 0x2
    /* CD54 8001CD54 06004014 */  bnez       $v0, .L8001CD70
    /* CD58 8001CD58 21900000 */   addu      $s2, $zero, $zero
    /* CD5C 8001CD5C 1180043C */  lui        $a0, %hi(D_8010E518)
    /* CD60 8001CD60 18E58424 */  addiu      $a0, $a0, %lo(D_8010E518)
    /* CD64 8001CD64 9367000C */  jal        printf
    /* CD68 8001CD68 1000A527 */   addiu     $a1, $sp, 0x10
    /* CD6C 8001CD6C 21900000 */  addu       $s2, $zero, $zero
  .L8001CD70:
    /* CD70 8001CD70 1380023C */  lui        $v0, %hi(D_80130178)
    /* CD74 8001CD74 78014224 */  addiu      $v0, $v0, %lo(D_80130178)
    /* CD78 8001CD78 F8FF5024 */  addiu      $s0, $v0, -0x8
    /* CD7C 8001CD7C 21984000 */  addu       $s3, $v0, $zero
    /* CD80 8001CD80 21880000 */  addu       $s1, $zero, $zero
  .L8001CD84:
    /* CD84 8001CD84 1380023C */  lui        $v0, %hi(D_80130178)
    /* CD88 8001CD88 21105100 */  addu       $v0, $v0, $s1
    /* CD8C 8001CD8C 78014280 */  lb         $v0, %lo(D_80130178)($v0)
    /* CD90 8001CD90 00000000 */  nop
    /* CD94 8001CD94 23004010 */  beqz       $v0, .L8001CE24
    /* CD98 8001CD98 21206002 */   addu      $a0, $s3, $zero
    /* CD9C 8001CD9C 9D73000C */  jal        func_8001CE74
    /* CDA0 8001CDA0 1000A527 */   addiu     $a1, $sp, 0x10
    /* CDA4 8001CDA4 19004010 */  beqz       $v0, .L8001CE0C
    /* CDA8 8001CDA8 00000000 */   nop
    /* CDAC 8001CDAC 0B80023C */  lui        $v0, %hi(CD_debug)
    /* CDB0 8001CDB0 005F428C */  lw         $v0, %lo(CD_debug)($v0)
    /* CDB4 8001CDB4 00000000 */  nop
    /* CDB8 8001CDB8 02004228 */  slti       $v0, $v0, 0x2
    /* CDBC 8001CDBC 05004014 */  bnez       $v0, .L8001CDD4
    /* CDC0 8001CDC0 00000000 */   nop
    /* CDC4 8001CDC4 1180043C */  lui        $a0, %hi(D_8010E538)
    /* CDC8 8001CDC8 38E58424 */  addiu      $a0, $a0, %lo(D_8010E538)
    /* CDCC 8001CDCC 9367000C */  jal        printf
    /* CDD0 8001CDD0 1000A527 */   addiu     $a1, $sp, 0x10
  .L8001CDD4:
    /* CDD4 8001CDD4 0000028E */  lw         $v0, 0x0($s0)
    /* CDD8 8001CDD8 0400038E */  lw         $v1, 0x4($s0)
    /* CDDC 8001CDDC 0800048E */  lw         $a0, 0x8($s0)
    /* CDE0 8001CDE0 0C00058E */  lw         $a1, 0xC($s0)
    /* CDE4 8001CDE4 0000C2AE */  sw         $v0, 0x0($s6)
    /* CDE8 8001CDE8 0400C3AE */  sw         $v1, 0x4($s6)
    /* CDEC 8001CDEC 0800C4AE */  sw         $a0, 0x8($s6)
    /* CDF0 8001CDF0 0C00C5AE */  sw         $a1, 0xC($s6)
    /* CDF4 8001CDF4 1000028E */  lw         $v0, 0x10($s0)
    /* CDF8 8001CDF8 1400038E */  lw         $v1, 0x14($s0)
    /* CDFC 8001CDFC 1000C2AE */  sw         $v0, 0x10($s6)
    /* CE00 8001CE00 1400C3AE */  sw         $v1, 0x14($s6)
    /* CE04 8001CE04 93730008 */  j          .L8001CE4C
    /* CE08 8001CE08 21100002 */   addu      $v0, $s0, $zero
  .L8001CE0C:
    /* CE0C 8001CE0C 18001026 */  addiu      $s0, $s0, 0x18
    /* CE10 8001CE10 18007326 */  addiu      $s3, $s3, 0x18
    /* CE14 8001CE14 01005226 */  addiu      $s2, $s2, 0x1
    /* CE18 8001CE18 4000422A */  slti       $v0, $s2, 0x40
    /* CE1C 8001CE1C D9FF4014 */  bnez       $v0, .L8001CD84
    /* CE20 8001CE20 18003126 */   addiu     $s1, $s1, 0x18
  .L8001CE24:
    /* CE24 8001CE24 0B80023C */  lui        $v0, %hi(CD_debug)
    /* CE28 8001CE28 005F428C */  lw         $v0, %lo(CD_debug)($v0)
    /* CE2C 8001CE2C 00000000 */  nop
    /* CE30 8001CE30 05004018 */  blez       $v0, .L8001CE48
    /* CE34 8001CE34 1000A527 */   addiu     $a1, $sp, 0x10
    /* CE38 8001CE38 1180043C */  lui        $a0, %hi(D_8010E544)
    /* CE3C 8001CE3C 44E58424 */  addiu      $a0, $a0, %lo(D_8010E544)
  .L8001CE40:
    /* CE40 8001CE40 9367000C */  jal        printf
    /* CE44 8001CE44 00000000 */   nop
  .L8001CE48:
    /* CE48 8001CE48 21100000 */  addu       $v0, $zero, $zero
  .L8001CE4C:
    /* CE4C 8001CE4C 4C00BF8F */  lw         $ra, 0x4C($sp)
    /* CE50 8001CE50 4800B68F */  lw         $s6, 0x48($sp)
    /* CE54 8001CE54 4400B58F */  lw         $s5, 0x44($sp)
    /* CE58 8001CE58 4000B48F */  lw         $s4, 0x40($sp)
    /* CE5C 8001CE5C 3C00B38F */  lw         $s3, 0x3C($sp)
    /* CE60 8001CE60 3800B28F */  lw         $s2, 0x38($sp)
    /* CE64 8001CE64 3400B18F */  lw         $s1, 0x34($sp)
    /* CE68 8001CE68 3000B08F */  lw         $s0, 0x30($sp)
    /* CE6C 8001CE6C 0800E003 */  jr         $ra
    /* CE70 8001CE70 5000BD27 */   addiu     $sp, $sp, 0x50
endlabel CdSearchFile
