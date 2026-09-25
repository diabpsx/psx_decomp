.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddPlrExperience__Fiil, 0x4C

glabel AddPlrExperience__Fiil
    /* 56EBC 80066EBC E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 56EC0 80066EC0 1000BFAF */  sw         $ra, 0x10($sp)
    /* 56EC4 80066EC4 40100400 */  sll        $v0, $a0, 1
    /* 56EC8 80066EC8 21104400 */  addu       $v0, $v0, $a0
    /* 56ECC 80066ECC 80100200 */  sll        $v0, $v0, 2
    /* 56ED0 80066ED0 21104400 */  addu       $v0, $v0, $a0
    /* 56ED4 80066ED4 00110200 */  sll        $v0, $v0, 4
    /* 56ED8 80066ED8 23104400 */  subu       $v0, $v0, $a0
    /* 56EDC 80066EDC 80100200 */  sll        $v0, $v0, 2
    /* 56EE0 80066EE0 21104400 */  addu       $v0, $v0, $a0
    /* 56EE4 80066EE4 C0100200 */  sll        $v0, $v0, 3
    /* 56EE8 80066EE8 0E80043C */  lui        $a0, %hi(plr)
    /* 56EEC 80066EEC 38A58424 */  addiu      $a0, $a0, %lo(plr)
    /* 56EF0 80066EF0 9F81010C */  jal        AddPlrExperience__FP12PlayerStructil
    /* 56EF4 80066EF4 21204400 */   addu      $a0, $v0, $a0
    /* 56EF8 80066EF8 1000BF8F */  lw         $ra, 0x10($sp)
    /* 56EFC 80066EFC 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 56F00 80066F00 0800E003 */  jr         $ra
    /* 56F04 80066F04 00000000 */   nop
endlabel AddPlrExperience__Fiil
