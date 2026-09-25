.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching func_80014D44, 0x20

glabel func_80014D44
    /* 4D44 80014D44 0200A010 */  beqz       $a1, .L80014D50
    /* 4D48 80014D48 00E1033C */   lui       $v1, (0xE1000200 >> 16)
    /* 4D4C 80014D4C 00026334 */  ori        $v1, $v1, (0xE1000200 & 0xFFFF)
  .L80014D50:
    /* 4D50 80014D50 02008010 */  beqz       $a0, .L80014D5C
    /* 4D54 80014D54 FF09C230 */   andi      $v0, $a2, 0x9FF
    /* 4D58 80014D58 00044234 */  ori        $v0, $v0, 0x400
  .L80014D5C:
    /* 4D5C 80014D5C 0800E003 */  jr         $ra
    /* 4D60 80014D60 25106200 */   or        $v0, $v1, $v0
endlabel func_80014D44
