.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

/* Handwritten function */
nonmatching bzero, 0x18

glabel bzero
    /* FD7C 8001FD7C A0000A24 */  addiu      $t2, $zero, 0xA0
    /* FD80 8001FD80 08004001 */  jr         $t2
    /* FD84 8001FD84 28000924 */   addiu     $t1, $zero, 0x28
    /* FD88 8001FD88 00000000 */  nop
    /* FD8C 8001FD8C 50730919 */  .word      0x19097350                    # blez       $t0, .L8003CAD0 # 00090000 <InstrIdType: CPU_NORMAL>
    /* FD90 8001FD90 B3624100 */   tltu      $v0, $at, 394 /* handwritten instruction */
endlabel bzero
