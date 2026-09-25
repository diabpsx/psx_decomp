.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddToList, 0x20

glabel AddToList
    /* 109A8 800209A8 0400A0AC */  sw         $zero, 0x4($a1)
    /* 109AC 800209AC 0000828C */  lw         $v0, 0x0($a0)
    /* 109B0 800209B0 00000000 */  nop
    /* 109B4 800209B4 02004010 */  beqz       $v0, .L800209C0
    /* 109B8 800209B8 0000A2AC */   sw        $v0, 0x0($a1)
    /* 109BC 800209BC 040045AC */  sw         $a1, 0x4($v0)
  .L800209C0:
    /* 109C0 800209C0 0800E003 */  jr         $ra
    /* 109C4 800209C4 000085AC */   sw        $a1, 0x0($a0)
endlabel AddToList
