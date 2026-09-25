.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ActivateSpawn__Fiiii, 0xA0

glabel ActivateSpawn__Fiiii
    /* 700E4 800800E4 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 700E8 800800E8 C0180600 */  sll        $v1, $a2, 3
    /* 700EC 800800EC C0100500 */  sll        $v0, $a1, 3
    /* 700F0 800800F0 23104500 */  subu       $v0, $v0, $a1
    /* 700F4 800800F4 C0110200 */  sll        $v0, $v0, 7
    /* 700F8 800800F8 21186200 */  addu       $v1, $v1, $v0
    /* 700FC 800800FC 01008224 */  addiu      $v0, $a0, 0x1
    /* 70100 80080100 1000BFAF */  sw         $ra, 0x10($sp)
    /* 70104 80080104 0E80013C */  lui        $at, %hi(dung_map)
    /* 70108 80080108 21082300 */  addu       $at, $at, $v1
    /* 7010C 8008010C 287A22A4 */  sh         $v0, %lo(dung_map)($at)
    /* 70110 80080110 40100400 */  sll        $v0, $a0, 1
    /* 70114 80080114 21104400 */  addu       $v0, $v0, $a0
    /* 70118 80080118 80100200 */  sll        $v0, $v0, 2
    /* 7011C 8008011C 21104400 */  addu       $v0, $v0, $a0
    /* 70120 80080120 C0100200 */  sll        $v0, $v0, 3
    /* 70124 80080124 1080013C */  lui        $at, %hi(monster + 0x34)
    /* 70128 80080128 21082200 */  addu       $at, $at, $v0
    /* 7012C 8008012C C85325A0 */  sb         $a1, %lo(monster + 0x34)($at)
    /* 70130 80080130 1080013C */  lui        $at, %hi(monster + 0x36)
    /* 70134 80080134 21082200 */  addu       $at, $at, $v0
    /* 70138 80080138 CA5325A0 */  sb         $a1, %lo(monster + 0x36)($at)
    /* 7013C 8008013C 1080013C */  lui        $at, %hi(monster + 0x38)
    /* 70140 80080140 21082200 */  addu       $at, $at, $v0
    /* 70144 80080144 CC5325A0 */  sb         $a1, %lo(monster + 0x38)($at)
    /* 70148 80080148 1080013C */  lui        $at, %hi(monster + 0x35)
    /* 7014C 8008014C 21082200 */  addu       $at, $at, $v0
    /* 70150 80080150 C95326A0 */  sb         $a2, %lo(monster + 0x35)($at)
    /* 70154 80080154 1080013C */  lui        $at, %hi(monster + 0x37)
    /* 70158 80080158 21082200 */  addu       $at, $at, $v0
    /* 7015C 8008015C CB5326A0 */  sb         $a2, %lo(monster + 0x37)($at)
    /* 70160 80080160 1080013C */  lui        $at, %hi(monster + 0x39)
    /* 70164 80080164 21082200 */  addu       $at, $at, $v0
    /* 70168 80080168 CD5326A0 */  sb         $a2, %lo(monster + 0x39)($at)
    /* 7016C 8008016C DD00020C */  jal        M_StartSpStand__Fii
    /* 70170 80080170 2128E000 */   addu      $a1, $a3, $zero
    /* 70174 80080174 1000BF8F */  lw         $ra, 0x10($sp)
    /* 70178 80080178 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 7017C 8008017C 0800E003 */  jr         $ra
    /* 70180 80080180 00000000 */   nop
endlabel ActivateSpawn__Fiiii
