.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PM_ChangeLightOff__Fi, 0x4C

glabel PM_ChangeLightOff__Fi
    /* 57040 80067040 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 57044 80067044 1000BFAF */  sw         $ra, 0x10($sp)
    /* 57048 80067048 40100400 */  sll        $v0, $a0, 1
    /* 5704C 8006704C 21104400 */  addu       $v0, $v0, $a0
    /* 57050 80067050 80100200 */  sll        $v0, $v0, 2
    /* 57054 80067054 21104400 */  addu       $v0, $v0, $a0
    /* 57058 80067058 00110200 */  sll        $v0, $v0, 4
    /* 5705C 8006705C 23104400 */  subu       $v0, $v0, $a0
    /* 57060 80067060 80100200 */  sll        $v0, $v0, 2
    /* 57064 80067064 21104400 */  addu       $v0, $v0, $a0
    /* 57068 80067068 C0100200 */  sll        $v0, $v0, 3
    /* 5706C 8006706C 0E80043C */  lui        $a0, %hi(plr)
    /* 57070 80067070 38A58424 */  addiu      $a0, $a0, %lo(plr)
    /* 57074 80067074 C083010C */  jal        PM_ChangeLightOff__FP12PlayerStruct
    /* 57078 80067078 21204400 */   addu      $a0, $v0, $a0
    /* 5707C 8006707C 1000BF8F */  lw         $ra, 0x10($sp)
    /* 57080 80067080 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 57084 80067084 0800E003 */  jr         $ra
    /* 57088 80067088 00000000 */   nop
endlabel PM_ChangeLightOff__Fi
