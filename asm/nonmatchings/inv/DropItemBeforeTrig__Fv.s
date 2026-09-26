.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DropItemBeforeTrig__Fv, 0x58

glabel DropItemBeforeTrig__Fv
    /* 270A4 80160C9C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 270A8 80160CA0 1000BFAF */  sw         $ra, 0x10($sp)
    /* 270AC 80160CA4 087C050C */  jal        TryInvPut__Fv
    /* 270B0 80160CA8 00000000 */   nop
    /* 270B4 80160CAC FF004230 */  andi       $v0, $v0, 0xFF
    /* 270B8 80160CB0 03004014 */  bnez       $v0, .L80160CC0
    /* 270BC 80160CB4 01000424 */   addiu     $a0, $zero, 0x1
    /* 270C0 80160CB8 39830508 */  j          .L80160CE4
    /* 270C4 80160CBC 21100000 */   addu      $v0, $zero, $zero
  .L80160CC0:
    /* 270C8 80160CC0 1280063C */  lui        $a2, %hi(cursmx)
    /* 270CC 80160CC4 50B7C690 */  lbu        $a2, %lo(cursmx)($a2)
    /* 270D0 80160CC8 1280073C */  lui        $a3, %hi(cursmy)
    /* 270D4 80160CCC 54B7E790 */  lbu        $a3, %lo(cursmy)($a3)
    /* 270D8 80160CD0 F63E010C */  jal        NetSendCmdPItem__FUcUcUcUc
    /* 270DC 80160CD4 0A000524 */   addiu     $a1, $zero, 0xA
    /* 270E0 80160CD8 01DE000C */  jal        NewCursor__Fi
    /* 270E4 80160CDC 01000424 */   addiu     $a0, $zero, 0x1
    /* 270E8 80160CE0 01000224 */  addiu      $v0, $zero, 0x1
  .L80160CE4:
    /* 270EC 80160CE4 1000BF8F */  lw         $ra, 0x10($sp)
    /* 270F0 80160CE8 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 270F4 80160CEC 0800E003 */  jr         $ra
    /* 270F8 80160CF0 00000000 */   nop
endlabel DropItemBeforeTrig__Fv
