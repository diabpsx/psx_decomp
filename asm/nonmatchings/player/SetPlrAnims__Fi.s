.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetPlrAnims__Fi, 0x4C

glabel SetPlrAnims__Fi
    /* 57208 80067208 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 5720C 8006720C 1000BFAF */  sw         $ra, 0x10($sp)
    /* 57210 80067210 40100400 */  sll        $v0, $a0, 1
    /* 57214 80067214 21104400 */  addu       $v0, $v0, $a0
    /* 57218 80067218 80100200 */  sll        $v0, $v0, 2
    /* 5721C 8006721C 21104400 */  addu       $v0, $v0, $a0
    /* 57220 80067220 00110200 */  sll        $v0, $v0, 4
    /* 57224 80067224 23104400 */  subu       $v0, $v0, $a0
    /* 57228 80067228 80100200 */  sll        $v0, $v0, 2
    /* 5722C 8006722C 21104400 */  addu       $v0, $v0, $a0
    /* 57230 80067230 C0100200 */  sll        $v0, $v0, 3
    /* 57234 80067234 0E80043C */  lui        $a0, %hi(plr)
    /* 57238 80067238 38A58424 */  addiu      $a0, $a0, %lo(plr)
    /* 5723C 8006723C 957F010C */  jal        SetPlrAnims__FP12PlayerStruct
    /* 57240 80067240 21204400 */   addu      $a0, $v0, $a0
    /* 57244 80067244 1000BF8F */  lw         $ra, 0x10($sp)
    /* 57248 80067248 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 5724C 8006724C 0800E003 */  jr         $ra
    /* 57250 80067250 00000000 */   nop
endlabel SetPlrAnims__Fi
