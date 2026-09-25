.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching data_ready_callback, 0x8C

glabel data_ready_callback
    /* DD7C 8001DD7C 1480023C */  lui        $v0, %hi(StRingIdx2)
    /* DD80 8001DD80 BC9B428C */  lw         $v0, %lo(StRingIdx2)($v0)
    /* DD84 8001DD84 1480033C */  lui        $v1, %hi(StRingAddr)
    /* DD88 8001DD88 D89B638C */  lw         $v1, %lo(StRingAddr)($v1)
    /* DD8C 8001DD8C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* DD90 8001DD90 1000BFAF */  sw         $ra, 0x10($sp)
    /* DD94 8001DD94 40110200 */  sll        $v0, $v0, 5
    /* DD98 8001DD98 21186200 */  addu       $v1, $v1, $v0
    /* DD9C 8001DD9C 02000224 */  addiu      $v0, $zero, 0x2
    /* DDA0 8001DDA0 000062A4 */  sh         $v0, 0x0($v1)
    /* DDA4 8001DDA4 1380063C */  lui        $a2, %hi(D_80132570)
    /* DDA8 8001DDA8 7025C624 */  addiu      $a2, $a2, %lo(D_80132570)
    /* DDAC 8001DDAC 1F006288 */  lwl        $v0, 0x1F($v1)
    /* DDB0 8001DDB0 1C006298 */  lwr        $v0, 0x1C($v1)
    /* DDB4 8001DDB4 00000000 */  nop
    /* DDB8 8001DDB8 0300C2A8 */  swl        $v0, 0x3($a2)
    /* DDBC 8001DDBC 0000C2B8 */  swr        $v0, 0x0($a2)
    /* DDC0 8001DDC0 0800628C */  lw         $v0, 0x8($v1)
    /* DDC4 8001DDC4 1480033C */  lui        $v1, %hi(StRingIdx1)
    /* DDC8 8001DDC8 B89B638C */  lw         $v1, %lo(StRingIdx1)($v1)
    /* DDCC 8001DDCC 1380043C */  lui        $a0, %hi(StFunc1)
    /* DDD0 8001DDD0 DC51848C */  lw         $a0, %lo(StFunc1)($a0)
    /* DDD4 8001DDD4 1380013C */  lui        $at, %hi(D_80132574)
    /* DDD8 8001DDD8 742522AC */  sw         $v0, %lo(D_80132574)($at)
    /* DDDC 8001DDDC 1480013C */  lui        $at, %hi(StRingIdx2)
    /* DDE0 8001DDE0 03008010 */  beqz       $a0, .L8001DDF0
    /* DDE4 8001DDE4 BC9B23AC */   sw        $v1, %lo(StRingIdx2)($at)
    /* DDE8 8001DDE8 09F88000 */  jalr       $a0
    /* DDEC 8001DDEC 00000000 */   nop
  .L8001DDF0:
    /* DDF0 8001DDF0 1380013C */  lui        $at, %hi(StFinalSector)
    /* DDF4 8001DDF4 287220AC */  sw         $zero, %lo(StFinalSector)($at)
    /* DDF8 8001DDF8 1000BF8F */  lw         $ra, 0x10($sp)
    /* DDFC 8001DDFC 1800BD27 */  addiu      $sp, $sp, 0x18
    /* DE00 8001DE00 0800E003 */  jr         $ra
    /* DE04 8001DE04 00000000 */   nop
endlabel data_ready_callback
