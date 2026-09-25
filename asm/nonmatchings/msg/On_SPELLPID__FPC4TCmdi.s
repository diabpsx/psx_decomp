.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching On_SPELLPID__FPC4TCmdi, 0xC0

glabel On_SPELLPID__FPC4TCmdi
    /* 412D0 800512D0 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 412D4 800512D4 1400B1AF */  sw         $s1, 0x14($sp)
    /* 412D8 800512D8 21888000 */  addu       $s1, $a0, $zero
    /* 412DC 800512DC 1000B0AF */  sw         $s0, 0x10($sp)
    /* 412E0 800512E0 2180A000 */  addu       $s0, $a1, $zero
    /* 412E4 800512E4 1800BFAF */  sw         $ra, 0x18($sp)
    /* 412E8 800512E8 959C010C */  jal        ClrPlrPath__Fi
    /* 412EC 800512EC 21200002 */   addu      $a0, $s0, $zero
    /* 412F0 800512F0 40101000 */  sll        $v0, $s0, 1
    /* 412F4 800512F4 21105000 */  addu       $v0, $v0, $s0
    /* 412F8 800512F8 80100200 */  sll        $v0, $v0, 2
    /* 412FC 800512FC 21105000 */  addu       $v0, $v0, $s0
    /* 41300 80051300 00110200 */  sll        $v0, $v0, 4
    /* 41304 80051304 23105000 */  subu       $v0, $v0, $s0
    /* 41308 80051308 80100200 */  sll        $v0, $v0, 2
    /* 4130C 8005130C 21105000 */  addu       $v0, $v0, $s0
    /* 41310 80051310 C0100200 */  sll        $v0, $v0, 3
    /* 41314 80051314 02002496 */  lhu        $a0, 0x2($s1)
    /* 41318 80051318 06002596 */  lhu        $a1, 0x6($s1)
    /* 4131C 8005131C 04002696 */  lhu        $a2, 0x4($s1)
    /* 41320 80051320 0E80013C */  lui        $at, %hi(plr + 0x68)
    /* 41324 80051324 21082200 */  addu       $at, $at, $v0
    /* 41328 80051328 A0A52790 */  lbu        $a3, %lo(plr + 0x68)($at)
    /* 4132C 8005132C 19000324 */  addiu      $v1, $zero, 0x19
    /* 41330 80051330 0E80013C */  lui        $at, %hi(plr + 0x1E)
    /* 41334 80051334 21082200 */  addu       $at, $at, $v0
    /* 41338 80051338 56A523A0 */  sb         $v1, %lo(plr + 0x1E)($at)
    /* 4133C 8005133C 0E80013C */  lui        $at, %hi(plr + 0x5F)
    /* 41340 80051340 21082200 */  addu       $at, $at, $v0
    /* 41344 80051344 97A520A0 */  sb         $zero, %lo(plr + 0x5F)($at)
    /* 41348 80051348 0E80013C */  lui        $at, %hi(plr + 0x1F)
    /* 4134C 8005134C 21082200 */  addu       $at, $at, $v0
    /* 41350 80051350 57A524A0 */  sb         $a0, %lo(plr + 0x1F)($at)
    /* 41354 80051354 0E80013C */  lui        $at, %hi(plr + 0x20)
    /* 41358 80051358 21082200 */  addu       $at, $at, $v0
    /* 4135C 8005135C 58A525A0 */  sb         $a1, %lo(plr + 0x20)($at)
    /* 41360 80051360 0E80013C */  lui        $at, %hi(plr + 0x5D)
    /* 41364 80051364 21082200 */  addu       $at, $at, $v0
    /* 41368 80051368 95A526A0 */  sb         $a2, %lo(plr + 0x5D)($at)
    /* 4136C 8005136C 0E80013C */  lui        $at, %hi(plr + 0x5E)
    /* 41370 80051370 21082200 */  addu       $at, $at, $v0
    /* 41374 80051374 96A527A0 */  sb         $a3, %lo(plr + 0x5E)($at)
    /* 41378 80051378 1800BF8F */  lw         $ra, 0x18($sp)
    /* 4137C 8005137C 1400B18F */  lw         $s1, 0x14($sp)
    /* 41380 80051380 1000B08F */  lw         $s0, 0x10($sp)
    /* 41384 80051384 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 41388 80051388 0800E003 */  jr         $ra
    /* 4138C 8005138C 00000000 */   nop
endlabel On_SPELLPID__FPC4TCmdi
