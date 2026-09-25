.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetPriority, 0x28

glabel SetPriority
    /* 4838 80014838 02000224 */  addiu      $v0, $zero, 0x2
    /* 483C 8001483C 030082A0 */  sb         $v0, 0x3($a0)
    /* 4840 80014840 0200A010 */  beqz       $a1, .L8001484C
    /* 4844 80014844 00E6033C */   lui       $v1, (0xE6000002 >> 16)
    /* 4848 80014848 02006334 */  ori        $v1, $v1, (0xE6000002 & 0xFFFF)
  .L8001484C:
    /* 484C 8001484C 2B100600 */  sltu       $v0, $zero, $a2
    /* 4850 80014850 25106200 */  or         $v0, $v1, $v0
    /* 4854 80014854 040082AC */  sw         $v0, 0x4($a0)
    /* 4858 80014858 0800E003 */  jr         $ra
    /* 485C 8001485C 080080AC */   sw        $zero, 0x8($a0)
endlabel SetPriority
