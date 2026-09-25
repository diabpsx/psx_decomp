.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SpuWrite, 0x5C

glabel SpuWrite
    /* 8CFC 80018CFC E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 8D00 80018D00 1000B0AF */  sw         $s0, 0x10($sp)
    /* 8D04 80018D04 2180A000 */  addu       $s0, $a1, $zero
    /* 8D08 80018D08 0700023C */  lui        $v0, (0x7EFF0 >> 16)
    /* 8D0C 80018D0C F0EF4234 */  ori        $v0, $v0, (0x7EFF0 & 0xFFFF)
    /* 8D10 80018D10 2B105000 */  sltu       $v0, $v0, $s0
    /* 8D14 80018D14 03004010 */  beqz       $v0, .L80018D24
    /* 8D18 80018D18 1400BFAF */   sw        $ra, 0x14($sp)
    /* 8D1C 80018D1C 0700103C */  lui        $s0, (0x7EFF0 >> 16)
    /* 8D20 80018D20 F0EF1036 */  ori        $s0, $s0, (0x7EFF0 & 0xFFFF)
  .L80018D24:
    /* 8D24 80018D24 005C000C */  jal        _spu_Fw
    /* 8D28 80018D28 21280002 */   addu      $a1, $s0, $zero
    /* 8D2C 80018D2C 0B80023C */  lui        $v0, %hi(_spu_transferCallback)
    /* 8D30 80018D30 845A428C */  lw         $v0, %lo(_spu_transferCallback)($v0)
    /* 8D34 80018D34 00000000 */  nop
    /* 8D38 80018D38 03004014 */  bnez       $v0, .L80018D48
    /* 8D3C 80018D3C 21100002 */   addu      $v0, $s0, $zero
    /* 8D40 80018D40 0B80013C */  lui        $at, %hi(_spu_inTransfer)
    /* 8D44 80018D44 805A20AC */  sw         $zero, %lo(_spu_inTransfer)($at)
  .L80018D48:
    /* 8D48 80018D48 1400BF8F */  lw         $ra, 0x14($sp)
    /* 8D4C 80018D4C 1000B08F */  lw         $s0, 0x10($sp)
    /* 8D50 80018D50 0800E003 */  jr         $ra
    /* 8D54 80018D54 1800BD27 */   addiu     $sp, $sp, 0x18
endlabel SpuWrite
    /* 8D58 80018D58 00000000 */  nop
