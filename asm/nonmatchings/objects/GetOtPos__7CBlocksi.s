.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetOtPos__7CBlocksi, 0x3C

glabel GetOtPos__7CBlocksi
    /* 4FB90 8005FB90 C2008284 */  lh         $v0, 0xC2($a0)
    /* 4FB94 8005FB94 1280033C */  lui        $v1, %hi(PosAdj)
    /* 4FB98 8005FB98 ACAC638C */  lw         $v1, %lo(PosAdj)($v1)
    /* 4FB9C 8005FB9C 21104500 */  addu       $v0, $v0, $a1
    /* 4FBA0 8005FBA0 21184300 */  addu       $v1, $v0, $v1
    /* 4FBA4 8005FBA4 BDFF6228 */  slti       $v0, $v1, -0x43
    /* 4FBA8 8005FBA8 03004010 */  beqz       $v0, .L8005FBB8
    /* 4FBAC 8005FBAC 9C016228 */   slti      $v0, $v1, 0x19C
    /* 4FBB0 8005FBB0 BDFF0324 */  addiu      $v1, $zero, -0x43
    /* 4FBB4 8005FBB4 9C016228 */  slti       $v0, $v1, 0x19C
  .L8005FBB8:
    /* 4FBB8 8005FBB8 02004014 */  bnez       $v0, .L8005FBC4
    /* 4FBBC 8005FBBC 00000000 */   nop
    /* 4FBC0 8005FBC0 9B010324 */  addiu      $v1, $zero, 0x19B
  .L8005FBC4:
    /* 4FBC4 8005FBC4 0800E003 */  jr         $ra
    /* 4FBC8 8005FBC8 4D006224 */   addiu     $v0, $v1, 0x4D
endlabel GetOtPos__7CBlocksi
