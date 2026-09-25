.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching On_TSPELLID__FPC4TCmdi, 0xC4

glabel On_TSPELLID__FPC4TCmdi
    /* 41390 80051390 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 41394 80051394 1400B1AF */  sw         $s1, 0x14($sp)
    /* 41398 80051398 21888000 */  addu       $s1, $a0, $zero
    /* 4139C 8005139C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 413A0 800513A0 2180A000 */  addu       $s0, $a1, $zero
    /* 413A4 800513A4 1800BFAF */  sw         $ra, 0x18($sp)
    /* 413A8 800513A8 959C010C */  jal        ClrPlrPath__Fi
    /* 413AC 800513AC 21200002 */   addu      $a0, $s0, $zero
    /* 413B0 800513B0 40101000 */  sll        $v0, $s0, 1
    /* 413B4 800513B4 21105000 */  addu       $v0, $v0, $s0
    /* 413B8 800513B8 80100200 */  sll        $v0, $v0, 2
    /* 413BC 800513BC 21105000 */  addu       $v0, $v0, $s0
    /* 413C0 800513C0 00110200 */  sll        $v0, $v0, 4
    /* 413C4 800513C4 23105000 */  subu       $v0, $v0, $s0
    /* 413C8 800513C8 80100200 */  sll        $v0, $v0, 2
    /* 413CC 800513CC 21105000 */  addu       $v0, $v0, $s0
    /* 413D0 800513D0 C0100200 */  sll        $v0, $v0, 3
    /* 413D4 800513D4 02002496 */  lhu        $a0, 0x2($s1)
    /* 413D8 800513D8 06002596 */  lhu        $a1, 0x6($s1)
    /* 413DC 800513DC 04002696 */  lhu        $a2, 0x4($s1)
    /* 413E0 800513E0 0E80013C */  lui        $at, %hi(plr + 0x61)
    /* 413E4 800513E4 21082200 */  addu       $at, $at, $v0
    /* 413E8 800513E8 99A52790 */  lbu        $a3, %lo(plr + 0x61)($at)
    /* 413EC 800513EC 18000324 */  addiu      $v1, $zero, 0x18
    /* 413F0 800513F0 0E80013C */  lui        $at, %hi(plr + 0x1E)
    /* 413F4 800513F4 21082200 */  addu       $at, $at, $v0
    /* 413F8 800513F8 56A523A0 */  sb         $v1, %lo(plr + 0x1E)($at)
    /* 413FC 800513FC 02000324 */  addiu      $v1, $zero, 0x2
    /* 41400 80051400 0E80013C */  lui        $at, %hi(plr + 0x5F)
    /* 41404 80051404 21082200 */  addu       $at, $at, $v0
    /* 41408 80051408 97A523A0 */  sb         $v1, %lo(plr + 0x5F)($at)
    /* 4140C 8005140C 0E80013C */  lui        $at, %hi(plr + 0x1F)
    /* 41410 80051410 21082200 */  addu       $at, $at, $v0
    /* 41414 80051414 57A524A0 */  sb         $a0, %lo(plr + 0x1F)($at)
    /* 41418 80051418 0E80013C */  lui        $at, %hi(plr + 0x20)
    /* 4141C 8005141C 21082200 */  addu       $at, $at, $v0
    /* 41420 80051420 58A525A0 */  sb         $a1, %lo(plr + 0x20)($at)
    /* 41424 80051424 0E80013C */  lui        $at, %hi(plr + 0x5D)
    /* 41428 80051428 21082200 */  addu       $at, $at, $v0
    /* 4142C 8005142C 95A526A0 */  sb         $a2, %lo(plr + 0x5D)($at)
    /* 41430 80051430 0E80013C */  lui        $at, %hi(plr + 0x5E)
    /* 41434 80051434 21082200 */  addu       $at, $at, $v0
    /* 41438 80051438 96A527A0 */  sb         $a3, %lo(plr + 0x5E)($at)
    /* 4143C 8005143C 1800BF8F */  lw         $ra, 0x18($sp)
    /* 41440 80051440 1400B18F */  lw         $s1, 0x14($sp)
    /* 41444 80051444 1000B08F */  lw         $s0, 0x10($sp)
    /* 41448 80051448 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 4144C 8005144C 0800E003 */  jr         $ra
    /* 41450 80051450 00000000 */   nop
endlabel On_TSPELLID__FPC4TCmdi
