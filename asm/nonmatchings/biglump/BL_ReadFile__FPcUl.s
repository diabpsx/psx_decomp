.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching BL_ReadFile__FPcUl, 0x118

glabel BL_ReadFile__FPcUl
    /* 77354 80087354 A8FFBD27 */  addiu      $sp, $sp, -0x58
    /* 77358 80087358 5000B2AF */  sw         $s2, 0x50($sp)
    /* 7735C 8008735C 21908000 */  addu       $s2, $a0, $zero
    /* 77360 80087360 4C00B1AF */  sw         $s1, 0x4C($sp)
    /* 77364 80087364 2188A000 */  addu       $s1, $a1, $zero
    /* 77368 80087368 5400BFAF */  sw         $ra, 0x54($sp)
    /* 7736C 8008736C 01A4000C */  jal        fileexists
    /* 77370 80087370 4800B0AF */   sw        $s0, 0x48($sp)
    /* 77374 80087374 09004014 */  bnez       $v0, .L8008739C
    /* 77378 80087378 00000000 */   nop
    /* 7737C 8008737C 1180023C */  lui        $v0, %hi(D_8011027C)
    /* 77380 80087380 7C024224 */  addiu      $v0, $v0, %lo(D_8011027C)
    /* 77384 80087384 05004010 */  beqz       $v0, .L8008739C
    /* 77388 80087388 21200000 */   addu      $a0, $zero, $zero
    /* 7738C 8008738C 1180053C */  lui        $a1, %hi(D_8011028C)
    /* 77390 80087390 8C02A524 */  addiu      $a1, $a1, %lo(D_8011028C)
    /* 77394 80087394 A583000C */  jal        DBG_Error
    /* 77398 80087398 A5000624 */   addiu     $a2, $zero, 0xA5
  .L8008739C:
    /* 7739C 8008739C DFA3000C */  jal        filesize
    /* 773A0 800873A0 21204002 */   addu      $a0, $s2, $zero
    /* 773A4 800873A4 21804000 */  addu       $s0, $v0, $zero
    /* 773A8 800873A8 07000016 */  bnez       $s0, .L800873C8
    /* 773AC 800873AC 21200002 */   addu      $a0, $s0, $zero
    /* 773B0 800873B0 21200000 */  addu       $a0, $zero, $zero
    /* 773B4 800873B4 1180053C */  lui        $a1, %hi(D_8011028C)
    /* 773B8 800873B8 8C02A524 */  addiu      $a1, $a1, %lo(D_8011028C)
    /* 773BC 800873BC A583000C */  jal        DBG_Error
    /* 773C0 800873C0 AA000624 */   addiu     $a2, $zero, 0xAA
    /* 773C4 800873C4 21200002 */  addu       $a0, $s0, $zero
  .L800873C8:
    /* 773C8 800873C8 21282002 */  addu       $a1, $s1, $zero
    /* 773CC 800873CC 7785000C */  jal        GAL_Alloc
    /* 773D0 800873D0 21300000 */   addu      $a2, $zero, $zero
    /* 773D4 800873D4 21804000 */  addu       $s0, $v0, $zero
    /* 773D8 800873D8 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 773DC 800873DC 05000216 */  bne        $s0, $v0, .L800873F4
    /* 773E0 800873E0 21200000 */   addu      $a0, $zero, $zero
    /* 773E4 800873E4 1180053C */  lui        $a1, %hi(D_8011028C)
    /* 773E8 800873E8 8C02A524 */  addiu      $a1, $a1, %lo(D_8011028C)
    /* 773EC 800873EC A583000C */  jal        DBG_Error
    /* 773F0 800873F0 AD000624 */   addiu     $a2, $zero, 0xAD
  .L800873F4:
    /* 773F4 800873F4 DD85000C */  jal        GAL_Lock
    /* 773F8 800873F8 21200002 */   addu      $a0, $s0, $zero
    /* 773FC 800873FC 06000016 */  bnez       $s0, .L80087418
    /* 77400 80087400 21884000 */   addu      $s1, $v0, $zero
    /* 77404 80087404 21200000 */  addu       $a0, $zero, $zero
    /* 77408 80087408 1180053C */  lui        $a1, %hi(D_8011028C)
    /* 7740C 8008740C 8C02A524 */  addiu      $a1, $a1, %lo(D_8011028C)
    /* 77410 80087410 A583000C */  jal        DBG_Error
    /* 77414 80087414 B0000624 */   addiu     $a2, $zero, 0xB0
  .L80087418:
    /* 77418 80087418 21204002 */  addu       $a0, $s2, $zero
    /* 7741C 8008741C 68A6000C */  jal        loadfileatadr
    /* 77420 80087420 21282002 */   addu      $a1, $s1, $zero
    /* 77424 80087424 F785000C */  jal        GAL_Unlock
    /* 77428 80087428 21200002 */   addu      $a0, $s0, $zero
    /* 7742C 8008742C FF004230 */  andi       $v0, $v0, 0xFF
    /* 77430 80087430 07004014 */  bnez       $v0, .L80087450
    /* 77434 80087434 21100002 */   addu      $v0, $s0, $zero
    /* 77438 80087438 21200000 */  addu       $a0, $zero, $zero
    /* 7743C 8008743C 1180053C */  lui        $a1, %hi(D_8011028C)
    /* 77440 80087440 8C02A524 */  addiu      $a1, $a1, %lo(D_8011028C)
    /* 77444 80087444 A583000C */  jal        DBG_Error
    /* 77448 80087448 B5000624 */   addiu     $a2, $zero, 0xB5
    /* 7744C 8008744C 21100002 */  addu       $v0, $s0, $zero
  .L80087450:
    /* 77450 80087450 5400BF8F */  lw         $ra, 0x54($sp)
    /* 77454 80087454 5000B28F */  lw         $s2, 0x50($sp)
    /* 77458 80087458 4C00B18F */  lw         $s1, 0x4C($sp)
    /* 7745C 8008745C 4800B08F */  lw         $s0, 0x48($sp)
    /* 77460 80087460 5800BD27 */  addiu      $sp, $sp, 0x58
    /* 77464 80087464 0800E003 */  jr         $ra
    /* 77468 80087468 00000000 */   nop
endlabel BL_ReadFile__FPcUl
