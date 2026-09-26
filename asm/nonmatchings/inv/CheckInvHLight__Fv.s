.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CheckInvHLight__Fv, 0x398

glabel CheckInvHLight__Fv
    /* 25E6C 8015FA64 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 25E70 8015FA68 1000B0AF */  sw         $s0, 0x10($sp)
    /* 25E74 8015FA6C B41B908F */  lw         $s0, %gp_rel(InvCursPos)($gp)
    /* 25E78 8015FA70 2000BFAF */  sw         $ra, 0x20($sp)
    /* 25E7C 8015FA74 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 25E80 8015FA78 1800B2AF */  sw         $s2, 0x18($sp)
    /* 25E84 8015FA7C 4900022A */  slti       $v0, $s0, 0x49
    /* 25E88 8015FA80 5E004010 */  beqz       $v0, .L8015FBFC
    /* 25E8C 8015FA84 1400B1AF */   sw        $s1, 0x14($sp)
    /* 25E90 8015FA88 1280023C */  lui        $v0, %hi(sel_data)
    /* 25E94 8015FA8C 2CB7428C */  lw         $v0, %lo(sel_data)($v0)
    /* 25E98 8015FA90 1280013C */  lui        $at, %hi(_infoclr)
    /* 25E9C 8015FA94 21082200 */  addu       $at, $at, $v0
    /* 25EA0 8015FA98 BCB620A0 */  sb         $zero, %lo(_infoclr)($at)
    /* 25EA4 8015FA9C 1280033C */  lui        $v1, %hi(myplr)
    /* 25EA8 8015FAA0 08BA638C */  lw         $v1, %lo(myplr)($v1)
    /* 25EAC 8015FAA4 00000000 */  nop
    /* 25EB0 8015FAA8 40100300 */  sll        $v0, $v1, 1
    /* 25EB4 8015FAAC 21104300 */  addu       $v0, $v0, $v1
    /* 25EB8 8015FAB0 80100200 */  sll        $v0, $v0, 2
    /* 25EBC 8015FAB4 21104300 */  addu       $v0, $v0, $v1
    /* 25EC0 8015FAB8 00110200 */  sll        $v0, $v0, 4
    /* 25EC4 8015FABC 23104300 */  subu       $v0, $v0, $v1
    /* 25EC8 8015FAC0 80100200 */  sll        $v0, $v0, 2
    /* 25ECC 8015FAC4 21104300 */  addu       $v0, $v0, $v1
    /* 25ED0 8015FAC8 C0100200 */  sll        $v0, $v0, 3
    /* 25ED4 8015FACC 0E80033C */  lui        $v1, %hi(plr)
    /* 25ED8 8015FAD0 38A56324 */  addiu      $v1, $v1, %lo(plr)
    /* 25EDC 8015FAD4 C8C7000C */  jal        ClearPanel__Fv
    /* 25EE0 8015FAD8 21904300 */   addu      $s2, $v0, $v1
    /* 25EE4 8015FADC 1280023C */  lui        $v0, %hi(myplr)
    /* 25EE8 8015FAE0 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 25EEC 8015FAE4 FFFF1324 */  addiu      $s3, $zero, -0x1
    /* 25EF0 8015FAE8 80100200 */  sll        $v0, $v0, 2
    /* 25EF4 8015FAEC 1280013C */  lui        $at, %hi(_pcurs)
    /* 25EF8 8015FAF0 21082200 */  addu       $at, $at, $v0
    /* 25EFC 8015FAF4 30B7228C */  lw         $v0, %lo(_pcurs)($at)
    /* 25F00 8015FAF8 00000000 */  nop
    /* 25F04 8015FAFC 0C004228 */  slti       $v0, $v0, 0xC
    /* 25F08 8015FB00 03004014 */  bnez       $v0, .L8015FB10
    /* 25F0C 8015FB04 21880000 */   addu      $s1, $zero, $zero
    /* 25F10 8015FB08 1A7F0508 */  j          .L8015FC68
    /* 25F14 8015FB0C 10195126 */   addiu     $s1, $s2, 0x1910
  .L8015FB10:
    /* 25F18 8015FB10 0400022E */  sltiu      $v0, $s0, 0x4
    /* 25F1C 8015FB14 04004010 */  beqz       $v0, .L8015FB28
    /* 25F20 8015FB18 04000224 */   addiu     $v0, $zero, 0x4
    /* 25F24 8015FB1C 21980000 */  addu       $s3, $zero, $zero
    /* 25F28 8015FB20 1A7F0508 */  j          .L8015FC68
    /* 25F2C 8015FB24 B0015126 */   addiu     $s1, $s2, 0x1B0
  .L8015FB28:
    /* 25F30 8015FB28 04000216 */  bne        $s0, $v0, .L8015FB3C
    /* 25F34 8015FB2C 05000224 */   addiu     $v0, $zero, 0x5
    /* 25F38 8015FB30 01001324 */  addiu      $s3, $zero, 0x1
    /* 25F3C 8015FB34 1A7F0508 */  j          .L8015FC68
    /* 25F40 8015FB38 1C025126 */   addiu     $s1, $s2, 0x21C
  .L8015FB3C:
    /* 25F44 8015FB3C 04000216 */  bne        $s0, $v0, .L8015FB50
    /* 25F48 8015FB40 06000224 */   addiu     $v0, $zero, 0x6
    /* 25F4C 8015FB44 02001324 */  addiu      $s3, $zero, 0x2
    /* 25F50 8015FB48 1A7F0508 */  j          .L8015FC68
    /* 25F54 8015FB4C 88025126 */   addiu     $s1, $s2, 0x288
  .L8015FB50:
    /* 25F58 8015FB50 04000216 */  bne        $s0, $v0, .L8015FB64
    /* 25F5C 8015FB54 F9FF0226 */   addiu     $v0, $s0, -0x7
    /* 25F60 8015FB58 03001324 */  addiu      $s3, $zero, 0x3
    /* 25F64 8015FB5C 1A7F0508 */  j          .L8015FC68
    /* 25F68 8015FB60 F4025126 */   addiu     $s1, $s2, 0x2F4
  .L8015FB64:
    /* 25F6C 8015FB64 0600422C */  sltiu      $v0, $v0, 0x6
    /* 25F70 8015FB68 04004010 */  beqz       $v0, .L8015FB7C
    /* 25F74 8015FB6C F3FF0226 */   addiu     $v0, $s0, -0xD
    /* 25F78 8015FB70 04001324 */  addiu      $s3, $zero, 0x4
    /* 25F7C 8015FB74 1A7F0508 */  j          .L8015FC68
    /* 25F80 8015FB78 60035126 */   addiu     $s1, $s2, 0x360
  .L8015FB7C:
    /* 25F84 8015FB7C 0600422C */  sltiu      $v0, $v0, 0x6
    /* 25F88 8015FB80 0E004010 */  beqz       $v0, .L8015FBBC
    /* 25F8C 8015FB84 FFFF0224 */   addiu     $v0, $zero, -0x1
    /* 25F90 8015FB88 8C034386 */  lh         $v1, 0x38C($s2)
    /* 25F94 8015FB8C 00000000 */  nop
    /* 25F98 8015FB90 07006210 */  beq        $v1, $v0, .L8015FBB0
    /* 25F9C 8015FB94 60035126 */   addiu     $s1, $s2, 0x360
    /* 25FA0 8015FB98 B4034382 */  lb         $v1, 0x3B4($s2)
    /* 25FA4 8015FB9C 02000224 */  addiu      $v0, $zero, 0x2
    /* 25FA8 8015FBA0 04006214 */  bne        $v1, $v0, .L8015FBB4
    /* 25FAC 8015FBA4 05001324 */   addiu     $s3, $zero, 0x5
    /* 25FB0 8015FBA8 1A7F0508 */  j          .L8015FC68
    /* 25FB4 8015FBAC 04001324 */   addiu     $s3, $zero, 0x4
  .L8015FBB0:
    /* 25FB8 8015FBB0 05001324 */  addiu      $s3, $zero, 0x5
  .L8015FBB4:
    /* 25FBC 8015FBB4 1A7F0508 */  j          .L8015FC68
    /* 25FC0 8015FBB8 CC035126 */   addiu     $s1, $s2, 0x3CC
  .L8015FBBC:
    /* 25FC4 8015FBBC EDFF0226 */  addiu      $v0, $s0, -0x13
    /* 25FC8 8015FBC0 0600422C */  sltiu      $v0, $v0, 0x6
    /* 25FCC 8015FBC4 04004010 */  beqz       $v0, .L8015FBD8
    /* 25FD0 8015FBC8 E7FF0226 */   addiu     $v0, $s0, -0x19
    /* 25FD4 8015FBCC 06001324 */  addiu      $s3, $zero, 0x6
    /* 25FD8 8015FBD0 1A7F0508 */  j          .L8015FC68
    /* 25FDC 8015FBD4 38045126 */   addiu     $s1, $s2, 0x438
  .L8015FBD8:
    /* 25FE0 8015FBD8 2800422C */  sltiu      $v0, $v0, 0x28
    /* 25FE4 8015FBDC 12004010 */  beqz       $v0, .L8015FC28
    /* 25FE8 8015FBE0 21105002 */   addu      $v0, $s2, $s0
    /* 25FEC 8015FBE4 6F154480 */  lb         $a0, 0x156F($v0)
    /* 25FF0 8015FBE8 6D41000C */  jal        abs
    /* 25FF4 8015FBEC 00000000 */   nop
    /* 25FF8 8015FBF0 21804000 */  addu       $s0, $v0, $zero
    /* 25FFC 8015FBF4 03000016 */  bnez       $s0, .L8015FC04
    /* 26000 8015FBF8 FFFF1026 */   addiu     $s0, $s0, -0x1
  .L8015FBFC:
    /* 26004 8015FBFC 777F0508 */  j          .L8015FDDC
    /* 26008 8015FC00 FFFF0224 */   addiu     $v0, $zero, -0x1
  .L8015FC04:
    /* 2600C 8015FC04 07001326 */  addiu      $s3, $s0, 0x7
    /* 26010 8015FC08 C0101000 */  sll        $v0, $s0, 3
    /* 26014 8015FC0C 23105000 */  subu       $v0, $v0, $s0
    /* 26018 8015FC10 80100200 */  sll        $v0, $v0, 2
    /* 2601C 8015FC14 23105000 */  subu       $v0, $v0, $s0
    /* 26020 8015FC18 80100200 */  sll        $v0, $v0, 2
    /* 26024 8015FC1C A4044224 */  addiu      $v0, $v0, 0x4A4
    /* 26028 8015FC20 1A7F0508 */  j          .L8015FC68
    /* 2602C 8015FC24 21884202 */   addu      $s1, $s2, $v0
  .L8015FC28:
    /* 26030 8015FC28 4100022A */  slti       $v0, $s0, 0x41
    /* 26034 8015FC2C 0E004014 */  bnez       $v0, .L8015FC68
    /* 26038 8015FC30 BFFF1026 */   addiu     $s0, $s0, -0x41
    /* 2603C 8015FC34 C0101000 */  sll        $v0, $s0, 3
    /* 26040 8015FC38 23105000 */  subu       $v0, $v0, $s0
    /* 26044 8015FC3C 80100200 */  sll        $v0, $v0, 2
    /* 26048 8015FC40 23105000 */  subu       $v0, $v0, $s0
    /* 2604C 8015FC44 80100200 */  sll        $v0, $v0, 2
    /* 26050 8015FC48 B0154224 */  addiu      $v0, $v0, 0x15B0
    /* 26054 8015FC4C 21884202 */  addu       $s1, $s2, $v0
    /* 26058 8015FC50 2C002386 */  lh         $v1, 0x2C($s1)
    /* 2605C 8015FC54 01000224 */  addiu      $v0, $zero, 0x1
    /* 26060 8015FC58 AD1B82A3 */  sb         $v0, %gp_rel(drawsbarflag)($gp)
    /* 26064 8015FC5C FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 26068 8015FC60 5E006210 */  beq        $v1, $v0, .L8015FDDC
    /* 2606C 8015FC64 2F001326 */   addiu     $s3, $s0, 0x2F
  .L8015FC68:
    /* 26070 8015FC68 2C002386 */  lh         $v1, 0x2C($s1)
    /* 26074 8015FC6C FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 26078 8015FC70 5A006210 */  beq        $v1, $v0, .L8015FDDC
    /* 2607C 8015FC74 00000000 */   nop
    /* 26080 8015FC78 0B000224 */  addiu      $v0, $zero, 0xB
    /* 26084 8015FC7C 13006214 */  bne        $v1, $v0, .L8015FCCC
    /* 26088 8015FC80 00000000 */   nop
    /* 2608C 8015FC84 1400318E */  lw         $s1, 0x14($s1)
    /* 26090 8015FC88 4AED010C */  jal        GetStr__Fi
    /* 26094 8015FC8C FF040424 */   addiu     $a0, $zero, 0x4FF
    /* 26098 8015FC90 21804000 */  addu       $s0, $v0, $zero
    /* 2609C 8015FC94 47DD000C */  jal        get_pieces_str__Fi
    /* 260A0 8015FC98 21202002 */   addu      $a0, $s1, $zero
    /* 260A4 8015FC9C 21280002 */  addu       $a1, $s0, $zero
    /* 260A8 8015FCA0 21302002 */  addu       $a2, $s1, $zero
    /* 260AC 8015FCA4 0D80033C */  lui        $v1, %hi(_infostr)
    /* 260B0 8015FCA8 10E86324 */  addiu      $v1, $v1, %lo(_infostr)
    /* 260B4 8015FCAC 1280043C */  lui        $a0, %hi(sel_data)
    /* 260B8 8015FCB0 2CB7848C */  lw         $a0, %lo(sel_data)($a0)
    /* 260BC 8015FCB4 21384000 */  addu       $a3, $v0, $zero
    /* 260C0 8015FCB8 00220400 */  sll        $a0, $a0, 8
    /* 260C4 8015FCBC 9767000C */  jal        sprintf
    /* 260C8 8015FCC0 21208300 */   addu      $a0, $a0, $v1
    /* 260CC 8015FCC4 767F0508 */  j          .L8015FDD8
    /* 260D0 8015FCC8 00161300 */   sll       $v0, $s3, 24
  .L8015FCCC:
    /* 260D4 8015FCCC AC1B8293 */  lbu        $v0, %gp_rel(invflag)($gp)
    /* 260D8 8015FCD0 00000000 */  nop
    /* 260DC 8015FCD4 11004010 */  beqz       $v0, .L8015FD1C
    /* 260E0 8015FCD8 01000224 */   addiu     $v0, $zero, 0x1
    /* 260E4 8015FCDC 66002282 */  lb         $v0, 0x66($s1)
    /* 260E8 8015FCE0 00000000 */  nop
    /* 260EC 8015FCE4 05004014 */  bnez       $v0, .L8015FCFC
    /* 260F0 8015FCE8 01000224 */   addiu     $v0, $zero, 0x1
    /* 260F4 8015FCEC 1280033C */  lui        $v1, %hi(sel_data)
    /* 260F8 8015FCF0 2CB7638C */  lw         $v1, %lo(sel_data)($v1)
    /* 260FC 8015FCF4 537F0508 */  j          .L8015FD4C
    /* 26100 8015FCF8 02000224 */   addiu     $v0, $zero, 0x2
  .L8015FCFC:
    /* 26104 8015FCFC 51002382 */  lb         $v1, 0x51($s1)
    /* 26108 8015FD00 00000000 */  nop
    /* 2610C 8015FD04 0D006214 */  bne        $v1, $v0, .L8015FD3C
    /* 26110 8015FD08 02000224 */   addiu     $v0, $zero, 0x2
    /* 26114 8015FD0C 1280033C */  lui        $v1, %hi(sel_data)
    /* 26118 8015FD10 2CB7638C */  lw         $v1, %lo(sel_data)($v1)
    /* 2611C 8015FD14 537F0508 */  j          .L8015FD4C
    /* 26120 8015FD18 01000224 */   addiu     $v0, $zero, 0x1
  .L8015FD1C:
    /* 26124 8015FD1C 51002382 */  lb         $v1, 0x51($s1)
    /* 26128 8015FD20 00000000 */  nop
    /* 2612C 8015FD24 05006214 */  bne        $v1, $v0, .L8015FD3C
    /* 26130 8015FD28 02000224 */   addiu     $v0, $zero, 0x2
    /* 26134 8015FD2C 1280033C */  lui        $v1, %hi(sel_data)
    /* 26138 8015FD30 2CB7638C */  lw         $v1, %lo(sel_data)($v1)
    /* 2613C 8015FD34 537F0508 */  j          .L8015FD4C
    /* 26140 8015FD38 01000224 */   addiu     $v0, $zero, 0x1
  .L8015FD3C:
    /* 26144 8015FD3C 06006214 */  bne        $v1, $v0, .L8015FD58
    /* 26148 8015FD40 03000224 */   addiu     $v0, $zero, 0x3
    /* 2614C 8015FD44 1280033C */  lui        $v1, %hi(sel_data)
    /* 26150 8015FD48 2CB7638C */  lw         $v1, %lo(sel_data)($v1)
  .L8015FD4C:
    /* 26154 8015FD4C 1280013C */  lui        $at, %hi(_infoclr)
    /* 26158 8015FD50 21082300 */  addu       $at, $at, $v1
    /* 2615C 8015FD54 BCB622A0 */  sb         $v0, %lo(_infoclr)($at)
  .L8015FD58:
    /* 26160 8015FD58 21202002 */  addu       $a0, $s1, $zero
    /* 26164 8015FD5C 26002596 */  lhu        $a1, 0x26($s1)
    /* 26168 8015FD60 6624010C */  jal        MakeItemStr__FP10ItemStructUsUs
    /* 2616C 8015FD64 00010624 */   addiu     $a2, $zero, 0x100
    /* 26170 8015FD68 21284000 */  addu       $a1, $v0, $zero
    /* 26174 8015FD6C 1280043C */  lui        $a0, %hi(sel_data)
    /* 26178 8015FD70 2CB7848C */  lw         $a0, %lo(sel_data)($a0)
    /* 2617C 8015FD74 0D80103C */  lui        $s0, %hi(_infostr)
    /* 26180 8015FD78 10E81026 */  addiu      $s0, $s0, %lo(_infostr)
    /* 26184 8015FD7C 00220400 */  sll        $a0, $a0, 8
    /* 26188 8015FD80 F240000C */  jal        strcpy
    /* 2618C 8015FD84 21209000 */   addu      $a0, $a0, $s0
    /* 26190 8015FD88 69002282 */  lb         $v0, 0x69($s1)
    /* 26194 8015FD8C 00000000 */  nop
    /* 26198 8015FD90 0E004010 */  beqz       $v0, .L8015FDCC
    /* 2619C 8015FD94 21202002 */   addu      $a0, $s1, $zero
    /* 261A0 8015FD98 28002596 */  lhu        $a1, 0x28($s1)
    /* 261A4 8015FD9C 6624010C */  jal        MakeItemStr__FP10ItemStructUsUs
    /* 261A8 8015FDA0 00010624 */   addiu     $a2, $zero, 0x100
    /* 261AC 8015FDA4 1280043C */  lui        $a0, %hi(sel_data)
    /* 261B0 8015FDA8 2CB7848C */  lw         $a0, %lo(sel_data)($a0)
    /* 261B4 8015FDAC 21284000 */  addu       $a1, $v0, $zero
    /* 261B8 8015FDB0 00220400 */  sll        $a0, $a0, 8
    /* 261BC 8015FDB4 F240000C */  jal        strcpy
    /* 261C0 8015FDB8 21209000 */   addu      $a0, $a0, $s0
    /* 261C4 8015FDBC 1F1B010C */  jal        PrintItemDetails__FPC10ItemStruct
    /* 261C8 8015FDC0 21202002 */   addu      $a0, $s1, $zero
    /* 261CC 8015FDC4 767F0508 */  j          .L8015FDD8
    /* 261D0 8015FDC8 00161300 */   sll       $v0, $s3, 24
  .L8015FDCC:
    /* 261D4 8015FDCC 3E1C010C */  jal        PrintItemDur__FPC10ItemStruct
    /* 261D8 8015FDD0 21202002 */   addu      $a0, $s1, $zero
    /* 261DC 8015FDD4 00161300 */  sll        $v0, $s3, 24
  .L8015FDD8:
    /* 261E0 8015FDD8 03160200 */  sra        $v0, $v0, 24
  .L8015FDDC:
    /* 261E4 8015FDDC 2000BF8F */  lw         $ra, 0x20($sp)
    /* 261E8 8015FDE0 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 261EC 8015FDE4 1800B28F */  lw         $s2, 0x18($sp)
    /* 261F0 8015FDE8 1400B18F */  lw         $s1, 0x14($sp)
    /* 261F4 8015FDEC 1000B08F */  lw         $s0, 0x10($sp)
    /* 261F8 8015FDF0 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 261FC 8015FDF4 0800E003 */  jr         $ra
    /* 26200 8015FDF8 00000000 */   nop
endlabel CheckInvHLight__Fv
