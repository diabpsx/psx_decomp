.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching On_SATTACKXY__FPC4TCmdi, 0x8C

glabel On_SATTACKXY__FPC4TCmdi
    /* 40B98 80050B98 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 40B9C 80050B9C 1400B1AF */  sw         $s1, 0x14($sp)
    /* 40BA0 80050BA0 21888000 */  addu       $s1, $a0, $zero
    /* 40BA4 80050BA4 1000B0AF */  sw         $s0, 0x10($sp)
    /* 40BA8 80050BA8 2180A000 */  addu       $s0, $a1, $zero
    /* 40BAC 80050BAC 1800BFAF */  sw         $ra, 0x18($sp)
    /* 40BB0 80050BB0 959C010C */  jal        ClrPlrPath__Fi
    /* 40BB4 80050BB4 21200002 */   addu      $a0, $s0, $zero
    /* 40BB8 80050BB8 40101000 */  sll        $v0, $s0, 1
    /* 40BBC 80050BBC 21105000 */  addu       $v0, $v0, $s0
    /* 40BC0 80050BC0 80100200 */  sll        $v0, $v0, 2
    /* 40BC4 80050BC4 21105000 */  addu       $v0, $v0, $s0
    /* 40BC8 80050BC8 00110200 */  sll        $v0, $v0, 4
    /* 40BCC 80050BCC 23105000 */  subu       $v0, $v0, $s0
    /* 40BD0 80050BD0 80100200 */  sll        $v0, $v0, 2
    /* 40BD4 80050BD4 21105000 */  addu       $v0, $v0, $s0
    /* 40BD8 80050BD8 C0100200 */  sll        $v0, $v0, 3
    /* 40BDC 80050BDC 01002492 */  lbu        $a0, 0x1($s1)
    /* 40BE0 80050BE0 02002592 */  lbu        $a1, 0x2($s1)
    /* 40BE4 80050BE4 09000324 */  addiu      $v1, $zero, 0x9
    /* 40BE8 80050BE8 0E80013C */  lui        $at, %hi(plr + 0x1E)
    /* 40BEC 80050BEC 21082200 */  addu       $at, $at, $v0
    /* 40BF0 80050BF0 56A523A0 */  sb         $v1, %lo(plr + 0x1E)($at)
    /* 40BF4 80050BF4 0E80013C */  lui        $at, %hi(plr + 0x1F)
    /* 40BF8 80050BF8 21082200 */  addu       $at, $at, $v0
    /* 40BFC 80050BFC 57A524A0 */  sb         $a0, %lo(plr + 0x1F)($at)
    /* 40C00 80050C00 0E80013C */  lui        $at, %hi(plr + 0x20)
    /* 40C04 80050C04 21082200 */  addu       $at, $at, $v0
    /* 40C08 80050C08 58A525A0 */  sb         $a1, %lo(plr + 0x20)($at)
    /* 40C0C 80050C0C 1800BF8F */  lw         $ra, 0x18($sp)
    /* 40C10 80050C10 1400B18F */  lw         $s1, 0x14($sp)
    /* 40C14 80050C14 1000B08F */  lw         $s0, 0x10($sp)
    /* 40C18 80050C18 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 40C1C 80050C1C 0800E003 */  jr         $ra
    /* 40C20 80050C20 00000000 */   nop
endlabel On_SATTACKXY__FPC4TCmdi
