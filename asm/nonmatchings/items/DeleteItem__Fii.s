.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DeleteItem__Fii, 0x54

glabel DeleteItem__Fii
    /* 357B8 800457B8 0811828F */  lw         $v0, %gp_rel(numitems)($gp)
    /* 357BC 800457BC 0D80033C */  lui        $v1, %hi(D_800D5453)
    /* 357C0 800457C0 53546324 */  addiu      $v1, $v1, %lo(D_800D5453)
    /* 357C4 800457C4 23186200 */  subu       $v1, $v1, $v0
    /* 357C8 800457C8 000064A0 */  sb         $a0, 0x0($v1)
    /* 357CC 800457CC 0811828F */  lw         $v0, %gp_rel(numitems)($gp)
    /* 357D0 800457D0 00000000 */  nop
    /* 357D4 800457D4 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 357D8 800457D8 081182AF */  sw         $v0, %gp_rel(numitems)($gp)
    /* 357DC 800457DC 09004018 */  blez       $v0, .L80045804
    /* 357E0 800457E0 00000000 */   nop
    /* 357E4 800457E4 0700A210 */  beq        $a1, $v0, .L80045804
    /* 357E8 800457E8 00000000 */   nop
    /* 357EC 800457EC 0D80013C */  lui        $at, %hi(itemactive)
    /* 357F0 800457F0 21082200 */  addu       $at, $at, $v0
    /* 357F4 800457F4 54532290 */  lbu        $v0, %lo(itemactive)($at)
    /* 357F8 800457F8 0D80013C */  lui        $at, %hi(itemactive)
    /* 357FC 800457FC 21082500 */  addu       $at, $at, $a1
    /* 35800 80045800 545322A0 */  sb         $v0, %lo(itemactive)($at)
  .L80045804:
    /* 35804 80045804 0800E003 */  jr         $ra
    /* 35808 80045808 00000000 */   nop
endlabel DeleteItem__Fii
