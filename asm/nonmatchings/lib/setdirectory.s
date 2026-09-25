.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching setdirectory, 0xD8

glabel setdirectory
    /* 18918 80028918 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 1891C 8002891C 1400B1AF */  sw         $s1, 0x14($sp)
    /* 18920 80028920 21888000 */  addu       $s1, $a0, $zero
    /* 18924 80028924 1000B0AF */  sw         $s0, 0x10($sp)
    /* 18928 80028928 0B80103C */  lui        $s0, %hi(currentdirectory)
    /* 1892C 8002892C 84691026 */  addiu      $s0, $s0, %lo(currentdirectory)
    /* 18930 80028930 3A000524 */  addiu      $a1, $zero, 0x3A
    /* 18934 80028934 1800BFAF */  sw         $ra, 0x18($sp)
    /* 18938 80028938 1341000C */  jal        strchr
    /* 1893C 8002893C 000000A2 */   sb        $zero, 0x0($s0)
    /* 18940 80028940 10004014 */  bnez       $v0, .L80028984
    /* 18944 80028944 00000000 */   nop
    /* 18948 80028948 21202002 */  addu       $a0, $s1, $zero
    /* 1894C 8002894C 1341000C */  jal        strchr
    /* 18950 80028950 5C000524 */   addiu     $a1, $zero, 0x5C
    /* 18954 80028954 0B004010 */  beqz       $v0, .L80028984
    /* 18958 80028958 00000000 */   nop
    /* 1895C 8002895C 1280023C */  lui        $v0, %hi(disablecd)
    /* 18960 80028960 2CC5428C */  lw         $v0, %lo(disablecd)($v0)
    /* 18964 80028964 1280053C */  lui        $a1, %hi(D_8011C43C)
    /* 18968 80028968 3CC4A524 */  addiu      $a1, $a1, %lo(D_8011C43C)
    /* 1896C 8002896C 03004010 */  beqz       $v0, .L8002897C
    /* 18970 80028970 00000000 */   nop
    /* 18974 80028974 1280053C */  lui        $a1, %hi(D_8011C434)
    /* 18978 80028978 34C4A524 */  addiu      $a1, $a1, %lo(D_8011C434)
  .L8002897C:
    /* 1897C 8002897C F240000C */  jal        strcpy
    /* 18980 80028980 21200002 */   addu      $a0, $s0, $zero
  .L80028984:
    /* 18984 80028984 0B80103C */  lui        $s0, %hi(currentdirectory)
    /* 18988 80028988 84691026 */  addiu      $s0, $s0, %lo(currentdirectory)
    /* 1898C 8002898C 21200002 */  addu       $a0, $s0, $zero
    /* 18990 80028990 FC40000C */  jal        strcat
    /* 18994 80028994 21282002 */   addu      $a1, $s1, $zero
    /* 18998 80028998 8767000C */  jal        strlen
    /* 1899C 8002899C 21200002 */   addu      $a0, $s0, $zero
    /* 189A0 800289A0 21184000 */  addu       $v1, $v0, $zero
    /* 189A4 800289A4 0C006010 */  beqz       $v1, .L800289D8
    /* 189A8 800289A8 FFFF0226 */   addiu     $v0, $s0, -0x1
    /* 189AC 800289AC 21306200 */  addu       $a2, $v1, $v0
    /* 189B0 800289B0 0000C390 */  lbu        $v1, 0x0($a2)
    /* 189B4 800289B4 5C000224 */  addiu      $v0, $zero, 0x5C
    /* 189B8 800289B8 07006210 */  beq        $v1, $v0, .L800289D8
    /* 189BC 800289BC 3A000224 */   addiu     $v0, $zero, 0x3A
    /* 189C0 800289C0 05006210 */  beq        $v1, $v0, .L800289D8
    /* 189C4 800289C4 00000000 */   nop
    /* 189C8 800289C8 C41C8283 */  lb         $v0, %gp_rel(D_8011C444)($gp)
    /* 189CC 800289CC C51C8383 */  lb         $v1, %gp_rel(D_8011C445)($gp)
    /* 189D0 800289D0 0100C2A0 */  sb         $v0, 0x1($a2)
    /* 189D4 800289D4 0200C3A0 */  sb         $v1, 0x2($a2)
  .L800289D8:
    /* 189D8 800289D8 1800BF8F */  lw         $ra, 0x18($sp)
    /* 189DC 800289DC 1400B18F */  lw         $s1, 0x14($sp)
    /* 189E0 800289E0 1000B08F */  lw         $s0, 0x10($sp)
    /* 189E4 800289E4 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 189E8 800289E8 0800E003 */  jr         $ra
    /* 189EC 800289EC 00000000 */   nop
endlabel setdirectory
