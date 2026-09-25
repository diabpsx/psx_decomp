.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

/* Handwritten function */
nonmatching Ldv3Vec, 0x8C

glabel Ldv3Vec
    /* 164 80010164 0000ED8C */  lw         $t5, 0x0($a3)
    /* 168 80010168 0400EE8C */  lw         $t6, 0x4($a3)
    /* 16C 8001016C 0800EF8C */  lw         $t7, 0x8($a3)
    /* 170 80010170 0000888C */  lw         $t0, 0x0($a0)
    /* 174 80010174 0400898C */  lw         $t1, 0x4($a0)
    /* 178 80010178 08008A8C */  lw         $t2, 0x8($a0)
    /* 17C 8001017C 23400D01 */  subu       $t0, $t0, $t5
    /* 180 80010180 23482E01 */  subu       $t1, $t1, $t6
    /* 184 80010184 23504F01 */  subu       $t2, $t2, $t7
    /* 188 80010188 004C0900 */  sll        $t1, $t1, 16
    /* 18C 8001018C 25402801 */  or         $t0, $t1, $t0
    /* 190 80010190 00008848 */  mtc2       $t0, $0 /* handwritten instruction */
    /* 194 80010194 00088A48 */  mtc2       $t2, $1 /* handwritten instruction */
    /* 198 80010198 0000A88C */  lw         $t0, 0x0($a1)
    /* 19C 8001019C 0400A98C */  lw         $t1, 0x4($a1)
    /* 1A0 800101A0 0800AA8C */  lw         $t2, 0x8($a1)
    /* 1A4 800101A4 23400D01 */  subu       $t0, $t0, $t5
    /* 1A8 800101A8 23482E01 */  subu       $t1, $t1, $t6
    /* 1AC 800101AC 23504F01 */  subu       $t2, $t2, $t7
    /* 1B0 800101B0 004C0900 */  sll        $t1, $t1, 16
    /* 1B4 800101B4 25402801 */  or         $t0, $t1, $t0
    /* 1B8 800101B8 00108848 */  mtc2       $t0, $2 /* handwritten instruction */
    /* 1BC 800101BC 00188A48 */  mtc2       $t2, $3 /* handwritten instruction */
    /* 1C0 800101C0 0000C88C */  lw         $t0, 0x0($a2)
    /* 1C4 800101C4 0400C98C */  lw         $t1, 0x4($a2)
    /* 1C8 800101C8 0800CA8C */  lw         $t2, 0x8($a2)
    /* 1CC 800101CC 23400D01 */  subu       $t0, $t0, $t5
    /* 1D0 800101D0 23482E01 */  subu       $t1, $t1, $t6
    /* 1D4 800101D4 23504F01 */  subu       $t2, $t2, $t7
    /* 1D8 800101D8 004C0900 */  sll        $t1, $t1, 16
    /* 1DC 800101DC 25402801 */  or         $t0, $t1, $t0
    /* 1E0 800101E0 00208848 */  mtc2       $t0, $4 /* handwritten instruction */
    /* 1E4 800101E4 00288A48 */  mtc2       $t2, $5 /* handwritten instruction */
    /* 1E8 800101E8 0800E003 */  jr         $ra
    /* 1EC 800101EC 00000000 */   nop
endlabel Ldv3Vec
