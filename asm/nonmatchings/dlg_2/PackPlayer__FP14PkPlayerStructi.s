.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PackPlayer__FP14PkPlayerStructi, 0x214

glabel PackPlayer__FP14PkPlayerStructi
    /* 20FA0 8015AB98 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 20FA4 8015AB9C 2400B5AF */  sw         $s5, 0x24($sp)
    /* 20FA8 8015ABA0 21A88000 */  addu       $s5, $a0, $zero
    /* 20FAC 8015ABA4 2118A000 */  addu       $v1, $a1, $zero
    /* 20FB0 8015ABA8 21280000 */  addu       $a1, $zero, $zero
    /* 20FB4 8015ABAC 40100300 */  sll        $v0, $v1, 1
    /* 20FB8 8015ABB0 21104300 */  addu       $v0, $v0, $v1
    /* 20FBC 8015ABB4 80100200 */  sll        $v0, $v0, 2
    /* 20FC0 8015ABB8 21104300 */  addu       $v0, $v0, $v1
    /* 20FC4 8015ABBC 00110200 */  sll        $v0, $v0, 4
    /* 20FC8 8015ABC0 23104300 */  subu       $v0, $v0, $v1
    /* 20FCC 8015ABC4 80100200 */  sll        $v0, $v0, 2
    /* 20FD0 8015ABC8 21104300 */  addu       $v0, $v0, $v1
    /* 20FD4 8015ABCC C0100200 */  sll        $v0, $v0, 3
    /* 20FD8 8015ABD0 0E80033C */  lui        $v1, %hi(plr)
    /* 20FDC 8015ABD4 38A56324 */  addiu      $v1, $v1, %lo(plr)
    /* 20FE0 8015ABD8 2000B4AF */  sw         $s4, 0x20($sp)
    /* 20FE4 8015ABDC 21A04300 */  addu       $s4, $v0, $v1
    /* 20FE8 8015ABE0 F8040624 */  addiu      $a2, $zero, 0x4F8
    /* 20FEC 8015ABE4 2800BFAF */  sw         $ra, 0x28($sp)
    /* 20FF0 8015ABE8 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 20FF4 8015ABEC 1800B2AF */  sw         $s2, 0x18($sp)
    /* 20FF8 8015ABF0 1400B1AF */  sw         $s1, 0x14($sp)
    /* 20FFC 8015ABF4 E940000C */  jal        memset
    /* 21000 8015ABF8 1000B0AF */   sw        $s0, 0x10($sp)
    /* 21004 8015ABFC 7804A426 */  addiu      $a0, $s5, 0x478
    /* 21008 8015AC00 1E008292 */  lbu        $v0, 0x1E($s4)
    /* 2100C 8015AC04 1F008392 */  lbu        $v1, 0x1F($s4)
    /* 21010 8015AC08 20008692 */  lbu        $a2, 0x20($s4)
    /* 21014 8015AC0C 2400878E */  lw         $a3, 0x24($s4)
    /* 21018 8015AC10 D6008526 */  addiu      $a1, $s4, 0xD6
    /* 2101C 8015AC14 E504A2A2 */  sb         $v0, 0x4E5($s5)
    /* 21020 8015AC18 E604A3A2 */  sb         $v1, 0x4E6($s5)
    /* 21024 8015AC1C E704A6A2 */  sb         $a2, 0x4E7($s5)
    /* 21028 8015AC20 F240000C */  jal        strcpy
    /* 2102C 8015AC24 E804A7A2 */   sb        $a3, 0x4E8($s5)
    /* 21030 8015AC28 F6008492 */  lbu        $a0, 0xF6($s4)
    /* 21034 8015AC2C FA008596 */  lhu        $a1, 0xFA($s4)
    /* 21038 8015AC30 FE008696 */  lhu        $a2, 0xFE($s4)
    /* 2103C 8015AC34 02018796 */  lhu        $a3, 0x102($s4)
    /* 21040 8015AC38 06018896 */  lhu        $t0, 0x106($s4)
    /* 21044 8015AC3C 3C018992 */  lbu        $t1, 0x13C($s4)
    /* 21048 8015AC40 08018A8E */  lw         $t2, 0x108($s4)
    /* 2104C 8015AC44 5A008B92 */  lbu        $t3, 0x5A($s4)
    /* 21050 8015AC48 40018C8E */  lw         $t4, 0x140($s4)
    /* 21054 8015AC4C 14018D8E */  lw         $t5, 0x114($s4)
    /* 21058 8015AC50 18018E8E */  lw         $t6, 0x118($s4)
    /* 2105C 8015AC54 28018F8E */  lw         $t7, 0x128($s4)
    /* 21060 8015AC58 2C01908E */  lw         $s0, 0x12C($s4)
    /* 21064 8015AC5C B800828E */  lw         $v0, 0xB8($s4)
    /* 21068 8015AC60 BC00838E */  lw         $v1, 0xBC($s4)
    /* 2106C 8015AC64 6400918E */  lw         $s1, 0x64($s4)
    /* 21070 8015AC68 68009292 */  lbu        $s2, 0x68($s4)
    /* 21074 8015AC6C 21980000 */  addu       $s3, $zero, $zero
    /* 21078 8015AC70 E904A4A2 */  sb         $a0, 0x4E9($s5)
    /* 2107C 8015AC74 EA04A5A2 */  sb         $a1, 0x4EA($s5)
    /* 21080 8015AC78 EB04A6A2 */  sb         $a2, 0x4EB($s5)
    /* 21084 8015AC7C EC04A7A2 */  sb         $a3, 0x4EC($s5)
    /* 21088 8015AC80 ED04A8A2 */  sb         $t0, 0x4ED($s5)
    /* 2108C 8015AC84 EE04A9A2 */  sb         $t1, 0x4EE($s5)
    /* 21090 8015AC88 EF04AAA2 */  sb         $t2, 0x4EF($s5)
    /* 21094 8015AC8C F004ABA2 */  sb         $t3, 0x4F0($s5)
    /* 21098 8015AC90 6004ACAE */  sw         $t4, 0x460($s5)
    /* 2109C 8015AC94 6404ADAE */  sw         $t5, 0x464($s5)
    /* 210A0 8015AC98 6804AEAE */  sw         $t6, 0x468($s5)
    /* 210A4 8015AC9C 6C04AFAE */  sw         $t7, 0x46C($s5)
    /* 210A8 8015ACA0 7004B0AE */  sw         $s0, 0x470($s5)
    /* 210AC 8015ACA4 5004A2AE */  sw         $v0, 0x450($s5)
    /* 210B0 8015ACA8 5404A3AE */  sw         $v1, 0x454($s5)
    /* 210B4 8015ACAC 7404B1AE */  sw         $s1, 0x474($s5)
    /* 210B8 8015ACB0 F204B2A2 */  sb         $s2, 0x4F2($s5)
    /* 210BC 8015ACB4 2118B302 */  addu       $v1, $s5, $s3
  .L8015ACB8:
    /* 210C0 8015ACB8 21109302 */  addu       $v0, $s4, $s3
    /* 210C4 8015ACBC 71004290 */  lbu        $v0, 0x71($v0)
    /* 210C8 8015ACC0 01007326 */  addiu      $s3, $s3, 0x1
    /* 210CC 8015ACC4 C00462A0 */  sb         $v0, 0x4C0($v1)
    /* 210D0 8015ACC8 2500622A */  slti       $v0, $s3, 0x25
    /* 210D4 8015ACCC FAFF4014 */  bnez       $v0, .L8015ACB8
    /* 210D8 8015ACD0 2118B302 */   addu      $v1, $s5, $s3
    /* 210DC 8015ACD4 A000B126 */  addiu      $s1, $s5, 0xA0
    /* 210E0 8015ACD8 B0019026 */  addiu      $s0, $s4, 0x1B0
    /* 210E4 8015ACDC 06001324 */  addiu      $s3, $zero, 0x6
    /* 210E8 8015ACE0 FFFF1224 */  addiu      $s2, $zero, -0x1
  .L8015ACE4:
    /* 210EC 8015ACE4 21202002 */  addu       $a0, $s1, $zero
    /* 210F0 8015ACE8 BB6A050C */  jal        PackItem__FP12PkItemStructPC10ItemStruct
    /* 210F4 8015ACEC 21280002 */   addu      $a1, $s0, $zero
    /* 210F8 8015ACF0 14003126 */  addiu      $s1, $s1, 0x14
    /* 210FC 8015ACF4 FFFF7326 */  addiu      $s3, $s3, -0x1
    /* 21100 8015ACF8 FAFF7216 */  bne        $s3, $s2, .L8015ACE4
    /* 21104 8015ACFC 6C001026 */   addiu     $s0, $s0, 0x6C
    /* 21108 8015AD00 2C01B126 */  addiu      $s1, $s5, 0x12C
    /* 2110C 8015AD04 A4049026 */  addiu      $s0, $s4, 0x4A4
    /* 21110 8015AD08 27001324 */  addiu      $s3, $zero, 0x27
    /* 21114 8015AD0C FFFF1224 */  addiu      $s2, $zero, -0x1
  .L8015AD10:
    /* 21118 8015AD10 21202002 */  addu       $a0, $s1, $zero
    /* 2111C 8015AD14 BB6A050C */  jal        PackItem__FP12PkItemStructPC10ItemStruct
    /* 21120 8015AD18 21280002 */   addu      $a1, $s0, $zero
    /* 21124 8015AD1C 14003126 */  addiu      $s1, $s1, 0x14
    /* 21128 8015AD20 FFFF7326 */  addiu      $s3, $s3, -0x1
    /* 2112C 8015AD24 FAFF7216 */  bne        $s3, $s2, .L8015AD10
    /* 21130 8015AD28 6C001026 */   addiu     $s0, $s0, 0x6C
    /* 21134 8015AD2C 21980000 */  addu       $s3, $zero, $zero
    /* 21138 8015AD30 2118B302 */  addu       $v1, $s5, $s3
  .L8015AD34:
    /* 2113C 8015AD34 21109302 */  addu       $v0, $s4, $s3
    /* 21140 8015AD38 88154290 */  lbu        $v0, 0x1588($v0)
    /* 21144 8015AD3C 01007326 */  addiu      $s3, $s3, 0x1
    /* 21148 8015AD40 980462A0 */  sb         $v0, 0x498($v1)
    /* 2114C 8015AD44 2800622A */  slti       $v0, $s3, 0x28
    /* 21150 8015AD48 FAFF4014 */  bnez       $v0, .L8015AD34
    /* 21154 8015AD4C 2118B302 */   addu      $v1, $s5, $s3
    /* 21158 8015AD50 2188A002 */  addu       $s1, $s5, $zero
    /* 2115C 8015AD54 B0159026 */  addiu      $s0, $s4, 0x15B0
    /* 21160 8015AD58 07001324 */  addiu      $s3, $zero, 0x7
    /* 21164 8015AD5C 8415828E */  lw         $v0, 0x1584($s4)
    /* 21168 8015AD60 FFFF1224 */  addiu      $s2, $zero, -0x1
    /* 2116C 8015AD64 F10422A2 */  sb         $v0, 0x4F1($s1)
  .L8015AD68:
    /* 21170 8015AD68 21202002 */  addu       $a0, $s1, $zero
    /* 21174 8015AD6C BB6A050C */  jal        PackItem__FP12PkItemStructPC10ItemStruct
    /* 21178 8015AD70 21280002 */   addu      $a1, $s0, $zero
    /* 2117C 8015AD74 14003126 */  addiu      $s1, $s1, 0x14
    /* 21180 8015AD78 FFFF7326 */  addiu      $s3, $s3, -0x1
    /* 21184 8015AD7C FAFF7216 */  bne        $s3, $s2, .L8015AD68
    /* 21188 8015AD80 6C001026 */   addiu     $s0, $s0, 0x6C
    /* 2118C 8015AD84 2800BF8F */  lw         $ra, 0x28($sp)
    /* 21190 8015AD88 2400B58F */  lw         $s5, 0x24($sp)
    /* 21194 8015AD8C 2000B48F */  lw         $s4, 0x20($sp)
    /* 21198 8015AD90 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 2119C 8015AD94 1800B28F */  lw         $s2, 0x18($sp)
    /* 211A0 8015AD98 1400B18F */  lw         $s1, 0x14($sp)
    /* 211A4 8015AD9C 1000B08F */  lw         $s0, 0x10($sp)
    /* 211A8 8015ADA0 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 211AC 8015ADA4 0800E003 */  jr         $ra
    /* 211B0 8015ADA8 00000000 */   nop
endlabel PackPlayer__FP14PkPlayerStructi
