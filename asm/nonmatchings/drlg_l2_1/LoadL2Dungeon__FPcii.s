.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching LoadL2Dungeon__FPcii, 0x21C

glabel LoadL2Dungeon__FPcii
    /* E544 8014813C D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* E548 80148140 2000B0AF */  sw         $s0, 0x20($sp)
    /* E54C 80148144 21808000 */  addu       $s0, $a0, $zero
    /* E550 80148148 2400B1AF */  sw         $s1, 0x24($sp)
    /* E554 8014814C 2188A000 */  addu       $s1, $a1, $zero
    /* E558 80148150 2800B2AF */  sw         $s2, 0x28($sp)
    /* E55C 80148154 2C00BFAF */  sw         $ra, 0x2C($sp)
    /* E560 80148158 910F050C */  jal        InitDungeon__Fv
    /* E564 8014815C 2190C000 */   addu      $s2, $a2, $zero
    /* E568 80148160 1C68050C */  jal        DRLG_InitTrans__Fv
    /* E56C 80148164 00000000 */   nop
    /* E570 80148168 21200002 */  addu       $a0, $s0, $zero
    /* E574 8014816C A7D3010C */  jal        GRL_LoadFileInMemSig__FPCcPUl
    /* E578 80148170 21280000 */   addu      $a1, $zero, $zero
    /* E57C 80148174 21804000 */  addu       $s0, $v0, $zero
    /* E580 80148178 21400002 */  addu       $t0, $s0, $zero
    /* E584 8014817C 21300000 */  addu       $a2, $zero, $zero
    /* E588 80148180 0E80093C */  lui        $t1, %hi(dungeon)
    /* E58C 80148184 C4402925 */  addiu      $t1, $t1, %lo(dungeon)
    /* E590 80148188 0C000724 */  addiu      $a3, $zero, 0xC
    /* E594 8014818C 21200000 */  addu       $a0, $zero, $zero
  .L80148190:
    /* E598 80148190 40280600 */  sll        $a1, $a2, 1
    /* E59C 80148194 21182001 */  addu       $v1, $t1, $zero
  .L80148198:
    /* E5A0 80148198 2110A300 */  addu       $v0, $a1, $v1
    /* E5A4 8014819C 000047A4 */  sh         $a3, 0x0($v0)
    /* E5A8 801481A0 01008424 */  addiu      $a0, $a0, 0x1
    /* E5AC 801481A4 28008228 */  slti       $v0, $a0, 0x28
    /* E5B0 801481A8 FBFF4014 */  bnez       $v0, .L80148198
    /* E5B4 801481AC 60006324 */   addiu     $v1, $v1, 0x60
    /* E5B8 801481B0 0100C624 */  addiu      $a2, $a2, 0x1
    /* E5BC 801481B4 2800C228 */  slti       $v0, $a2, 0x28
    /* E5C0 801481B8 F5FF4014 */  bnez       $v0, .L80148190
    /* E5C4 801481BC 21200000 */   addu      $a0, $zero, $zero
    /* E5C8 801481C0 21300000 */  addu       $a2, $zero, $zero
    /* E5CC 801481C4 21380000 */  addu       $a3, $zero, $zero
  .L801481C8:
    /* E5D0 801481C8 21200000 */  addu       $a0, $zero, $zero
    /* E5D4 801481CC 2128E000 */  addu       $a1, $a3, $zero
  .L801481D0:
    /* E5D8 801481D0 2110A400 */  addu       $v0, $a1, $a0
    /* E5DC 801481D4 1280033C */  lui        $v1, %hi(mydflags)
    /* E5E0 801481D8 D8C0638C */  lw         $v1, %lo(mydflags)($v1)
    /* E5E4 801481DC 01008424 */  addiu      $a0, $a0, 0x1
    /* E5E8 801481E0 21186200 */  addu       $v1, $v1, $v0
    /* E5EC 801481E4 28008228 */  slti       $v0, $a0, 0x28
    /* E5F0 801481E8 F9FF4014 */  bnez       $v0, .L801481D0
    /* E5F4 801481EC 000060A0 */   sb        $zero, 0x0($v1)
    /* E5F8 801481F0 0100C624 */  addiu      $a2, $a2, 0x1
    /* E5FC 801481F4 2800C228 */  slti       $v0, $a2, 0x28
    /* E600 801481F8 F3FF4014 */  bnez       $v0, .L801481C8
    /* E604 801481FC 2800E724 */   addiu     $a3, $a3, 0x28
    /* E608 80148200 00000B91 */  lbu        $t3, 0x0($t0)
    /* E60C 80148204 21300000 */  addu       $a2, $zero, $zero
    /* E610 80148208 02000825 */  addiu      $t0, $t0, 0x2
    /* E614 8014820C 00000C91 */  lbu        $t4, 0x0($t0)
    /* E618 80148210 00000000 */  nop
    /* E61C 80148214 23008011 */  beqz       $t4, .L801482A4
    /* E620 80148218 02000825 */   addiu     $t0, $t0, 0x2
    /* E624 8014821C 0E800E3C */  lui        $t6, %hi(dungeon)
    /* E628 80148220 C440CE25 */  addiu      $t6, $t6, %lo(dungeon)
    /* E62C 80148224 03000D24 */  addiu      $t5, $zero, 0x3
    /* E630 80148228 21500000 */  addu       $t2, $zero, $zero
  .L8014822C:
    /* E634 8014822C 18006011 */  beqz       $t3, .L80148290
    /* E638 80148230 21200000 */   addu      $a0, $zero, $zero
    /* E63C 80148234 40380600 */  sll        $a3, $a2, 1
    /* E640 80148238 21484001 */  addu       $t1, $t2, $zero
    /* E644 8014823C 2128C001 */  addu       $a1, $t6, $zero
  .L80148240:
    /* E648 80148240 00000391 */  lbu        $v1, 0x0($t0)
    /* E64C 80148244 00000000 */  nop
    /* E650 80148248 0B006010 */  beqz       $v1, .L80148278
    /* E654 8014824C 2110E500 */   addu      $v0, $a3, $a1
    /* E658 80148250 000043A4 */  sh         $v1, 0x0($v0)
    /* E65C 80148254 1280033C */  lui        $v1, %hi(mydflags)
    /* E660 80148258 D8C0638C */  lw         $v1, %lo(mydflags)($v1)
    /* E664 8014825C 21102401 */  addu       $v0, $t1, $a0
    /* E668 80148260 21186200 */  addu       $v1, $v1, $v0
    /* E66C 80148264 00006290 */  lbu        $v0, 0x0($v1)
    /* E670 80148268 00000000 */  nop
    /* E674 8014826C 80004234 */  ori        $v0, $v0, 0x80
    /* E678 80148270 9F200508 */  j          .L8014827C
    /* E67C 80148274 000062A0 */   sb        $v0, 0x0($v1)
  .L80148278:
    /* E680 80148278 00004DA4 */  sh         $t5, 0x0($v0)
  .L8014827C:
    /* E684 8014827C 02000825 */  addiu      $t0, $t0, 0x2
    /* E688 80148280 01008424 */  addiu      $a0, $a0, 0x1
    /* E68C 80148284 2A108B00 */  slt        $v0, $a0, $t3
    /* E690 80148288 EDFF4014 */  bnez       $v0, .L80148240
    /* E694 8014828C 6000A524 */   addiu     $a1, $a1, 0x60
  .L80148290:
    /* E698 80148290 0100C624 */  addiu      $a2, $a2, 0x1
    /* E69C 80148294 2A10CC00 */  slt        $v0, $a2, $t4
    /* E6A0 80148298 E4FF4014 */  bnez       $v0, .L8014822C
    /* E6A4 8014829C 28004A25 */   addiu     $t2, $t2, 0x28
    /* E6A8 801482A0 21300000 */  addu       $a2, $zero, $zero
  .L801482A4:
    /* E6AC 801482A4 0E80093C */  lui        $t1, %hi(dungeon)
    /* E6B0 801482A8 C4402925 */  addiu      $t1, $t1, %lo(dungeon)
    /* E6B4 801482AC 0C000824 */  addiu      $t0, $zero, 0xC
  .L801482B0:
    /* E6B8 801482B0 21200000 */  addu       $a0, $zero, $zero
    /* E6BC 801482B4 40380600 */  sll        $a3, $a2, 1
    /* E6C0 801482B8 21282001 */  addu       $a1, $t1, $zero
  .L801482BC:
    /* E6C4 801482BC 2118E500 */  addu       $v1, $a3, $a1
    /* E6C8 801482C0 00006294 */  lhu        $v0, 0x0($v1)
    /* E6CC 801482C4 00000000 */  nop
    /* E6D0 801482C8 02004014 */  bnez       $v0, .L801482D4
    /* E6D4 801482CC 00000000 */   nop
    /* E6D8 801482D0 000068A4 */  sh         $t0, 0x0($v1)
  .L801482D4:
    /* E6DC 801482D4 01008424 */  addiu      $a0, $a0, 0x1
    /* E6E0 801482D8 28008228 */  slti       $v0, $a0, 0x28
    /* E6E4 801482DC F7FF4014 */  bnez       $v0, .L801482BC
    /* E6E8 801482E0 6000A524 */   addiu     $a1, $a1, 0x60
    /* E6EC 801482E4 0100C624 */  addiu      $a2, $a2, 0x1
    /* E6F0 801482E8 2800C228 */  slti       $v0, $a2, 0x28
    /* E6F4 801482EC F0FF4014 */  bnez       $v0, .L801482B0
    /* E6F8 801482F0 00000000 */   nop
    /* E6FC 801482F4 7C19050C */  jal        DRLG_L2Pass3__Fv
    /* E700 801482F8 00000000 */   nop
    /* E704 801482FC ABF3040C */  jal        DRLG_Init_Globals__Fv
    /* E708 80148300 00000000 */   nop
    /* E70C 80148304 21200002 */  addu       $a0, $s0, $zero
    /* E710 80148308 21280000 */  addu       $a1, $zero, $zero
    /* E714 8014830C 1280013C */  lui        $at, %hi(ViewX)
    /* E718 80148310 14C131AC */  sw         $s1, %lo(ViewX)($at)
    /* E71C 80148314 1280013C */  lui        $at, %hi(ViewY)
    /* E720 80148318 18C132AC */  sw         $s2, %lo(ViewY)($at)
    /* E724 8014831C 2883050C */  jal        SetMapMonsters__FPUcii
    /* E728 80148320 21300000 */   addu      $a2, $zero, $zero
    /* E72C 80148324 21200002 */  addu       $a0, $s0, $zero
    /* E730 80148328 21280000 */  addu       $a1, $zero, $zero
    /* E734 8014832C A25E050C */  jal        SetMapObjects__FPUcii
    /* E738 80148330 21300000 */   addu      $a2, $zero, $zero
    /* E73C 80148334 F7F6000C */  jal        mem_free_dbg__FPv
    /* E740 80148338 21200002 */   addu      $a0, $s0, $zero
    /* E744 8014833C 2C00BF8F */  lw         $ra, 0x2C($sp)
    /* E748 80148340 2800B28F */  lw         $s2, 0x28($sp)
    /* E74C 80148344 2400B18F */  lw         $s1, 0x24($sp)
    /* E750 80148348 2000B08F */  lw         $s0, 0x20($sp)
    /* E754 8014834C 3000BD27 */  addiu      $sp, $sp, 0x30
    /* E758 80148350 0800E003 */  jr         $ra
    /* E75C 80148354 00000000 */   nop
endlabel LoadL2Dungeon__FPcii
