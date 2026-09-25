.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SyncObjectAnim__Fi, 0x140

glabel SyncObjectAnim__Fi
    /* 4F388 8005F388 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 4F38C 8005F38C 40100400 */  sll        $v0, $a0, 1
    /* 4F390 8005F390 21104400 */  addu       $v0, $v0, $a0
    /* 4F394 8005F394 80100200 */  sll        $v0, $v0, 2
    /* 4F398 8005F398 23104400 */  subu       $v0, $v0, $a0
    /* 4F39C 8005F39C 80100200 */  sll        $v0, $v0, 2
    /* 4F3A0 8005F3A0 1000BFAF */  sw         $ra, 0x10($sp)
    /* 4F3A4 8005F3A4 0E80013C */  lui        $at, %hi(object + 0x1E)
    /* 4F3A8 8005F3A8 21082200 */  addu       $at, $at, $v0
    /* 4F3AC 8005F3AC 6A8C2380 */  lb         $v1, %lo(object + 0x1E)($at)
    /* 4F3B0 8005F3B0 00000000 */  nop
    /* 4F3B4 8005F3B4 C0100300 */  sll        $v0, $v1, 3
    /* 4F3B8 8005F3B8 21104300 */  addu       $v0, $v0, $v1
    /* 4F3BC 8005F3BC 40100200 */  sll        $v0, $v0, 1
    /* 4F3C0 8005F3C0 0E80013C */  lui        $at, %hi(AllObjects + 0x1)
    /* 4F3C4 8005F3C4 21082200 */  addu       $at, $at, $v0
    /* 4F3C8 8005F3C8 B1842580 */  lb         $a1, %lo(AllObjects + 0x1)($at)
    /* 4F3CC 8005F3CC 0E80023C */  lui        $v0, %hi(ObjFileList)
    /* 4F3D0 8005F3D0 20A34280 */  lb         $v0, %lo(ObjFileList)($v0)
    /* 4F3D4 8005F3D4 00000000 */  nop
    /* 4F3D8 8005F3D8 08004510 */  beq        $v0, $a1, .L8005F3FC
    /* 4F3DC 8005F3DC 21180000 */   addu      $v1, $zero, $zero
    /* 4F3E0 8005F3E0 01006324 */  addiu      $v1, $v1, 0x1
  .L8005F3E4:
    /* 4F3E4 8005F3E4 0E80013C */  lui        $at, %hi(ObjFileList)
    /* 4F3E8 8005F3E8 21082300 */  addu       $at, $at, $v1
    /* 4F3EC 8005F3EC 20A32280 */  lb         $v0, %lo(ObjFileList)($at)
    /* 4F3F0 8005F3F0 00000000 */  nop
    /* 4F3F4 8005F3F4 FBFF4514 */  bne        $v0, $a1, .L8005F3E4
    /* 4F3F8 8005F3F8 01006324 */   addiu     $v1, $v1, 0x1
  .L8005F3FC:
    /* 4F3FC 8005F3FC 40100400 */  sll        $v0, $a0, 1
    /* 4F400 8005F400 21104400 */  addu       $v0, $v0, $a0
    /* 4F404 8005F404 80100200 */  sll        $v0, $v0, 2
    /* 4F408 8005F408 23104400 */  subu       $v0, $v0, $a0
    /* 4F40C 8005F40C 80100200 */  sll        $v0, $v0, 2
    /* 4F410 8005F410 0E80013C */  lui        $at, %hi(object + 0x1E)
    /* 4F414 8005F414 21082200 */  addu       $at, $at, $v0
    /* 4F418 8005F418 6A8C2290 */  lbu        $v0, %lo(object + 0x1E)($at)
    /* 4F41C 8005F41C 00000000 */  nop
    /* 4F420 8005F420 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 4F424 8005F424 00160200 */  sll        $v0, $v0, 24
    /* 4F428 8005F428 031E0200 */  sra        $v1, $v0, 24
    /* 4F42C 8005F42C 5800622C */  sltiu      $v0, $v1, 0x58
    /* 4F430 8005F430 21004010 */  beqz       $v0, .L8005F4B8
    /* 4F434 8005F434 80100300 */   sll       $v0, $v1, 2
    /* 4F438 8005F438 1180013C */  lui        $at, %hi(jtbl_801172E0)
    /* 4F43C 8005F43C 21082200 */  addu       $at, $at, $v0
    /* 4F440 8005F440 E072228C */  lw         $v0, %lo(jtbl_801172E0)($at)
    /* 4F444 8005F444 00000000 */  nop
    /* 4F448 8005F448 08004000 */  jr         $v0
    /* 4F44C 8005F44C 00000000 */   nop
  jlabel .L8005F450
    /* 4F450 8005F450 487B010C */  jal        SyncL1Doors__Fi
    /* 4F454 8005F454 00000000 */   nop
    /* 4F458 8005F458 2E7D0108 */  j          .L8005F4B8
    /* 4F45C 8005F45C 00000000 */   nop
  jlabel .L8005F460
    /* 4F460 8005F460 3D7C010C */  jal        SyncL2Doors__Fi
    /* 4F464 8005F464 00000000 */   nop
    /* 4F468 8005F468 2E7D0108 */  j          .L8005F4B8
    /* 4F46C 8005F46C 00000000 */   nop
  jlabel .L8005F470
    /* 4F470 8005F470 977C010C */  jal        SyncL3Doors__Fi
    /* 4F474 8005F474 00000000 */   nop
    /* 4F478 8005F478 2E7D0108 */  j          .L8005F4B8
    /* 4F47C 8005F47C 00000000 */   nop
  jlabel .L8005F480
    /* 4F480 8005F480 8E7B010C */  jal        SyncCrux__Fi
    /* 4F484 8005F484 00000000 */   nop
    /* 4F488 8005F488 2E7D0108 */  j          .L8005F4B8
    /* 4F48C 8005F48C 00000000 */   nop
  jlabel .L8005F490
    /* 4F490 8005F490 DC7B010C */  jal        SyncLever__Fi
    /* 4F494 8005F494 00000000 */   nop
    /* 4F498 8005F498 2E7D0108 */  j          .L8005F4B8
    /* 4F49C 8005F49C 00000000 */   nop
  jlabel .L8005F4A0
    /* 4F4A0 8005F4A0 FD7B010C */  jal        SyncQSTLever__Fi
    /* 4F4A4 8005F4A4 00000000 */   nop
    /* 4F4A8 8005F4A8 2E7D0108 */  j          .L8005F4B8
    /* 4F4AC 8005F4AC 00000000 */   nop
  jlabel .L8005F4B0
    /* 4F4B0 8005F4B0 3B7C010C */  jal        SyncPedistal__Fi
    /* 4F4B4 8005F4B4 00000000 */   nop
  jlabel .L8005F4B8
    /* 4F4B8 8005F4B8 1000BF8F */  lw         $ra, 0x10($sp)
    /* 4F4BC 8005F4BC 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 4F4C0 8005F4C0 0800E003 */  jr         $ra
    /* 4F4C4 8005F4C4 00000000 */   nop
endlabel SyncObjectAnim__Fi
