.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching psxcdromread, 0x9C

glabel psxcdromread
    /* 173EC 800273EC E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 173F0 800273F0 1800B2AF */  sw         $s2, 0x18($sp)
    /* 173F4 800273F4 D422928F */  lw         $s2, %gp_rel(asyncreadcallbackfunc)($gp)
    /* 173F8 800273F8 1000B0AF */  sw         $s0, 0x10($sp)
    /* 173FC 800273FC 21808000 */  addu       $s0, $a0, $zero
    /* 17400 80027400 1400B1AF */  sw         $s1, 0x14($sp)
    /* 17404 80027404 0280043C */  lui        $a0, %hi(readdonecallback)
    /* 17408 80027408 D8738424 */  addiu      $a0, $a0, %lo(readdonecallback)
    /* 1740C 8002740C 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 17410 80027410 1280013C */  lui        $at, %hi(cdreaddone)
    /* 17414 80027414 98C520AC */  sw         $zero, %lo(cdreaddone)($at)
    /* 17418 80027418 539D000C */  jal        setasyncreadcallback
    /* 1741C 8002741C 2188A000 */   addu      $s1, $a1, $zero
    /* 17420 80027420 21200002 */  addu       $a0, $s0, $zero
    /* 17424 80027424 B29E000C */  jal        psxcdromasyncread
    /* 17428 80027428 21282002 */   addu      $a1, $s1, $zero
  .L8002742C:
    /* 1742C 8002742C 1280023C */  lui        $v0, %hi(cdreaddone)
    /* 17430 80027430 98C5428C */  lw         $v0, %lo(cdreaddone)($v0)
    /* 17434 80027434 00000000 */  nop
    /* 17438 80027438 FCFF4010 */  beqz       $v0, .L8002742C
    /* 1743C 8002743C 00000000 */   nop
    /* 17440 80027440 539D000C */  jal        setasyncreadcallback
    /* 17444 80027444 21204002 */   addu      $a0, $s2, $zero
    /* 17448 80027448 741C828F */  lw         $v0, %gp_rel(asynctimerflag)($gp)
    /* 1744C 8002744C 00000000 */  nop
    /* 17450 80027450 06004010 */  beqz       $v0, .L8002746C
    /* 17454 80027454 00000000 */   nop
    /* 17458 80027458 0280043C */  lui        $a0, %hi(asynctimer)
    /* 1745C 8002745C 70768424 */  addiu      $a0, $a0, %lo(asynctimer)
    /* 17460 80027460 1ABF000C */  jal        deltimer
    /* 17464 80027464 00000000 */   nop
    /* 17468 80027468 741C80AF */  sw         $zero, %gp_rel(asynctimerflag)($gp)
  .L8002746C:
    /* 1746C 8002746C 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 17470 80027470 1800B28F */  lw         $s2, 0x18($sp)
    /* 17474 80027474 1400B18F */  lw         $s1, 0x14($sp)
    /* 17478 80027478 1000B08F */  lw         $s0, 0x10($sp)
    /* 1747C 8002747C 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 17480 80027480 0800E003 */  jr         $ra
    /* 17484 80027484 00000000 */   nop
endlabel psxcdromread
