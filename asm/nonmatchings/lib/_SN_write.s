.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching _SN_write, 0x18

glabel _SN_write
    /* 1244 80011244 8D410000 */  break      0, 262
    /* 1248 80011248 02004010 */  beqz       $v0, .L80011254
    /* 124C 8001124C 21106000 */   addu      $v0, $v1, $zero
    /* 1250 80011250 FFFF0224 */  addiu      $v0, $zero, -0x1
  .L80011254:
    /* 1254 80011254 0800E003 */  jr         $ra
    /* 1258 80011258 00000000 */   nop
endlabel _SN_write
