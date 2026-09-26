.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching MAI_Warlord__Fi, 0x168

glabel MAI_Warlord__Fi
    /* 1AB60 80154758 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 1AB64 8015475C 1400B1AF */  sw         $s1, 0x14($sp)
    /* 1AB68 80154760 21888000 */  addu       $s1, $a0, $zero
    /* 1AB6C 80154764 40101100 */  sll        $v0, $s1, 1
    /* 1AB70 80154768 21105100 */  addu       $v0, $v0, $s1
    /* 1AB74 8015476C 80100200 */  sll        $v0, $v0, 2
    /* 1AB78 80154770 21105100 */  addu       $v0, $v0, $s1
    /* 1AB7C 80154774 C0100200 */  sll        $v0, $v0, 3
    /* 1AB80 80154778 1080033C */  lui        $v1, %hi(monster)
    /* 1AB84 8015477C 94536324 */  addiu      $v1, $v1, %lo(monster)
    /* 1AB88 80154780 1000B0AF */  sw         $s0, 0x10($sp)
    /* 1AB8C 80154784 21804300 */  addu       $s0, $v0, $v1
    /* 1AB90 80154788 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 1AB94 8015478C 34001382 */  lb         $s3, 0x34($s0)
    /* 1AB98 80154790 2000BFAF */  sw         $ra, 0x20($sp)
    /* 1AB9C 80154794 1800B2AF */  sw         $s2, 0x18($sp)
    /* 1ABA0 80154798 33000282 */  lb         $v0, 0x33($s0)
    /* 1ABA4 8015479C 35001282 */  lb         $s2, 0x35($s0)
    /* 1ABA8 801547A0 3F004014 */  bnez       $v0, .L801548A0
    /* 1ABAC 801547A4 00000000 */   nop
    /* 1ABB0 801547A8 EB2A050C */  jal        M_GetDir__Fi
    /* 1ABB4 801547AC 00000000 */   nop
    /* 1ABB8 801547B0 C0181200 */  sll        $v1, $s2, 3
    /* 1ABBC 801547B4 C0201300 */  sll        $a0, $s3, 3
    /* 1ABC0 801547B8 23209300 */  subu       $a0, $a0, $s3
    /* 1ABC4 801547BC C0210400 */  sll        $a0, $a0, 7
    /* 1ABC8 801547C0 21186400 */  addu       $v1, $v1, $a0
    /* 1ABCC 801547C4 0E80013C */  lui        $at, %hi(dung_map + 0x6)
    /* 1ABD0 801547C8 21082300 */  addu       $at, $at, $v1
    /* 1ABD4 801547CC 2E7A2390 */  lbu        $v1, %lo(dung_map + 0x6)($at)
    /* 1ABD8 801547D0 00000000 */  nop
    /* 1ABDC 801547D4 04006330 */  andi       $v1, $v1, 0x4
    /* 1ABE0 801547D8 1C006010 */  beqz       $v1, .L8015484C
    /* 1ABE4 801547DC 21904000 */   addu      $s2, $v0, $zero
    /* 1ABE8 801547E0 0000048E */  lw         $a0, 0x0($s0)
    /* 1ABEC 801547E4 6E000224 */  addiu      $v0, $zero, 0x6E
    /* 1ABF0 801547E8 18008214 */  bne        $a0, $v0, .L8015484C
    /* 1ABF4 801547EC 06000224 */   addiu     $v0, $zero, 0x6
    /* 1ABF8 801547F0 49000392 */  lbu        $v1, 0x49($s0)
    /* 1ABFC 801547F4 00000000 */  nop
    /* 1AC00 801547F8 02006214 */  bne        $v1, $v0, .L80154804
    /* 1AC04 801547FC 11000224 */   addiu     $v0, $zero, 0x11
    /* 1AC08 80154800 330002A2 */  sb         $v0, 0x33($s0)
  .L80154804:
    /* 1AC0C 80154804 0000028E */  lw         $v0, 0x0($s0)
    /* 1AC10 80154808 00000000 */  nop
    /* 1AC14 8015480C 0F004414 */  bne        $v0, $a0, .L8015484C
    /* 1AC18 80154810 00000000 */   nop
    /* 1AC1C 80154814 CDF3000C */  jal        effect_is_playing__Fi
    /* 1AC20 80154818 58030424 */   addiu     $a0, $zero, 0x358
    /* 1AC24 8015481C FF004230 */  andi       $v0, $v0, 0xFF
    /* 1AC28 80154820 0A004014 */  bnez       $v0, .L8015484C
    /* 1AC2C 80154824 07000224 */   addiu     $v0, $zero, 0x7
    /* 1AC30 80154828 49000392 */  lbu        $v1, 0x49($s0)
    /* 1AC34 8015482C 00000000 */  nop
    /* 1AC38 80154830 08006214 */  bne        $v1, $v0, .L80154854
    /* 1AC3C 80154834 01000224 */   addiu     $v0, $zero, 0x1
    /* 1AC40 80154838 01000224 */  addiu      $v0, $zero, 0x1
    /* 1AC44 8015483C 490002A2 */  sb         $v0, 0x49($s0)
    /* 1AC48 80154840 FF000224 */  addiu      $v0, $zero, 0xFF
    /* 1AC4C 80154844 4E0002A2 */  sb         $v0, 0x4E($s0)
    /* 1AC50 80154848 000000AE */  sw         $zero, 0x0($s0)
  .L8015484C:
    /* 1AC54 8015484C 49000392 */  lbu        $v1, 0x49($s0)
    /* 1AC58 80154850 01000224 */  addiu      $v0, $zero, 0x1
  .L80154854:
    /* 1AC5C 80154854 04006214 */  bne        $v1, $v0, .L80154868
    /* 1AC60 80154858 40101100 */   sll       $v0, $s1, 1
    /* 1AC64 8015485C 623F050C */  jal        MAI_SkelSd__Fi
    /* 1AC68 80154860 21202002 */   addu      $a0, $s1, $zero
    /* 1AC6C 80154864 40101100 */  sll        $v0, $s1, 1
  .L80154868:
    /* 1AC70 80154868 21105100 */  addu       $v0, $v0, $s1
    /* 1AC74 8015486C 80100200 */  sll        $v0, $v0, 2
    /* 1AC78 80154870 21105100 */  addu       $v0, $v0, $s1
    /* 1AC7C 80154874 C0100200 */  sll        $v0, $v0, 3
    /* 1AC80 80154878 1080013C */  lui        $at, %hi(monster + 0x3C)
    /* 1AC84 8015487C 21082200 */  addu       $at, $at, $v0
    /* 1AC88 80154880 D05332A0 */  sb         $s2, %lo(monster + 0x3C)($at)
    /* 1AC8C 80154884 33000382 */  lb         $v1, 0x33($s0)
    /* 1AC90 80154888 00000000 */  nop
    /* 1AC94 8015488C 03006010 */  beqz       $v1, .L8015489C
    /* 1AC98 80154890 11000224 */   addiu     $v0, $zero, 0x11
    /* 1AC9C 80154894 02006214 */  bne        $v1, $v0, .L801548A0
    /* 1ACA0 80154898 00000000 */   nop
  .L8015489C:
    /* 1ACA4 8015489C 5A0000A2 */  sb         $zero, 0x5A($s0)
  .L801548A0:
    /* 1ACA8 801548A0 2000BF8F */  lw         $ra, 0x20($sp)
    /* 1ACAC 801548A4 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 1ACB0 801548A8 1800B28F */  lw         $s2, 0x18($sp)
    /* 1ACB4 801548AC 1400B18F */  lw         $s1, 0x14($sp)
    /* 1ACB8 801548B0 1000B08F */  lw         $s0, 0x10($sp)
    /* 1ACBC 801548B4 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 1ACC0 801548B8 0800E003 */  jr         $ra
    /* 1ACC4 801548BC 00000000 */   nop
endlabel MAI_Warlord__Fi
