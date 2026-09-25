.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching S_StartBBoy__Fv, 0x234

glabel S_StartBBoy__Fv
    /* 5DEFC 8006DEFC D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 5DF00 8006DF00 02000224 */  addiu      $v0, $zero, 0x2
    /* 5DF04 8006DF04 262182A3 */  sb         $v0, %gp_rel(D_8011C8A6)($gp)
    /* 5DF08 8006DF08 01000224 */  addiu      $v0, $zero, 0x1
    /* 5DF0C 8006DF0C 2000BFAF */  sw         $ra, 0x20($sp)
    /* 5DF10 8006DF10 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 5DF14 8006DF14 1800B0AF */  sw         $s0, 0x18($sp)
    /* 5DF18 8006DF18 611382A3 */  sb         $v0, %gp_rel(stextsize)($gp)
    /* 5DF1C 8006DF1C 621380A3 */  sb         $zero, %gp_rel(stextscrl)($gp)
    /* 5DF20 8006DF20 4AED010C */  jal        GetStr__Fi
    /* 5DF24 8006DF24 2A020424 */   addiu     $a0, $zero, 0x22A
    /* 5DF28 8006DF28 0D80103C */  lui        $s0, %hi(tempstr)
    /* 5DF2C 8006DF2C 10EA1026 */  addiu      $s0, $s0, %lo(tempstr)
    /* 5DF30 8006DF30 1280053C */  lui        $a1, %hi(myplr)
    /* 5DF34 8006DF34 08BAA58C */  lw         $a1, %lo(myplr)($a1)
    /* 5DF38 8006DF38 21200002 */  addu       $a0, $s0, $zero
    /* 5DF3C 8006DF3C 40180500 */  sll        $v1, $a1, 1
    /* 5DF40 8006DF40 21186500 */  addu       $v1, $v1, $a1
    /* 5DF44 8006DF44 80180300 */  sll        $v1, $v1, 2
    /* 5DF48 8006DF48 21186500 */  addu       $v1, $v1, $a1
    /* 5DF4C 8006DF4C 00190300 */  sll        $v1, $v1, 4
    /* 5DF50 8006DF50 23186500 */  subu       $v1, $v1, $a1
    /* 5DF54 8006DF54 80180300 */  sll        $v1, $v1, 2
    /* 5DF58 8006DF58 21186500 */  addu       $v1, $v1, $a1
    /* 5DF5C 8006DF5C C0180300 */  sll        $v1, $v1, 3
    /* 5DF60 8006DF60 0E80013C */  lui        $at, %hi(plr + 0x150)
    /* 5DF64 8006DF64 21082300 */  addu       $at, $at, $v1
    /* 5DF68 8006DF68 88A6268C */  lw         $a2, %lo(plr + 0x150)($at)
    /* 5DF6C 8006DF6C 9767000C */  jal        sprintf
    /* 5DF70 8006DF70 21284000 */   addu      $a1, $v0, $zero
    /* 5DF74 8006DF74 21200000 */  addu       $a0, $zero, $zero
    /* 5DF78 8006DF78 01000524 */  addiu      $a1, $zero, 0x1
    /* 5DF7C 8006DF7C 01000624 */  addiu      $a2, $zero, 0x1
    /* 5DF80 8006DF80 21380002 */  addu       $a3, $s0, $zero
    /* 5DF84 8006DF84 03000224 */  addiu      $v0, $zero, 0x3
    /* 5DF88 8006DF88 1000A2AF */  sw         $v0, 0x10($sp)
    /* 5DF8C 8006DF8C 84A7010C */  jal        AddSText__FiiUcPccUc
    /* 5DF90 8006DF90 1400A0AF */   sw        $zero, 0x14($sp)
    /* 5DF94 8006DF94 5CA7010C */  jal        AddSLine__Fi
    /* 5DF98 8006DF98 02000424 */   addiu     $a0, $zero, 0x2
    /* 5DF9C 8006DF9C 0E80033C */  lui        $v1, %hi(plr)
    /* 5DFA0 8006DFA0 38A56324 */  addiu      $v1, $v1, %lo(plr)
    /* 5DFA4 8006DFA4 1280023C */  lui        $v0, %hi(options_pad)
    /* 5DFA8 8006DFA8 50B2428C */  lw         $v0, %lo(options_pad)($v0)
    /* 5DFAC 8006DFAC 0E80113C */  lui        $s1, %hi(_boyitem)
    /* 5DFB0 8006DFB0 F80A3126 */  addiu      $s1, $s1, %lo(_boyitem)
    /* 5DFB4 8006DFB4 40200200 */  sll        $a0, $v0, 1
    /* 5DFB8 8006DFB8 21208200 */  addu       $a0, $a0, $v0
    /* 5DFBC 8006DFBC 80200400 */  sll        $a0, $a0, 2
    /* 5DFC0 8006DFC0 21208200 */  addu       $a0, $a0, $v0
    /* 5DFC4 8006DFC4 00210400 */  sll        $a0, $a0, 4
    /* 5DFC8 8006DFC8 23208200 */  subu       $a0, $a0, $v0
    /* 5DFCC 8006DFCC 80200400 */  sll        $a0, $a0, 2
    /* 5DFD0 8006DFD0 21208200 */  addu       $a0, $a0, $v0
    /* 5DFD4 8006DFD4 C0200400 */  sll        $a0, $a0, 3
    /* 5DFD8 8006DFD8 3413828F */  lw         $v0, %gp_rel(StorePlrNo)($gp)
    /* 5DFDC 8006DFDC 21208300 */  addu       $a0, $a0, $v1
    /* 5DFE0 8006DFE0 C0280200 */  sll        $a1, $v0, 3
    /* 5DFE4 8006DFE4 2328A200 */  subu       $a1, $a1, $v0
    /* 5DFE8 8006DFE8 80280500 */  sll        $a1, $a1, 2
    /* 5DFEC 8006DFEC 2328A200 */  subu       $a1, $a1, $v0
    /* 5DFF0 8006DFF0 80280500 */  sll        $a1, $a1, 2
    /* 5DFF4 8006DFF4 CAFD000C */  jal        SetItemMinStats__FPC12PlayerStructP10ItemStruct
    /* 5DFF8 8006DFF8 2128B100 */   addu      $a1, $a1, $s1
    /* 5DFFC 8006DFFC 3413838F */  lw         $v1, %gp_rel(StorePlrNo)($gp)
    /* 5E000 8006E000 00000000 */  nop
    /* 5E004 8006E004 C0100300 */  sll        $v0, $v1, 3
    /* 5E008 8006E008 23104300 */  subu       $v0, $v0, $v1
    /* 5E00C 8006E00C 80100200 */  sll        $v0, $v0, 2
    /* 5E010 8006E010 23104300 */  subu       $v0, $v0, $v1
    /* 5E014 8006E014 80180200 */  sll        $v1, $v0, 2
    /* 5E018 8006E018 0E80013C */  lui        $at, %hi(_boyitem + 0x51)
    /* 5E01C 8006E01C 21082300 */  addu       $at, $at, $v1
    /* 5E020 8006E020 490B2480 */  lb         $a0, %lo(_boyitem + 0x51)($at)
    /* 5E024 8006E024 0E80013C */  lui        $at, %hi(_boyitem + 0x66)
    /* 5E028 8006E028 21082300 */  addu       $at, $at, $v1
    /* 5E02C 8006E02C 5E0B2280 */  lb         $v0, %lo(_boyitem + 0x66)($at)
    /* 5E030 8006E030 00000000 */  nop
    /* 5E034 8006E034 02004014 */  bnez       $v0, .L8006E040
    /* 5E038 8006E038 2B800400 */   sltu      $s0, $zero, $a0
    /* 5E03C 8006E03C 02001024 */  addiu      $s0, $zero, 0x2
  .L8006E040:
    /* 5E040 8006E040 06008010 */  beqz       $a0, .L8006E05C
    /* 5E044 8006E044 00000000 */   nop
    /* 5E048 8006E048 0E80013C */  lui        $at, %hi(_boyitem + 0x28)
    /* 5E04C 8006E04C 21082300 */  addu       $at, $at, $v1
    /* 5E050 8006E050 200B2594 */  lhu        $a1, %lo(_boyitem + 0x28)($at)
    /* 5E054 8006E054 1BB80108 */  j          .L8006E06C
    /* 5E058 8006E058 21207100 */   addu      $a0, $v1, $s1
  .L8006E05C:
    /* 5E05C 8006E05C 21207100 */  addu       $a0, $v1, $s1
    /* 5E060 8006E060 0E80013C */  lui        $at, %hi(_boyitem + 0x26)
    /* 5E064 8006E064 21082300 */  addu       $at, $at, $v1
    /* 5E068 8006E068 1E0B2594 */  lhu        $a1, %lo(_boyitem + 0x26)($at)
  .L8006E06C:
    /* 5E06C 8006E06C 6624010C */  jal        MakeItemStr__FP10ItemStructUsUs
    /* 5E070 8006E070 00010624 */   addiu     $a2, $zero, 0x100
    /* 5E074 8006E074 21884000 */  addu       $s1, $v0, $zero
    /* 5E078 8006E078 0C000424 */  addiu      $a0, $zero, 0xC
    /* 5E07C 8006E07C 05000524 */  addiu      $a1, $zero, 0x5
    /* 5E080 8006E080 21300000 */  addu       $a2, $zero, $zero
    /* 5E084 8006E084 21382002 */  addu       $a3, $s1, $zero
    /* 5E088 8006E088 01000224 */  addiu      $v0, $zero, 0x1
    /* 5E08C 8006E08C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 5E090 8006E090 84A7010C */  jal        AddSText__FiiUcPccUc
    /* 5E094 8006E094 1400A2AF */   sw        $v0, 0x14($sp)
    /* 5E098 8006E098 3413838F */  lw         $v1, %gp_rel(StorePlrNo)($gp)
    /* 5E09C 8006E09C 00000000 */  nop
    /* 5E0A0 8006E0A0 C0100300 */  sll        $v0, $v1, 3
    /* 5E0A4 8006E0A4 23104300 */  subu       $v0, $v0, $v1
    /* 5E0A8 8006E0A8 80100200 */  sll        $v0, $v0, 2
    /* 5E0AC 8006E0AC 23104300 */  subu       $v0, $v0, $v1
    /* 5E0B0 8006E0B0 80100200 */  sll        $v0, $v0, 2
    /* 5E0B4 8006E0B4 0E80013C */  lui        $at, %hi(_boyitem + 0x18)
    /* 5E0B8 8006E0B8 21082200 */  addu       $at, $at, $v0
    /* 5E0BC 8006E0BC 100B228C */  lw         $v0, %lo(_boyitem + 0x18)($at)
    /* 5E0C0 8006E0C0 05000424 */  addiu      $a0, $zero, 0x5
    /* 5E0C4 8006E0C4 43280200 */  sra        $a1, $v0, 1
    /* 5E0C8 8006E0C8 70A7010C */  jal        AddSTextVal__Fii
    /* 5E0CC 8006E0CC 21284500 */   addu      $a1, $v0, $a1
    /* 5E0D0 8006E0D0 0C80043C */  lui        $a0, %hi(MediumFont)
    /* 5E0D4 8006E0D4 D8828424 */  addiu      $a0, $a0, %lo(MediumFont)
    /* 5E0D8 8006E0D8 1280063C */  lui        $a2, %hi(D_8011C8BC)
    /* 5E0DC 8006E0DC BCC8C624 */  addiu      $a2, $a2, %lo(D_8011C8BC)
    /* 5E0E0 8006E0E0 B229020C */  jal        GetWrap__5CFontPcP4RECT
    /* 5E0E4 8006E0E4 21282002 */   addu      $a1, $s1, $zero
    /* 5E0E8 8006E0E8 05004524 */  addiu      $a1, $v0, 0x5
    /* 5E0EC 8006E0EC 3413828F */  lw         $v0, %gp_rel(StorePlrNo)($gp)
    /* 5E0F0 8006E0F0 21300002 */  addu       $a2, $s0, $zero
    /* 5E0F4 8006E0F4 C0200200 */  sll        $a0, $v0, 3
    /* 5E0F8 8006E0F8 23208200 */  subu       $a0, $a0, $v0
    /* 5E0FC 8006E0FC 80200400 */  sll        $a0, $a0, 2
    /* 5E100 8006E100 23208200 */  subu       $a0, $a0, $v0
    /* 5E104 8006E104 80200400 */  sll        $a0, $a0, 2
    /* 5E108 8006E108 0E80023C */  lui        $v0, %hi(_boyitem)
    /* 5E10C 8006E10C F80A4224 */  addiu      $v0, $v0, %lo(_boyitem)
    /* 5E110 8006E110 B3A7010C */  jal        PrintStoreItem__FPC10ItemStructic
    /* 5E114 8006E114 21208200 */   addu      $a0, $a0, $v0
    /* 5E118 8006E118 2000BF8F */  lw         $ra, 0x20($sp)
    /* 5E11C 8006E11C 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 5E120 8006E120 1800B08F */  lw         $s0, 0x18($sp)
    /* 5E124 8006E124 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 5E128 8006E128 0800E003 */  jr         $ra
    /* 5E12C 8006E12C 00000000 */   nop
endlabel S_StartBBoy__Fv
