.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ConvertdPiece__Fv, 0x1C8

glabel ConvertdPiece__Fv
    /* 7287C 8008287C C416828F */  lw         $v0, %gp_rel(dPiece)($gp)
    /* 72880 80082880 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 72884 80082884 2000BFAF */  sw         $ra, 0x20($sp)
    /* 72888 80082888 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 7288C 8008288C 1800B2AF */  sw         $s2, 0x18($sp)
    /* 72890 80082890 1400B1AF */  sw         $s1, 0x14($sp)
    /* 72894 80082894 06004014 */  bnez       $v0, .L800828B0
    /* 72898 80082898 1000B0AF */   sw        $s0, 0x10($sp)
    /* 7289C 8008289C 21200000 */  addu       $a0, $zero, $zero
    /* 728A0 800828A0 1280053C */  lui        $a1, %hi(D_801194E8)
    /* 728A4 800828A4 E894A524 */  addiu      $a1, $a1, %lo(D_801194E8)
    /* 728A8 800828A8 A583000C */  jal        DBG_Error
    /* 728AC 800828AC 72000624 */   addiu     $a2, $zero, 0x72
  .L800828B0:
    /* 728B0 800828B0 21880000 */  addu       $s1, $zero, $zero
  .L800828B4:
    /* 728B4 800828B4 7000222A */  slti       $v0, $s1, 0x70
    /* 728B8 800828B8 5A004010 */  beqz       $v0, .L80082A24
    /* 728BC 800828BC 21800000 */   addu      $s0, $zero, $zero
    /* 728C0 800828C0 C0981100 */  sll        $s3, $s1, 3
  .L800828C4:
    /* 728C4 800828C4 7000022A */  slti       $v0, $s0, 0x70
    /* 728C8 800828C8 54004010 */  beqz       $v0, .L80082A1C
    /* 728CC 800828CC 21200002 */   addu      $a0, $s0, $zero
    /* 728D0 800828D0 910A020C */  jal        GetDPiece__Fii
    /* 728D4 800828D4 21282002 */   addu      $a1, $s1, $zero
    /* 728D8 800828D8 21904000 */  addu       $s2, $v0, $zero
    /* 728DC 800828DC FFFF4232 */  andi       $v0, $s2, 0xFFFF
    /* 728E0 800828E0 0208422C */  sltiu      $v0, $v0, 0x802
    /* 728E4 800828E4 05004014 */  bnez       $v0, .L800828FC
    /* 728E8 800828E8 21200000 */   addu      $a0, $zero, $zero
    /* 728EC 800828EC 1280053C */  lui        $a1, %hi(D_801194E8)
    /* 728F0 800828F0 E894A524 */  addiu      $a1, $a1, %lo(D_801194E8)
    /* 728F4 800828F4 A583000C */  jal        DBG_Error
    /* 728F8 800828F8 7A000624 */   addiu     $a2, $zero, 0x7A
  .L800828FC:
    /* 728FC 800828FC 0E80013C */  lui        $at, %hi(dung_map + 0x2)
    /* 72900 80082900 21083300 */  addu       $at, $at, $s3
    /* 72904 80082904 2A7A2290 */  lbu        $v0, %lo(dung_map + 0x2)($at)
    /* 72908 80082908 00000000 */  nop
    /* 7290C 8008290C F0004230 */  andi       $v0, $v0, 0xF0
    /* 72910 80082910 0E80013C */  lui        $at, %hi(dung_map + 0x2)
    /* 72914 80082914 21083300 */  addu       $at, $at, $s3
    /* 72918 80082918 2A7A22A0 */  sb         $v0, %lo(dung_map + 0x2)($at)
    /* 7291C 8008291C 00141200 */  sll        $v0, $s2, 16
    /* 72920 80082920 03140200 */  sra        $v0, $v0, 16
    /* 72924 80082924 0E80013C */  lui        $at, %hi(nSolidTable)
    /* 72928 80082928 21082200 */  addu       $at, $at, $v0
    /* 7292C 8008292C 08612290 */  lbu        $v0, %lo(nSolidTable)($at)
    /* 72930 80082930 00000000 */  nop
    /* 72934 80082934 05004010 */  beqz       $v0, .L8008294C
    /* 72938 80082938 21200002 */   addu      $a0, $s0, $zero
    /* 7293C 8008293C F20A020C */  jal        SetSOLID__Fii
    /* 72940 80082940 21282002 */   addu      $a1, $s1, $zero
    /* 72944 80082944 560A0208 */  j          .L80082958
    /* 72948 80082948 00141200 */   sll       $v0, $s2, 16
  .L8008294C:
    /* 7294C 8008294C 150B020C */  jal        ClearSOLID__Fii
    /* 72950 80082950 21282002 */   addu      $a1, $s1, $zero
    /* 72954 80082954 00141200 */  sll        $v0, $s2, 16
  .L80082958:
    /* 72958 80082958 03140200 */  sra        $v0, $v0, 16
    /* 7295C 8008295C 0E80013C */  lui        $at, %hi(nMissileTable)
    /* 72960 80082960 21082200 */  addu       $at, $at, $v0
    /* 72964 80082964 0C692290 */  lbu        $v0, %lo(nMissileTable)($at)
    /* 72968 80082968 00000000 */  nop
    /* 7296C 8008296C 05004010 */  beqz       $v0, .L80082984
    /* 72970 80082970 21200002 */   addu      $a0, $s0, $zero
    /* 72974 80082974 4A0B020C */  jal        SetMISSILE__Fii
    /* 72978 80082978 21282002 */   addu      $a1, $s1, $zero
    /* 7297C 8008297C 640A0208 */  j          .L80082990
    /* 72980 80082980 00141200 */   sll       $v0, $s2, 16
  .L80082984:
    /* 72984 80082984 6D0B020C */  jal        ClearMISSILE__Fii
    /* 72988 80082988 21282002 */   addu      $a1, $s1, $zero
    /* 7298C 8008298C 00141200 */  sll        $v0, $s2, 16
  .L80082990:
    /* 72990 80082990 03140200 */  sra        $v0, $v0, 16
    /* 72994 80082994 0E80013C */  lui        $at, %hi(nBlockTable)
    /* 72998 80082998 21082200 */  addu       $at, $at, $v0
    /* 7299C 8008299C 04592290 */  lbu        $v0, %lo(nBlockTable)($at)
    /* 729A0 800829A0 00000000 */  nop
    /* 729A4 800829A4 05004010 */  beqz       $v0, .L800829BC
    /* 729A8 800829A8 21200002 */   addu      $a0, $s0, $zero
    /* 729AC 800829AC 9C0B020C */  jal        SetBLOCK__Fii
    /* 729B0 800829B0 21282002 */   addu      $a1, $s1, $zero
    /* 729B4 800829B4 720A0208 */  j          .L800829C8
    /* 729B8 800829B8 00141200 */   sll       $v0, $s2, 16
  .L800829BC:
    /* 729BC 800829BC BF0B020C */  jal        ClearBLOCK__Fii
    /* 729C0 800829C0 21282002 */   addu      $a1, $s1, $zero
    /* 729C4 800829C4 00141200 */  sll        $v0, $s2, 16
  .L800829C8:
    /* 729C8 800829C8 03140200 */  sra        $v0, $v0, 16
    /* 729CC 800829CC 0E80013C */  lui        $at, %hi(nTrapTable)
    /* 729D0 800829D0 21082200 */  addu       $at, $at, $v0
    /* 729D4 800829D4 10712290 */  lbu        $v0, %lo(nTrapTable)($at)
    /* 729D8 800829D8 00000000 */  nop
    /* 729DC 800829DC 05004010 */  beqz       $v0, .L800829F4
    /* 729E0 800829E0 21200002 */   addu      $a0, $s0, $zero
    /* 729E4 800829E4 EE0B020C */  jal        SetTRAP__Fii
    /* 729E8 800829E8 21282002 */   addu      $a1, $s1, $zero
    /* 729EC 800829EC 800A0208 */  j          .L80082A00
    /* 729F0 800829F0 00141200 */   sll       $v0, $s2, 16
  .L800829F4:
    /* 729F4 800829F4 110C020C */  jal        ClearTRAP__Fii
    /* 729F8 800829F8 21282002 */   addu      $a1, $s1, $zero
    /* 729FC 800829FC 00141200 */  sll        $v0, $s2, 16
  .L80082A00:
    /* 72A00 80082A00 03004014 */  bnez       $v0, .L80082A10
    /* 72A04 80082A04 21200002 */   addu      $a0, $s0, $zero
    /* 72A08 80082A08 F20A020C */  jal        SetSOLID__Fii
    /* 72A0C 80082A0C 21282002 */   addu      $a1, $s1, $zero
  .L80082A10:
    /* 72A10 80082A10 80037326 */  addiu      $s3, $s3, 0x380
    /* 72A14 80082A14 310A0208 */  j          .L800828C4
    /* 72A18 80082A18 01001026 */   addiu     $s0, $s0, 0x1
  .L80082A1C:
    /* 72A1C 80082A1C 2D0A0208 */  j          .L800828B4
    /* 72A20 80082A20 01003126 */   addiu     $s1, $s1, 0x1
  .L80082A24:
    /* 72A24 80082A24 2000BF8F */  lw         $ra, 0x20($sp)
    /* 72A28 80082A28 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 72A2C 80082A2C 1800B28F */  lw         $s2, 0x18($sp)
    /* 72A30 80082A30 1400B18F */  lw         $s1, 0x14($sp)
    /* 72A34 80082A34 1000B08F */  lw         $s0, 0x10($sp)
    /* 72A38 80082A38 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 72A3C 80082A3C 0800E003 */  jr         $ra
    /* 72A40 80082A40 00000000 */   nop
endlabel ConvertdPiece__Fv
