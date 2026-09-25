.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching defaultstreamspeed, 0x18

glabel defaultstreamspeed
    /* 1CF08 8002CF08 DA000224 */  addiu      $v0, $zero, 0xDA
    /* 1CF0C 8002CF0C 681D82AF */  sw         $v0, %gp_rel(cdspeed)($gp)
    /* 1CF10 8002CF10 2C010224 */  addiu      $v0, $zero, 0x12C
    /* 1CF14 8002CF14 6C1D82AF */  sw         $v0, %gp_rel(seekticks)($gp)
    /* 1CF18 8002CF18 0800E003 */  jr         $ra
    /* 1CF1C 8002CF1C 00000000 */   nop
endlabel defaultstreamspeed
