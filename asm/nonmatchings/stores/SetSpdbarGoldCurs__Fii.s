.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetSpdbarGoldCurs__Fii, 0x80

glabel SetSpdbarGoldCurs__Fii
    /* 606C8 800706C8 C0180500 */  sll        $v1, $a1, 3
    /* 606CC 800706CC 23186500 */  subu       $v1, $v1, $a1
    /* 606D0 800706D0 80180300 */  sll        $v1, $v1, 2
    /* 606D4 800706D4 23186500 */  subu       $v1, $v1, $a1
    /* 606D8 800706D8 80180300 */  sll        $v1, $v1, 2
    /* 606DC 800706DC 40100400 */  sll        $v0, $a0, 1
    /* 606E0 800706E0 21104400 */  addu       $v0, $v0, $a0
    /* 606E4 800706E4 80100200 */  sll        $v0, $v0, 2
    /* 606E8 800706E8 21104400 */  addu       $v0, $v0, $a0
    /* 606EC 800706EC 00110200 */  sll        $v0, $v0, 4
    /* 606F0 800706F0 23104400 */  subu       $v0, $v0, $a0
    /* 606F4 800706F4 80100200 */  sll        $v0, $v0, 2
    /* 606F8 800706F8 21104400 */  addu       $v0, $v0, $a0
    /* 606FC 800706FC C0100200 */  sll        $v0, $v0, 3
    /* 60700 80070700 21186200 */  addu       $v1, $v1, $v0
    /* 60704 80070704 0E80013C */  lui        $at, %hi(plr + 0x15C4)
    /* 60708 80070708 21082300 */  addu       $at, $at, $v1
    /* 6070C 8007070C FCBA248C */  lw         $a0, %lo(plr + 0x15C4)($at)
    /* 60710 80070710 00000000 */  nop
    /* 60714 80070714 C4098228 */  slti       $v0, $a0, 0x9C4
    /* 60718 80070718 03004014 */  bnez       $v0, .L80070728
    /* 6071C 8007071C E9038228 */   slti      $v0, $a0, 0x3E9
    /* 60720 80070720 CDC10108 */  j          .L80070734
    /* 60724 80070724 06000224 */   addiu     $v0, $zero, 0x6
  .L80070728:
    /* 60728 80070728 02004014 */  bnez       $v0, .L80070734
    /* 6072C 8007072C 04000224 */   addiu     $v0, $zero, 0x4
    /* 60730 80070730 05000224 */  addiu      $v0, $zero, 0x5
  .L80070734:
    /* 60734 80070734 0E80013C */  lui        $at, %hi(plr + 0x15FC)
    /* 60738 80070738 21082300 */  addu       $at, $at, $v1
    /* 6073C 8007073C 34BB22A0 */  sb         $v0, %lo(plr + 0x15FC)($at)
    /* 60740 80070740 0800E003 */  jr         $ra
    /* 60744 80070744 00000000 */   nop
endlabel SetSpdbarGoldCurs__Fii
