.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching InitPlayerGFX__Fi, 0x4C

glabel InitPlayerGFX__Fi
    /* 57170 80067170 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 57174 80067174 1000BFAF */  sw         $ra, 0x10($sp)
    /* 57178 80067178 40100400 */  sll        $v0, $a0, 1
    /* 5717C 8006717C 21104400 */  addu       $v0, $v0, $a0
    /* 57180 80067180 80100200 */  sll        $v0, $v0, 2
    /* 57184 80067184 21104400 */  addu       $v0, $v0, $a0
    /* 57188 80067188 00110200 */  sll        $v0, $v0, 4
    /* 5718C 8006718C 23104400 */  subu       $v0, $v0, $a0
    /* 57190 80067190 80100200 */  sll        $v0, $v0, 2
    /* 57194 80067194 21104400 */  addu       $v0, $v0, $a0
    /* 57198 80067198 C0100200 */  sll        $v0, $v0, 3
    /* 5719C 8006719C 0E80043C */  lui        $a0, %hi(plr)
    /* 571A0 800671A0 38A58424 */  addiu      $a0, $a0, %lo(plr)
    /* 571A4 800671A4 7D7F010C */  jal        InitPlayerGFX__FP12PlayerStruct
    /* 571A8 800671A8 21204400 */   addu      $a0, $v0, $a0
    /* 571AC 800671AC 1000BF8F */  lw         $ra, 0x10($sp)
    /* 571B0 800671B0 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 571B4 800671B4 0800E003 */  jr         $ra
    /* 571B8 800671B8 00000000 */   nop
endlabel InitPlayerGFX__Fi
