.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PrintMonstHistory__Fi, 0x284

glabel PrintMonstHistory__Fi
    /* 1BD3C 80155934 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 1BD40 80155938 40100400 */  sll        $v0, $a0, 1
    /* 1BD44 8015593C 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 1BD48 80155940 1800B2AF */  sw         $s2, 0x18($sp)
    /* 1BD4C 80155944 1400B1AF */  sw         $s1, 0x14($sp)
    /* 1BD50 80155948 1000B0AF */  sw         $s0, 0x10($sp)
    /* 1BD54 8015594C 1180013C */  lui        $at, %hi(monstkills)
    /* 1BD58 80155950 21082200 */  addu       $at, $at, $v0
    /* 1BD5C 80155954 40A22284 */  lh         $v0, %lo(monstkills)($at)
    /* 1BD60 80155958 00000000 */  nop
    /* 1BD64 8015595C 0F004228 */  slti       $v0, $v0, 0xF
    /* 1BD68 80155960 88004014 */  bnez       $v0, .L80155B84
    /* 1BD6C 80155964 02000224 */   addiu     $v0, $zero, 0x2
    /* 1BD70 80155968 1280033C */  lui        $v1, %hi(gnDifficulty)
    /* 1BD74 8015596C 08C1638C */  lw         $v1, %lo(gnDifficulty)($v1)
    /* 1BD78 80155970 00000000 */  nop
    /* 1BD7C 80155974 08006210 */  beq        $v1, $v0, .L80155998
    /* 1BD80 80155978 00110400 */   sll       $v0, $a0, 4
    /* 1BD84 8015597C 23104400 */  subu       $v0, $v0, $a0
    /* 1BD88 80155980 80100200 */  sll        $v0, $v0, 2
    /* 1BD8C 80155984 1180013C */  lui        $at, %hi(monsterdata + 0x30)
    /* 1BD90 80155988 21082200 */  addu       $at, $at, $v0
    /* 1BD94 8015598C CCAB3094 */  lhu        $s0, %lo(monsterdata + 0x30)($at)
    /* 1BD98 80155990 6D560508 */  j          .L801559B4
    /* 1BD9C 80155994 3F001032 */   andi      $s0, $s0, 0x3F
  .L80155998:
    /* 1BDA0 80155998 23104400 */  subu       $v0, $v0, $a0
    /* 1BDA4 8015599C 80100200 */  sll        $v0, $v0, 2
    /* 1BDA8 801559A0 1180013C */  lui        $at, %hi(monsterdata + 0x32)
    /* 1BDAC 801559A4 21082200 */  addu       $at, $at, $v0
    /* 1BDB0 801559A8 CEAB3094 */  lhu        $s0, %lo(monsterdata + 0x32)($at)
    /* 1BDB4 801559AC 00000000 */  nop
    /* 1BDB8 801559B0 3F001032 */  andi       $s0, $s0, 0x3F
  .L801559B4:
    /* 1BDBC 801559B4 0A000016 */  bnez       $s0, .L801559E0
    /* 1BDC0 801559B8 07000232 */   andi      $v0, $s0, 0x7
    /* 1BDC4 801559BC 4AED010C */  jal        GetStr__Fi
    /* 1BDC8 801559C0 CE020424 */   addiu     $a0, $zero, 0x2CE
    /* 1BDCC 801559C4 0D80103C */  lui        $s0, %hi(tempstr)
    /* 1BDD0 801559C8 10EA1026 */  addiu      $s0, $s0, %lo(tempstr)
    /* 1BDD4 801559CC 21200002 */  addu       $a0, $s0, $zero
    /* 1BDD8 801559D0 F240000C */  jal        strcpy
    /* 1BDDC 801559D4 21284000 */   addu      $a1, $v0, $zero
    /* 1BDE0 801559D8 DD560508 */  j          .L80155B74
    /* 1BDE4 801559DC 00000000 */   nop
  .L801559E0:
    /* 1BDE8 801559E0 34004010 */  beqz       $v0, .L80155AB4
    /* 1BDEC 801559E4 38000232 */   andi      $v0, $s0, 0x38
    /* 1BDF0 801559E8 4AED010C */  jal        GetStr__Fi
    /* 1BDF4 801559EC 5F030424 */   addiu     $a0, $zero, 0x35F
    /* 1BDF8 801559F0 0D80123C */  lui        $s2, %hi(tempstr)
    /* 1BDFC 801559F4 10EA5226 */  addiu      $s2, $s2, %lo(tempstr)
    /* 1BE00 801559F8 21204002 */  addu       $a0, $s2, $zero
    /* 1BE04 801559FC F240000C */  jal        strcpy
    /* 1BE08 80155A00 21284000 */   addu      $a1, $v0, $zero
    /* 1BE0C 80155A04 01001132 */  andi       $s1, $s0, 0x1
    /* 1BE10 80155A08 07002012 */  beqz       $s1, .L80155A28
    /* 1BE14 80155A0C 02000232 */   andi      $v0, $s0, 0x2
    /* 1BE18 80155A10 4AED010C */  jal        GetStr__Fi
    /* 1BE1C 80155A14 73020424 */   addiu     $a0, $zero, 0x273
    /* 1BE20 80155A18 21204002 */  addu       $a0, $s2, $zero
    /* 1BE24 80155A1C FC40000C */  jal        strcat
    /* 1BE28 80155A20 21284000 */   addu      $a1, $v0, $zero
    /* 1BE2C 80155A24 02000232 */  andi       $v0, $s0, 0x2
  .L80155A28:
    /* 1BE30 80155A28 0C004010 */  beqz       $v0, .L80155A5C
    /* 1BE34 80155A2C 00000000 */   nop
    /* 1BE38 80155A30 05002012 */  beqz       $s1, .L80155A48
    /* 1BE3C 80155A34 00000000 */   nop
    /* 1BE40 80155A38 1280053C */  lui        $a1, %hi(D_8011C2C8)
    /* 1BE44 80155A3C C8C2A524 */  addiu      $a1, $a1, %lo(D_8011C2C8)
    /* 1BE48 80155A40 FC40000C */  jal        strcat
    /* 1BE4C 80155A44 21204002 */   addu      $a0, $s2, $zero
  .L80155A48:
    /* 1BE50 80155A48 4AED010C */  jal        GetStr__Fi
    /* 1BE54 80155A4C 57010424 */   addiu     $a0, $zero, 0x157
    /* 1BE58 80155A50 21204002 */  addu       $a0, $s2, $zero
    /* 1BE5C 80155A54 FC40000C */  jal        strcat
    /* 1BE60 80155A58 21284000 */   addu      $a1, $v0, $zero
  .L80155A5C:
    /* 1BE64 80155A5C 04000232 */  andi       $v0, $s0, 0x4
    /* 1BE68 80155A60 0F004010 */  beqz       $v0, .L80155AA0
    /* 1BE6C 80155A64 02000232 */   andi      $v0, $s0, 0x2
    /* 1BE70 80155A68 07004010 */  beqz       $v0, .L80155A88
    /* 1BE74 80155A6C 00000000 */   nop
    /* 1BE78 80155A70 0D80043C */  lui        $a0, %hi(tempstr)
    /* 1BE7C 80155A74 10EA8424 */  addiu      $a0, $a0, %lo(tempstr)
    /* 1BE80 80155A78 1280053C */  lui        $a1, %hi(D_8011C2C8)
    /* 1BE84 80155A7C C8C2A524 */  addiu      $a1, $a1, %lo(D_8011C2C8)
    /* 1BE88 80155A80 FC40000C */  jal        strcat
    /* 1BE8C 80155A84 00000000 */   nop
  .L80155A88:
    /* 1BE90 80155A88 4AED010C */  jal        GetStr__Fi
    /* 1BE94 80155A8C 54020424 */   addiu     $a0, $zero, 0x254
    /* 1BE98 80155A90 0D80043C */  lui        $a0, %hi(tempstr)
    /* 1BE9C 80155A94 10EA8424 */  addiu      $a0, $a0, %lo(tempstr)
    /* 1BEA0 80155A98 FC40000C */  jal        strcat
    /* 1BEA4 80155A9C 21284000 */   addu      $a1, $v0, $zero
  .L80155AA0:
    /* 1BEA8 80155AA0 0D80043C */  lui        $a0, %hi(tempstr)
    /* 1BEAC 80155AA4 10EA8424 */  addiu      $a0, $a0, %lo(tempstr)
    /* 1BEB0 80155AA8 98C7000C */  jal        AddPanelString__FPCci
    /* 1BEB4 80155AAC 01000524 */   addiu     $a1, $zero, 0x1
    /* 1BEB8 80155AB0 38000232 */  andi       $v0, $s0, 0x38
  .L80155AB4:
    /* 1BEBC 80155AB4 33004010 */  beqz       $v0, .L80155B84
    /* 1BEC0 80155AB8 00000000 */   nop
    /* 1BEC4 80155ABC 4AED010C */  jal        GetStr__Fi
    /* 1BEC8 80155AC0 0D020424 */   addiu     $a0, $zero, 0x20D
    /* 1BECC 80155AC4 0D80123C */  lui        $s2, %hi(tempstr)
    /* 1BED0 80155AC8 10EA5226 */  addiu      $s2, $s2, %lo(tempstr)
    /* 1BED4 80155ACC 21204002 */  addu       $a0, $s2, $zero
    /* 1BED8 80155AD0 F240000C */  jal        strcpy
    /* 1BEDC 80155AD4 21284000 */   addu      $a1, $v0, $zero
    /* 1BEE0 80155AD8 08001132 */  andi       $s1, $s0, 0x8
    /* 1BEE4 80155ADC 07002012 */  beqz       $s1, .L80155AFC
    /* 1BEE8 80155AE0 10000232 */   andi      $v0, $s0, 0x10
    /* 1BEEC 80155AE4 4AED010C */  jal        GetStr__Fi
    /* 1BEF0 80155AE8 73020424 */   addiu     $a0, $zero, 0x273
    /* 1BEF4 80155AEC 21204002 */  addu       $a0, $s2, $zero
    /* 1BEF8 80155AF0 FC40000C */  jal        strcat
    /* 1BEFC 80155AF4 21284000 */   addu      $a1, $v0, $zero
    /* 1BF00 80155AF8 10000232 */  andi       $v0, $s0, 0x10
  .L80155AFC:
    /* 1BF04 80155AFC 0C004010 */  beqz       $v0, .L80155B30
    /* 1BF08 80155B00 00000000 */   nop
    /* 1BF0C 80155B04 05002012 */  beqz       $s1, .L80155B1C
    /* 1BF10 80155B08 00000000 */   nop
    /* 1BF14 80155B0C 1280053C */  lui        $a1, %hi(D_8011C2C8)
    /* 1BF18 80155B10 C8C2A524 */  addiu      $a1, $a1, %lo(D_8011C2C8)
    /* 1BF1C 80155B14 FC40000C */  jal        strcat
    /* 1BF20 80155B18 21204002 */   addu      $a0, $s2, $zero
  .L80155B1C:
    /* 1BF24 80155B1C 4AED010C */  jal        GetStr__Fi
    /* 1BF28 80155B20 57010424 */   addiu     $a0, $zero, 0x157
    /* 1BF2C 80155B24 21204002 */  addu       $a0, $s2, $zero
    /* 1BF30 80155B28 FC40000C */  jal        strcat
    /* 1BF34 80155B2C 21284000 */   addu      $a1, $v0, $zero
  .L80155B30:
    /* 1BF38 80155B30 20000232 */  andi       $v0, $s0, 0x20
    /* 1BF3C 80155B34 0F004010 */  beqz       $v0, .L80155B74
    /* 1BF40 80155B38 10000232 */   andi      $v0, $s0, 0x10
    /* 1BF44 80155B3C 07004010 */  beqz       $v0, .L80155B5C
    /* 1BF48 80155B40 00000000 */   nop
    /* 1BF4C 80155B44 0D80043C */  lui        $a0, %hi(tempstr)
    /* 1BF50 80155B48 10EA8424 */  addiu      $a0, $a0, %lo(tempstr)
    /* 1BF54 80155B4C 1280053C */  lui        $a1, %hi(D_8011C2C8)
    /* 1BF58 80155B50 C8C2A524 */  addiu      $a1, $a1, %lo(D_8011C2C8)
    /* 1BF5C 80155B54 FC40000C */  jal        strcat
    /* 1BF60 80155B58 00000000 */   nop
  .L80155B5C:
    /* 1BF64 80155B5C 4AED010C */  jal        GetStr__Fi
    /* 1BF68 80155B60 54020424 */   addiu     $a0, $zero, 0x254
    /* 1BF6C 80155B64 0D80043C */  lui        $a0, %hi(tempstr)
    /* 1BF70 80155B68 10EA8424 */  addiu      $a0, $a0, %lo(tempstr)
    /* 1BF74 80155B6C FC40000C */  jal        strcat
    /* 1BF78 80155B70 21284000 */   addu      $a1, $v0, $zero
  .L80155B74:
    /* 1BF7C 80155B74 0D80043C */  lui        $a0, %hi(tempstr)
    /* 1BF80 80155B78 10EA8424 */  addiu      $a0, $a0, %lo(tempstr)
    /* 1BF84 80155B7C 98C7000C */  jal        AddPanelString__FPCci
    /* 1BF88 80155B80 01000524 */   addiu     $a1, $zero, 0x1
  .L80155B84:
    /* 1BF8C 80155B84 1280033C */  lui        $v1, %hi(sel_data)
    /* 1BF90 80155B88 2CB7638C */  lw         $v1, %lo(sel_data)($v1)
    /* 1BF94 80155B8C 01000224 */  addiu      $v0, $zero, 0x1
    /* 1BF98 80155B90 1280013C */  lui        $at, %hi(_pinfoflag)
    /* 1BF9C 80155B94 21082300 */  addu       $at, $at, $v1
    /* 1BFA0 80155B98 B8B622A0 */  sb         $v0, %lo(_pinfoflag)($at)
    /* 1BFA4 80155B9C 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 1BFA8 80155BA0 1800B28F */  lw         $s2, 0x18($sp)
    /* 1BFAC 80155BA4 1400B18F */  lw         $s1, 0x14($sp)
    /* 1BFB0 80155BA8 1000B08F */  lw         $s0, 0x10($sp)
    /* 1BFB4 80155BAC 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 1BFB8 80155BB0 0800E003 */  jr         $ra
    /* 1BFBC 80155BB4 00000000 */   nop
endlabel PrintMonstHistory__Fi
