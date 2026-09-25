.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GSetError, 0x5C

glabel GSetError
    /* 1240C 8002240C 1280023C */  lui        $v0, %hi(D_8011C9E8)
    /* 12410 80022410 E8C9428C */  lw         $v0, %lo(D_8011C9E8)($v0)
    /* 12414 80022414 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 12418 80022418 1000B0AF */  sw         $s0, 0x10($sp)
    /* 1241C 8002241C 21808000 */  addu       $s0, $a0, $zero
    /* 12420 80022420 09004010 */  beqz       $v0, .L80022448
    /* 12424 80022424 1400BFAF */   sw        $ra, 0x14($sp)
    /* 12428 80022428 80101000 */  sll        $v0, $s0, 2
    /* 1242C 8002242C 0B80013C */  lui        $at, %hi(GalErrors)
    /* 12430 80022430 21082200 */  addu       $at, $at, $v0
    /* 12434 80022434 9C63258C */  lw         $a1, %lo(GalErrors)($at)
    /* 12438 80022438 1180043C */  lui        $a0, %hi(D_8010E8EC)
    /* 1243C 8002243C ECE88424 */  addiu      $a0, $a0, %lo(D_8010E8EC)
    /* 12440 80022440 9B83000C */  jal        DBG_SendMessage
    /* 12444 80022444 00000000 */   nop
  .L80022448:
    /* 12448 80022448 1280013C */  lui        $at, %hi(D_8011C9D4)
    /* 1244C 8002244C D4C930AC */  sw         $s0, %lo(D_8011C9D4)($at)
    /* 12450 80022450 21100000 */  addu       $v0, $zero, $zero
    /* 12454 80022454 1400BF8F */  lw         $ra, 0x14($sp)
    /* 12458 80022458 1000B08F */  lw         $s0, 0x10($sp)
    /* 1245C 8002245C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 12460 80022460 0800E003 */  jr         $ra
    /* 12464 80022464 00000000 */   nop
endlabel GSetError
