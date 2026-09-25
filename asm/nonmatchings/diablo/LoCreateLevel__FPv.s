.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching LoCreateLevel__FPv, 0x164

glabel LoCreateLevel__FPv
    /* 28B90 80038B90 1280033C */  lui        $v1, %hi(leveltype)
    /* 28B94 80038B94 0DC16390 */  lbu        $v1, %lo(leveltype)($v1)
    /* 28B98 80038B98 3020858F */  lw         $a1, %gp_rel(D_8011C7B0)($gp)
    /* 28B9C 80038B9C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 28BA0 80038BA0 0500622C */  sltiu      $v0, $v1, 0x5
    /* 28BA4 80038BA4 4B004010 */  beqz       $v0, .L80038CD4
    /* 28BA8 80038BA8 1000BFAF */   sw        $ra, 0x10($sp)
    /* 28BAC 80038BAC 80100300 */  sll        $v0, $v1, 2
    /* 28BB0 80038BB0 1180013C */  lui        $at, %hi(jtbl_80111194)
    /* 28BB4 80038BB4 21082200 */  addu       $at, $at, $v0
    /* 28BB8 80038BB8 9411228C */  lw         $v0, %lo(jtbl_80111194)($at)
    /* 28BBC 80038BBC 00000000 */  nop
    /* 28BC0 80038BC0 08004000 */  jr         $v0
    /* 28BC4 80038BC4 00000000 */   nop
  jlabel .L80038BC8
    /* 28BC8 80038BC8 52D3010C */  jal        CreateTown__Fi
    /* 28BCC 80038BCC 2120A000 */   addu      $a0, $a1, $zero
    /* 28BD0 80038BD0 7488050C */  jal        func_801621D0
    /* 28BD4 80038BD4 00000000 */   nop
    /* 28BD8 80038BD8 33E30008 */  j          .L80038CCC
    /* 28BDC 80038BDC 21200000 */   addu      $a0, $zero, $zero
  jlabel .L80038BE0
    /* 28BE0 80038BE0 1280023C */  lui        $v0, %hi(currlevel)
    /* 28BE4 80038BE4 0CC14290 */  lbu        $v0, %lo(currlevel)($v0)
    /* 28BE8 80038BE8 00000000 */  nop
    /* 28BEC 80038BEC 80100200 */  sll        $v0, $v0, 2
    /* 28BF0 80038BF0 0D80013C */  lui        $at, %hi(glSeedTbl)
    /* 28BF4 80038BF4 21082200 */  addu       $at, $at, $v0
    /* 28BF8 80038BF8 5CF7248C */  lw         $a0, %lo(glSeedTbl)($at)
    /* 28BFC 80038BFC 9903050C */  jal        func_80140E64
    /* 28C00 80038C00 00000000 */   nop
    /* 28C04 80038C04 4C89050C */  jal        func_80162530
    /* 28C08 80038C08 00000000 */   nop
    /* 28C0C 80038C0C E4D8010C */  jal        Freeupstairs__Fv
    /* 28C10 80038C10 00000000 */   nop
    /* 28C14 80038C14 33E30008 */  j          .L80038CCC
    /* 28C18 80038C18 01000424 */   addiu     $a0, $zero, 0x1
  jlabel .L80038C1C
    /* 28C1C 80038C1C 1280023C */  lui        $v0, %hi(currlevel)
    /* 28C20 80038C20 0CC14290 */  lbu        $v0, %lo(currlevel)($v0)
    /* 28C24 80038C24 00000000 */  nop
    /* 28C28 80038C28 80100200 */  sll        $v0, $v0, 2
    /* 28C2C 80038C2C 0D80013C */  lui        $at, %hi(glSeedTbl)
    /* 28C30 80038C30 21082200 */  addu       $at, $at, $v0
    /* 28C34 80038C34 5CF7248C */  lw         $a0, %lo(glSeedTbl)($at)
    /* 28C38 80038C38 5321050C */  jal        func_8014854C
    /* 28C3C 80038C3C 00000000 */   nop
    /* 28C40 80038C40 9789050C */  jal        func_8016265C
    /* 28C44 80038C44 00000000 */   nop
    /* 28C48 80038C48 E4D8010C */  jal        Freeupstairs__Fv
    /* 28C4C 80038C4C 00000000 */   nop
    /* 28C50 80038C50 33E30008 */  j          .L80038CCC
    /* 28C54 80038C54 02000424 */   addiu     $a0, $zero, 0x2
  jlabel .L80038C58
    /* 28C58 80038C58 1280023C */  lui        $v0, %hi(currlevel)
    /* 28C5C 80038C5C 0CC14290 */  lbu        $v0, %lo(currlevel)($v0)
    /* 28C60 80038C60 00000000 */  nop
    /* 28C64 80038C64 80100200 */  sll        $v0, $v0, 2
    /* 28C68 80038C68 0D80013C */  lui        $at, %hi(glSeedTbl)
    /* 28C6C 80038C6C 21082200 */  addu       $at, $at, $v0
    /* 28C70 80038C70 5CF7248C */  lw         $a0, %lo(glSeedTbl)($at)
    /* 28C74 80038C74 1435050C */  jal        func_8014D450
    /* 28C78 80038C78 00000000 */   nop
    /* 28C7C 80038C7C 098A050C */  jal        func_80162824
    /* 28C80 80038C80 00000000 */   nop
    /* 28C84 80038C84 E4D8010C */  jal        Freeupstairs__Fv
    /* 28C88 80038C88 00000000 */   nop
    /* 28C8C 80038C8C 33E30008 */  j          .L80038CCC
    /* 28C90 80038C90 03000424 */   addiu     $a0, $zero, 0x3
  jlabel .L80038C94
    /* 28C94 80038C94 1280023C */  lui        $v0, %hi(currlevel)
    /* 28C98 80038C98 0CC14290 */  lbu        $v0, %lo(currlevel)($v0)
    /* 28C9C 80038C9C 00000000 */  nop
    /* 28CA0 80038CA0 80100200 */  sll        $v0, $v0, 2
    /* 28CA4 80038CA4 0D80013C */  lui        $at, %hi(glSeedTbl)
    /* 28CA8 80038CA8 21082200 */  addu       $at, $at, $v0
    /* 28CAC 80038CAC 5CF7248C */  lw         $a0, %lo(glSeedTbl)($at)
    /* 28CB0 80038CB0 7E54050C */  jal        func_801551F8
    /* 28CB4 80038CB4 00000000 */   nop
    /* 28CB8 80038CB8 6C8A050C */  jal        func_801629B0
    /* 28CBC 80038CBC 00000000 */   nop
    /* 28CC0 80038CC0 E4D8010C */  jal        Freeupstairs__Fv
    /* 28CC4 80038CC4 00000000 */   nop
    /* 28CC8 80038CC8 04000424 */  addiu      $a0, $zero, 0x4
  .L80038CCC:
    /* 28CCC 80038CCC 9BFB010C */  jal        LoadRndLvlPal__Fi
    /* 28CD0 80038CD0 00000000 */   nop
  .L80038CD4:
    /* 28CD4 80038CD4 1380043C */  lui        $a0, %hi(D_8012EC28)
    /* 28CD8 80038CD8 28EC8424 */  addiu      $a0, $a0, %lo(D_8012EC28)
    /* 28CDC 80038CDC CD40000C */  jal        longjmp
    /* 28CE0 80038CE0 01000524 */   addiu     $a1, $zero, 0x1
    /* 28CE4 80038CE4 1000BF8F */  lw         $ra, 0x10($sp)
    /* 28CE8 80038CE8 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 28CEC 80038CEC 0800E003 */  jr         $ra
    /* 28CF0 80038CF0 00000000 */   nop
endlabel LoCreateLevel__FPv
