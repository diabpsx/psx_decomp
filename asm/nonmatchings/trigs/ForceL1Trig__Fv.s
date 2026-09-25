.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ForceL1Trig__Fv, 0x1C0

glabel ForceL1Trig__Fv
    /* 65888 80075888 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 6588C 8007588C 1280043C */  lui        $a0, %hi(cursmx)
    /* 65890 80075890 50B7848C */  lw         $a0, %lo(cursmx)($a0)
    /* 65894 80075894 1280053C */  lui        $a1, %hi(cursmy)
    /* 65898 80075898 54B7A58C */  lw         $a1, %lo(cursmy)($a1)
    /* 6589C 8007589C 1800BFAF */  sw         $ra, 0x18($sp)
    /* 658A0 800758A0 18D4010C */  jal        FindLevTrig__Fiii
    /* 658A4 800758A4 21300000 */   addu      $a2, $zero, $zero
    /* 658A8 800758A8 3C004010 */  beqz       $v0, .L8007599C
    /* 658AC 800758AC 00000000 */   nop
    /* 658B0 800758B0 1280023C */  lui        $v0, %hi(currlevel)
    /* 658B4 800758B4 0CC14290 */  lbu        $v0, %lo(currlevel)($v0)
    /* 658B8 800758B8 00000000 */  nop
    /* 658BC 800758BC 0200422C */  sltiu      $v0, $v0, 0x2
    /* 658C0 800758C0 1C004014 */  bnez       $v0, .L80075934
    /* 658C4 800758C4 00000000 */   nop
    /* 658C8 800758C8 4AED010C */  jal        GetStr__Fi
    /* 658CC 800758CC A7040424 */   addiu     $a0, $zero, 0x4A7
    /* 658D0 800758D0 21284000 */  addu       $a1, $v0, $zero
    /* 658D4 800758D4 0D80023C */  lui        $v0, %hi(_infostr)
    /* 658D8 800758D8 10E84224 */  addiu      $v0, $v0, %lo(_infostr)
    /* 658DC 800758DC 1280043C */  lui        $a0, %hi(sel_data)
    /* 658E0 800758E0 2CB7848C */  lw         $a0, %lo(sel_data)($a0)
    /* 658E4 800758E4 1280063C */  lui        $a2, %hi(currlevel)
    /* 658E8 800758E8 0CC1C690 */  lbu        $a2, %lo(currlevel)($a2)
    /* 658EC 800758EC 00220400 */  sll        $a0, $a0, 8
    /* 658F0 800758F0 21208200 */  addu       $a0, $a0, $v0
    /* 658F4 800758F4 9767000C */  jal        sprintf
    /* 658F8 800758F8 FFFFC624 */   addiu     $a2, $a2, -0x1
    /* 658FC 800758FC 57D60108 */  j          .L8007595C
    /* 65900 80075900 00000000 */   nop
  .L80075904:
    /* 65904 80075904 0E80013C */  lui        $at, %hi(trigs)
    /* 65908 80075908 21082400 */  addu       $at, $at, $a0
    /* 6590C 8007590C CC33238C */  lw         $v1, %lo(trigs)($at)
    /* 65910 80075910 0E80013C */  lui        $at, %hi(trigs + 0x4)
    /* 65914 80075914 21082400 */  addu       $at, $at, $a0
    /* 65918 80075918 D033248C */  lw         $a0, %lo(trigs + 0x4)($at)
    /* 6591C 8007591C 1280013C */  lui        $at, %hi(cursmx)
    /* 65920 80075920 50B723AC */  sw         $v1, %lo(cursmx)($at)
    /* 65924 80075924 1280013C */  lui        $at, %hi(cursmy)
    /* 65928 80075928 54B724AC */  sw         $a0, %lo(cursmy)($at)
    /* 6592C 8007592C 8ED60108 */  j          .L80075A38
    /* 65930 80075930 01000224 */   addiu     $v0, $zero, 0x1
  .L80075934:
    /* 65934 80075934 4AED010C */  jal        GetStr__Fi
    /* 65938 80075938 A8040424 */   addiu     $a0, $zero, 0x4A8
    /* 6593C 8007593C 1280043C */  lui        $a0, %hi(sel_data)
    /* 65940 80075940 2CB7848C */  lw         $a0, %lo(sel_data)($a0)
    /* 65944 80075944 21284000 */  addu       $a1, $v0, $zero
    /* 65948 80075948 0D80023C */  lui        $v0, %hi(_infostr)
    /* 6594C 8007594C 10E84224 */  addiu      $v0, $v0, %lo(_infostr)
    /* 65950 80075950 00220400 */  sll        $a0, $a0, 8
    /* 65954 80075954 F240000C */  jal        strcpy
    /* 65958 80075958 21208200 */   addu      $a0, $a0, $v0
  .L8007595C:
    /* 6595C 8007595C F813828F */  lw         $v0, %gp_rel(numtrigs)($gp)
    /* 65960 80075960 00000000 */  nop
    /* 65964 80075964 0D004018 */  blez       $v0, .L8007599C
    /* 65968 80075968 21180000 */   addu      $v1, $zero, $zero
    /* 6596C 8007596C 43000624 */  addiu      $a2, $zero, 0x43
    /* 65970 80075970 21284000 */  addu       $a1, $v0, $zero
    /* 65974 80075974 21200000 */  addu       $a0, $zero, $zero
  .L80075978:
    /* 65978 80075978 0E80013C */  lui        $at, %hi(trigs + 0x8)
    /* 6597C 8007597C 21082400 */  addu       $at, $at, $a0
    /* 65980 80075980 D433228C */  lw         $v0, %lo(trigs + 0x8)($at)
    /* 65984 80075984 00000000 */  nop
    /* 65988 80075988 DEFF4610 */  beq        $v0, $a2, .L80075904
    /* 6598C 8007598C 01006324 */   addiu     $v1, $v1, 0x1
    /* 65990 80075990 2A106500 */  slt        $v0, $v1, $a1
    /* 65994 80075994 F8FF4014 */  bnez       $v0, .L80075978
    /* 65998 80075998 10008424 */   addiu     $a0, $a0, 0x10
  .L8007599C:
    /* 6599C 8007599C 1280043C */  lui        $a0, %hi(cursmx)
    /* 659A0 800759A0 50B7848C */  lw         $a0, %lo(cursmx)($a0)
    /* 659A4 800759A4 1280053C */  lui        $a1, %hi(cursmy)
    /* 659A8 800759A8 54B7A58C */  lw         $a1, %lo(cursmy)($a1)
    /* 659AC 800759AC 18D4010C */  jal        FindLevTrig__Fiii
    /* 659B0 800759B0 01000624 */   addiu     $a2, $zero, 0x1
    /* 659B4 800759B4 20004010 */  beqz       $v0, .L80075A38
    /* 659B8 800759B8 21100000 */   addu      $v0, $zero, $zero
    /* 659BC 800759BC 4AED010C */  jal        GetStr__Fi
    /* 659C0 800759C0 15010424 */   addiu     $a0, $zero, 0x115
    /* 659C4 800759C4 21284000 */  addu       $a1, $v0, $zero
    /* 659C8 800759C8 0D80023C */  lui        $v0, %hi(_infostr)
    /* 659CC 800759CC 10E84224 */  addiu      $v0, $v0, %lo(_infostr)
    /* 659D0 800759D0 1280043C */  lui        $a0, %hi(sel_data)
    /* 659D4 800759D4 2CB7848C */  lw         $a0, %lo(sel_data)($a0)
    /* 659D8 800759D8 1280063C */  lui        $a2, %hi(currlevel)
    /* 659DC 800759DC 0CC1C690 */  lbu        $a2, %lo(currlevel)($a2)
    /* 659E0 800759E0 00220400 */  sll        $a0, $a0, 8
    /* 659E4 800759E4 21208200 */  addu       $a0, $a0, $v0
    /* 659E8 800759E8 9767000C */  jal        sprintf
    /* 659EC 800759EC 0100C624 */   addiu     $a2, $a2, 0x1
    /* 659F0 800759F0 F813828F */  lw         $v0, %gp_rel(numtrigs)($gp)
    /* 659F4 800759F4 00000000 */  nop
    /* 659F8 800759F8 0E004018 */  blez       $v0, .L80075A34
    /* 659FC 800759FC 00000000 */   nop
    /* 65A00 80075A00 42000524 */  addiu      $a1, $zero, 0x42
    /* 65A04 80075A04 21200000 */  addu       $a0, $zero, $zero
    /* 65A08 80075A08 00190200 */  sll        $v1, $v0, 4
  .L80075A0C:
    /* 65A0C 80075A0C 0E80013C */  lui        $at, %hi(trigs + 0x8)
    /* 65A10 80075A10 21082400 */  addu       $at, $at, $a0
    /* 65A14 80075A14 D433228C */  lw         $v0, %lo(trigs + 0x8)($at)
    /* 65A18 80075A18 00000000 */  nop
    /* 65A1C 80075A1C B9FF4510 */  beq        $v0, $a1, .L80075904
    /* 65A20 80075A20 00000000 */   nop
    /* 65A24 80075A24 10008424 */  addiu      $a0, $a0, 0x10
    /* 65A28 80075A28 2A108300 */  slt        $v0, $a0, $v1
    /* 65A2C 80075A2C F7FF4014 */  bnez       $v0, .L80075A0C
    /* 65A30 80075A30 00000000 */   nop
  .L80075A34:
    /* 65A34 80075A34 21100000 */  addu       $v0, $zero, $zero
  .L80075A38:
    /* 65A38 80075A38 1800BF8F */  lw         $ra, 0x18($sp)
    /* 65A3C 80075A3C 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 65A40 80075A40 0800E003 */  jr         $ra
    /* 65A44 80075A44 00000000 */   nop
endlabel ForceL1Trig__Fv
