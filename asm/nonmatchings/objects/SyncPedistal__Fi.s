.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SyncPedistal__Fi, 0x8

glabel SyncPedistal__Fi
    /* 4F0EC 8005F0EC 0800E003 */  jr         $ra
    /* 4F0F0 8005F0F0 00000000 */   nop
endlabel SyncPedistal__Fi
