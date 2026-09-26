.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DCT_out_handler, 0xB0

glabel DCT_out_handler
    /* 1CCB8 801568B0 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 1CCBC 801568B4 2000BFAF */  sw         $ra, 0x20($sp)
    /* 1CCC0 801568B8 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 1CCC4 801568BC 7443000C */  jal        ReloadGP
    /* 1CCC8 801568C0 1800B0AF */   sw        $s0, 0x18($sp)
    /* 1CCCC 801568C4 180D838F */  lw         $v1, %gp_rel(slices_to_do)($gp)
    /* 1CCD0 801568C8 1280043C */  lui        $a0, %hi(slice)
    /* 1CCD4 801568CC 64B58424 */  addiu      $a0, $a0, %lo(slice)
    /* 1CCD8 801568D0 80180300 */  sll        $v1, $v1, 2
    /* 1CCDC 801568D4 1580013C */  lui        $at, %hi(D_8015490C)
    /* 1CCE0 801568D8 21082300 */  addu       $at, $at, $v1
    /* 1CCE4 801568DC 0C49258C */  lw         $a1, %lo(D_8015490C)($at)
    /* 1CCE8 801568E0 494F000C */  jal        LoadImage
    /* 1CCEC 801568E4 21884000 */   addu      $s1, $v0, $zero
    /* 1CCF0 801568E8 EC0D848F */  lw         $a0, %gp_rel(slice_inc)($gp)
    /* 1CCF4 801568EC E40D8297 */  lhu        $v0, %gp_rel(slice)($gp)
    /* 1CCF8 801568F0 180D838F */  lw         $v1, %gp_rel(slices_to_do)($gp)
    /* 1CCFC 801568F4 21104400 */  addu       $v0, $v0, $a0
    /* 1CD00 801568F8 FFFF6324 */  addiu      $v1, $v1, -0x1
    /* 1CD04 801568FC E40D82A7 */  sh         $v0, %gp_rel(slice)($gp)
    /* 1CD08 80156900 180D83AF */  sw         $v1, %gp_rel(slices_to_do)($gp)
    /* 1CD0C 80156904 180D828F */  lw         $v0, %gp_rel(slices_to_do)($gp)
    /* 1CD10 80156908 1580103C */  lui        $s0, %hi(D_8015490C)
    /* 1CD14 8015690C 0C491026 */  addiu      $s0, $s0, %lo(D_8015490C)
    /* 1CD18 80156910 0B004010 */  beqz       $v0, .L80156940
    /* 1CD1C 80156914 00000000 */   nop
    /* 1CD20 80156918 180D828F */  lw         $v0, %gp_rel(slices_to_do)($gp)
    /* 1CD24 8015691C E00D858F */  lw         $a1, %gp_rel(slice_size)($gp)
    /* 1CD28 80156920 80100200 */  sll        $v0, $v0, 2
    /* 1CD2C 80156924 21105000 */  addu       $v0, $v0, $s0
    /* 1CD30 80156928 0000448C */  lw         $a0, 0x0($v0)
    /* 1CD34 8015692C E80D8287 */  lh         $v0, %gp_rel(slice + 0x4)($gp)
    /* 1CD38 80156930 00000000 */  nop
    /* 1CD3C 80156934 EC0D82AF */  sw         $v0, %gp_rel(slice_inc)($gp)
    /* 1CD40 80156938 87EB040C */  jal        func_8013AE1C
    /* 1CD44 8015693C 00000000 */   nop
  .L80156940:
    /* 1CD48 80156940 7943000C */  jal        SetGP
    /* 1CD4C 80156944 21202002 */   addu      $a0, $s1, $zero
    /* 1CD50 80156948 2000BF8F */  lw         $ra, 0x20($sp)
    /* 1CD54 8015694C 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 1CD58 80156950 1800B08F */  lw         $s0, 0x18($sp)
    /* 1CD5C 80156954 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 1CD60 80156958 0800E003 */  jr         $ra
    /* 1CD64 8015695C 00000000 */   nop
endlabel DCT_out_handler
