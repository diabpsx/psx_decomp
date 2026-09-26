.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching MI_Infra__Fi, 0xC0

glabel MI_Infra__Fi
    /* E690 80148288 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* E694 8014828C 80100400 */  sll        $v0, $a0, 2
    /* E698 80148290 21104400 */  addu       $v0, $v0, $a0
    /* E69C 80148294 80100200 */  sll        $v0, $v0, 2
    /* E6A0 80148298 23104400 */  subu       $v0, $v0, $a0
    /* E6A4 8014829C 80200200 */  sll        $a0, $v0, 2
    /* E6A8 801482A0 1000BFAF */  sw         $ra, 0x10($sp)
    /* E6AC 801482A4 1080013C */  lui        $at, %hi(missile + 0x18)
    /* E6B0 801482A8 21082400 */  addu       $at, $at, $a0
    /* E6B4 801482AC 702C2294 */  lhu        $v0, %lo(missile + 0x18)($at)
    /* E6B8 801482B0 1080013C */  lui        $at, %hi(missile + 0x2E)
    /* E6BC 801482B4 21082400 */  addu       $at, $at, $a0
    /* E6C0 801482B8 862C2384 */  lh         $v1, %lo(missile + 0x2E)($at)
    /* E6C4 801482BC FFFF4224 */  addiu      $v0, $v0, -0x1
    /* E6C8 801482C0 1080013C */  lui        $at, %hi(missile + 0x18)
    /* E6CC 801482C4 21082400 */  addu       $at, $at, $a0
    /* E6D0 801482C8 702C22A4 */  sh         $v0, %lo(missile + 0x18)($at)
    /* E6D4 801482CC 40100300 */  sll        $v0, $v1, 1
    /* E6D8 801482D0 21104300 */  addu       $v0, $v0, $v1
    /* E6DC 801482D4 80100200 */  sll        $v0, $v0, 2
    /* E6E0 801482D8 21104300 */  addu       $v0, $v0, $v1
    /* E6E4 801482DC 00110200 */  sll        $v0, $v0, 4
    /* E6E8 801482E0 23104300 */  subu       $v0, $v0, $v1
    /* E6EC 801482E4 80100200 */  sll        $v0, $v0, 2
    /* E6F0 801482E8 21104300 */  addu       $v0, $v0, $v1
    /* E6F4 801482EC C0100200 */  sll        $v0, $v0, 3
    /* E6F8 801482F0 01000324 */  addiu      $v1, $zero, 0x1
    /* E6FC 801482F4 0E80013C */  lui        $at, %hi(plr + 0x154)
    /* E700 801482F8 21082200 */  addu       $at, $at, $v0
    /* E704 801482FC 8CA623A0 */  sb         $v1, %lo(plr + 0x154)($at)
    /* E708 80148300 1080013C */  lui        $at, %hi(missile + 0x18)
    /* E70C 80148304 21082400 */  addu       $at, $at, $a0
    /* E710 80148308 702C2294 */  lhu        $v0, %lo(missile + 0x18)($at)
    /* E714 8014830C 00000000 */  nop
    /* E718 80148310 09004014 */  bnez       $v0, .L80148338
    /* E71C 80148314 00000000 */   nop
    /* E720 80148318 1080013C */  lui        $at, %hi(missile + 0x38)
    /* E724 8014831C 21082400 */  addu       $at, $at, $a0
    /* E728 80148320 902C23A0 */  sb         $v1, %lo(missile + 0x38)($at)
    /* E72C 80148324 1080013C */  lui        $at, %hi(missile + 0x2E)
    /* E730 80148328 21082400 */  addu       $at, $at, $a0
    /* E734 8014832C 862C2484 */  lh         $a0, %lo(missile + 0x2E)($at)
    /* E738 80148330 ACF9000C */  jal        CalcPlrItemVals__FiUc
    /* E73C 80148334 01000524 */   addiu     $a1, $zero, 0x1
  .L80148338:
    /* E740 80148338 1000BF8F */  lw         $ra, 0x10($sp)
    /* E744 8014833C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* E748 80148340 0800E003 */  jr         $ra
    /* E74C 80148344 00000000 */   nop
endlabel MI_Infra__Fi
