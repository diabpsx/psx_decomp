.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GM_UseTexData__Fi, 0x134

glabel GM_UseTexData__Fi
    /* 83C10 80093C10 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 83C14 80093C14 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 83C18 80093C18 21988000 */  addu       $s3, $a0, $zero
    /* 83C1C 80093C1C 7401622E */  sltiu      $v0, $s3, 0x174
    /* 83C20 80093C20 2400BFAF */  sw         $ra, 0x24($sp)
    /* 83C24 80093C24 2000B4AF */  sw         $s4, 0x20($sp)
    /* 83C28 80093C28 1800B2AF */  sw         $s2, 0x18($sp)
    /* 83C2C 80093C2C 1400B1AF */  sw         $s1, 0x14($sp)
    /* 83C30 80093C30 06004014 */  bnez       $v0, .L80093C4C
    /* 83C34 80093C34 1000B0AF */   sw        $s0, 0x10($sp)
    /* 83C38 80093C38 21200000 */  addu       $a0, $zero, $zero
    /* 83C3C 80093C3C 1180053C */  lui        $a1, %hi(D_80110598)
    /* 83C40 80093C40 9805A524 */  addiu      $a1, $a1, %lo(D_80110598)
    /* 83C44 80093C44 A583000C */  jal        DBG_Error
    /* 83C48 80093C48 21050624 */   addiu     $a2, $zero, 0x521
  .L80093C4C:
    /* 83C4C 80093C4C 80101300 */  sll        $v0, $s3, 2
    /* 83C50 80093C50 0C80013C */  lui        $at, %hi(AllDats)
    /* 83C54 80093C54 21082200 */  addu       $at, $at, $v0
    /* 83C58 80093C58 5494228C */  lw         $v0, %lo(AllDats)($at)
    /* 83C5C 80093C5C 00000000 */  nop
    /* 83C60 80093C60 26004014 */  bnez       $v0, .L80093CFC
    /* 83C64 80093C64 FFFF0524 */   addiu     $a1, $zero, -0x1
    /* 83C68 80093C68 21900000 */  addu       $s2, $zero, $zero
    /* 83C6C 80093C6C 0B80143C */  lui        $s4, %hi(TX_DatTab)
    /* 83C70 80093C70 042D9426 */  addiu      $s4, $s4, %lo(TX_DatTab)
    /* 83C74 80093C74 21880000 */  addu       $s1, $zero, $zero
    /* 83C78 80093C78 0C80103C */  lui        $s0, %hi(DatPool)
    /* 83C7C 80093C7C 948B1026 */  addiu      $s0, $s0, %lo(DatPool)
  .L80093C80:
    /* 83C80 80093C80 BA54020C */  jal        IsLoaded__C7TextDat
    /* 83C84 80093C84 21200002 */   addu      $a0, $s0, $zero
    /* 83C88 80093C88 01004238 */  xori       $v0, $v0, 0x1
    /* 83C8C 80093C8C 02004010 */  beqz       $v0, .L80093C98
    /* 83C90 80093C90 00000000 */   nop
    /* 83C94 80093C94 21900002 */  addu       $s2, $s0, $zero
  .L80093C98:
    /* 83C98 80093C98 01003126 */  addiu      $s1, $s1, 0x1
    /* 83C9C 80093C9C 1400222A */  slti       $v0, $s1, 0x14
    /* 83CA0 80093CA0 03004010 */  beqz       $v0, .L80093CB0
    /* 83CA4 80093CA4 70001026 */   addiu     $s0, $s0, 0x70
    /* 83CA8 80093CA8 F5FF4012 */  beqz       $s2, .L80093C80
    /* 83CAC 80093CAC 00000000 */   nop
  .L80093CB0:
    /* 83CB0 80093CB0 06004016 */  bnez       $s2, .L80093CCC
    /* 83CB4 80093CB4 00000000 */   nop
    /* 83CB8 80093CB8 21200000 */  addu       $a0, $zero, $zero
    /* 83CBC 80093CBC 1180053C */  lui        $a1, %hi(D_80110598)
    /* 83CC0 80093CC0 9805A524 */  addiu      $a1, $a1, %lo(D_80110598)
    /* 83CC4 80093CC4 A583000C */  jal        DBG_Error
    /* 83CC8 80093CC8 2E050624 */   addiu     $a2, $zero, 0x52E
  .L80093CCC:
    /* 83CCC 80093CCC 21204002 */  addu       $a0, $s2, $zero
    /* 83CD0 80093CD0 80801300 */  sll        $s0, $s3, 2
    /* 83CD4 80093CD4 21101402 */  addu       $v0, $s0, $s4
    /* 83CD8 80093CD8 0000458C */  lw         $a1, 0x0($v0)
    /* 83CDC 80093CDC CC54020C */  jal        SetFileInfo__7TextDatPC13CTextFileInfoi_80095330
    /* 83CE0 80093CE0 21306002 */   addu      $a2, $s3, $zero
    /* 83CE4 80093CE4 A247020C */  jal        OnceOnlyInit__7TextDat
    /* 83CE8 80093CE8 21204002 */   addu      $a0, $s2, $zero
    /* 83CEC 80093CEC 0C80013C */  lui        $at, %hi(AllDats)
    /* 83CF0 80093CF0 21083000 */  addu       $at, $at, $s0
    /* 83CF4 80093CF4 549432AC */  sw         $s2, %lo(AllDats)($at)
    /* 83CF8 80093CF8 FFFF0524 */  addiu      $a1, $zero, -0x1
  .L80093CFC:
    /* 83CFC 80093CFC 01000624 */  addiu      $a2, $zero, 0x1
    /* 83D00 80093D00 0C80023C */  lui        $v0, %hi(AllDats)
    /* 83D04 80093D04 54944224 */  addiu      $v0, $v0, %lo(AllDats)
    /* 83D08 80093D08 80801300 */  sll        $s0, $s3, 2
    /* 83D0C 80093D0C 21800202 */  addu       $s0, $s0, $v0
    /* 83D10 80093D10 0000048E */  lw         $a0, 0x0($s0)
    /* 83D14 80093D14 CC47020C */  jal        Use__7TextDatlbi
    /* 83D18 80093D18 21380000 */   addu      $a3, $zero, $zero
    /* 83D1C 80093D1C 0000028E */  lw         $v0, 0x0($s0)
    /* 83D20 80093D20 2400BF8F */  lw         $ra, 0x24($sp)
    /* 83D24 80093D24 2000B48F */  lw         $s4, 0x20($sp)
    /* 83D28 80093D28 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 83D2C 80093D2C 1800B28F */  lw         $s2, 0x18($sp)
    /* 83D30 80093D30 1400B18F */  lw         $s1, 0x14($sp)
    /* 83D34 80093D34 1000B08F */  lw         $s0, 0x10($sp)
    /* 83D38 80093D38 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 83D3C 80093D3C 0800E003 */  jr         $ra
    /* 83D40 80093D40 00000000 */   nop
endlabel GM_UseTexData__Fi
