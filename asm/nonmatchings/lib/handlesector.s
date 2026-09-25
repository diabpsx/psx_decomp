.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching handlesector, 0x20

glabel handlesector
    /* 15E0C 80025E0C 80100400 */  sll        $v0, $a0, 2
    /* 15E10 80025E10 21104400 */  addu       $v0, $v0, $a0
    /* 15E14 80025E14 C0100200 */  sll        $v0, $v0, 3
    /* 15E18 80025E18 0B80013C */  lui        $at, %hi(D_800B6414)
    /* 15E1C 80025E1C 21082200 */  addu       $at, $at, $v0
    /* 15E20 80025E20 1464228C */  lw         $v0, %lo(D_800B6414)($at)
    /* 15E24 80025E24 0800E003 */  jr         $ra
    /* 15E28 80025E28 00000000 */   nop
endlabel handlesector
