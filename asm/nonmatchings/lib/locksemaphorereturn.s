.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching locksemaphorereturn, 0x20

glabel locksemaphorereturn
    /* 1F7AC 8002F7AC 0000828C */  lw         $v0, 0x0($a0)
    /* 1F7B0 8002F7B0 00000000 */  nop
    /* 1F7B4 8002F7B4 03004014 */  bnez       $v0, .L8002F7C4
    /* 1F7B8 8002F7B8 21100000 */   addu      $v0, $zero, $zero
    /* 1F7BC 8002F7BC 01000224 */  addiu      $v0, $zero, 0x1
    /* 1F7C0 8002F7C0 000082AC */  sw         $v0, 0x0($a0)
  .L8002F7C4:
    /* 1F7C4 8002F7C4 0800E003 */  jr         $ra
    /* 1F7C8 8002F7C8 00000000 */   nop
endlabel locksemaphorereturn
