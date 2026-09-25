.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching S_ScrollHBuy__Fi, 0x1E8

glabel S_ScrollHBuy__Fi
    /* 5E304 8006E304 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 5E308 8006E308 1800B0AF */  sw         $s0, 0x18($sp)
    /* 5E30C 8006E30C 21808000 */  addu       $s0, $a0, $zero
    /* 5E310 8006E310 05000424 */  addiu      $a0, $zero, 0x5
    /* 5E314 8006E314 15000524 */  addiu      $a1, $zero, 0x15
    /* 5E318 8006E318 2C00BFAF */  sw         $ra, 0x2C($sp)
    /* 5E31C 8006E31C 2800B4AF */  sw         $s4, 0x28($sp)
    /* 5E320 8006E320 2400B3AF */  sw         $s3, 0x24($sp)
    /* 5E324 8006E324 2000B2AF */  sw         $s2, 0x20($sp)
    /* 5E328 8006E328 36A7010C */  jal        ClearSText__Fii
    /* 5E32C 8006E32C 1C00B1AF */   sw        $s1, 0x1C($sp)
    /* 5E330 8006E330 05000224 */  addiu      $v0, $zero, 0x5
    /* 5E334 8006E334 05001324 */  addiu      $s3, $zero, 0x5
    /* 5E338 8006E338 1C2182AF */  sw         $v0, %gp_rel(D_8011C89C)($gp)
    /* 5E33C 8006E33C C0101000 */  sll        $v0, $s0, 3
    /* 5E340 8006E340 23105000 */  subu       $v0, $v0, $s0
    /* 5E344 8006E344 80100200 */  sll        $v0, $v0, 2
    /* 5E348 8006E348 23105000 */  subu       $v0, $v0, $s0
    /* 5E34C 8006E34C 80A00200 */  sll        $s4, $v0, 2
  .L8006E350:
    /* 5E350 8006E350 0F00622A */  slti       $v0, $s3, 0xF
    /* 5E354 8006E354 4A004010 */  beqz       $v0, .L8006E480
    /* 5E358 8006E358 00000000 */   nop
    /* 5E35C 8006E35C 3413838F */  lw         $v1, %gp_rel(StorePlrNo)($gp)
    /* 5E360 8006E360 00000000 */  nop
    /* 5E364 8006E364 00110300 */  sll        $v0, $v1, 4
    /* 5E368 8006E368 21104300 */  addu       $v0, $v0, $v1
    /* 5E36C 8006E36C C0100200 */  sll        $v0, $v0, 3
    /* 5E370 8006E370 23104300 */  subu       $v0, $v0, $v1
    /* 5E374 8006E374 00210200 */  sll        $a0, $v0, 4
    /* 5E378 8006E378 21388402 */  addu       $a3, $s4, $a0
    /* 5E37C 8006E37C 0E80013C */  lui        $at, %hi(_healitem + 0x2C)
    /* 5E380 8006E380 21082700 */  addu       $at, $at, $a3
    /* 5E384 8006E384 FC0B2384 */  lh         $v1, %lo(_healitem + 0x2C)($at)
    /* 5E388 8006E388 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 5E38C 8006E38C 3A006210 */  beq        $v1, $v0, .L8006E478
    /* 5E390 8006E390 00000000 */   nop
    /* 5E394 8006E394 0E80123C */  lui        $s2, %hi(_healitem)
    /* 5E398 8006E398 D00B5226 */  addiu      $s2, $s2, %lo(_healitem)
    /* 5E39C 8006E39C 21909202 */  addu       $s2, $s4, $s2
    /* 5E3A0 8006E3A0 21209200 */  addu       $a0, $a0, $s2
    /* 5E3A4 8006E3A4 38218697 */  lhu        $a2, %gp_rel(D_8011C8B8)($gp)
    /* 5E3A8 8006E3A8 0E80013C */  lui        $at, %hi(_healitem + 0x26)
    /* 5E3AC 8006E3AC 21082700 */  addu       $at, $at, $a3
    /* 5E3B0 8006E3B0 F60B2594 */  lhu        $a1, %lo(_healitem + 0x26)($at)
    /* 5E3B4 8006E3B4 0E80013C */  lui        $at, %hi(_healitem + 0x66)
    /* 5E3B8 8006E3B8 21082700 */  addu       $at, $at, $a3
    /* 5E3BC 8006E3BC 360C3080 */  lb         $s0, %lo(_healitem + 0x66)($at)
    /* 5E3C0 8006E3C0 BCFFC624 */  addiu      $a2, $a2, -0x44
    /* 5E3C4 8006E3C4 FFFFC630 */  andi       $a2, $a2, 0xFFFF
    /* 5E3C8 8006E3C8 0100102E */  sltiu      $s0, $s0, 0x1
    /* 5E3CC 8006E3CC 6624010C */  jal        MakeItemStr__FP10ItemStructUsUs
    /* 5E3D0 8006E3D0 40801000 */   sll       $s0, $s0, 1
    /* 5E3D4 8006E3D4 0C000424 */  addiu      $a0, $zero, 0xC
    /* 5E3D8 8006E3D8 21286002 */  addu       $a1, $s3, $zero
    /* 5E3DC 8006E3DC 21300000 */  addu       $a2, $zero, $zero
    /* 5E3E0 8006E3E0 00861000 */  sll        $s0, $s0, 24
    /* 5E3E4 8006E3E4 03861000 */  sra        $s0, $s0, 24
    /* 5E3E8 8006E3E8 01000324 */  addiu      $v1, $zero, 0x1
    /* 5E3EC 8006E3EC 21884000 */  addu       $s1, $v0, $zero
    /* 5E3F0 8006E3F0 21382002 */  addu       $a3, $s1, $zero
    /* 5E3F4 8006E3F4 1000B0AF */  sw         $s0, 0x10($sp)
    /* 5E3F8 8006E3F8 84A7010C */  jal        AddSText__FiiUcPccUc
    /* 5E3FC 8006E3FC 1400A3AF */   sw        $v1, 0x14($sp)
    /* 5E400 8006E400 3413838F */  lw         $v1, %gp_rel(StorePlrNo)($gp)
    /* 5E404 8006E404 21206002 */  addu       $a0, $s3, $zero
    /* 5E408 8006E408 00110300 */  sll        $v0, $v1, 4
    /* 5E40C 8006E40C 21104300 */  addu       $v0, $v0, $v1
    /* 5E410 8006E410 C0100200 */  sll        $v0, $v0, 3
    /* 5E414 8006E414 23104300 */  subu       $v0, $v0, $v1
    /* 5E418 8006E418 00110200 */  sll        $v0, $v0, 4
    /* 5E41C 8006E41C 21108202 */  addu       $v0, $s4, $v0
    /* 5E420 8006E420 0E80013C */  lui        $at, %hi(_healitem + 0x18)
    /* 5E424 8006E424 21082200 */  addu       $at, $at, $v0
    /* 5E428 8006E428 E80B258C */  lw         $a1, %lo(_healitem + 0x18)($at)
    /* 5E42C 8006E42C 70A7010C */  jal        AddSTextVal__Fii
    /* 5E430 8006E430 6C009426 */   addiu     $s4, $s4, 0x6C
    /* 5E434 8006E434 0C80043C */  lui        $a0, %hi(MediumFont)
    /* 5E438 8006E438 D8828424 */  addiu      $a0, $a0, %lo(MediumFont)
    /* 5E43C 8006E43C 1280063C */  lui        $a2, %hi(D_8011C8BC)
    /* 5E440 8006E440 BCC8C624 */  addiu      $a2, $a2, %lo(D_8011C8BC)
    /* 5E444 8006E444 B229020C */  jal        GetWrap__5CFontPcP4RECT
    /* 5E448 8006E448 21282002 */   addu      $a1, $s1, $zero
    /* 5E44C 8006E44C 21286202 */  addu       $a1, $s3, $v0
    /* 5E450 8006E450 3413828F */  lw         $v0, %gp_rel(StorePlrNo)($gp)
    /* 5E454 8006E454 21300002 */  addu       $a2, $s0, $zero
    /* 5E458 8006E458 00210200 */  sll        $a0, $v0, 4
    /* 5E45C 8006E45C 21208200 */  addu       $a0, $a0, $v0
    /* 5E460 8006E460 C0200400 */  sll        $a0, $a0, 3
    /* 5E464 8006E464 23208200 */  subu       $a0, $a0, $v0
    /* 5E468 8006E468 00210400 */  sll        $a0, $a0, 4
    /* 5E46C 8006E46C B3A7010C */  jal        PrintStoreItem__FPC10ItemStructic
    /* 5E470 8006E470 21209200 */   addu      $a0, $a0, $s2
    /* 5E474 8006E474 202193AF */  sw         $s3, %gp_rel(D_8011C8A0)($gp)
  .L8006E478:
    /* 5E478 8006E478 D4B80108 */  j          .L8006E350
    /* 5E47C 8006E47C 04007326 */   addiu     $s3, $s3, 0x4
  .L8006E480:
    /* 5E480 8006E480 0421838F */  lw         $v1, %gp_rel(D_8011C884)($gp)
    /* 5E484 8006E484 00000000 */  nop
    /* 5E488 8006E488 C0100300 */  sll        $v0, $v1, 3
    /* 5E48C 8006E48C 21104300 */  addu       $v0, $v0, $v1
    /* 5E490 8006E490 80100200 */  sll        $v0, $v0, 2
    /* 5E494 8006E494 23104300 */  subu       $v0, $v0, $v1
    /* 5E498 8006E498 80100200 */  sll        $v0, $v0, 2
    /* 5E49C 8006E49C 1380013C */  lui        $at, %hi(D_8012EECD)
    /* 5E4A0 8006E4A0 21082200 */  addu       $at, $at, $v0
    /* 5E4A4 8006E4A4 CDEE2290 */  lbu        $v0, %lo(D_8012EECD)($at)
    /* 5E4A8 8006E4A8 00000000 */  nop
    /* 5E4AC 8006E4AC 06004014 */  bnez       $v0, .L8006E4C8
    /* 5E4B0 8006E4B0 16000224 */   addiu     $v0, $zero, 0x16
    /* 5E4B4 8006E4B4 04006210 */  beq        $v1, $v0, .L8006E4C8
    /* 5E4B8 8006E4B8 00000000 */   nop
    /* 5E4BC 8006E4BC 2021828F */  lw         $v0, %gp_rel(D_8011C8A0)($gp)
    /* 5E4C0 8006E4C0 00000000 */  nop
    /* 5E4C4 8006E4C4 042182AF */  sw         $v0, %gp_rel(D_8011C884)($gp)
  .L8006E4C8:
    /* 5E4C8 8006E4C8 2C00BF8F */  lw         $ra, 0x2C($sp)
    /* 5E4CC 8006E4CC 2800B48F */  lw         $s4, 0x28($sp)
    /* 5E4D0 8006E4D0 2400B38F */  lw         $s3, 0x24($sp)
    /* 5E4D4 8006E4D4 2000B28F */  lw         $s2, 0x20($sp)
    /* 5E4D8 8006E4D8 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 5E4DC 8006E4DC 1800B08F */  lw         $s0, 0x18($sp)
    /* 5E4E0 8006E4E0 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 5E4E4 8006E4E4 0800E003 */  jr         $ra
    /* 5E4E8 8006E4E8 00000000 */   nop
endlabel S_ScrollHBuy__Fi
