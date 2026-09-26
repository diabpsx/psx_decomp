.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DRLG_L2FTVR__Fiiiii, 0x488

glabel DRLG_L2FTVR__Fiiiii
    /* CBF0 801467E8 B0FFBD27 */  addiu      $sp, $sp, -0x50
    /* CBF4 801467EC 2C00B1AF */  sw         $s1, 0x2C($sp)
    /* CBF8 801467F0 4400B7AF */  sw         $s7, 0x44($sp)
    /* CBFC 801467F4 21B8A000 */  addu       $s7, $a1, $zero
    /* CC00 801467F8 2800B0AF */  sw         $s0, 0x28($sp)
    /* CC04 801467FC 2180C000 */  addu       $s0, $a2, $zero
    /* CC08 80146800 4800BEAF */  sw         $fp, 0x48($sp)
    /* CC0C 80146804 21F0E000 */  addu       $fp, $a3, $zero
    /* CC10 80146808 C0481E00 */  sll        $t1, $fp, 3
    /* CC14 8014680C C0101000 */  sll        $v0, $s0, 3
    /* CC18 80146810 23105000 */  subu       $v0, $v0, $s0
    /* CC1C 80146814 C0510200 */  sll        $t2, $v0, 7
    /* CC20 80146818 21402A01 */  addu       $t0, $t1, $t2
    /* CC24 8014681C 4C00BFAF */  sw         $ra, 0x4C($sp)
    /* CC28 80146820 4000B6AF */  sw         $s6, 0x40($sp)
    /* CC2C 80146824 3C00B5AF */  sw         $s5, 0x3C($sp)
    /* CC30 80146828 3800B4AF */  sw         $s4, 0x38($sp)
    /* CC34 8014682C 3400B3AF */  sw         $s3, 0x34($sp)
    /* CC38 80146830 3000B2AF */  sw         $s2, 0x30($sp)
    /* CC3C 80146834 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* CC40 80146838 21082800 */  addu       $at, $at, $t0
    /* CC44 8014683C 2F7A2280 */  lb         $v0, %lo(dung_map + 0x7)($at)
    /* CC48 80146840 6000A58F */  lw         $a1, 0x60($sp)
    /* CC4C 80146844 6C004014 */  bnez       $v0, .L801469F8
    /* CC50 80146848 21888000 */   addu      $s1, $a0, $zero
    /* CC54 8014684C 0E80033C */  lui        $v1, %hi(dungeon)
    /* CC58 80146850 C4406324 */  addiu      $v1, $v1, %lo(dungeon)
    /* CC5C 80146854 40101100 */  sll        $v0, $s1, 1
    /* CC60 80146858 21105100 */  addu       $v0, $v0, $s1
    /* CC64 8014685C 40110200 */  sll        $v0, $v0, 5
    /* CC68 80146860 21104300 */  addu       $v0, $v0, $v1
    /* CC6C 80146864 40181700 */  sll        $v1, $s7, 1
    /* CC70 80146868 21186200 */  addu       $v1, $v1, $v0
    /* CC74 8014686C 00007694 */  lhu        $s6, 0x0($v1)
    /* CC78 80146870 03000224 */  addiu      $v0, $zero, 0x3
    /* CC7C 80146874 6100C216 */  bne        $s6, $v0, .L801469FC
    /* CC80 80146878 01000224 */   addiu     $v0, $zero, 0x1
    /* CC84 8014687C 01002B26 */  addiu      $t3, $s1, 0x1
    /* CC88 80146880 2128E002 */  addu       $a1, $s7, $zero
    /* CC8C 80146884 1800ABAF */  sw         $t3, 0x18($sp)
    /* CC90 80146888 1800A48F */  lw         $a0, 0x18($sp)
    /* CC94 8014688C 02000B26 */  addiu      $t3, $s0, 0x2
    /* CC98 80146890 2000ABAF */  sw         $t3, 0x20($sp)
    /* CC9C 80146894 2000A68F */  lw         $a2, 0x20($sp)
    /* CCA0 80146898 1280023C */  lui        $v0, %hi(TransVal)
    /* CCA4 8014689C 48C14290 */  lbu        $v0, %lo(TransVal)($v0)
    /* CCA8 801468A0 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* CCAC 801468A4 21082800 */  addu       $at, $at, $t0
    /* CCB0 801468A8 2F7A22A0 */  sb         $v0, %lo(dung_map + 0x7)($at)
    /* CCB4 801468AC 01000226 */  addiu      $v0, $s0, 0x1
    /* CCB8 801468B0 C0400200 */  sll        $t0, $v0, 3
    /* CCBC 801468B4 23400201 */  subu       $t0, $t0, $v0
    /* CCC0 801468B8 C0410800 */  sll        $t0, $t0, 7
    /* CCC4 801468BC 1280033C */  lui        $v1, %hi(TransVal)
    /* CCC8 801468C0 48C16390 */  lbu        $v1, %lo(TransVal)($v1)
    /* CCCC 801468C4 21102801 */  addu       $v0, $t1, $t0
    /* CCD0 801468C8 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* CCD4 801468CC 21082200 */  addu       $at, $at, $v0
    /* CCD8 801468D0 2F7A23A0 */  sb         $v1, %lo(dung_map + 0x7)($at)
    /* CCDC 801468D4 0100C227 */  addiu      $v0, $fp, 0x1
    /* CCE0 801468D8 C0100200 */  sll        $v0, $v0, 3
    /* CCE4 801468DC 1280093C */  lui        $t1, %hi(TransVal)
    /* CCE8 801468E0 48C12991 */  lbu        $t1, %lo(TransVal)($t1)
    /* CCEC 801468E4 21184A00 */  addu       $v1, $v0, $t2
    /* CCF0 801468E8 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* CCF4 801468EC 21082300 */  addu       $at, $at, $v1
    /* CCF8 801468F0 2F7A29A0 */  sb         $t1, %lo(dung_map + 0x7)($at)
    /* CCFC 801468F4 1280033C */  lui        $v1, %hi(TransVal)
    /* CD00 801468F8 48C16390 */  lbu        $v1, %lo(TransVal)($v1)
    /* CD04 801468FC 21104800 */  addu       $v0, $v0, $t0
    /* CD08 80146900 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* CD0C 80146904 21082200 */  addu       $at, $at, $v0
    /* CD10 80146908 2F7A23A0 */  sb         $v1, %lo(dung_map + 0x7)($at)
    /* CD14 8014690C 01000224 */  addiu      $v0, $zero, 0x1
    /* CD18 80146910 FA19050C */  jal        DRLG_L2FTVR__Fiiiii
    /* CD1C 80146914 1000A2AF */   sw        $v0, 0x10($sp)
    /* CD20 80146918 FFFF3526 */  addiu      $s5, $s1, -0x1
    /* CD24 8014691C 2120A002 */  addu       $a0, $s5, $zero
    /* CD28 80146920 2128E002 */  addu       $a1, $s7, $zero
    /* CD2C 80146924 FEFF1426 */  addiu      $s4, $s0, -0x2
    /* CD30 80146928 21308002 */  addu       $a2, $s4, $zero
    /* CD34 8014692C 2138C003 */  addu       $a3, $fp, $zero
    /* CD38 80146930 02000224 */  addiu      $v0, $zero, 0x2
    /* CD3C 80146934 FA19050C */  jal        DRLG_L2FTVR__Fiiiii
    /* CD40 80146938 1000A2AF */   sw        $v0, 0x10($sp)
    /* CD44 8014693C 21202002 */  addu       $a0, $s1, $zero
    /* CD48 80146940 0100F326 */  addiu      $s3, $s7, 0x1
    /* CD4C 80146944 21286002 */  addu       $a1, $s3, $zero
    /* CD50 80146948 21300002 */  addu       $a2, $s0, $zero
    /* CD54 8014694C 0200D227 */  addiu      $s2, $fp, 0x2
    /* CD58 80146950 21384002 */  addu       $a3, $s2, $zero
    /* CD5C 80146954 FA19050C */  jal        DRLG_L2FTVR__Fiiiii
    /* CD60 80146958 1000B6AF */   sw        $s6, 0x10($sp)
    /* CD64 8014695C 21202002 */  addu       $a0, $s1, $zero
    /* CD68 80146960 FFFFF126 */  addiu      $s1, $s7, -0x1
    /* CD6C 80146964 21282002 */  addu       $a1, $s1, $zero
    /* CD70 80146968 21300002 */  addu       $a2, $s0, $zero
    /* CD74 8014696C FEFFD027 */  addiu      $s0, $fp, -0x2
    /* CD78 80146970 21380002 */  addu       $a3, $s0, $zero
    /* CD7C 80146974 04000224 */  addiu      $v0, $zero, 0x4
    /* CD80 80146978 FA19050C */  jal        DRLG_L2FTVR__Fiiiii
    /* CD84 8014697C 1000A2AF */   sw        $v0, 0x10($sp)
    /* CD88 80146980 2120A002 */  addu       $a0, $s5, $zero
    /* CD8C 80146984 21282002 */  addu       $a1, $s1, $zero
    /* CD90 80146988 21308002 */  addu       $a2, $s4, $zero
    /* CD94 8014698C 21380002 */  addu       $a3, $s0, $zero
    /* CD98 80146990 05000224 */  addiu      $v0, $zero, 0x5
    /* CD9C 80146994 FA19050C */  jal        DRLG_L2FTVR__Fiiiii
    /* CDA0 80146998 1000A2AF */   sw        $v0, 0x10($sp)
    /* CDA4 8014699C 21282002 */  addu       $a1, $s1, $zero
    /* CDA8 801469A0 21380002 */  addu       $a3, $s0, $zero
    /* CDAC 801469A4 1800A48F */  lw         $a0, 0x18($sp)
    /* CDB0 801469A8 2000A68F */  lw         $a2, 0x20($sp)
    /* CDB4 801469AC 06000224 */  addiu      $v0, $zero, 0x6
    /* CDB8 801469B0 FA19050C */  jal        DRLG_L2FTVR__Fiiiii
    /* CDBC 801469B4 1000A2AF */   sw        $v0, 0x10($sp)
    /* CDC0 801469B8 2120A002 */  addu       $a0, $s5, $zero
    /* CDC4 801469BC 21286002 */  addu       $a1, $s3, $zero
    /* CDC8 801469C0 21308002 */  addu       $a2, $s4, $zero
    /* CDCC 801469C4 21384002 */  addu       $a3, $s2, $zero
    /* CDD0 801469C8 07000224 */  addiu      $v0, $zero, 0x7
    /* CDD4 801469CC FA19050C */  jal        DRLG_L2FTVR__Fiiiii
    /* CDD8 801469D0 1000A2AF */   sw        $v0, 0x10($sp)
    /* CDDC 801469D4 21286002 */  addu       $a1, $s3, $zero
    /* CDE0 801469D8 21384002 */  addu       $a3, $s2, $zero
    /* CDE4 801469DC 1800A48F */  lw         $a0, 0x18($sp)
    /* CDE8 801469E0 2000A68F */  lw         $a2, 0x20($sp)
    /* CDEC 801469E4 08000224 */  addiu      $v0, $zero, 0x8
    /* CDF0 801469E8 FA19050C */  jal        DRLG_L2FTVR__Fiiiii
    /* CDF4 801469EC 1000A2AF */   sw        $v0, 0x10($sp)
    /* CDF8 801469F0 0F1B0508 */  j          .L80146C3C
    /* CDFC 801469F4 00000000 */   nop
  .L801469F8:
    /* CE00 801469F8 01000224 */  addiu      $v0, $zero, 0x1
  .L801469FC:
    /* CE04 801469FC 1400A214 */  bne        $a1, $v0, .L80146A50
    /* CE08 80146A00 02000224 */   addiu     $v0, $zero, 0x2
    /* CE0C 80146A04 C0101E00 */  sll        $v0, $fp, 3
    /* CE10 80146A08 C0181000 */  sll        $v1, $s0, 3
    /* CE14 80146A0C 23187000 */  subu       $v1, $v1, $s0
    /* CE18 80146A10 C0190300 */  sll        $v1, $v1, 7
    /* CE1C 80146A14 1280043C */  lui        $a0, %hi(TransVal)
    /* CE20 80146A18 48C18490 */  lbu        $a0, %lo(TransVal)($a0)
    /* CE24 80146A1C 21104300 */  addu       $v0, $v0, $v1
    /* CE28 80146A20 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* CE2C 80146A24 21082200 */  addu       $at, $at, $v0
    /* CE30 80146A28 2F7A24A0 */  sb         $a0, %lo(dung_map + 0x7)($at)
    /* CE34 80146A2C 0100C227 */  addiu      $v0, $fp, 0x1
    /* CE38 80146A30 C0100200 */  sll        $v0, $v0, 3
    /* CE3C 80146A34 1280043C */  lui        $a0, %hi(TransVal)
    /* CE40 80146A38 48C18490 */  lbu        $a0, %lo(TransVal)($a0)
    /* CE44 80146A3C 21104300 */  addu       $v0, $v0, $v1
    /* CE48 80146A40 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* CE4C 80146A44 21082200 */  addu       $at, $at, $v0
    /* CE50 80146A48 2F7A24A0 */  sb         $a0, %lo(dung_map + 0x7)($at)
    /* CE54 80146A4C 02000224 */  addiu      $v0, $zero, 0x2
  .L80146A50:
    /* CE58 80146A50 1500A214 */  bne        $a1, $v0, .L80146AA8
    /* CE5C 80146A54 03000224 */   addiu     $v0, $zero, 0x3
    /* CE60 80146A58 C0201E00 */  sll        $a0, $fp, 3
    /* CE64 80146A5C 01000226 */  addiu      $v0, $s0, 0x1
    /* CE68 80146A60 C0180200 */  sll        $v1, $v0, 3
    /* CE6C 80146A64 23186200 */  subu       $v1, $v1, $v0
    /* CE70 80146A68 C0190300 */  sll        $v1, $v1, 7
    /* CE74 80146A6C 1280023C */  lui        $v0, %hi(TransVal)
    /* CE78 80146A70 48C14290 */  lbu        $v0, %lo(TransVal)($v0)
    /* CE7C 80146A74 21208300 */  addu       $a0, $a0, $v1
    /* CE80 80146A78 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* CE84 80146A7C 21082400 */  addu       $at, $at, $a0
    /* CE88 80146A80 2F7A22A0 */  sb         $v0, %lo(dung_map + 0x7)($at)
    /* CE8C 80146A84 0100C227 */  addiu      $v0, $fp, 0x1
    /* CE90 80146A88 C0100200 */  sll        $v0, $v0, 3
    /* CE94 80146A8C 1280043C */  lui        $a0, %hi(TransVal)
    /* CE98 80146A90 48C18490 */  lbu        $a0, %lo(TransVal)($a0)
    /* CE9C 80146A94 21104300 */  addu       $v0, $v0, $v1
    /* CEA0 80146A98 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* CEA4 80146A9C 21082200 */  addu       $at, $at, $v0
    /* CEA8 80146AA0 2F7A24A0 */  sb         $a0, %lo(dung_map + 0x7)($at)
    /* CEAC 80146AA4 03000224 */  addiu      $v0, $zero, 0x3
  .L80146AA8:
    /* CEB0 80146AA8 1600A214 */  bne        $a1, $v0, .L80146B04
    /* CEB4 80146AAC 04000224 */   addiu     $v0, $zero, 0x4
    /* CEB8 80146AB0 C0201E00 */  sll        $a0, $fp, 3
    /* CEBC 80146AB4 C0101000 */  sll        $v0, $s0, 3
    /* CEC0 80146AB8 23105000 */  subu       $v0, $v0, $s0
    /* CEC4 80146ABC C0110200 */  sll        $v0, $v0, 7
    /* CEC8 80146AC0 1280033C */  lui        $v1, %hi(TransVal)
    /* CECC 80146AC4 48C16390 */  lbu        $v1, %lo(TransVal)($v1)
    /* CED0 80146AC8 21108200 */  addu       $v0, $a0, $v0
    /* CED4 80146ACC 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* CED8 80146AD0 21082200 */  addu       $at, $at, $v0
    /* CEDC 80146AD4 2F7A23A0 */  sb         $v1, %lo(dung_map + 0x7)($at)
    /* CEE0 80146AD8 01000326 */  addiu      $v1, $s0, 0x1
    /* CEE4 80146ADC C0100300 */  sll        $v0, $v1, 3
    /* CEE8 80146AE0 23104300 */  subu       $v0, $v0, $v1
    /* CEEC 80146AE4 C0110200 */  sll        $v0, $v0, 7
    /* CEF0 80146AE8 1280033C */  lui        $v1, %hi(TransVal)
    /* CEF4 80146AEC 48C16390 */  lbu        $v1, %lo(TransVal)($v1)
    /* CEF8 80146AF0 21208200 */  addu       $a0, $a0, $v0
    /* CEFC 80146AF4 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* CF00 80146AF8 21082400 */  addu       $at, $at, $a0
    /* CF04 80146AFC 2F7A23A0 */  sb         $v1, %lo(dung_map + 0x7)($at)
    /* CF08 80146B00 04000224 */  addiu      $v0, $zero, 0x4
  .L80146B04:
    /* CF0C 80146B04 1700A214 */  bne        $a1, $v0, .L80146B64
    /* CF10 80146B08 05000224 */   addiu     $v0, $zero, 0x5
    /* CF14 80146B0C 0100C427 */  addiu      $a0, $fp, 0x1
    /* CF18 80146B10 C0200400 */  sll        $a0, $a0, 3
    /* CF1C 80146B14 C0101000 */  sll        $v0, $s0, 3
    /* CF20 80146B18 23105000 */  subu       $v0, $v0, $s0
    /* CF24 80146B1C C0110200 */  sll        $v0, $v0, 7
    /* CF28 80146B20 1280033C */  lui        $v1, %hi(TransVal)
    /* CF2C 80146B24 48C16390 */  lbu        $v1, %lo(TransVal)($v1)
    /* CF30 80146B28 21108200 */  addu       $v0, $a0, $v0
    /* CF34 80146B2C 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* CF38 80146B30 21082200 */  addu       $at, $at, $v0
    /* CF3C 80146B34 2F7A23A0 */  sb         $v1, %lo(dung_map + 0x7)($at)
    /* CF40 80146B38 01000326 */  addiu      $v1, $s0, 0x1
    /* CF44 80146B3C C0100300 */  sll        $v0, $v1, 3
    /* CF48 80146B40 23104300 */  subu       $v0, $v0, $v1
    /* CF4C 80146B44 C0110200 */  sll        $v0, $v0, 7
    /* CF50 80146B48 1280033C */  lui        $v1, %hi(TransVal)
    /* CF54 80146B4C 48C16390 */  lbu        $v1, %lo(TransVal)($v1)
    /* CF58 80146B50 21208200 */  addu       $a0, $a0, $v0
    /* CF5C 80146B54 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* CF60 80146B58 21082400 */  addu       $at, $at, $a0
    /* CF64 80146B5C 2F7A23A0 */  sb         $v1, %lo(dung_map + 0x7)($at)
    /* CF68 80146B60 05000224 */  addiu      $v0, $zero, 0x5
  .L80146B64:
    /* CF6C 80146B64 0E00A214 */  bne        $a1, $v0, .L80146BA0
    /* CF70 80146B68 06000224 */   addiu     $v0, $zero, 0x6
    /* CF74 80146B6C 0100C327 */  addiu      $v1, $fp, 0x1
    /* CF78 80146B70 C0180300 */  sll        $v1, $v1, 3
    /* CF7C 80146B74 01000426 */  addiu      $a0, $s0, 0x1
    /* CF80 80146B78 C0100400 */  sll        $v0, $a0, 3
    /* CF84 80146B7C 23104400 */  subu       $v0, $v0, $a0
    /* CF88 80146B80 C0110200 */  sll        $v0, $v0, 7
    /* CF8C 80146B84 1280043C */  lui        $a0, %hi(TransVal)
    /* CF90 80146B88 48C18490 */  lbu        $a0, %lo(TransVal)($a0)
    /* CF94 80146B8C 21186200 */  addu       $v1, $v1, $v0
    /* CF98 80146B90 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* CF9C 80146B94 21082300 */  addu       $at, $at, $v1
    /* CFA0 80146B98 2F7A24A0 */  sb         $a0, %lo(dung_map + 0x7)($at)
    /* CFA4 80146B9C 06000224 */  addiu      $v0, $zero, 0x6
  .L80146BA0:
    /* CFA8 80146BA0 0D00A214 */  bne        $a1, $v0, .L80146BD8
    /* CFAC 80146BA4 07000224 */   addiu     $v0, $zero, 0x7
    /* CFB0 80146BA8 0100C227 */  addiu      $v0, $fp, 0x1
    /* CFB4 80146BAC C0100200 */  sll        $v0, $v0, 3
    /* CFB8 80146BB0 C0181000 */  sll        $v1, $s0, 3
    /* CFBC 80146BB4 23187000 */  subu       $v1, $v1, $s0
    /* CFC0 80146BB8 C0190300 */  sll        $v1, $v1, 7
    /* CFC4 80146BBC 1280043C */  lui        $a0, %hi(TransVal)
    /* CFC8 80146BC0 48C18490 */  lbu        $a0, %lo(TransVal)($a0)
    /* CFCC 80146BC4 21104300 */  addu       $v0, $v0, $v1
    /* CFD0 80146BC8 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* CFD4 80146BCC 21082200 */  addu       $at, $at, $v0
    /* CFD8 80146BD0 2F7A24A0 */  sb         $a0, %lo(dung_map + 0x7)($at)
    /* CFDC 80146BD4 07000224 */  addiu      $v0, $zero, 0x7
  .L80146BD8:
    /* CFE0 80146BD8 0D00A214 */  bne        $a1, $v0, .L80146C10
    /* CFE4 80146BDC 08000224 */   addiu     $v0, $zero, 0x8
    /* CFE8 80146BE0 C0201E00 */  sll        $a0, $fp, 3
    /* CFEC 80146BE4 01000326 */  addiu      $v1, $s0, 0x1
    /* CFF0 80146BE8 C0100300 */  sll        $v0, $v1, 3
    /* CFF4 80146BEC 23104300 */  subu       $v0, $v0, $v1
    /* CFF8 80146BF0 C0110200 */  sll        $v0, $v0, 7
    /* CFFC 80146BF4 1280033C */  lui        $v1, %hi(TransVal)
    /* D000 80146BF8 48C16390 */  lbu        $v1, %lo(TransVal)($v1)
    /* D004 80146BFC 21208200 */  addu       $a0, $a0, $v0
    /* D008 80146C00 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* D00C 80146C04 21082400 */  addu       $at, $at, $a0
    /* D010 80146C08 2F7A23A0 */  sb         $v1, %lo(dung_map + 0x7)($at)
    /* D014 80146C0C 08000224 */  addiu      $v0, $zero, 0x8
  .L80146C10:
    /* D018 80146C10 0A00A214 */  bne        $a1, $v0, .L80146C3C
    /* D01C 80146C14 C0101E00 */   sll       $v0, $fp, 3
    /* D020 80146C18 C0181000 */  sll        $v1, $s0, 3
    /* D024 80146C1C 23187000 */  subu       $v1, $v1, $s0
    /* D028 80146C20 C0190300 */  sll        $v1, $v1, 7
    /* D02C 80146C24 1280043C */  lui        $a0, %hi(TransVal)
    /* D030 80146C28 48C18490 */  lbu        $a0, %lo(TransVal)($a0)
    /* D034 80146C2C 21104300 */  addu       $v0, $v0, $v1
    /* D038 80146C30 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* D03C 80146C34 21082200 */  addu       $at, $at, $v0
    /* D040 80146C38 2F7A24A0 */  sb         $a0, %lo(dung_map + 0x7)($at)
  .L80146C3C:
    /* D044 80146C3C 4C00BF8F */  lw         $ra, 0x4C($sp)
    /* D048 80146C40 4800BE8F */  lw         $fp, 0x48($sp)
    /* D04C 80146C44 4400B78F */  lw         $s7, 0x44($sp)
    /* D050 80146C48 4000B68F */  lw         $s6, 0x40($sp)
    /* D054 80146C4C 3C00B58F */  lw         $s5, 0x3C($sp)
    /* D058 80146C50 3800B48F */  lw         $s4, 0x38($sp)
    /* D05C 80146C54 3400B38F */  lw         $s3, 0x34($sp)
    /* D060 80146C58 3000B28F */  lw         $s2, 0x30($sp)
    /* D064 80146C5C 2C00B18F */  lw         $s1, 0x2C($sp)
    /* D068 80146C60 2800B08F */  lw         $s0, 0x28($sp)
    /* D06C 80146C64 5000BD27 */  addiu      $sp, $sp, 0x50
    /* D070 80146C68 0800E003 */  jr         $ra
    /* D074 80146C6C 00000000 */   nop
endlabel DRLG_L2FTVR__Fiiiii
