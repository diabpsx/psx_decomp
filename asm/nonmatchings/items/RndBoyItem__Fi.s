.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching RndBoyItem__Fi, 0x11C

glabel RndBoyItem__Fi
    /* 39C48 80049C48 D0F7BD27 */  addiu      $sp, $sp, -0x830
    /* 39C4C 80049C4C 2008B4AF */  sw         $s4, 0x820($sp)
    /* 39C50 80049C50 21A08000 */  addu       $s4, $a0, $zero
    /* 39C54 80049C54 2808BFAF */  sw         $ra, 0x828($sp)
    /* 39C58 80049C58 2408B5AF */  sw         $s5, 0x824($sp)
    /* 39C5C 80049C5C 1C08B3AF */  sw         $s3, 0x81C($sp)
    /* 39C60 80049C60 1808B2AF */  sw         $s2, 0x818($sp)
    /* 39C64 80049C64 1408B1AF */  sw         $s1, 0x814($sp)
    /* 39C68 80049C68 02008016 */  bnez       $s4, .L80049C74
    /* 39C6C 80049C6C 1008B0AF */   sw        $s0, 0x810($sp)
    /* 39C70 80049C70 01001424 */  addiu      $s4, $zero, 0x1
  .L80049C74:
    /* 39C74 80049C74 21980000 */  addu       $s3, $zero, $zero
    /* 39C78 80049C78 1180033C */  lui        $v1, %hi(AllItemsList + 0x22)
    /* 39C7C 80049C7C C6136380 */  lb         $v1, %lo(AllItemsList + 0x22)($v1)
    /* 39C80 80049C80 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 39C84 80049C84 20006210 */  beq        $v1, $v0, .L80049D08
    /* 39C88 80049C88 01001124 */   addiu     $s1, $zero, 0x1
    /* 39C8C 80049C8C FFFF1524 */  addiu      $s5, $zero, -0x1
    /* 39C90 80049C90 20001024 */  addiu      $s0, $zero, 0x20
    /* 39C94 80049C94 1000B227 */  addiu      $s2, $sp, 0x10
  .L80049C98:
    /* 39C98 80049C98 1180013C */  lui        $at, %hi(AllItemsList)
    /* 39C9C 80049C9C 21083000 */  addu       $at, $at, $s0
    /* 39CA0 80049CA0 A4132290 */  lbu        $v0, %lo(AllItemsList)($at)
    /* 39CA4 80049CA4 00000000 */  nop
    /* 39CA8 80049CA8 10004010 */  beqz       $v0, .L80049CEC
    /* 39CAC 80049CAC 00000000 */   nop
    /* 39CB0 80049CB0 661F010C */  jal        PremiumItemOk__Fi
    /* 39CB4 80049CB4 21202002 */   addu      $a0, $s1, $zero
    /* 39CB8 80049CB8 FF004230 */  andi       $v0, $v0, 0xFF
    /* 39CBC 80049CBC 0B004010 */  beqz       $v0, .L80049CEC
    /* 39CC0 80049CC0 00000000 */   nop
    /* 39CC4 80049CC4 1180013C */  lui        $at, %hi(AllItemsList + 0xA)
    /* 39CC8 80049CC8 21083000 */  addu       $at, $at, $s0
    /* 39CCC 80049CCC AE132280 */  lb         $v0, %lo(AllItemsList + 0xA)($at)
    /* 39CD0 80049CD0 00000000 */  nop
    /* 39CD4 80049CD4 2A108202 */  slt        $v0, $s4, $v0
    /* 39CD8 80049CD8 04004014 */  bnez       $v0, .L80049CEC
    /* 39CDC 80049CDC 00000000 */   nop
    /* 39CE0 80049CE0 000051AE */  sw         $s1, 0x0($s2)
    /* 39CE4 80049CE4 04005226 */  addiu      $s2, $s2, 0x4
    /* 39CE8 80049CE8 01007326 */  addiu      $s3, $s3, 0x1
  .L80049CEC:
    /* 39CEC 80049CEC 20001026 */  addiu      $s0, $s0, 0x20
    /* 39CF0 80049CF0 1180013C */  lui        $at, %hi(AllItemsList + 0x2)
    /* 39CF4 80049CF4 21083000 */  addu       $at, $at, $s0
    /* 39CF8 80049CF8 A6132280 */  lb         $v0, %lo(AllItemsList + 0x2)($at)
    /* 39CFC 80049CFC 00000000 */  nop
    /* 39D00 80049D00 E5FF5514 */  bne        $v0, $s5, .L80049C98
    /* 39D04 80049D04 01003126 */   addiu     $s1, $s1, 0x1
  .L80049D08:
    /* 39D08 80049D08 05006016 */  bnez       $s3, .L80049D20
    /* 39D0C 80049D0C 21200000 */   addu      $a0, $zero, $zero
    /* 39D10 80049D10 1180053C */  lui        $a1, %hi(D_80116164)
    /* 39D14 80049D14 6461A524 */  addiu      $a1, $a1, %lo(D_80116164)
    /* 39D18 80049D18 A583000C */  jal        DBG_Error
    /* 39D1C 80049D1C 0B160624 */   addiu     $a2, $zero, 0x160B
  .L80049D20:
    /* 39D20 80049D20 C9F6000C */  jal        ENG_random__Fl
    /* 39D24 80049D24 21206002 */   addu      $a0, $s3, $zero
    /* 39D28 80049D28 80100200 */  sll        $v0, $v0, 2
    /* 39D2C 80049D2C 2110A203 */  addu       $v0, $sp, $v0
    /* 39D30 80049D30 1000428C */  lw         $v0, 0x10($v0)
    /* 39D34 80049D34 00000000 */  nop
    /* 39D38 80049D38 01004224 */  addiu      $v0, $v0, 0x1
    /* 39D3C 80049D3C 2808BF8F */  lw         $ra, 0x828($sp)
    /* 39D40 80049D40 2408B58F */  lw         $s5, 0x824($sp)
    /* 39D44 80049D44 2008B48F */  lw         $s4, 0x820($sp)
    /* 39D48 80049D48 1C08B38F */  lw         $s3, 0x81C($sp)
    /* 39D4C 80049D4C 1808B28F */  lw         $s2, 0x818($sp)
    /* 39D50 80049D50 1408B18F */  lw         $s1, 0x814($sp)
    /* 39D54 80049D54 1008B08F */  lw         $s0, 0x810($sp)
    /* 39D58 80049D58 3008BD27 */  addiu      $sp, $sp, 0x830
    /* 39D5C 80049D5C 0800E003 */  jr         $ra
    /* 39D60 80049D60 00000000 */   nop
endlabel RndBoyItem__Fi
