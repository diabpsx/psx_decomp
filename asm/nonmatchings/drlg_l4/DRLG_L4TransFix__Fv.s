.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DRLG_L4TransFix__Fv, 0x36C

glabel DRLG_L4TransFix__Fv
    /* 1A558 80154150 A8FFBD27 */  addiu      $sp, $sp, -0x58
    /* 1A55C 80154154 10000824 */  addiu      $t0, $zero, 0x10
    /* 1A560 80154158 21380000 */  addu       $a3, $zero, $zero
    /* 1A564 8015415C 1000A8AF */  sw         $t0, 0x10($sp)
    /* 1A568 80154160 78000824 */  addiu      $t0, $zero, 0x78
    /* 1A56C 80154164 4000B4AF */  sw         $s4, 0x40($sp)
    /* 1A570 80154168 88001424 */  addiu      $s4, $zero, 0x88
    /* 1A574 8015416C 5400BFAF */  sw         $ra, 0x54($sp)
    /* 1A578 80154170 5000BEAF */  sw         $fp, 0x50($sp)
    /* 1A57C 80154174 4C00B7AF */  sw         $s7, 0x4C($sp)
    /* 1A580 80154178 4800B6AF */  sw         $s6, 0x48($sp)
    /* 1A584 8015417C 4400B5AF */  sw         $s5, 0x44($sp)
    /* 1A588 80154180 3C00B3AF */  sw         $s3, 0x3C($sp)
    /* 1A58C 80154184 3800B2AF */  sw         $s2, 0x38($sp)
    /* 1A590 80154188 3400B1AF */  sw         $s1, 0x34($sp)
    /* 1A594 8015418C 3000B0AF */  sw         $s0, 0x30($sp)
    /* 1A598 80154190 1800A8AF */  sw         $t0, 0x18($sp)
  .L80154194:
    /* 1A59C 80154194 40B80700 */  sll        $s7, $a3, 1
    /* 1A5A0 80154198 0E80153C */  lui        $s5, %hi(dungeon)
    /* 1A5A4 8015419C C440B526 */  addiu      $s5, $s5, %lo(dungeon)
    /* 1A5A8 801541A0 21300000 */  addu       $a2, $zero, $zero
    /* 1A5AC 801541A4 1000A88F */  lw         $t0, 0x10($sp)
    /* 1A5B0 801541A8 803B1224 */  addiu      $s2, $zero, 0x3B80
    /* 1A5B4 801541AC 00380524 */  addiu      $a1, $zero, 0x3800
    /* 1A5B8 801541B0 00389326 */  addiu      $s3, $s4, 0x3800
    /* 1A5BC 801541B4 80341E24 */  addiu      $fp, $zero, 0x3480
    /* 1A5C0 801541B8 C0B00800 */  sll        $s6, $t0, 3
    /* 1A5C4 801541BC 0038D126 */  addiu      $s1, $s6, 0x3800
  .L801541C0:
    /* 1A5C8 801541C0 2180F502 */  addu       $s0, $s7, $s5
    /* 1A5CC 801541C4 00000482 */  lb         $a0, 0x0($s0)
    /* 1A5D0 801541C8 2000A5AF */  sw         $a1, 0x20($sp)
    /* 1A5D4 801541CC 2400A6AF */  sw         $a2, 0x24($sp)
    /* 1A5D8 801541D0 3C50050C */  jal        IsDURWall__Fc
    /* 1A5DC 801541D4 2800A7AF */   sw        $a3, 0x28($sp)
    /* 1A5E0 801541D8 FF004230 */  andi       $v0, $v0, 0xFF
    /* 1A5E4 801541DC 2000A58F */  lw         $a1, 0x20($sp)
    /* 1A5E8 801541E0 2400A68F */  lw         $a2, 0x24($sp)
    /* 1A5EC 801541E4 2800A78F */  lw         $a3, 0x28($sp)
    /* 1A5F0 801541E8 13004010 */  beqz       $v0, .L80154238
    /* 1A5F4 801541EC 12000224 */   addiu     $v0, $zero, 0x12
    /* 1A5F8 801541F0 FEFF0396 */  lhu        $v1, -0x2($s0)
    /* 1A5FC 801541F4 00000000 */  nop
    /* 1A600 801541F8 10006214 */  bne        $v1, $v0, .L8015423C
    /* 1A604 801541FC 2110F502 */   addu      $v0, $s7, $s5
    /* 1A608 80154200 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 1A60C 80154204 21083100 */  addu       $at, $at, $s1
    /* 1A610 80154208 2F7A2390 */  lbu        $v1, %lo(dung_map + 0x7)($at)
    /* 1A614 8015420C 2110D202 */  addu       $v0, $s6, $s2
    /* 1A618 80154210 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 1A61C 80154214 21082200 */  addu       $at, $at, $v0
    /* 1A620 80154218 2F7A23A0 */  sb         $v1, %lo(dung_map + 0x7)($at)
    /* 1A624 8015421C 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 1A628 80154220 21083100 */  addu       $at, $at, $s1
    /* 1A62C 80154224 2F7A2390 */  lbu        $v1, %lo(dung_map + 0x7)($at)
    /* 1A630 80154228 21109202 */  addu       $v0, $s4, $s2
    /* 1A634 8015422C 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 1A638 80154230 21082200 */  addu       $at, $at, $v0
    /* 1A63C 80154234 2F7A23A0 */  sb         $v1, %lo(dung_map + 0x7)($at)
  .L80154238:
    /* 1A640 80154238 2110F502 */  addu       $v0, $s7, $s5
  .L8015423C:
    /* 1A644 8015423C 00004480 */  lb         $a0, 0x0($v0)
    /* 1A648 80154240 2000A5AF */  sw         $a1, 0x20($sp)
    /* 1A64C 80154244 2400A6AF */  sw         $a2, 0x24($sp)
    /* 1A650 80154248 4850050C */  jal        IsDLLWall__Fc
    /* 1A654 8015424C 2800A7AF */   sw        $a3, 0x28($sp)
    /* 1A658 80154250 FF004230 */  andi       $v0, $v0, 0xFF
    /* 1A65C 80154254 2000A58F */  lw         $a1, 0x20($sp)
    /* 1A660 80154258 2400A68F */  lw         $a2, 0x24($sp)
    /* 1A664 8015425C 2800A78F */  lw         $a3, 0x28($sp)
    /* 1A668 80154260 16004010 */  beqz       $v0, .L801542BC
    /* 1A66C 80154264 2120F502 */   addu      $a0, $s7, $s5
    /* 1A670 80154268 0E80083C */  lui        $t0, %hi(dungeon + 0x60)
    /* 1A674 8015426C 24410825 */  addiu      $t0, $t0, %lo(dungeon + 0x60)
    /* 1A678 80154270 2110C800 */  addu       $v0, $a2, $t0
    /* 1A67C 80154274 2110E202 */  addu       $v0, $s7, $v0
    /* 1A680 80154278 00004394 */  lhu        $v1, 0x0($v0)
    /* 1A684 8015427C 13000224 */  addiu      $v0, $zero, 0x13
    /* 1A688 80154280 0E006214 */  bne        $v1, $v0, .L801542BC
    /* 1A68C 80154284 00000000 */   nop
    /* 1A690 80154288 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 1A694 8015428C 21083100 */  addu       $at, $at, $s1
    /* 1A698 80154290 2F7A2290 */  lbu        $v0, %lo(dung_map + 0x7)($at)
    /* 1A69C 80154294 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 1A6A0 80154298 21083300 */  addu       $at, $at, $s3
    /* 1A6A4 8015429C 2F7A22A0 */  sb         $v0, %lo(dung_map + 0x7)($at)
    /* 1A6A8 801542A0 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 1A6AC 801542A4 21083100 */  addu       $at, $at, $s1
    /* 1A6B0 801542A8 2F7A2390 */  lbu        $v1, %lo(dung_map + 0x7)($at)
    /* 1A6B4 801542AC 21109202 */  addu       $v0, $s4, $s2
    /* 1A6B8 801542B0 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 1A6BC 801542B4 21082200 */  addu       $at, $at, $v0
    /* 1A6C0 801542B8 2F7A23A0 */  sb         $v1, %lo(dung_map + 0x7)($at)
  .L801542BC:
    /* 1A6C4 801542BC 00008394 */  lhu        $v1, 0x0($a0)
    /* 1A6C8 801542C0 12000224 */  addiu      $v0, $zero, 0x12
    /* 1A6CC 801542C4 11006214 */  bne        $v1, $v0, .L8015430C
    /* 1A6D0 801542C8 13000224 */   addiu     $v0, $zero, 0x13
    /* 1A6D4 801542CC 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 1A6D8 801542D0 21083100 */  addu       $at, $at, $s1
    /* 1A6DC 801542D4 2F7A2390 */  lbu        $v1, %lo(dung_map + 0x7)($at)
    /* 1A6E0 801542D8 2110D202 */  addu       $v0, $s6, $s2
    /* 1A6E4 801542DC 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 1A6E8 801542E0 21082200 */  addu       $at, $at, $v0
    /* 1A6EC 801542E4 2F7A23A0 */  sb         $v1, %lo(dung_map + 0x7)($at)
    /* 1A6F0 801542E8 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 1A6F4 801542EC 21083100 */  addu       $at, $at, $s1
    /* 1A6F8 801542F0 2F7A2390 */  lbu        $v1, %lo(dung_map + 0x7)($at)
    /* 1A6FC 801542F4 21109202 */  addu       $v0, $s4, $s2
    /* 1A700 801542F8 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 1A704 801542FC 21082200 */  addu       $at, $at, $v0
    /* 1A708 80154300 2F7A23A0 */  sb         $v1, %lo(dung_map + 0x7)($at)
    /* 1A70C 80154304 00008394 */  lhu        $v1, 0x0($a0)
    /* 1A710 80154308 13000224 */  addiu      $v0, $zero, 0x13
  .L8015430C:
    /* 1A714 8015430C 0E006214 */  bne        $v1, $v0, .L80154348
    /* 1A718 80154310 00000000 */   nop
    /* 1A71C 80154314 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 1A720 80154318 21083100 */  addu       $at, $at, $s1
    /* 1A724 8015431C 2F7A2290 */  lbu        $v0, %lo(dung_map + 0x7)($at)
    /* 1A728 80154320 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 1A72C 80154324 21083300 */  addu       $at, $at, $s3
    /* 1A730 80154328 2F7A22A0 */  sb         $v0, %lo(dung_map + 0x7)($at)
    /* 1A734 8015432C 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 1A738 80154330 21083100 */  addu       $at, $at, $s1
    /* 1A73C 80154334 2F7A2390 */  lbu        $v1, %lo(dung_map + 0x7)($at)
    /* 1A740 80154338 21109202 */  addu       $v0, $s4, $s2
    /* 1A744 8015433C 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 1A748 80154340 21082200 */  addu       $at, $at, $v0
    /* 1A74C 80154344 2F7A23A0 */  sb         $v1, %lo(dung_map + 0x7)($at)
  .L80154348:
    /* 1A750 80154348 00008394 */  lhu        $v1, 0x0($a0)
    /* 1A754 8015434C 18000224 */  addiu      $v0, $zero, 0x18
    /* 1A758 80154350 17006214 */  bne        $v1, $v0, .L801543B0
    /* 1A75C 80154354 39000224 */   addiu     $v0, $zero, 0x39
    /* 1A760 80154358 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 1A764 8015435C 21083100 */  addu       $at, $at, $s1
    /* 1A768 80154360 2F7A2390 */  lbu        $v1, %lo(dung_map + 0x7)($at)
    /* 1A76C 80154364 2110D202 */  addu       $v0, $s6, $s2
    /* 1A770 80154368 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 1A774 8015436C 21082200 */  addu       $at, $at, $v0
    /* 1A778 80154370 2F7A23A0 */  sb         $v1, %lo(dung_map + 0x7)($at)
    /* 1A77C 80154374 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 1A780 80154378 21083100 */  addu       $at, $at, $s1
    /* 1A784 8015437C 2F7A2290 */  lbu        $v0, %lo(dung_map + 0x7)($at)
    /* 1A788 80154380 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 1A78C 80154384 21083300 */  addu       $at, $at, $s3
    /* 1A790 80154388 2F7A22A0 */  sb         $v0, %lo(dung_map + 0x7)($at)
    /* 1A794 8015438C 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 1A798 80154390 21083100 */  addu       $at, $at, $s1
    /* 1A79C 80154394 2F7A2390 */  lbu        $v1, %lo(dung_map + 0x7)($at)
    /* 1A7A0 80154398 21109202 */  addu       $v0, $s4, $s2
    /* 1A7A4 8015439C 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 1A7A8 801543A0 21082200 */  addu       $at, $at, $v0
    /* 1A7AC 801543A4 2F7A23A0 */  sb         $v1, %lo(dung_map + 0x7)($at)
    /* 1A7B0 801543A8 00008394 */  lhu        $v1, 0x0($a0)
    /* 1A7B4 801543AC 39000224 */  addiu      $v0, $zero, 0x39
  .L801543B0:
    /* 1A7B8 801543B0 0D006214 */  bne        $v1, $v0, .L801543E8
    /* 1A7BC 801543B4 2118DE02 */   addu      $v1, $s6, $fp
    /* 1A7C0 801543B8 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 1A7C4 801543BC 21083300 */  addu       $at, $at, $s3
    /* 1A7C8 801543C0 2F7A2290 */  lbu        $v0, %lo(dung_map + 0x7)($at)
    /* 1A7CC 801543C4 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 1A7D0 801543C8 21082300 */  addu       $at, $at, $v1
    /* 1A7D4 801543CC 2F7A22A0 */  sb         $v0, %lo(dung_map + 0x7)($at)
    /* 1A7D8 801543D0 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 1A7DC 801543D4 21083300 */  addu       $at, $at, $s3
    /* 1A7E0 801543D8 2F7A2290 */  lbu        $v0, %lo(dung_map + 0x7)($at)
    /* 1A7E4 801543DC 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 1A7E8 801543E0 21083100 */  addu       $at, $at, $s1
    /* 1A7EC 801543E4 2F7A22A0 */  sb         $v0, %lo(dung_map + 0x7)($at)
  .L801543E8:
    /* 1A7F0 801543E8 00008394 */  lhu        $v1, 0x0($a0)
    /* 1A7F4 801543EC 35000224 */  addiu      $v0, $zero, 0x35
    /* 1A7F8 801543F0 0F006214 */  bne        $v1, $v0, .L80154430
    /* 1A7FC 801543F4 2118D202 */   addu      $v1, $s6, $s2
    /* 1A800 801543F8 1800A88F */  lw         $t0, 0x18($sp)
    /* 1A804 801543FC 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 1A808 80154400 21082300 */  addu       $at, $at, $v1
    /* 1A80C 80154404 2F7A2490 */  lbu        $a0, %lo(dung_map + 0x7)($at)
    /* 1A810 80154408 21100501 */  addu       $v0, $t0, $a1
    /* 1A814 8015440C 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 1A818 80154410 21082200 */  addu       $at, $at, $v0
    /* 1A81C 80154414 2F7A24A0 */  sb         $a0, %lo(dung_map + 0x7)($at)
    /* 1A820 80154418 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 1A824 8015441C 21082300 */  addu       $at, $at, $v1
    /* 1A828 80154420 2F7A2290 */  lbu        $v0, %lo(dung_map + 0x7)($at)
    /* 1A82C 80154424 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 1A830 80154428 21083100 */  addu       $at, $at, $s1
    /* 1A834 8015442C 2F7A22A0 */  sb         $v0, %lo(dung_map + 0x7)($at)
  .L80154430:
    /* 1A838 80154430 00073126 */  addiu      $s1, $s1, 0x700
    /* 1A83C 80154434 00075226 */  addiu      $s2, $s2, 0x700
    /* 1A840 80154438 0007A524 */  addiu      $a1, $a1, 0x700
    /* 1A844 8015443C 00077326 */  addiu      $s3, $s3, 0x700
    /* 1A848 80154440 0007DE27 */  addiu      $fp, $fp, 0x700
    /* 1A84C 80154444 6000B526 */  addiu      $s5, $s5, 0x60
    /* 1A850 80154448 0E80083C */  lui        $t0, %hi(dungeon)
    /* 1A854 8015444C C4400825 */  addiu      $t0, $t0, %lo(dungeon)
    /* 1A858 80154450 000F0225 */  addiu      $v0, $t0, 0xF00
    /* 1A85C 80154454 2A10A202 */  slt        $v0, $s5, $v0
    /* 1A860 80154458 59FF4014 */  bnez       $v0, .L801541C0
    /* 1A864 8015445C 6000C624 */   addiu     $a2, $a2, 0x60
    /* 1A868 80154460 10009426 */  addiu      $s4, $s4, 0x10
    /* 1A86C 80154464 1800A88F */  lw         $t0, 0x18($sp)
    /* 1A870 80154468 0100E724 */  addiu      $a3, $a3, 0x1
    /* 1A874 8015446C 10000825 */  addiu      $t0, $t0, 0x10
    /* 1A878 80154470 1800A8AF */  sw         $t0, 0x18($sp)
    /* 1A87C 80154474 1000A88F */  lw         $t0, 0x10($sp)
    /* 1A880 80154478 2800E228 */  slti       $v0, $a3, 0x28
    /* 1A884 8015447C 02000825 */  addiu      $t0, $t0, 0x2
    /* 1A888 80154480 44FF4014 */  bnez       $v0, .L80154194
    /* 1A88C 80154484 1000A8AF */   sw        $t0, 0x10($sp)
    /* 1A890 80154488 5400BF8F */  lw         $ra, 0x54($sp)
    /* 1A894 8015448C 5000BE8F */  lw         $fp, 0x50($sp)
    /* 1A898 80154490 4C00B78F */  lw         $s7, 0x4C($sp)
    /* 1A89C 80154494 4800B68F */  lw         $s6, 0x48($sp)
    /* 1A8A0 80154498 4400B58F */  lw         $s5, 0x44($sp)
    /* 1A8A4 8015449C 4000B48F */  lw         $s4, 0x40($sp)
    /* 1A8A8 801544A0 3C00B38F */  lw         $s3, 0x3C($sp)
    /* 1A8AC 801544A4 3800B28F */  lw         $s2, 0x38($sp)
    /* 1A8B0 801544A8 3400B18F */  lw         $s1, 0x34($sp)
    /* 1A8B4 801544AC 3000B08F */  lw         $s0, 0x30($sp)
    /* 1A8B8 801544B0 5800BD27 */  addiu      $sp, $sp, 0x58
    /* 1A8BC 801544B4 0800E003 */  jr         $ra
    /* 1A8C0 801544B8 00000000 */   nop
endlabel DRLG_L4TransFix__Fv
