.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SortOutFileSystem__Fv, 0x130

glabel SortOutFileSystem__Fv
    /* 7448C 8008448C 1180033C */  lui        $v1, %hi(OPT_FileSystem)
    /* 74490 80084490 ECDB638C */  lw         $v1, %lo(OPT_FileSystem)($v1)
    /* 74494 80084494 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 74498 80084498 1400BFAF */  sw         $ra, 0x14($sp)
    /* 7449C 8008449C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 744A0 800844A0 6C0380AF */  sw         $zero, %gp_rel(FileSYS)($gp)
    /* 744A4 800844A4 05006010 */  beqz       $v1, .L800844BC
    /* 744A8 800844A8 01000224 */   addiu     $v0, $zero, 0x1
    /* 744AC 800844AC 1F006210 */  beq        $v1, $v0, .L8008452C
    /* 744B0 800844B0 14000424 */   addiu     $a0, $zero, 0x14
    /* 744B4 800844B4 55110208 */  j          .L80084554
    /* 744B8 800844B8 00000000 */   nop
  .L800844BC:
    /* 744BC 800844BC 1180033C */  lui        $v1, %hi(OPT_DevKit)
    /* 744C0 800844C0 F0DB638C */  lw         $v1, %lo(OPT_DevKit)($v1)
    /* 744C4 800844C4 6C0382AF */  sw         $v0, %gp_rel(FileSYS)($gp)
    /* 744C8 800844C8 22006004 */  bltz       $v1, .L80084554
    /* 744CC 800844CC 02006228 */   slti      $v0, $v1, 0x2
    /* 744D0 800844D0 06004014 */  bnez       $v0, .L800844EC
    /* 744D4 800844D4 14000424 */   addiu     $a0, $zero, 0x14
    /* 744D8 800844D8 02000224 */  addiu      $v0, $zero, 0x2
    /* 744DC 800844DC 0B006210 */  beq        $v1, $v0, .L8008450C
    /* 744E0 800844E0 00000000 */   nop
    /* 744E4 800844E4 55110208 */  j          .L80084554
    /* 744E8 800844E8 00000000 */   nop
  .L800844EC:
    /* 744EC 800844EC 9719020C */  jal        __nw__6SysObjiUl
    /* 744F0 800844F0 01000524 */   addiu     $a1, $zero, 0x1
    /* 744F4 800844F4 21204000 */  addu       $a0, $v0, $zero
    /* 744F8 800844F8 2D18020C */  jal        __4PCIOUl
    /* 744FC 800844FC 01000524 */   addiu     $a1, $zero, 0x1
    /* 74500 80084500 BC1E82AF */  sw         $v0, %gp_rel(D_8011C63C)($gp)
    /* 74504 80084504 55110208 */  j          .L80084554
    /* 74508 80084508 00000000 */   nop
  .L8008450C:
    /* 7450C 8008450C 9719020C */  jal        __nw__6SysObjiUl
    /* 74510 80084510 01000524 */   addiu     $a1, $zero, 0x1
    /* 74514 80084514 21204000 */  addu       $a0, $v0, $zero
    /* 74518 80084518 D119020C */  jal        __5DatIOUl
    /* 7451C 8008451C 01000524 */   addiu     $a1, $zero, 0x1
    /* 74520 80084520 BC1E82AF */  sw         $v0, %gp_rel(D_8011C63C)($gp)
    /* 74524 80084524 55110208 */  j          .L80084554
    /* 74528 80084528 00000000 */   nop
  .L8008452C:
    /* 7452C 8008452C 02000224 */  addiu      $v0, $zero, 0x2
    /* 74530 80084530 6C0382AF */  sw         $v0, %gp_rel(FileSYS)($gp)
    /* 74534 80084534 9719020C */  jal        __nw__6SysObjiUl
    /* 74538 80084538 01000524 */   addiu     $a1, $zero, 0x1
    /* 7453C 8008453C 21204000 */  addu       $a0, $v0, $zero
    /* 74540 80084540 101B020C */  jal        __4CdIOUl
    /* 74544 80084544 01000524 */   addiu     $a1, $zero, 0x1
    /* 74548 80084548 BC1E82AF */  sw         $v0, %gp_rel(D_8011C63C)($gp)
    /* 7454C 8008454C 971C020C */  jal        BL_InitEAC__Fv
    /* 74550 80084550 00000000 */   nop
  .L80084554:
    /* 74554 80084554 BC1E828F */  lw         $v0, %gp_rel(D_8011C63C)($gp)
    /* 74558 80084558 00000000 */  nop
    /* 7455C 8008455C C01E82AF */  sw         $v0, %gp_rel(D_8011C640)($gp)
    /* 74560 80084560 05004014 */  bnez       $v0, .L80084578
    /* 74564 80084564 21200000 */   addu      $a0, $zero, $zero
    /* 74568 80084568 1180053C */  lui        $a1, %hi(D_80110030)
    /* 7456C 8008456C 3000A524 */  addiu      $a1, $a1, %lo(D_80110030)
    /* 74570 80084570 A583000C */  jal        DBG_Error
    /* 74574 80084574 FF000624 */   addiu     $a2, $zero, 0xFF
  .L80084578:
    /* 74578 80084578 1180103C */  lui        $s0, %hi(D_80110044)
    /* 7457C 8008457C 44001026 */  addiu      $s0, $s0, %lo(D_80110044)
    /* 74580 80084580 BC1E848F */  lw         $a0, %gp_rel(D_8011C63C)($gp)
    /* 74584 80084584 4717020C */  jal        SetSearchPath__6FileIOPCc
    /* 74588 80084588 21280002 */   addu      $a1, $s0, $zero
    /* 7458C 8008458C C01E848F */  lw         $a0, %gp_rel(D_8011C640)($gp)
    /* 74590 80084590 BC1E828F */  lw         $v0, %gp_rel(D_8011C63C)($gp)
    /* 74594 80084594 00000000 */  nop
    /* 74598 80084598 03008210 */  beq        $a0, $v0, .L800845A8
    /* 7459C 8008459C 00000000 */   nop
    /* 745A0 800845A0 4717020C */  jal        SetSearchPath__6FileIOPCc
    /* 745A4 800845A4 21280002 */   addu      $a1, $s0, $zero
  .L800845A8:
    /* 745A8 800845A8 1400BF8F */  lw         $ra, 0x14($sp)
    /* 745AC 800845AC 1000B08F */  lw         $s0, 0x10($sp)
    /* 745B0 800845B0 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 745B4 800845B4 0800E003 */  jr         $ra
    /* 745B8 800845B8 00000000 */   nop
endlabel SortOutFileSystem__Fv
