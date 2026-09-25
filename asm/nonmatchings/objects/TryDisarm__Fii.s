.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching TryDisarm__Fii, 0x1B0

glabel TryDisarm__Fii
    /* 4A258 8005A258 1280023C */  lui        $v0, %hi(myplr)
    /* 4A25C 8005A25C 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 4A260 8005A260 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 4A264 8005A264 1800B0AF */  sw         $s0, 0x18($sp)
    /* 4A268 8005A268 21808000 */  addu       $s0, $a0, $zero
    /* 4A26C 8005A26C 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 4A270 8005A270 2188A000 */  addu       $s1, $a1, $zero
    /* 4A274 8005A274 2400BFAF */  sw         $ra, 0x24($sp)
    /* 4A278 8005A278 03000216 */  bne        $s0, $v0, .L8005A288
    /* 4A27C 8005A27C 2000B2AF */   sw        $s2, 0x20($sp)
    /* 4A280 8005A280 01DE000C */  jal        NewCursor__Fi
    /* 4A284 8005A284 01000424 */   addiu     $a0, $zero, 0x1
  .L8005A288:
    /* 4A288 8005A288 40101100 */  sll        $v0, $s1, 1
    /* 4A28C 8005A28C 21105100 */  addu       $v0, $v0, $s1
    /* 4A290 8005A290 80100200 */  sll        $v0, $v0, 2
    /* 4A294 8005A294 23105100 */  subu       $v0, $v0, $s1
    /* 4A298 8005A298 80900200 */  sll        $s2, $v0, 2
    /* 4A29C 8005A29C 0E80013C */  lui        $at, %hi(object + 0x2A)
    /* 4A2A0 8005A2A0 21083200 */  addu       $at, $at, $s2
    /* 4A2A4 8005A2A4 768C2290 */  lbu        $v0, %lo(object + 0x2A)($at)
    /* 4A2A8 8005A2A8 00000000 */  nop
    /* 4A2AC 8005A2AC 4F004010 */  beqz       $v0, .L8005A3EC
    /* 4A2B0 8005A2B0 64000424 */   addiu     $a0, $zero, 0x64
    /* 4A2B4 8005A2B4 40101000 */  sll        $v0, $s0, 1
    /* 4A2B8 8005A2B8 21105000 */  addu       $v0, $v0, $s0
    /* 4A2BC 8005A2BC 80100200 */  sll        $v0, $v0, 2
    /* 4A2C0 8005A2C0 21105000 */  addu       $v0, $v0, $s0
    /* 4A2C4 8005A2C4 00110200 */  sll        $v0, $v0, 4
    /* 4A2C8 8005A2C8 23105000 */  subu       $v0, $v0, $s0
    /* 4A2CC 8005A2CC 80100200 */  sll        $v0, $v0, 2
    /* 4A2D0 8005A2D0 21105000 */  addu       $v0, $v0, $s0
    /* 4A2D4 8005A2D4 C0100200 */  sll        $v0, $v0, 3
    /* 4A2D8 8005A2D8 0E80013C */  lui        $at, %hi(plr + 0x100)
    /* 4A2DC 8005A2DC 21082200 */  addu       $at, $at, $v0
    /* 4A2E0 8005A2E0 38A63084 */  lh         $s0, %lo(plr + 0x100)($at)
    /* 4A2E4 8005A2E4 1280033C */  lui        $v1, %hi(currlevel)
    /* 4A2E8 8005A2E8 0CC16390 */  lbu        $v1, %lo(currlevel)($v1)
    /* 4A2EC 8005A2EC 40801000 */  sll        $s0, $s0, 1
    /* 4A2F0 8005A2F0 80100300 */  sll        $v0, $v1, 2
    /* 4A2F4 8005A2F4 21104300 */  addu       $v0, $v0, $v1
    /* 4A2F8 8005A2F8 C9F6000C */  jal        ENG_random__Fl
    /* 4A2FC 8005A2FC 23800202 */   subu      $s0, $s0, $v0
    /* 4A300 8005A300 2A800202 */  slt        $s0, $s0, $v0
    /* 4A304 8005A304 39000016 */  bnez       $s0, .L8005A3EC
    /* 4A308 8005A308 00000000 */   nop
    /* 4A30C 8005A30C 4C12828F */  lw         $v0, %gp_rel(numobjects)($gp)
    /* 4A310 8005A310 00000000 */  nop
    /* 4A314 8005A314 35004018 */  blez       $v0, .L8005A3EC
    /* 4A318 8005A318 21300000 */   addu      $a2, $zero, $zero
    /* 4A31C 8005A31C 36000924 */  addiu      $t1, $zero, 0x36
    /* 4A320 8005A320 01000824 */  addiu      $t0, $zero, 0x1
    /* 4A324 8005A324 21384002 */  addu       $a3, $s2, $zero
  .L8005A328:
    /* 4A328 8005A328 0E80013C */  lui        $at, %hi(objectactive)
    /* 4A32C 8005A32C 21082600 */  addu       $at, $at, $a2
    /* 4A330 8005A330 20A22380 */  lb         $v1, %lo(objectactive)($at)
    /* 4A334 8005A334 00000000 */  nop
    /* 4A338 8005A338 40100300 */  sll        $v0, $v1, 1
    /* 4A33C 8005A33C 21104300 */  addu       $v0, $v0, $v1
    /* 4A340 8005A340 80100200 */  sll        $v0, $v0, 2
    /* 4A344 8005A344 23104300 */  subu       $v0, $v0, $v1
    /* 4A348 8005A348 80280200 */  sll        $a1, $v0, 2
    /* 4A34C 8005A34C 0E80013C */  lui        $at, %hi(object + 0x1E)
    /* 4A350 8005A350 21082500 */  addu       $at, $at, $a1
    /* 4A354 8005A354 6A8C2380 */  lb         $v1, %lo(object + 0x1E)($at)
    /* 4A358 8005A358 00000000 */  nop
    /* 4A35C 8005A35C 35006238 */  xori       $v0, $v1, 0x35
    /* 4A360 8005A360 02006914 */  bne        $v1, $t1, .L8005A36C
    /* 4A364 8005A364 0100422C */   sltiu     $v0, $v0, 0x1
    /* 4A368 8005A368 01000224 */  addiu      $v0, $zero, 0x1
  .L8005A36C:
    /* 4A36C 8005A36C FF004230 */  andi       $v0, $v0, 0xFF
    /* 4A370 8005A370 19004010 */  beqz       $v0, .L8005A3D8
    /* 4A374 8005A374 00000000 */   nop
    /* 4A378 8005A378 0E80013C */  lui        $at, %hi(object + 0x10)
    /* 4A37C 8005A37C 21082500 */  addu       $at, $at, $a1
    /* 4A380 8005A380 5C8C2384 */  lh         $v1, %lo(object + 0x10)($at)
    /* 4A384 8005A384 0E80013C */  lui        $at, %hi(object + 0xE)
    /* 4A388 8005A388 21082500 */  addu       $at, $at, $a1
    /* 4A38C 8005A38C 5A8C2484 */  lh         $a0, %lo(object + 0xE)($at)
    /* 4A390 8005A390 C0180300 */  sll        $v1, $v1, 3
    /* 4A394 8005A394 C0100400 */  sll        $v0, $a0, 3
    /* 4A398 8005A398 23104400 */  subu       $v0, $v0, $a0
    /* 4A39C 8005A39C C0110200 */  sll        $v0, $v0, 7
    /* 4A3A0 8005A3A0 21186200 */  addu       $v1, $v1, $v0
    /* 4A3A4 8005A3A4 0E80013C */  lui        $at, %hi(dung_map + 0x3)
    /* 4A3A8 8005A3A8 21082300 */  addu       $at, $at, $v1
    /* 4A3AC 8005A3AC 2B7A2280 */  lb         $v0, %lo(dung_map + 0x3)($at)
    /* 4A3B0 8005A3B0 00000000 */  nop
    /* 4A3B4 8005A3B4 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 4A3B8 8005A3B8 07005114 */  bne        $v0, $s1, .L8005A3D8
    /* 4A3BC 8005A3BC 00000000 */   nop
    /* 4A3C0 8005A3C0 0E80013C */  lui        $at, %hi(object + 0x14)
    /* 4A3C4 8005A3C4 21082500 */  addu       $at, $at, $a1
    /* 4A3C8 8005A3C8 608C28A4 */  sh         $t0, %lo(object + 0x14)($at)
    /* 4A3CC 8005A3CC 0E80013C */  lui        $at, %hi(object + 0x2A)
    /* 4A3D0 8005A3D0 21082700 */  addu       $at, $at, $a3
    /* 4A3D4 8005A3D4 768C20A0 */  sb         $zero, %lo(object + 0x2A)($at)
  .L8005A3D8:
    /* 4A3D8 8005A3D8 4C12828F */  lw         $v0, %gp_rel(numobjects)($gp)
    /* 4A3DC 8005A3DC 0100C624 */  addiu      $a2, $a2, 0x1
    /* 4A3E0 8005A3E0 2A10C200 */  slt        $v0, $a2, $v0
    /* 4A3E4 8005A3E4 D0FF4014 */  bnez       $v0, .L8005A328
    /* 4A3E8 8005A3E8 00000000 */   nop
  .L8005A3EC:
    /* 4A3EC 8005A3EC 2400BF8F */  lw         $ra, 0x24($sp)
    /* 4A3F0 8005A3F0 2000B28F */  lw         $s2, 0x20($sp)
    /* 4A3F4 8005A3F4 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 4A3F8 8005A3F8 1800B08F */  lw         $s0, 0x18($sp)
    /* 4A3FC 8005A3FC 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 4A400 8005A400 0800E003 */  jr         $ra
    /* 4A404 8005A404 00000000 */   nop
endlabel TryDisarm__Fii
