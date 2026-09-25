.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching On_OPOBJT__FPC4TCmdi, 0x4C

glabel On_OPOBJT__FPC4TCmdi
    /* 41080 80051080 40100500 */  sll        $v0, $a1, 1
    /* 41084 80051084 21104500 */  addu       $v0, $v0, $a1
    /* 41088 80051088 80100200 */  sll        $v0, $v0, 2
    /* 4108C 8005108C 21104500 */  addu       $v0, $v0, $a1
    /* 41090 80051090 00110200 */  sll        $v0, $v0, 4
    /* 41094 80051094 23104500 */  subu       $v0, $v0, $a1
    /* 41098 80051098 80100200 */  sll        $v0, $v0, 2
    /* 4109C 8005109C 21104500 */  addu       $v0, $v0, $a1
    /* 410A0 800510A0 C0100200 */  sll        $v0, $v0, 3
    /* 410A4 800510A4 02008494 */  lhu        $a0, 0x2($a0)
    /* 410A8 800510A8 12000324 */  addiu      $v1, $zero, 0x12
    /* 410AC 800510AC 0E80013C */  lui        $at, %hi(plr + 0x1E)
    /* 410B0 800510B0 21082200 */  addu       $at, $at, $v0
    /* 410B4 800510B4 56A523A0 */  sb         $v1, %lo(plr + 0x1E)($at)
    /* 410B8 800510B8 0E80013C */  lui        $at, %hi(plr + 0x1F)
    /* 410BC 800510BC 21082200 */  addu       $at, $at, $v0
    /* 410C0 800510C0 57A524A0 */  sb         $a0, %lo(plr + 0x1F)($at)
    /* 410C4 800510C4 0800E003 */  jr         $ra
    /* 410C8 800510C8 00000000 */   nop
endlabel On_OPOBJT__FPC4TCmdi
