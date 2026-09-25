.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CheckNewPath__Fi, 0x4C

glabel CheckNewPath__Fi
    /* 5708C 8006708C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 57090 80067090 1000BFAF */  sw         $ra, 0x10($sp)
    /* 57094 80067094 40100400 */  sll        $v0, $a0, 1
    /* 57098 80067098 21104400 */  addu       $v0, $v0, $a0
    /* 5709C 8006709C 80100200 */  sll        $v0, $v0, 2
    /* 570A0 800670A0 21104400 */  addu       $v0, $v0, $a0
    /* 570A4 800670A4 00110200 */  sll        $v0, $v0, 4
    /* 570A8 800670A8 23104400 */  subu       $v0, $v0, $a0
    /* 570AC 800670AC 80100200 */  sll        $v0, $v0, 2
    /* 570B0 800670B0 21104400 */  addu       $v0, $v0, $a0
    /* 570B4 800670B4 C0100200 */  sll        $v0, $v0, 3
    /* 570B8 800670B8 0E80043C */  lui        $a0, %hi(plr)
    /* 570BC 800670BC 38A58424 */  addiu      $a0, $a0, %lo(plr)
    /* 570C0 800670C0 AA91010C */  jal        CheckNewPath__FP12PlayerStruct
    /* 570C4 800670C4 21204400 */   addu      $a0, $v0, $a0
    /* 570C8 800670C8 1000BF8F */  lw         $ra, 0x10($sp)
    /* 570CC 800670CC 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 570D0 800670D0 0800E003 */  jr         $ra
    /* 570D4 800670D4 00000000 */   nop
endlabel CheckNewPath__Fi
