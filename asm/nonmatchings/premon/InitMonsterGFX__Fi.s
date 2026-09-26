.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching InitMonsterGFX__Fi, 0xD8

glabel InitMonsterGFX__Fi
    /* 25C30 8015F828 00FFBD27 */  addiu      $sp, $sp, -0x100
    /* 25C34 8015F82C 21300000 */  addu       $a2, $zero, $zero
    /* 25C38 8015F830 73000824 */  addiu      $t0, $zero, 0x73
    /* 25C3C 8015F834 C0100400 */  sll        $v0, $a0, 3
    /* 25C40 8015F838 23104400 */  subu       $v0, $v0, $a0
    /* 25C44 8015F83C 80100200 */  sll        $v0, $v0, 2
    /* 25C48 8015F840 1180013C */  lui        $at, %hi(Monsters + 0x12)
    /* 25C4C 8015F844 21082200 */  addu       $at, $at, $v0
    /* 25C50 8015F848 CEA32390 */  lbu        $v1, %lo(Monsters + 0x12)($at)
    /* 25C54 8015F84C 21284000 */  addu       $a1, $v0, $zero
    /* 25C58 8015F850 00110300 */  sll        $v0, $v1, 4
    /* 25C5C 8015F854 23104300 */  subu       $v0, $v0, $v1
    /* 25C60 8015F858 80100200 */  sll        $v0, $v0, 2
    /* 25C64 8015F85C 1180033C */  lui        $v1, %hi(monsterdata)
    /* 25C68 8015F860 9CAB6324 */  addiu      $v1, $v1, %lo(monsterdata)
    /* 25C6C 8015F864 21384300 */  addu       $a3, $v0, $v1
  .L8015F868:
    /* 25C70 8015F868 2118E600 */  addu       $v1, $a3, $a2
    /* 25C74 8015F86C 08006290 */  lbu        $v0, 0x8($v1)
    /* 25C78 8015F870 1180013C */  lui        $at, %hi(Monsters + 0x4)
    /* 25C7C 8015F874 21082500 */  addu       $at, $at, $a1
    /* 25C80 8015F878 C0A322A0 */  sb         $v0, %lo(Monsters + 0x4)($at)
    /* 25C84 8015F87C 0E006290 */  lbu        $v0, 0xE($v1)
    /* 25C88 8015F880 0100C624 */  addiu      $a2, $a2, 0x1
    /* 25C8C 8015F884 1180013C */  lui        $at, %hi(Monsters + 0x5)
    /* 25C90 8015F888 21082500 */  addu       $at, $at, $a1
    /* 25C94 8015F88C C1A322A0 */  sb         $v0, %lo(Monsters + 0x5)($at)
    /* 25C98 8015F890 0600C228 */  slti       $v0, $a2, 0x6
    /* 25C9C 8015F894 F4FF4014 */  bnez       $v0, .L8015F868
    /* 25CA0 8015F898 0200A524 */   addiu     $a1, $a1, 0x2
    /* 25CA4 8015F89C C0100400 */  sll        $v0, $a0, 3
    /* 25CA8 8015F8A0 23104400 */  subu       $v0, $v0, $a0
    /* 25CAC 8015F8A4 1C00E394 */  lhu        $v1, 0x1C($a3)
    /* 25CB0 8015F8A8 80100200 */  sll        $v0, $v0, 2
    /* 25CB4 8015F8AC 1180013C */  lui        $at, %hi(Monsters + 0x14)
    /* 25CB8 8015F8B0 21082200 */  addu       $at, $at, $v0
    /* 25CBC 8015F8B4 D0A323A0 */  sb         $v1, %lo(Monsters + 0x14)($at)
    /* 25CC0 8015F8B8 1E00E394 */  lhu        $v1, 0x1E($a3)
    /* 25CC4 8015F8BC 1180013C */  lui        $at, %hi(Monsters + 0x15)
    /* 25CC8 8015F8C0 21082200 */  addu       $at, $at, $v0
    /* 25CCC 8015F8C4 D1A323A0 */  sb         $v1, %lo(Monsters + 0x15)($at)
    /* 25CD0 8015F8C8 0200E390 */  lbu        $v1, 0x2($a3)
    /* 25CD4 8015F8CC 1180013C */  lui        $at, %hi(Monsters + 0x16)
    /* 25CD8 8015F8D0 21082200 */  addu       $at, $at, $v0
    /* 25CDC 8015F8D4 D2A323A0 */  sb         $v1, %lo(Monsters + 0x16)($at)
    /* 25CE0 8015F8D8 2600E390 */  lbu        $v1, 0x26($a3)
    /* 25CE4 8015F8DC 1180013C */  lui        $at, %hi(Monsters)
    /* 25CE8 8015F8E0 21082200 */  addu       $at, $at, $v0
    /* 25CEC 8015F8E4 BCA327AC */  sw         $a3, %lo(Monsters)($at)
    /* 25CF0 8015F8E8 1180013C */  lui        $at, %hi(Monsters + 0x17)
    /* 25CF4 8015F8EC 21082200 */  addu       $at, $at, $v0
    /* 25CF8 8015F8F0 D3A323A0 */  sb         $v1, %lo(Monsters + 0x17)($at)
    /* 25CFC 8015F8F4 0001BD27 */  addiu      $sp, $sp, 0x100
    /* 25D00 8015F8F8 0800E003 */  jr         $ra
    /* 25D04 8015F8FC 00000000 */   nop
endlabel InitMonsterGFX__Fi
