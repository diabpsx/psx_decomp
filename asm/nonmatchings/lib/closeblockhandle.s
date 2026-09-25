.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching closeblockhandle, 0xAC

glabel closeblockhandle
    /* 16578 80026578 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1657C 8002657C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 16580 80026580 21808000 */  addu       $s0, $a0, $zero
    /* 16584 80026584 80101000 */  sll        $v0, $s0, 2
    /* 16588 80026588 21105000 */  addu       $v0, $v0, $s0
    /* 1658C 8002658C C0200200 */  sll        $a0, $v0, 3
    /* 16590 80026590 1400BFAF */  sw         $ra, 0x14($sp)
    /* 16594 80026594 0B80013C */  lui        $at, %hi(D_800B6400)
    /* 16598 80026598 21082400 */  addu       $at, $at, $a0
    /* 1659C 8002659C 0064238C */  lw         $v1, %lo(D_800B6400)($at)
    /* 165A0 800265A0 02000224 */  addiu      $v0, $zero, 0x2
    /* 165A4 800265A4 08006214 */  bne        $v1, $v0, .L800265C8
    /* 165A8 800265A8 00000000 */   nop
    /* 165AC 800265AC 0B80013C */  lui        $at, %hi(D_800B6404)
    /* 165B0 800265B0 21082400 */  addu       $at, $at, $a0
    /* 165B4 800265B4 0464248C */  lw         $a0, %lo(D_800B6404)($at)
    /* 165B8 800265B8 76A3000C */  jal        libclosehandle
    /* 165BC 800265BC 00000000 */   nop
    /* 165C0 800265C0 7F990008 */  j          .L800265FC
    /* 165C4 800265C4 80101000 */   sll       $v0, $s0, 2
  .L800265C8:
    /* 165C8 800265C8 681C828F */  lw         $v0, %gp_rel(D_8011C3E8)($gp)
    /* 165CC 800265CC 00000000 */  nop
    /* 165D0 800265D0 0A005014 */  bne        $v0, $s0, .L800265FC
    /* 165D4 800265D4 80101000 */   sll       $v0, $s0, 2
    /* 165D8 800265D8 581C838F */  lw         $v1, %gp_rel(asyncblockstatus)($gp)
    /* 165DC 800265DC 01000224 */  addiu      $v0, $zero, 0x1
    /* 165E0 800265E0 06006214 */  bne        $v1, $v0, .L800265FC
    /* 165E4 800265E4 80101000 */   sll       $v0, $s0, 2
    /* 165E8 800265E8 01000324 */  addiu      $v1, $zero, 0x1
  .L800265EC:
    /* 165EC 800265EC 581C828F */  lw         $v0, %gp_rel(asyncblockstatus)($gp)
    /* 165F0 800265F0 00000000 */  nop
    /* 165F4 800265F4 FDFF4310 */  beq        $v0, $v1, .L800265EC
    /* 165F8 800265F8 80101000 */   sll       $v0, $s0, 2
  .L800265FC:
    /* 165FC 800265FC 21105000 */  addu       $v0, $v0, $s0
    /* 16600 80026600 C0100200 */  sll        $v0, $v0, 3
    /* 16604 80026604 0B80013C */  lui        $at, %hi(D_800B6400)
    /* 16608 80026608 21082200 */  addu       $at, $at, $v0
    /* 1660C 8002660C 006420AC */  sw         $zero, %lo(D_800B6400)($at)
    /* 16610 80026610 1400BF8F */  lw         $ra, 0x14($sp)
    /* 16614 80026614 1000B08F */  lw         $s0, 0x10($sp)
    /* 16618 80026618 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1661C 8002661C 0800E003 */  jr         $ra
    /* 16620 80026620 00000000 */   nop
endlabel closeblockhandle
