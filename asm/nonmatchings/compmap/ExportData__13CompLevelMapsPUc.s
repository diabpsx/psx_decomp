.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ExportData__13CompLevelMapsPUc, 0xAC

glabel ExportData__13CompLevelMapsPUc
    /* 71950 80081950 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 71954 80081954 2400B5AF */  sw         $s5, 0x24($sp)
    /* 71958 80081958 21A88000 */  addu       $s5, $a0, $zero
    /* 7195C 8008195C 2000B4AF */  sw         $s4, 0x20($sp)
    /* 71960 80081960 21A0A000 */  addu       $s4, $a1, $zero
    /* 71964 80081964 1400B1AF */  sw         $s1, 0x14($sp)
    /* 71968 80081968 B4009126 */  addiu      $s1, $s4, 0xB4
    /* 7196C 8008196C 00010224 */  addiu      $v0, $zero, 0x100
    /* 71970 80081970 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 71974 80081974 21980000 */  addu       $s3, $zero, $zero
    /* 71978 80081978 1800B2AF */  sw         $s2, 0x18($sp)
    /* 7197C 8008197C 04001224 */  addiu      $s2, $zero, 0x4
    /* 71980 80081980 1000B0AF */  sw         $s0, 0x10($sp)
    /* 71984 80081984 21808002 */  addu       $s0, $s4, $zero
    /* 71988 80081988 2800BFAF */  sw         $ra, 0x28($sp)
    /* 7198C 8008198C 000082AE */  sw         $v0, 0x0($s4)
  .L80081990:
    /* 71990 80081990 2120B202 */  addu       $a0, $s5, $s2
    /* 71994 80081994 21282002 */  addu       $a1, $s1, $zero
    /* 71998 80081998 10005226 */  addiu      $s2, $s2, 0x10
    /* 7199C 8008199C 23103402 */  subu       $v0, $s1, $s4
    /* 719A0 800819A0 040002AE */  sw         $v0, 0x4($s0)
    /* 719A4 800819A4 0000A68E */  lw         $a2, 0x0($s5)
    /* 719A8 800819A8 C506020C */  jal        WriteCompressed__4AMapPUcRC9CompClass
    /* 719AC 800819AC 01007326 */   addiu     $s3, $s3, 0x1
    /* 719B0 800819B0 21204000 */  addu       $a0, $v0, $zero
    /* 719B4 800819B4 01000524 */  addiu      $a1, $zero, 0x1
    /* 719B8 800819B8 F889000C */  jal        GAL_AlignSizeToType
    /* 719BC 800819BC 5C0004AE */   sw        $a0, 0x5C($s0)
    /* 719C0 800819C0 21882202 */  addu       $s1, $s1, $v0
    /* 719C4 800819C4 1600622A */  slti       $v0, $s3, 0x16
    /* 719C8 800819C8 F1FF4014 */  bnez       $v0, .L80081990
    /* 719CC 800819CC 04001026 */   addiu     $s0, $s0, 0x4
    /* 719D0 800819D0 23103402 */  subu       $v0, $s1, $s4
    /* 719D4 800819D4 2800BF8F */  lw         $ra, 0x28($sp)
    /* 719D8 800819D8 2400B58F */  lw         $s5, 0x24($sp)
    /* 719DC 800819DC 2000B48F */  lw         $s4, 0x20($sp)
    /* 719E0 800819E0 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 719E4 800819E4 1800B28F */  lw         $s2, 0x18($sp)
    /* 719E8 800819E8 1400B18F */  lw         $s1, 0x14($sp)
    /* 719EC 800819EC 1000B08F */  lw         $s0, 0x10($sp)
    /* 719F0 800819F0 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 719F4 800819F4 0800E003 */  jr         $ra
    /* 719F8 800819F8 00000000 */   nop
endlabel ExportData__13CompLevelMapsPUc
