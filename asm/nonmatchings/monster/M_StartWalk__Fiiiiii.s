.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching M_StartWalk__Fiiiiii, 0x158

glabel M_StartWalk__Fiiiiii
    /* 1D524 8015711C E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 1D528 80157120 1400B1AF */  sw         $s1, 0x14($sp)
    /* 1D52C 80157124 21888000 */  addu       $s1, $a0, $zero
    /* 1D530 80157128 1080023C */  lui        $v0, %hi(monster)
    /* 1D534 8015712C 94534224 */  addiu      $v0, $v0, %lo(monster)
    /* 1D538 80157130 1000B0AF */  sw         $s0, 0x10($sp)
    /* 1D53C 80157134 40801100 */  sll        $s0, $s1, 1
    /* 1D540 80157138 21801102 */  addu       $s0, $s0, $s1
    /* 1D544 8015713C 80801000 */  sll        $s0, $s0, 2
    /* 1D548 80157140 21801102 */  addu       $s0, $s0, $s1
    /* 1D54C 80157144 C0801000 */  sll        $s0, $s0, 3
    /* 1D550 80157148 21100202 */  addu       $v0, $s0, $v0
    /* 1D554 8015714C 3000AD8F */  lw         $t5, 0x30($sp)
    /* 1D558 80157150 34004980 */  lb         $t1, 0x34($v0)
    /* 1D55C 80157154 35004A80 */  lb         $t2, 0x35($v0)
    /* 1D560 80157158 1800BFAF */  sw         $ra, 0x18($sp)
    /* 1D564 8015715C 21402701 */  addu       $t0, $t1, $a3
    /* 1D568 80157160 21584D01 */  addu       $t3, $t2, $t5
    /* 1D56C 80157164 C0180B00 */  sll        $v1, $t3, 3
    /* 1D570 80157168 C0100800 */  sll        $v0, $t0, 3
    /* 1D574 8015716C 23104800 */  subu       $v0, $v0, $t0
    /* 1D578 80157170 C0110200 */  sll        $v0, $v0, 7
    /* 1D57C 80157174 21186200 */  addu       $v1, $v1, $v0
    /* 1D580 80157178 27101100 */  nor        $v0, $zero, $s1
    /* 1D584 8015717C 0E80013C */  lui        $at, %hi(dung_map)
    /* 1D588 80157180 21082300 */  addu       $at, $at, $v1
    /* 1D58C 80157184 287A22A4 */  sh         $v0, %lo(dung_map)($at)
    /* 1D590 80157188 3400A38F */  lw         $v1, 0x34($sp)
    /* 1D594 8015718C 1080013C */  lui        $at, %hi(monster + 0x60)
    /* 1D598 80157190 21083000 */  addu       $at, $at, $s0
    /* 1D59C 80157194 F4532C8C */  lw         $t4, %lo(monster + 0x60)($at)
    /* 1D5A0 80157198 01000224 */  addiu      $v0, $zero, 0x1
    /* 1D5A4 8015719C 1080013C */  lui        $at, %hi(monster + 0x18)
    /* 1D5A8 801571A0 21083000 */  addu       $at, $at, $s0
    /* 1D5AC 801571A4 AC5327A4 */  sh         $a3, %lo(monster + 0x18)($at)
    /* 1D5B0 801571A8 01000724 */  addiu      $a3, $zero, 0x1
    /* 1D5B4 801571AC 1080013C */  lui        $at, %hi(monster + 0x33)
    /* 1D5B8 801571B0 21083000 */  addu       $at, $at, $s0
    /* 1D5BC 801571B4 C75322A0 */  sb         $v0, %lo(monster + 0x33)($at)
    /* 1D5C0 801571B8 1080013C */  lui        $at, %hi(monster + 0x38)
    /* 1D5C4 801571BC 21083000 */  addu       $at, $at, $s0
    /* 1D5C8 801571C0 CC5329A0 */  sb         $t1, %lo(monster + 0x38)($at)
    /* 1D5CC 801571C4 1080013C */  lui        $at, %hi(monster + 0x39)
    /* 1D5D0 801571C8 21083000 */  addu       $at, $at, $s0
    /* 1D5D4 801571CC CD532AA0 */  sb         $t2, %lo(monster + 0x39)($at)
    /* 1D5D8 801571D0 1080013C */  lui        $at, %hi(monster + 0x36)
    /* 1D5DC 801571D4 21083000 */  addu       $at, $at, $s0
    /* 1D5E0 801571D8 CA5328A0 */  sb         $t0, %lo(monster + 0x36)($at)
    /* 1D5E4 801571DC 1080013C */  lui        $at, %hi(monster + 0x37)
    /* 1D5E8 801571E0 21083000 */  addu       $at, $at, $s0
    /* 1D5EC 801571E4 CB532BA0 */  sb         $t3, %lo(monster + 0x37)($at)
    /* 1D5F0 801571E8 1080013C */  lui        $at, %hi(monster + 0x28)
    /* 1D5F4 801571EC 21083000 */  addu       $at, $at, $s0
    /* 1D5F8 801571F0 BC5325A4 */  sh         $a1, %lo(monster + 0x28)($at)
    /* 1D5FC 801571F4 1080013C */  lui        $at, %hi(monster + 0x2A)
    /* 1D600 801571F8 21083000 */  addu       $at, $at, $s0
    /* 1D604 801571FC BE5326A4 */  sh         $a2, %lo(monster + 0x2A)($at)
    /* 1D608 80157200 1080013C */  lui        $at, %hi(monster + 0x1A)
    /* 1D60C 80157204 21083000 */  addu       $at, $at, $s0
    /* 1D610 80157208 AE532DA4 */  sh         $t5, %lo(monster + 0x1A)($at)
    /* 1D614 8015720C 06008525 */  addiu      $a1, $t4, 0x6
    /* 1D618 80157210 1080013C */  lui        $at, %hi(monster + 0x1C)
    /* 1D61C 80157214 21083000 */  addu       $at, $at, $s0
    /* 1D620 80157218 B05323A4 */  sh         $v1, %lo(monster + 0x1C)($at)
    /* 1D624 8015721C 1080013C */  lui        $at, %hi(monster + 0x3C)
    /* 1D628 80157220 21083000 */  addu       $at, $at, $s0
    /* 1D62C 80157224 D05323A0 */  sb         $v1, %lo(monster + 0x3C)($at)
    /* 1D630 80157228 3FFD010C */  jal        NewMonsterAnim__FiR10AnimStructii
    /* 1D634 8015722C 21306000 */   addu      $a2, $v1, $zero
    /* 1D638 80157230 1080013C */  lui        $at, %hi(monster + 0x22)
    /* 1D63C 80157234 21083000 */  addu       $at, $at, $s0
    /* 1D640 80157238 B65320A4 */  sh         $zero, %lo(monster + 0x22)($at)
    /* 1D644 8015723C 1080013C */  lui        $at, %hi(monster + 0x24)
    /* 1D648 80157240 21083000 */  addu       $at, $at, $s0
    /* 1D64C 80157244 B85320A4 */  sh         $zero, %lo(monster + 0x24)($at)
    /* 1D650 80157248 1080013C */  lui        $at, %hi(monster + 0x26)
    /* 1D654 8015724C 21083000 */  addu       $at, $at, $s0
    /* 1D658 80157250 BA5320A4 */  sh         $zero, %lo(monster + 0x26)($at)
    /* 1D65C 80157254 D5FC010C */  jal        M_CheckEFlag__Fi
    /* 1D660 80157258 21202002 */   addu      $a0, $s1, $zero
    /* 1D664 8015725C 1800BF8F */  lw         $ra, 0x18($sp)
    /* 1D668 80157260 1400B18F */  lw         $s1, 0x14($sp)
    /* 1D66C 80157264 1000B08F */  lw         $s0, 0x10($sp)
    /* 1D670 80157268 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 1D674 8015726C 0800E003 */  jr         $ra
    /* 1D678 80157270 00000000 */   nop
endlabel M_StartWalk__Fiiiiii
