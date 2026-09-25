.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CPrintString__FiPci, 0x11C

glabel CPrintString__FiPci
    /* 22A58 80032A58 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 22A5C 80032A5C 1280023C */  lui        $v0, %hi(sel_data)
    /* 22A60 80032A60 2CB7428C */  lw         $v0, %lo(sel_data)($v0)
    /* 22A64 80032A64 2800BFAF */  sw         $ra, 0x28($sp)
    /* 22A68 80032A68 1280013C */  lui        $at, %hi(_infoclr)
    /* 22A6C 80032A6C 21082200 */  addu       $at, $at, $v0
    /* 22A70 80032A70 BCB62380 */  lb         $v1, %lo(_infoclr)($at)
    /* 22A74 80032A74 01000224 */  addiu      $v0, $zero, 0x1
    /* 22A78 80032A78 15006210 */  beq        $v1, $v0, .L80032AD0
    /* 22A7C 80032A7C 2138A000 */   addu      $a3, $a1, $zero
    /* 22A80 80032A80 02006228 */  slti       $v0, $v1, 0x2
    /* 22A84 80032A84 05004010 */  beqz       $v0, .L80032A9C
    /* 22A88 80032A88 00000000 */   nop
    /* 22A8C 80032A8C 08006010 */  beqz       $v1, .L80032AB0
    /* 22A90 80032A90 00000000 */   nop
    /* 22A94 80032A94 C4CA0008 */  j          .L80032B10
    /* 22A98 80032A98 00000000 */   nop
  .L80032A9C:
    /* 22A9C 80032A9C 02000224 */  addiu      $v0, $zero, 0x2
    /* 22AA0 80032AA0 13006210 */  beq        $v1, $v0, .L80032AF0
    /* 22AA4 80032AA4 00000000 */   nop
    /* 22AA8 80032AA8 C4CA0008 */  j          .L80032B10
    /* 22AAC 80032AAC 00000000 */   nop
  .L80032AB0:
    /* 22AB0 80032AB0 1280083C */  lui        $t0, %hi(WHITER)
    /* 22AB4 80032AB4 D1AB0891 */  lbu        $t0, %lo(WHITER)($t0)
    /* 22AB8 80032AB8 1280053C */  lui        $a1, %hi(WHITEG)
    /* 22ABC 80032ABC D2ABA590 */  lbu        $a1, %lo(WHITEG)($a1)
    /* 22AC0 80032AC0 1280033C */  lui        $v1, %hi(WHITEB)
    /* 22AC4 80032AC4 D3AB6390 */  lbu        $v1, %lo(WHITEB)($v1)
    /* 22AC8 80032AC8 CBCA0008 */  j          .L80032B2C
    /* 22ACC 80032ACC 1000A6AF */   sw        $a2, 0x10($sp)
  .L80032AD0:
    /* 22AD0 80032AD0 1280083C */  lui        $t0, %hi(BLUER)
    /* 22AD4 80032AD4 D4AB0891 */  lbu        $t0, %lo(BLUER)($t0)
    /* 22AD8 80032AD8 1280053C */  lui        $a1, %hi(BLUEG)
    /* 22ADC 80032ADC D5ABA590 */  lbu        $a1, %lo(BLUEG)($a1)
    /* 22AE0 80032AE0 1280033C */  lui        $v1, %hi(BLUEB)
    /* 22AE4 80032AE4 D6AB6390 */  lbu        $v1, %lo(BLUEB)($v1)
    /* 22AE8 80032AE8 CBCA0008 */  j          .L80032B2C
    /* 22AEC 80032AEC 1000A6AF */   sw        $a2, 0x10($sp)
  .L80032AF0:
    /* 22AF0 80032AF0 1280083C */  lui        $t0, %hi(REDR)
    /* 22AF4 80032AF4 D7AB0891 */  lbu        $t0, %lo(REDR)($t0)
    /* 22AF8 80032AF8 1280053C */  lui        $a1, %hi(REDG)
    /* 22AFC 80032AFC D8ABA590 */  lbu        $a1, %lo(REDG)($a1)
    /* 22B00 80032B00 1280033C */  lui        $v1, %hi(REDB)
    /* 22B04 80032B04 D9AB6390 */  lbu        $v1, %lo(REDB)($v1)
    /* 22B08 80032B08 CBCA0008 */  j          .L80032B2C
    /* 22B0C 80032B0C 1000A6AF */   sw        $a2, 0x10($sp)
  .L80032B10:
    /* 22B10 80032B10 1280083C */  lui        $t0, %hi(GOLDR)
    /* 22B14 80032B14 DAAB0891 */  lbu        $t0, %lo(GOLDR)($t0)
    /* 22B18 80032B18 1280053C */  lui        $a1, %hi(GOLDG)
    /* 22B1C 80032B1C DBABA590 */  lbu        $a1, %lo(GOLDG)($a1)
    /* 22B20 80032B20 1280033C */  lui        $v1, %hi(GOLDB)
    /* 22B24 80032B24 DCAB6390 */  lbu        $v1, %lo(GOLDB)($v1)
    /* 22B28 80032B28 1000A6AF */  sw         $a2, 0x10($sp)
  .L80032B2C:
    /* 22B2C 80032B2C 40300400 */  sll        $a2, $a0, 1
    /* 22B30 80032B30 2130C400 */  addu       $a2, $a2, $a0
    /* 22B34 80032B34 80300600 */  sll        $a2, $a2, 2
    /* 22B38 80032B38 2130C400 */  addu       $a2, $a2, $a0
    /* 22B3C 80032B3C 0C80043C */  lui        $a0, %hi(MediumFont)
    /* 22B40 80032B40 D8828424 */  addiu      $a0, $a0, %lo(MediumFont)
    /* 22B44 80032B44 1C00A5AF */  sw         $a1, 0x1C($sp)
    /* 22B48 80032B48 21280000 */  addu       $a1, $zero, $zero
    /* 22B4C 80032B4C 700F828F */  lw         $v0, %gp_rel(InfoBoxRect)($gp)
    /* 22B50 80032B50 0A00C624 */  addiu      $a2, $a2, 0xA
    /* 22B54 80032B54 1800A8AF */  sw         $t0, 0x18($sp)
    /* 22B58 80032B58 2000A3AF */  sw         $v1, 0x20($sp)
    /* 22B5C 80032B5C 2428020C */  jal        Print__5CFontiiPc8TXT_JUSTP4RECTUcUcUc
    /* 22B60 80032B60 1400A2AF */   sw        $v0, 0x14($sp)
    /* 22B64 80032B64 2800BF8F */  lw         $ra, 0x28($sp)
    /* 22B68 80032B68 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 22B6C 80032B6C 0800E003 */  jr         $ra
    /* 22B70 80032B70 00000000 */   nop
endlabel CPrintString__FiPci
