.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DeactivatePortal__Fi, 0x20

glabel DeactivatePortal__Fi
    /* 711C8 800811C8 40100400 */  sll        $v0, $a0, 1
    /* 711CC 800811CC 21104400 */  addu       $v0, $v0, $a0
    /* 711D0 800811D0 80100200 */  sll        $v0, $v0, 2
    /* 711D4 800811D4 0E80013C */  lui        $at, %hi(portal + 0x8)
    /* 711D8 800811D8 21082200 */  addu       $at, $at, $v0
    /* 711DC 800811DC F43B20A0 */  sb         $zero, %lo(portal + 0x8)($at)
    /* 711E0 800811E0 0800E003 */  jr         $ra
    /* 711E4 800811E4 00000000 */   nop
endlabel DeactivatePortal__Fi
