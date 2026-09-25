.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching BL_AsyncReadFile__FPcUl, 0x160

glabel BL_AsyncReadFile__FPcUl
    /* 7746C 8008746C A0FFBD27 */  addiu      $sp, $sp, -0x60
    /* 77470 80087470 4C00B1AF */  sw         $s1, 0x4C($sp)
    /* 77474 80087474 21888000 */  addu       $s1, $a0, $zero
    /* 77478 80087478 5000B2AF */  sw         $s2, 0x50($sp)
    /* 7747C 8008747C 2190A000 */  addu       $s2, $a1, $zero
    /* 77480 80087480 5800BFAF */  sw         $ra, 0x58($sp)
    /* 77484 80087484 5400B3AF */  sw         $s3, 0x54($sp)
    /* 77488 80087488 01A4000C */  jal        fileexists
    /* 7748C 8008748C 4800B0AF */   sw        $s0, 0x48($sp)
    /* 77490 80087490 09004014 */  bnez       $v0, .L800874B8
    /* 77494 80087494 00000000 */   nop
    /* 77498 80087498 1180023C */  lui        $v0, %hi(D_8011027C)
    /* 7749C 8008749C 7C024224 */  addiu      $v0, $v0, %lo(D_8011027C)
    /* 774A0 800874A0 05004010 */  beqz       $v0, .L800874B8
    /* 774A4 800874A4 21200000 */   addu      $a0, $zero, $zero
    /* 774A8 800874A8 1180053C */  lui        $a1, %hi(D_8011028C)
    /* 774AC 800874AC 8C02A524 */  addiu      $a1, $a1, %lo(D_8011028C)
    /* 774B0 800874B0 A583000C */  jal        DBG_Error
    /* 774B4 800874B4 CA000624 */   addiu     $a2, $zero, 0xCA
  .L800874B8:
    /* 774B8 800874B8 DFA3000C */  jal        filesize
    /* 774BC 800874BC 21202002 */   addu      $a0, $s1, $zero
    /* 774C0 800874C0 21804000 */  addu       $s0, $v0, $zero
    /* 774C4 800874C4 07000016 */  bnez       $s0, .L800874E4
    /* 774C8 800874C8 21200002 */   addu      $a0, $s0, $zero
    /* 774CC 800874CC 21200000 */  addu       $a0, $zero, $zero
    /* 774D0 800874D0 1180053C */  lui        $a1, %hi(D_8011028C)
    /* 774D4 800874D4 8C02A524 */  addiu      $a1, $a1, %lo(D_8011028C)
    /* 774D8 800874D8 A583000C */  jal        DBG_Error
    /* 774DC 800874DC CF000624 */   addiu     $a2, $zero, 0xCF
    /* 774E0 800874E0 21200002 */  addu       $a0, $s0, $zero
  .L800874E4:
    /* 774E4 800874E4 21284002 */  addu       $a1, $s2, $zero
    /* 774E8 800874E8 7785000C */  jal        GAL_Alloc
    /* 774EC 800874EC 21300000 */   addu      $a2, $zero, $zero
    /* 774F0 800874F0 21904000 */  addu       $s2, $v0, $zero
    /* 774F4 800874F4 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 774F8 800874F8 05004216 */  bne        $s2, $v0, .L80087510
    /* 774FC 800874FC 21200000 */   addu      $a0, $zero, $zero
    /* 77500 80087500 1180053C */  lui        $a1, %hi(D_8011028C)
    /* 77504 80087504 8C02A524 */  addiu      $a1, $a1, %lo(D_8011028C)
    /* 77508 80087508 A583000C */  jal        DBG_Error
    /* 7750C 8008750C D2000624 */   addiu     $a2, $zero, 0xD2
  .L80087510:
    /* 77510 80087510 DD85000C */  jal        GAL_Lock
    /* 77514 80087514 21204002 */   addu      $a0, $s2, $zero
    /* 77518 80087518 06004016 */  bnez       $s2, .L80087534
    /* 7751C 8008751C 21984000 */   addu      $s3, $v0, $zero
    /* 77520 80087520 21200000 */  addu       $a0, $zero, $zero
    /* 77524 80087524 1180053C */  lui        $a1, %hi(D_8011028C)
    /* 77528 80087528 8C02A524 */  addiu      $a1, $a1, %lo(D_8011028C)
    /* 7752C 8008752C A583000C */  jal        DBG_Error
    /* 77530 80087530 D5000624 */   addiu     $a2, $zero, 0xD5
  .L80087534:
    /* 77534 80087534 698F000C */  jal        setasyncfile
    /* 77538 80087538 21202002 */   addu      $a0, $s1, $zero
    /* 7753C 8008753C 21200000 */  addu       $a0, $zero, $zero
    /* 77540 80087540 21286002 */  addu       $a1, $s3, $zero
    /* 77544 80087544 3690000C */  jal        asyncloadsegment
    /* 77548 80087548 21300002 */   addu      $a2, $s0, $zero
    /* 7754C 8008754C 21884000 */  addu       $s1, $v0, $zero
  .L80087550:
    /* 77550 80087550 53BE000C */  jal        systemtask
    /* 77554 80087554 21200000 */   addu      $a0, $zero, $zero
    /* 77558 80087558 DB93000C */  jal        getasyncreadstatus
    /* 7755C 8008755C 21202002 */   addu      $a0, $s1, $zero
    /* 77560 80087560 01000424 */  addiu      $a0, $zero, 0x1
    /* 77564 80087564 EE80000C */  jal        TSK_Sleep
    /* 77568 80087568 21804000 */   addu      $s0, $v0, $zero
    /* 7756C 8008756C 00861000 */  sll        $s0, $s0, 24
    /* 77570 80087570 F7FF0012 */  beqz       $s0, .L80087550
    /* 77574 80087574 00000000 */   nop
    /* 77578 80087578 9A90000C */  jal        cancelasyncload
    /* 7757C 8008757C 21202002 */   addu      $a0, $s1, $zero
    /* 77580 80087580 F785000C */  jal        GAL_Unlock
    /* 77584 80087584 21204002 */   addu      $a0, $s2, $zero
    /* 77588 80087588 FF004230 */  andi       $v0, $v0, 0xFF
    /* 7758C 8008758C 07004014 */  bnez       $v0, .L800875AC
    /* 77590 80087590 21104002 */   addu      $v0, $s2, $zero
    /* 77594 80087594 21200000 */  addu       $a0, $zero, $zero
    /* 77598 80087598 1180053C */  lui        $a1, %hi(D_8011028C)
    /* 7759C 8008759C 8C02A524 */  addiu      $a1, $a1, %lo(D_8011028C)
    /* 775A0 800875A0 A583000C */  jal        DBG_Error
    /* 775A4 800875A4 EB000624 */   addiu     $a2, $zero, 0xEB
    /* 775A8 800875A8 21104002 */  addu       $v0, $s2, $zero
  .L800875AC:
    /* 775AC 800875AC 5800BF8F */  lw         $ra, 0x58($sp)
    /* 775B0 800875B0 5400B38F */  lw         $s3, 0x54($sp)
    /* 775B4 800875B4 5000B28F */  lw         $s2, 0x50($sp)
    /* 775B8 800875B8 4C00B18F */  lw         $s1, 0x4C($sp)
    /* 775BC 800875BC 4800B08F */  lw         $s0, 0x48($sp)
    /* 775C0 800875C0 6000BD27 */  addiu      $sp, $sp, 0x60
    /* 775C4 800875C4 0800E003 */  jr         $ra
    /* 775C8 800875C8 00000000 */   nop
endlabel BL_AsyncReadFile__FPcUl
