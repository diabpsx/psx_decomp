.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching M2MStartKill__Fii, 0x3C8

glabel M2MStartKill__Fii
    /* 12418 8014C010 B0FFBD27 */  addiu      $sp, $sp, -0x50
    /* 1241C 8014C014 3000B2AF */  sw         $s2, 0x30($sp)
    /* 12420 8014C018 2190A000 */  addu       $s2, $a1, $zero
    /* 12424 8014C01C 4400B7AF */  sw         $s7, 0x44($sp)
    /* 12428 8014C020 1080173C */  lui        $s7, %hi(monster)
    /* 1242C 8014C024 9453F726 */  addiu      $s7, $s7, %lo(monster)
    /* 12430 8014C028 40101200 */  sll        $v0, $s2, 1
    /* 12434 8014C02C 21105200 */  addu       $v0, $v0, $s2
    /* 12438 8014C030 80100200 */  sll        $v0, $v0, 2
    /* 1243C 8014C034 21105200 */  addu       $v0, $v0, $s2
    /* 12440 8014C038 3400B3AF */  sw         $s3, 0x34($sp)
    /* 12444 8014C03C C0980200 */  sll        $s3, $v0, 3
    /* 12448 8014C040 21107702 */  addu       $v0, $s3, $s7
    /* 1244C 8014C044 3C00B5AF */  sw         $s5, 0x3C($sp)
    /* 12450 8014C048 34005580 */  lb         $s5, 0x34($v0)
    /* 12454 8014C04C 3800B4AF */  sw         $s4, 0x38($sp)
    /* 12458 8014C050 21A08000 */  addu       $s4, $a0, $zero
    /* 1245C 8014C054 4000B6AF */  sw         $s6, 0x40($sp)
    /* 12460 8014C058 35005680 */  lb         $s6, 0x35($v0)
    /* 12464 8014C05C 40101400 */  sll        $v0, $s4, 1
    /* 12468 8014C060 21105400 */  addu       $v0, $v0, $s4
    /* 1246C 8014C064 80100200 */  sll        $v0, $v0, 2
    /* 12470 8014C068 21105400 */  addu       $v0, $v0, $s4
    /* 12474 8014C06C C0100200 */  sll        $v0, $v0, 3
    /* 12478 8014C070 4800BFAF */  sw         $ra, 0x48($sp)
    /* 1247C 8014C074 2C00B1AF */  sw         $s1, 0x2C($sp)
    /* 12480 8014C078 2800B0AF */  sw         $s0, 0x28($sp)
    /* 12484 8014C07C 1080013C */  lui        $at, %hi(monster + 0x33)
    /* 12488 8014C080 21082200 */  addu       $at, $at, $v0
    /* 1248C 8014C084 C7532380 */  lb         $v1, %lo(monster + 0x33)($at)
    /* 12490 8014C088 0F000224 */  addiu      $v0, $zero, 0xF
    /* 12494 8014C08C 03006214 */  bne        $v1, $v0, .L8014C09C
    /* 12498 8014C090 00000000 */   nop
    /* 1249C 8014C094 657D020C */  jal        MonstPartJump__Fi
    /* 124A0 8014C098 00000000 */   nop
  .L8014C09C:
    /* 124A4 8014C09C 21204002 */  addu       $a0, $s2, $zero
    /* 124A8 8014C0A0 FF00B132 */  andi       $s1, $s5, 0xFF
    /* 124AC 8014C0A4 21282002 */  addu       $a1, $s1, $zero
    /* 124B0 8014C0A8 FF00D032 */  andi       $s0, $s6, 0xFF
    /* 124B4 8014C0AC 1280073C */  lui        $a3, %hi(currlevel)
    /* 124B8 8014C0B0 0CC1E790 */  lbu        $a3, %lo(currlevel)($a3)
    /* 124BC 8014C0B4 BD3A010C */  jal        delta_kill_monster__FiUcUcUc
    /* 124C0 8014C0B8 21300002 */   addu      $a2, $s0, $zero
    /* 124C4 8014C0BC 21200000 */  addu       $a0, $zero, $zero
    /* 124C8 8014C0C0 24000524 */  addiu      $a1, $zero, 0x24
    /* 124CC 8014C0C4 21302002 */  addu       $a2, $s1, $zero
    /* 124D0 8014C0C8 21380002 */  addu       $a3, $s0, $zero
    /* 124D4 8014C0CC FFFF4232 */  andi       $v0, $s2, 0xFFFF
    /* 124D8 8014C0D0 DD3D010C */  jal        NetSendCmdLocParam1__FUcUcUcUcUs
    /* 124DC 8014C0D4 1000A2AF */   sw        $v0, 0x10($sp)
    /* 124E0 8014C0D8 01000224 */  addiu      $v0, $zero, 0x1
    /* 124E4 8014C0DC 1080013C */  lui        $at, %hi(monster + 0x46)
    /* 124E8 8014C0E0 21083300 */  addu       $at, $at, $s3
    /* 124EC 8014C0E4 DA532390 */  lbu        $v1, %lo(monster + 0x46)($at)
    /* 124F0 8014C0E8 04108202 */  sllv       $v0, $v0, $s4
    /* 124F4 8014C0EC 25186200 */  or         $v1, $v1, $v0
    /* 124F8 8014C0F0 0200822A */  slti       $v0, $s4, 0x2
    /* 124FC 8014C0F4 1080013C */  lui        $at, %hi(monster + 0x46)
    /* 12500 8014C0F8 21083300 */  addu       $at, $at, $s3
    /* 12504 8014C0FC DA5323A0 */  sb         $v1, %lo(monster + 0x46)($at)
    /* 12508 8014C100 12004010 */  beqz       $v0, .L8014C14C
    /* 1250C 8014C104 00000000 */   nop
    /* 12510 8014C108 1280103C */  lui        $s0, %hi(myplr)
    /* 12514 8014C10C 08BA108E */  lw         $s0, %lo(myplr)($s0)
    /* 12518 8014C110 1280013C */  lui        $at, %hi(myplr)
    /* 1251C 8014C114 08BA34AC */  sw         $s4, %lo(myplr)($at)
    /* 12520 8014C118 1080013C */  lui        $at, %hi(monster + 0x47)
    /* 12524 8014C11C 21083300 */  addu       $at, $at, $s3
    /* 12528 8014C120 DB532480 */  lb         $a0, %lo(monster + 0x47)($at)
    /* 1252C 8014C124 1080013C */  lui        $at, %hi(monster + 0x2E)
    /* 12530 8014C128 21083300 */  addu       $at, $at, $s3
    /* 12534 8014C12C C2532594 */  lhu        $a1, %lo(monster + 0x2E)($at)
    /* 12538 8014C130 1080013C */  lui        $at, %hi(monster + 0x46)
    /* 1253C 8014C134 21083300 */  addu       $at, $at, $s3
    /* 12540 8014C138 DA532680 */  lb         $a2, %lo(monster + 0x46)($at)
    /* 12544 8014C13C 2882010C */  jal        AddPlrMonstExper__Filc
    /* 12548 8014C140 00000000 */   nop
    /* 1254C 8014C144 1280013C */  lui        $at, %hi(myplr)
    /* 12550 8014C148 08BA30AC */  sw         $s0, %lo(myplr)($at)
  .L8014C14C:
    /* 12554 8014C14C 1080013C */  lui        $at, %hi(monster + 0x60)
    /* 12558 8014C150 21083300 */  addu       $at, $at, $s3
    /* 1255C 8014C154 F453228C */  lw         $v0, %lo(monster + 0x60)($at)
    /* 12560 8014C158 00000000 */  nop
    /* 12564 8014C15C 12004390 */  lbu        $v1, 0x12($v0)
    /* 12568 8014C160 1180023C */  lui        $v0, %hi(monstkills)
    /* 1256C 8014C164 40A24224 */  addiu      $v0, $v0, %lo(monstkills)
    /* 12570 8014C168 40180300 */  sll        $v1, $v1, 1
    /* 12574 8014C16C 21186200 */  addu       $v1, $v1, $v0
    /* 12578 8014C170 00006294 */  lhu        $v0, 0x0($v1)
    /* 1257C 8014C174 00000000 */  nop
    /* 12580 8014C178 01004224 */  addiu      $v0, $v0, 0x1
    /* 12584 8014C17C 000062A4 */  sh         $v0, 0x0($v1)
    /* 12588 8014C180 0200422A */  slti       $v0, $s2, 0x2
    /* 1258C 8014C184 1080013C */  lui        $at, %hi(monster + 0x10)
    /* 12590 8014C188 21083300 */  addu       $at, $at, $s3
    /* 12594 8014C18C A45320AC */  sw         $zero, %lo(monster + 0x10)($at)
    /* 12598 8014C190 05004014 */  bnez       $v0, .L8014C1A8
    /* 1259C 8014C194 21204002 */   addu      $a0, $s2, $zero
    /* 125A0 8014C198 2128A002 */  addu       $a1, $s5, $zero
    /* 125A4 8014C19C 2130C002 */  addu       $a2, $s6, $zero
    /* 125A8 8014C1A0 F211010C */  jal        SpawnItem__FiiiUc
    /* 125AC 8014C1A4 01000724 */   addiu     $a3, $zero, 0x1
  .L8014C1A8:
    /* 125B0 8014C1A8 1080013C */  lui        $at, %hi(monster + 0x60)
    /* 125B4 8014C1AC 21083300 */  addu       $at, $at, $s3
    /* 125B8 8014C1B0 F453228C */  lw         $v0, %lo(monster + 0x60)($at)
    /* 125BC 8014C1B4 00000000 */  nop
    /* 125C0 8014C1B8 12004390 */  lbu        $v1, 0x12($v0)
    /* 125C4 8014C1BC 6E000224 */  addiu      $v0, $zero, 0x6E
    /* 125C8 8014C1C0 07006214 */  bne        $v1, $v0, .L8014C1E0
    /* 125CC 8014C1C4 21208002 */   addu      $a0, $s4, $zero
    /* 125D0 8014C1C8 21204002 */  addu       $a0, $s2, $zero
    /* 125D4 8014C1CC 01000524 */  addiu      $a1, $zero, 0x1
    /* 125D8 8014C1D0 702D050C */  jal        M_DiabloDeath__FiUci
    /* 125DC 8014C1D4 21300000 */   addu      $a2, $zero, $zero
    /* 125E0 8014C1D8 7B300508 */  j          .L8014C1EC
    /* 125E4 8014C1DC 21204002 */   addu      $a0, $s2, $zero
  .L8014C1E0:
    /* 125E8 8014C1E0 4AF5000C */  jal        PlayEffect__Fii
    /* 125EC 8014C1E4 02000524 */   addiu     $a1, $zero, 0x2
    /* 125F0 8014C1E8 21204002 */  addu       $a0, $s2, $zero
  .L8014C1EC:
    /* 125F4 8014C1EC 4AF5000C */  jal        PlayEffect__Fii
    /* 125F8 8014C1F0 02000524 */   addiu     $a1, $zero, 0x2
    /* 125FC 8014C1F4 40101400 */  sll        $v0, $s4, 1
    /* 12600 8014C1F8 21105400 */  addu       $v0, $v0, $s4
    /* 12604 8014C1FC 80100200 */  sll        $v0, $v0, 2
    /* 12608 8014C200 21105400 */  addu       $v0, $v0, $s4
    /* 1260C 8014C204 C0100200 */  sll        $v0, $v0, 3
    /* 12610 8014C208 1080013C */  lui        $at, %hi(monster + 0x3C)
    /* 12614 8014C20C 21082200 */  addu       $at, $at, $v0
    /* 12618 8014C210 D0532380 */  lb         $v1, %lo(monster + 0x3C)($at)
    /* 1261C 8014C214 40101200 */  sll        $v0, $s2, 1
    /* 12620 8014C218 21105200 */  addu       $v0, $v0, $s2
    /* 12624 8014C21C 80100200 */  sll        $v0, $v0, 2
    /* 12628 8014C220 21105200 */  addu       $v0, $v0, $s2
    /* 1262C 8014C224 C0800200 */  sll        $s0, $v0, 3
    /* 12630 8014C228 1080013C */  lui        $at, %hi(monster + 0x60)
    /* 12634 8014C22C 21083000 */  addu       $at, $at, $s0
    /* 12638 8014C230 F453228C */  lw         $v0, %lo(monster + 0x60)($at)
    /* 1263C 8014C234 04006324 */  addiu      $v1, $v1, 0x4
    /* 12640 8014C238 07006630 */  andi       $a2, $v1, 0x7
    /* 12644 8014C23C 12004390 */  lbu        $v1, 0x12($v0)
    /* 12648 8014C240 6D000224 */  addiu      $v0, $zero, 0x6D
    /* 1264C 8014C244 02006214 */  bne        $v1, $v0, .L8014C250
    /* 12650 8014C248 00000000 */   nop
    /* 12654 8014C24C 21300000 */  addu       $a2, $zero, $zero
  .L8014C250:
    /* 12658 8014C250 21204002 */  addu       $a0, $s2, $zero
    /* 1265C 8014C254 1080013C */  lui        $at, %hi(monster + 0x60)
    /* 12660 8014C258 21083000 */  addu       $at, $at, $s0
    /* 12664 8014C25C F453258C */  lw         $a1, %lo(monster + 0x60)($at)
    /* 12668 8014C260 04000724 */  addiu      $a3, $zero, 0x4
    /* 1266C 8014C264 1080013C */  lui        $at, %hi(monster + 0x3C)
    /* 12670 8014C268 21083000 */  addu       $at, $at, $s0
    /* 12674 8014C26C D05326A0 */  sb         $a2, %lo(monster + 0x3C)($at)
    /* 12678 8014C270 3FFD010C */  jal        NewMonsterAnim__FiR10AnimStructii
    /* 1267C 8014C274 0C00A524 */   addiu     $a1, $a1, 0xC
    /* 12680 8014C278 21101702 */  addu       $v0, $s0, $s7
    /* 12684 8014C27C 38005580 */  lb         $s5, 0x38($v0)
    /* 12688 8014C280 39005680 */  lb         $s6, 0x39($v0)
    /* 1268C 8014C284 06000224 */  addiu      $v0, $zero, 0x6
    /* 12690 8014C288 1080013C */  lui        $at, %hi(monster + 0x33)
    /* 12694 8014C28C 21083000 */  addu       $at, $at, $s0
    /* 12698 8014C290 C75322A0 */  sb         $v0, %lo(monster + 0x33)($at)
    /* 1269C 8014C294 1080013C */  lui        $at, %hi(monster + 0x3A)
    /* 126A0 8014C298 21083000 */  addu       $at, $at, $s0
    /* 126A4 8014C29C CE5320A0 */  sb         $zero, %lo(monster + 0x3A)($at)
    /* 126A8 8014C2A0 1080013C */  lui        $at, %hi(monster + 0x3B)
    /* 126AC 8014C2A4 21083000 */  addu       $at, $at, $s0
    /* 126B0 8014C2A8 CF5320A0 */  sb         $zero, %lo(monster + 0x3B)($at)
    /* 126B4 8014C2AC 1080013C */  lui        $at, %hi(monster + 0x34)
    /* 126B8 8014C2B0 21083000 */  addu       $at, $at, $s0
    /* 126BC 8014C2B4 C85335A0 */  sb         $s5, %lo(monster + 0x34)($at)
    /* 126C0 8014C2B8 1080013C */  lui        $at, %hi(monster + 0x35)
    /* 126C4 8014C2BC 21083000 */  addu       $at, $at, $s0
    /* 126C8 8014C2C0 C95336A0 */  sb         $s6, %lo(monster + 0x35)($at)
    /* 126CC 8014C2C4 1080013C */  lui        $at, %hi(monster + 0x36)
    /* 126D0 8014C2C8 21083000 */  addu       $at, $at, $s0
    /* 126D4 8014C2CC CA5335A0 */  sb         $s5, %lo(monster + 0x36)($at)
    /* 126D8 8014C2D0 1080013C */  lui        $at, %hi(monster + 0x37)
    /* 126DC 8014C2D4 21083000 */  addu       $at, $at, $s0
    /* 126E0 8014C2D8 CB5336A0 */  sb         $s6, %lo(monster + 0x37)($at)
    /* 126E4 8014C2DC 1080013C */  lui        $at, %hi(monster + 0x38)
    /* 126E8 8014C2E0 21083000 */  addu       $at, $at, $s0
    /* 126EC 8014C2E4 CC5335A0 */  sb         $s5, %lo(monster + 0x38)($at)
    /* 126F0 8014C2E8 1080013C */  lui        $at, %hi(monster + 0x39)
    /* 126F4 8014C2EC 21083000 */  addu       $at, $at, $s0
    /* 126F8 8014C2F0 CD5336A0 */  sb         $s6, %lo(monster + 0x39)($at)
    /* 126FC 8014C2F4 D5FC010C */  jal        M_CheckEFlag__Fi
    /* 12700 8014C2F8 21204002 */   addu      $a0, $s2, $zero
    /* 12704 8014C2FC D7FC010C */  jal        M_ClearSquares__Fi
    /* 12708 8014C300 21204002 */   addu      $a0, $s2, $zero
    /* 1270C 8014C304 21204002 */  addu       $a0, $s2, $zero
    /* 12710 8014C308 C0181600 */  sll        $v1, $s6, 3
    /* 12714 8014C30C C0101500 */  sll        $v0, $s5, 3
    /* 12718 8014C310 23105500 */  subu       $v0, $v0, $s5
    /* 1271C 8014C314 C0110200 */  sll        $v0, $v0, 7
    /* 12720 8014C318 21186200 */  addu       $v1, $v1, $v0
    /* 12724 8014C31C 01004226 */  addiu      $v0, $s2, 0x1
    /* 12728 8014C320 0E80013C */  lui        $at, %hi(dung_map)
    /* 1272C 8014C324 21082300 */  addu       $at, $at, $v1
    /* 12730 8014C328 287A22A4 */  sh         $v0, %lo(dung_map)($at)
    /* 12734 8014C32C 019F010C */  jal        CheckQuestKill__FiUc
    /* 12738 8014C330 01000524 */   addiu     $a1, $zero, 0x1
    /* 1273C 8014C334 2120A002 */  addu       $a0, $s5, $zero
    /* 12740 8014C338 D355050C */  jal        M_FallenFear__Fii
    /* 12744 8014C33C 2128C002 */   addu      $a1, $s6, $zero
    /* 12748 8014C340 1080013C */  lui        $at, %hi(monster + 0x60)
    /* 1274C 8014C344 21083000 */  addu       $at, $at, $s0
    /* 12750 8014C348 F453228C */  lw         $v0, %lo(monster + 0x60)($at)
    /* 12754 8014C34C 00000000 */  nop
    /* 12758 8014C350 12004290 */  lbu        $v0, 0x12($v0)
    /* 1275C 8014C354 00000000 */  nop
    /* 12760 8014C358 D2FF4224 */  addiu      $v0, $v0, -0x2E
    /* 12764 8014C35C 0400422C */  sltiu      $v0, $v0, 0x4
    /* 12768 8014C360 11004010 */  beqz       $v0, .L8014C3A8
    /* 1276C 8014C364 2120A002 */   addu      $a0, $s5, $zero
    /* 12770 8014C368 2128C002 */  addu       $a1, $s6, $zero
    /* 12774 8014C36C 21300000 */  addu       $a2, $zero, $zero
    /* 12778 8014C370 3B000224 */  addiu      $v0, $zero, 0x3B
    /* 1277C 8014C374 1400A2AF */  sw         $v0, 0x14($sp)
    /* 12780 8014C378 01000224 */  addiu      $v0, $zero, 0x1
    /* 12784 8014C37C 1000A0AF */  sw         $zero, 0x10($sp)
    /* 12788 8014C380 1800A2AF */  sw         $v0, 0x18($sp)
    /* 1278C 8014C384 1C00B2AF */  sw         $s2, 0x1C($sp)
    /* 12790 8014C388 1080013C */  lui        $at, %hi(monster + 0x4D)
    /* 12794 8014C38C 21083000 */  addu       $at, $at, $s0
    /* 12798 8014C390 E1532290 */  lbu        $v0, %lo(monster + 0x4D)($at)
    /* 1279C 8014C394 21380000 */  addu       $a3, $zero, $zero
    /* 127A0 8014C398 2400A0AF */  sw         $zero, 0x24($sp)
    /* 127A4 8014C39C 01004224 */  addiu      $v0, $v0, 0x1
    /* 127A8 8014C3A0 810A050C */  jal        AddMissile__Fiiiiiiciii
    /* 127AC 8014C3A4 2000A2AF */   sw        $v0, 0x20($sp)
  .L8014C3A8:
    /* 127B0 8014C3A8 4800BF8F */  lw         $ra, 0x48($sp)
    /* 127B4 8014C3AC 4400B78F */  lw         $s7, 0x44($sp)
    /* 127B8 8014C3B0 4000B68F */  lw         $s6, 0x40($sp)
    /* 127BC 8014C3B4 3C00B58F */  lw         $s5, 0x3C($sp)
    /* 127C0 8014C3B8 3800B48F */  lw         $s4, 0x38($sp)
    /* 127C4 8014C3BC 3400B38F */  lw         $s3, 0x34($sp)
    /* 127C8 8014C3C0 3000B28F */  lw         $s2, 0x30($sp)
    /* 127CC 8014C3C4 2C00B18F */  lw         $s1, 0x2C($sp)
    /* 127D0 8014C3C8 2800B08F */  lw         $s0, 0x28($sp)
    /* 127D4 8014C3CC 5000BD27 */  addiu      $sp, $sp, 0x50
    /* 127D8 8014C3D0 0800E003 */  jr         $ra
    /* 127DC 8014C3D4 00000000 */   nop
endlabel M2MStartKill__Fii
