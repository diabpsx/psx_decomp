.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching stricmp, 0x6C

glabel stricmp
    /* 1F574 8002F574 00008290 */  lbu        $v0, 0x0($a0)
    /* 1F578 8002F578 00000000 */  nop
    /* 1F57C 8002F57C FF004630 */  andi       $a2, $v0, 0xFF
    /* 1F580 8002F580 BFFF4224 */  addiu      $v0, $v0, -0x41
    /* 1F584 8002F584 1A00422C */  sltiu      $v0, $v0, 0x1A
    /* 1F588 8002F588 02004010 */  beqz       $v0, .L8002F594
    /* 1F58C 8002F58C 00000000 */   nop
    /* 1F590 8002F590 2000C624 */  addiu      $a2, $a2, 0x20
  .L8002F594:
    /* 1F594 8002F594 0000A390 */  lbu        $v1, 0x0($a1)
    /* 1F598 8002F598 00000000 */  nop
    /* 1F59C 8002F59C BFFF6224 */  addiu      $v0, $v1, -0x41
    /* 1F5A0 8002F5A0 1A00422C */  sltiu      $v0, $v0, 0x1A
    /* 1F5A4 8002F5A4 03004010 */  beqz       $v0, .L8002F5B4
    /* 1F5A8 8002F5A8 E0FFC224 */   addiu     $v0, $a2, -0x20
    /* 1F5AC 8002F5AC 6EBD0008 */  j          .L8002F5B8
    /* 1F5B0 8002F5B0 23184300 */   subu      $v1, $v0, $v1
  .L8002F5B4:
    /* 1F5B4 8002F5B4 2318C300 */  subu       $v1, $a2, $v1
  .L8002F5B8:
    /* 1F5B8 8002F5B8 07006014 */  bnez       $v1, .L8002F5D8
    /* 1F5BC 8002F5BC 00000000 */   nop
    /* 1F5C0 8002F5C0 00008290 */  lbu        $v0, 0x0($a0)
    /* 1F5C4 8002F5C4 00000000 */  nop
    /* 1F5C8 8002F5C8 03004010 */  beqz       $v0, .L8002F5D8
    /* 1F5CC 8002F5CC 01008424 */   addiu     $a0, $a0, 0x1
    /* 1F5D0 8002F5D0 5DBD0008 */  j          stricmp
    /* 1F5D4 8002F5D4 0100A524 */   addiu     $a1, $a1, 0x1
  .L8002F5D8:
    /* 1F5D8 8002F5D8 0800E003 */  jr         $ra
    /* 1F5DC 8002F5DC 21106000 */   addu      $v0, $v1, $zero
endlabel stricmp
