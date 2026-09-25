.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CheckPlrDead__Fi, 0x54

glabel CheckPlrDead__Fi
    /* 52198 80062198 40100400 */  sll        $v0, $a0, 1
    /* 5219C 8006219C 21104400 */  addu       $v0, $v0, $a0
    /* 521A0 800621A0 80100200 */  sll        $v0, $v0, 2
    /* 521A4 800621A4 21104400 */  addu       $v0, $v0, $a0
    /* 521A8 800621A8 00110200 */  sll        $v0, $v0, 4
    /* 521AC 800621AC 23104400 */  subu       $v0, $v0, $a0
    /* 521B0 800621B0 80100200 */  sll        $v0, $v0, 2
    /* 521B4 800621B4 21104400 */  addu       $v0, $v0, $a0
    /* 521B8 800621B8 C0100200 */  sll        $v0, $v0, 3
    /* 521BC 800621BC 0E80033C */  lui        $v1, %hi(plr)
    /* 521C0 800621C0 38A56324 */  addiu      $v1, $v1, %lo(plr)
    /* 521C4 800621C4 21204300 */  addu       $a0, $v0, $v1
    /* 521C8 800621C8 0000838C */  lw         $v1, 0x0($a0)
    /* 521CC 800621CC 08000224 */  addiu      $v0, $zero, 0x8
    /* 521D0 800621D0 04006214 */  bne        $v1, $v0, .L800621E4
    /* 521D4 800621D4 00000000 */   nop
    /* 521D8 800621D8 5000828C */  lw         $v0, 0x50($a0)
    /* 521DC 800621DC 1D0080A0 */  sb         $zero, 0x1D($a0)
    /* 521E0 800621E0 540082AC */  sw         $v0, 0x54($a0)
  .L800621E4:
    /* 521E4 800621E4 0800E003 */  jr         $ra
    /* 521E8 800621E8 00000000 */   nop
endlabel CheckPlrDead__Fi
