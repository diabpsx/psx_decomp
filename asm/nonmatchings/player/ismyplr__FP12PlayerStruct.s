.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ismyplr__FP12PlayerStruct, 0x44

glabel ismyplr__FP12PlayerStruct
    /* 4FD9C 8005FD9C 8812838F */  lw         $v1, %gp_rel(myplr)($gp)
    /* 4FDA0 8005FDA0 00000000 */  nop
    /* 4FDA4 8005FDA4 40100300 */  sll        $v0, $v1, 1
    /* 4FDA8 8005FDA8 21104300 */  addu       $v0, $v0, $v1
    /* 4FDAC 8005FDAC 80100200 */  sll        $v0, $v0, 2
    /* 4FDB0 8005FDB0 21104300 */  addu       $v0, $v0, $v1
    /* 4FDB4 8005FDB4 00110200 */  sll        $v0, $v0, 4
    /* 4FDB8 8005FDB8 23104300 */  subu       $v0, $v0, $v1
    /* 4FDBC 8005FDBC 80100200 */  sll        $v0, $v0, 2
    /* 4FDC0 8005FDC0 21104300 */  addu       $v0, $v0, $v1
    /* 4FDC4 8005FDC4 C0100200 */  sll        $v0, $v0, 3
    /* 4FDC8 8005FDC8 0E80033C */  lui        $v1, %hi(plr)
    /* 4FDCC 8005FDCC 38A56324 */  addiu      $v1, $v1, %lo(plr)
    /* 4FDD0 8005FDD0 21104300 */  addu       $v0, $v0, $v1
    /* 4FDD4 8005FDD4 26104400 */  xor        $v0, $v0, $a0
    /* 4FDD8 8005FDD8 0800E003 */  jr         $ra
    /* 4FDDC 8005FDDC 0100422C */   sltiu     $v0, $v0, 0x1
endlabel ismyplr__FP12PlayerStruct
