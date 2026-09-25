.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching BreakObject__Fii, 0x164

glabel BreakObject__Fii
    /* 4EB40 8005EB40 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 4EB44 8005EB44 2000B2AF */  sw         $s2, 0x20($sp)
    /* 4EB48 8005EB48 21908000 */  addu       $s2, $a0, $zero
    /* 4EB4C 8005EB4C 2400B3AF */  sw         $s3, 0x24($sp)
    /* 4EB50 8005EB50 2198A000 */  addu       $s3, $a1, $zero
    /* 4EB54 8005EB54 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 4EB58 8005EB58 2800BFAF */  sw         $ra, 0x28($sp)
    /* 4EB5C 8005EB5C 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 4EB60 8005EB60 2B004212 */  beq        $s2, $v0, .L8005EC10
    /* 4EB64 8005EB64 1800B0AF */   sw        $s0, 0x18($sp)
    /* 4EB68 8005EB68 40801200 */  sll        $s0, $s2, 1
    /* 4EB6C 8005EB6C 21801202 */  addu       $s0, $s0, $s2
    /* 4EB70 8005EB70 80801000 */  sll        $s0, $s0, 2
    /* 4EB74 8005EB74 21801202 */  addu       $s0, $s0, $s2
    /* 4EB78 8005EB78 00811000 */  sll        $s0, $s0, 4
    /* 4EB7C 8005EB7C 23801202 */  subu       $s0, $s0, $s2
    /* 4EB80 8005EB80 80801000 */  sll        $s0, $s0, 2
    /* 4EB84 8005EB84 21801202 */  addu       $s0, $s0, $s2
    /* 4EB88 8005EB88 C0801000 */  sll        $s0, $s0, 3
    /* 4EB8C 8005EB8C 0E80013C */  lui        $at, %hi(plr + 0x1990)
    /* 4EB90 8005EB90 21083000 */  addu       $at, $at, $s0
    /* 4EB94 8005EB94 C8BE318C */  lw         $s1, %lo(plr + 0x1990)($at)
    /* 4EB98 8005EB98 0E80013C */  lui        $at, %hi(plr + 0x1994)
    /* 4EB9C 8005EB9C 21083000 */  addu       $at, $at, $s0
    /* 4EBA0 8005EBA0 CCBE248C */  lw         $a0, %lo(plr + 0x1994)($at)
    /* 4EBA4 8005EBA4 00000000 */  nop
    /* 4EBA8 8005EBA8 23209100 */  subu       $a0, $a0, $s1
    /* 4EBAC 8005EBAC C9F6000C */  jal        ENG_random__Fl
    /* 4EBB0 8005EBB0 01008424 */   addiu     $a0, $a0, 0x1
    /* 4EBB4 8005EBB4 0E80013C */  lui        $at, %hi(plr + 0x199C)
    /* 4EBB8 8005EBB8 21083000 */  addu       $at, $at, $s0
    /* 4EBBC 8005EBBC D4BE238C */  lw         $v1, %lo(plr + 0x199C)($at)
    /* 4EBC0 8005EBC0 21305100 */  addu       $a2, $v0, $s1
    /* 4EBC4 8005EBC4 1800C300 */  mult       $a2, $v1
    /* 4EBC8 8005EBC8 12180000 */  mflo       $v1
    /* 4EBCC 8005EBCC EB51023C */  lui        $v0, (0x51EB851F >> 16)
    /* 4EBD0 8005EBD0 1F854234 */  ori        $v0, $v0, (0x51EB851F & 0xFFFF)
    /* 4EBD4 8005EBD4 18006200 */  mult       $v1, $v0
    /* 4EBD8 8005EBD8 C31F0300 */  sra        $v1, $v1, 31
    /* 4EBDC 8005EBDC 0E80013C */  lui        $at, %hi(plr + 0x19A8)
    /* 4EBE0 8005EBE0 21083000 */  addu       $at, $at, $s0
    /* 4EBE4 8005EBE4 E0BE228C */  lw         $v0, %lo(plr + 0x19A8)($at)
    /* 4EBE8 8005EBE8 10400000 */  mfhi       $t0
    /* 4EBEC 8005EBEC 43210800 */  sra        $a0, $t0, 5
    /* 4EBF0 8005EBF0 23208300 */  subu       $a0, $a0, $v1
    /* 4EBF4 8005EBF4 0E80013C */  lui        $at, %hi(plr + 0x10C)
    /* 4EBF8 8005EBF8 21083000 */  addu       $at, $at, $s0
    /* 4EBFC 8005EBFC 44A6238C */  lw         $v1, %lo(plr + 0x10C)($at)
    /* 4EC00 8005EC00 2130C400 */  addu       $a2, $a2, $a0
    /* 4EC04 8005EC04 21104300 */  addu       $v0, $v0, $v1
    /* 4EC08 8005EC08 057B0108 */  j          .L8005EC14
    /* 4EC0C 8005EC0C 2130C200 */   addu      $a2, $a2, $v0
  .L8005EC10:
    /* 4EC10 8005EC10 0A000624 */  addiu      $a2, $zero, 0xA
  .L8005EC14:
    /* 4EC14 8005EC14 40101300 */  sll        $v0, $s3, 1
    /* 4EC18 8005EC18 21105300 */  addu       $v0, $v0, $s3
    /* 4EC1C 8005EC1C 80100200 */  sll        $v0, $v0, 2
    /* 4EC20 8005EC20 23105300 */  subu       $v0, $v0, $s3
    /* 4EC24 8005EC24 80100200 */  sll        $v0, $v0, 2
    /* 4EC28 8005EC28 0E80013C */  lui        $at, %hi(object + 0x1E)
    /* 4EC2C 8005EC2C 21082200 */  addu       $at, $at, $v0
    /* 4EC30 8005EC30 6A8C2380 */  lb         $v1, %lo(object + 0x1E)($at)
    /* 4EC34 8005EC34 00000000 */  nop
    /* 4EC38 8005EC38 14006228 */  slti       $v0, $v1, 0x14
    /* 4EC3C 8005EC3C 11004014 */  bnez       $v0, .L8005EC84
    /* 4EC40 8005EC40 17006228 */   slti      $v0, $v1, 0x17
    /* 4EC44 8005EC44 05004010 */  beqz       $v0, .L8005EC5C
    /* 4EC48 8005EC48 21204002 */   addu      $a0, $s2, $zero
    /* 4EC4C 8005EC4C ED78010C */  jal        BreakCrux__Fii
    /* 4EC50 8005EC50 21286002 */   addu      $a1, $s3, $zero
    /* 4EC54 8005EC54 217B0108 */  j          .L8005EC84
    /* 4EC58 8005EC58 00000000 */   nop
  .L8005EC5C:
    /* 4EC5C 8005EC5C 3B006228 */  slti       $v0, $v1, 0x3B
    /* 4EC60 8005EC60 08004010 */  beqz       $v0, .L8005EC84
    /* 4EC64 8005EC64 39006228 */   slti      $v0, $v1, 0x39
    /* 4EC68 8005EC68 06004014 */  bnez       $v0, .L8005EC84
    /* 4EC6C 8005EC6C 01000224 */   addiu     $v0, $zero, 0x1
    /* 4EC70 8005EC70 1000A2AF */  sw         $v0, 0x10($sp)
    /* 4EC74 8005EC74 21204002 */  addu       $a0, $s2, $zero
    /* 4EC78 8005EC78 21286002 */  addu       $a1, $s3, $zero
    /* 4EC7C 8005EC7C 7A79010C */  jal        BreakBarrel__FiiiUcUc
    /* 4EC80 8005EC80 21380000 */   addu      $a3, $zero, $zero
  .L8005EC84:
    /* 4EC84 8005EC84 2800BF8F */  lw         $ra, 0x28($sp)
    /* 4EC88 8005EC88 2400B38F */  lw         $s3, 0x24($sp)
    /* 4EC8C 8005EC8C 2000B28F */  lw         $s2, 0x20($sp)
    /* 4EC90 8005EC90 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 4EC94 8005EC94 1800B08F */  lw         $s0, 0x18($sp)
    /* 4EC98 8005EC98 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 4EC9C 8005EC9C 0800E003 */  jr         $ra
    /* 4ECA0 8005ECA0 00000000 */   nop
endlabel BreakObject__Fii
