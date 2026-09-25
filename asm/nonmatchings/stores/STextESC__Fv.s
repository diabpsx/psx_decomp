.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching STextESC__Fv, 0x1A4

glabel STextESC__Fv
    /* 600B4 800700B4 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 600B8 800700B8 1000BFAF */  sw         $ra, 0x10($sp)
    /* 600BC 800700BC C6F5000C */  jal        PlaySFX__Fi
    /* 600C0 800700C0 33000424 */   addiu     $a0, $zero, 0x33
    /* 600C4 800700C4 60138293 */  lbu        $v0, %gp_rel(stextflag)($gp)
    /* 600C8 800700C8 00000000 */  nop
    /* 600CC 800700CC FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 600D0 800700D0 00160200 */  sll        $v0, $v0, 24
    /* 600D4 800700D4 031E0200 */  sra        $v1, $v0, 24
    /* 600D8 800700D8 1800622C */  sltiu      $v0, $v1, 0x18
    /* 600DC 800700DC 5A004010 */  beqz       $v0, .L80070248
    /* 600E0 800700E0 80100300 */   sll       $v0, $v1, 2
    /* 600E4 800700E4 1180013C */  lui        $at, %hi(jtbl_80117AD0)
    /* 600E8 800700E8 21082200 */  addu       $at, $at, $v0
    /* 600EC 800700EC D07A228C */  lw         $v0, %lo(jtbl_80117AD0)($at)
    /* 600F0 800700F0 00000000 */  nop
    /* 600F4 800700F4 08004000 */  jr         $v0
    /* 600F8 800700F8 00000000 */   nop
  jlabel .L800700FC
    /* 600FC 800700FC FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 60100 80070100 601380A3 */  sb         $zero, %gp_rel(stextflag)($gp)
    /* 60104 80070104 1280013C */  lui        $at, %hi(options_pad)
    /* 60108 80070108 50B222AC */  sw         $v0, %lo(options_pad)($at)
    /* 6010C 8007010C D7F3000C */  jal        stream_stop__Fv
    /* 60110 80070110 00000000 */   nop
    /* 60114 80070114 92C00108 */  j          .L80070248
    /* 60118 80070118 00000000 */   nop
  jlabel .L8007011C
    /* 6011C 8007011C 5BBE010C */  jal        StartStore__Fc
    /* 60120 80070120 0C000424 */   addiu     $a0, $zero, 0xC
    /* 60124 80070124 06000224 */  addiu      $v0, $zero, 0x6
    /* 60128 80070128 042182AF */  sw         $v0, %gp_rel(D_8011C884)($gp)
    /* 6012C 8007012C 92C00108 */  j          .L80070248
    /* 60130 80070130 00000000 */   nop
  jlabel .L80070134
    /* 60134 80070134 0C218483 */  lb         $a0, %gp_rel(D_8011C88C)($gp)
    /* 60138 80070138 5BBE010C */  jal        StartStore__Fc
    /* 6013C 8007013C 00000000 */   nop
    /* 60140 80070140 0821828F */  lw         $v0, %gp_rel(D_8011C888)($gp)
    /* 60144 80070144 00000000 */  nop
    /* 60148 80070148 042182AF */  sw         $v0, %gp_rel(D_8011C884)($gp)
    /* 6014C 8007014C 92C00108 */  j          .L80070248
    /* 60150 80070150 00000000 */   nop
  jlabel .L80070154
    /* 60154 80070154 81C00108 */  j          .L80070204
    /* 60158 80070158 01000424 */   addiu     $a0, $zero, 0x1
  jlabel .L8007015C
    /* 6015C 8007015C 5BBE010C */  jal        StartStore__Fc
    /* 60160 80070160 01000424 */   addiu     $a0, $zero, 0x1
    /* 60164 80070164 67C00108 */  j          .L8007019C
    /* 60168 80070168 0A000224 */   addiu     $v0, $zero, 0xA
  jlabel .L8007016C
    /* 6016C 8007016C 7AC00108 */  j          .L800701E8
    /* 60170 80070170 01000424 */   addiu     $a0, $zero, 0x1
  jlabel .L80070174
    /* 60174 80070174 5BBE010C */  jal        StartStore__Fc
    /* 60178 80070178 01000424 */   addiu     $a0, $zero, 0x1
    /* 6017C 8007017C 70C00108 */  j          .L800701C0
    /* 60180 80070180 0C000224 */   addiu     $v0, $zero, 0xC
  jlabel .L80070184
    /* 60184 80070184 5BBE010C */  jal        StartStore__Fc
    /* 60188 80070188 05000424 */   addiu     $a0, $zero, 0x5
    /* 6018C 8007018C 20138283 */  lb         $v0, %gp_rel(WStaffFlag)($gp)
    /* 60190 80070190 00000000 */  nop
    /* 60194 80070194 1D004010 */  beqz       $v0, .L8007020C
    /* 60198 80070198 0A000224 */   addiu     $v0, $zero, 0xA
  .L8007019C:
    /* 6019C 8007019C 042182AF */  sw         $v0, %gp_rel(D_8011C884)($gp)
    /* 601A0 800701A0 92C00108 */  j          .L80070248
    /* 601A4 800701A4 00000000 */   nop
  jlabel .L800701A8
    /* 601A8 800701A8 5BBE010C */  jal        StartStore__Fc
    /* 601AC 800701AC 05000424 */   addiu     $a0, $zero, 0x5
    /* 601B0 800701B0 20138283 */  lb         $v0, %gp_rel(WStaffFlag)($gp)
    /* 601B4 800701B4 00000000 */  nop
    /* 601B8 800701B8 0D004010 */  beqz       $v0, .L800701F0
    /* 601BC 800701BC 0C000224 */   addiu     $v0, $zero, 0xC
  .L800701C0:
    /* 601C0 800701C0 042182AF */  sw         $v0, %gp_rel(D_8011C884)($gp)
    /* 601C4 800701C4 92C00108 */  j          .L80070248
    /* 601C8 800701C8 00000000 */   nop
  jlabel .L800701CC
    /* 601CC 800701CC 5BBE010C */  jal        StartStore__Fc
    /* 601D0 800701D0 05000424 */   addiu     $a0, $zero, 0x5
    /* 601D4 800701D4 0D000224 */  addiu      $v0, $zero, 0xD
    /* 601D8 800701D8 042182AF */  sw         $v0, %gp_rel(D_8011C884)($gp)
    /* 601DC 800701DC 92C00108 */  j          .L80070248
    /* 601E0 800701E0 00000000 */   nop
  jlabel .L800701E4
    /* 601E4 800701E4 0E000424 */  addiu      $a0, $zero, 0xE
  .L800701E8:
    /* 601E8 800701E8 5BBE010C */  jal        StartStore__Fc
    /* 601EC 800701EC 00000000 */   nop
  .L800701F0:
    /* 601F0 800701F0 0B000224 */  addiu      $v0, $zero, 0xB
    /* 601F4 800701F4 042182AF */  sw         $v0, %gp_rel(D_8011C884)($gp)
    /* 601F8 800701F8 92C00108 */  j          .L80070248
    /* 601FC 800701FC 00000000 */   nop
  jlabel .L80070200
    /* 60200 80070200 0F000424 */  addiu      $a0, $zero, 0xF
  .L80070204:
    /* 60204 80070204 5BBE010C */  jal        StartStore__Fc
    /* 60208 80070208 00000000 */   nop
  .L8007020C:
    /* 6020C 8007020C 09000224 */  addiu      $v0, $zero, 0x9
    /* 60210 80070210 042182AF */  sw         $v0, %gp_rel(D_8011C884)($gp)
    /* 60214 80070214 92C00108 */  j          .L80070248
    /* 60218 80070218 00000000 */   nop
  jlabel .L8007021C
    /* 6021C 8007021C 5BBE010C */  jal        StartStore__Fc
    /* 60220 80070220 11000424 */   addiu     $a0, $zero, 0x11
    /* 60224 80070224 92C00108 */  j          .L80070248
    /* 60228 80070228 00000000 */   nop
  jlabel .L8007022C
    /* 6022C 8007022C 0C218483 */  lb         $a0, %gp_rel(D_8011C88C)($gp)
    /* 60230 80070230 5BBE010C */  jal        StartStore__Fc
    /* 60234 80070234 00000000 */   nop
    /* 60238 80070238 0821828F */  lw         $v0, %gp_rel(D_8011C888)($gp)
    /* 6023C 8007023C 1021838F */  lw         $v1, %gp_rel(D_8011C890)($gp)
    /* 60240 80070240 042182AF */  sw         $v0, %gp_rel(D_8011C884)($gp)
    /* 60244 80070244 142183AF */  sw         $v1, %gp_rel(D_8011C894)($gp)
  .L80070248:
    /* 60248 80070248 1000BF8F */  lw         $ra, 0x10($sp)
    /* 6024C 8007024C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 60250 80070250 0800E003 */  jr         $ra
    /* 60254 80070254 00000000 */   nop
endlabel STextESC__Fv
