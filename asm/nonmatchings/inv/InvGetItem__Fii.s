.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching InvGetItem__Fii, 0x2DC

glabel InvGetItem__Fii
    /* 24588 8015E180 1280023C */  lui        $v0, %hi(dropGoldFlag)
    /* 2458C 8015E184 B4B64290 */  lbu        $v0, %lo(dropGoldFlag)($v0)
    /* 24590 8015E188 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 24594 8015E18C 1800B0AF */  sw         $s0, 0x18($sp)
    /* 24598 8015E190 21808000 */  addu       $s0, $a0, $zero
    /* 2459C 8015E194 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 245A0 8015E198 2188A000 */  addu       $s1, $a1, $zero
    /* 245A4 8015E19C 05004010 */  beqz       $v0, .L8015E1B4
    /* 245A8 8015E1A0 2000BFAF */   sw        $ra, 0x20($sp)
    /* 245AC 8015E1A4 1280013C */  lui        $at, %hi(dropGoldFlag)
    /* 245B0 8015E1A8 B4B620A0 */  sb         $zero, %lo(dropGoldFlag)($at)
    /* 245B4 8015E1AC 1280013C */  lui        $at, %hi(dropGoldValue)
    /* 245B8 8015E1B0 C8B620AC */  sw         $zero, %lo(dropGoldValue)($at)
  .L8015E1B4:
    /* 245BC 8015E1B4 C0101100 */  sll        $v0, $s1, 3
    /* 245C0 8015E1B8 23105100 */  subu       $v0, $v0, $s1
    /* 245C4 8015E1BC 80100200 */  sll        $v0, $v0, 2
    /* 245C8 8015E1C0 23105100 */  subu       $v0, $v0, $s1
    /* 245CC 8015E1C4 80100200 */  sll        $v0, $v0, 2
    /* 245D0 8015E1C8 0D80013C */  lui        $at, %hi(item + 0x53)
    /* 245D4 8015E1CC 21082200 */  addu       $at, $at, $v0
    /* 245D8 8015E1D0 A71D2380 */  lb         $v1, %lo(item + 0x53)($at)
    /* 245DC 8015E1D4 0D80013C */  lui        $at, %hi(item + 0x52)
    /* 245E0 8015E1D8 21082200 */  addu       $at, $at, $v0
    /* 245E4 8015E1DC A61D2480 */  lb         $a0, %lo(item + 0x52)($at)
    /* 245E8 8015E1E0 C0180300 */  sll        $v1, $v1, 3
    /* 245EC 8015E1E4 C0100400 */  sll        $v0, $a0, 3
    /* 245F0 8015E1E8 23104400 */  subu       $v0, $v0, $a0
    /* 245F4 8015E1EC C0110200 */  sll        $v0, $v0, 7
    /* 245F8 8015E1F0 21186200 */  addu       $v1, $v1, $v0
    /* 245FC 8015E1F4 0E80013C */  lui        $at, %hi(dung_map + 0x4)
    /* 24600 8015E1F8 21082300 */  addu       $at, $at, $v1
    /* 24604 8015E1FC 2C7A2280 */  lb         $v0, %lo(dung_map + 0x4)($at)
    /* 24608 8015E200 00000000 */  nop
    /* 2460C 8015E204 8F004010 */  beqz       $v0, .L8015E444
    /* 24610 8015E208 00000000 */   nop
    /* 24614 8015E20C 1280023C */  lui        $v0, %hi(myplr)
    /* 24618 8015E210 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 2461C 8015E214 00000000 */  nop
    /* 24620 8015E218 1B005014 */  bne        $v0, $s0, .L8015E288
    /* 24624 8015E21C 40101000 */   sll       $v0, $s0, 1
    /* 24628 8015E220 80101000 */  sll        $v0, $s0, 2
    /* 2462C 8015E224 1280013C */  lui        $at, %hi(_pcurs)
    /* 24630 8015E228 21082200 */  addu       $at, $at, $v0
    /* 24634 8015E22C 30B7228C */  lw         $v0, %lo(_pcurs)($at)
    /* 24638 8015E230 00000000 */  nop
    /* 2463C 8015E234 0C004228 */  slti       $v0, $v0, 0xC
    /* 24640 8015E238 13004014 */  bnez       $v0, .L8015E288
    /* 24644 8015E23C 40101000 */   sll       $v0, $s0, 1
    /* 24648 8015E240 01000424 */  addiu      $a0, $zero, 0x1
    /* 2464C 8015E244 21105000 */  addu       $v0, $v0, $s0
    /* 24650 8015E248 80100200 */  sll        $v0, $v0, 2
    /* 24654 8015E24C 21105000 */  addu       $v0, $v0, $s0
    /* 24658 8015E250 00110200 */  sll        $v0, $v0, 4
    /* 2465C 8015E254 23105000 */  subu       $v0, $v0, $s0
    /* 24660 8015E258 80100200 */  sll        $v0, $v0, 2
    /* 24664 8015E25C 21105000 */  addu       $v0, $v0, $s0
    /* 24668 8015E260 C0100200 */  sll        $v0, $v0, 3
    /* 2466C 8015E264 0E80013C */  lui        $at, %hi(plr + 0x30)
    /* 24670 8015E268 21082200 */  addu       $at, $at, $v0
    /* 24674 8015E26C 68A52690 */  lbu        $a2, %lo(plr + 0x30)($at)
    /* 24678 8015E270 0E80013C */  lui        $at, %hi(plr + 0x32)
    /* 2467C 8015E274 21082200 */  addu       $at, $at, $v0
    /* 24680 8015E278 6AA52790 */  lbu        $a3, %lo(plr + 0x32)($at)
    /* 24684 8015E27C F63E010C */  jal        NetSendCmdPItem__FUcUcUcUc
    /* 24688 8015E280 56000524 */   addiu     $a1, $zero, 0x56
    /* 2468C 8015E284 40101000 */  sll        $v0, $s0, 1
  .L8015E288:
    /* 24690 8015E288 21105000 */  addu       $v0, $v0, $s0
    /* 24694 8015E28C 80100200 */  sll        $v0, $v0, 2
    /* 24698 8015E290 21105000 */  addu       $v0, $v0, $s0
    /* 2469C 8015E294 00110200 */  sll        $v0, $v0, 4
    /* 246A0 8015E298 23105000 */  subu       $v0, $v0, $s0
    /* 246A4 8015E29C 80100200 */  sll        $v0, $v0, 2
    /* 246A8 8015E2A0 21105000 */  addu       $v0, $v0, $s0
    /* 246AC 8015E2A4 C0100200 */  sll        $v0, $v0, 3
    /* 246B0 8015E2A8 0E80033C */  lui        $v1, %hi(plr + 0x1910)
    /* 246B4 8015E2AC 48BE6324 */  addiu      $v1, $v1, %lo(plr + 0x1910)
    /* 246B8 8015E2B0 21384300 */  addu       $a3, $v0, $v1
    /* 246BC 8015E2B4 C0101100 */  sll        $v0, $s1, 3
    /* 246C0 8015E2B8 23105100 */  subu       $v0, $v0, $s1
    /* 246C4 8015E2BC 80100200 */  sll        $v0, $v0, 2
    /* 246C8 8015E2C0 23105100 */  subu       $v0, $v0, $s1
    /* 246CC 8015E2C4 80100200 */  sll        $v0, $v0, 2
    /* 246D0 8015E2C8 0D80033C */  lui        $v1, %hi(item)
    /* 246D4 8015E2CC 541D6324 */  addiu      $v1, $v1, %lo(item)
    /* 246D8 8015E2D0 21304300 */  addu       $a2, $v0, $v1
    /* 246DC 8015E2D4 0D80013C */  lui        $at, %hi(item + 0x24)
    /* 246E0 8015E2D8 21082200 */  addu       $at, $at, $v0
    /* 246E4 8015E2DC 781D2394 */  lhu        $v1, %lo(item + 0x24)($at)
    /* 246E8 8015E2E0 6000C824 */  addiu      $t0, $a2, 0x60
    /* 246EC 8015E2E4 FF7F6330 */  andi       $v1, $v1, 0x7FFF
    /* 246F0 8015E2E8 0D80013C */  lui        $at, %hi(item + 0x24)
    /* 246F4 8015E2EC 21082200 */  addu       $at, $at, $v0
    /* 246F8 8015E2F0 781D23A4 */  sh         $v1, %lo(item + 0x24)($at)
  .L8015E2F4:
    /* 246FC 8015E2F4 0000C28C */  lw         $v0, 0x0($a2)
    /* 24700 8015E2F8 0400C38C */  lw         $v1, 0x4($a2)
    /* 24704 8015E2FC 0800C48C */  lw         $a0, 0x8($a2)
    /* 24708 8015E300 0C00C58C */  lw         $a1, 0xC($a2)
    /* 2470C 8015E304 0000E2AC */  sw         $v0, 0x0($a3)
    /* 24710 8015E308 0400E3AC */  sw         $v1, 0x4($a3)
    /* 24714 8015E30C 0800E4AC */  sw         $a0, 0x8($a3)
    /* 24718 8015E310 0C00E5AC */  sw         $a1, 0xC($a3)
    /* 2471C 8015E314 1000C624 */  addiu      $a2, $a2, 0x10
    /* 24720 8015E318 F6FFC814 */  bne        $a2, $t0, .L8015E2F4
    /* 24724 8015E31C 1000E724 */   addiu     $a3, $a3, 0x10
    /* 24728 8015E320 0000C28C */  lw         $v0, 0x0($a2)
    /* 2472C 8015E324 0400C38C */  lw         $v1, 0x4($a2)
    /* 24730 8015E328 0800C48C */  lw         $a0, 0x8($a2)
    /* 24734 8015E32C 0000E2AC */  sw         $v0, 0x0($a3)
    /* 24738 8015E330 0400E3AC */  sw         $v1, 0x4($a3)
    /* 2473C 8015E334 0800E4AC */  sw         $a0, 0x8($a3)
    /* 24740 8015E338 3477050C */  jal        CheckQuestItem__Fi
    /* 24744 8015E33C 21200002 */   addu      $a0, $s0, $zero
    /* 24748 8015E340 E776050C */  jal        CheckBookLevel__Fi
    /* 2474C 8015E344 21200002 */   addu      $a0, $s0, $zero
    /* 24750 8015E348 C676050C */  jal        CheckItemStats__Fi
    /* 24754 8015E34C 21200002 */   addu      $a0, $s0, $zero
    /* 24758 8015E350 C0101100 */  sll        $v0, $s1, 3
    /* 2475C 8015E354 23105100 */  subu       $v0, $v0, $s1
    /* 24760 8015E358 80100200 */  sll        $v0, $v0, 2
    /* 24764 8015E35C 23105100 */  subu       $v0, $v0, $s1
    /* 24768 8015E360 80100200 */  sll        $v0, $v0, 2
    /* 2476C 8015E364 0D80013C */  lui        $at, %hi(item + 0x53)
    /* 24770 8015E368 21082200 */  addu       $at, $at, $v0
    /* 24774 8015E36C A71D2380 */  lb         $v1, %lo(item + 0x53)($at)
    /* 24778 8015E370 0D80013C */  lui        $at, %hi(item + 0x52)
    /* 2477C 8015E374 21082200 */  addu       $at, $at, $v0
    /* 24780 8015E378 A61D2480 */  lb         $a0, %lo(item + 0x52)($at)
    /* 24784 8015E37C C0180300 */  sll        $v1, $v1, 3
    /* 24788 8015E380 C0100400 */  sll        $v0, $a0, 3
    /* 2478C 8015E384 23104400 */  subu       $v0, $v0, $a0
    /* 24790 8015E388 C0110200 */  sll        $v0, $v0, 7
    /* 24794 8015E38C 21186200 */  addu       $v1, $v1, $v0
    /* 24798 8015E390 0E80013C */  lui        $at, %hi(dung_map + 0x4)
    /* 2479C 8015E394 21082300 */  addu       $at, $at, $v1
    /* 247A0 8015E398 2C7A20A0 */  sb         $zero, %lo(dung_map + 0x4)($at)
    /* 247A4 8015E39C 1280023C */  lui        $v0, %hi(numitems)
    /* 247A8 8015E3A0 88B8428C */  lw         $v0, %lo(numitems)($v0)
    /* 247AC 8015E3A4 00000000 */  nop
    /* 247B0 8015E3A8 12004018 */  blez       $v0, .L8015E3F4
    /* 247B4 8015E3AC 21280000 */   addu      $a1, $zero, $zero
  .L8015E3B0:
    /* 247B8 8015E3B0 0D80013C */  lui        $at, %hi(itemactive)
    /* 247BC 8015E3B4 21082500 */  addu       $at, $at, $a1
    /* 247C0 8015E3B8 54532480 */  lb         $a0, %lo(itemactive)($at)
    /* 247C4 8015E3BC 00000000 */  nop
    /* 247C8 8015E3C0 05009114 */  bne        $a0, $s1, .L8015E3D8
    /* 247CC 8015E3C4 00000000 */   nop
    /* 247D0 8015E3C8 EE15010C */  jal        DeleteItem__Fii
    /* 247D4 8015E3CC 00000000 */   nop
    /* 247D8 8015E3D0 F7780508 */  j          .L8015E3DC
    /* 247DC 8015E3D4 21280000 */   addu      $a1, $zero, $zero
  .L8015E3D8:
    /* 247E0 8015E3D8 0100A524 */  addiu      $a1, $a1, 0x1
  .L8015E3DC:
    /* 247E4 8015E3DC 1280023C */  lui        $v0, %hi(numitems)
    /* 247E8 8015E3E0 88B8428C */  lw         $v0, %lo(numitems)($v0)
    /* 247EC 8015E3E4 00000000 */  nop
    /* 247F0 8015E3E8 2A10A200 */  slt        $v0, $a1, $v0
    /* 247F4 8015E3EC F0FF4014 */  bnez       $v0, .L8015E3B0
    /* 247F8 8015E3F0 00000000 */   nop
  .L8015E3F4:
    /* 247FC 8015E3F4 1280033C */  lui        $v1, %hi(sel_data)
    /* 24800 8015E3F8 2CB7638C */  lw         $v1, %lo(sel_data)($v1)
    /* 24804 8015E3FC FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 24808 8015E400 1280013C */  lui        $at, %hi(_pcursitem)
    /* 2480C 8015E404 21082300 */  addu       $at, $at, $v1
    /* 24810 8015E408 64B722A0 */  sb         $v0, %lo(_pcursitem)($at)
    /* 24814 8015E40C 40101000 */  sll        $v0, $s0, 1
    /* 24818 8015E410 21105000 */  addu       $v0, $v0, $s0
    /* 2481C 8015E414 80100200 */  sll        $v0, $v0, 2
    /* 24820 8015E418 21105000 */  addu       $v0, $v0, $s0
    /* 24824 8015E41C 00110200 */  sll        $v0, $v0, 4
    /* 24828 8015E420 23105000 */  subu       $v0, $v0, $s0
    /* 2482C 8015E424 80100200 */  sll        $v0, $v0, 2
    /* 24830 8015E428 21105000 */  addu       $v0, $v0, $s0
    /* 24834 8015E42C C0100200 */  sll        $v0, $v0, 3
    /* 24838 8015E430 0E80013C */  lui        $at, %hi(plr + 0x195C)
    /* 2483C 8015E434 21082200 */  addu       $at, $at, $v0
    /* 24840 8015E438 94BE2490 */  lbu        $a0, %lo(plr + 0x195C)($at)
    /* 24844 8015E43C 01DE000C */  jal        NewCursor__Fi
    /* 24848 8015E440 0C008424 */   addiu     $a0, $a0, 0xC
  .L8015E444:
    /* 2484C 8015E444 2000BF8F */  lw         $ra, 0x20($sp)
    /* 24850 8015E448 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 24854 8015E44C 1800B08F */  lw         $s0, 0x18($sp)
    /* 24858 8015E450 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 2485C 8015E454 0800E003 */  jr         $ra
    /* 24860 8015E458 00000000 */   nop
endlabel InvGetItem__Fii
