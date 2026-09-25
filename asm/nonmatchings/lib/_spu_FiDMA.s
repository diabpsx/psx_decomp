.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching _spu_FiDMA, 0xBC

glabel _spu_FiDMA
    /* 6C1C 80016C1C 0B80023C */  lui        $v0, %hi(D_800B5A9C)
    /* 6C20 80016C20 9C5A428C */  lw         $v0, %lo(D_800B5A9C)($v0)
    /* 6C24 80016C24 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 6C28 80016C28 03004014 */  bnez       $v0, .L80016C38
    /* 6C2C 80016C2C 1000BFAF */   sw        $ra, 0x10($sp)
    /* 6C30 80016C30 AD5C000C */  jal        _spu_Fw1ts
    /* 6C34 80016C34 00000000 */   nop
  .L80016C38:
    /* 6C38 80016C38 0B80043C */  lui        $a0, %hi(_spu_RXX)
    /* 6C3C 80016C3C 4C5A848C */  lw         $a0, %lo(_spu_RXX)($a0)
    /* 6C40 80016C40 00000000 */  nop
    /* 6C44 80016C44 AA018294 */  lhu        $v0, 0x1AA($a0)
    /* 6C48 80016C48 00000000 */  nop
    /* 6C4C 80016C4C CFFF4230 */  andi       $v0, $v0, 0xFFCF
    /* 6C50 80016C50 AA0182A4 */  sh         $v0, 0x1AA($a0)
    /* 6C54 80016C54 AA018294 */  lhu        $v0, 0x1AA($a0)
    /* 6C58 80016C58 00000000 */  nop
    /* 6C5C 80016C5C 30004230 */  andi       $v0, $v0, 0x30
    /* 6C60 80016C60 0A004010 */  beqz       $v0, .L80016C8C
    /* 6C64 80016C64 21180000 */   addu      $v1, $zero, $zero
    /* 6C68 80016C68 01006324 */  addiu      $v1, $v1, 0x1
  .L80016C6C:
    /* 6C6C 80016C6C 010F622C */  sltiu      $v0, $v1, 0xF01
    /* 6C70 80016C70 06004010 */  beqz       $v0, .L80016C8C
    /* 6C74 80016C74 00000000 */   nop
    /* 6C78 80016C78 AA018294 */  lhu        $v0, 0x1AA($a0)
    /* 6C7C 80016C7C 00000000 */  nop
    /* 6C80 80016C80 30004230 */  andi       $v0, $v0, 0x30
    /* 6C84 80016C84 F9FF4014 */  bnez       $v0, .L80016C6C
    /* 6C88 80016C88 01006324 */   addiu     $v1, $v1, 0x1
  .L80016C8C:
    /* 6C8C 80016C8C 0B80023C */  lui        $v0, %hi(_spu_transferCallback)
    /* 6C90 80016C90 845A428C */  lw         $v0, %lo(_spu_transferCallback)($v0)
    /* 6C94 80016C94 00000000 */  nop
    /* 6C98 80016C98 08004010 */  beqz       $v0, .L80016CBC
    /* 6C9C 80016C9C 00F0043C */   lui       $a0, (0xF0000009 >> 16)
    /* 6CA0 80016CA0 0B80023C */  lui        $v0, %hi(_spu_transferCallback)
    /* 6CA4 80016CA4 845A428C */  lw         $v0, %lo(_spu_transferCallback)($v0)
    /* 6CA8 80016CA8 00000000 */  nop
    /* 6CAC 80016CAC 09F84000 */  jalr       $v0
    /* 6CB0 80016CB0 00000000 */   nop
    /* 6CB4 80016CB4 325B0008 */  j          .L80016CC8
    /* 6CB8 80016CB8 00000000 */   nop
  .L80016CBC:
    /* 6CBC 80016CBC 09008434 */  ori        $a0, $a0, (0xF0000009 & 0xFFFF)
    /* 6CC0 80016CC0 C75C000C */  jal        DeliverEvent
    /* 6CC4 80016CC4 20000524 */   addiu     $a1, $zero, 0x20
  .L80016CC8:
    /* 6CC8 80016CC8 1000BF8F */  lw         $ra, 0x10($sp)
    /* 6CCC 80016CCC 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 6CD0 80016CD0 0800E003 */  jr         $ra
    /* 6CD4 80016CD4 00000000 */   nop
endlabel _spu_FiDMA
