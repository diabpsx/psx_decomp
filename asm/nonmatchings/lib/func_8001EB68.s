.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching func_8001EB68, 0x3C

glabel func_8001EB68
    /* EB68 8001EB68 0000A4AF */  sw         $a0, 0x0($sp)
    /* EB6C 8001EB6C 0000A28F */  lw         $v0, 0x0($sp)
    /* EB70 8001EB70 0000AE8F */  lw         $t6, 0x0($sp)
    /* EB74 8001EB74 00000000 */  nop
    /* EB78 8001EB78 FFFFCF25 */  addiu      $t7, $t6, -0x1
    /* EB7C 8001EB7C 07004010 */  beqz       $v0, .L8001EB9C
    /* EB80 8001EB80 0000AFAF */   sw        $t7, 0x0($sp)
  .L8001EB84:
    /* EB84 8001EB84 0000A28F */  lw         $v0, 0x0($sp)
    /* EB88 8001EB88 0000B88F */  lw         $t8, 0x0($sp)
    /* EB8C 8001EB8C 00000000 */  nop
    /* EB90 8001EB90 FFFF1927 */  addiu      $t9, $t8, -0x1
    /* EB94 8001EB94 FBFF4014 */  bnez       $v0, .L8001EB84
    /* EB98 8001EB98 0000B9AF */   sw        $t9, 0x0($sp)
  .L8001EB9C:
    /* EB9C 8001EB9C 0800E003 */  jr         $ra
    /* EBA0 8001EBA0 00000000 */   nop
endlabel func_8001EB68
