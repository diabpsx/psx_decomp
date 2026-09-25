.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching fputc__5blockUc, 0x28

glabel fputc__5blockUc
    /* 9E364 800AE364 0C02828C */  lw         $v0, 0x20C($a0)
    /* 9E368 800AE368 00000000 */  nop
    /* 9E36C 800AE36C 000045A0 */  sb         $a1, 0x0($v0)
    /* 9E370 800AE370 0C02828C */  lw         $v0, 0x20C($a0)
    /* 9E374 800AE374 1002838C */  lw         $v1, 0x210($a0)
    /* 9E378 800AE378 01004224 */  addiu      $v0, $v0, 0x1
    /* 9E37C 800AE37C 01006324 */  addiu      $v1, $v1, 0x1
    /* 9E380 800AE380 0C0282AC */  sw         $v0, 0x20C($a0)
    /* 9E384 800AE384 0800E003 */  jr         $ra
    /* 9E388 800AE388 100283AC */   sw        $v1, 0x210($a0)
endlabel fputc__5blockUc
