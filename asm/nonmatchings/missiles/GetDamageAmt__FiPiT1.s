.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetDamageAmt__FiPiT1, 0x20

glabel GetDamageAmt__FiPiT1
    /* C 80139C04 2138A000 */  addu       $a3, $a1, $zero
    /* 10 80139C08 1280033C */  lui        $v1, %hi(myplr)
    /* 14 80139C0C 08BA638C */  lw         $v1, %lo(myplr)($v1)
    /* 18 80139C10 0E80053C */  lui        $a1, %hi(plr)
    /* 1C 80139C14 38A5A524 */  addiu      $a1, $a1, %lo(plr)
    /* 20 80139C18 40100300 */  sll        $v0, $v1, 1
    /* 24 80139C1C 21104300 */  addu       $v0, $v0, $v1
    /* 28 80139C20 80100200 */  sll        $v0, $v0, 2
endlabel GetDamageAmt__FiPiT1
