.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching dequeue_stream, 0xEC

glabel dequeue_stream
    /* 1E15C 80157D54 540D838F */  lw         $v1, %gp_rel(mdec_waiting_tail)($gp)
    /* 1E160 80157D58 5C0D848F */  lw         $a0, %gp_rel(mdecs_waiting)($gp)
    /* 1E164 80157D5C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1E168 80157D60 1400BFAF */  sw         $ra, 0x14($sp)
    /* 1E16C 80157D64 1000B0AF */  sw         $s0, 0x10($sp)
    /* 1E170 80157D68 80100300 */  sll        $v0, $v1, 2
    /* 1E174 80157D6C 21104300 */  addu       $v0, $v0, $v1
    /* 1E178 80157D70 80100200 */  sll        $v0, $v0, 2
    /* 1E17C 80157D74 1580033C */  lui        $v1, %hi(mdec_queue)
    /* 1E180 80157D78 5C5C6324 */  addiu      $v1, $v1, %lo(mdec_queue)
    /* 1E184 80157D7C 2B008010 */  beqz       $a0, .L80157E2C
    /* 1E188 80157D80 21804300 */   addu      $s0, $v0, $v1
    /* 1E18C 80157D84 0800038E */  lw         $v1, 0x8($s0)
    /* 1E190 80157D88 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 1E194 80157D8C 0D006214 */  bne        $v1, $v0, .L80157DC4
    /* 1E198 80157D90 21280000 */   addu      $a1, $zero, $zero
    /* 1E19C 80157D94 0000048E */  lw         $a0, 0x0($s0)
    /* 1E1A0 80157D98 7E59050C */  jal        open_cdstream
    /* 1E1A4 80157D9C FFFF0624 */   addiu     $a2, $zero, -0x1
    /* 1E1A8 80157DA0 480E838F */  lw         $v1, %gp_rel(mdec_sectors_per_frame)($gp)
    /* 1E1AC 80157DA4 00000000 */  nop
    /* 1E1B0 80157DA8 C01A0300 */  sll        $v1, $v1, 11
    /* 1E1B4 80157DAC 1A004300 */  div        $zero, $v0, $v1
    /* 1E1B8 80157DB0 12100000 */  mflo       $v0
    /* 1E1BC 80157DB4 01000324 */  addiu      $v1, $zero, 0x1
    /* 1E1C0 80157DB8 080003AE */  sw         $v1, 0x8($s0)
    /* 1E1C4 80157DBC 7D5F0508 */  j          .L80157DF4
    /* 1E1C8 80157DC0 0C0002AE */   sw        $v0, 0xC($s0)
  .L80157DC4:
    /* 1E1CC 80157DC4 480E828F */  lw         $v0, %gp_rel(mdec_sectors_per_frame)($gp)
    /* 1E1D0 80157DC8 00000000 */  nop
    /* 1E1D4 80157DCC 18006200 */  mult       $v1, $v0
    /* 1E1D8 80157DD0 0C00068E */  lw         $a2, 0xC($s0)
    /* 1E1DC 80157DD4 12280000 */  mflo       $a1
    /* 1E1E0 80157DD8 2330C300 */  subu       $a2, $a2, $v1
    /* 1E1E4 80157DDC 00000000 */  nop
    /* 1E1E8 80157DE0 1800C200 */  mult       $a2, $v0
    /* 1E1EC 80157DE4 0000048E */  lw         $a0, 0x0($s0)
    /* 1E1F0 80157DE8 12300000 */  mflo       $a2
    /* 1E1F4 80157DEC 7E59050C */  jal        open_cdstream
    /* 1E1F8 80157DF0 00000000 */   nop
  .L80157DF4:
    /* 1E1FC 80157DF4 540D858F */  lw         $a1, %gp_rel(mdec_waiting_tail)($gp)
    /* 1E200 80157DF8 01000224 */  addiu      $v0, $zero, 0x1
    /* 1E204 80157DFC 100002AE */  sw         $v0, 0x10($s0)
    /* 1E208 80157E00 5C0D828F */  lw         $v0, %gp_rel(mdecs_waiting)($gp)
    /* 1E20C 80157E04 0100A324 */  addiu      $v1, $a1, 0x1
    /* 1E210 80157E08 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 1E214 80157E0C 5C0D82AF */  sw         $v0, %gp_rel(mdecs_waiting)($gp)
    /* 1E218 80157E10 02006104 */  bgez       $v1, .L80157E1C
    /* 1E21C 80157E14 21206000 */   addu      $a0, $v1, $zero
    /* 1E220 80157E18 1000A424 */  addiu      $a0, $a1, 0x10
  .L80157E1C:
    /* 1E224 80157E1C 03110400 */  sra        $v0, $a0, 4
    /* 1E228 80157E20 00110200 */  sll        $v0, $v0, 4
    /* 1E22C 80157E24 23106200 */  subu       $v0, $v1, $v0
    /* 1E230 80157E28 540D82AF */  sw         $v0, %gp_rel(mdec_waiting_tail)($gp)
  .L80157E2C:
    /* 1E234 80157E2C 1400BF8F */  lw         $ra, 0x14($sp)
    /* 1E238 80157E30 1000B08F */  lw         $s0, 0x10($sp)
    /* 1E23C 80157E34 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1E240 80157E38 0800E003 */  jr         $ra
    /* 1E244 80157E3C 00000000 */   nop
endlabel dequeue_stream
