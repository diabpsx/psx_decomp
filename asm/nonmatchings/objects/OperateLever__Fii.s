.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching OperateLever__Fii, 0x1E4

glabel OperateLever__Fii
    /* 47C4C 80057C4C D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 47C50 80057C50 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 47C54 80057C54 2188A000 */  addu       $s1, $a1, $zero
    /* 47C58 80057C58 40101100 */  sll        $v0, $s1, 1
    /* 47C5C 80057C5C 21105100 */  addu       $v0, $v0, $s1
    /* 47C60 80057C60 80100200 */  sll        $v0, $v0, 2
    /* 47C64 80057C64 23105100 */  subu       $v0, $v0, $s1
    /* 47C68 80057C68 1800B0AF */  sw         $s0, 0x18($sp)
    /* 47C6C 80057C6C 80800200 */  sll        $s0, $v0, 2
    /* 47C70 80057C70 2000BFAF */  sw         $ra, 0x20($sp)
    /* 47C74 80057C74 0E80013C */  lui        $at, %hi(object + 0x23)
    /* 47C78 80057C78 21083000 */  addu       $at, $at, $s0
    /* 47C7C 80057C7C 6F8C2280 */  lb         $v0, %lo(object + 0x23)($at)
    /* 47C80 80057C80 00000000 */  nop
    /* 47C84 80057C84 64004010 */  beqz       $v0, .L80057E18
    /* 47C88 80057C88 00000000 */   nop
    /* 47C8C 80057C8C 1280023C */  lui        $v0, %hi(deltaload)
    /* 47C90 80057C90 7DB94290 */  lbu        $v0, %lo(deltaload)($v0)
    /* 47C94 80057C94 00000000 */  nop
    /* 47C98 80057C98 09004014 */  bnez       $v0, .L80057CC0
    /* 47C9C 80057C9C 00000000 */   nop
    /* 47CA0 80057CA0 0E80013C */  lui        $at, %hi(object + 0x1F)
    /* 47CA4 80057CA4 21083000 */  addu       $at, $at, $s0
    /* 47CA8 80057CA8 6B8C2580 */  lb         $a1, %lo(object + 0x1F)($at)
    /* 47CAC 80057CAC 0E80013C */  lui        $at, %hi(object + 0x20)
    /* 47CB0 80057CB0 21083000 */  addu       $at, $at, $s0
    /* 47CB4 80057CB4 6C8C2680 */  lb         $a2, %lo(object + 0x20)($at)
    /* 47CB8 80057CB8 E1F5000C */  jal        PlaySfxLoc__Fiii
    /* 47CBC 80057CBC 2B000424 */   addiu     $a0, $zero, 0x2B
  .L80057CC0:
    /* 47CC0 80057CC0 0E80013C */  lui        $at, %hi(object + 0x21)
    /* 47CC4 80057CC4 21083000 */  addu       $at, $at, $s0
    /* 47CC8 80057CC8 6D8C2290 */  lbu        $v0, %lo(object + 0x21)($at)
    /* 47CCC 80057CCC 0E80013C */  lui        $at, %hi(object + 0x23)
    /* 47CD0 80057CD0 21083000 */  addu       $at, $at, $s0
    /* 47CD4 80057CD4 6F8C20A0 */  sb         $zero, %lo(object + 0x23)($at)
    /* 47CD8 80057CD8 01004224 */  addiu      $v0, $v0, 0x1
    /* 47CDC 80057CDC 0E80013C */  lui        $at, %hi(object + 0x21)
    /* 47CE0 80057CE0 21083000 */  addu       $at, $at, $s0
    /* 47CE4 80057CE4 6D8C22A0 */  sb         $v0, %lo(object + 0x21)($at)
    /* 47CE8 80057CE8 1280033C */  lui        $v1, %hi(currlevel)
    /* 47CEC 80057CEC 0CC16390 */  lbu        $v1, %lo(currlevel)($v1)
    /* 47CF0 80057CF0 10000224 */  addiu      $v0, $zero, 0x10
    /* 47CF4 80057CF4 2B006214 */  bne        $v1, $v0, .L80057DA4
    /* 47CF8 80057CF8 01000624 */   addiu     $a2, $zero, 0x1
    /* 47CFC 80057CFC 4C12828F */  lw         $v0, %gp_rel(numobjects)($gp)
    /* 47D00 80057D00 00000000 */  nop
    /* 47D04 80057D04 27004018 */  blez       $v0, .L80057DA4
    /* 47D08 80057D08 21280000 */   addu      $a1, $zero, $zero
    /* 47D0C 80057D0C 1C000924 */  addiu      $t1, $zero, 0x1C
    /* 47D10 80057D10 21400002 */  addu       $t0, $s0, $zero
    /* 47D14 80057D14 21384000 */  addu       $a3, $v0, $zero
  .L80057D18:
    /* 47D18 80057D18 0E80013C */  lui        $at, %hi(objectactive)
    /* 47D1C 80057D1C 21082500 */  addu       $at, $at, $a1
    /* 47D20 80057D20 20A22280 */  lb         $v0, %lo(objectactive)($at)
    /* 47D24 80057D24 00000000 */  nop
    /* 47D28 80057D28 40180200 */  sll        $v1, $v0, 1
    /* 47D2C 80057D2C 21186200 */  addu       $v1, $v1, $v0
    /* 47D30 80057D30 80180300 */  sll        $v1, $v1, 2
    /* 47D34 80057D34 23186200 */  subu       $v1, $v1, $v0
    /* 47D38 80057D38 80200300 */  sll        $a0, $v1, 2
    /* 47D3C 80057D3C 0E80013C */  lui        $at, %hi(object + 0x1E)
    /* 47D40 80057D40 21082400 */  addu       $at, $at, $a0
    /* 47D44 80057D44 6A8C2280 */  lb         $v0, %lo(object + 0x1E)($at)
    /* 47D48 80057D48 00000000 */  nop
    /* 47D4C 80057D4C 11004914 */  bne        $v0, $t1, .L80057D94
    /* 47D50 80057D50 00000000 */   nop
    /* 47D54 80057D54 0E80013C */  lui        $at, %hi(object + 0x1C)
    /* 47D58 80057D58 21082800 */  addu       $at, $at, $t0
    /* 47D5C 80057D5C 688C2384 */  lh         $v1, %lo(object + 0x1C)($at)
    /* 47D60 80057D60 0E80013C */  lui        $at, %hi(object + 0x1C)
    /* 47D64 80057D64 21082400 */  addu       $at, $at, $a0
    /* 47D68 80057D68 688C2284 */  lh         $v0, %lo(object + 0x1C)($at)
    /* 47D6C 80057D6C 00000000 */  nop
    /* 47D70 80057D70 08006214 */  bne        $v1, $v0, .L80057D94
    /* 47D74 80057D74 00000000 */   nop
    /* 47D78 80057D78 0E80013C */  lui        $at, %hi(object + 0x23)
    /* 47D7C 80057D7C 21082400 */  addu       $at, $at, $a0
    /* 47D80 80057D80 6F8C2280 */  lb         $v0, %lo(object + 0x23)($at)
    /* 47D84 80057D84 00000000 */  nop
    /* 47D88 80057D88 02004010 */  beqz       $v0, .L80057D94
    /* 47D8C 80057D8C 00000000 */   nop
    /* 47D90 80057D90 21300000 */  addu       $a2, $zero, $zero
  .L80057D94:
    /* 47D94 80057D94 0100A524 */  addiu      $a1, $a1, 0x1
    /* 47D98 80057D98 2A10A700 */  slt        $v0, $a1, $a3
    /* 47D9C 80057D9C DEFF4014 */  bnez       $v0, .L80057D18
    /* 47DA0 80057DA0 00000000 */   nop
  .L80057DA4:
    /* 47DA4 80057DA4 FF00C230 */  andi       $v0, $a2, 0xFF
    /* 47DA8 80057DA8 13004010 */  beqz       $v0, .L80057DF8
    /* 47DAC 80057DAC 40101100 */   sll       $v0, $s1, 1
    /* 47DB0 80057DB0 21105100 */  addu       $v0, $v0, $s1
    /* 47DB4 80057DB4 80100200 */  sll        $v0, $v0, 2
    /* 47DB8 80057DB8 23105100 */  subu       $v0, $v0, $s1
    /* 47DBC 80057DBC 80100200 */  sll        $v0, $v0, 2
    /* 47DC0 80057DC0 0E80013C */  lui        $at, %hi(object + 0xE)
    /* 47DC4 80057DC4 21082200 */  addu       $at, $at, $v0
    /* 47DC8 80057DC8 5A8C2484 */  lh         $a0, %lo(object + 0xE)($at)
    /* 47DCC 80057DCC 0E80013C */  lui        $at, %hi(object + 0x10)
    /* 47DD0 80057DD0 21082200 */  addu       $at, $at, $v0
    /* 47DD4 80057DD4 5C8C2584 */  lh         $a1, %lo(object + 0x10)($at)
    /* 47DD8 80057DD8 0E80013C */  lui        $at, %hi(object + 0x12)
    /* 47DDC 80057DDC 21082200 */  addu       $at, $at, $v0
    /* 47DE0 80057DE0 5E8C2684 */  lh         $a2, %lo(object + 0x12)($at)
    /* 47DE4 80057DE4 0E80013C */  lui        $at, %hi(object + 0x14)
    /* 47DE8 80057DE8 21082200 */  addu       $at, $at, $v0
    /* 47DEC 80057DEC 608C2784 */  lh         $a3, %lo(object + 0x14)($at)
    /* 47DF0 80057DF0 C95D010C */  jal        ObjChangeMap__Fiiii
    /* 47DF4 80057DF4 00000000 */   nop
  .L80057DF8:
    /* 47DF8 80057DF8 1280023C */  lui        $v0, %hi(deltaload)
    /* 47DFC 80057DFC 7DB94290 */  lbu        $v0, %lo(deltaload)($v0)
    /* 47E00 80057E00 00000000 */  nop
    /* 47E04 80057E04 04004014 */  bnez       $v0, .L80057E18
    /* 47E08 80057E08 21200000 */   addu      $a0, $zero, $zero
    /* 47E0C 80057E0C 2D000524 */  addiu      $a1, $zero, 0x2D
    /* 47E10 80057E10 0D3E010C */  jal        NetSendCmdParam1__FUcUcUs
    /* 47E14 80057E14 FFFF2632 */   andi      $a2, $s1, 0xFFFF
  .L80057E18:
    /* 47E18 80057E18 2000BF8F */  lw         $ra, 0x20($sp)
    /* 47E1C 80057E1C 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 47E20 80057E20 1800B08F */  lw         $s0, 0x18($sp)
    /* 47E24 80057E24 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 47E28 80057E28 0800E003 */  jr         $ra
    /* 47E2C 80057E2C 00000000 */   nop
endlabel OperateLever__Fii
