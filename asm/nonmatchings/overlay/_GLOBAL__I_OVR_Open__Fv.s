.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching _GLOBAL__I_OVR_Open__Fv, 0x170

glabel _GLOBAL__I_OVR_Open__Fv
    /* 856C8 800956C8 F0FFBD27 */  addiu      $sp, $sp, -0x10
    /* 856CC 800956CC 1180033C */  lui        $v1, %hi(OVR_FrontEndAddress)
    /* 856D0 800956D0 B0DB638C */  lw         $v1, %lo(OVR_FrontEndAddress)($v1)
    /* 856D4 800956D4 1180043C */  lui        $a0, %hi(OVR_FrontEndSize)
    /* 856D8 800956D8 C4DB848C */  lw         $a0, %lo(OVR_FrontEndSize)($a0)
    /* 856DC 800956DC 1180023C */  lui        $v0, %hi(D_801105D0)
    /* 856E0 800956E0 D0054224 */  addiu      $v0, $v0, %lo(D_801105D0)
    /* 856E4 800956E4 0800A2AF */  sw         $v0, 0x8($sp)
    /* 856E8 800956E8 03000224 */  addiu      $v0, $zero, 0x3
    /* 856EC 800956EC 0C00A2AF */  sw         $v0, 0xC($sp)
    /* 856F0 800956F0 0000A3AF */  sw         $v1, 0x0($sp)
    /* 856F4 800956F4 0400A4AF */  sw         $a0, 0x4($sp)
    /* 856F8 800956F8 1280053C */  lui        $a1, %hi(D_8011CC28)
    /* 856FC 800956FC 28CCA524 */  addiu      $a1, $a1, %lo(D_8011CC28)
    /* 85700 80095700 0000A28F */  lw         $v0, 0x0($sp)
    /* 85704 80095704 0400A38F */  lw         $v1, 0x4($sp)
    /* 85708 80095708 0800A48F */  lw         $a0, 0x8($sp)
    /* 8570C 8009570C 0000A2AC */  sw         $v0, 0x0($a1)
    /* 85710 80095710 0400A3AC */  sw         $v1, 0x4($a1)
    /* 85714 80095714 0800A4AC */  sw         $a0, 0x8($a1)
    /* 85718 80095718 0C00A28F */  lw         $v0, 0xC($sp)
    /* 8571C 8009571C 00000000 */  nop
    /* 85720 80095720 0C00A2AC */  sw         $v0, 0xC($a1)
    /* 85724 80095724 1180023C */  lui        $v0, %hi(OVR_PregameAddress)
    /* 85728 80095728 B4DB428C */  lw         $v0, %lo(OVR_PregameAddress)($v0)
    /* 8572C 8009572C 1180033C */  lui        $v1, %hi(OVR_PregameSize)
    /* 85730 80095730 C8DB638C */  lw         $v1, %lo(OVR_PregameSize)($v1)
    /* 85734 80095734 0000A2AF */  sw         $v0, 0x0($sp)
    /* 85738 80095738 1180023C */  lui        $v0, %hi(D_801105E0)
    /* 8573C 8009573C E0054224 */  addiu      $v0, $v0, %lo(D_801105E0)
    /* 85740 80095740 0800A2AF */  sw         $v0, 0x8($sp)
    /* 85744 80095744 01000224 */  addiu      $v0, $zero, 0x1
    /* 85748 80095748 0400A3AF */  sw         $v1, 0x4($sp)
    /* 8574C 8009574C 0C00A2AF */  sw         $v0, 0xC($sp)
    /* 85750 80095750 1280053C */  lui        $a1, %hi(D_8011CC38)
    /* 85754 80095754 38CCA524 */  addiu      $a1, $a1, %lo(D_8011CC38)
    /* 85758 80095758 0000A28F */  lw         $v0, 0x0($sp)
    /* 8575C 8009575C 0400A38F */  lw         $v1, 0x4($sp)
    /* 85760 80095760 0800A48F */  lw         $a0, 0x8($sp)
    /* 85764 80095764 0000A2AC */  sw         $v0, 0x0($a1)
    /* 85768 80095768 0400A3AC */  sw         $v1, 0x4($a1)
    /* 8576C 8009576C 0800A4AC */  sw         $a0, 0x8($a1)
    /* 85770 80095770 0C00A28F */  lw         $v0, 0xC($sp)
    /* 85774 80095774 00000000 */  nop
    /* 85778 80095778 0C00A2AC */  sw         $v0, 0xC($a1)
    /* 8577C 8009577C 1180023C */  lui        $v0, %hi(OVR_GameAddress)
    /* 85780 80095780 B8DB428C */  lw         $v0, %lo(OVR_GameAddress)($v0)
    /* 85784 80095784 1180033C */  lui        $v1, %hi(OVR_GameSize)
    /* 85788 80095788 CCDB638C */  lw         $v1, %lo(OVR_GameSize)($v1)
    /* 8578C 8009578C 0000A2AF */  sw         $v0, 0x0($sp)
    /* 85790 80095790 1180023C */  lui        $v0, %hi(D_801105EC)
    /* 85794 80095794 EC054224 */  addiu      $v0, $v0, %lo(D_801105EC)
    /* 85798 80095798 0800A2AF */  sw         $v0, 0x8($sp)
    /* 8579C 8009579C 02000224 */  addiu      $v0, $zero, 0x2
    /* 857A0 800957A0 0400A3AF */  sw         $v1, 0x4($sp)
    /* 857A4 800957A4 0C00A2AF */  sw         $v0, 0xC($sp)
    /* 857A8 800957A8 1280053C */  lui        $a1, %hi(D_8011CC48)
    /* 857AC 800957AC 48CCA524 */  addiu      $a1, $a1, %lo(D_8011CC48)
    /* 857B0 800957B0 0000A28F */  lw         $v0, 0x0($sp)
    /* 857B4 800957B4 0400A38F */  lw         $v1, 0x4($sp)
    /* 857B8 800957B8 0800A48F */  lw         $a0, 0x8($sp)
    /* 857BC 800957BC 0000A2AC */  sw         $v0, 0x0($a1)
    /* 857C0 800957C0 0400A3AC */  sw         $v1, 0x4($a1)
    /* 857C4 800957C4 0800A4AC */  sw         $a0, 0x8($a1)
    /* 857C8 800957C8 0C00A28F */  lw         $v0, 0xC($sp)
    /* 857CC 800957CC 00000000 */  nop
    /* 857D0 800957D0 0C00A2AC */  sw         $v0, 0xC($a1)
    /* 857D4 800957D4 1180023C */  lui        $v0, %hi(OVR_FmvAddress)
    /* 857D8 800957D8 C0DB428C */  lw         $v0, %lo(OVR_FmvAddress)($v0)
    /* 857DC 800957DC 1180033C */  lui        $v1, %hi(OVR_FmvSize)
    /* 857E0 800957E0 D4DB638C */  lw         $v1, %lo(OVR_FmvSize)($v1)
    /* 857E4 800957E4 0000A2AF */  sw         $v0, 0x0($sp)
    /* 857E8 800957E8 1280023C */  lui        $v0, %hi(D_8011AD2C)
    /* 857EC 800957EC 2CAD4224 */  addiu      $v0, $v0, %lo(D_8011AD2C)
    /* 857F0 800957F0 0800A2AF */  sw         $v0, 0x8($sp)
    /* 857F4 800957F4 04000224 */  addiu      $v0, $zero, 0x4
    /* 857F8 800957F8 0400A3AF */  sw         $v1, 0x4($sp)
    /* 857FC 800957FC 0C00A2AF */  sw         $v0, 0xC($sp)
    /* 85800 80095800 1280053C */  lui        $a1, %hi(D_8011CC58)
    /* 85804 80095804 58CCA524 */  addiu      $a1, $a1, %lo(D_8011CC58)
    /* 85808 80095808 0000A28F */  lw         $v0, 0x0($sp)
    /* 8580C 8009580C 0400A38F */  lw         $v1, 0x4($sp)
    /* 85810 80095810 0800A48F */  lw         $a0, 0x8($sp)
    /* 85814 80095814 0000A2AC */  sw         $v0, 0x0($a1)
    /* 85818 80095818 0400A3AC */  sw         $v1, 0x4($a1)
    /* 8581C 8009581C 0800A4AC */  sw         $a0, 0x8($a1)
    /* 85820 80095820 0C00A28F */  lw         $v0, 0xC($sp)
    /* 85824 80095824 00000000 */  nop
    /* 85828 80095828 0C00A2AC */  sw         $v0, 0xC($a1)
    /* 8582C 8009582C 1000BD27 */  addiu      $sp, $sp, 0x10
    /* 85830 80095830 0800E003 */  jr         $ra
    /* 85834 80095834 00000000 */   nop
endlabel _GLOBAL__I_OVR_Open__Fv
