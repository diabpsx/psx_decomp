.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddPanelString__FPCci, 0xC0

glabel AddPanelString__FPCci
    /* 21E60 80031E60 21308000 */  addu       $a2, $a0, $zero
    /* 21E64 80031E64 0000C280 */  lb         $v0, 0x0($a2)
    /* 21E68 80031E68 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 21E6C 80031E6C 1800B0AF */  sw         $s0, 0x18($sp)
    /* 21E70 80031E70 2180A000 */  addu       $s0, $a1, $zero
    /* 21E74 80031E74 25004010 */  beqz       $v0, .L80031F0C
    /* 21E78 80031E78 1C00BFAF */   sw        $ra, 0x1C($sp)
    /* 21E7C 80031E7C 1280033C */  lui        $v1, %hi(sel_data)
    /* 21E80 80031E80 2CB7638C */  lw         $v1, %lo(sel_data)($v1)
    /* 21E84 80031E84 2128C000 */  addu       $a1, $a2, $zero
    /* 21E88 80031E88 80100300 */  sll        $v0, $v1, 2
    /* 21E8C 80031E8C 21184300 */  addu       $v1, $v0, $v1
    /* 21E90 80031E90 C0190300 */  sll        $v1, $v1, 7
    /* 21E94 80031E94 1280013C */  lui        $at, %hi(D_8011C764)
    /* 21E98 80031E98 21082200 */  addu       $at, $at, $v0
    /* 21E9C 80031E9C 64C7248C */  lw         $a0, %lo(D_8011C764)($at)
    /* 21EA0 80031EA0 1380023C */  lui        $v0, %hi(D_8012E538)
    /* 21EA4 80031EA4 38E54224 */  addiu      $v0, $v0, %lo(D_8012E538)
    /* 21EA8 80031EA8 80210400 */  sll        $a0, $a0, 6
    /* 21EAC 80031EAC 21208200 */  addu       $a0, $a0, $v0
    /* 21EB0 80031EB0 F240000C */  jal        strcpy
    /* 21EB4 80031EB4 21206400 */   addu      $a0, $v1, $a0
    /* 21EB8 80031EB8 1280043C */  lui        $a0, %hi(D_8011C764)
    /* 21EBC 80031EBC 64C78424 */  addiu      $a0, $a0, %lo(D_8011C764)
    /* 21EC0 80031EC0 1280023C */  lui        $v0, %hi(sel_data)
    /* 21EC4 80031EC4 2CB7428C */  lw         $v0, %lo(sel_data)($v0)
    /* 21EC8 80031EC8 1380053C */  lui        $a1, %hi(D_8012EA38)
    /* 21ECC 80031ECC 38EAA524 */  addiu      $a1, $a1, %lo(D_8012EA38)
    /* 21ED0 80031ED0 80180200 */  sll        $v1, $v0, 2
    /* 21ED4 80031ED4 21106200 */  addu       $v0, $v1, $v0
    /* 21ED8 80031ED8 C0100200 */  sll        $v0, $v0, 3
    /* 21EDC 80031EDC 21206400 */  addu       $a0, $v1, $a0
    /* 21EE0 80031EE0 0000838C */  lw         $v1, 0x0($a0)
    /* 21EE4 80031EE4 21104500 */  addu       $v0, $v0, $a1
    /* 21EE8 80031EE8 80180300 */  sll        $v1, $v1, 2
    /* 21EEC 80031EEC 21186200 */  addu       $v1, $v1, $v0
    /* 21EF0 80031EF0 000070AC */  sw         $s0, 0x0($v1)
    /* 21EF4 80031EF4 0000838C */  lw         $v1, 0x0($a0)
    /* 21EF8 80031EF8 00000000 */  nop
    /* 21EFC 80031EFC 0A006228 */  slti       $v0, $v1, 0xA
    /* 21F00 80031F00 02004010 */  beqz       $v0, .L80031F0C
    /* 21F04 80031F04 01006224 */   addiu     $v0, $v1, 0x1
    /* 21F08 80031F08 000082AC */  sw         $v0, 0x0($a0)
  .L80031F0C:
    /* 21F0C 80031F0C 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 21F10 80031F10 1800B08F */  lw         $s0, 0x18($sp)
    /* 21F14 80031F14 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 21F18 80031F18 0800E003 */  jr         $ra
    /* 21F1C 80031F1C 00000000 */   nop
endlabel AddPanelString__FPCci
