.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetODE, 0x30

glabel GetODE
    /* 4710 80014710 0B80023C */  lui        $v0, %hi(D_800B54A4)
    /* 4714 80014714 A454428C */  lw         $v0, %lo(D_800B54A4)($v0)
    /* 4718 80014718 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 471C 8001471C 1000BFAF */  sw         $ra, 0x10($sp)
    /* 4720 80014720 3800428C */  lw         $v0, 0x38($v0)
    /* 4724 80014724 00000000 */  nop
    /* 4728 80014728 09F84000 */  jalr       $v0
    /* 472C 8001472C 00000000 */   nop
    /* 4730 80014730 1000BF8F */  lw         $ra, 0x10($sp)
    /* 4734 80014734 C2170200 */  srl        $v0, $v0, 31
    /* 4738 80014738 0800E003 */  jr         $ra
    /* 473C 8001473C 1800BD27 */   addiu     $sp, $sp, 0x18
endlabel GetODE
