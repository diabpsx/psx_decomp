.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching S_BoyEnter__Fv, 0x198

glabel S_BoyEnter__Fv
    /* 62C38 80072C38 3413838F */  lw         $v1, %gp_rel(StorePlrNo)($gp)
    /* 62C3C 80072C3C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 62C40 80072C40 1000BFAF */  sw         $ra, 0x10($sp)
    /* 62C44 80072C44 C0100300 */  sll        $v0, $v1, 3
    /* 62C48 80072C48 23104300 */  subu       $v0, $v0, $v1
    /* 62C4C 80072C4C 80100200 */  sll        $v0, $v0, 2
    /* 62C50 80072C50 23104300 */  subu       $v0, $v0, $v1
    /* 62C54 80072C54 80100200 */  sll        $v0, $v0, 2
    /* 62C58 80072C58 0E80013C */  lui        $at, %hi(_boyitem + 0x2C)
    /* 62C5C 80072C5C 21082200 */  addu       $at, $at, $v0
    /* 62C60 80072C60 240B2384 */  lh         $v1, %lo(_boyitem + 0x2C)($at)
    /* 62C64 80072C64 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 62C68 80072C68 26006210 */  beq        $v1, $v0, .L80072D04
    /* 62C6C 80072C6C 0C000224 */   addiu     $v0, $zero, 0xC
    /* 62C70 80072C70 0421858F */  lw         $a1, %gp_rel(D_8011C884)($gp)
    /* 62C74 80072C74 00000000 */  nop
    /* 62C78 80072C78 2200A214 */  bne        $a1, $v0, .L80072D04
    /* 62C7C 80072C7C 00000000 */   nop
    /* 62C80 80072C80 1280023C */  lui        $v0, %hi(myplr)
    /* 62C84 80072C84 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 62C88 80072C88 00000000 */  nop
    /* 62C8C 80072C8C 40180200 */  sll        $v1, $v0, 1
    /* 62C90 80072C90 21186200 */  addu       $v1, $v1, $v0
    /* 62C94 80072C94 80180300 */  sll        $v1, $v1, 2
    /* 62C98 80072C98 21186200 */  addu       $v1, $v1, $v0
    /* 62C9C 80072C9C 00190300 */  sll        $v1, $v1, 4
    /* 62CA0 80072CA0 23186200 */  subu       $v1, $v1, $v0
    /* 62CA4 80072CA4 80180300 */  sll        $v1, $v1, 2
    /* 62CA8 80072CA8 21186200 */  addu       $v1, $v1, $v0
    /* 62CAC 80072CAC C0180300 */  sll        $v1, $v1, 3
    /* 62CB0 80072CB0 0E80013C */  lui        $at, %hi(plr + 0x150)
    /* 62CB4 80072CB4 21082300 */  addu       $at, $at, $v1
    /* 62CB8 80072CB8 88A6228C */  lw         $v0, %lo(plr + 0x150)($at)
    /* 62CBC 80072CBC 00000000 */  nop
    /* 62CC0 80072CC0 32004228 */  slti       $v0, $v0, 0x32
    /* 62CC4 80072CC4 09004010 */  beqz       $v0, .L80072CEC
    /* 62CC8 80072CC8 00000000 */   nop
    /* 62CCC 80072CCC 1421828F */  lw         $v0, %gp_rel(D_8011C894)($gp)
    /* 62CD0 80072CD0 0C2185AF */  sw         $a1, %gp_rel(D_8011C88C)($gp)
    /* 62CD4 80072CD4 082185AF */  sw         $a1, %gp_rel(D_8011C888)($gp)
    /* 62CD8 80072CD8 102182AF */  sw         $v0, %gp_rel(D_8011C890)($gp)
    /* 62CDC 80072CDC 5BBE010C */  jal        StartStore__Fc
    /* 62CE0 80072CE0 09000424 */   addiu     $a0, $zero, 0x9
    /* 62CE4 80072CE4 70CB0108 */  j          .L80072DC0
    /* 62CE8 80072CE8 00000000 */   nop
  .L80072CEC:
    /* 62CEC 80072CEC D2C1010C */  jal        TakePlrsMoney__Fl
    /* 62CF0 80072CF0 32000424 */   addiu     $a0, $zero, 0x32
    /* 62CF4 80072CF4 5BBE010C */  jal        StartStore__Fc
    /* 62CF8 80072CF8 0D000424 */   addiu     $a0, $zero, 0xD
    /* 62CFC 80072CFC 70CB0108 */  j          .L80072DC0
    /* 62D00 80072D00 00000000 */   nop
  .L80072D04:
    /* 62D04 80072D04 0421848F */  lw         $a0, %gp_rel(D_8011C884)($gp)
    /* 62D08 80072D08 06000224 */  addiu      $v0, $zero, 0x6
    /* 62D0C 80072D0C 0E008214 */  bne        $a0, $v0, .L80072D48
    /* 62D10 80072D10 08000224 */   addiu     $v0, $zero, 0x8
    /* 62D14 80072D14 3413838F */  lw         $v1, %gp_rel(StorePlrNo)($gp)
    /* 62D18 80072D18 00000000 */  nop
    /* 62D1C 80072D1C C0100300 */  sll        $v0, $v1, 3
    /* 62D20 80072D20 23104300 */  subu       $v0, $v0, $v1
    /* 62D24 80072D24 80100200 */  sll        $v0, $v0, 2
    /* 62D28 80072D28 23104300 */  subu       $v0, $v0, $v1
    /* 62D2C 80072D2C 80100200 */  sll        $v0, $v0, 2
    /* 62D30 80072D30 0E80013C */  lui        $at, %hi(_boyitem + 0x2C)
    /* 62D34 80072D34 21082200 */  addu       $at, $at, $v0
    /* 62D38 80072D38 240B2384 */  lh         $v1, %lo(_boyitem + 0x2C)($at)
    /* 62D3C 80072D3C FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 62D40 80072D40 10006214 */  bne        $v1, $v0, .L80072D84
    /* 62D44 80072D44 08000224 */   addiu     $v0, $zero, 0x8
  .L80072D48:
    /* 62D48 80072D48 1C008214 */  bne        $a0, $v0, .L80072DBC
    /* 62D4C 80072D4C 00000000 */   nop
    /* 62D50 80072D50 3413838F */  lw         $v1, %gp_rel(StorePlrNo)($gp)
    /* 62D54 80072D54 00000000 */  nop
    /* 62D58 80072D58 C0100300 */  sll        $v0, $v1, 3
    /* 62D5C 80072D5C 23104300 */  subu       $v0, $v0, $v1
    /* 62D60 80072D60 80100200 */  sll        $v0, $v0, 2
    /* 62D64 80072D64 23104300 */  subu       $v0, $v0, $v1
    /* 62D68 80072D68 80100200 */  sll        $v0, $v0, 2
    /* 62D6C 80072D6C 0E80013C */  lui        $at, %hi(_boyitem + 0x2C)
    /* 62D70 80072D70 21082200 */  addu       $at, $at, $v0
    /* 62D74 80072D74 240B2384 */  lh         $v1, %lo(_boyitem + 0x2C)($at)
    /* 62D78 80072D78 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 62D7C 80072D7C 0F006214 */  bne        $v1, $v0, .L80072DBC
    /* 62D80 80072D80 00000000 */   nop
  .L80072D84:
    /* 62D84 80072D84 0421838F */  lw         $v1, %gp_rel(D_8011C884)($gp)
    /* 62D88 80072D88 08000224 */  addiu      $v0, $zero, 0x8
    /* 62D8C 80072D8C 442182AF */  sw         $v0, %gp_rel(D_8011C8C4)($gp)
    /* 62D90 80072D90 0C000224 */  addiu      $v0, $zero, 0xC
    /* 62D94 80072D94 0C2182AF */  sw         $v0, %gp_rel(D_8011C88C)($gp)
    /* 62D98 80072D98 E1000224 */  addiu      $v0, $zero, 0xE1
    /* 62D9C 80072D9C 2C2182AF */  sw         $v0, %gp_rel(D_8011C8AC)($gp)
    /* 62DA0 80072DA0 EA000224 */  addiu      $v0, $zero, 0xEA
    /* 62DA4 80072DA4 302182AF */  sw         $v0, %gp_rel(D_8011C8B0)($gp)
    /* 62DA8 80072DA8 082183AF */  sw         $v1, %gp_rel(D_8011C888)($gp)
    /* 62DAC 80072DAC 5BBE010C */  jal        StartStore__Fc
    /* 62DB0 80072DB0 13000424 */   addiu     $a0, $zero, 0x13
    /* 62DB4 80072DB4 70CB0108 */  j          .L80072DC0
    /* 62DB8 80072DB8 00000000 */   nop
  .L80072DBC:
    /* 62DBC 80072DBC 601380A3 */  sb         $zero, %gp_rel(stextflag)($gp)
  .L80072DC0:
    /* 62DC0 80072DC0 1000BF8F */  lw         $ra, 0x10($sp)
    /* 62DC4 80072DC4 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 62DC8 80072DC8 0800E003 */  jr         $ra
    /* 62DCC 80072DCC 00000000 */   nop
endlabel S_BoyEnter__Fv
