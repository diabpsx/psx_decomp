.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddLightctrl__Fiiiiiicii, 0xEC

glabel AddLightctrl__Fiiiiiicii
    /* 4BFC 8013E7F4 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 4C00 8013E7F8 2800B4AF */  sw         $s4, 0x28($sp)
    /* 4C04 8013E7FC 4000B48F */  lw         $s4, 0x40($sp)
    /* 4C08 8013E800 4800A38F */  lw         $v1, 0x48($sp)
    /* 4C0C 8013E804 5000A28F */  lw         $v0, 0x50($sp)
    /* 4C10 8013E808 1800B0AF */  sw         $s0, 0x18($sp)
    /* 4C14 8013E80C 21808000 */  addu       $s0, $a0, $zero
    /* 4C18 8013E810 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 4C1C 8013E814 2188A000 */  addu       $s1, $a1, $zero
    /* 4C20 8013E818 2000B2AF */  sw         $s2, 0x20($sp)
    /* 4C24 8013E81C 2190C000 */  addu       $s2, $a2, $zero
    /* 4C28 8013E820 2400B3AF */  sw         $s3, 0x24($sp)
    /* 4C2C 8013E824 2198E000 */  addu       $s3, $a3, $zero
    /* 4C30 8013E828 07004014 */  bnez       $v0, .L8013E848
    /* 4C34 8013E82C 2C00BFAF */   sw        $ra, 0x2C($sp)
    /* 4C38 8013E830 00160300 */  sll        $v0, $v1, 24
    /* 4C3C 8013E834 04004014 */  bnez       $v0, .L8013E848
    /* 4C40 8013E838 00000000 */   nop
    /* 4C44 8013E83C 4C00A48F */  lw         $a0, 0x4C($sp)
    /* 4C48 8013E840 C2DC010C */  jal        UseMana__Fii
    /* 4C4C 8013E844 03000524 */   addiu     $a1, $zero, 0x3
  .L8013E848:
    /* 4C50 8013E848 21200002 */  addu       $a0, $s0, $zero
    /* 4C54 8013E84C 21282002 */  addu       $a1, $s1, $zero
    /* 4C58 8013E850 80800400 */  sll        $s0, $a0, 2
    /* 4C5C 8013E854 21800402 */  addu       $s0, $s0, $a0
    /* 4C60 8013E858 80801000 */  sll        $s0, $s0, 2
    /* 4C64 8013E85C 23800402 */  subu       $s0, $s0, $a0
    /* 4C68 8013E860 80801000 */  sll        $s0, $s0, 2
    /* 4C6C 8013E864 20000224 */  addiu      $v0, $zero, 0x20
    /* 4C70 8013E868 21304002 */  addu       $a2, $s2, $zero
    /* 4C74 8013E86C 21386002 */  addu       $a3, $s3, $zero
    /* 4C78 8013E870 1080013C */  lui        $at, %hi(missile + 0x1E)
    /* 4C7C 8013E874 21083000 */  addu       $at, $at, $s0
    /* 4C80 8013E878 762C25A4 */  sh         $a1, %lo(missile + 0x1E)($at)
    /* 4C84 8013E87C 1080013C */  lui        $at, %hi(missile + 0x20)
    /* 4C88 8013E880 21083000 */  addu       $at, $at, $s0
    /* 4C8C 8013E884 782C32A4 */  sh         $s2, %lo(missile + 0x20)($at)
    /* 4C90 8013E888 1000B4AF */  sw         $s4, 0x10($sp)
    /* 4C94 8013E88C 62EA040C */  jal        GetMissileVel__Fiiiiii
    /* 4C98 8013E890 1400A2AF */   sw        $v0, 0x14($sp)
    /* 4C9C 8013E894 C9F6000C */  jal        ENG_random__Fl
    /* 4CA0 8013E898 08000424 */   addiu     $a0, $zero, 0x8
    /* 4CA4 8013E89C 01004224 */  addiu      $v0, $v0, 0x1
    /* 4CA8 8013E8A0 1080013C */  lui        $at, %hi(missile + 0x47)
    /* 4CAC 8013E8A4 21083000 */  addu       $at, $at, $s0
    /* 4CB0 8013E8A8 9F2C22A0 */  sb         $v0, %lo(missile + 0x47)($at)
    /* 4CB4 8013E8AC 00010224 */  addiu      $v0, $zero, 0x100
    /* 4CB8 8013E8B0 1080013C */  lui        $at, %hi(missile + 0x18)
    /* 4CBC 8013E8B4 21083000 */  addu       $at, $at, $s0
    /* 4CC0 8013E8B8 702C22A4 */  sh         $v0, %lo(missile + 0x18)($at)
    /* 4CC4 8013E8BC 2C00BF8F */  lw         $ra, 0x2C($sp)
    /* 4CC8 8013E8C0 2800B48F */  lw         $s4, 0x28($sp)
    /* 4CCC 8013E8C4 2400B38F */  lw         $s3, 0x24($sp)
    /* 4CD0 8013E8C8 2000B28F */  lw         $s2, 0x20($sp)
    /* 4CD4 8013E8CC 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 4CD8 8013E8D0 1800B08F */  lw         $s0, 0x18($sp)
    /* 4CDC 8013E8D4 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 4CE0 8013E8D8 0800E003 */  jr         $ra
    /* 4CE4 8013E8DC 00000000 */   nop
endlabel AddLightctrl__Fiiiiiicii
