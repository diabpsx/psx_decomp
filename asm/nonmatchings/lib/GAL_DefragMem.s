.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GAL_DefragMem, 0x84

glabel GAL_DefragMem
    /* 12388 80022388 1280023C */  lui        $v0, %hi(D_8011C9E8)
    /* 1238C 8002238C E8C9428C */  lw         $v0, %lo(D_8011C9E8)($v0)
    /* 12390 80022390 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 12394 80022394 1000B0AF */  sw         $s0, 0x10($sp)
    /* 12398 80022398 21808000 */  addu       $s0, $a0, $zero
    /* 1239C 8002239C 05004010 */  beqz       $v0, .L800223B4
    /* 123A0 800223A0 1400BFAF */   sw        $ra, 0x14($sp)
    /* 123A4 800223A4 1180043C */  lui        $a0, %hi(D_8010E8D4)
    /* 123A8 800223A8 D4E88424 */  addiu      $a0, $a0, %lo(D_8010E8D4)
    /* 123AC 800223AC 9B83000C */  jal        DBG_SendMessage
    /* 123B0 800223B0 00000000 */   nop
  .L800223B4:
    /* 123B4 800223B4 628A000C */  jal        GazDefragMem
    /* 123B8 800223B8 21200002 */   addu      $a0, $s0, $zero
    /* 123BC 800223BC 1280023C */  lui        $v0, %hi(D_8011C9DC)
    /* 123C0 800223C0 DCC94290 */  lbu        $v0, %lo(D_8011C9DC)($v0)
    /* 123C4 800223C4 00000000 */  nop
    /* 123C8 800223C8 06004010 */  beqz       $v0, .L800223E4
    /* 123CC 800223CC 00000000 */   nop
    /* 123D0 800223D0 1A89000C */  jal        GAL_CheckMem
    /* 123D4 800223D4 21200002 */   addu      $a0, $s0, $zero
    /* 123D8 800223D8 FF004230 */  andi       $v0, $v0, 0xFF
    /* 123DC 800223DC 06004010 */  beqz       $v0, .L800223F8
    /* 123E0 800223E0 21100000 */   addu      $v0, $zero, $zero
  .L800223E4:
    /* 123E4 800223E4 028C000C */  jal        CountFreeBlocks
    /* 123E8 800223E8 00000000 */   nop
    /* 123EC 800223EC 1280013C */  lui        $at, %hi(D_8011C9EC)
    /* 123F0 800223F0 ECC922AC */  sw         $v0, %lo(D_8011C9EC)($at)
    /* 123F4 800223F4 01000234 */  ori        $v0, $zero, 0x1
  .L800223F8:
    /* 123F8 800223F8 1400BF8F */  lw         $ra, 0x14($sp)
    /* 123FC 800223FC 1000B08F */  lw         $s0, 0x10($sp)
    /* 12400 80022400 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 12404 80022404 0800E003 */  jr         $ra
    /* 12408 80022408 00000000 */   nop
endlabel GAL_DefragMem
