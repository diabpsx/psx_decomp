.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching S_WitchEnter__Fv, 0xE0

glabel S_WitchEnter__Fv
    /* 6222C 8007222C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 62230 80072230 0421828F */  lw         $v0, %gp_rel(D_8011C884)($gp)
    /* 62234 80072234 01000324 */  addiu      $v1, $zero, 0x1
    /* 62238 80072238 1000BFAF */  sw         $ra, 0x10($sp)
    /* 6223C 8007223C 211383A3 */  sb         $v1, %gp_rel(WFlag)($gp)
    /* 62240 80072240 F8FF4324 */  addiu      $v1, $v0, -0x8
    /* 62244 80072244 0700622C */  sltiu      $v0, $v1, 0x7
    /* 62248 80072248 2C004010 */  beqz       $v0, .L800722FC
    /* 6224C 8007224C 80100300 */   sll       $v0, $v1, 2
    /* 62250 80072250 1180013C */  lui        $at, %hi(jtbl_80117B48)
    /* 62254 80072254 21082200 */  addu       $at, $at, $v0
    /* 62258 80072258 487B228C */  lw         $v0, %lo(jtbl_80117B48)($at)
    /* 6225C 8007225C 00000000 */  nop
    /* 62260 80072260 08004000 */  jr         $v0
    /* 62264 80072264 00000000 */   nop
  jlabel .L80072268
    /* 62268 80072268 06000224 */  addiu      $v0, $zero, 0x6
    /* 6226C 8007226C 442182AF */  sw         $v0, %gp_rel(D_8011C8C4)($gp)
    /* 62270 80072270 05000224 */  addiu      $v0, $zero, 0x5
    /* 62274 80072274 0C2182AF */  sw         $v0, %gp_rel(D_8011C88C)($gp)
    /* 62278 80072278 08000224 */  addiu      $v0, $zero, 0x8
    /* 6227C 8007227C 082182AF */  sw         $v0, %gp_rel(D_8011C888)($gp)
    /* 62280 80072280 D5000224 */  addiu      $v0, $zero, 0xD5
    /* 62284 80072284 2C2182AF */  sw         $v0, %gp_rel(D_8011C8AC)($gp)
    /* 62288 80072288 DF000224 */  addiu      $v0, $zero, 0xDF
    /* 6228C 8007228C 302182AF */  sw         $v0, %gp_rel(D_8011C8B0)($gp)
    /* 62290 80072290 5BBE010C */  jal        StartStore__Fc
    /* 62294 80072294 13000424 */   addiu     $a0, $zero, 0x13
    /* 62298 80072298 BFC80108 */  j          .L800722FC
    /* 6229C 8007229C 00000000 */   nop
  jlabel .L800722A0
    /* 622A0 800722A0 201380A3 */  sb         $zero, %gp_rel(WStaffFlag)($gp)
    /* 622A4 800722A4 ADC80108 */  j          .L800722B4
    /* 622A8 800722A8 00000000 */   nop
  jlabel .L800722AC
    /* 622AC 800722AC 01000224 */  addiu      $v0, $zero, 0x1
    /* 622B0 800722B0 201382A3 */  sb         $v0, %gp_rel(WStaffFlag)($gp)
  .L800722B4:
    /* 622B4 800722B4 5BBE010C */  jal        StartStore__Fc
    /* 622B8 800722B8 06000424 */   addiu     $a0, $zero, 0x6
    /* 622BC 800722BC BFC80108 */  j          .L800722FC
    /* 622C0 800722C0 00000000 */   nop
  jlabel .L800722C4
    /* 622C4 800722C4 201380A3 */  sb         $zero, %gp_rel(WStaffFlag)($gp)
    /* 622C8 800722C8 B6C80108 */  j          .L800722D8
    /* 622CC 800722CC 00000000 */   nop
  jlabel .L800722D0
    /* 622D0 800722D0 01000224 */  addiu      $v0, $zero, 0x1
    /* 622D4 800722D4 201382A3 */  sb         $v0, %gp_rel(WStaffFlag)($gp)
  .L800722D8:
    /* 622D8 800722D8 5BBE010C */  jal        StartStore__Fc
    /* 622DC 800722DC 07000424 */   addiu     $a0, $zero, 0x7
    /* 622E0 800722E0 BFC80108 */  j          .L800722FC
    /* 622E4 800722E4 00000000 */   nop
  jlabel .L800722E8
    /* 622E8 800722E8 5BBE010C */  jal        StartStore__Fc
    /* 622EC 800722EC 08000424 */   addiu     $a0, $zero, 0x8
    /* 622F0 800722F0 BFC80108 */  j          .L800722FC
    /* 622F4 800722F4 00000000 */   nop
  jlabel .L800722F8
    /* 622F8 800722F8 601380A3 */  sb         $zero, %gp_rel(stextflag)($gp)
  .L800722FC:
    /* 622FC 800722FC 1000BF8F */  lw         $ra, 0x10($sp)
    /* 62300 80072300 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 62304 80072304 0800E003 */  jr         $ra
    /* 62308 80072308 00000000 */   nop
endlabel S_WitchEnter__Fv
