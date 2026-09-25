.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching purgeonei, 0xD0

glabel purgeonei
    /* 1B188 8002B188 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1B18C 8002B18C 000F8330 */  andi       $v1, $a0, 0xF00
    /* 1B190 8002B190 031A0300 */  sra        $v1, $v1, 8
    /* 1B194 8002B194 40100300 */  sll        $v0, $v1, 1
    /* 1B198 8002B198 21104300 */  addu       $v0, $v0, $v1
    /* 1B19C 8002B19C C0100200 */  sll        $v0, $v0, 3
    /* 1B1A0 8002B1A0 1380033C */  lui        $v1, %hi(memclass)
    /* 1B1A4 8002B1A4 307A6324 */  addiu      $v1, $v1, %lo(memclass)
    /* 1B1A8 8002B1A8 21104300 */  addu       $v0, $v0, $v1
    /* 1B1AC 8002B1AC 1000BFAF */  sw         $ra, 0x10($sp)
    /* 1B1B0 8002B1B0 0000438C */  lw         $v1, 0x0($v0)
    /* 1B1B4 8002B1B4 0400428C */  lw         $v0, 0x4($v0)
    /* 1B1B8 8002B1B8 2000658C */  lw         $a1, 0x20($v1)
    /* 1B1BC 8002B1BC 21300000 */  addu       $a2, $zero, $zero
    /* 1B1C0 8002B1C0 07008430 */  andi       $a0, $a0, 0x7
    /* 1B1C4 8002B1C4 1B00A210 */  beq        $a1, $v0, .L8002B234
    /* 1B1C8 8002B1C8 21380000 */   addu      $a3, $zero, $zero
    /* 1B1CC 8002B1CC 341D888F */  lw         $t0, %gp_rel(sequence)($gp)
    /* 1B1D0 8002B1D0 21484000 */  addu       $t1, $v0, $zero
  .L8002B1D4:
    /* 1B1D4 8002B1D4 1800A38C */  lw         $v1, 0x18($a1)
    /* 1B1D8 8002B1D8 00000000 */  nop
    /* 1B1DC 8002B1DC 08006230 */  andi       $v0, $v1, 0x8
    /* 1B1E0 8002B1E0 10004010 */  beqz       $v0, .L8002B224
    /* 1B1E4 8002B1E4 07006330 */   andi      $v1, $v1, 0x7
    /* 1B1E8 8002B1E8 2B108300 */  sltu       $v0, $a0, $v1
    /* 1B1EC 8002B1EC 09004014 */  bnez       $v0, .L8002B214
    /* 1B1F0 8002B1F0 00000000 */   nop
    /* 1B1F4 8002B1F4 0B006414 */  bne        $v1, $a0, .L8002B224
    /* 1B1F8 8002B1F8 00000000 */   nop
    /* 1B1FC 8002B1FC 1C00A28C */  lw         $v0, 0x1C($a1)
    /* 1B200 8002B200 00000000 */  nop
    /* 1B204 8002B204 23100201 */  subu       $v0, $t0, $v0
    /* 1B208 8002B208 2B104700 */  sltu       $v0, $v0, $a3
    /* 1B20C 8002B20C 05004014 */  bnez       $v0, .L8002B224
    /* 1B210 8002B210 00000000 */   nop
  .L8002B214:
    /* 1B214 8002B214 2130A000 */  addu       $a2, $a1, $zero
    /* 1B218 8002B218 1C00A28C */  lw         $v0, 0x1C($a1)
    /* 1B21C 8002B21C 21206000 */  addu       $a0, $v1, $zero
    /* 1B220 8002B220 23380201 */  subu       $a3, $t0, $v0
  .L8002B224:
    /* 1B224 8002B224 2000A58C */  lw         $a1, 0x20($a1)
    /* 1B228 8002B228 00000000 */  nop
    /* 1B22C 8002B22C E9FFA914 */  bne        $a1, $t1, .L8002B1D4
    /* 1B230 8002B230 00000000 */   nop
  .L8002B234:
    /* 1B234 8002B234 0400C010 */  beqz       $a2, .L8002B248
    /* 1B238 8002B238 21100000 */   addu      $v0, $zero, $zero
    /* 1B23C 8002B23C D4AB000C */  jal        purgememblocki
    /* 1B240 8002B240 2120C000 */   addu      $a0, $a2, $zero
    /* 1B244 8002B244 01000224 */  addiu      $v0, $zero, 0x1
  .L8002B248:
    /* 1B248 8002B248 1000BF8F */  lw         $ra, 0x10($sp)
    /* 1B24C 8002B24C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1B250 8002B250 0800E003 */  jr         $ra
    /* 1B254 8002B254 00000000 */   nop
endlabel purgeonei
