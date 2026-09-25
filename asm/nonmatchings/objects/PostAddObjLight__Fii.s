.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PostAddObjLight__Fii, 0xC4

glabel PostAddObjLight__Fii
    /* 4333C 8005333C 1280023C */  lui        $v0, %hi(leveltype)
    /* 43340 80053340 0DC14290 */  lbu        $v0, %lo(leveltype)($v0)
    /* 43344 80053344 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 43348 80053348 1400BFAF */  sw         $ra, 0x14($sp)
    /* 4334C 8005334C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 43350 80053350 1280013C */  lui        $at, %hi(level_lamp)
    /* 43354 80053354 21082200 */  addu       $at, $at, $v0
    /* 43358 80053358 0CB92280 */  lb         $v0, %lo(level_lamp)($at)
    /* 4335C 8005335C 00000000 */  nop
    /* 43360 80053360 22004010 */  beqz       $v0, .L800533EC
    /* 43364 80053364 2130A000 */   addu      $a2, $a1, $zero
    /* 43368 80053368 50128293 */  lbu        $v0, %gp_rel(InitObjFlag)($gp)
    /* 4336C 8005336C 00000000 */  nop
    /* 43370 80053370 16004010 */  beqz       $v0, .L800533CC
    /* 43374 80053374 40800400 */   sll       $s0, $a0, 1
    /* 43378 80053378 21800402 */  addu       $s0, $s0, $a0
    /* 4337C 8005337C 80801000 */  sll        $s0, $s0, 2
    /* 43380 80053380 23800402 */  subu       $s0, $s0, $a0
    /* 43384 80053384 80801000 */  sll        $s0, $s0, 2
    /* 43388 80053388 0E80013C */  lui        $at, %hi(object + 0x1F)
    /* 4338C 8005338C 21083000 */  addu       $at, $at, $s0
    /* 43390 80053390 6B8C2480 */  lb         $a0, %lo(object + 0x1F)($at)
    /* 43394 80053394 0E80013C */  lui        $at, %hi(object + 0x20)
    /* 43398 80053398 21083000 */  addu       $at, $at, $s0
    /* 4339C 8005339C 6C8C2580 */  lb         $a1, %lo(object + 0x20)($at)
    /* 433A0 800533A0 BA34010C */  jal        AddLight__Fiii
    /* 433A4 800533A4 00000000 */   nop
    /* 433A8 800533A8 0E80013C */  lui        $at, %hi(object)
    /* 433AC 800533AC 21083000 */  addu       $at, $at, $s0
    /* 433B0 800533B0 4C8C22A4 */  sh         $v0, %lo(object)($at)
    /* 433B4 800533B4 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 433B8 800533B8 0E80013C */  lui        $at, %hi(object + 0xE)
    /* 433BC 800533BC 21083000 */  addu       $at, $at, $s0
    /* 433C0 800533C0 5A8C22A4 */  sh         $v0, %lo(object + 0xE)($at)
    /* 433C4 800533C4 FB4C0108 */  j          .L800533EC
    /* 433C8 800533C8 00000000 */   nop
  .L800533CC:
    /* 433CC 800533CC 40100400 */  sll        $v0, $a0, 1
    /* 433D0 800533D0 21104400 */  addu       $v0, $v0, $a0
    /* 433D4 800533D4 80100200 */  sll        $v0, $v0, 2
    /* 433D8 800533D8 23104400 */  subu       $v0, $v0, $a0
    /* 433DC 800533DC 80100200 */  sll        $v0, $v0, 2
    /* 433E0 800533E0 0E80013C */  lui        $at, %hi(object + 0xE)
    /* 433E4 800533E4 21082200 */  addu       $at, $at, $v0
    /* 433E8 800533E8 5A8C20A4 */  sh         $zero, %lo(object + 0xE)($at)
  .L800533EC:
    /* 433EC 800533EC 1400BF8F */  lw         $ra, 0x14($sp)
    /* 433F0 800533F0 1000B08F */  lw         $s0, 0x10($sp)
    /* 433F4 800533F4 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 433F8 800533F8 0800E003 */  jr         $ra
    /* 433FC 800533FC 00000000 */   nop
endlabel PostAddObjLight__Fii
