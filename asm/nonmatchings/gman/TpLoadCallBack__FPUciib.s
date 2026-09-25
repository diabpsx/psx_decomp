.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching TpLoadCallBack__FPUciib, 0xA8

glabel TpLoadCallBack__FPUciib
    /* 82170 80092170 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 82174 80092174 1800BFAF */  sw         $ra, 0x18($sp)
    /* 82178 80092178 0300A014 */  bnez       $a1, .L80092188
    /* 8217C 8009217C 21308000 */   addu      $a2, $a0, $zero
    /* 82180 80092180 EC1E80AF */  sw         $zero, %gp_rel(D_8011C66C)($gp)
    /* 82184 80092184 F01E80AF */  sw         $zero, %gp_rel(D_8011C670)($gp)
  .L80092188:
    /* 82188 80092188 1000A427 */  addiu      $a0, $sp, 0x10
    /* 8218C 8009218C 40000224 */  addiu      $v0, $zero, 0x40
    /* 82190 80092190 1400A2A7 */  sh         $v0, 0x14($sp)
    /* 82194 80092194 00010224 */  addiu      $v0, $zero, 0x100
    /* 82198 80092198 2128C000 */  addu       $a1, $a2, $zero
    /* 8219C 8009219C 1600A2A7 */  sh         $v0, 0x16($sp)
    /* 821A0 800921A0 EC1E828F */  lw         $v0, %gp_rel(D_8011C66C)($gp)
    /* 821A4 800921A4 A405838F */  lw         $v1, %gp_rel(TpXDest)($gp)
    /* 821A8 800921A8 80110200 */  sll        $v0, $v0, 6
    /* 821AC 800921AC 21104300 */  addu       $v0, $v0, $v1
    /* 821B0 800921B0 1000A2A7 */  sh         $v0, 0x10($sp)
    /* 821B4 800921B4 F01E828F */  lw         $v0, %gp_rel(D_8011C670)($gp)
    /* 821B8 800921B8 A805838F */  lw         $v1, %gp_rel(TpYDest)($gp)
    /* 821BC 800921BC 00120200 */  sll        $v0, $v0, 8
    /* 821C0 800921C0 21104300 */  addu       $v0, $v0, $v1
    /* 821C4 800921C4 494F000C */  jal        LoadImage
    /* 821C8 800921C8 1200A2A7 */   sh        $v0, 0x12($sp)
    /* 821CC 800921CC EC1E838F */  lw         $v1, %gp_rel(D_8011C66C)($gp)
    /* 821D0 800921D0 9C05828F */  lw         $v0, %gp_rel(TpW)($gp)
    /* 821D4 800921D4 01006324 */  addiu      $v1, $v1, 0x1
    /* 821D8 800921D8 1A006200 */  div        $zero, $v1, $v0
    /* 821DC 800921DC 10200000 */  mfhi       $a0
    /* 821E0 800921E0 EC1E83AF */  sw         $v1, %gp_rel(D_8011C66C)($gp)
    /* 821E4 800921E4 EC1E84AF */  sw         $a0, %gp_rel(D_8011C66C)($gp)
    /* 821E8 800921E8 05008014 */  bnez       $a0, .L80092200
    /* 821EC 800921EC 00000000 */   nop
    /* 821F0 800921F0 F01E828F */  lw         $v0, %gp_rel(D_8011C670)($gp)
    /* 821F4 800921F4 00000000 */  nop
    /* 821F8 800921F8 01004224 */  addiu      $v0, $v0, 0x1
    /* 821FC 800921FC F01E82AF */  sw         $v0, %gp_rel(D_8011C670)($gp)
  .L80092200:
    /* 82200 80092200 9E4E000C */  jal        DrawSync
    /* 82204 80092204 21200000 */   addu      $a0, $zero, $zero
    /* 82208 80092208 1800BF8F */  lw         $ra, 0x18($sp)
    /* 8220C 8009220C 01000224 */  addiu      $v0, $zero, 0x1
    /* 82210 80092210 0800E003 */  jr         $ra
    /* 82214 80092214 2000BD27 */   addiu     $sp, $sp, 0x20
endlabel TpLoadCallBack__FPUciib
