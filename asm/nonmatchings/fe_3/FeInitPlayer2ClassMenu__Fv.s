.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FeInitPlayer2ClassMenu__Fv, 0x14

glabel FeInitPlayer2ClassMenu__Fv
    /* 12F0 8013AEE8 1280023C */  lui        $v0, %hi(MemCardActive)
    /* 12F4 8013AEEC 60B1428C */  lw         $v0, %lo(MemCardActive)($v0)
    /* 12F8 8013AEF0 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 12FC 8013AEF4 1000BFAF */  sw         $ra, 0x10($sp)
    /* 1300 8013AEF8 AC0B80AF */  sw         $zero, %gp_rel(LoadedChar + 0x4)($gp)
endlabel FeInitPlayer2ClassMenu__Fv
