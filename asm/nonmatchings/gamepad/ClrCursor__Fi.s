.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ClrCursor__Fi, 0x5C

glabel ClrCursor__Fi
    /* 67F90 80077F90 0200822C */  sltiu      $v0, $a0, 0x2
    /* 67F94 80077F94 13004010 */  beqz       $v0, .L80077FE4
    /* 67F98 80077F98 00120400 */   sll       $v0, $a0, 8
    /* 67F9C 80077F9C 80180400 */  sll        $v1, $a0, 2
    /* 67FA0 80077FA0 0D80013C */  lui        $at, %hi(_infostr)
    /* 67FA4 80077FA4 21082200 */  addu       $at, $at, $v0
    /* 67FA8 80077FA8 10E820A0 */  sb         $zero, %lo(_infostr)($at)
    /* 67FAC 80077FAC FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 67FB0 80077FB0 1280013C */  lui        $at, %hi(_pcursmonst)
    /* 67FB4 80077FB4 21082300 */  addu       $at, $at, $v1
    /* 67FB8 80077FB8 58B722AC */  sw         $v0, %lo(_pcursmonst)($at)
    /* 67FBC 80077FBC FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 67FC0 80077FC0 1280013C */  lui        $at, %hi(_pcursobj)
    /* 67FC4 80077FC4 21082400 */  addu       $at, $at, $a0
    /* 67FC8 80077FC8 60B722A0 */  sb         $v0, %lo(_pcursobj)($at)
    /* 67FCC 80077FCC 1280013C */  lui        $at, %hi(_pcursitem)
    /* 67FD0 80077FD0 21082400 */  addu       $at, $at, $a0
    /* 67FD4 80077FD4 64B722A0 */  sb         $v0, %lo(_pcursitem)($at)
    /* 67FD8 80077FD8 1280013C */  lui        $at, %hi(_pcursinvitem)
    /* 67FDC 80077FDC 21082400 */  addu       $at, $at, $a0
    /* 67FE0 80077FE0 68B722A0 */  sb         $v0, %lo(_pcursinvitem)($at)
  .L80077FE4:
    /* 67FE4 80077FE4 0800E003 */  jr         $ra
    /* 67FE8 80077FE8 00000000 */   nop
endlabel ClrCursor__Fi
