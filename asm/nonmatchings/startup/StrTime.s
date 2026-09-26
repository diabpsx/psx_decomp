.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

/* Handwritten function */
nonmatching StrTime, 0x9

glabel StrTime
    /* A07D4 800B07D4 31343A33 */  andi       $k0, $t9, 0x3431 /* handwritten instruction */
    /* A07D8 800B07D8 303A3435 */  ori        $s4, $t1, 0x3A30
    /* A07DC 800B07DC 00000000 */  nop
  alabel Words
    /* A07E0 800B07E0 D4BC1180 */  lb         $s1, -0x432C($zero)
    /* A07E4 800B07E4 DCBC1180 */  lb         $s1, -0x4324($zero)
    /* A07E8 800B07E8 E4BC1180 */  lb         $s1, -0x431C($zero)
    /* A07EC 800B07EC ECBC1180 */  lb         $s1, -0x4314($zero)
    /* A07F0 800B07F0 F4BC1180 */  lb         $s1, -0x430C($zero)
    /* A07F4 800B07F4 FCBC1180 */  lb         $s1, -0x4304($zero)
    /* A07F8 800B07F8 908E1180 */  lb         $s1, -0x7170($zero)
    /* A07FC 800B07FC 9C8E1180 */  lb         $s1, -0x7164($zero)
    /* A0800 800B0800 04BD1180 */  lb         $s1, -0x42FC($zero)
    /* A0804 800B0804 0CBD1180 */  lb         $s1, -0x42F4($zero)
    /* A0808 800B0808 14BD1180 */  lb         $s1, -0x42EC($zero)
    /* A080C 800B080C 1CBD1180 */  lb         $s1, -0x42E4($zero)
    /* A0810 800B0810 24BD1180 */  lb         $s1, -0x42DC($zero)
    /* A0814 800B0814 2CBD1180 */  lb         $s1, -0x42D4($zero)
    /* A0818 800B0818 34BD1180 */  lb         $s1, -0x42CC($zero)
    /* A081C 800B081C AC8E1180 */  lb         $s1, -0x7154($zero)
    /* A0820 800B0820 3CBD1180 */  lb         $s1, -0x42C4($zero)
    /* A0824 800B0824 44BD1180 */  lb         $s1, -0x42BC($zero)
    /* A0828 800B0828 B88E1180 */  lb         $s1, -0x7148($zero)
    /* A082C 800B082C 4CBD1180 */  lb         $s1, -0x42B4($zero)
    /* A0830 800B0830 54BD1180 */  lb         $s1, -0x42AC($zero)
    /* A0834 800B0834 5CBD1180 */  lb         $s1, -0x42A4($zero)
    /* A0838 800B0838 64BD1180 */  lb         $s1, -0x429C($zero)
    /* A083C 800B083C 6CBD1180 */  lb         $s1, -0x4294($zero)
    /* A0840 800B0840 74BD1180 */  lb         $s1, -0x428C($zero)
    /* A0844 800B0844 C48E1180 */  lb         $s1, -0x713C($zero)
    /* A0848 800B0848 7CBD1180 */  lb         $s1, -0x4284($zero)
    /* A084C 800B084C D88E1180 */  lb         $s1, -0x7128($zero)
    /* A0850 800B0850 E48E1180 */  lb         $s1, -0x711C($zero)
    /* A0854 800B0854 84BD1180 */  lb         $s1, -0x427C($zero)
    /* A0858 800B0858 8CBD1180 */  lb         $s1, -0x4274($zero)
    /* A085C 800B085C FC8E1180 */  lb         $s1, -0x7104($zero)
    /* A0860 800B0860 94BD1180 */  lb         $s1, -0x426C($zero)
    /* A0864 800B0864 088F1180 */  lb         $s1, -0x70F8($zero)
    /* A0868 800B0868 9CBD1180 */  lb         $s1, -0x4264($zero)
    /* A086C 800B086C A4BD1180 */  lb         $s1, -0x425C($zero)
    /* A0870 800B0870 ACBD1180 */  lb         $s1, -0x4254($zero)
    /* A0874 800B0874 148F1180 */  lb         $s1, -0x70EC($zero)
    /* A0878 800B0878 208F1180 */  lb         $s1, -0x70E0($zero)
    /* A087C 800B087C B4BD1180 */  lb         $s1, -0x424C($zero)
    /* A0880 800B0880 2C8F1180 */  lb         $s1, -0x70D4($zero)
    /* A0884 800B0884 3C8F1180 */  lb         $s1, -0x70C4($zero)
    /* A0888 800B0888 488F1180 */  lb         $s1, -0x70B8($zero)
    /* A088C 800B088C 588F1180 */  lb         $s1, -0x70A8($zero)
    /* A0890 800B0890 648F1180 */  lb         $s1, -0x709C($zero)
    /* A0894 800B0894 748F1180 */  lb         $s1, -0x708C($zero)
    /* A0898 800B0898 808F1180 */  lb         $s1, -0x7080($zero)
    /* A089C 800B089C 8C8F1180 */  lb         $s1, -0x7074($zero)
    /* A08A0 800B08A0 988F1180 */  lb         $s1, -0x7068($zero)
    /* A08A4 800B08A4 A88F1180 */  lb         $s1, -0x7058($zero)
    /* A08A8 800B08A8 B88F1180 */  lb         $s1, -0x7048($zero)
    /* A08AC 800B08AC C48F1180 */  lb         $s1, -0x703C($zero)
    /* A08B0 800B08B0 D48F1180 */  lb         $s1, -0x702C($zero)
    /* A08B4 800B08B4 E48F1180 */  lb         $s1, -0x701C($zero)
    /* A08B8 800B08B8 F08F1180 */  lb         $s1, -0x7010($zero)
    /* A08BC 800B08BC 00901180 */  lb         $s1, -0x7000($zero)
    /* A08C0 800B08C0 0C901180 */  lb         $s1, -0x6FF4($zero)
    /* A08C4 800B08C4 20901180 */  lb         $s1, -0x6FE0($zero)
    /* A08C8 800B08C8 34901180 */  lb         $s1, -0x6FCC($zero)
    /* A08CC 800B08CC 48901180 */  lb         $s1, -0x6FB8($zero)
    /* A08D0 800B08D0 58901180 */  lb         $s1, -0x6FA8($zero)
    /* A08D4 800B08D4 74901180 */  lb         $s1, -0x6F8C($zero)
    /* A08D8 800B08D8 80901180 */  lb         $s1, -0x6F80($zero)
    /* A08DC 800B08DC 98901180 */  lb         $s1, -0x6F68($zero)
    /* A08E0 800B08E0 B4901180 */  lb         $s1, -0x6F4C($zero)
    /* A08E4 800B08E4 D4901180 */  lb         $s1, -0x6F2C($zero)
    /* A08E8 800B08E8 F8901180 */  lb         $s1, -0x6F08($zero)
    /* A08EC 800B08EC 08911180 */  lb         $s1, -0x6EF8($zero)
    /* A08F0 800B08F0 20911180 */  lb         $s1, -0x6EE0($zero)
    /* A08F4 800B08F4 BCBD1180 */  lb         $s1, -0x4244($zero)
    /* A08F8 800B08F8 34911180 */  lb         $s1, -0x6ECC($zero)
    /* A08FC 800B08FC 44911180 */  lb         $s1, -0x6EBC($zero)
    /* A0900 800B0900 50911180 */  lb         $s1, -0x6EB0($zero)
    /* A0904 800B0904 60911180 */  lb         $s1, -0x6EA0($zero)
    /* A0908 800B0908 6C911180 */  lb         $s1, -0x6E94($zero)
    /* A090C 800B090C 84911180 */  lb         $s1, -0x6E7C($zero)
    /* A0910 800B0910 98911180 */  lb         $s1, -0x6E68($zero)
    /* A0914 800B0914 B0911180 */  lb         $s1, -0x6E50($zero)
    /* A0918 800B0918 C0911180 */  lb         $s1, -0x6E40($zero)
    /* A091C 800B091C D0911180 */  lb         $s1, -0x6E30($zero)
    /* A0920 800B0920 E0911180 */  lb         $s1, -0x6E20($zero)
    /* A0924 800B0924 F0911180 */  lb         $s1, -0x6E10($zero)
    /* A0928 800B0928 00921180 */  lb         $s1, -0x6E00($zero)
    /* A092C 800B092C 10921180 */  lb         $s1, -0x6DF0($zero)
    /* A0930 800B0930 20921180 */  lb         $s1, -0x6DE0($zero)
    /* A0934 800B0934 30921180 */  lb         $s1, -0x6DD0($zero)
    /* A0938 800B0938 40921180 */  lb         $s1, -0x6DC0($zero)
    /* A093C 800B093C 58921180 */  lb         $s1, -0x6DA8($zero)
    /* A0940 800B0940 C4BD1180 */  lb         $s1, -0x423C($zero)
    /* A0944 800B0944 CCBD1180 */  lb         $s1, -0x4234($zero)
    /* A0948 800B0948 D4BD1180 */  lb         $s1, -0x422C($zero)
    /* A094C 800B094C 70921180 */  lb         $s1, -0x6D90($zero)
    /* A0950 800B0950 7C921180 */  lb         $s1, -0x6D84($zero)
    /* A0954 800B0954 94921180 */  lb         $s1, -0x6D6C($zero)
    /* A0958 800B0958 A0921180 */  lb         $s1, -0x6D60($zero)
    /* A095C 800B095C AC921180 */  lb         $s1, -0x6D54($zero)
    /* A0960 800B0960 B8921180 */  lb         $s1, -0x6D48($zero)
    /* A0964 800B0964 C8921180 */  lb         $s1, -0x6D38($zero)
    /* A0968 800B0968 E0921180 */  lb         $s1, -0x6D20($zero)
    /* A096C 800B096C F8921180 */  lb         $s1, -0x6D08($zero)
    /* A0970 800B0970 0C931180 */  lb         $s1, -0x6CF4($zero)
    /* A0974 800B0974 28931180 */  lb         $s1, -0x6CD8($zero)
    /* A0978 800B0978 40931180 */  lb         $s1, -0x6CC0($zero)
    /* A097C 800B097C 50931180 */  lb         $s1, -0x6CB0($zero)
    /* A0980 800B0980 68931180 */  lb         $s1, -0x6C98($zero)
    /* A0984 800B0984 78931180 */  lb         $s1, -0x6C88($zero)
    /* A0988 800B0988 88931180 */  lb         $s1, -0x6C78($zero)
    /* A098C 800B098C A4931180 */  lb         $s1, -0x6C5C($zero)
    /* A0990 800B0990 B4931180 */  lb         $s1, -0x6C4C($zero)
    /* A0994 800B0994 CC931180 */  lb         $s1, -0x6C34($zero)
    /* A0998 800B0998 E0931180 */  lb         $s1, -0x6C20($zero)
    /* A099C 800B099C FC931180 */  lb         $s1, -0x6C04($zero)
    /* A09A0 800B09A0 DCBD1180 */  lb         $s1, -0x4224($zero)
    /* A09A4 800B09A4 0C941180 */  lb         $s1, -0x6BF4($zero)
    /* A09A8 800B09A8 1C941180 */  lb         $s1, -0x6BE4($zero)
    /* A09AC 800B09AC 20911180 */  lb         $s1, -0x6EE0($zero)
    /* A09B0 800B09B0 30941180 */  lb         $s1, -0x6BD0($zero)
    /* A09B4 800B09B4 40941180 */  lb         $s1, -0x6BC0($zero)
  alabel MonDays
    /* A09B8 800B09B8 E4BD1180 */  lb         $s1, -0x421C($zero)
    /* A09BC 800B09BC 1F000000 */  ddivu      $zero, $zero, $zero
    /* A09C0 800B09C0 E8BD1180 */  lb         $s1, -0x4218($zero)
    /* A09C4 800B09C4 1C000000 */  dmult      $zero, $zero
    /* A09C8 800B09C8 ECBD1180 */  lb         $s1, -0x4214($zero)
    /* A09CC 800B09CC 1F000000 */  ddivu      $zero, $zero, $zero
    /* A09D0 800B09D0 F0BD1180 */  lb         $s1, -0x4210($zero)
    /* A09D4 800B09D4 1E000000 */  ddiv       $zero, $zero, $zero
    /* A09D8 800B09D8 F4BD1180 */  lb         $s1, -0x420C($zero)
    /* A09DC 800B09DC 1F000000 */  ddivu      $zero, $zero, $zero
    /* A09E0 800B09E0 F8BD1180 */  lb         $s1, -0x4208($zero)
    /* A09E4 800B09E4 1E000000 */  ddiv       $zero, $zero, $zero
    /* A09E8 800B09E8 FCBD1180 */  lb         $s1, -0x4204($zero)
    /* A09EC 800B09EC 1F000000 */  ddivu      $zero, $zero, $zero
    /* A09F0 800B09F0 00BE1180 */  lb         $s1, -0x4200($zero)
    /* A09F4 800B09F4 1F000000 */  ddivu      $zero, $zero, $zero
    /* A09F8 800B09F8 04BE1180 */  lb         $s1, -0x41FC($zero)
    /* A09FC 800B09FC 1E000000 */  ddiv       $zero, $zero, $zero
    /* A0A00 800B0A00 08BE1180 */  lb         $s1, -0x41F8($zero)
    /* A0A04 800B0A04 1F000000 */  ddivu      $zero, $zero, $zero
    /* A0A08 800B0A08 0CBE1180 */  lb         $s1, -0x41F4($zero)
    /* A0A0C 800B0A0C 1E000000 */  ddiv       $zero, $zero, $zero
    /* A0A10 800B0A10 10BE1180 */  lb         $s1, -0x41F0($zero)
    /* A0A14 800B0A14 1F000000 */  ddivu      $zero, $zero, $zero
  alabel GetVersionString__FPc
    /* A0A18 800B0A18 B8FFBD27 */  addiu      $sp, $sp, -0x48
    /* A0A1C 800B0A1C 3C00B1AF */  sw         $s1, 0x3C($sp)
    /* A0A20 800B0A20 21888000 */  addu       $s1, $a0, $zero
    /* A0A24 800B0A24 4000BFAF */  sw         $ra, 0x40($sp)
    /* A0A28 800B0A28 3800B0AF */  sw         $s0, 0x38($sp)
    /* A0A2C 800B0A2C 1280023C */  lui        $v0, %hi(D_80119464)
    /* A0A30 800B0A30 64944284 */  lh         $v0, %lo(D_80119464)($v0)
    /* A0A34 800B0A34 1280033C */  lui        $v1, %hi(D_80119466)
    /* A0A38 800B0A38 66946380 */  lb         $v1, %lo(D_80119466)($v1)
    /* A0A3C 800B0A3C 1000A2A7 */  sh         $v0, 0x10($sp)
    /* A0A40 800B0A40 1200A3A3 */  sb         $v1, 0x12($sp)
    /* A0A44 800B0A44 1280023C */  lui        $v0, %hi(D_8011946D)
    /* A0A48 800B0A48 6D944280 */  lb         $v0, %lo(D_8011946D)($v0)
    /* A0A4C 800B0A4C 1280033C */  lui        $v1, %hi(D_8011946E)
    /* A0A50 800B0A50 6E946380 */  lb         $v1, %lo(D_8011946E)($v1)
    /* A0A54 800B0A54 1300A2A3 */  sb         $v0, 0x13($sp)
    /* A0A58 800B0A58 1400A3A3 */  sb         $v1, 0x14($sp)
    /* A0A5C 800B0A5C 1280023C */  lui        $v0, %hi(D_80119468)
    /* A0A60 800B0A60 68944280 */  lb         $v0, %lo(D_80119468)($v0)
    /* A0A64 800B0A64 1280033C */  lui        $v1, %hi(D_80119469)
    /* A0A68 800B0A68 69946380 */  lb         $v1, %lo(D_80119469)($v1)
    /* A0A6C 800B0A6C 1500A2A3 */  sb         $v0, 0x15($sp)
    /* A0A70 800B0A70 1600A3A3 */  sb         $v1, 0x16($sp)
    /* A0A74 800B0A74 1500A383 */  lb         $v1, 0x15($sp)
    /* A0A78 800B0A78 20000224 */  addiu      $v0, $zero, 0x20
    /* A0A7C 800B0A7C 03006214 */  bne        $v1, $v0, .L800B0A8C
    /* A0A80 800B0A80 1000B027 */   addiu     $s0, $sp, 0x10
    /* A0A84 800B0A84 30000224 */  addiu      $v0, $zero, 0x30
    /* A0A88 800B0A88 1500A2A3 */  sb         $v0, 0x15($sp)
  .L800B0A8C:
    /* A0A8C 800B0A8C 21200002 */  addu       $a0, $s0, $zero
    /* A0A90 800B0A90 1280033C */  lui        $v1, %hi(D_80119470)
    /* A0A94 800B0A94 70946394 */  lhu        $v1, %lo(D_80119470)($v1)
    /* A0A98 800B0A98 2E000224 */  addiu      $v0, $zero, 0x2E
    /* A0A9C 800B0A9C 1700A2A3 */  sb         $v0, 0x17($sp)
    /* A0AA0 800B0AA0 1800A3A7 */  sh         $v1, 0x18($sp)
    /* A0AA4 800B0AA4 1280023C */  lui        $v0, %hi(D_80119473)
    /* A0AA8 800B0AA8 73944280 */  lb         $v0, %lo(D_80119473)($v0)
    /* A0AAC 800B0AAC 1280033C */  lui        $v1, %hi(D_80119474)
    /* A0AB0 800B0AB0 74946380 */  lb         $v1, %lo(D_80119474)($v1)
    /* A0AB4 800B0AB4 1A00A2A3 */  sb         $v0, 0x1A($sp)
    /* A0AB8 800B0AB8 1B00A3A3 */  sb         $v1, 0x1B($sp)
    /* A0ABC 800B0ABC 1D21020C */  jal        strupr__FPc
    /* A0AC0 800B0AC0 1C00A0A3 */   sb        $zero, 0x1C($sp)
    /* A0AC4 800B0AC4 21202002 */  addu       $a0, $s1, $zero
    /* A0AC8 800B0AC8 F240000C */  jal        strcpy
    /* A0ACC 800B0ACC 21280002 */   addu      $a1, $s0, $zero
    /* A0AD0 800B0AD0 21102002 */  addu       $v0, $s1, $zero
    /* A0AD4 800B0AD4 4000BF8F */  lw         $ra, 0x40($sp)
    /* A0AD8 800B0AD8 3C00B18F */  lw         $s1, 0x3C($sp)
    /* A0ADC 800B0ADC 3800B08F */  lw         $s0, 0x38($sp)
    /* A0AE0 800B0AE0 4800BD27 */  addiu      $sp, $sp, 0x48
    /* A0AE4 800B0AE4 0800E003 */  jr         $ra
    /* A0AE8 800B0AE8 00000000 */   nop
  alabel GetWord__FPc
    /* A0AEC 800B0AEC D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* A0AF0 800B0AF0 2400B3AF */  sw         $s3, 0x24($sp)
    /* A0AF4 800B0AF4 21988000 */  addu       $s3, $a0, $zero
    /* A0AF8 800B0AF8 03006426 */  addiu      $a0, $s3, 0x3
    /* A0AFC 800B0AFC 2800BFAF */  sw         $ra, 0x28($sp)
    /* A0B00 800B0B00 2000B2AF */  sw         $s2, 0x20($sp)
    /* A0B04 800B0B04 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* A0B08 800B0B08 BD09020C */  jal        CharPair2Num__FPc
    /* A0B0C 800B0B0C 1800B0AF */   sw        $s0, 0x18($sp)
    /* A0B10 800B0B10 941682AF */  sw         $v0, %gp_rel(Year)($gp)
    /* A0B14 800B0B14 BD09020C */  jal        CharPair2Num__FPc
    /* A0B18 800B0B18 05006426 */   addiu     $a0, $s3, 0x5
    /* A0B1C 800B0B1C 21880000 */  addu       $s1, $zero, $zero
    /* A0B20 800B0B20 981682AF */  sw         $v0, %gp_rel(Day)($gp)
    /* A0B24 800B0B24 00006282 */  lb         $v0, 0x0($s3)
    /* A0B28 800B0B28 01006382 */  lb         $v1, 0x1($s3)
    /* A0B2C 800B0B2C 02006482 */  lb         $a0, 0x2($s3)
    /* A0B30 800B0B30 1000A2A3 */  sb         $v0, 0x10($sp)
    /* A0B34 800B0B34 1100A3A3 */  sb         $v1, 0x11($sp)
    /* A0B38 800B0B38 1200A4A3 */  sb         $a0, 0x12($sp)
    /* A0B3C 800B0B3C 21900000 */  addu       $s2, $zero, $zero
    /* A0B40 800B0B40 21800000 */  addu       $s0, $zero, $zero
    /* A0B44 800B0B44 1300A0A3 */  sb         $zero, 0x13($sp)
  .L800B0B48:
    /* A0B48 800B0B48 0B80013C */  lui        $at, %hi(MonDays)
    /* A0B4C 800B0B4C 21083000 */  addu       $at, $at, $s0
    /* A0B50 800B0B50 B809248C */  lw         $a0, %lo(MonDays)($at)
    /* A0B54 800B0B54 7F67000C */  jal        strcmp
    /* A0B58 800B0B58 1000A527 */   addiu     $a1, $sp, 0x10
    /* A0B5C 800B0B5C 03004014 */  bnez       $v0, .L800B0B6C
    /* A0B60 800B0B60 00000000 */   nop
    /* A0B64 800B0B64 E0C20208 */  j          .L800B0B80
    /* A0B68 800B0B68 01001224 */   addiu     $s2, $zero, 0x1
  .L800B0B6C:
    /* A0B6C 800B0B6C 0B80013C */  lui        $at, %hi(MonDays + 0x4)
    /* A0B70 800B0B70 21083000 */  addu       $at, $at, $s0
    /* A0B74 800B0B74 BC09228C */  lw         $v0, %lo(MonDays + 0x4)($at)
    /* A0B78 800B0B78 00000000 */  nop
    /* A0B7C 800B0B7C 21882202 */  addu       $s1, $s1, $v0
  .L800B0B80:
    /* A0B80 800B0B80 08001026 */  addiu      $s0, $s0, 0x8
    /* A0B84 800B0B84 6000022A */  slti       $v0, $s0, 0x60
    /* A0B88 800B0B88 03004010 */  beqz       $v0, .L800B0B98
    /* A0B8C 800B0B8C 00000000 */   nop
    /* A0B90 800B0B90 EDFF4012 */  beqz       $s2, .L800B0B48
    /* A0B94 800B0B94 00000000 */   nop
  .L800B0B98:
    /* A0B98 800B0B98 06004016 */  bnez       $s2, .L800B0BB4
    /* A0B9C 800B0B9C 00000000 */   nop
    /* A0BA0 800B0BA0 21200000 */  addu       $a0, $zero, $zero
    /* A0BA4 800B0BA4 1280053C */  lui        $a1, %hi(D_8011947C)
    /* A0BA8 800B0BA8 7C94A524 */  addiu      $a1, $a1, %lo(D_8011947C)
    /* A0BAC 800B0BAC A583000C */  jal        DBG_Error
    /* A0BB0 800B0BB0 45010624 */   addiu     $a2, $zero, 0x145
  .L800B0BB4:
    /* A0BB4 800B0BB4 08006426 */  addiu      $a0, $s3, 0x8
    /* A0BB8 800B0BB8 9816828F */  lw         $v0, %gp_rel(Day)($gp)
    /* A0BBC 800B0BBC 9416838F */  lw         $v1, %gp_rel(Year)($gp)
    /* A0BC0 800B0BC0 21882202 */  addu       $s1, $s1, $v0
    /* A0BC4 800B0BC4 C0100300 */  sll        $v0, $v1, 3
    /* A0BC8 800B0BC8 21104300 */  addu       $v0, $v0, $v1
    /* A0BCC 800B0BCC C0100200 */  sll        $v0, $v0, 3
    /* A0BD0 800B0BD0 21104300 */  addu       $v0, $v0, $v1
    /* A0BD4 800B0BD4 80180200 */  sll        $v1, $v0, 2
    /* A0BD8 800B0BD8 21104300 */  addu       $v0, $v0, $v1
    /* A0BDC 800B0BDC 21882202 */  addu       $s1, $s1, $v0
    /* A0BE0 800B0BE0 40101100 */  sll        $v0, $s1, 1
    /* A0BE4 800B0BE4 21105100 */  addu       $v0, $v0, $s1
    /* A0BE8 800B0BE8 00810200 */  sll        $s0, $v0, 4
    /* A0BEC 800B0BEC 23800202 */  subu       $s0, $s0, $v0
    /* A0BF0 800B0BF0 BD09020C */  jal        CharPair2Num__FPc
    /* A0BF4 800B0BF4 40811000 */   sll       $s0, $s0, 5
    /* A0BF8 800B0BF8 00190200 */  sll        $v1, $v0, 4
    /* A0BFC 800B0BFC 23186200 */  subu       $v1, $v1, $v0
    /* A0C00 800B0C00 80180300 */  sll        $v1, $v1, 2
    /* A0C04 800B0C04 21800302 */  addu       $s0, $s0, $v1
    /* A0C08 800B0C08 BD09020C */  jal        CharPair2Num__FPc
    /* A0C0C 800B0C0C 0A006426 */   addiu     $a0, $s3, 0xA
    /* A0C10 800B0C10 21800202 */  addu       $s0, $s0, $v0
    /* A0C14 800B0C14 0BB6023C */  lui        $v0, (0xB60B60B7 >> 16)
    /* A0C18 800B0C18 B7604234 */  ori        $v0, $v0, (0xB60B60B7 & 0xFFFF)
    /* A0C1C 800B0C1C 18000202 */  mult       $s0, $v0
    /* A0C20 800B0C20 B622023C */  lui        $v0, (0x22B63CBF >> 16)
    /* A0C24 800B0C24 BF3C4234 */  ori        $v0, $v0, (0x22B63CBF & 0xFFFF)
    /* A0C28 800B0C28 10380000 */  mfhi       $a3
    /* A0C2C 800B0C2C 2118F000 */  addu       $v1, $a3, $s0
    /* A0C30 800B0C30 031A0300 */  sra        $v1, $v1, 8
    /* A0C34 800B0C34 C3871000 */  sra        $s0, $s0, 31
    /* A0C38 800B0C38 23187000 */  subu       $v1, $v1, $s0
    /* A0C3C 800B0C3C 18006200 */  mult       $v1, $v0
    /* A0C40 800B0C40 C3170300 */  sra        $v0, $v1, 31
    /* A0C44 800B0C44 10380000 */  mfhi       $a3
    /* A0C48 800B0C48 03210700 */  sra        $a0, $a3, 4
    /* A0C4C 800B0C4C 23208200 */  subu       $a0, $a0, $v0
    /* A0C50 800B0C50 00110400 */  sll        $v0, $a0, 4
    /* A0C54 800B0C54 23104400 */  subu       $v0, $v0, $a0
    /* A0C58 800B0C58 80100200 */  sll        $v0, $v0, 2
    /* A0C5C 800B0C5C 23104400 */  subu       $v0, $v0, $a0
    /* A0C60 800B0C60 40100200 */  sll        $v0, $v0, 1
    /* A0C64 800B0C64 23186200 */  subu       $v1, $v1, $v0
    /* A0C68 800B0C68 80180300 */  sll        $v1, $v1, 2
    /* A0C6C 800B0C6C 0B80013C */  lui        $at, %hi(Words)
    /* A0C70 800B0C70 21082300 */  addu       $at, $at, $v1
    /* A0C74 800B0C74 E007228C */  lw         $v0, %lo(Words)($at)
    /* A0C78 800B0C78 2800BF8F */  lw         $ra, 0x28($sp)
    /* A0C7C 800B0C7C 2400B38F */  lw         $s3, 0x24($sp)
    /* A0C80 800B0C80 2000B28F */  lw         $s2, 0x20($sp)
    /* A0C84 800B0C84 1C00B18F */  lw         $s1, 0x1C($sp)
    /* A0C88 800B0C88 1800B08F */  lw         $s0, 0x18($sp)
    /* A0C8C 800B0C8C 3000BD27 */  addiu      $sp, $sp, 0x30
    /* A0C90 800B0C90 0800E003 */  jr         $ra
    /* A0C94 800B0C94 00000000 */   nop
