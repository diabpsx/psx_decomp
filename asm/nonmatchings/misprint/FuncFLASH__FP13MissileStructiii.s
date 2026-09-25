.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FuncFLASH__FP13MissileStructiii, 0x160

glabel FuncFLASH__FP13MissileStructiii
    /* 6D24C 8007D24C B0FFBD27 */  addiu      $sp, $sp, -0x50
    /* 6D250 8007D250 4400B3AF */  sw         $s3, 0x44($sp)
    /* 6D254 8007D254 21988000 */  addu       $s3, $a0, $zero
    /* 6D258 8007D258 3800B0AF */  sw         $s0, 0x38($sp)
    /* 6D25C 8007D25C 2180A000 */  addu       $s0, $a1, $zero
    /* 6D260 8007D260 4C00BFAF */  sw         $ra, 0x4C($sp)
    /* 6D264 8007D264 4800B4AF */  sw         $s4, 0x48($sp)
    /* 6D268 8007D268 4000B2AF */  sw         $s2, 0x40($sp)
    /* 6D26C 8007D26C 3C00B1AF */  sw         $s1, 0x3C($sp)
    /* 6D270 8007D270 1A006296 */  lhu        $v0, 0x1A($s3)
    /* 6D274 8007D274 00000000 */  nop
    /* 6D278 8007D278 21004014 */  bnez       $v0, .L8007D300
    /* 6D27C 8007D27C 21A0E000 */   addu      $s4, $a3, $zero
    /* 6D280 8007D280 2E007186 */  lh         $s1, 0x2E($s3)
    /* 6D284 8007D284 58F5010C */  jal        GetPlayer__7CPlayeri_8007d560
    /* 6D288 8007D288 21202002 */   addu      $a0, $s1, $zero
    /* 6D28C 8007D28C 21904000 */  addu       $s2, $v0, $zero
    /* 6D290 8007D290 21204002 */  addu       $a0, $s2, $zero
    /* 6D294 8007D294 40801100 */  sll        $s0, $s1, 1
    /* 6D298 8007D298 21801102 */  addu       $s0, $s0, $s1
    /* 6D29C 8007D29C 80801000 */  sll        $s0, $s0, 2
    /* 6D2A0 8007D2A0 21801102 */  addu       $s0, $s0, $s1
    /* 6D2A4 8007D2A4 00811000 */  sll        $s0, $s0, 4
    /* 6D2A8 8007D2A8 23801102 */  subu       $s0, $s0, $s1
    /* 6D2AC 8007D2AC 80801000 */  sll        $s0, $s0, 2
    /* 6D2B0 8007D2B0 21801102 */  addu       $s0, $s0, $s1
    /* 6D2B4 8007D2B4 C0801000 */  sll        $s0, $s0, 3
    /* 6D2B8 8007D2B8 0E80023C */  lui        $v0, %hi(plr)
    /* 6D2BC 8007D2BC 38A54224 */  addiu      $v0, $v0, %lo(plr)
    /* 6D2C0 8007D2C0 6FF5010C */  jal        GetLastScrX__C7CPlayer_8007d5bc
    /* 6D2C4 8007D2C4 21800202 */   addu      $s0, $s0, $v0
    /* 6D2C8 8007D2C8 1280053C */  lui        $a1, %hi(D_80118CF4)
    /* 6D2CC 8007D2CC F48CA524 */  addiu      $a1, $a1, %lo(D_80118CF4)
    /* 6D2D0 8007D2D0 F6000482 */  lb         $a0, 0xF6($s0)
    /* 6D2D4 8007D2D4 42000382 */  lb         $v1, 0x42($s0)
    /* 6D2D8 8007D2D8 40210400 */  sll        $a0, $a0, 5
    /* 6D2DC 8007D2DC 21208500 */  addu       $a0, $a0, $a1
    /* 6D2E0 8007D2E0 80180300 */  sll        $v1, $v1, 2
    /* 6D2E4 8007D2E4 21186400 */  addu       $v1, $v1, $a0
    /* 6D2E8 8007D2E8 0000638C */  lw         $v1, 0x0($v1)
    /* 6D2EC 8007D2EC 21204002 */  addu       $a0, $s2, $zero
    /* 6D2F0 8007D2F0 21104300 */  addu       $v0, $v0, $v1
    /* 6D2F4 8007D2F4 6CF5010C */  jal        GetLastScrY__C7CPlayer_8007d5b0
    /* 6D2F8 8007D2F8 FAFF5024 */   addiu     $s0, $v0, -0x6
    /* 6D2FC 8007D2FC 02004624 */  addiu      $a2, $v0, 0x2
  .L8007D300:
    /* 6D300 8007D300 47006282 */  lb         $v0, 0x47($s3)
    /* 6D304 8007D304 00000000 */  nop
    /* 6D308 8007D308 00190200 */  sll        $v1, $v0, 4
    /* 6D30C 8007D30C 27006228 */  slti       $v0, $v1, 0x27
    /* 6D310 8007D310 02004014 */  bnez       $v0, .L8007D31C
    /* 6D314 8007D314 4C000224 */   addiu     $v0, $zero, 0x4C
    /* 6D318 8007D318 23184300 */  subu       $v1, $v0, $v1
  .L8007D31C:
    /* 6D31C 8007D31C 1A006018 */  blez       $v1, .L8007D388
    /* 6D320 8007D320 FF000224 */   addiu     $v0, $zero, 0xFF
    /* 6D324 8007D324 1000A2AF */  sw         $v0, 0x10($sp)
    /* 6D328 8007D328 18006224 */  addiu      $v0, $v1, 0x18
    /* 6D32C 8007D32C 1400A2AF */  sw         $v0, 0x14($sp)
    /* 6D330 8007D330 80000224 */  addiu      $v0, $zero, 0x80
    /* 6D334 8007D334 21200002 */  addu       $a0, $s0, $zero
    /* 6D338 8007D338 DCFFC524 */  addiu      $a1, $a2, -0x24
    /* 6D33C 8007D33C A0000624 */  addiu      $a2, $zero, 0xA0
    /* 6D340 8007D340 47006382 */  lb         $v1, 0x47($s3)
    /* 6D344 8007D344 A0000724 */  addiu      $a3, $zero, 0xA0
    /* 6D348 8007D348 80180300 */  sll        $v1, $v1, 2
    /* 6D34C 8007D34C 23104300 */  subu       $v0, $v0, $v1
    /* 6D350 8007D350 1800A2AF */  sw         $v0, 0x18($sp)
    /* 6D354 8007D354 47006382 */  lb         $v1, 0x47($s3)
    /* 6D358 8007D358 01008226 */  addiu      $v0, $s4, 0x1
    /* 6D35C 8007D35C 2400A2AF */  sw         $v0, 0x24($sp)
    /* 6D360 8007D360 01000224 */  addiu      $v0, $zero, 0x1
    /* 6D364 8007D364 2800A2AF */  sw         $v0, 0x28($sp)
    /* 6D368 8007D368 2C00A2AF */  sw         $v0, 0x2C($sp)
    /* 6D36C 8007D36C 08000224 */  addiu      $v0, $zero, 0x8
    /* 6D370 8007D370 2000A0AF */  sw         $zero, 0x20($sp)
    /* 6D374 8007D374 3000A2AF */  sw         $v0, 0x30($sp)
    /* 6D378 8007D378 40100300 */  sll        $v0, $v1, 1
    /* 6D37C 8007D37C 21104300 */  addu       $v0, $v0, $v1
    /* 6D380 8007D380 919A020C */  jal        DrawSpinner__FiiUcUcUciiibiT8T8Uc
    /* 6D384 8007D384 1C00A2AF */   sw        $v0, 0x1C($sp)
  .L8007D388:
    /* 6D388 8007D388 4C00BF8F */  lw         $ra, 0x4C($sp)
    /* 6D38C 8007D38C 4800B48F */  lw         $s4, 0x48($sp)
    /* 6D390 8007D390 4400B38F */  lw         $s3, 0x44($sp)
    /* 6D394 8007D394 4000B28F */  lw         $s2, 0x40($sp)
    /* 6D398 8007D398 3C00B18F */  lw         $s1, 0x3C($sp)
    /* 6D39C 8007D39C 3800B08F */  lw         $s0, 0x38($sp)
    /* 6D3A0 8007D3A0 5000BD27 */  addiu      $sp, $sp, 0x50
    /* 6D3A4 8007D3A4 0800E003 */  jr         $ra
    /* 6D3A8 8007D3A8 00000000 */   nop
endlabel FuncFLASH__FP13MissileStructiii
