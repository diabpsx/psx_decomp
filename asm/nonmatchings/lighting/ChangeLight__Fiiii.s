.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ChangeLight__Fiiii, 0x2C

glabel ChangeLight__Fiiii
    /* 3D3E0 8004D3E0 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 3D3E4 8004D3E4 07008210 */  beq        $a0, $v0, .L8004D404
    /* 3D3E8 8004D3E8 C0100400 */   sll       $v0, $a0, 3
    /* 3D3EC 8004D3EC 0D80033C */  lui        $v1, %hi(LightList)
    /* 3D3F0 8004D3F0 00636324 */  addiu      $v1, $v1, %lo(LightList)
    /* 3D3F4 8004D3F4 21104300 */  addu       $v0, $v0, $v1
    /* 3D3F8 8004D3F8 000045A0 */  sb         $a1, 0x0($v0)
    /* 3D3FC 8004D3FC 010046A0 */  sb         $a2, 0x1($v0)
    /* 3D400 8004D400 020047A4 */  sh         $a3, 0x2($v0)
  .L8004D404:
    /* 3D404 8004D404 0800E003 */  jr         $ra
    /* 3D408 8004D408 00000000 */   nop
endlabel ChangeLight__Fiiii
