.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching StartWalkStand__FP12PlayerStruct, 0x64

glabel StartWalkStand__FP12PlayerStruct
    /* 50E9C 80060E9C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 50EA0 80060EA0 1000B0AF */  sw         $s0, 0x10($sp)
    /* 50EA4 80060EA4 21808000 */  addu       $s0, $a0, $zero
    /* 50EA8 80060EA8 1400BFAF */  sw         $ra, 0x14($sp)
    /* 50EAC 80060EAC 677F010C */  jal        ismyplr__FP12PlayerStruct
    /* 50EB0 80060EB0 000000AE */   sw        $zero, 0x0($s0)
    /* 50EB4 80060EB4 0D004010 */  beqz       $v0, .L80060EEC
    /* 50EB8 80060EB8 00000000 */   nop
    /* 50EBC 80060EBC 0E80013C */  lui        $at, %hi(ScrollInfo)
    /* 50EC0 80060EC0 147920AC */  sw         $zero, %lo(ScrollInfo)($at)
    /* 50EC4 80060EC4 0E80013C */  lui        $at, %hi(ScrollInfo + 0x4)
    /* 50EC8 80060EC8 187920AC */  sw         $zero, %lo(ScrollInfo + 0x4)($at)
    /* 50ECC 80060ECC 0E80013C */  lui        $at, %hi(ScrollInfo + 0x10)
    /* 50ED0 80060ED0 247920AC */  sw         $zero, %lo(ScrollInfo + 0x10)($at)
    /* 50ED4 80060ED4 30000286 */  lh         $v0, 0x30($s0)
    /* 50ED8 80060ED8 32000386 */  lh         $v1, 0x32($s0)
    /* 50EDC 80060EDC 1280013C */  lui        $at, %hi(ViewX)
    /* 50EE0 80060EE0 14C122AC */  sw         $v0, %lo(ViewX)($at)
    /* 50EE4 80060EE4 1280013C */  lui        $at, %hi(ViewY)
    /* 50EE8 80060EE8 18C123AC */  sw         $v1, %lo(ViewY)($at)
  .L80060EEC:
    /* 50EEC 80060EEC 1400BF8F */  lw         $ra, 0x14($sp)
    /* 50EF0 80060EF0 1000B08F */  lw         $s0, 0x10($sp)
    /* 50EF4 80060EF4 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 50EF8 80060EF8 0800E003 */  jr         $ra
    /* 50EFC 80060EFC 00000000 */   nop
endlabel StartWalkStand__FP12PlayerStruct
