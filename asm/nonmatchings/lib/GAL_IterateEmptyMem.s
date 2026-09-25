.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GAL_IterateEmptyMem, 0x84

glabel GAL_IterateEmptyMem
    /* 12150 80022150 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 12154 80022154 1400B1AF */  sw         $s1, 0x14($sp)
    /* 12158 80022158 2188A000 */  addu       $s1, $a1, $zero
    /* 1215C 8002215C FFFF023C */  lui        $v0, (0xFFFF7FFF >> 16)
    /* 12160 80022160 FF7F4234 */  ori        $v0, $v0, (0xFFFF7FFF & 0xFFFF)
    /* 12164 80022164 24208200 */  and        $a0, $a0, $v0
    /* 12168 80022168 1800BFAF */  sw         $ra, 0x18($sp)
    /* 1216C 8002216C 2687000C */  jal        GetMemInitInfoBlockFromType
    /* 12170 80022170 1000B0AF */   sw        $s0, 0x10($sp)
    /* 12174 80022174 0F004010 */  beqz       $v0, .L800221B4
    /* 12178 80022178 00000000 */   nop
    /* 1217C 8002217C 2000508C */  lw         $s0, 0x20($v0)
    /* 12180 80022180 00000000 */  nop
    /* 12184 80022184 0D000012 */  beqz       $s0, .L800221BC
    /* 12188 80022188 00000000 */   nop
  .L8002218C:
    /* 1218C 8002218C 0800048E */  lw         $a0, 0x8($s0)
    /* 12190 80022190 0C00058E */  lw         $a1, 0xC($s0)
    /* 12194 80022194 09F82002 */  jalr       $s1
    /* 12198 80022198 18000626 */   addiu     $a2, $s0, 0x18
    /* 1219C 8002219C 0400108E */  lw         $s0, 0x4($s0)
    /* 121A0 800221A0 00000000 */  nop
    /* 121A4 800221A4 05000012 */  beqz       $s0, .L800221BC
    /* 121A8 800221A8 00000000 */   nop
    /* 121AC 800221AC 63880008 */  j          .L8002218C
    /* 121B0 800221B0 00000000 */   nop
  .L800221B4:
    /* 121B4 800221B4 0389000C */  jal        GSetError
    /* 121B8 800221B8 04000434 */   ori       $a0, $zero, 0x4
  .L800221BC:
    /* 121BC 800221BC 1800BF8F */  lw         $ra, 0x18($sp)
    /* 121C0 800221C0 1400B18F */  lw         $s1, 0x14($sp)
    /* 121C4 800221C4 1000B08F */  lw         $s0, 0x10($sp)
    /* 121C8 800221C8 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 121CC 800221CC 0800E003 */  jr         $ra
    /* 121D0 800221D0 00000000 */   nop
endlabel GAL_IterateEmptyMem
