.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching blockreadcallback, 0x308

glabel blockreadcallback
    /* 16984 80026984 F022828F */  lw         $v0, %gp_rel(asyncblockoffset)($gp)
    /* 16988 80026988 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 1698C 8002698C 1800BFAF */  sw         $ra, 0x18($sp)
    /* 16990 80026990 1400B1AF */  sw         $s1, 0x14($sp)
    /* 16994 80026994 2B004010 */  beqz       $v0, .L80026A44
    /* 16998 80026998 1000B0AF */   sw        $s0, 0x10($sp)
    /* 1699C 8002699C D022828F */  lw         $v0, %gp_rel(asyncblockhandle)($gp)
    /* 169A0 800269A0 D022848F */  lw         $a0, %gp_rel(asyncblockhandle)($gp)
    /* 169A4 800269A4 80180200 */  sll        $v1, $v0, 2
    /* 169A8 800269A8 21186200 */  addu       $v1, $v1, $v0
    /* 169AC 800269AC C0180300 */  sll        $v1, $v1, 3
    /* 169B0 800269B0 80100400 */  sll        $v0, $a0, 2
    /* 169B4 800269B4 21104400 */  addu       $v0, $v0, $a0
    /* 169B8 800269B8 C0100200 */  sll        $v0, $v0, 3
    /* 169BC 800269BC 0B80013C */  lui        $at, %hi(D_800B6410)
    /* 169C0 800269C0 21082200 */  addu       $at, $at, $v0
    /* 169C4 800269C4 1064228C */  lw         $v0, %lo(D_800B6410)($at)
    /* 169C8 800269C8 0B80013C */  lui        $at, %hi(D_800B6414)
    /* 169CC 800269CC 21082300 */  addu       $at, $at, $v1
    /* 169D0 800269D0 1464238C */  lw         $v1, %lo(D_800B6414)($at)
    /* 169D4 800269D4 F022878F */  lw         $a3, %gp_rel(asyncblockoffset)($gp)
    /* 169D8 800269D8 DC22858F */  lw         $a1, %gp_rel(asyncblockmemadr)($gp)
    /* 169DC 800269DC C822868F */  lw         $a2, %gp_rel(asyncstartbytes)($gp)
    /* 169E0 800269E0 1380043C */  lui        $a0, %hi(blockiobuffer)
    /* 169E4 800269E4 B07B8424 */  addiu      $a0, $a0, %lo(blockiobuffer)
    /* 169E8 800269E8 C3120200 */  sra        $v0, $v0, 11
    /* 169EC 800269EC 21186200 */  addu       $v1, $v1, $v0
    /* 169F0 800269F0 242383AF */  sw         $v1, %gp_rel(blockiosector)($gp)
    /* 169F4 800269F4 F1B1000C */  jal        blockmove
    /* 169F8 800269F8 2120E400 */   addu      $a0, $a3, $a0
    /* 169FC 800269FC C822868F */  lw         $a2, %gp_rel(asyncstartbytes)($gp)
    /* 16A00 80026A00 D022838F */  lw         $v1, %gp_rel(asyncblockhandle)($gp)
    /* 16A04 80026A04 DC22848F */  lw         $a0, %gp_rel(asyncblockmemadr)($gp)
    /* 16A08 80026A08 80100300 */  sll        $v0, $v1, 2
    /* 16A0C 80026A0C 21104300 */  addu       $v0, $v0, $v1
    /* 16A10 80026A10 C0100200 */  sll        $v0, $v0, 3
    /* 16A14 80026A14 0B80013C */  lui        $at, %hi(D_800B6410)
    /* 16A18 80026A18 21082200 */  addu       $at, $at, $v0
    /* 16A1C 80026A1C 1064238C */  lw         $v1, %lo(D_800B6410)($at)
    /* 16A20 80026A20 C822858F */  lw         $a1, %gp_rel(asyncstartbytes)($gp)
    /* 16A24 80026A24 21208600 */  addu       $a0, $a0, $a2
    /* 16A28 80026A28 DC2284AF */  sw         $a0, %gp_rel(asyncblockmemadr)($gp)
    /* 16A2C 80026A2C 21186500 */  addu       $v1, $v1, $a1
    /* 16A30 80026A30 0B80013C */  lui        $at, %hi(D_800B6410)
    /* 16A34 80026A34 21082200 */  addu       $at, $at, $v0
    /* 16A38 80026A38 106423AC */  sw         $v1, %lo(D_800B6410)($at)
    /* 16A3C 80026A3C C82280AF */  sw         $zero, %gp_rel(asyncstartbytes)($gp)
    /* 16A40 80026A40 F02280AF */  sw         $zero, %gp_rel(asyncblockoffset)($gp)
  .L80026A44:
    /* 16A44 80026A44 BC22828F */  lw         $v0, %gp_rel(asyncblockbytes)($gp)
    /* 16A48 80026A48 00000000 */  nop
    /* 16A4C 80026A4C 2A004010 */  beqz       $v0, .L80026AF8
    /* 16A50 80026A50 00000000 */   nop
    /* 16A54 80026A54 D022828F */  lw         $v0, %gp_rel(asyncblockhandle)($gp)
    /* 16A58 80026A58 D022848F */  lw         $a0, %gp_rel(asyncblockhandle)($gp)
    /* 16A5C 80026A5C 80180200 */  sll        $v1, $v0, 2
    /* 16A60 80026A60 21186200 */  addu       $v1, $v1, $v0
    /* 16A64 80026A64 C0180300 */  sll        $v1, $v1, 3
    /* 16A68 80026A68 80100400 */  sll        $v0, $a0, 2
    /* 16A6C 80026A6C 21104400 */  addu       $v0, $v0, $a0
    /* 16A70 80026A70 C0100200 */  sll        $v0, $v0, 3
    /* 16A74 80026A74 0B80013C */  lui        $at, %hi(D_800B6410)
    /* 16A78 80026A78 21082200 */  addu       $at, $at, $v0
    /* 16A7C 80026A7C 1064248C */  lw         $a0, %lo(D_800B6410)($at)
    /* 16A80 80026A80 0B80013C */  lui        $at, %hi(D_800B6414)
    /* 16A84 80026A84 21082300 */  addu       $at, $at, $v1
    /* 16A88 80026A88 1464278C */  lw         $a3, %lo(D_800B6414)($at)
    /* 16A8C 80026A8C BC22908F */  lw         $s0, %gp_rel(asyncblockbytes)($gp)
    /* 16A90 80026A90 BC22858F */  lw         $a1, %gp_rel(asyncblockbytes)($gp)
    /* 16A94 80026A94 D022838F */  lw         $v1, %gp_rel(asyncblockhandle)($gp)
    /* 16A98 80026A98 DC22918F */  lw         $s1, %gp_rel(asyncblockmemadr)($gp)
    /* 16A9C 80026A9C 80100300 */  sll        $v0, $v1, 2
    /* 16AA0 80026AA0 21104300 */  addu       $v0, $v0, $v1
    /* 16AA4 80026AA4 C0100200 */  sll        $v0, $v0, 3
    /* 16AA8 80026AA8 0B80013C */  lui        $at, %hi(D_800B6410)
    /* 16AAC 80026AAC 21082200 */  addu       $at, $at, $v0
    /* 16AB0 80026AB0 1064238C */  lw         $v1, %lo(D_800B6410)($at)
    /* 16AB4 80026AB4 BC22868F */  lw         $a2, %gp_rel(asyncblockbytes)($gp)
    /* 16AB8 80026AB8 C3220400 */  sra        $a0, $a0, 11
    /* 16ABC 80026ABC 2120E400 */  addu       $a0, $a3, $a0
    /* 16AC0 80026AC0 21282502 */  addu       $a1, $s1, $a1
    /* 16AC4 80026AC4 DC2285AF */  sw         $a1, %gp_rel(asyncblockmemadr)($gp)
    /* 16AC8 80026AC8 21186600 */  addu       $v1, $v1, $a2
    /* 16ACC 80026ACC 0B80013C */  lui        $at, %hi(D_800B6410)
    /* 16AD0 80026AD0 21082200 */  addu       $at, $at, $v0
    /* 16AD4 80026AD4 106423AC */  sw         $v1, %lo(D_800B6410)($at)
    /* 16AD8 80026AD8 BC2280AF */  sw         $zero, %gp_rel(asyncblockbytes)($gp)
    /* 16ADC 80026ADC 229D000C */  jal        psxcdromasyncseek
    /* 16AE0 80026AE0 C3821000 */   sra       $s0, $s0, 11
    /* 16AE4 80026AE4 21202002 */  addu       $a0, $s1, $zero
    /* 16AE8 80026AE8 B29E000C */  jal        psxcdromasyncread
    /* 16AEC 80026AEC 21280002 */   addu      $a1, $s0, $zero
    /* 16AF0 80026AF0 1D9B0008 */  j          .L80026C74
    /* 16AF4 80026AF4 00000000 */   nop
  .L80026AF8:
    /* 16AF8 80026AF8 2C23828F */  lw         $v0, %gp_rel(asyncendbytes)($gp)
    /* 16AFC 80026AFC 00000000 */  nop
    /* 16B00 80026B00 1C004010 */  beqz       $v0, .L80026B74
    /* 16B04 80026B04 00000000 */   nop
    /* 16B08 80026B08 2C23828F */  lw         $v0, %gp_rel(asyncendbytes)($gp)
    /* 16B0C 80026B0C 00000000 */  nop
    /* 16B10 80026B10 582382AF */  sw         $v0, %gp_rel(asyncblockmove)($gp)
    /* 16B14 80026B14 2C2380AF */  sw         $zero, %gp_rel(asyncendbytes)($gp)
    /* 16B18 80026B18 D022828F */  lw         $v0, %gp_rel(asyncblockhandle)($gp)
    /* 16B1C 80026B1C D022848F */  lw         $a0, %gp_rel(asyncblockhandle)($gp)
    /* 16B20 80026B20 80180200 */  sll        $v1, $v0, 2
    /* 16B24 80026B24 21186200 */  addu       $v1, $v1, $v0
    /* 16B28 80026B28 C0180300 */  sll        $v1, $v1, 3
    /* 16B2C 80026B2C 80100400 */  sll        $v0, $a0, 2
    /* 16B30 80026B30 21104400 */  addu       $v0, $v0, $a0
    /* 16B34 80026B34 C0100200 */  sll        $v0, $v0, 3
    /* 16B38 80026B38 0B80013C */  lui        $at, %hi(D_800B6410)
    /* 16B3C 80026B3C 21082200 */  addu       $at, $at, $v0
    /* 16B40 80026B40 1064248C */  lw         $a0, %lo(D_800B6410)($at)
    /* 16B44 80026B44 0B80013C */  lui        $at, %hi(D_800B6414)
    /* 16B48 80026B48 21082300 */  addu       $at, $at, $v1
    /* 16B4C 80026B4C 1464228C */  lw         $v0, %lo(D_800B6414)($at)
    /* 16B50 80026B50 C3220400 */  sra        $a0, $a0, 11
    /* 16B54 80026B54 229D000C */  jal        psxcdromasyncseek
    /* 16B58 80026B58 21204400 */   addu      $a0, $v0, $a0
    /* 16B5C 80026B5C 1380043C */  lui        $a0, %hi(blockiobuffer)
    /* 16B60 80026B60 B07B8424 */  addiu      $a0, $a0, %lo(blockiobuffer)
    /* 16B64 80026B64 B29E000C */  jal        psxcdromasyncread
    /* 16B68 80026B68 01000524 */   addiu     $a1, $zero, 0x1
    /* 16B6C 80026B6C 1D9B0008 */  j          .L80026C74
    /* 16B70 80026B70 00000000 */   nop
  .L80026B74:
    /* 16B74 80026B74 5823828F */  lw         $v0, %gp_rel(asyncblockmove)($gp)
    /* 16B78 80026B78 00000000 */  nop
    /* 16B7C 80026B7C 35004010 */  beqz       $v0, .L80026C54
    /* 16B80 80026B80 00000000 */   nop
    /* 16B84 80026B84 D022828F */  lw         $v0, %gp_rel(asyncblockhandle)($gp)
    /* 16B88 80026B88 D022848F */  lw         $a0, %gp_rel(asyncblockhandle)($gp)
    /* 16B8C 80026B8C 80180200 */  sll        $v1, $v0, 2
    /* 16B90 80026B90 21186200 */  addu       $v1, $v1, $v0
    /* 16B94 80026B94 C0180300 */  sll        $v1, $v1, 3
    /* 16B98 80026B98 80100400 */  sll        $v0, $a0, 2
    /* 16B9C 80026B9C 21104400 */  addu       $v0, $v0, $a0
    /* 16BA0 80026BA0 C0100200 */  sll        $v0, $v0, 3
    /* 16BA4 80026BA4 0B80013C */  lui        $at, %hi(D_800B6410)
    /* 16BA8 80026BA8 21082200 */  addu       $at, $at, $v0
    /* 16BAC 80026BAC 1064278C */  lw         $a3, %lo(D_800B6410)($at)
    /* 16BB0 80026BB0 0B80013C */  lui        $at, %hi(D_800B6414)
    /* 16BB4 80026BB4 21082300 */  addu       $at, $at, $v1
    /* 16BB8 80026BB8 1464288C */  lw         $t0, %lo(D_800B6414)($at)
    /* 16BBC 80026BBC D022848F */  lw         $a0, %gp_rel(asyncblockhandle)($gp)
    /* 16BC0 80026BC0 D022838F */  lw         $v1, %gp_rel(asyncblockhandle)($gp)
    /* 16BC4 80026BC4 00000000 */  nop
    /* 16BC8 80026BC8 80100300 */  sll        $v0, $v1, 2
    /* 16BCC 80026BCC 21104300 */  addu       $v0, $v0, $v1
    /* 16BD0 80026BD0 C0100200 */  sll        $v0, $v0, 3
    /* 16BD4 80026BD4 0B80013C */  lui        $at, %hi(D_800B6410)
    /* 16BD8 80026BD8 21082200 */  addu       $at, $at, $v0
    /* 16BDC 80026BDC 1064238C */  lw         $v1, %lo(D_800B6410)($at)
    /* 16BE0 80026BE0 80100400 */  sll        $v0, $a0, 2
    /* 16BE4 80026BE4 21104400 */  addu       $v0, $v0, $a0
    /* 16BE8 80026BE8 C0100200 */  sll        $v0, $v0, 3
    /* 16BEC 80026BEC C31A0300 */  sra        $v1, $v1, 11
    /* 16BF0 80026BF0 0B80013C */  lui        $at, %hi(D_800B6408)
    /* 16BF4 80026BF4 21082200 */  addu       $at, $at, $v0
    /* 16BF8 80026BF8 086423AC */  sw         $v1, %lo(D_800B6408)($at)
    /* 16BFC 80026BFC D022838F */  lw         $v1, %gp_rel(asyncblockhandle)($gp)
    /* 16C00 80026C00 00000000 */  nop
    /* 16C04 80026C04 80100300 */  sll        $v0, $v1, 2
    /* 16C08 80026C08 21104300 */  addu       $v0, $v0, $v1
    /* 16C0C 80026C0C C0100200 */  sll        $v0, $v0, 3
    /* 16C10 80026C10 0B80013C */  lui        $at, %hi(D_800B6410)
    /* 16C14 80026C14 21082200 */  addu       $at, $at, $v0
    /* 16C18 80026C18 1064238C */  lw         $v1, %lo(D_800B6410)($at)
    /* 16C1C 80026C1C 5823848F */  lw         $a0, %gp_rel(asyncblockmove)($gp)
    /* 16C20 80026C20 DC22858F */  lw         $a1, %gp_rel(asyncblockmemadr)($gp)
    /* 16C24 80026C24 21186400 */  addu       $v1, $v1, $a0
    /* 16C28 80026C28 0B80013C */  lui        $at, %hi(D_800B6410)
    /* 16C2C 80026C2C 21082200 */  addu       $at, $at, $v0
    /* 16C30 80026C30 106423AC */  sw         $v1, %lo(D_800B6410)($at)
    /* 16C34 80026C34 5823868F */  lw         $a2, %gp_rel(asyncblockmove)($gp)
    /* 16C38 80026C38 C33A0700 */  sra        $a3, $a3, 11
    /* 16C3C 80026C3C 21400701 */  addu       $t0, $t0, $a3
    /* 16C40 80026C40 242388AF */  sw         $t0, %gp_rel(blockiosector)($gp)
    /* 16C44 80026C44 1380043C */  lui        $a0, %hi(blockiobuffer)
    /* 16C48 80026C48 B07B8424 */  addiu      $a0, $a0, %lo(blockiobuffer)
    /* 16C4C 80026C4C F1B1000C */  jal        blockmove
    /* 16C50 80026C50 00000000 */   nop
  .L80026C54:
    /* 16C54 80026C54 FC22838F */  lw         $v1, %gp_rel(asyncblockcallbackfunc)($gp)
    /* 16C58 80026C58 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 16C5C 80026C5C 581C80AF */  sw         $zero, %gp_rel(asyncblockstatus)($gp)
    /* 16C60 80026C60 681C82AF */  sw         $v0, %gp_rel(D_8011C3E8)($gp)
    /* 16C64 80026C64 03006010 */  beqz       $v1, .L80026C74
    /* 16C68 80026C68 00000000 */   nop
    /* 16C6C 80026C6C 09F86000 */  jalr       $v1
    /* 16C70 80026C70 00000000 */   nop
  .L80026C74:
    /* 16C74 80026C74 1800BF8F */  lw         $ra, 0x18($sp)
    /* 16C78 80026C78 1400B18F */  lw         $s1, 0x14($sp)
    /* 16C7C 80026C7C 1000B08F */  lw         $s0, 0x10($sp)
    /* 16C80 80026C80 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 16C84 80026C84 0800E003 */  jr         $ra
    /* 16C88 80026C88 00000000 */   nop
endlabel blockreadcallback
