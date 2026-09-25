.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching QuestlogEnter__Fv, 0xCC

glabel QuestlogEnter__Fv
    /* 59078 80069078 1280023C */  lui        $v0, %hi(TextPtr)
    /* 5907C 8006907C F4BB428C */  lw         $v0, %lo(TextPtr)($v0)
    /* 59080 80069080 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 59084 80069084 1400BFAF */  sw         $ra, 0x14($sp)
    /* 59088 80069088 29004010 */  beqz       $v0, .L80069130
    /* 5908C 8006908C 1000B0AF */   sw        $s0, 0x10($sp)
    /* 59090 80069090 1280023C */  lui        $v0, %hi(CDWAIT)
    /* 59094 80069094 ECAD428C */  lw         $v0, %lo(CDWAIT)($v0)
    /* 59098 80069098 00000000 */  nop
    /* 5909C 8006909C 24004014 */  bnez       $v0, .L80069130
    /* 590A0 800690A0 00000000 */   nop
    /* 590A4 800690A4 EC12828F */  lw         $v0, %gp_rel(numqlines)($gp)
    /* 590A8 800690A8 00000000 */  nop
    /* 590AC 800690AC 19004010 */  beqz       $v0, .L80069114
    /* 590B0 800690B0 00000000 */   nop
    /* 590B4 800690B4 CC12838F */  lw         $v1, %gp_rel(D_8011BA4C)($gp)
    /* 590B8 800690B8 E812828F */  lw         $v0, %gp_rel(qline)($gp)
    /* 590BC 800690BC F012858F */  lw         $a1, %gp_rel(qtopline)($gp)
    /* 590C0 800690C0 40180300 */  sll        $v1, $v1, 1
    /* 590C4 800690C4 21104300 */  addu       $v0, $v0, $v1
    /* 590C8 800690C8 23104500 */  subu       $v0, $v0, $a1
    /* 590CC 800690CC 43100200 */  sra        $v0, $v0, 1
    /* 590D0 800690D0 80100200 */  sll        $v0, $v0, 2
    /* 590D4 800690D4 1380013C */  lui        $at, %hi(D_8012EDF8)
    /* 590D8 800690D8 21082200 */  addu       $at, $at, $v0
    /* 590DC 800690DC F8ED308C */  lw         $s0, %lo(D_8012EDF8)($at)
    /* 590E0 800690E0 C6F5000C */  jal        PlaySFX__Fi
    /* 590E4 800690E4 33000424 */   addiu     $a0, $zero, 0x33
    /* 590E8 800690E8 80101000 */  sll        $v0, $s0, 2
    /* 590EC 800690EC 21105000 */  addu       $v0, $v0, $s0
    /* 590F0 800690F0 80100200 */  sll        $v0, $v0, 2
    /* 590F4 800690F4 0E80013C */  lui        $at, %hi(quests + 0xE)
    /* 590F8 800690F8 21082200 */  addu       $at, $at, $v0
    /* 590FC 800690FC 4EDA2490 */  lbu        $a0, %lo(quests + 0xE)($at)
    /* 59100 80069100 1E37010C */  jal        InitQTextMsg__Fi
    /* 59104 80069104 00000000 */   nop
    /* 59108 80069108 A91280A3 */  sb         $zero, %gp_rel(questlog)($gp)
    /* 5910C 8006910C 4CA40108 */  j          .L80069130
    /* 59110 80069110 00000000 */   nop
  .L80069114:
    /* 59114 80069114 1280023C */  lui        $v0, %hi(Qfromoptions)
    /* 59118 80069118 28B24290 */  lbu        $v0, %lo(Qfromoptions)($v0)
    /* 5911C 8006911C 00000000 */  nop
    /* 59120 80069120 03004014 */  bnez       $v0, .L80069130
    /* 59124 80069124 00000000 */   nop
    /* 59128 80069128 C6F5000C */  jal        PlaySFX__Fi
    /* 5912C 8006912C 33000424 */   addiu     $a0, $zero, 0x33
  .L80069130:
    /* 59130 80069130 1400BF8F */  lw         $ra, 0x14($sp)
    /* 59134 80069134 1000B08F */  lw         $s0, 0x10($sp)
    /* 59138 80069138 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 5913C 8006913C 0800E003 */  jr         $ra
    /* 59140 80069140 00000000 */   nop
endlabel QuestlogEnter__Fv
