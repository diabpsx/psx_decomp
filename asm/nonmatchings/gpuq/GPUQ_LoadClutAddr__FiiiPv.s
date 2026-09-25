.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GPUQ_LoadClutAddr__FiiiPv, 0x9C

glabel GPUQ_LoadClutAddr__FiiiPv
    /* 736B8 800836B8 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 736BC 800836BC 1000B0AF */  sw         $s0, 0x10($sp)
    /* 736C0 800836C0 21808000 */  addu       $s0, $a0, $zero
    /* 736C4 800836C4 1400B1AF */  sw         $s1, 0x14($sp)
    /* 736C8 800836C8 2188A000 */  addu       $s1, $a1, $zero
    /* 736CC 800836CC 1800B2AF */  sw         $s2, 0x18($sp)
    /* 736D0 800836D0 2190C000 */  addu       $s2, $a2, $zero
    /* 736D4 800836D4 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 736D8 800836D8 2000BFAF */  sw         $ra, 0x20($sp)
    /* 736DC 800836DC EC0C020C */  jal        CheckMaxArgs__Fv
    /* 736E0 800836E0 2198E000 */   addu      $s3, $a3, $zero
    /* 736E4 800836E4 2403848F */  lw         $a0, %gp_rel(ArgsSoFar)($gp)
    /* 736E8 800836E8 0B80023C */  lui        $v0, %hi(AllArgs)
    /* 736EC 800836EC D8754224 */  addiu      $v0, $v0, %lo(AllArgs)
    /* 736F0 800836F0 C0180400 */  sll        $v1, $a0, 3
    /* 736F4 800836F4 23186400 */  subu       $v1, $v1, $a0
    /* 736F8 800836F8 80180300 */  sll        $v1, $v1, 2
    /* 736FC 800836FC 21186200 */  addu       $v1, $v1, $v0
    /* 73700 80083700 01000224 */  addiu      $v0, $zero, 0x1
    /* 73704 80083704 060062A4 */  sh         $v0, 0x6($v1)
    /* 73708 80083708 0800628C */  lw         $v0, 0x8($v1)
    /* 7370C 8008370C 01008424 */  addiu      $a0, $a0, 0x1
    /* 73710 80083710 240384AF */  sw         $a0, %gp_rel(ArgsSoFar)($gp)
    /* 73714 80083714 FBFF0424 */  addiu      $a0, $zero, -0x5
    /* 73718 80083718 000070A4 */  sh         $s0, 0x0($v1)
    /* 7371C 8008371C 020071A4 */  sh         $s1, 0x2($v1)
    /* 73720 80083720 040072A4 */  sh         $s2, 0x4($v1)
    /* 73724 80083724 140073AC */  sw         $s3, 0x14($v1)
    /* 73728 80083728 24104400 */  and        $v0, $v0, $a0
    /* 7372C 8008372C 01004234 */  ori        $v0, $v0, 0x1
    /* 73730 80083730 080062AC */  sw         $v0, 0x8($v1)
    /* 73734 80083734 2000BF8F */  lw         $ra, 0x20($sp)
    /* 73738 80083738 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 7373C 8008373C 1800B28F */  lw         $s2, 0x18($sp)
    /* 73740 80083740 1400B18F */  lw         $s1, 0x14($sp)
    /* 73744 80083744 1000B08F */  lw         $s0, 0x10($sp)
    /* 73748 80083748 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 7374C 8008374C 0800E003 */  jr         $ra
    /* 73750 80083750 00000000 */   nop
endlabel GPUQ_LoadClutAddr__FiiiPv
