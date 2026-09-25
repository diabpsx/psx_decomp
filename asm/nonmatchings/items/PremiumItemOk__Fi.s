.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PremiumItemOk__Fi, 0x7C

glabel PremiumItemOk__Fi
    /* 37D98 80047D98 40210400 */  sll        $a0, $a0, 5
    /* 37D9C 80047D9C 1180013C */  lui        $at, %hi(AllItemsList + 0x4)
    /* 37DA0 80047DA0 21082400 */  addu       $at, $at, $a0
    /* 37DA4 80047DA4 A8132480 */  lb         $a0, %lo(AllItemsList + 0x4)($at)
    /* 37DA8 80047DA8 00000000 */  nop
    /* 37DAC 80047DAC 2B100400 */  sltu       $v0, $zero, $a0
    /* 37DB0 80047DB0 21184000 */  addu       $v1, $v0, $zero
    /* 37DB4 80047DB4 0B000224 */  addiu      $v0, $zero, 0xB
    /* 37DB8 80047DB8 02008214 */  bne        $a0, $v0, .L80047DC4
    /* 37DBC 80047DBC 0E000224 */   addiu     $v0, $zero, 0xE
    /* 37DC0 80047DC0 21180000 */  addu       $v1, $zero, $zero
  .L80047DC4:
    /* 37DC4 80047DC4 02008214 */  bne        $a0, $v0, .L80047DD0
    /* 37DC8 80047DC8 0A000224 */   addiu     $v0, $zero, 0xA
    /* 37DCC 80047DCC 21180000 */  addu       $v1, $zero, $zero
  .L80047DD0:
    /* 37DD0 80047DD0 02008214 */  bne        $a0, $v0, .L80047DDC
    /* 37DD4 80047DD4 00000000 */   nop
    /* 37DD8 80047DD8 21180000 */  addu       $v1, $zero, $zero
  .L80047DDC:
    /* 37DDC 80047DDC 1280023C */  lui        $v0, %hi(FePlayerNo)
    /* 37DE0 80047DE0 78B3428C */  lw         $v0, %lo(FePlayerNo)($v0)
    /* 37DE4 80047DE4 00000000 */  nop
    /* 37DE8 80047DE8 08004010 */  beqz       $v0, .L80047E0C
    /* 37DEC 80047DEC 00000000 */   nop
    /* 37DF0 80047DF0 0C000224 */  addiu      $v0, $zero, 0xC
    /* 37DF4 80047DF4 02008214 */  bne        $a0, $v0, .L80047E00
    /* 37DF8 80047DF8 0D000224 */   addiu     $v0, $zero, 0xD
    /* 37DFC 80047DFC 21180000 */  addu       $v1, $zero, $zero
  .L80047E00:
    /* 37E00 80047E00 02008214 */  bne        $a0, $v0, .L80047E0C
    /* 37E04 80047E04 00000000 */   nop
    /* 37E08 80047E08 21180000 */  addu       $v1, $zero, $zero
  .L80047E0C:
    /* 37E0C 80047E0C 0800E003 */  jr         $ra
    /* 37E10 80047E10 21106000 */   addu      $v0, $v1, $zero
endlabel PremiumItemOk__Fi
