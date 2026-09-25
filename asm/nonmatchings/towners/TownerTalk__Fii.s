.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching TownerTalk__Fii, 0x40

glabel TownerTalk__Fii
    /* 2B958 8003B958 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 2B95C 8003B95C 1280033C */  lui        $v1, %hi(myplr)
    /* 2B960 8003B960 08BA638C */  lw         $v1, %lo(myplr)($v1)
    /* 2B964 8003B964 01000224 */  addiu      $v0, $zero, 0x1
    /* 2B968 8003B968 1000BFAF */  sw         $ra, 0x10($sp)
    /* 2B96C 8003B96C 3C2080AF */  sw         $zero, %gp_rel(D_8011C7BC)($gp)
    /* 2B970 8003B970 402080AF */  sw         $zero, %gp_rel(D_8011C7C0)($gp)
    /* 2B974 8003B974 A01082A3 */  sb         $v0, %gp_rel(storeflag)($gp)
    /* 2B978 8003B978 1280013C */  lui        $at, %hi(options_pad)
    /* 2B97C 8003B97C 50B223AC */  sw         $v1, %lo(options_pad)($at)
    /* 2B980 8003B980 1E37010C */  jal        InitQTextMsg__Fi
    /* 2B984 8003B984 00000000 */   nop
    /* 2B988 8003B988 1000BF8F */  lw         $ra, 0x10($sp)
    /* 2B98C 8003B98C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 2B990 8003B990 0800E003 */  jr         $ra
    /* 2B994 8003B994 00000000 */   nop
endlabel TownerTalk__Fii
