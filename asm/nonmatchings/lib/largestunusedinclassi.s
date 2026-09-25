.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching largestunusedinclassi, 0xA8

glabel largestunusedinclassi
    /* 1B3C4 8002B3C4 000F8430 */  andi       $a0, $a0, 0xF00
    /* 1B3C8 8002B3C8 03220400 */  sra        $a0, $a0, 8
    /* 1B3CC 8002B3CC 40100400 */  sll        $v0, $a0, 1
    /* 1B3D0 8002B3D0 21104400 */  addu       $v0, $v0, $a0
    /* 1B3D4 8002B3D4 381D848F */  lw         $a0, %gp_rel(autocompact)($gp)
    /* 1B3D8 8002B3D8 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1B3DC 8002B3DC C0100200 */  sll        $v0, $v0, 3
    /* 1B3E0 8002B3E0 1380033C */  lui        $v1, %hi(memclass)
    /* 1B3E4 8002B3E4 307A6324 */  addiu      $v1, $v1, %lo(memclass)
    /* 1B3E8 8002B3E8 1000B0AF */  sw         $s0, 0x10($sp)
    /* 1B3EC 8002B3EC 21804300 */  addu       $s0, $v0, $v1
    /* 1B3F0 8002B3F0 05008010 */  beqz       $a0, .L8002B408
    /* 1B3F4 8002B3F4 1400BFAF */   sw        $ra, 0x14($sp)
    /* 1B3F8 8002B3F8 0400048E */  lw         $a0, 0x4($s0)
    /* 1B3FC 8002B3FC 0000058E */  lw         $a1, 0x0($s0)
    /* 1B400 8002B400 E9AE000C */  jal        compactupi
    /* 1B404 8002B404 00000000 */   nop
  .L8002B408:
    /* 1B408 8002B408 0000048E */  lw         $a0, 0x0($s0)
    /* 1B40C 8002B40C 0400028E */  lw         $v0, 0x4($s0)
    /* 1B410 8002B410 21380000 */  addu       $a3, $zero, $zero
    /* 1B414 8002B414 1400058E */  lw         $a1, 0x14($s0)
    /* 1B418 8002B418 2000868C */  lw         $a2, 0x20($a0)
    /* 1B41C 8002B41C 2000488C */  lw         $t0, 0x20($v0)
  .L8002B420:
    /* 1B420 8002B420 0000C28C */  lw         $v0, 0x0($a2)
    /* 1B424 8002B424 0000838C */  lw         $v1, 0x0($a0)
    /* 1B428 8002B428 1000848C */  lw         $a0, 0x10($a0)
    /* 1B42C 8002B42C 23104300 */  subu       $v0, $v0, $v1
    /* 1B430 8002B430 23104400 */  subu       $v0, $v0, $a0
    /* 1B434 8002B434 23184500 */  subu       $v1, $v0, $a1
    /* 1B438 8002B438 2A10E300 */  slt        $v0, $a3, $v1
    /* 1B43C 8002B43C 02004010 */  beqz       $v0, .L8002B448
    /* 1B440 8002B440 2120C000 */   addu      $a0, $a2, $zero
    /* 1B444 8002B444 21386000 */  addu       $a3, $v1, $zero
  .L8002B448:
    /* 1B448 8002B448 2000C68C */  lw         $a2, 0x20($a2)
    /* 1B44C 8002B44C 00000000 */  nop
    /* 1B450 8002B450 F3FFC814 */  bne        $a2, $t0, .L8002B420
    /* 1B454 8002B454 2110E000 */   addu      $v0, $a3, $zero
    /* 1B458 8002B458 1400BF8F */  lw         $ra, 0x14($sp)
    /* 1B45C 8002B45C 1000B08F */  lw         $s0, 0x10($sp)
    /* 1B460 8002B460 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1B464 8002B464 0800E003 */  jr         $ra
    /* 1B468 8002B468 00000000 */   nop
endlabel largestunusedinclassi
