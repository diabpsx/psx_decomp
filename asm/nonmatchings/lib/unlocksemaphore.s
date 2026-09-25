.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching unlocksemaphore, 0x8

glabel unlocksemaphore
    /* 1F7CC 8002F7CC 0800E003 */  jr         $ra
    /* 1F7D0 8002F7D0 000080AC */   sw        $zero, 0x0($a0)
endlabel unlocksemaphore
