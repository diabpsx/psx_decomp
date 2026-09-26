.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PrintUniqueHistory__Fv, 0x12C

glabel PrintUniqueHistory__Fv
    /* 1BFC0 80155BB8 1280023C */  lui        $v0, %hi(sel_data)
    /* 1BFC4 80155BBC 2CB7428C */  lw         $v0, %lo(sel_data)($v0)
    /* 1BFC8 80155BC0 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 1BFCC 80155BC4 1800BFAF */  sw         $ra, 0x18($sp)
    /* 1BFD0 80155BC8 1400B1AF */  sw         $s1, 0x14($sp)
    /* 1BFD4 80155BCC 1000B0AF */  sw         $s0, 0x10($sp)
    /* 1BFD8 80155BD0 80100200 */  sll        $v0, $v0, 2
    /* 1BFDC 80155BD4 1280013C */  lui        $at, %hi(_pcursmonst)
    /* 1BFE0 80155BD8 21082200 */  addu       $at, $at, $v0
    /* 1BFE4 80155BDC 58B7238C */  lw         $v1, %lo(_pcursmonst)($at)
    /* 1BFE8 80155BE0 00000000 */  nop
    /* 1BFEC 80155BE4 40100300 */  sll        $v0, $v1, 1
    /* 1BFF0 80155BE8 21104300 */  addu       $v0, $v0, $v1
    /* 1BFF4 80155BEC 80100200 */  sll        $v0, $v0, 2
    /* 1BFF8 80155BF0 21104300 */  addu       $v0, $v0, $v1
    /* 1BFFC 80155BF4 C0100200 */  sll        $v0, $v0, 3
    /* 1C000 80155BF8 1080013C */  lui        $at, %hi(monster + 0x30)
    /* 1C004 80155BFC 21082200 */  addu       $at, $at, $v0
    /* 1C008 80155C00 C4533094 */  lhu        $s0, %lo(monster + 0x30)($at)
    /* 1C00C 80155C04 00000000 */  nop
    /* 1C010 80155C08 3F001032 */  andi       $s0, $s0, 0x3F
    /* 1C014 80155C0C 0D000016 */  bnez       $s0, .L80155C44
    /* 1C018 80155C10 07000232 */   andi      $v0, $s0, 0x7
    /* 1C01C 80155C14 4AED010C */  jal        GetStr__Fi
    /* 1C020 80155C18 D2020424 */   addiu     $a0, $zero, 0x2D2
    /* 1C024 80155C1C 0D80103C */  lui        $s0, %hi(tempstr)
    /* 1C028 80155C20 10EA1026 */  addiu      $s0, $s0, %lo(tempstr)
    /* 1C02C 80155C24 21200002 */  addu       $a0, $s0, $zero
    /* 1C030 80155C28 F240000C */  jal        strcpy
    /* 1C034 80155C2C 21284000 */   addu      $a1, $v0, $zero
    /* 1C038 80155C30 21200002 */  addu       $a0, $s0, $zero
    /* 1C03C 80155C34 98C7000C */  jal        AddPanelString__FPCci
    /* 1C040 80155C38 01000524 */   addiu     $a1, $zero, 0x1
    /* 1C044 80155C3C 23570508 */  j          .L80155C8C
    /* 1C048 80155C40 CD020424 */   addiu     $a0, $zero, 0x2CD
  .L80155C44:
    /* 1C04C 80155C44 02004010 */  beqz       $v0, .L80155C50
    /* 1C050 80155C48 D2020424 */   addiu     $a0, $zero, 0x2D2
    /* 1C054 80155C4C E7030424 */  addiu      $a0, $zero, 0x3E7
  .L80155C50:
    /* 1C058 80155C50 4AED010C */  jal        GetStr__Fi
    /* 1C05C 80155C54 00000000 */   nop
    /* 1C060 80155C58 0D80043C */  lui        $a0, %hi(tempstr)
    /* 1C064 80155C5C 10EA8424 */  addiu      $a0, $a0, %lo(tempstr)
    /* 1C068 80155C60 F240000C */  jal        strcpy
    /* 1C06C 80155C64 21284000 */   addu      $a1, $v0, $zero
    /* 1C070 80155C68 0D80113C */  lui        $s1, %hi(tempstr)
    /* 1C074 80155C6C 10EA3126 */  addiu      $s1, $s1, %lo(tempstr)
    /* 1C078 80155C70 21202002 */  addu       $a0, $s1, $zero
    /* 1C07C 80155C74 98C7000C */  jal        AddPanelString__FPCci
    /* 1C080 80155C78 01000524 */   addiu     $a1, $zero, 0x1
    /* 1C084 80155C7C 38000232 */  andi       $v0, $s0, 0x38
    /* 1C088 80155C80 02004014 */  bnez       $v0, .L80155C8C
    /* 1C08C 80155C84 E6030424 */   addiu     $a0, $zero, 0x3E6
    /* 1C090 80155C88 CD020424 */  addiu      $a0, $zero, 0x2CD
  .L80155C8C:
    /* 1C094 80155C8C 4AED010C */  jal        GetStr__Fi
    /* 1C098 80155C90 00000000 */   nop
    /* 1C09C 80155C94 0D80043C */  lui        $a0, %hi(tempstr)
    /* 1C0A0 80155C98 10EA8424 */  addiu      $a0, $a0, %lo(tempstr)
    /* 1C0A4 80155C9C F240000C */  jal        strcpy
    /* 1C0A8 80155CA0 21284000 */   addu      $a1, $v0, $zero
    /* 1C0AC 80155CA4 0D80043C */  lui        $a0, %hi(tempstr)
    /* 1C0B0 80155CA8 10EA8424 */  addiu      $a0, $a0, %lo(tempstr)
    /* 1C0B4 80155CAC 98C7000C */  jal        AddPanelString__FPCci
    /* 1C0B8 80155CB0 01000524 */   addiu     $a1, $zero, 0x1
    /* 1C0BC 80155CB4 1280033C */  lui        $v1, %hi(sel_data)
    /* 1C0C0 80155CB8 2CB7638C */  lw         $v1, %lo(sel_data)($v1)
    /* 1C0C4 80155CBC 01000224 */  addiu      $v0, $zero, 0x1
    /* 1C0C8 80155CC0 1280013C */  lui        $at, %hi(_pinfoflag)
    /* 1C0CC 80155CC4 21082300 */  addu       $at, $at, $v1
    /* 1C0D0 80155CC8 B8B622A0 */  sb         $v0, %lo(_pinfoflag)($at)
    /* 1C0D4 80155CCC 1800BF8F */  lw         $ra, 0x18($sp)
    /* 1C0D8 80155CD0 1400B18F */  lw         $s1, 0x14($sp)
    /* 1C0DC 80155CD4 1000B08F */  lw         $s0, 0x10($sp)
    /* 1C0E0 80155CD8 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 1C0E4 80155CDC 0800E003 */  jr         $ra
    /* 1C0E8 80155CE0 00000000 */   nop
endlabel PrintUniqueHistory__Fv
