.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ReturnToSchedulerIfCurrentTask, 0x88

glabel ReturnToSchedulerIfCurrentTask
    /* 10494 80020494 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 10498 80020498 1000B0AF */  sw         $s0, 0x10($sp)
    /* 1049C 8002049C 1400BFAF */  sw         $ra, 0x14($sp)
    /* 104A0 800204A0 6A81000C */  jal        TSK_IsStackCorrupted
    /* 104A4 800204A4 21808000 */   addu      $s0, $a0, $zero
    /* 104A8 800204A8 FF004230 */  andi       $v0, $v0, 0xFF
    /* 104AC 800204AC 12004010 */  beqz       $v0, .L800204F8
    /* 104B0 800204B0 00000000 */   nop
    /* 104B4 800204B4 1280023C */  lui        $v0, %hi(D_8011C9C0)
    /* 104B8 800204B8 C0C9428C */  lw         $v0, %lo(D_8011C9C0)($v0)
    /* 104BC 800204BC 00000000 */  nop
    /* 104C0 800204C0 05004010 */  beqz       $v0, .L800204D8
    /* 104C4 800204C4 00000000 */   nop
    /* 104C8 800204C8 09F84000 */  jalr       $v0
    /* 104CC 800204CC 21200002 */   addu      $a0, $s0, $zero
    /* 104D0 800204D0 3E810008 */  j          .L800204F8
    /* 104D4 800204D4 00000000 */   nop
  .L800204D8:
    /* 104D8 800204D8 1180023C */  lui        $v0, %hi(D_8010E740)
    /* 104DC 800204DC 40E74224 */  addiu      $v0, $v0, %lo(D_8010E740)
    /* 104E0 800204E0 05004010 */  beqz       $v0, .L800204F8
    /* 104E4 800204E4 21200000 */   addu      $a0, $zero, $zero
    /* 104E8 800204E8 1180053C */  lui        $a1, %hi(D_8010E730)
    /* 104EC 800204EC 30E7A524 */  addiu      $a1, $a1, %lo(D_8010E730)
    /* 104F0 800204F0 A583000C */  jal        DBG_Error
    /* 104F4 800204F4 47010634 */   ori       $a2, $zero, 0x147
  .L800204F8:
    /* 104F8 800204F8 1380043C */  lui        $a0, %hi(D_801325A0)
    /* 104FC 800204FC A0258424 */  addiu      $a0, $a0, %lo(D_801325A0)
    /* 10500 80020500 CD40000C */  jal        longjmp
    /* 10504 80020504 01000534 */   ori       $a1, $zero, 0x1
    /* 10508 80020508 1400BF8F */  lw         $ra, 0x14($sp)
    /* 1050C 8002050C 1000B08F */  lw         $s0, 0x10($sp)
    /* 10510 80020510 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 10514 80020514 0800E003 */  jr         $ra
    /* 10518 80020518 00000000 */   nop
endlabel ReturnToSchedulerIfCurrentTask
