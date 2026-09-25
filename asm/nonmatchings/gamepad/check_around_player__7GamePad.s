.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching check_around_player__7GamePad, 0x33C

glabel check_around_player__7GamePad
    /* 69FB0 80079FB0 C0FFBD27 */  addiu      $sp, $sp, -0x40
    /* 69FB4 80079FB4 2800B0AF */  sw         $s0, 0x28($sp)
    /* 69FB8 80079FB8 21808000 */  addu       $s0, $a0, $zero
    /* 69FBC 80079FBC 3800BFAF */  sw         $ra, 0x38($sp)
    /* 69FC0 80079FC0 3400B3AF */  sw         $s3, 0x34($sp)
    /* 69FC4 80079FC4 3000B2AF */  sw         $s2, 0x30($sp)
    /* 69FC8 80079FC8 2C00B1AF */  sw         $s1, 0x2C($sp)
    /* 69FCC 80079FCC 0000028E */  lw         $v0, 0x0($s0)
    /* 69FD0 80079FD0 09000424 */  addiu      $a0, $zero, 0x9
    /* 69FD4 80079FD4 30005384 */  lh         $s3, 0x30($v0)
    /* 69FD8 80079FD8 0000438C */  lw         $v1, 0x0($v0)
    /* 69FDC 80079FDC 32005284 */  lh         $s2, 0x32($v0)
    /* 69FE0 80079FE0 BA006410 */  beq        $v1, $a0, .L8007A2CC
    /* 69FE4 80079FE4 00000000 */   nop
    /* 69FE8 80079FE8 36EC010C */  jal        Active__11SpellTarget_8007b0d8
    /* 69FEC 80079FEC 04000426 */   addiu     $a0, $s0, 0x4
    /* 69FF0 80079FF0 B6004014 */  bnez       $v0, .L8007A2CC
    /* 69FF4 80079FF4 FFFF0424 */   addiu     $a0, $zero, -0x1
    /* 69FF8 80079FF8 1280023C */  lui        $v0, %hi(sel_data)
    /* 69FFC 80079FFC 2CB7428C */  lw         $v0, %lo(sel_data)($v0)
    /* 6A000 8007A000 1280013C */  lui        $at, %hi(_pcursobj)
    /* 6A004 8007A004 21082200 */  addu       $at, $at, $v0
    /* 6A008 8007A008 60B724A0 */  sb         $a0, %lo(_pcursobj)($at)
    /* 6A00C 8007A00C 1280033C */  lui        $v1, %hi(sel_data)
    /* 6A010 8007A010 2CB7638C */  lw         $v1, %lo(sel_data)($v1)
    /* 6A014 8007A014 FFFF0524 */  addiu      $a1, $zero, -0x1
    /* 6A018 8007A018 1280013C */  lui        $at, %hi(_pcursitem)
    /* 6A01C 8007A01C 21082300 */  addu       $at, $at, $v1
    /* 6A020 8007A020 64B724A0 */  sb         $a0, %lo(_pcursitem)($at)
    /* 6A024 8007A024 1280033C */  lui        $v1, %hi(invflag)
    /* 6A028 8007A028 2CC36390 */  lbu        $v1, %lo(invflag)($v1)
    /* 6A02C 8007A02C 80100200 */  sll        $v0, $v0, 2
    /* 6A030 8007A030 1280013C */  lui        $at, %hi(_pcursmonst)
    /* 6A034 8007A034 21082200 */  addu       $at, $at, $v0
    /* 6A038 8007A038 58B725AC */  sw         $a1, %lo(_pcursmonst)($at)
    /* 6A03C 8007A03C 0A006010 */  beqz       $v1, .L8007A068
    /* 6A040 8007A040 00000000 */   nop
    /* 6A044 8007A044 1280023C */  lui        $v0, %hi(options_pad)
    /* 6A048 8007A048 50B2428C */  lw         $v0, %lo(options_pad)($v0)
    /* 6A04C 8007A04C 00000000 */  nop
    /* 6A050 8007A050 01004238 */  xori       $v0, $v0, 0x1
    /* 6A054 8007A054 1280013C */  lui        $at, %hi(_pcursitem)
    /* 6A058 8007A058 21082200 */  addu       $at, $at, $v0
    /* 6A05C 8007A05C 64B724A0 */  sb         $a0, %lo(_pcursitem)($at)
    /* 6A060 8007A060 B3E80108 */  j          .L8007A2CC
    /* 6A064 8007A064 00000000 */   nop
  .L8007A068:
    /* 6A068 8007A068 5400038E */  lw         $v1, 0x54($s0)
    /* 6A06C 8007A06C 0A80023C */  lui        $v0, %hi(select_belt_item__Fi)
    /* 6A070 8007A070 600A4224 */  addiu      $v0, $v0, %lo(select_belt_item__Fi)
    /* 6A074 8007A074 4C006214 */  bne        $v1, $v0, .L8007A1A8
    /* 6A078 8007A078 00000000 */   nop
    /* 6A07C 8007A07C 1280033C */  lui        $v1, %hi(sel_data)
    /* 6A080 8007A080 2CB7638C */  lw         $v1, %lo(sel_data)($v1)
    /* 6A084 8007A084 00000000 */  nop
    /* 6A088 8007A088 80100300 */  sll        $v0, $v1, 2
    /* 6A08C 8007A08C 1280013C */  lui        $at, %hi(_pcurr_inv)
    /* 6A090 8007A090 21082200 */  addu       $at, $at, $v0
    /* 6A094 8007A094 D4BB228C */  lw         $v0, %lo(_pcurr_inv)($at)
    /* 6A098 8007A098 1280113C */  lui        $s1, %hi(_pcurr_inv)
    /* 6A09C 8007A09C D4BB3126 */  addiu      $s1, $s1, %lo(_pcurr_inv)
    /* 6A0A0 8007A0A0 3F004510 */  beq        $v0, $a1, .L8007A1A0
    /* 6A0A4 8007A0A4 00000000 */   nop
    /* 6A0A8 8007A0A8 1280013C */  lui        $at, %hi(_pcursinvitem)
    /* 6A0AC 8007A0AC 21082300 */  addu       $at, $at, $v1
    /* 6A0B0 8007A0B0 68B722A0 */  sb         $v0, %lo(_pcursinvitem)($at)
    /* 6A0B4 8007A0B4 C8C7000C */  jal        ClearPanel__Fv
    /* 6A0B8 8007A0B8 00000000 */   nop
    /* 6A0BC 8007A0BC 1280023C */  lui        $v0, %hi(sel_data)
    /* 6A0C0 8007A0C0 2CB7428C */  lw         $v0, %lo(sel_data)($v0)
    /* 6A0C4 8007A0C4 00010624 */  addiu      $a2, $zero, 0x100
    /* 6A0C8 8007A0C8 80100200 */  sll        $v0, $v0, 2
    /* 6A0CC 8007A0CC 21105100 */  addu       $v0, $v0, $s1
    /* 6A0D0 8007A0D0 0000438C */  lw         $v1, 0x0($v0)
    /* 6A0D4 8007A0D4 0000108E */  lw         $s0, 0x0($s0)
    /* 6A0D8 8007A0D8 C0100300 */  sll        $v0, $v1, 3
    /* 6A0DC 8007A0DC 23104300 */  subu       $v0, $v0, $v1
    /* 6A0E0 8007A0E0 80100200 */  sll        $v0, $v0, 2
    /* 6A0E4 8007A0E4 23104300 */  subu       $v0, $v0, $v1
    /* 6A0E8 8007A0E8 80100200 */  sll        $v0, $v0, 2
    /* 6A0EC 8007A0EC B0154224 */  addiu      $v0, $v0, 0x15B0
    /* 6A0F0 8007A0F0 21800202 */  addu       $s0, $s0, $v0
    /* 6A0F4 8007A0F4 28000596 */  lhu        $a1, 0x28($s0)
    /* 6A0F8 8007A0F8 6624010C */  jal        MakeItemStr__FP10ItemStructUsUs
    /* 6A0FC 8007A0FC 21200002 */   addu      $a0, $s0, $zero
    /* 6A100 8007A100 0D80113C */  lui        $s1, %hi(tempstr)
    /* 6A104 8007A104 10EA3126 */  addiu      $s1, $s1, %lo(tempstr)
    /* 6A108 8007A108 21202002 */  addu       $a0, $s1, $zero
    /* 6A10C 8007A10C F240000C */  jal        strcpy
    /* 6A110 8007A110 21284000 */   addu      $a1, $v0, $zero
    /* 6A114 8007A114 21282002 */  addu       $a1, $s1, $zero
    /* 6A118 8007A118 1280043C */  lui        $a0, %hi(sel_data)
    /* 6A11C 8007A11C 2CB7848C */  lw         $a0, %lo(sel_data)($a0)
    /* 6A120 8007A120 0D80023C */  lui        $v0, %hi(_infostr)
    /* 6A124 8007A124 10E84224 */  addiu      $v0, $v0, %lo(_infostr)
    /* 6A128 8007A128 00220400 */  sll        $a0, $a0, 8
    /* 6A12C 8007A12C F240000C */  jal        strcpy
    /* 6A130 8007A130 21208200 */   addu      $a0, $a0, $v0
    /* 6A134 8007A134 1280023C */  lui        $v0, %hi(sel_data)
    /* 6A138 8007A138 2CB7428C */  lw         $v0, %lo(sel_data)($v0)
    /* 6A13C 8007A13C 1280033C */  lui        $v1, %hi(_infoclr)
    /* 6A140 8007A140 BCB66324 */  addiu      $v1, $v1, %lo(_infoclr)
    /* 6A144 8007A144 1280013C */  lui        $at, %hi(_infoclr)
    /* 6A148 8007A148 21082200 */  addu       $at, $at, $v0
    /* 6A14C 8007A14C BCB620A0 */  sb         $zero, %lo(_infoclr)($at)
    /* 6A150 8007A150 51000482 */  lb         $a0, 0x51($s0)
    /* 6A154 8007A154 01000224 */  addiu      $v0, $zero, 0x1
    /* 6A158 8007A158 08008214 */  bne        $a0, $v0, .L8007A17C
    /* 6A15C 8007A15C 02000224 */   addiu     $v0, $zero, 0x2
    /* 6A160 8007A160 1280023C */  lui        $v0, %hi(sel_data)
    /* 6A164 8007A164 2CB7428C */  lw         $v0, %lo(sel_data)($v0)
    /* 6A168 8007A168 00000000 */  nop
    /* 6A16C 8007A16C 21104300 */  addu       $v0, $v0, $v1
    /* 6A170 8007A170 01000324 */  addiu      $v1, $zero, 0x1
    /* 6A174 8007A174 B3E80108 */  j          .L8007A2CC
    /* 6A178 8007A178 000043A0 */   sb        $v1, 0x0($v0)
  .L8007A17C:
    /* 6A17C 8007A17C 53008214 */  bne        $a0, $v0, .L8007A2CC
    /* 6A180 8007A180 00000000 */   nop
    /* 6A184 8007A184 1280023C */  lui        $v0, %hi(sel_data)
    /* 6A188 8007A188 2CB7428C */  lw         $v0, %lo(sel_data)($v0)
    /* 6A18C 8007A18C 00000000 */  nop
    /* 6A190 8007A190 21104300 */  addu       $v0, $v0, $v1
    /* 6A194 8007A194 03000324 */  addiu      $v1, $zero, 0x3
    /* 6A198 8007A198 B3E80108 */  j          .L8007A2CC
    /* 6A19C 8007A19C 000043A0 */   sb        $v1, 0x0($v0)
  .L8007A1A0:
    /* 6A1A0 8007A1A0 6FE80108 */  j          .L8007A1BC
    /* 6A1A4 8007A1A4 540000AE */   sw        $zero, 0x54($s0)
  .L8007A1A8:
    /* 6A1A8 8007A1A8 1280023C */  lui        $v0, %hi(sel_data)
    /* 6A1AC 8007A1AC 2CB7428C */  lw         $v0, %lo(sel_data)($v0)
    /* 6A1B0 8007A1B0 1280013C */  lui        $at, %hi(_pcursinvitem)
    /* 6A1B4 8007A1B4 21082200 */  addu       $at, $at, $v0
    /* 6A1B8 8007A1B8 68B724A0 */  sb         $a0, %lo(_pcursinvitem)($at)
  .L8007A1BC:
    /* 6A1BC 8007A1BC 1280023C */  lui        $v0, %hi(sel_data)
    /* 6A1C0 8007A1C0 2CB7428C */  lw         $v0, %lo(sel_data)($v0)
    /* 6A1C4 8007A1C4 00000000 */  nop
    /* 6A1C8 8007A1C8 80100200 */  sll        $v0, $v0, 2
    /* 6A1CC 8007A1CC 1280013C */  lui        $at, %hi(_pcurr_inv)
    /* 6A1D0 8007A1D0 21082200 */  addu       $at, $at, $v0
    /* 6A1D4 8007A1D4 D4BB238C */  lw         $v1, %lo(_pcurr_inv)($at)
    /* 6A1D8 8007A1D8 FFFF0424 */  addiu      $a0, $zero, -0x1
    /* 6A1DC 8007A1DC 0B006410 */  beq        $v1, $a0, .L8007A20C
    /* 6A1E0 8007A1E0 C0100300 */   sll       $v0, $v1, 3
    /* 6A1E4 8007A1E4 23104300 */  subu       $v0, $v0, $v1
    /* 6A1E8 8007A1E8 80100200 */  sll        $v0, $v0, 2
    /* 6A1EC 8007A1EC 23104300 */  subu       $v0, $v0, $v1
    /* 6A1F0 8007A1F0 0000038E */  lw         $v1, 0x0($s0)
    /* 6A1F4 8007A1F4 80100200 */  sll        $v0, $v0, 2
    /* 6A1F8 8007A1F8 21186200 */  addu       $v1, $v1, $v0
    /* 6A1FC 8007A1FC DC156284 */  lh         $v0, 0x15DC($v1)
    /* 6A200 8007A200 00000000 */  nop
    /* 6A204 8007A204 03004414 */  bne        $v0, $a0, .L8007A214
    /* 6A208 8007A208 00000000 */   nop
  .L8007A20C:
    /* 6A20C 8007A20C FF82020C */  jal        get_next_inv__Fv
    /* 6A210 8007A210 00000000 */   nop
  .L8007A214:
    /* 6A214 8007A214 1280023C */  lui        $v0, %hi(sel_data)
    /* 6A218 8007A218 2CB7428C */  lw         $v0, %lo(sel_data)($v0)
    /* 6A21C 8007A21C 1280013C */  lui        $at, %hi(_pcursinvitem)
    /* 6A220 8007A220 21082200 */  addu       $at, $at, $v0
    /* 6A224 8007A224 68B72380 */  lb         $v1, %lo(_pcursinvitem)($at)
    /* 6A228 8007A228 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 6A22C 8007A22C 27006214 */  bne        $v1, $v0, .L8007A2CC
    /* 6A230 8007A230 21206002 */   addu      $a0, $s3, $zero
    /* 6A234 8007A234 21284002 */  addu       $a1, $s2, $zero
    /* 6A238 8007A238 06000624 */  addiu      $a2, $zero, 0x6
    /* 6A23C 8007A23C 4C000282 */  lb         $v0, 0x4C($s0)
    /* 6A240 8007A240 21380000 */  addu       $a3, $zero, $zero
    /* 6A244 8007A244 A78E020C */  jal        CheckArea__FiiiUci
    /* 6A248 8007A248 1000A2AF */   sw        $v0, 0x10($sp)
    /* 6A24C 8007A24C 8AC8000C */  jal        CheckPanelInfo__Fv
    /* 6A250 8007A250 00000000 */   nop
    /* 6A254 8007A254 0000028E */  lw         $v0, 0x0($s0)
    /* 6A258 8007A258 0000038E */  lw         $v1, 0x0($s0)
    /* 6A25C 8007A25C 30004284 */  lh         $v0, 0x30($v0)
    /* 6A260 8007A260 32006384 */  lh         $v1, 0x32($v1)
    /* 6A264 8007A264 1280013C */  lui        $at, %hi(cursmx)
    /* 6A268 8007A268 50B722AC */  sw         $v0, %lo(cursmx)($at)
    /* 6A26C 8007A26C 1280013C */  lui        $at, %hi(cursmy)
    /* 6A270 8007A270 54B723AC */  sw         $v1, %lo(cursmy)($at)
    /* 6A274 8007A274 79D9010C */  jal        CheckTrigForce__Fv
    /* 6A278 8007A278 00000000 */   nop
    /* 6A27C 8007A27C 0000028E */  lw         $v0, 0x0($s0)
    /* 6A280 8007A280 0000038E */  lw         $v1, 0x0($s0)
    /* 6A284 8007A284 30004284 */  lh         $v0, 0x30($v0)
    /* 6A288 8007A288 32006384 */  lh         $v1, 0x32($v1)
    /* 6A28C 8007A28C 1280013C */  lui        $at, %hi(cursmx)
    /* 6A290 8007A290 50B722AC */  sw         $v0, %lo(cursmx)($at)
    /* 6A294 8007A294 1280013C */  lui        $at, %hi(cursmy)
    /* 6A298 8007A298 54B723AC */  sw         $v1, %lo(cursmy)($at)
    /* 6A29C 8007A29C 21DE000C */  jal        CheckTown__Fv
    /* 6A2A0 8007A2A0 00000000 */   nop
    /* 6A2A4 8007A2A4 0000028E */  lw         $v0, 0x0($s0)
    /* 6A2A8 8007A2A8 0000038E */  lw         $v1, 0x0($s0)
    /* 6A2AC 8007A2AC 30004284 */  lh         $v0, 0x30($v0)
    /* 6A2B0 8007A2B0 32006384 */  lh         $v1, 0x32($v1)
    /* 6A2B4 8007A2B4 1280013C */  lui        $at, %hi(cursmx)
    /* 6A2B8 8007A2B8 50B722AC */  sw         $v0, %lo(cursmx)($at)
    /* 6A2BC 8007A2BC 1280013C */  lui        $at, %hi(cursmy)
    /* 6A2C0 8007A2C0 54B723AC */  sw         $v1, %lo(cursmy)($at)
    /* 6A2C4 8007A2C4 C6DE000C */  jal        CheckRportal__Fv
    /* 6A2C8 8007A2C8 00000000 */   nop
  .L8007A2CC:
    /* 6A2CC 8007A2CC 3800BF8F */  lw         $ra, 0x38($sp)
    /* 6A2D0 8007A2D0 3400B38F */  lw         $s3, 0x34($sp)
    /* 6A2D4 8007A2D4 3000B28F */  lw         $s2, 0x30($sp)
    /* 6A2D8 8007A2D8 2C00B18F */  lw         $s1, 0x2C($sp)
    /* 6A2DC 8007A2DC 2800B08F */  lw         $s0, 0x28($sp)
    /* 6A2E0 8007A2E0 4000BD27 */  addiu      $sp, $sp, 0x40
    /* 6A2E4 8007A2E4 0800E003 */  jr         $ra
    /* 6A2E8 8007A2E8 00000000 */   nop
endlabel check_around_player__7GamePad
