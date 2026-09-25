.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PostAddArmorStand__Fi, 0x88

glabel PostAddArmorStand__Fi
    /* 432B4 800532B4 1280023C */  lui        $v0, %hi(armorFlag)
    /* 432B8 800532B8 94C14290 */  lbu        $v0, %lo(armorFlag)($v0)
    /* 432BC 800532BC E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 432C0 800532C0 1000B0AF */  sw         $s0, 0x10($sp)
    /* 432C4 800532C4 21808000 */  addu       $s0, $a0, $zero
    /* 432C8 800532C8 0D004014 */  bnez       $v0, .L80053300
    /* 432CC 800532CC 1400BFAF */   sw        $ra, 0x14($sp)
    /* 432D0 800532D0 40101000 */  sll        $v0, $s0, 1
    /* 432D4 800532D4 21105000 */  addu       $v0, $v0, $s0
    /* 432D8 800532D8 80100200 */  sll        $v0, $v0, 2
    /* 432DC 800532DC 23105000 */  subu       $v0, $v0, $s0
    /* 432E0 800532E0 80100200 */  sll        $v0, $v0, 2
    /* 432E4 800532E4 02000324 */  addiu      $v1, $zero, 0x2
    /* 432E8 800532E8 0E80013C */  lui        $at, %hi(object + 0x25)
    /* 432EC 800532EC 21082200 */  addu       $at, $at, $v0
    /* 432F0 800532F0 718C23A0 */  sb         $v1, %lo(object + 0x25)($at)
    /* 432F4 800532F4 0E80013C */  lui        $at, %hi(object + 0x23)
    /* 432F8 800532F8 21082200 */  addu       $at, $at, $v0
    /* 432FC 800532FC 6F8C20A0 */  sb         $zero, %lo(object + 0x23)($at)
  .L80053300:
    /* 43300 80053300 B7F6000C */  jal        GetRndSeed__Fv
    /* 43304 80053304 00000000 */   nop
    /* 43308 80053308 40181000 */  sll        $v1, $s0, 1
    /* 4330C 8005330C 21187000 */  addu       $v1, $v1, $s0
    /* 43310 80053310 80180300 */  sll        $v1, $v1, 2
    /* 43314 80053314 23187000 */  subu       $v1, $v1, $s0
    /* 43318 80053318 80180300 */  sll        $v1, $v1, 2
    /* 4331C 8005331C 0E80013C */  lui        $at, %hi(object + 0x4)
    /* 43320 80053320 21082300 */  addu       $at, $at, $v1
    /* 43324 80053324 508C22AC */  sw         $v0, %lo(object + 0x4)($at)
    /* 43328 80053328 1400BF8F */  lw         $ra, 0x14($sp)
    /* 4332C 8005332C 1000B08F */  lw         $s0, 0x10($sp)
    /* 43330 80053330 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 43334 80053334 0800E003 */  jr         $ra
    /* 43338 80053338 00000000 */   nop
endlabel PostAddArmorStand__Fi
