.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching TargetingSpell__Fi, 0x48

glabel TargetingSpell__Fi
    /* 917D4 800A17D4 07000224 */  addiu      $v0, $zero, 0x7
    /* 917D8 800A17D8 0D008210 */  beq        $a0, $v0, .L800A1810
    /* 917DC 800A17DC 0D000224 */   addiu     $v0, $zero, 0xD
    /* 917E0 800A17E0 0B008210 */  beq        $a0, $v0, .L800A1810
    /* 917E4 800A17E4 17000224 */   addiu     $v0, $zero, 0x17
    /* 917E8 800A17E8 09008210 */  beq        $a0, $v0, .L800A1810
    /* 917EC 800A17EC 15000224 */   addiu     $v0, $zero, 0x15
    /* 917F0 800A17F0 07008210 */  beq        $a0, $v0, .L800A1810
    /* 917F4 800A17F4 21000224 */   addiu     $v0, $zero, 0x21
    /* 917F8 800A17F8 05008210 */  beq        $a0, $v0, .L800A1810
    /* 917FC 800A17FC 08000224 */   addiu     $v0, $zero, 0x8
    /* 91800 800A1800 03008210 */  beq        $a0, $v0, .L800A1810
    /* 91804 800A1804 06000224 */   addiu     $v0, $zero, 0x6
    /* 91808 800A1808 02008214 */  bne        $a0, $v0, .L800A1814
    /* 9180C 800A180C 21100000 */   addu      $v0, $zero, $zero
  .L800A1810:
    /* 91810 800A1810 01000224 */  addiu      $v0, $zero, 0x1
  .L800A1814:
    /* 91814 800A1814 0800E003 */  jr         $ra
    /* 91818 800A1818 00000000 */   nop
endlabel TargetingSpell__Fi
