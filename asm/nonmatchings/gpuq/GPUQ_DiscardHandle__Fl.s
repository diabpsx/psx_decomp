.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GPUQ_DiscardHandle__Fl, 0xA0

glabel GPUQ_DiscardHandle__Fl
    /* 73618 80083618 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 7361C 8008361C 2403828F */  lw         $v0, %gp_rel(ArgsSoFar)($gp)
    /* 73620 80083620 21300000 */  addu       $a2, $zero, $zero
    /* 73624 80083624 17004018 */  blez       $v0, .L80083684
    /* 73628 80083628 1800BFAF */   sw        $ra, 0x18($sp)
    /* 7362C 8008362C 21404000 */  addu       $t0, $v0, $zero
    /* 73630 80083630 0B80053C */  lui        $a1, %hi(AllArgs + 0x8)
    /* 73634 80083634 E075A524 */  addiu      $a1, $a1, %lo(AllArgs + 0x8)
    /* 73638 80083638 21380000 */  addu       $a3, $zero, $zero
  .L8008363C:
    /* 7363C 8008363C 0000A38C */  lw         $v1, 0x0($a1)
    /* 73640 80083640 00000000 */  nop
    /* 73644 80083644 01006230 */  andi       $v0, $v1, 0x1
    /* 73648 80083648 09004014 */  bnez       $v0, .L80083670
    /* 7364C 8008364C 00000000 */   nop
    /* 73650 80083650 0B80013C */  lui        $at, %hi(AllArgs + 0x10)
    /* 73654 80083654 21082700 */  addu       $at, $at, $a3
    /* 73658 80083658 E875228C */  lw         $v0, %lo(AllArgs + 0x10)($at)
    /* 7365C 8008365C 00000000 */  nop
    /* 73660 80083660 03004414 */  bne        $v0, $a0, .L80083670
    /* 73664 80083664 02006234 */   ori       $v0, $v1, 0x2
    /* 73668 80083668 AA0D0208 */  j          .L800836A8
    /* 7366C 8008366C 0000A2AC */   sw        $v0, 0x0($a1)
  .L80083670:
    /* 73670 80083670 1C00A524 */  addiu      $a1, $a1, 0x1C
    /* 73674 80083674 0100C624 */  addiu      $a2, $a2, 0x1
    /* 73678 80083678 2A10C800 */  slt        $v0, $a2, $t0
    /* 7367C 8008367C EFFF4014 */  bnez       $v0, .L8008363C
    /* 73680 80083680 1C00E724 */   addiu     $a3, $a3, 0x1C
  .L80083684:
    /* 73684 80083684 1886000C */  jal        GAL_Free
    /* 73688 80083688 00000000 */   nop
    /* 7368C 8008368C FF004230 */  andi       $v0, $v0, 0xFF
    /* 73690 80083690 05004014 */  bnez       $v0, .L800836A8
    /* 73694 80083694 21200000 */   addu      $a0, $zero, $zero
    /* 73698 80083698 1180053C */  lui        $a1, %hi(D_8010FFB4)
    /* 7369C 8008369C B4FFA524 */  addiu      $a1, $a1, %lo(D_8010FFB4)
    /* 736A0 800836A0 A583000C */  jal        DBG_Error
    /* 736A4 800836A4 EE000624 */   addiu     $a2, $zero, 0xEE
  .L800836A8:
    /* 736A8 800836A8 1800BF8F */  lw         $ra, 0x18($sp)
    /* 736AC 800836AC 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 736B0 800836B0 0800E003 */  jr         $ra
    /* 736B4 800836B4 00000000 */   nop
endlabel GPUQ_DiscardHandle__Fl
