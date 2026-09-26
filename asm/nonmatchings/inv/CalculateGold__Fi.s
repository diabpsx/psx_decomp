.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CalculateGold__Fi, 0x138

glabel CalculateGold__Fi
    /* 26F6C 80160B64 F8FFBD27 */  addiu      $sp, $sp, -0x8
    /* 26F70 80160B68 21480000 */  addu       $t1, $zero, $zero
    /* 26F74 80160B6C 21300000 */  addu       $a2, $zero, $zero
    /* 26F78 80160B70 0B000724 */  addiu      $a3, $zero, 0xB
    /* 26F7C 80160B74 FF000524 */  addiu      $a1, $zero, 0xFF
    /* 26F80 80160B78 40100400 */  sll        $v0, $a0, 1
    /* 26F84 80160B7C 21104400 */  addu       $v0, $v0, $a0
    /* 26F88 80160B80 80100200 */  sll        $v0, $v0, 2
    /* 26F8C 80160B84 21104400 */  addu       $v0, $v0, $a0
    /* 26F90 80160B88 00110200 */  sll        $v0, $v0, 4
    /* 26F94 80160B8C 23104400 */  subu       $v0, $v0, $a0
    /* 26F98 80160B90 80100200 */  sll        $v0, $v0, 2
    /* 26F9C 80160B94 21104400 */  addu       $v0, $v0, $a0
    /* 26FA0 80160B98 C0180200 */  sll        $v1, $v0, 3
  .L80160B9C:
    /* 26FA4 80160B9C 0E80013C */  lui        $at, %hi(plr + 0x15DC)
    /* 26FA8 80160BA0 21082300 */  addu       $at, $at, $v1
    /* 26FAC 80160BA4 14BB2284 */  lh         $v0, %lo(plr + 0x15DC)($at)
    /* 26FB0 80160BA8 00000000 */  nop
    /* 26FB4 80160BAC 07004714 */  bne        $v0, $a3, .L80160BCC
    /* 26FB8 80160BB0 00000000 */   nop
    /* 26FBC 80160BB4 0E80013C */  lui        $at, %hi(plr + 0x15C4)
    /* 26FC0 80160BB8 21082300 */  addu       $at, $at, $v1
    /* 26FC4 80160BBC FCBA228C */  lw         $v0, %lo(plr + 0x15C4)($at)
    /* 26FC8 80160BC0 1280013C */  lui        $at, %hi(force_redraw)
    /* 26FCC 80160BC4 90B725AC */  sw         $a1, %lo(force_redraw)($at)
    /* 26FD0 80160BC8 21482201 */  addu       $t1, $t1, $v0
  .L80160BCC:
    /* 26FD4 80160BCC 0100C624 */  addiu      $a2, $a2, 0x1
    /* 26FD8 80160BD0 0800C228 */  slti       $v0, $a2, 0x8
    /* 26FDC 80160BD4 F1FF4014 */  bnez       $v0, .L80160B9C
    /* 26FE0 80160BD8 6C006324 */   addiu     $v1, $v1, 0x6C
    /* 26FE4 80160BDC 40380400 */  sll        $a3, $a0, 1
    /* 26FE8 80160BE0 2110E400 */  addu       $v0, $a3, $a0
    /* 26FEC 80160BE4 80100200 */  sll        $v0, $v0, 2
    /* 26FF0 80160BE8 21104400 */  addu       $v0, $v0, $a0
    /* 26FF4 80160BEC 00110200 */  sll        $v0, $v0, 4
    /* 26FF8 80160BF0 23104400 */  subu       $v0, $v0, $a0
    /* 26FFC 80160BF4 80100200 */  sll        $v0, $v0, 2
    /* 27000 80160BF8 21104400 */  addu       $v0, $v0, $a0
    /* 27004 80160BFC C0100200 */  sll        $v0, $v0, 3
    /* 27008 80160C00 0E80013C */  lui        $at, %hi(plr + 0x1584)
    /* 2700C 80160C04 21082200 */  addu       $at, $at, $v0
    /* 27010 80160C08 BCBA228C */  lw         $v0, %lo(plr + 0x1584)($at)
    /* 27014 80160C0C 00000000 */  nop
    /* 27018 80160C10 1E004018 */  blez       $v0, .L80160C8C
    /* 2701C 80160C14 21300000 */   addu      $a2, $zero, $zero
    /* 27020 80160C18 0B000A24 */  addiu      $t2, $zero, 0xB
    /* 27024 80160C1C 21400000 */  addu       $t0, $zero, $zero
  .L80160C20:
    /* 27028 80160C20 2110E400 */  addu       $v0, $a3, $a0
    /* 2702C 80160C24 80100200 */  sll        $v0, $v0, 2
    /* 27030 80160C28 21104400 */  addu       $v0, $v0, $a0
    /* 27034 80160C2C 00110200 */  sll        $v0, $v0, 4
    /* 27038 80160C30 23104400 */  subu       $v0, $v0, $a0
    /* 2703C 80160C34 80100200 */  sll        $v0, $v0, 2
    /* 27040 80160C38 21104400 */  addu       $v0, $v0, $a0
    /* 27044 80160C3C C0280200 */  sll        $a1, $v0, 3
    /* 27048 80160C40 21180501 */  addu       $v1, $t0, $a1
    /* 2704C 80160C44 0E80013C */  lui        $at, %hi(plr + 0x4D0)
    /* 27050 80160C48 21082300 */  addu       $at, $at, $v1
    /* 27054 80160C4C 08AA2284 */  lh         $v0, %lo(plr + 0x4D0)($at)
    /* 27058 80160C50 00000000 */  nop
    /* 2705C 80160C54 06004A14 */  bne        $v0, $t2, .L80160C70
    /* 27060 80160C58 00000000 */   nop
    /* 27064 80160C5C 0E80013C */  lui        $at, %hi(plr + 0x4B8)
    /* 27068 80160C60 21082300 */  addu       $at, $at, $v1
    /* 2706C 80160C64 F0A9228C */  lw         $v0, %lo(plr + 0x4B8)($at)
    /* 27070 80160C68 00000000 */  nop
    /* 27074 80160C6C 21482201 */  addu       $t1, $t1, $v0
  .L80160C70:
    /* 27078 80160C70 0E80013C */  lui        $at, %hi(plr + 0x1584)
    /* 2707C 80160C74 21082500 */  addu       $at, $at, $a1
    /* 27080 80160C78 BCBA228C */  lw         $v0, %lo(plr + 0x1584)($at)
    /* 27084 80160C7C 0100C624 */  addiu      $a2, $a2, 0x1
    /* 27088 80160C80 2A10C200 */  slt        $v0, $a2, $v0
    /* 2708C 80160C84 E6FF4014 */  bnez       $v0, .L80160C20
    /* 27090 80160C88 6C000825 */   addiu     $t0, $t0, 0x6C
  .L80160C8C:
    /* 27094 80160C8C 21102001 */  addu       $v0, $t1, $zero
    /* 27098 80160C90 0800BD27 */  addiu      $sp, $sp, 0x8
    /* 2709C 80160C94 0800E003 */  jr         $ra
    /* 270A0 80160C98 00000000 */   nop
endlabel CalculateGold__Fi
