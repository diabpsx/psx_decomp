.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching _SN_read, 0x18

glabel _SN_read
    /* 116C 8001116C 4D410000 */  break      0, 261
    /* 1170 80011170 02004010 */  beqz       $v0, .L8001117C
    /* 1174 80011174 21106000 */   addu      $v0, $v1, $zero
    /* 1178 80011178 FFFF0224 */  addiu      $v0, $zero, -0x1
  .L8001117C:
    /* 117C 8001117C 0800E003 */  jr         $ra
    /* 1180 80011180 00000000 */   nop
endlabel _SN_read
