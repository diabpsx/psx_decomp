.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetPal__7TextDati_80098950, 0x1C

glabel GetPal__7TextDati_80098950
    /* 88950 80098950 80280500 */  sll        $a1, $a1, 2
    /* 88954 80098954 3000828C */  lw         $v0, 0x30($a0)
    /* 88958 80098958 2C00838C */  lw         $v1, 0x2C($a0)
    /* 8895C 8009895C 2128A200 */  addu       $a1, $a1, $v0
    /* 88960 80098960 0000A28C */  lw         $v0, 0x0($a1)
    /* 88964 80098964 0800E003 */  jr         $ra
    /* 88968 80098968 21106200 */   addu      $v0, $v1, $v0
endlabel GetPal__7TextDati_80098950
