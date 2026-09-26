.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching HoldThemeRooms__Fv, 0xE4

glabel HoldThemeRooms__Fv
    /* 230D4 8015CCCC E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 230D8 8015CCD0 1280033C */  lui        $v1, %hi(currlevel)
    /* 230DC 8015CCD4 0CC16390 */  lbu        $v1, %lo(currlevel)($v1)
    /* 230E0 8015CCD8 10000224 */  addiu      $v0, $zero, 0x10
    /* 230E4 8015CCDC 30006210 */  beq        $v1, $v0, .L8015CDA0
    /* 230E8 8015CCE0 1800BFAF */   sw        $ra, 0x18($sp)
    /* 230EC 8015CCE4 1280033C */  lui        $v1, %hi(leveltype)
    /* 230F0 8015CCE8 0DC16390 */  lbu        $v1, %lo(leveltype)($v1)
    /* 230F4 8015CCEC 01000224 */  addiu      $v0, $zero, 0x1
    /* 230F8 8015CCF0 29006214 */  bne        $v1, $v0, .L8015CD98
    /* 230FC 8015CCF4 00000000 */   nop
    /* 23100 8015CCF8 0C1A828F */  lw         $v0, %gp_rel(numthemes)($gp)
    /* 23104 8015CCFC 00000000 */  nop
    /* 23108 8015CD00 27004018 */  blez       $v0, .L8015CDA0
    /* 2310C 8015CD04 21300000 */   addu      $a2, $zero, $zero
    /* 23110 8015CD08 21400000 */  addu       $t0, $zero, $zero
  .L8015CD0C:
    /* 23114 8015CD0C 21280000 */  addu       $a1, $zero, $zero
    /* 23118 8015CD10 1080013C */  lui        $at, %hi(theme + 0x4)
    /* 2311C 8015CD14 21082800 */  addu       $at, $at, $t0
    /* 23120 8015CD18 4C282780 */  lb         $a3, %lo(theme + 0x4)($at)
  .L8015CD1C:
    /* 23124 8015CD1C 21200000 */  addu       $a0, $zero, $zero
    /* 23128 8015CD20 C0180500 */  sll        $v1, $a1, 3
  .L8015CD24:
    /* 2312C 8015CD24 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 23130 8015CD28 21082300 */  addu       $at, $at, $v1
    /* 23134 8015CD2C 2F7A2280 */  lb         $v0, %lo(dung_map + 0x7)($at)
    /* 23138 8015CD30 00000000 */  nop
    /* 2313C 8015CD34 09004714 */  bne        $v0, $a3, .L8015CD5C
    /* 23140 8015CD38 00000000 */   nop
    /* 23144 8015CD3C 0E80013C */  lui        $at, %hi(dung_map + 0x6)
    /* 23148 8015CD40 21082300 */  addu       $at, $at, $v1
    /* 2314C 8015CD44 2E7A2290 */  lbu        $v0, %lo(dung_map + 0x6)($at)
    /* 23150 8015CD48 00000000 */  nop
    /* 23154 8015CD4C 08004234 */  ori        $v0, $v0, 0x8
    /* 23158 8015CD50 0E80013C */  lui        $at, %hi(dung_map + 0x6)
    /* 2315C 8015CD54 21082300 */  addu       $at, $at, $v1
    /* 23160 8015CD58 2E7A22A0 */  sb         $v0, %lo(dung_map + 0x6)($at)
  .L8015CD5C:
    /* 23164 8015CD5C 01008424 */  addiu      $a0, $a0, 0x1
    /* 23168 8015CD60 60008228 */  slti       $v0, $a0, 0x60
    /* 2316C 8015CD64 EFFF4014 */  bnez       $v0, .L8015CD24
    /* 23170 8015CD68 80036324 */   addiu     $v1, $v1, 0x380
    /* 23174 8015CD6C 0100A524 */  addiu      $a1, $a1, 0x1
    /* 23178 8015CD70 6000A228 */  slti       $v0, $a1, 0x60
    /* 2317C 8015CD74 E9FF4014 */  bnez       $v0, .L8015CD1C
    /* 23180 8015CD78 00000000 */   nop
    /* 23184 8015CD7C 0C1A828F */  lw         $v0, %gp_rel(numthemes)($gp)
    /* 23188 8015CD80 0100C624 */  addiu      $a2, $a2, 0x1
    /* 2318C 8015CD84 2A10C200 */  slt        $v0, $a2, $v0
    /* 23190 8015CD88 E0FF4014 */  bnez       $v0, .L8015CD0C
    /* 23194 8015CD8C 08000825 */   addiu     $t0, $t0, 0x8
    /* 23198 8015CD90 68730508 */  j          .L8015CDA0
    /* 2319C 8015CD94 00000000 */   nop
  .L8015CD98:
    /* 231A0 8015CD98 566E050C */  jal        DRLG_HoldThemeRooms__Fv
    /* 231A4 8015CD9C 00000000 */   nop
  .L8015CDA0:
    /* 231A8 8015CDA0 1800BF8F */  lw         $ra, 0x18($sp)
    /* 231AC 8015CDA4 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 231B0 8015CDA8 0800E003 */  jr         $ra
    /* 231B4 8015CDAC 00000000 */   nop
endlabel HoldThemeRooms__Fv
