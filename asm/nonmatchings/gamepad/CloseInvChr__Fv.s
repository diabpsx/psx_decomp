.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CloseInvChr__Fv, 0x48

glabel CloseInvChr__Fv
    /* 683F8 800783F8 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 683FC 800783FC FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 68400 80078400 1000BFAF */  sw         $ra, 0x10($sp)
    /* 68404 80078404 1280013C */  lui        $at, %hi(chrflag)
    /* 68408 80078408 C0B620A0 */  sb         $zero, %lo(chrflag)($at)
    /* 6840C 8007840C 1280013C */  lui        $at, %hi(options_pad)
    /* 68410 80078410 50B222AC */  sw         $v0, %lo(options_pad)($at)
    /* 68414 80078414 C6F5000C */  jal        PlaySFX__Fi
    /* 68418 80078418 33000424 */   addiu     $a0, $zero, 0x33
    /* 6841C 8007841C 05000424 */  addiu      $a0, $zero, 0x5
    /* 68420 80078420 21280000 */  addu       $a1, $zero, $zero
    /* 68424 80078424 21300000 */  addu       $a2, $zero, $zero
    /* 68428 80078428 53EB010C */  jal        PostGamePad__Fiiii
    /* 6842C 8007842C 21380000 */   addu      $a3, $zero, $zero
    /* 68430 80078430 1000BF8F */  lw         $ra, 0x10($sp)
    /* 68434 80078434 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 68438 80078438 0800E003 */  jr         $ra
    /* 6843C 8007843C 00000000 */   nop
endlabel CloseInvChr__Fv
