.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DRLG_InitTrans__Fv, 0x74

glabel DRLG_InitTrans__Fv
    /* 20478 8015A070 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 2047C 8015A074 1000BFAF */  sw         $ra, 0x10($sp)
    /* 20480 8015A078 21280000 */  addu       $a1, $zero, $zero
    /* 20484 8015A07C 5F000424 */  addiu      $a0, $zero, 0x5F
  .L8015A080:
    /* 20488 8015A080 0100033C */  lui        $v1, (0x14C80 >> 16)
    /* 2048C 8015A084 804C6334 */  ori        $v1, $v1, (0x14C80 & 0xFFFF)
    /* 20490 8015A088 C0100500 */  sll        $v0, $a1, 3
    /* 20494 8015A08C 21104300 */  addu       $v0, $v0, $v1
  .L8015A090:
    /* 20498 8015A090 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 2049C 8015A094 21082200 */  addu       $at, $at, $v0
    /* 204A0 8015A098 2F7A20A0 */  sb         $zero, %lo(dung_map + 0x7)($at)
    /* 204A4 8015A09C FFFF8424 */  addiu      $a0, $a0, -0x1
    /* 204A8 8015A0A0 FBFF8104 */  bgez       $a0, .L8015A090
    /* 204AC 8015A0A4 80FC4224 */   addiu     $v0, $v0, -0x380
    /* 204B0 8015A0A8 0100A524 */  addiu      $a1, $a1, 0x1
    /* 204B4 8015A0AC 6000A228 */  slti       $v0, $a1, 0x60
    /* 204B8 8015A0B0 F3FF4014 */  bnez       $v0, .L8015A080
    /* 204BC 8015A0B4 5F000424 */   addiu     $a0, $zero, 0x5F
    /* 204C0 8015A0B8 0E80043C */  lui        $a0, %hi(TransList)
    /* 204C4 8015A0BC 28798424 */  addiu      $a0, $a0, %lo(TransList)
    /* 204C8 8015A0C0 21280000 */  addu       $a1, $zero, $zero
    /* 204CC 8015A0C4 E940000C */  jal        memset
    /* 204D0 8015A0C8 00010624 */   addiu     $a2, $zero, 0x100
    /* 204D4 8015A0CC 01000224 */  addiu      $v0, $zero, 0x1
    /* 204D8 8015A0D0 C81982A3 */  sb         $v0, %gp_rel(TransVal)($gp)
    /* 204DC 8015A0D4 1000BF8F */  lw         $ra, 0x10($sp)
    /* 204E0 8015A0D8 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 204E4 8015A0DC 0800E003 */  jr         $ra
    /* 204E8 8015A0E0 00000000 */   nop
endlabel DRLG_InitTrans__Fv
