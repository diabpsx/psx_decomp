.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FeInitBuffer__Fv, 0x2C

glabel FeInitBuffer__Fv
    /* 2C 80139C24 68070224 */  addiu      $v0, $zero, 0x768
  .L80139C28:
    /* 30 80139C28 0D80013C */  lui        $at, %hi(FeBuffer + 0x14)
    /* 34 80139C2C 21082200 */  addu       $at, $at, $v0
    /* 38 80139C30 8CDB20AC */  sw         $zero, %lo(FeBuffer + 0x14)($at)
    /* 3C 80139C34 E8FF4224 */  addiu      $v0, $v0, -0x18
    /* 40 80139C38 FBFF4104 */  bgez       $v0, .L80139C28
    /* 44 80139C3C 00000000 */   nop
    /* 48 80139C40 000C80AF */  sw         $zero, %gp_rel(FeMaxBufferCount)($gp)
    /* 4C 80139C44 FC0B80AF */  sw         $zero, %gp_rel(FeBufferCount)($gp)
    /* 50 80139C48 0800E003 */  jr         $ra
    /* 54 80139C4C 00000000 */   nop
endlabel FeInitBuffer__Fv
