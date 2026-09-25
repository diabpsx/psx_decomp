.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching init_ring_status, 0x34

glabel init_ring_status
    /* DF8C 8001DF8C 0A00A010 */  beqz       $a1, .L8001DFB8
    /* DF90 8001DF90 21300000 */   addu      $a2, $zero, $zero
  .L8001DF94:
    /* DF94 8001DF94 2110C400 */  addu       $v0, $a2, $a0
    /* DF98 8001DF98 0100C624 */  addiu      $a2, $a2, 0x1
    /* DF9C 8001DF9C 1480033C */  lui        $v1, %hi(StRingAddr)
    /* DFA0 8001DFA0 D89B638C */  lw         $v1, %lo(StRingAddr)($v1)
    /* DFA4 8001DFA4 40110200 */  sll        $v0, $v0, 5
    /* DFA8 8001DFA8 21186200 */  addu       $v1, $v1, $v0
    /* DFAC 8001DFAC 2B10C500 */  sltu       $v0, $a2, $a1
    /* DFB0 8001DFB0 F8FF4014 */  bnez       $v0, .L8001DF94
    /* DFB4 8001DFB4 000060AC */   sw        $zero, 0x0($v1)
  .L8001DFB8:
    /* DFB8 8001DFB8 0800E003 */  jr         $ra
    /* DFBC 8001DFBC 00000000 */   nop
endlabel init_ring_status
    /* DFC0 8001DFC0 00000000 */  nop
    /* DFC4 8001DFC4 00000000 */  nop
    /* DFC8 8001DFC8 00000000 */  nop
