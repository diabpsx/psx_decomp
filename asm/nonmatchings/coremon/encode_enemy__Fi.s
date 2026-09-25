.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching encode_enemy__Fi, 0x60

glabel encode_enemy__Fi
    /* 70974 80080974 40100400 */  sll        $v0, $a0, 1
    /* 70978 80080978 21104400 */  addu       $v0, $v0, $a0
    /* 7097C 8008097C 80100200 */  sll        $v0, $v0, 2
    /* 70980 80080980 21104400 */  addu       $v0, $v0, $a0
    /* 70984 80080984 C0180200 */  sll        $v1, $v0, 3
    /* 70988 80080988 1080013C */  lui        $at, %hi(monster + 0x2C)
    /* 7098C 8008098C 21082300 */  addu       $at, $at, $v1
    /* 70990 80080990 C0532294 */  lhu        $v0, %lo(monster + 0x2C)($at)
    /* 70994 80080994 00000000 */  nop
    /* 70998 80080998 10004230 */  andi       $v0, $v0, 0x10
    /* 7099C 8008099C 06004014 */  bnez       $v0, .L800809B8
    /* 709A0 800809A0 00000000 */   nop
    /* 709A4 800809A4 1080013C */  lui        $at, %hi(monster + 0x3D)
    /* 709A8 800809A8 21082300 */  addu       $at, $at, $v1
    /* 709AC 800809AC D1532290 */  lbu        $v0, %lo(monster + 0x3D)($at)
    /* 709B0 800809B0 73020208 */  j          .L800809CC
    /* 709B4 800809B4 00000000 */   nop
  .L800809B8:
    /* 709B8 800809B8 1080013C */  lui        $at, %hi(monster + 0x3D)
    /* 709BC 800809BC 21082300 */  addu       $at, $at, $v1
    /* 709C0 800809C0 D1532290 */  lbu        $v0, %lo(monster + 0x3D)($at)
    /* 709C4 800809C4 00000000 */  nop
    /* 709C8 800809C8 02004224 */  addiu      $v0, $v0, 0x2
  .L800809CC:
    /* 709CC 800809CC 0800E003 */  jr         $ra
    /* 709D0 800809D0 00000000 */   nop
endlabel encode_enemy__Fi
