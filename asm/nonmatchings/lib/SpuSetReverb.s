.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SpuSetReverb, 0xCC

glabel SpuSetReverb
    /* 7A0C 80017A0C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 7A10 80017A10 1000B0AF */  sw         $s0, 0x10($sp)
    /* 7A14 80017A14 21808000 */  addu       $s0, $a0, $zero
    /* 7A18 80017A18 06000012 */  beqz       $s0, .L80017A34
    /* 7A1C 80017A1C 1400BFAF */   sw        $ra, 0x14($sp)
    /* 7A20 80017A20 01000224 */  addiu      $v0, $zero, 0x1
    /* 7A24 80017A24 0B000212 */  beq        $s0, $v0, .L80017A54
    /* 7A28 80017A28 00000000 */   nop
    /* 7A2C 80017A2C B05E0008 */  j          .L80017AC0
    /* 7A30 80017A30 00000000 */   nop
  .L80017A34:
    /* 7A34 80017A34 0B80033C */  lui        $v1, %hi(_spu_RXX)
    /* 7A38 80017A38 4C5A638C */  lw         $v1, %lo(_spu_RXX)($v1)
    /* 7A3C 80017A3C 00000000 */  nop
    /* 7A40 80017A40 AA016294 */  lhu        $v0, 0x1AA($v1)
    /* 7A44 80017A44 0B80013C */  lui        $at, %hi(_spu_rev_flag)
    /* 7A48 80017A48 E05520AC */  sw         $zero, %lo(_spu_rev_flag)($at)
    /* 7A4C 80017A4C AF5E0008 */  j          .L80017ABC
    /* 7A50 80017A50 7FFF4230 */   andi      $v0, $v0, 0xFF7F
  .L80017A54:
    /* 7A54 80017A54 0B80023C */  lui        $v0, %hi(_spu_rev_reserve_wa)
    /* 7A58 80017A58 E455428C */  lw         $v0, %lo(_spu_rev_reserve_wa)($v0)
    /* 7A5C 80017A5C 00000000 */  nop
    /* 7A60 80017A60 0F005010 */  beq        $v0, $s0, .L80017AA0
    /* 7A64 80017A64 00000000 */   nop
    /* 7A68 80017A68 0B80043C */  lui        $a0, %hi(_spu_rev_offsetaddr)
    /* 7A6C 80017A6C E855848C */  lw         $a0, %lo(_spu_rev_offsetaddr)($a0)
    /* 7A70 80017A70 D75E000C */  jal        _SpuIsInAllocateArea_
    /* 7A74 80017A74 00000000 */   nop
    /* 7A78 80017A78 09004010 */  beqz       $v0, .L80017AA0
    /* 7A7C 80017A7C 00000000 */   nop
    /* 7A80 80017A80 0B80033C */  lui        $v1, %hi(_spu_RXX)
    /* 7A84 80017A84 4C5A638C */  lw         $v1, %lo(_spu_RXX)($v1)
    /* 7A88 80017A88 00000000 */  nop
    /* 7A8C 80017A8C AA016294 */  lhu        $v0, 0x1AA($v1)
    /* 7A90 80017A90 0B80013C */  lui        $at, %hi(_spu_rev_flag)
    /* 7A94 80017A94 E05520AC */  sw         $zero, %lo(_spu_rev_flag)($at)
    /* 7A98 80017A98 AF5E0008 */  j          .L80017ABC
    /* 7A9C 80017A9C 7FFF4230 */   andi      $v0, $v0, 0xFF7F
  .L80017AA0:
    /* 7AA0 80017AA0 0B80033C */  lui        $v1, %hi(_spu_RXX)
    /* 7AA4 80017AA4 4C5A638C */  lw         $v1, %lo(_spu_RXX)($v1)
    /* 7AA8 80017AA8 00000000 */  nop
    /* 7AAC 80017AAC AA016294 */  lhu        $v0, 0x1AA($v1)
    /* 7AB0 80017AB0 0B80013C */  lui        $at, %hi(_spu_rev_flag)
    /* 7AB4 80017AB4 E05530AC */  sw         $s0, %lo(_spu_rev_flag)($at)
    /* 7AB8 80017AB8 80004234 */  ori        $v0, $v0, 0x80
  .L80017ABC:
    /* 7ABC 80017ABC AA0162A4 */  sh         $v0, 0x1AA($v1)
  .L80017AC0:
    /* 7AC0 80017AC0 0B80023C */  lui        $v0, %hi(_spu_rev_flag)
    /* 7AC4 80017AC4 E055428C */  lw         $v0, %lo(_spu_rev_flag)($v0)
    /* 7AC8 80017AC8 1400BF8F */  lw         $ra, 0x14($sp)
    /* 7ACC 80017ACC 1000B08F */  lw         $s0, 0x10($sp)
    /* 7AD0 80017AD0 0800E003 */  jr         $ra
    /* 7AD4 80017AD4 1800BD27 */   addiu     $sp, $sp, 0x18
endlabel SpuSetReverb
    /* 7AD8 80017AD8 00000000 */  nop
