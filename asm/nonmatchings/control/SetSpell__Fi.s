.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetSpell__Fi, 0x10C

glabel SetSpell__Fi
    /* 21D54 80031D54 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 21D58 80031D58 2000B2AF */  sw         $s2, 0x20($sp)
    /* 21D5C 80031D5C 21908000 */  addu       $s2, $a0, $zero
    /* 21D60 80031D60 2400BFAF */  sw         $ra, 0x24($sp)
    /* 21D64 80031D64 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 21D68 80031D68 E385020C */  jal        RemoveTargetCursor__Fi
    /* 21D6C 80031D6C 1800B0AF */   sw        $s0, 0x18($sp)
    /* 21D70 80031D70 01C4000C */  jal        ToggleSpell__Fi
    /* 21D74 80031D74 21204002 */   addu      $a0, $s2, $zero
    /* 21D78 80031D78 C6F5000C */  jal        PlaySFX__Fi
    /* 21D7C 80031D7C 33000424 */   addiu     $a0, $zero, 0x33
    /* 21D80 80031D80 1280023C */  lui        $v0, %hi(sel_data)
    /* 21D84 80031D84 2CB7428C */  lw         $v0, %lo(sel_data)($v0)
    /* 21D88 80031D88 1280043C */  lui        $a0, %hi(D_8011C774)
    /* 21D8C 80031D8C 74C78424 */  addiu      $a0, $a0, %lo(D_8011C774)
    /* 21D90 80031D90 80100200 */  sll        $v0, $v0, 2
    /* 21D94 80031D94 1280013C */  lui        $at, %hi(D_8011C774)
    /* 21D98 80031D98 21082200 */  addu       $at, $at, $v0
    /* 21D9C 80031D9C 74C7238C */  lw         $v1, %lo(D_8011C774)($at)
    /* 21DA0 80031DA0 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 21DA4 80031DA4 27006210 */  beq        $v1, $v0, .L80031E44
    /* 21DA8 80031DA8 80801200 */   sll       $s0, $s2, 2
    /* 21DAC 80031DAC 21880402 */  addu       $s1, $s0, $a0
    /* 21DB0 80031DB0 0000238E */  lw         $v1, 0x0($s1)
    /* 21DB4 80031DB4 00000000 */  nop
    /* 21DB8 80031DB8 40100300 */  sll        $v0, $v1, 1
    /* 21DBC 80031DBC 21104300 */  addu       $v0, $v0, $v1
    /* 21DC0 80031DC0 80100200 */  sll        $v0, $v0, 2
    /* 21DC4 80031DC4 21104300 */  addu       $v0, $v0, $v1
    /* 21DC8 80031DC8 80100200 */  sll        $v0, $v0, 2
    /* 21DCC 80031DCC 0E80013C */  lui        $at, %hi(spelldata)
    /* 21DD0 80031DD0 21082200 */  addu       $at, $at, $v0
    /* 21DD4 80031DD4 80DB2290 */  lbu        $v0, %lo(spelldata)($at)
    /* 21DD8 80031DD8 1280013C */  lui        $at, %hi(D_8011C78C)
    /* 21DDC 80031DDC 21083000 */  addu       $at, $at, $s0
    /* 21DE0 80031DE0 8CC722AC */  sw         $v0, %lo(D_8011C78C)($at)
    /* 21DE4 80031DE4 C8C7000C */  jal        ClearPanel__Fv
    /* 21DE8 80031DE8 00000000 */   nop
    /* 21DEC 80031DEC 40101200 */  sll        $v0, $s2, 1
    /* 21DF0 80031DF0 21105200 */  addu       $v0, $v0, $s2
    /* 21DF4 80031DF4 80100200 */  sll        $v0, $v0, 2
    /* 21DF8 80031DF8 21105200 */  addu       $v0, $v0, $s2
    /* 21DFC 80031DFC 00110200 */  sll        $v0, $v0, 4
    /* 21E00 80031E00 23105200 */  subu       $v0, $v0, $s2
    /* 21E04 80031E04 80100200 */  sll        $v0, $v0, 2
    /* 21E08 80031E08 21105200 */  addu       $v0, $v0, $s2
    /* 21E0C 80031E0C 0000238E */  lw         $v1, 0x0($s1)
    /* 21E10 80031E10 C0100200 */  sll        $v0, $v0, 3
    /* 21E14 80031E14 0E80013C */  lui        $at, %hi(plr + 0x64)
    /* 21E18 80031E18 21082200 */  addu       $at, $at, $v0
    /* 21E1C 80031E1C 9CA523AC */  sw         $v1, %lo(plr + 0x64)($at)
    /* 21E20 80031E20 1280013C */  lui        $at, %hi(D_8011C77C)
    /* 21E24 80031E24 21083000 */  addu       $at, $at, $s0
    /* 21E28 80031E28 7CC7238C */  lw         $v1, %lo(D_8011C77C)($at)
    /* 21E2C 80031E2C 0E80013C */  lui        $at, %hi(plr + 0x68)
    /* 21E30 80031E30 21082200 */  addu       $at, $at, $v0
    /* 21E34 80031E34 A0A523A0 */  sb         $v1, %lo(plr + 0x68)($at)
    /* 21E38 80031E38 FF000224 */  addiu      $v0, $zero, 0xFF
    /* 21E3C 80031E3C 1280013C */  lui        $at, %hi(force_redraw)
    /* 21E40 80031E40 90B722AC */  sw         $v0, %lo(force_redraw)($at)
  .L80031E44:
    /* 21E44 80031E44 2400BF8F */  lw         $ra, 0x24($sp)
    /* 21E48 80031E48 2000B28F */  lw         $s2, 0x20($sp)
    /* 21E4C 80031E4C 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 21E50 80031E50 1800B08F */  lw         $s0, 0x18($sp)
    /* 21E54 80031E54 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 21E58 80031E58 0800E003 */  jr         $ra
    /* 21E5C 80031E5C 00000000 */   nop
endlabel SetSpell__Fi
