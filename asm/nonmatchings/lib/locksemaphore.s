.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching locksemaphore, 0xC

glabel locksemaphore
    /* 1F7A0 8002F7A0 01000224 */  addiu      $v0, $zero, 0x1
    /* 1F7A4 8002F7A4 0800E003 */  jr         $ra
    /* 1F7A8 8002F7A8 000082AC */   sw        $v0, 0x0($a0)
endlabel locksemaphore
