.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching checkcacheblock, 0x140

glabel checkcacheblock
    /* 19FD0 80029FD0 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 19FD4 80029FD4 1800B2AF */  sw         $s2, 0x18($sp)
    /* 19FD8 80029FD8 21908000 */  addu       $s2, $a0, $zero
    /* 19FDC 80029FDC 2000BFAF */  sw         $ra, 0x20($sp)
    /* 19FE0 80029FE0 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 19FE4 80029FE4 1400B1AF */  sw         $s1, 0x14($sp)
    /* 19FE8 80029FE8 6CA7000C */  jal        findnamedpurgeableblock
    /* 19FEC 80029FEC 1000B0AF */   sw        $s0, 0x10($sp)
    /* 19FF0 80029FF0 21884000 */  addu       $s1, $v0, $zero
    /* 19FF4 80029FF4 19002012 */  beqz       $s1, .L8002A05C
    /* 19FF8 80029FF8 F7FF0324 */   addiu     $v1, $zero, -0x9
    /* 19FFC 80029FFC 1800228E */  lw         $v0, 0x18($s1)
    /* 1A000 8002A000 00000000 */  nop
    /* 1A004 8002A004 24304300 */  and        $a2, $v0, $v1
    /* 1A008 8002A008 10004230 */  andi       $v0, $v0, 0x10
    /* 1A00C 8002A00C 08004014 */  bnez       $v0, .L8002A030
    /* 1A010 8002A010 180026AE */   sw        $a2, 0x18($s1)
    /* 1A014 8002A014 1400258E */  lw         $a1, 0x14($s1)
    /* 1A018 8002A018 21204002 */  addu       $a0, $s2, $zero
    /* 1A01C 8002A01C BAA9000C */  jal        reservememblockai
    /* 1A020 8002A020 21380000 */   addu      $a3, $zero, $zero
    /* 1A024 8002A024 21804000 */  addu       $s0, $v0, $zero
    /* 1A028 8002A028 03000016 */  bnez       $s0, .L8002A038
    /* 1A02C 8002A02C 00000000 */   nop
  .L8002A030:
    /* 1A030 8002A030 3CA80008 */  j          .L8002A0F0
    /* 1A034 8002A034 21102002 */   addu      $v0, $s1, $zero
  .L8002A038:
    /* 1A038 8002A038 0000248E */  lw         $a0, 0x0($s1)
    /* 1A03C 8002A03C 0000058E */  lw         $a1, 0x0($s0)
    /* 1A040 8002A040 1400268E */  lw         $a2, 0x14($s1)
    /* 1A044 8002A044 F1B1000C */  jal        blockmove
    /* 1A048 8002A048 00000000 */   nop
    /* 1A04C 8002A04C C3AB000C */  jal        purgememblock
    /* 1A050 8002A050 21202002 */   addu      $a0, $s1, $zero
    /* 1A054 8002A054 3CA80008 */  j          .L8002A0F0
    /* 1A058 8002A058 21100002 */   addu      $v0, $s0, $zero
  .L8002A05C:
    /* 1A05C 8002A05C 1280023C */  lui        $v0, %hi(defaultmc)
    /* 1A060 8002A060 A0C4428C */  lw         $v0, %lo(defaultmc)($v0)
    /* 1A064 8002A064 1380133C */  lui        $s3, %hi(memclass)
    /* 1A068 8002A068 307A7326 */  addiu      $s3, $s3, %lo(memclass)
    /* 1A06C 8002A06C 1000508C */  lw         $s0, 0x10($v0)
    /* 1A070 8002A070 21204002 */  addu       $a0, $s2, $zero
  .L8002A074:
    /* 1A074 8002A074 41A7000C */  jal        findnamedpurgeableblockinclass
    /* 1A078 8002A078 21280002 */   addu      $a1, $s0, $zero
    /* 1A07C 8002A07C 21884000 */  addu       $s1, $v0, $zero
    /* 1A080 8002A080 0D002016 */  bnez       $s1, .L8002A0B8
    /* 1A084 8002A084 21204002 */   addu      $a0, $s2, $zero
    /* 1A088 8002A088 000F0332 */  andi       $v1, $s0, 0xF00
    /* 1A08C 8002A08C 031A0300 */  sra        $v1, $v1, 8
    /* 1A090 8002A090 40100300 */  sll        $v0, $v1, 1
    /* 1A094 8002A094 21104300 */  addu       $v0, $v0, $v1
    /* 1A098 8002A098 C0100200 */  sll        $v0, $v0, 3
    /* 1A09C 8002A09C 21105300 */  addu       $v0, $v0, $s3
    /* 1A0A0 8002A0A0 1000508C */  lw         $s0, 0x10($v0)
    /* 1A0A4 8002A0A4 00000000 */  nop
    /* 1A0A8 8002A0A8 F2FF0016 */  bnez       $s0, .L8002A074
    /* 1A0AC 8002A0AC 21100000 */   addu      $v0, $zero, $zero
    /* 1A0B0 8002A0B0 3CA80008 */  j          .L8002A0F0
    /* 1A0B4 8002A0B4 00000000 */   nop
  .L8002A0B8:
    /* 1A0B8 8002A0B8 1800268E */  lw         $a2, 0x18($s1)
    /* 1A0BC 8002A0BC 1400258E */  lw         $a1, 0x14($s1)
    /* 1A0C0 8002A0C0 21380000 */  addu       $a3, $zero, $zero
    /* 1A0C4 8002A0C4 F7FF0224 */  addiu      $v0, $zero, -0x9
    /* 1A0C8 8002A0C8 2430C200 */  and        $a2, $a2, $v0
    /* 1A0CC 8002A0CC BAA9000C */  jal        reservememblockai
    /* 1A0D0 8002A0D0 180026AE */   sw        $a2, 0x18($s1)
    /* 1A0D4 8002A0D4 21804000 */  addu       $s0, $v0, $zero
    /* 1A0D8 8002A0D8 0000248E */  lw         $a0, 0x0($s1)
    /* 1A0DC 8002A0DC 0000058E */  lw         $a1, 0x0($s0)
    /* 1A0E0 8002A0E0 1400268E */  lw         $a2, 0x14($s1)
    /* 1A0E4 8002A0E4 F1B1000C */  jal        blockmove
    /* 1A0E8 8002A0E8 00000000 */   nop
    /* 1A0EC 8002A0EC 21100002 */  addu       $v0, $s0, $zero
  .L8002A0F0:
    /* 1A0F0 8002A0F0 2000BF8F */  lw         $ra, 0x20($sp)
    /* 1A0F4 8002A0F4 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 1A0F8 8002A0F8 1800B28F */  lw         $s2, 0x18($sp)
    /* 1A0FC 8002A0FC 1400B18F */  lw         $s1, 0x14($sp)
    /* 1A100 8002A100 1000B08F */  lw         $s0, 0x10($sp)
    /* 1A104 8002A104 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 1A108 8002A108 0800E003 */  jr         $ra
    /* 1A10C 8002A10C 00000000 */   nop
endlabel checkcacheblock
