.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DRLG_L1Pass3__Fv, 0x1F8

glabel DRLG_L1Pass3__Fv
    /* 2FB0 8013CBA8 0D80023C */  lui        $v0, %hi(pMegaTiles + 0xA8)
    /* 2FB4 8013CBAC 54ED4284 */  lh         $v0, %lo(pMegaTiles + 0xA8)($v0)
    /* 2FB8 8013CBB0 0D80033C */  lui        $v1, %hi(pMegaTiles + 0xAA)
    /* 2FBC 8013CBB4 56ED6384 */  lh         $v1, %lo(pMegaTiles + 0xAA)($v1)
    /* 2FC0 8013CBB8 C0FFBD27 */  addiu      $sp, $sp, -0x40
    /* 2FC4 8013CBBC 2000B2AF */  sw         $s2, 0x20($sp)
    /* 2FC8 8013CBC0 21900000 */  addu       $s2, $zero, $zero
    /* 2FCC 8013CBC4 3C00BFAF */  sw         $ra, 0x3C($sp)
    /* 2FD0 8013CBC8 3800BEAF */  sw         $fp, 0x38($sp)
    /* 2FD4 8013CBCC 3400B7AF */  sw         $s7, 0x34($sp)
    /* 2FD8 8013CBD0 3000B6AF */  sw         $s6, 0x30($sp)
    /* 2FDC 8013CBD4 2C00B5AF */  sw         $s5, 0x2C($sp)
    /* 2FE0 8013CBD8 2800B4AF */  sw         $s4, 0x28($sp)
    /* 2FE4 8013CBDC 2400B3AF */  sw         $s3, 0x24($sp)
    /* 2FE8 8013CBE0 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 2FEC 8013CBE4 1800B0AF */  sw         $s0, 0x18($sp)
    /* 2FF0 8013CBE8 01004724 */  addiu      $a3, $v0, 0x1
    /* 2FF4 8013CBEC 01007624 */  addiu      $s6, $v1, 0x1
    /* 2FF8 8013CBF0 00A40700 */  sll        $s4, $a3, 16
    /* 2FFC 8013CBF4 0D80023C */  lui        $v0, %hi(pMegaTiles + 0xAC)
    /* 3000 8013CBF8 58ED4284 */  lh         $v0, %lo(pMegaTiles + 0xAC)($v0)
    /* 3004 8013CBFC 0D80033C */  lui        $v1, %hi(pMegaTiles + 0xAE)
    /* 3008 8013CC00 5AED6384 */  lh         $v1, %lo(pMegaTiles + 0xAE)($v1)
    /* 300C 8013CC04 01005524 */  addiu      $s5, $v0, 0x1
    /* 3010 8013CC08 01007724 */  addiu      $s7, $v1, 0x1
  .L8013CC0C:
    /* 3014 8013CC0C 21880000 */  addu       $s1, $zero, $zero
    /* 3018 8013CC10 01005326 */  addiu      $s3, $s2, 0x1
    /* 301C 8013CC14 21202002 */  addu       $a0, $s1, $zero
  .L8013CC18:
    /* 3020 8013CC18 21284002 */  addu       $a1, $s2, $zero
    /* 3024 8013CC1C B30A020C */  jal        SetDPiece__Fiis
    /* 3028 8013CC20 03341400 */   sra       $a2, $s4, 16
    /* 302C 8013CC24 01003026 */  addiu      $s0, $s1, 0x1
    /* 3030 8013CC28 21200002 */  addu       $a0, $s0, $zero
    /* 3034 8013CC2C 21284002 */  addu       $a1, $s2, $zero
    /* 3038 8013CC30 00341600 */  sll        $a2, $s6, 16
    /* 303C 8013CC34 B30A020C */  jal        SetDPiece__Fiis
    /* 3040 8013CC38 03340600 */   sra       $a2, $a2, 16
    /* 3044 8013CC3C 21202002 */  addu       $a0, $s1, $zero
    /* 3048 8013CC40 21286002 */  addu       $a1, $s3, $zero
    /* 304C 8013CC44 00341500 */  sll        $a2, $s5, 16
    /* 3050 8013CC48 B30A020C */  jal        SetDPiece__Fiis
    /* 3054 8013CC4C 03340600 */   sra       $a2, $a2, 16
    /* 3058 8013CC50 21200002 */  addu       $a0, $s0, $zero
    /* 305C 8013CC54 21286002 */  addu       $a1, $s3, $zero
    /* 3060 8013CC58 00341700 */  sll        $a2, $s7, 16
    /* 3064 8013CC5C B30A020C */  jal        SetDPiece__Fiis
    /* 3068 8013CC60 03340600 */   sra       $a2, $a2, 16
    /* 306C 8013CC64 02003126 */  addiu      $s1, $s1, 0x2
    /* 3070 8013CC68 6000222A */  slti       $v0, $s1, 0x60
    /* 3074 8013CC6C EAFF4014 */  bnez       $v0, .L8013CC18
    /* 3078 8013CC70 21202002 */   addu      $a0, $s1, $zero
    /* 307C 8013CC74 02005226 */  addiu      $s2, $s2, 0x2
    /* 3080 8013CC78 6000422A */  slti       $v0, $s2, 0x60
    /* 3084 8013CC7C E3FF4014 */  bnez       $v0, .L8013CC0C
    /* 3088 8013CC80 21F00000 */   addu      $fp, $zero, $zero
    /* 308C 8013CC84 10001224 */  addiu      $s2, $zero, 0x10
  .L8013CC88:
    /* 3090 8013CC88 10001124 */  addiu      $s1, $zero, 0x10
    /* 3094 8013CC8C 21A00000 */  addu       $s4, $zero, $zero
    /* 3098 8013CC90 01004826 */  addiu      $t0, $s2, 0x1
    /* 309C 8013CC94 1000A8AF */  sw         $t0, 0x10($sp)
    /* 30A0 8013CC98 0E80133C */  lui        $s3, %hi(dungeon)
    /* 30A4 8013CC9C C4407326 */  addiu      $s3, $s3, %lo(dungeon)
  .L8013CCA0:
    /* 30A8 8013CCA0 21202002 */  addu       $a0, $s1, $zero
    /* 30AC 8013CCA4 21284002 */  addu       $a1, $s2, $zero
    /* 30B0 8013CCA8 40101E00 */  sll        $v0, $fp, 1
    /* 30B4 8013CCAC 21105300 */  addu       $v0, $v0, $s3
    /* 30B8 8013CCB0 60007326 */  addiu      $s3, $s3, 0x60
    /* 30BC 8013CCB4 01009426 */  addiu      $s4, $s4, 0x1
    /* 30C0 8013CCB8 00004294 */  lhu        $v0, 0x0($v0)
    /* 30C4 8013CCBC 0D80083C */  lui        $t0, %hi(pMegaTiles)
    /* 30C8 8013CCC0 ACEC0825 */  addiu      $t0, $t0, %lo(pMegaTiles)
    /* 30CC 8013CCC4 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 30D0 8013CCC8 C0100200 */  sll        $v0, $v0, 3
    /* 30D4 8013CCCC 21184800 */  addu       $v1, $v0, $t0
    /* 30D8 8013CCD0 21300201 */  addu       $a2, $t0, $v0
    /* 30DC 8013CCD4 00006384 */  lh         $v1, 0x0($v1)
    /* 30E0 8013CCD8 0200C684 */  lh         $a2, 0x2($a2)
    /* 30E4 8013CCDC 01006724 */  addiu      $a3, $v1, 0x1
    /* 30E8 8013CCE0 0100D624 */  addiu      $s6, $a2, 0x1
    /* 30EC 8013CCE4 21180201 */  addu       $v1, $t0, $v0
    /* 30F0 8013CCE8 0D80083C */  lui        $t0, %hi(pMegaTiles + 0x6)
    /* 30F4 8013CCEC B2EC0825 */  addiu      $t0, $t0, %lo(pMegaTiles + 0x6)
    /* 30F8 8013CCF0 21104800 */  addu       $v0, $v0, $t0
    /* 30FC 8013CCF4 00340700 */  sll        $a2, $a3, 16
    /* 3100 8013CCF8 03340600 */  sra        $a2, $a2, 16
    /* 3104 8013CCFC 04006384 */  lh         $v1, 0x4($v1)
    /* 3108 8013CD00 00004284 */  lh         $v0, 0x0($v0)
    /* 310C 8013CD04 01007524 */  addiu      $s5, $v1, 0x1
    /* 3110 8013CD08 B30A020C */  jal        SetDPiece__Fiis
    /* 3114 8013CD0C 01005724 */   addiu     $s7, $v0, 0x1
    /* 3118 8013CD10 01003026 */  addiu      $s0, $s1, 0x1
    /* 311C 8013CD14 21200002 */  addu       $a0, $s0, $zero
    /* 3120 8013CD18 21284002 */  addu       $a1, $s2, $zero
    /* 3124 8013CD1C 00341600 */  sll        $a2, $s6, 16
    /* 3128 8013CD20 B30A020C */  jal        SetDPiece__Fiis
    /* 312C 8013CD24 03340600 */   sra       $a2, $a2, 16
    /* 3130 8013CD28 21202002 */  addu       $a0, $s1, $zero
    /* 3134 8013CD2C 00341500 */  sll        $a2, $s5, 16
    /* 3138 8013CD30 1000A58F */  lw         $a1, 0x10($sp)
    /* 313C 8013CD34 B30A020C */  jal        SetDPiece__Fiis
    /* 3140 8013CD38 03340600 */   sra       $a2, $a2, 16
    /* 3144 8013CD3C 21200002 */  addu       $a0, $s0, $zero
    /* 3148 8013CD40 00341700 */  sll        $a2, $s7, 16
    /* 314C 8013CD44 1000A58F */  lw         $a1, 0x10($sp)
    /* 3150 8013CD48 B30A020C */  jal        SetDPiece__Fiis
    /* 3154 8013CD4C 03340600 */   sra       $a2, $a2, 16
    /* 3158 8013CD50 2800822A */  slti       $v0, $s4, 0x28
    /* 315C 8013CD54 D2FF4014 */  bnez       $v0, .L8013CCA0
    /* 3160 8013CD58 02003126 */   addiu     $s1, $s1, 0x2
    /* 3164 8013CD5C 0100DE27 */  addiu      $fp, $fp, 0x1
    /* 3168 8013CD60 2800C22B */  slti       $v0, $fp, 0x28
    /* 316C 8013CD64 C8FF4014 */  bnez       $v0, .L8013CC88
    /* 3170 8013CD68 02005226 */   addiu     $s2, $s2, 0x2
    /* 3174 8013CD6C 3C00BF8F */  lw         $ra, 0x3C($sp)
    /* 3178 8013CD70 3800BE8F */  lw         $fp, 0x38($sp)
    /* 317C 8013CD74 3400B78F */  lw         $s7, 0x34($sp)
    /* 3180 8013CD78 3000B68F */  lw         $s6, 0x30($sp)
    /* 3184 8013CD7C 2C00B58F */  lw         $s5, 0x2C($sp)
    /* 3188 8013CD80 2800B48F */  lw         $s4, 0x28($sp)
    /* 318C 8013CD84 2400B38F */  lw         $s3, 0x24($sp)
    /* 3190 8013CD88 2000B28F */  lw         $s2, 0x20($sp)
    /* 3194 8013CD8C 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 3198 8013CD90 1800B08F */  lw         $s0, 0x18($sp)
    /* 319C 8013CD94 4000BD27 */  addiu      $sp, $sp, 0x40
    /* 31A0 8013CD98 0800E003 */  jr         $ra
    /* 31A4 8013CD9C 00000000 */   nop
endlabel DRLG_L1Pass3__Fv
