.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching On_TSPELLPID__FPC4TCmdi, 0xC4

glabel On_TSPELLPID__FPC4TCmdi
    /* 41454 80051454 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 41458 80051458 1400B1AF */  sw         $s1, 0x14($sp)
    /* 4145C 8005145C 21888000 */  addu       $s1, $a0, $zero
    /* 41460 80051460 1000B0AF */  sw         $s0, 0x10($sp)
    /* 41464 80051464 2180A000 */  addu       $s0, $a1, $zero
    /* 41468 80051468 1800BFAF */  sw         $ra, 0x18($sp)
    /* 4146C 8005146C 959C010C */  jal        ClrPlrPath__Fi
    /* 41470 80051470 21200002 */   addu      $a0, $s0, $zero
    /* 41474 80051474 40101000 */  sll        $v0, $s0, 1
    /* 41478 80051478 21105000 */  addu       $v0, $v0, $s0
    /* 4147C 8005147C 80100200 */  sll        $v0, $v0, 2
    /* 41480 80051480 21105000 */  addu       $v0, $v0, $s0
    /* 41484 80051484 00110200 */  sll        $v0, $v0, 4
    /* 41488 80051488 23105000 */  subu       $v0, $v0, $s0
    /* 4148C 8005148C 80100200 */  sll        $v0, $v0, 2
    /* 41490 80051490 21105000 */  addu       $v0, $v0, $s0
    /* 41494 80051494 C0100200 */  sll        $v0, $v0, 3
    /* 41498 80051498 02002496 */  lhu        $a0, 0x2($s1)
    /* 4149C 8005149C 06002596 */  lhu        $a1, 0x6($s1)
    /* 414A0 800514A0 04002696 */  lhu        $a2, 0x4($s1)
    /* 414A4 800514A4 0E80013C */  lui        $at, %hi(plr + 0x61)
    /* 414A8 800514A8 21082200 */  addu       $at, $at, $v0
    /* 414AC 800514AC 99A52790 */  lbu        $a3, %lo(plr + 0x61)($at)
    /* 414B0 800514B0 19000324 */  addiu      $v1, $zero, 0x19
    /* 414B4 800514B4 0E80013C */  lui        $at, %hi(plr + 0x1E)
    /* 414B8 800514B8 21082200 */  addu       $at, $at, $v0
    /* 414BC 800514BC 56A523A0 */  sb         $v1, %lo(plr + 0x1E)($at)
    /* 414C0 800514C0 02000324 */  addiu      $v1, $zero, 0x2
    /* 414C4 800514C4 0E80013C */  lui        $at, %hi(plr + 0x5F)
    /* 414C8 800514C8 21082200 */  addu       $at, $at, $v0
    /* 414CC 800514CC 97A523A0 */  sb         $v1, %lo(plr + 0x5F)($at)
    /* 414D0 800514D0 0E80013C */  lui        $at, %hi(plr + 0x1F)
    /* 414D4 800514D4 21082200 */  addu       $at, $at, $v0
    /* 414D8 800514D8 57A524A0 */  sb         $a0, %lo(plr + 0x1F)($at)
    /* 414DC 800514DC 0E80013C */  lui        $at, %hi(plr + 0x20)
    /* 414E0 800514E0 21082200 */  addu       $at, $at, $v0
    /* 414E4 800514E4 58A525A0 */  sb         $a1, %lo(plr + 0x20)($at)
    /* 414E8 800514E8 0E80013C */  lui        $at, %hi(plr + 0x5D)
    /* 414EC 800514EC 21082200 */  addu       $at, $at, $v0
    /* 414F0 800514F0 95A526A0 */  sb         $a2, %lo(plr + 0x5D)($at)
    /* 414F4 800514F4 0E80013C */  lui        $at, %hi(plr + 0x5E)
    /* 414F8 800514F8 21082200 */  addu       $at, $at, $v0
    /* 414FC 800514FC 96A527A0 */  sb         $a3, %lo(plr + 0x5E)($at)
    /* 41500 80051500 1800BF8F */  lw         $ra, 0x18($sp)
    /* 41504 80051504 1400B18F */  lw         $s1, 0x14($sp)
    /* 41508 80051508 1000B08F */  lw         $s0, 0x10($sp)
    /* 4150C 8005150C 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 41510 80051510 0800E003 */  jr         $ra
    /* 41514 80051514 00000000 */   nop
endlabel On_TSPELLPID__FPC4TCmdi
