.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching M_StartSpStand__Fii, 0xE8

glabel M_StartSpStand__Fii
    /* 70374 80080374 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 70378 80080378 1400B1AF */  sw         $s1, 0x14($sp)
    /* 7037C 8008037C 21888000 */  addu       $s1, $a0, $zero
    /* 70380 80080380 1800B2AF */  sw         $s2, 0x18($sp)
    /* 70384 80080384 2190A000 */  addu       $s2, $a1, $zero
    /* 70388 80080388 1000B0AF */  sw         $s0, 0x10($sp)
    /* 7038C 8008038C 40801100 */  sll        $s0, $s1, 1
    /* 70390 80080390 21801102 */  addu       $s0, $s0, $s1
    /* 70394 80080394 80801000 */  sll        $s0, $s0, 2
    /* 70398 80080398 21801102 */  addu       $s0, $s0, $s1
    /* 7039C 8008039C C0801000 */  sll        $s0, $s0, 3
    /* 703A0 800803A0 21304002 */  addu       $a2, $s2, $zero
    /* 703A4 800803A4 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 703A8 800803A8 1080013C */  lui        $at, %hi(monster + 0x60)
    /* 703AC 800803AC 21083000 */  addu       $at, $at, $s0
    /* 703B0 800803B0 F453258C */  lw         $a1, %lo(monster + 0x60)($at)
    /* 703B4 800803B4 05000724 */  addiu      $a3, $zero, 0x5
    /* 703B8 800803B8 3FFD010C */  jal        NewMonsterAnim__FiR10AnimStructii
    /* 703BC 800803BC 0E00A524 */   addiu     $a1, $a1, 0xE
    /* 703C0 800803C0 1080023C */  lui        $v0, %hi(monster)
    /* 703C4 800803C4 94534224 */  addiu      $v0, $v0, %lo(monster)
    /* 703C8 800803C8 21100202 */  addu       $v0, $s0, $v0
    /* 703CC 800803CC 34004380 */  lb         $v1, 0x34($v0)
    /* 703D0 800803D0 35004580 */  lb         $a1, 0x35($v0)
    /* 703D4 800803D4 0B000224 */  addiu      $v0, $zero, 0xB
    /* 703D8 800803D8 1080013C */  lui        $at, %hi(monster + 0x33)
    /* 703DC 800803DC 21083000 */  addu       $at, $at, $s0
    /* 703E0 800803E0 C75322A0 */  sb         $v0, %lo(monster + 0x33)($at)
    /* 703E4 800803E4 1080013C */  lui        $at, %hi(monster + 0x3A)
    /* 703E8 800803E8 21083000 */  addu       $at, $at, $s0
    /* 703EC 800803EC CE5320A0 */  sb         $zero, %lo(monster + 0x3A)($at)
    /* 703F0 800803F0 1080013C */  lui        $at, %hi(monster + 0x3B)
    /* 703F4 800803F4 21083000 */  addu       $at, $at, $s0
    /* 703F8 800803F8 CF5320A0 */  sb         $zero, %lo(monster + 0x3B)($at)
    /* 703FC 800803FC 1080013C */  lui        $at, %hi(monster + 0x3C)
    /* 70400 80080400 21083000 */  addu       $at, $at, $s0
    /* 70404 80080404 D05332A0 */  sb         $s2, %lo(monster + 0x3C)($at)
    /* 70408 80080408 1080013C */  lui        $at, %hi(monster + 0x36)
    /* 7040C 8008040C 21083000 */  addu       $at, $at, $s0
    /* 70410 80080410 CA5323A0 */  sb         $v1, %lo(monster + 0x36)($at)
    /* 70414 80080414 1080013C */  lui        $at, %hi(monster + 0x37)
    /* 70418 80080418 21083000 */  addu       $at, $at, $s0
    /* 7041C 8008041C CB5325A0 */  sb         $a1, %lo(monster + 0x37)($at)
    /* 70420 80080420 1080013C */  lui        $at, %hi(monster + 0x38)
    /* 70424 80080424 21083000 */  addu       $at, $at, $s0
    /* 70428 80080428 CC5323A0 */  sb         $v1, %lo(monster + 0x38)($at)
    /* 7042C 8008042C 1080013C */  lui        $at, %hi(monster + 0x39)
    /* 70430 80080430 21083000 */  addu       $at, $at, $s0
    /* 70434 80080434 CD5325A0 */  sb         $a1, %lo(monster + 0x39)($at)
    /* 70438 80080438 D5FC010C */  jal        M_CheckEFlag__Fi
    /* 7043C 8008043C 21202002 */   addu      $a0, $s1, $zero
    /* 70440 80080440 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 70444 80080444 1800B28F */  lw         $s2, 0x18($sp)
    /* 70448 80080448 1400B18F */  lw         $s1, 0x14($sp)
    /* 7044C 8008044C 1000B08F */  lw         $s0, 0x10($sp)
    /* 70450 80080450 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 70454 80080454 0800E003 */  jr         $ra
    /* 70458 80080458 00000000 */   nop
endlabel M_StartSpStand__Fii
