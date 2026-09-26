.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddAcidpud__Fiiiiiicii, 0xE4

glabel AddAcidpud__Fiiiiiicii
    /* 68F8 801404F0 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 68FC 801404F4 1000B0AF */  sw         $s0, 0x10($sp)
    /* 6900 801404F8 80800400 */  sll        $s0, $a0, 2
    /* 6904 801404FC 21800402 */  addu       $s0, $s0, $a0
    /* 6908 80140500 80801000 */  sll        $s0, $s0, 2
    /* 690C 80140504 23800402 */  subu       $s0, $s0, $a0
    /* 6910 80140508 80801000 */  sll        $s0, $s0, 2
    /* 6914 8014050C 1800B2AF */  sw         $s2, 0x18($sp)
    /* 6918 80140510 01001224 */  addiu      $s2, $zero, 0x1
    /* 691C 80140514 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 6920 80140518 1400B1AF */  sw         $s1, 0x14($sp)
    /* 6924 8014051C 1080013C */  lui        $at, %hi(missile + 0x2E)
    /* 6928 80140520 21083000 */  addu       $at, $at, $s0
    /* 692C 80140524 862C3184 */  lh         $s1, %lo(missile + 0x2E)($at)
    /* 6930 80140528 1080013C */  lui        $at, %hi(missile)
    /* 6934 8014052C 21083000 */  addu       $at, $at, $s0
    /* 6938 80140530 582C20AC */  sw         $zero, %lo(missile)($at)
    /* 693C 80140534 1080013C */  lui        $at, %hi(missile + 0x4)
    /* 6940 80140538 21083000 */  addu       $at, $at, $s0
    /* 6944 8014053C 5C2C20AC */  sw         $zero, %lo(missile + 0x4)($at)
    /* 6948 80140540 1080013C */  lui        $at, %hi(missile + 0x33)
    /* 694C 80140544 21083000 */  addu       $at, $at, $s0
    /* 6950 80140548 8B2C20A0 */  sb         $zero, %lo(missile + 0x33)($at)
    /* 6954 8014054C 1080013C */  lui        $at, %hi(missile + 0x34)
    /* 6958 80140550 21083000 */  addu       $at, $at, $s0
    /* 695C 80140554 8C2C20A0 */  sb         $zero, %lo(missile + 0x34)($at)
    /* 6960 80140558 1080013C */  lui        $at, %hi(missile + 0x3B)
    /* 6964 8014055C 21083000 */  addu       $at, $at, $s0
    /* 6968 80140560 932C32A0 */  sb         $s2, %lo(missile + 0x3B)($at)
    /* 696C 80140564 C9F6000C */  jal        ENG_random__Fl
    /* 6970 80140568 0F000424 */   addiu     $a0, $zero, 0xF
    /* 6974 8014056C 40181100 */  sll        $v1, $s1, 1
    /* 6978 80140570 21187100 */  addu       $v1, $v1, $s1
    /* 697C 80140574 80180300 */  sll        $v1, $v1, 2
    /* 6980 80140578 21187100 */  addu       $v1, $v1, $s1
    /* 6984 8014057C C0180300 */  sll        $v1, $v1, 3
    /* 6988 80140580 1080013C */  lui        $at, %hi(monster + 0x4D)
    /* 698C 80140584 21082300 */  addu       $at, $at, $v1
    /* 6990 80140588 E1532490 */  lbu        $a0, %lo(monster + 0x4D)($at)
    /* 6994 8014058C 1080013C */  lui        $at, %hi(missile + 0x3C)
    /* 6998 80140590 21083000 */  addu       $at, $at, $s0
    /* 699C 80140594 942C32A0 */  sb         $s2, %lo(missile + 0x3C)($at)
    /* 69A0 80140598 01008424 */  addiu      $a0, $a0, 0x1
    /* 69A4 8014059C 80180400 */  sll        $v1, $a0, 2
    /* 69A8 801405A0 21186400 */  addu       $v1, $v1, $a0
    /* 69AC 801405A4 C0180300 */  sll        $v1, $v1, 3
    /* 69B0 801405A8 21104300 */  addu       $v0, $v0, $v1
    /* 69B4 801405AC 1080013C */  lui        $at, %hi(missile + 0x18)
    /* 69B8 801405B0 21083000 */  addu       $at, $at, $s0
    /* 69BC 801405B4 702C22A4 */  sh         $v0, %lo(missile + 0x18)($at)
    /* 69C0 801405B8 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 69C4 801405BC 1800B28F */  lw         $s2, 0x18($sp)
    /* 69C8 801405C0 1400B18F */  lw         $s1, 0x14($sp)
    /* 69CC 801405C4 1000B08F */  lw         $s0, 0x10($sp)
    /* 69D0 801405C8 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 69D4 801405CC 0800E003 */  jr         $ra
    /* 69D8 801405D0 00000000 */   nop
endlabel AddAcidpud__Fiiiiiicii
