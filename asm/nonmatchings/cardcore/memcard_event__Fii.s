.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching memcard_event__Fii, 0x38

glabel memcard_event__Fii
    /* 9523C 800A523C 780A84AF */  sw         $a0, %gp_rel(card_event)($gp)
    /* 95240 800A5240 0800822C */  sltiu      $v0, $a0, 0x8
    /* 95244 800A5244 09004010 */  beqz       $v0, .L800A526C
    /* 95248 800A5248 80100400 */   sll       $v0, $a0, 2
    /* 9524C 800A524C 1180013C */  lui        $at, %hi(jtbl_80110CD0)
    /* 95250 800A5250 21082200 */  addu       $at, $at, $v0
    /* 95254 800A5254 D00C228C */  lw         $v0, %lo(jtbl_80110CD0)($at)
    /* 95258 800A5258 00000000 */  nop
    /* 9525C 800A525C 08004000 */  jr         $v0
    /* 95260 800A5260 00000000 */   nop
  jlabel .L800A5264
    /* 95264 800A5264 1280013C */  lui        $at, %hi(CharacterBlockLoaded)
    /* 95268 800A5268 40B220AC */  sw         $zero, %lo(CharacterBlockLoaded)($at)
  jlabel .L800A526C
    /* 9526C 800A526C 0800E003 */  jr         $ra
    /* 95270 800A5270 00000000 */   nop
endlabel memcard_event__Fii
