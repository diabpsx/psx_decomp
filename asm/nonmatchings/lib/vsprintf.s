.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching vsprintf, 0x4C

glabel vsprintf
    /* 15538 80025538 C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* 1553C 8002553C FF7F023C */  lui        $v0, (0x7FFFFFFF >> 16)
    /* 15540 80025540 FFFF4234 */  ori        $v0, $v0, (0x7FFFFFFF & 0xFFFF)
    /* 15544 80025544 10010334 */  ori        $v1, $zero, 0x110
    /* 15548 80025548 1400A4AF */  sw         $a0, 0x14($sp)
    /* 1554C 8002554C 2120A000 */  addu       $a0, $a1, $zero
    /* 15550 80025550 2128C000 */  addu       $a1, $a2, $zero
    /* 15554 80025554 1000A627 */  addiu      $a2, $sp, 0x10
    /* 15558 80025558 3000BFAF */  sw         $ra, 0x30($sp)
    /* 1555C 8002555C 2000A3AF */  sw         $v1, 0x20($sp)
    /* 15560 80025560 6195000C */  jal        _doprnt
    /* 15564 80025564 1000A2AF */   sw        $v0, 0x10($sp)
    /* 15568 80025568 1400A38F */  lw         $v1, 0x14($sp)
    /* 1556C 8002556C 00000000 */  nop
    /* 15570 80025570 000060A0 */  sb         $zero, 0x0($v1)
    /* 15574 80025574 3000BF8F */  lw         $ra, 0x30($sp)
    /* 15578 80025578 3800BD27 */  addiu      $sp, $sp, 0x38
    /* 1557C 8002557C 0800E003 */  jr         $ra
    /* 15580 80025580 00000000 */   nop
endlabel vsprintf
