.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching get_next_inv__Fv, 0x134

glabel get_next_inv__Fv
    /* 90BFC 800A0BFC 1280023C */  lui        $v0, %hi(sel_data)
    /* 90C00 800A0C00 2CB7428C */  lw         $v0, %lo(sel_data)($v0)
    /* 90C04 800A0C04 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 90C08 800A0C08 1000BFAF */  sw         $ra, 0x10($sp)
    /* 90C0C 800A0C0C 80100200 */  sll        $v0, $v0, 2
    /* 90C10 800A0C10 1280013C */  lui        $at, %hi(_pcurr_inv)
    /* 90C14 800A0C14 21082200 */  addu       $at, $at, $v0
    /* 90C18 800A0C18 D4BB228C */  lw         $v0, %lo(_pcurr_inv)($at)
    /* 90C1C 800A0C1C 00000000 */  nop
    /* 90C20 800A0C20 01004424 */  addiu      $a0, $v0, 0x1
    /* 90C24 800A0C24 08008228 */  slti       $v0, $a0, 0x8
    /* 90C28 800A0C28 1D004010 */  beqz       $v0, .L800A0CA0
    /* 90C2C 800A0C2C FFFF0524 */   addiu     $a1, $zero, -0x1
    /* 90C30 800A0C30 1280023C */  lui        $v0, %hi(myplr)
    /* 90C34 800A0C34 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 90C38 800A0C38 00000000 */  nop
    /* 90C3C 800A0C3C 40180200 */  sll        $v1, $v0, 1
    /* 90C40 800A0C40 21186200 */  addu       $v1, $v1, $v0
    /* 90C44 800A0C44 80180300 */  sll        $v1, $v1, 2
    /* 90C48 800A0C48 21186200 */  addu       $v1, $v1, $v0
    /* 90C4C 800A0C4C 00190300 */  sll        $v1, $v1, 4
    /* 90C50 800A0C50 23186200 */  subu       $v1, $v1, $v0
    /* 90C54 800A0C54 80180300 */  sll        $v1, $v1, 2
    /* 90C58 800A0C58 21186200 */  addu       $v1, $v1, $v0
    /* 90C5C 800A0C5C C0180300 */  sll        $v1, $v1, 3
    /* 90C60 800A0C60 C0100400 */  sll        $v0, $a0, 3
    /* 90C64 800A0C64 23104400 */  subu       $v0, $v0, $a0
    /* 90C68 800A0C68 80100200 */  sll        $v0, $v0, 2
    /* 90C6C 800A0C6C 23104400 */  subu       $v0, $v0, $a0
    /* 90C70 800A0C70 80100200 */  sll        $v0, $v0, 2
    /* 90C74 800A0C74 21184300 */  addu       $v1, $v0, $v1
  .L800A0C78:
    /* 90C78 800A0C78 0E80013C */  lui        $at, %hi(plr + 0x15DC)
    /* 90C7C 800A0C7C 21082300 */  addu       $at, $at, $v1
    /* 90C80 800A0C80 14BB2284 */  lh         $v0, %lo(plr + 0x15DC)($at)
    /* 90C84 800A0C84 00000000 */  nop
    /* 90C88 800A0C88 15004514 */  bne        $v0, $a1, .L800A0CE0
    /* 90C8C 800A0C8C 00000000 */   nop
    /* 90C90 800A0C90 01008424 */  addiu      $a0, $a0, 0x1
    /* 90C94 800A0C94 08008228 */  slti       $v0, $a0, 0x8
    /* 90C98 800A0C98 F7FF4014 */  bnez       $v0, .L800A0C78
    /* 90C9C 800A0C9C 6C006324 */   addiu     $v1, $v1, 0x6C
  .L800A0CA0:
    /* 90CA0 800A0CA0 9A82020C */  jal        any_belt_items__Fv
    /* 90CA4 800A0CA4 00000000 */   nop
    /* 90CA8 800A0CA8 FF004230 */  andi       $v0, $v0, 0xFF
    /* 90CAC 800A0CAC 15004010 */  beqz       $v0, .L800A0D04
    /* 90CB0 800A0CB0 FFFF0324 */   addiu     $v1, $zero, -0x1
    /* 90CB4 800A0CB4 1280023C */  lui        $v0, %hi(sel_data)
    /* 90CB8 800A0CB8 2CB7428C */  lw         $v0, %lo(sel_data)($v0)
    /* 90CBC 800A0CBC 00000000 */  nop
    /* 90CC0 800A0CC0 80100200 */  sll        $v0, $v0, 2
    /* 90CC4 800A0CC4 1280013C */  lui        $at, %hi(_pcurr_inv)
    /* 90CC8 800A0CC8 21082200 */  addu       $at, $at, $v0
    /* 90CCC 800A0CCC D4BB23AC */  sw         $v1, %lo(_pcurr_inv)($at)
    /* 90CD0 800A0CD0 FF82020C */  jal        get_next_inv__Fv
    /* 90CD4 800A0CD4 00000000 */   nop
    /* 90CD8 800A0CD8 48830208 */  j          .L800A0D20
    /* 90CDC 800A0CDC 00000000 */   nop
  .L800A0CE0:
    /* 90CE0 800A0CE0 1280023C */  lui        $v0, %hi(sel_data)
    /* 90CE4 800A0CE4 2CB7428C */  lw         $v0, %lo(sel_data)($v0)
    /* 90CE8 800A0CE8 00000000 */  nop
    /* 90CEC 800A0CEC 80100200 */  sll        $v0, $v0, 2
    /* 90CF0 800A0CF0 1280013C */  lui        $at, %hi(_pcurr_inv)
    /* 90CF4 800A0CF4 21082200 */  addu       $at, $at, $v0
    /* 90CF8 800A0CF8 D4BB24AC */  sw         $a0, %lo(_pcurr_inv)($at)
    /* 90CFC 800A0CFC 48830208 */  j          .L800A0D20
    /* 90D00 800A0D00 00000000 */   nop
  .L800A0D04:
    /* 90D04 800A0D04 1280023C */  lui        $v0, %hi(sel_data)
    /* 90D08 800A0D08 2CB7428C */  lw         $v0, %lo(sel_data)($v0)
    /* 90D0C 800A0D0C 00000000 */  nop
    /* 90D10 800A0D10 80100200 */  sll        $v0, $v0, 2
    /* 90D14 800A0D14 1280013C */  lui        $at, %hi(_pcurr_inv)
    /* 90D18 800A0D18 21082200 */  addu       $at, $at, $v0
    /* 90D1C 800A0D1C D4BB23AC */  sw         $v1, %lo(_pcurr_inv)($at)
  .L800A0D20:
    /* 90D20 800A0D20 1000BF8F */  lw         $ra, 0x10($sp)
    /* 90D24 800A0D24 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 90D28 800A0D28 0800E003 */  jr         $ra
    /* 90D2C 800A0D2C 00000000 */   nop
endlabel get_next_inv__Fv
