.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ClrPlrPath__Fi, 0x4C

glabel ClrPlrPath__Fi
    /* 57254 80067254 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 57258 80067258 1000BFAF */  sw         $ra, 0x10($sp)
    /* 5725C 8006725C 40100400 */  sll        $v0, $a0, 1
    /* 57260 80067260 21104400 */  addu       $v0, $v0, $a0
    /* 57264 80067264 80100200 */  sll        $v0, $v0, 2
    /* 57268 80067268 21104400 */  addu       $v0, $v0, $a0
    /* 5726C 8006726C 00110200 */  sll        $v0, $v0, 4
    /* 57270 80067270 23104400 */  subu       $v0, $v0, $a0
    /* 57274 80067274 80100200 */  sll        $v0, $v0, 2
    /* 57278 80067278 21104400 */  addu       $v0, $v0, $a0
    /* 5727C 8006727C C0100200 */  sll        $v0, $v0, 3
    /* 57280 80067280 0E80043C */  lui        $a0, %hi(plr)
    /* 57284 80067284 38A58424 */  addiu      $a0, $a0, %lo(plr)
    /* 57288 80067288 1395010C */  jal        ClrPlrPath__FP12PlayerStruct
    /* 5728C 8006728C 21204400 */   addu      $a0, $v0, $a0
    /* 57290 80067290 1000BF8F */  lw         $ra, 0x10($sp)
    /* 57294 80067294 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 57298 80067298 0800E003 */  jr         $ra
    /* 5729C 8006729C 00000000 */   nop
endlabel ClrPlrPath__Fi
