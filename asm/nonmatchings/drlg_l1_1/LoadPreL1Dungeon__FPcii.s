.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching LoadPreL1Dungeon__FPcii, 0x1C0

glabel LoadPreL1Dungeon__FPcii
    /* 3540 8013D138 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 3544 8013D13C 10000224 */  addiu      $v0, $zero, 0x10
    /* 3548 8013D140 1280013C */  lui        $at, %hi(dminx)
    /* 354C 8013D144 F8C022AC */  sw         $v0, %lo(dminx)($at)
    /* 3550 8013D148 1280013C */  lui        $at, %hi(dminy)
    /* 3554 8013D14C FCC022AC */  sw         $v0, %lo(dminy)($at)
    /* 3558 8013D150 50000224 */  addiu      $v0, $zero, 0x50
    /* 355C 8013D154 2400BFAF */  sw         $ra, 0x24($sp)
    /* 3560 8013D158 2000B0AF */  sw         $s0, 0x20($sp)
    /* 3564 8013D15C 1280013C */  lui        $at, %hi(dmaxx)
    /* 3568 8013D160 00C122AC */  sw         $v0, %lo(dmaxx)($at)
    /* 356C 8013D164 1280013C */  lui        $at, %hi(dmaxy)
    /* 3570 8013D168 04C122AC */  sw         $v0, %lo(dmaxy)($at)
    /* 3574 8013D16C A7D3010C */  jal        GRL_LoadFileInMemSig__FPCcPUl
    /* 3578 8013D170 21280000 */   addu      $a1, $zero, $zero
    /* 357C 8013D174 21804000 */  addu       $s0, $v0, $zero
    /* 3580 8013D178 21400002 */  addu       $t0, $s0, $zero
    /* 3584 8013D17C 21380000 */  addu       $a3, $zero, $zero
    /* 3588 8013D180 0E800D3C */  lui        $t5, %hi(dungeon)
    /* 358C 8013D184 C440AD25 */  addiu      $t5, $t5, %lo(dungeon)
    /* 3590 8013D188 16000C24 */  addiu      $t4, $zero, 0x16
    /* 3594 8013D18C 21580000 */  addu       $t3, $zero, $zero
  .L8013D190:
    /* 3598 8013D190 21280000 */  addu       $a1, $zero, $zero
    /* 359C 8013D194 40500700 */  sll        $t2, $a3, 1
    /* 35A0 8013D198 21486001 */  addu       $t1, $t3, $zero
    /* 35A4 8013D19C 2130A001 */  addu       $a2, $t5, $zero
  .L8013D1A0:
    /* 35A8 8013D1A0 21204601 */  addu       $a0, $t2, $a2
    /* 35AC 8013D1A4 21182501 */  addu       $v1, $t1, $a1
    /* 35B0 8013D1A8 1280023C */  lui        $v0, %hi(mydflags)
    /* 35B4 8013D1AC D8C0428C */  lw         $v0, %lo(mydflags)($v0)
    /* 35B8 8013D1B0 0100A524 */  addiu      $a1, $a1, 0x1
    /* 35BC 8013D1B4 00008CA4 */  sh         $t4, 0x0($a0)
    /* 35C0 8013D1B8 21104300 */  addu       $v0, $v0, $v1
    /* 35C4 8013D1BC 000040A0 */  sb         $zero, 0x0($v0)
    /* 35C8 8013D1C0 2800A228 */  slti       $v0, $a1, 0x28
    /* 35CC 8013D1C4 F6FF4014 */  bnez       $v0, .L8013D1A0
    /* 35D0 8013D1C8 6000C624 */   addiu     $a2, $a2, 0x60
    /* 35D4 8013D1CC 0100E724 */  addiu      $a3, $a3, 0x1
    /* 35D8 8013D1D0 2800E228 */  slti       $v0, $a3, 0x28
    /* 35DC 8013D1D4 EEFF4014 */  bnez       $v0, .L8013D190
    /* 35E0 8013D1D8 28006B25 */   addiu     $t3, $t3, 0x28
    /* 35E4 8013D1DC 00000B91 */  lbu        $t3, 0x0($t0)
    /* 35E8 8013D1E0 21380000 */  addu       $a3, $zero, $zero
    /* 35EC 8013D1E4 02000825 */  addiu      $t0, $t0, 0x2
    /* 35F0 8013D1E8 00000C91 */  lbu        $t4, 0x0($t0)
    /* 35F4 8013D1EC 00000000 */  nop
    /* 35F8 8013D1F0 22008011 */  beqz       $t4, .L8013D27C
    /* 35FC 8013D1F4 02000825 */   addiu     $t0, $t0, 0x2
    /* 3600 8013D1F8 0E800E3C */  lui        $t6, %hi(dungeon)
    /* 3604 8013D1FC C440CE25 */  addiu      $t6, $t6, %lo(dungeon)
    /* 3608 8013D200 0D000D24 */  addiu      $t5, $zero, 0xD
    /* 360C 8013D204 21500000 */  addu       $t2, $zero, $zero
  .L8013D208:
    /* 3610 8013D208 18006011 */  beqz       $t3, .L8013D26C
    /* 3614 8013D20C 21280000 */   addu      $a1, $zero, $zero
    /* 3618 8013D210 40300700 */  sll        $a2, $a3, 1
    /* 361C 8013D214 21484001 */  addu       $t1, $t2, $zero
    /* 3620 8013D218 2120C001 */  addu       $a0, $t6, $zero
  .L8013D21C:
    /* 3624 8013D21C 00000391 */  lbu        $v1, 0x0($t0)
    /* 3628 8013D220 00000000 */  nop
    /* 362C 8013D224 0B006010 */  beqz       $v1, .L8013D254
    /* 3630 8013D228 2110C400 */   addu      $v0, $a2, $a0
    /* 3634 8013D22C 000043A4 */  sh         $v1, 0x0($v0)
    /* 3638 8013D230 1280033C */  lui        $v1, %hi(mydflags)
    /* 363C 8013D234 D8C0638C */  lw         $v1, %lo(mydflags)($v1)
    /* 3640 8013D238 21102501 */  addu       $v0, $t1, $a1
    /* 3644 8013D23C 21186200 */  addu       $v1, $v1, $v0
    /* 3648 8013D240 00006290 */  lbu        $v0, 0x0($v1)
    /* 364C 8013D244 00000000 */  nop
    /* 3650 8013D248 80004234 */  ori        $v0, $v0, 0x80
    /* 3654 8013D24C 96F40408 */  j          .L8013D258
    /* 3658 8013D250 000062A0 */   sb        $v0, 0x0($v1)
  .L8013D254:
    /* 365C 8013D254 00004DA4 */  sh         $t5, 0x0($v0)
  .L8013D258:
    /* 3660 8013D258 02000825 */  addiu      $t0, $t0, 0x2
    /* 3664 8013D25C 0100A524 */  addiu      $a1, $a1, 0x1
    /* 3668 8013D260 2A10AB00 */  slt        $v0, $a1, $t3
    /* 366C 8013D264 EDFF4014 */  bnez       $v0, .L8013D21C
    /* 3670 8013D268 60008424 */   addiu     $a0, $a0, 0x60
  .L8013D26C:
    /* 3674 8013D26C 0100E724 */  addiu      $a3, $a3, 0x1
    /* 3678 8013D270 2A10EC00 */  slt        $v0, $a3, $t4
    /* 367C 8013D274 E4FF4014 */  bnez       $v0, .L8013D208
    /* 3680 8013D278 28004A25 */   addiu     $t2, $t2, 0x28
  .L8013D27C:
    /* 3684 8013D27C B1F2040C */  jal        DRLG_L1Floor__Fv
    /* 3688 8013D280 00000000 */   nop
    /* 368C 8013D284 21380000 */  addu       $a3, $zero, $zero
    /* 3690 8013D288 0E800A3C */  lui        $t2, %hi(pdungeon)
    /* 3694 8013D28C C4524A25 */  addiu      $t2, $t2, %lo(pdungeon)
    /* 3698 8013D290 0E80093C */  lui        $t1, %hi(dungeon)
    /* 369C 8013D294 C4402925 */  addiu      $t1, $t1, %lo(dungeon)
    /* 36A0 8013D298 21280000 */  addu       $a1, $zero, $zero
  .L8013D29C:
    /* 36A4 8013D29C 40400700 */  sll        $t0, $a3, 1
    /* 36A8 8013D2A0 21302001 */  addu       $a2, $t1, $zero
    /* 36AC 8013D2A4 21204001 */  addu       $a0, $t2, $zero
  .L8013D2A8:
    /* 36B0 8013D2A8 21100601 */  addu       $v0, $t0, $a2
    /* 36B4 8013D2AC 6000C624 */  addiu      $a2, $a2, 0x60
    /* 36B8 8013D2B0 21188700 */  addu       $v1, $a0, $a3
    /* 36BC 8013D2B4 00004294 */  lhu        $v0, 0x0($v0)
    /* 36C0 8013D2B8 0100A524 */  addiu      $a1, $a1, 0x1
    /* 36C4 8013D2BC 000062A0 */  sb         $v0, 0x0($v1)
    /* 36C8 8013D2C0 2800A228 */  slti       $v0, $a1, 0x28
    /* 36CC 8013D2C4 F8FF4014 */  bnez       $v0, .L8013D2A8
    /* 36D0 8013D2C8 28008424 */   addiu     $a0, $a0, 0x28
    /* 36D4 8013D2CC 0100E724 */  addiu      $a3, $a3, 0x1
    /* 36D8 8013D2D0 2800E228 */  slti       $v0, $a3, 0x28
    /* 36DC 8013D2D4 F1FF4014 */  bnez       $v0, .L8013D29C
    /* 36E0 8013D2D8 21280000 */   addu      $a1, $zero, $zero
    /* 36E4 8013D2DC F7F6000C */  jal        mem_free_dbg__FPv
    /* 36E8 8013D2E0 21200002 */   addu      $a0, $s0, $zero
    /* 36EC 8013D2E4 2400BF8F */  lw         $ra, 0x24($sp)
    /* 36F0 8013D2E8 2000B08F */  lw         $s0, 0x20($sp)
    /* 36F4 8013D2EC 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 36F8 8013D2F0 0800E003 */  jr         $ra
    /* 36FC 8013D2F4 00000000 */   nop
endlabel LoadPreL1Dungeon__FPcii
