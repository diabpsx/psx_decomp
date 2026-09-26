.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching InitL3Dungeon__Fv, 0x84

glabel InitL3Dungeon__Fv
    /* F3A0 80148F98 21280000 */  addu       $a1, $zero, $zero
    /* F3A4 80148F9C 0E80073C */  lui        $a3, %hi(dungeon)
    /* F3A8 80148FA0 C440E724 */  addiu      $a3, $a3, %lo(dungeon)
    /* F3AC 80148FA4 21200000 */  addu       $a0, $zero, $zero
  .L80148FA8:
    /* F3B0 80148FA8 40300500 */  sll        $a2, $a1, 1
    /* F3B4 80148FAC 2118E000 */  addu       $v1, $a3, $zero
  .L80148FB0:
    /* F3B8 80148FB0 2110C300 */  addu       $v0, $a2, $v1
    /* F3BC 80148FB4 000040A4 */  sh         $zero, 0x0($v0)
    /* F3C0 80148FB8 01008424 */  addiu      $a0, $a0, 0x1
    /* F3C4 80148FBC 30008228 */  slti       $v0, $a0, 0x30
    /* F3C8 80148FC0 FBFF4014 */  bnez       $v0, .L80148FB0
    /* F3CC 80148FC4 60006324 */   addiu     $v1, $v1, 0x60
    /* F3D0 80148FC8 0100A524 */  addiu      $a1, $a1, 0x1
    /* F3D4 80148FCC 3000A228 */  slti       $v0, $a1, 0x30
    /* F3D8 80148FD0 F5FF4014 */  bnez       $v0, .L80148FA8
    /* F3DC 80148FD4 21200000 */   addu      $a0, $zero, $zero
    /* F3E0 80148FD8 21280000 */  addu       $a1, $zero, $zero
    /* F3E4 80148FDC 21300000 */  addu       $a2, $zero, $zero
  .L80148FE0:
    /* F3E8 80148FE0 21200000 */  addu       $a0, $zero, $zero
  .L80148FE4:
    /* F3EC 80148FE4 2110C400 */  addu       $v0, $a2, $a0
    /* F3F0 80148FE8 1280033C */  lui        $v1, %hi(mydflags)
    /* F3F4 80148FEC D8C0638C */  lw         $v1, %lo(mydflags)($v1)
    /* F3F8 80148FF0 01008424 */  addiu      $a0, $a0, 0x1
    /* F3FC 80148FF4 21186200 */  addu       $v1, $v1, $v0
    /* F400 80148FF8 28008228 */  slti       $v0, $a0, 0x28
    /* F404 80148FFC F9FF4014 */  bnez       $v0, .L80148FE4
    /* F408 80149000 000060A0 */   sb        $zero, 0x0($v1)
    /* F40C 80149004 0100A524 */  addiu      $a1, $a1, 0x1
    /* F410 80149008 2800A228 */  slti       $v0, $a1, 0x28
    /* F414 8014900C F4FF4014 */  bnez       $v0, .L80148FE0
    /* F418 80149010 2800C624 */   addiu     $a2, $a2, 0x28
    /* F41C 80149014 0800E003 */  jr         $ra
    /* F420 80149018 00000000 */   nop
endlabel InitL3Dungeon__Fv
