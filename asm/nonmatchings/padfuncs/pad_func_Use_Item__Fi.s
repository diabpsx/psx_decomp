.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching pad_func_Use_Item__Fi, 0x234

glabel pad_func_Use_Item__Fi
    /* 91C44 800A1C44 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 91C48 800A1C48 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 91C4C 800A1C4C 21888000 */  addu       $s1, $a0, $zero
    /* 91C50 800A1C50 2400BFAF */  sw         $ra, 0x24($sp)
    /* 91C54 800A1C54 2000B2AF */  sw         $s2, 0x20($sp)
    /* 91C58 800A1C58 A4BF020C */  jal        GetSpellTarget__Fi
    /* 91C5C 800A1C5C 1800B0AF */   sw        $s0, 0x18($sp)
    /* 91C60 800A1C60 21204000 */  addu       $a0, $v0, $zero
    /* 91C64 800A1C64 1280103C */  lui        $s0, %hi(chrflag)
    /* 91C68 800A1C68 C0B61092 */  lbu        $s0, %lo(chrflag)($s0)
    /* 91C6C 800A1C6C 1280033C */  lui        $v1, %hi(stextflag)
    /* 91C70 800A1C70 E0BA6380 */  lb         $v1, %lo(stextflag)($v1)
    /* 91C74 800A1C74 1280023C */  lui        $v0, %hi(qtextflag)
    /* 91C78 800A1C78 60B94290 */  lbu        $v0, %lo(qtextflag)($v0)
    /* 91C7C 800A1C7C 25800302 */  or         $s0, $s0, $v1
    /* 91C80 800A1C80 25800202 */  or         $s0, $s0, $v0
    /* 91C84 800A1C84 1280033C */  lui        $v1, %hi(sbookflag)
    /* 91C88 800A1C88 C6B66390 */  lbu        $v1, %lo(sbookflag)($v1)
    /* 91C8C 800A1C8C 1280023C */  lui        $v0, %hi(questlog)
    /* 91C90 800A1C90 29BA4290 */  lbu        $v0, %lo(questlog)($v0)
    /* 91C94 800A1C94 25800302 */  or         $s0, $s0, $v1
    /* 91C98 800A1C98 1280033C */  lui        $v1, %hi(optionsflag)
    /* 91C9C 800A1C9C 48B2638C */  lw         $v1, %lo(optionsflag)($v1)
    /* 91CA0 800A1CA0 25800202 */  or         $s0, $s0, $v0
    /* 91CA4 800A1CA4 C890020C */  jal        Active__11SpellTarget_800a4320
    /* 91CA8 800A1CA8 25800302 */   or        $s0, $s0, $v1
    /* 91CAC 800A1CAC 25800202 */  or         $s0, $s0, $v0
    /* 91CB0 800A1CB0 6A000016 */  bnez       $s0, .L800A1E5C
    /* 91CB4 800A1CB4 40101100 */   sll       $v0, $s1, 1
    /* 91CB8 800A1CB8 21105100 */  addu       $v0, $v0, $s1
    /* 91CBC 800A1CBC 80100200 */  sll        $v0, $v0, 2
    /* 91CC0 800A1CC0 21105100 */  addu       $v0, $v0, $s1
    /* 91CC4 800A1CC4 00110200 */  sll        $v0, $v0, 4
    /* 91CC8 800A1CC8 23105100 */  subu       $v0, $v0, $s1
    /* 91CCC 800A1CCC 80100200 */  sll        $v0, $v0, 2
    /* 91CD0 800A1CD0 21105100 */  addu       $v0, $v0, $s1
    /* 91CD4 800A1CD4 C0100200 */  sll        $v0, $v0, 3
    /* 91CD8 800A1CD8 0E80043C */  lui        $a0, %hi(plr)
    /* 91CDC 800A1CDC 38A58424 */  addiu      $a0, $a0, %lo(plr)
    /* 91CE0 800A1CE0 21904400 */  addu       $s2, $v0, $a0
    /* 91CE4 800A1CE4 1280033C */  lui        $v1, %hi(sel_data)
    /* 91CE8 800A1CE8 2CB7638C */  lw         $v1, %lo(sel_data)($v1)
    /* 91CEC 800A1CEC 1280103C */  lui        $s0, %hi(_pcurr_inv)
    /* 91CF0 800A1CF0 D4BB1026 */  addiu      $s0, $s0, %lo(_pcurr_inv)
    /* 91CF4 800A1CF4 80180300 */  sll        $v1, $v1, 2
    /* 91CF8 800A1CF8 1280013C */  lui        $at, %hi(_pcurr_inv)
    /* 91CFC 800A1CFC 21082300 */  addu       $at, $at, $v1
    /* 91D00 800A1D00 D4BB238C */  lw         $v1, %lo(_pcurr_inv)($at)
    /* 91D04 800A1D04 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 91D08 800A1D08 54006210 */  beq        $v1, $v0, .L800A1E5C
    /* 91D0C 800A1D0C 00000000 */   nop
    /* 91D10 800A1D10 01DE000C */  jal        NewCursor__Fi
    /* 91D14 800A1D14 01000424 */   addiu     $a0, $zero, 0x1
    /* 91D18 800A1D18 1280023C */  lui        $v0, %hi(sel_data)
    /* 91D1C 800A1D1C 2CB7428C */  lw         $v0, %lo(sel_data)($v0)
    /* 91D20 800A1D20 00000000 */  nop
    /* 91D24 800A1D24 80100200 */  sll        $v0, $v0, 2
    /* 91D28 800A1D28 21105000 */  addu       $v0, $v0, $s0
    /* 91D2C 800A1D2C 0000438C */  lw         $v1, 0x0($v0)
    /* 91D30 800A1D30 00000000 */  nop
    /* 91D34 800A1D34 C0100300 */  sll        $v0, $v1, 3
    /* 91D38 800A1D38 23104300 */  subu       $v0, $v0, $v1
    /* 91D3C 800A1D3C 80100200 */  sll        $v0, $v0, 2
    /* 91D40 800A1D40 23104300 */  subu       $v0, $v0, $v1
    /* 91D44 800A1D44 80100200 */  sll        $v0, $v0, 2
    /* 91D48 800A1D48 21104202 */  addu       $v0, $s2, $v0
    /* 91D4C 800A1D4C FD154390 */  lbu        $v1, 0x15FD($v0)
    /* 91D50 800A1D50 15000224 */  addiu      $v0, $zero, 0x15
    /* 91D54 800A1D54 08006214 */  bne        $v1, $v0, .L800A1D78
    /* 91D58 800A1D58 00000000 */   nop
    /* 91D5C 800A1D5C A4BF020C */  jal        GetSpellTarget__Fi
    /* 91D60 800A1D60 21202002 */   addu      $a0, $s1, $zero
    /* 91D64 800A1D64 C890020C */  jal        Active__11SpellTarget_800a4320
    /* 91D68 800A1D68 21204000 */   addu      $a0, $v0, $zero
    /* 91D6C 800A1D6C 01004238 */  xori       $v0, $v0, 0x1
    /* 91D70 800A1D70 38004010 */  beqz       $v0, .L800A1E54
    /* 91D74 800A1D74 00000000 */   nop
  .L800A1D78:
    /* 91D78 800A1D78 1280023C */  lui        $v0, %hi(sel_data)
    /* 91D7C 800A1D7C 2CB7428C */  lw         $v0, %lo(sel_data)($v0)
    /* 91D80 800A1D80 00000000 */  nop
    /* 91D84 800A1D84 80100200 */  sll        $v0, $v0, 2
    /* 91D88 800A1D88 21105000 */  addu       $v0, $v0, $s0
    /* 91D8C 800A1D8C 0000458C */  lw         $a1, 0x0($v0)
    /* 91D90 800A1D90 21202002 */  addu       $a0, $s1, $zero
    /* 91D94 800A1D94 1C81050C */  jal        func_80160470
    /* 91D98 800A1D98 2F00A524 */   addiu     $a1, $a1, 0x2F
    /* 91D9C 800A1D9C FF004230 */  andi       $v0, $v0, 0xFF
    /* 91DA0 800A1DA0 17004010 */  beqz       $v0, .L800A1E00
    /* 91DA4 800A1DA4 00000000 */   nop
    /* 91DA8 800A1DA8 FF82020C */  jal        get_next_inv__Fv
    /* 91DAC 800A1DAC 00000000 */   nop
    /* 91DB0 800A1DB0 1280023C */  lui        $v0, %hi(sel_data)
    /* 91DB4 800A1DB4 2CB7428C */  lw         $v0, %lo(sel_data)($v0)
    /* 91DB8 800A1DB8 1280013C */  lui        $at, %hi(_SpdBeltSelFlag)
    /* 91DBC 800A1DBC 21083100 */  addu       $at, $at, $s1
    /* 91DC0 800A1DC0 C4BB2490 */  lbu        $a0, %lo(_SpdBeltSelFlag)($at)
    /* 91DC4 800A1DC4 FFFF0324 */  addiu      $v1, $zero, -0x1
    /* 91DC8 800A1DC8 1280013C */  lui        $at, %hi(_pcursinvitem)
    /* 91DCC 800A1DCC 21082200 */  addu       $at, $at, $v0
    /* 91DD0 800A1DD0 68B723A0 */  sb         $v1, %lo(_pcursinvitem)($at)
    /* 91DD4 800A1DD4 0C008010 */  beqz       $a0, .L800A1E08
    /* 91DD8 800A1DD8 06002426 */   addiu     $a0, $s1, 0x6
    /* 91DDC 800A1DDC 1280013C */  lui        $at, %hi(_SpdBeltSelFlag)
    /* 91DE0 800A1DE0 21083100 */  addu       $at, $at, $s1
    /* 91DE4 800A1DE4 C4BB20A0 */  sb         $zero, %lo(_SpdBeltSelFlag)($at)
    /* 91DE8 800A1DE8 21280000 */  addu       $a1, $zero, $zero
    /* 91DEC 800A1DEC 21300000 */  addu       $a2, $zero, $zero
    /* 91DF0 800A1DF0 53EB010C */  jal        PostGamePad__Fiiii
    /* 91DF4 800A1DF4 21380000 */   addu      $a3, $zero, $zero
    /* 91DF8 800A1DF8 82870208 */  j          .L800A1E08
    /* 91DFC 800A1DFC 00000000 */   nop
  .L800A1E00:
    /* 91E00 800A1E00 C6F5000C */  jal        PlaySFX__Fi
    /* 91E04 800A1E04 D3030424 */   addiu     $a0, $zero, 0x3D3
  .L800A1E08:
    /* 91E08 800A1E08 9A82020C */  jal        any_belt_items__Fv
    /* 91E0C 800A1E0C 00000000 */   nop
    /* 91E10 800A1E10 FF004230 */  andi       $v0, $v0, 0xFF
    /* 91E14 800A1E14 11004014 */  bnez       $v0, .L800A1E5C
    /* 91E18 800A1E18 06002426 */   addiu     $a0, $s1, 0x6
    /* 91E1C 800A1E1C 21280000 */  addu       $a1, $zero, $zero
    /* 91E20 800A1E20 21300000 */  addu       $a2, $zero, $zero
    /* 91E24 800A1E24 80181100 */  sll        $v1, $s1, 2
    /* 91E28 800A1E28 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 91E2C 800A1E2C 1280013C */  lui        $at, %hi(_pcurr_inv)
    /* 91E30 800A1E30 21082300 */  addu       $at, $at, $v1
    /* 91E34 800A1E34 D4BB22AC */  sw         $v0, %lo(_pcurr_inv)($at)
    /* 91E38 800A1E38 1280013C */  lui        $at, %hi(_SpdBeltSelFlag)
    /* 91E3C 800A1E3C 21083100 */  addu       $at, $at, $s1
    /* 91E40 800A1E40 C4BB20A0 */  sb         $zero, %lo(_SpdBeltSelFlag)($at)
    /* 91E44 800A1E44 53EB010C */  jal        PostGamePad__Fiiii
    /* 91E48 800A1E48 21380000 */   addu      $a3, $zero, $zero
    /* 91E4C 800A1E4C 97870208 */  j          .L800A1E5C
    /* 91E50 800A1E50 00000000 */   nop
  .L800A1E54:
    /* 91E54 800A1E54 C6F5000C */  jal        PlaySFX__Fi
    /* 91E58 800A1E58 D3030424 */   addiu     $a0, $zero, 0x3D3
  .L800A1E5C:
    /* 91E5C 800A1E5C 2400BF8F */  lw         $ra, 0x24($sp)
    /* 91E60 800A1E60 2000B28F */  lw         $s2, 0x20($sp)
    /* 91E64 800A1E64 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 91E68 800A1E68 1800B08F */  lw         $s0, 0x18($sp)
    /* 91E6C 800A1E6C 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 91E70 800A1E70 0800E003 */  jr         $ra
    /* 91E74 800A1E74 00000000 */   nop
endlabel pad_func_Use_Item__Fi
