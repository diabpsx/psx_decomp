.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SyncInitPlr__Fi, 0x4C

glabel SyncInitPlr__Fi
    /* 572A0 800672A0 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 572A4 800672A4 1000BFAF */  sw         $ra, 0x10($sp)
    /* 572A8 800672A8 40100400 */  sll        $v0, $a0, 1
    /* 572AC 800672AC 21104400 */  addu       $v0, $v0, $a0
    /* 572B0 800672B0 80100200 */  sll        $v0, $v0, 2
    /* 572B4 800672B4 21104400 */  addu       $v0, $v0, $a0
    /* 572B8 800672B8 00110200 */  sll        $v0, $v0, 4
    /* 572BC 800672BC 23104400 */  subu       $v0, $v0, $a0
    /* 572C0 800672C0 80100200 */  sll        $v0, $v0, 2
    /* 572C4 800672C4 21104400 */  addu       $v0, $v0, $a0
    /* 572C8 800672C8 C0100200 */  sll        $v0, $v0, 3
    /* 572CC 800672CC 0E80043C */  lui        $a0, %hi(plr)
    /* 572D0 800672D0 38A58424 */  addiu      $a0, $a0, %lo(plr)
    /* 572D4 800672D4 E796010C */  jal        SyncInitPlr__FP12PlayerStruct
    /* 572D8 800672D8 21204400 */   addu      $a0, $v0, $a0
    /* 572DC 800672DC 1000BF8F */  lw         $ra, 0x10($sp)
    /* 572E0 800672E0 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 572E4 800672E4 0800E003 */  jr         $ra
    /* 572E8 800672E8 00000000 */   nop
endlabel SyncInitPlr__Fi
