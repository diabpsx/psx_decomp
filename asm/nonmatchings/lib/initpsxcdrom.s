.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching initpsxcdrom, 0x158

glabel initpsxcdrom
    /* 17244 80027244 701C828F */  lw         $v0, %gp_rel(cdrominitflag)($gp)
    /* 17248 80027248 C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* 1724C 8002724C 3400BFAF */  sw         $ra, 0x34($sp)
    /* 17250 80027250 4C004014 */  bnez       $v0, .L80027384
    /* 17254 80027254 3000B0AF */   sw        $s0, 0x30($sp)
    /* 17258 80027258 FDBF000C */  jal        initgp
    /* 1725C 8002725C 00000000 */   nop
    /* 17260 80027260 514A000C */  jal        _96_remove
    /* 17264 80027264 00000000 */   nop
    /* 17268 80027268 EB6A000C */  jal        CdInit
    /* 1726C 8002726C 00000000 */   nop
    /* 17270 80027270 5D6B000C */  jal        CdSetDebug
    /* 17274 80027274 21200000 */   addu      $a0, $zero, $zero
    /* 17278 80027278 FF000224 */  addiu      $v0, $zero, 0xFF
    /* 1727C 8002727C 1380013C */  lui        $at, %hi(cdrombuf + 0x1)
    /* 17280 80027280 317222A0 */  sb         $v0, %lo(cdrombuf + 0x1)($at)
    /* 17284 80027284 1380103C */  lui        $s0, %hi(cdrombuf)
    /* 17288 80027288 30721026 */  addiu      $s0, $s0, %lo(cdrombuf)
    /* 1728C 8002728C 6DA1000C */  jal        CdGetToc
    /* 17290 80027290 21200002 */   addu      $a0, $s0, $zero
    /* 17294 80027294 03004014 */  bnez       $v0, .L800272A4
    /* 17298 80027298 FF000224 */   addiu     $v0, $zero, 0xFF
    /* 1729C 8002729C E29C0008 */  j          .L80027388
    /* 172A0 800272A0 21100000 */   addu      $v0, $zero, $zero
  .L800272A4:
    /* 172A4 800272A4 1380033C */  lui        $v1, %hi(cdrombuf + 0x1)
    /* 172A8 800272A8 31726390 */  lbu        $v1, %lo(cdrombuf + 0x1)($v1)
    /* 172AC 800272AC 00000000 */  nop
    /* 172B0 800272B0 03006214 */  bne        $v1, $v0, .L800272C0
    /* 172B4 800272B4 FF000324 */   addiu     $v1, $zero, 0xFF
  .L800272B8:
    /* 172B8 800272B8 FFFF6210 */  beq        $v1, $v0, .L800272B8
    /* 172BC 800272BC 00000000 */   nop
  .L800272C0:
    /* 172C0 800272C0 04000392 */  lbu        $v1, 0x4($s0)
    /* 172C4 800272C4 05000592 */  lbu        $a1, 0x5($s0)
    /* 172C8 800272C8 04000426 */  addiu      $a0, $s0, 0x4
    /* 172CC 800272CC 16000224 */  addiu      $v0, $zero, 0x16
    /* 172D0 800272D0 1200A2A3 */  sb         $v0, 0x12($sp)
    /* 172D4 800272D4 1300A0A3 */  sb         $zero, 0x13($sp)
    /* 172D8 800272D8 1000A3A3 */  sb         $v1, 0x10($sp)
    /* 172DC 800272DC 2D9C000C */  jal        timetosector
    /* 172E0 800272E0 1100A5A3 */   sb        $a1, 0x11($sp)
    /* 172E4 800272E4 1000A427 */  addiu      $a0, $sp, 0x10
    /* 172E8 800272E8 A82282AF */  sw         $v0, %gp_rel(datatracksector)($gp)
    /* 172EC 800272EC 2D9C000C */  jal        timetosector
    /* 172F0 800272F0 00000000 */   nop
    /* 172F4 800272F4 E42282AF */  sw         $v0, %gp_rel(asyncsector)($gp)
    /* 172F8 800272F8 A0000224 */  addiu      $v0, $zero, 0xA0
    /* 172FC 800272FC 2800A2A3 */  sb         $v0, 0x28($sp)
  .L80027300:
    /* 17300 80027300 21200000 */  addu       $a0, $zero, $zero
    /* 17304 80027304 7C6B000C */  jal        CdSync
    /* 17308 80027308 21280000 */   addu      $a1, $zero, $zero
    /* 1730C 8002730C 0E000424 */  addiu      $a0, $zero, 0xE
    /* 17310 80027310 2800A527 */  addiu      $a1, $sp, 0x28
    /* 17314 80027314 326C000C */  jal        CdControlB
    /* 17318 80027318 1800A627 */   addiu     $a2, $sp, 0x18
    /* 1731C 8002731C 1800A293 */  lbu        $v0, 0x18($sp)
    /* 17320 80027320 00000000 */  nop
    /* 17324 80027324 01004230 */  andi       $v0, $v0, 0x1
    /* 17328 80027328 F5FF4014 */  bnez       $v0, .L80027300
    /* 1732C 8002732C 00000000 */   nop
    /* 17330 80027330 1748000C */  jal        VSync
    /* 17334 80027334 03000424 */   addiu     $a0, $zero, 0x3
    /* 17338 80027338 E422828F */  lw         $v0, %gp_rel(asyncsector)($gp)
    /* 1733C 8002733C A822848F */  lw         $a0, %gp_rel(datatracksector)($gp)
    /* 17340 80027340 EE9C000C */  jal        psxcdromseek
    /* 17344 80027344 23204400 */   subu      $a0, $v0, $a0
    /* 17348 80027348 1380103C */  lui        $s0, %hi(cdrombuf)
    /* 1734C 8002734C 30721026 */  addiu      $s0, $s0, %lo(cdrombuf)
    /* 17350 80027350 21200002 */  addu       $a0, $s0, $zero
    /* 17354 80027354 FB9C000C */  jal        psxcdromread
    /* 17358 80027358 01000524 */   addiu     $a1, $zero, 0x1
    /* 1735C 8002735C 9E000426 */  addiu      $a0, $s0, 0x9E
    /* 17360 80027360 D3B2000C */  jal        geti
    /* 17364 80027364 04000524 */   addiu     $a1, $zero, 0x4
    /* 17368 80027368 A6000426 */  addiu      $a0, $s0, 0xA6
    /* 1736C 8002736C B82282AF */  sw         $v0, %gp_rel(rootsector)($gp)
    /* 17370 80027370 D3B2000C */  jal        geti
    /* 17374 80027374 04000524 */   addiu     $a1, $zero, 0x4
    /* 17378 80027378 B02282AF */  sw         $v0, %gp_rel(rootlength)($gp)
    /* 1737C 8002737C 01000224 */  addiu      $v0, $zero, 0x1
    /* 17380 80027380 701C82AF */  sw         $v0, %gp_rel(cdrominitflag)($gp)
  .L80027384:
    /* 17384 80027384 01000224 */  addiu      $v0, $zero, 0x1
  .L80027388:
    /* 17388 80027388 3400BF8F */  lw         $ra, 0x34($sp)
    /* 1738C 8002738C 3000B08F */  lw         $s0, 0x30($sp)
    /* 17390 80027390 3800BD27 */  addiu      $sp, $sp, 0x38
    /* 17394 80027394 0800E003 */  jr         $ra
    /* 17398 80027398 00000000 */   nop
endlabel initpsxcdrom
