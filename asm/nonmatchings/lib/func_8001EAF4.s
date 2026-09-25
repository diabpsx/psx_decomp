.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching func_8001EAF4, 0x74

glabel func_8001EAF4
    /* EAF4 8001EAF4 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* EAF8 8001EAF8 1800B0AF */  sw         $s0, 0x18($sp)
    /* EAFC 8001EAFC 0B80103C */  lui        $s0, %hi(D_800B633C)
    /* EB00 8001EB00 3C63108E */  lw         $s0, %lo(D_800B633C)($s0)
    /* EB04 8001EB04 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* EB08 8001EB08 40000E24 */  addiu      $t6, $zero, 0x40
    /* EB0C 8001EB0C 88000F24 */  addiu      $t7, $zero, 0x88
    /* EB10 8001EB10 0A000EA6 */  sh         $t6, 0xA($s0)
    /* EB14 8001EB14 0D001824 */  addiu      $t8, $zero, 0xD
    /* EB18 8001EB18 0E000FA6 */  sh         $t7, 0xE($s0)
    /* EB1C 8001EB1C 080018A6 */  sh         $t8, 0x8($s0)
    /* EB20 8001EB20 0A000424 */  addiu      $a0, $zero, 0xA
    /* EB24 8001EB24 DA7A000C */  jal        func_8001EB68
    /* EB28 8001EB28 0A0000A6 */   sh        $zero, 0xA($s0)
    /* EB2C 8001EB2C 02001924 */  addiu      $t9, $zero, 0x2
    /* EB30 8001EB30 0A0019A6 */  sh         $t9, 0xA($s0)
    /* EB34 8001EB34 DA7A000C */  jal        func_8001EB68
    /* EB38 8001EB38 0A000424 */   addiu     $a0, $zero, 0xA
    /* EB3C 8001EB3C 02200824 */  addiu      $t0, $zero, 0x2002
    /* EB40 8001EB40 0A0008A6 */  sh         $t0, 0xA($s0)
    /* EB44 8001EB44 DA7A000C */  jal        func_8001EB68
    /* EB48 8001EB48 0A000424 */   addiu     $a0, $zero, 0xA
    /* EB4C 8001EB4C 0A0000A6 */  sh         $zero, 0xA($s0)
    /* EB50 8001EB50 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* EB54 8001EB54 1280013C */  lui        $at, %hi(D_8011C93C)
    /* EB58 8001EB58 1800B08F */  lw         $s0, 0x18($sp)
    /* EB5C 8001EB5C 3CC920AC */  sw         $zero, %lo(D_8011C93C)($at)
    /* EB60 8001EB60 0800E003 */  jr         $ra
    /* EB64 8001EB64 2000BD27 */   addiu     $sp, $sp, 0x20
endlabel func_8001EAF4
