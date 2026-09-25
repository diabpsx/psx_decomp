.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ClearMVars__Fi, 0x7C

glabel ClearMVars__Fi
    /* 6F7D0 8007F7D0 40100400 */  sll        $v0, $a0, 1
    /* 6F7D4 8007F7D4 21104400 */  addu       $v0, $v0, $a0
    /* 6F7D8 8007F7D8 80100200 */  sll        $v0, $v0, 2
    /* 6F7DC 8007F7DC 21104400 */  addu       $v0, $v0, $a0
    /* 6F7E0 8007F7E0 C0100200 */  sll        $v0, $v0, 3
    /* 6F7E4 8007F7E4 1080013C */  lui        $at, %hi(monster + 0x18)
    /* 6F7E8 8007F7E8 21082200 */  addu       $at, $at, $v0
    /* 6F7EC 8007F7EC AC5320A4 */  sh         $zero, %lo(monster + 0x18)($at)
    /* 6F7F0 8007F7F0 1080013C */  lui        $at, %hi(monster + 0x1A)
    /* 6F7F4 8007F7F4 21082200 */  addu       $at, $at, $v0
    /* 6F7F8 8007F7F8 AE5320A4 */  sh         $zero, %lo(monster + 0x1A)($at)
    /* 6F7FC 8007F7FC 1080013C */  lui        $at, %hi(monster + 0x1C)
    /* 6F800 8007F800 21082200 */  addu       $at, $at, $v0
    /* 6F804 8007F804 B05320A4 */  sh         $zero, %lo(monster + 0x1C)($at)
    /* 6F808 8007F808 1080013C */  lui        $at, %hi(monster + 0x1E)
    /* 6F80C 8007F80C 21082200 */  addu       $at, $at, $v0
    /* 6F810 8007F810 B25320A4 */  sh         $zero, %lo(monster + 0x1E)($at)
    /* 6F814 8007F814 1080013C */  lui        $at, %hi(monster + 0x20)
    /* 6F818 8007F818 21082200 */  addu       $at, $at, $v0
    /* 6F81C 8007F81C B45320A4 */  sh         $zero, %lo(monster + 0x20)($at)
    /* 6F820 8007F820 1080013C */  lui        $at, %hi(monster + 0x22)
    /* 6F824 8007F824 21082200 */  addu       $at, $at, $v0
    /* 6F828 8007F828 B65320A4 */  sh         $zero, %lo(monster + 0x22)($at)
    /* 6F82C 8007F82C 1080013C */  lui        $at, %hi(monster + 0x24)
    /* 6F830 8007F830 21082200 */  addu       $at, $at, $v0
    /* 6F834 8007F834 B85320A4 */  sh         $zero, %lo(monster + 0x24)($at)
    /* 6F838 8007F838 1080013C */  lui        $at, %hi(monster + 0x26)
    /* 6F83C 8007F83C 21082200 */  addu       $at, $at, $v0
    /* 6F840 8007F840 BA5320A4 */  sh         $zero, %lo(monster + 0x26)($at)
    /* 6F844 8007F844 0800E003 */  jr         $ra
    /* 6F848 8007F848 00000000 */   nop
endlabel ClearMVars__Fi
