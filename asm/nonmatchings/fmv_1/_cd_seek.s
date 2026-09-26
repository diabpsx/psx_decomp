.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching _cd_seek, 0x38

glabel _cd_seek
    /* 1C224 80155E1C D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 1C228 80155E20 2800BFAF */  sw         $ra, 0x28($sp)
    /* 1C22C 80155E24 AE6C000C */  jal        CdIntToPos
    /* 1C230 80155E28 1000A527 */   addiu     $a1, $sp, 0x10
    /* 1C234 80155E2C 15000424 */  addiu      $a0, $zero, 0x15
  .L80155E30:
    /* 1C238 80155E30 1000A527 */  addiu      $a1, $sp, 0x10
    /* 1C23C 80155E34 326C000C */  jal        CdControlB
    /* 1C240 80155E38 21300000 */   addu      $a2, $zero, $zero
    /* 1C244 80155E3C FCFF4010 */  beqz       $v0, .L80155E30
    /* 1C248 80155E40 15000424 */   addiu     $a0, $zero, 0x15
    /* 1C24C 80155E44 2800BF8F */  lw         $ra, 0x28($sp)
    /* 1C250 80155E48 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 1C254 80155E4C 0800E003 */  jr         $ra
    /* 1C258 80155E50 00000000 */   nop
endlabel _cd_seek
