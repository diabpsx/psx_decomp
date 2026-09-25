.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching BIRD_StartPerch__FP10BIRDSTRUCT, 0x68

glabel BIRD_StartPerch__FP10BIRDSTRUCT
    /* 9BE50 800ABE50 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 9BE54 800ABE54 1000B0AF */  sw         $s0, 0x10($sp)
    /* 9BE58 800ABE58 21808000 */  addu       $s0, $a0, $zero
    /* 9BE5C 800ABE5C 32000424 */  addiu      $a0, $zero, 0x32
    /* 9BE60 800ABE60 1400BFAF */  sw         $ra, 0x14($sp)
    /* 9BE64 800ABE64 C9F6000C */  jal        ENG_random__Fl
    /* 9BE68 800ABE68 120000A2 */   sb        $zero, 0x12($s0)
    /* 9BE6C 800ABE6C 32004224 */  addiu      $v0, $v0, 0x32
    /* 9BE70 800ABE70 0F0002A2 */  sb         $v0, 0xF($s0)
    /* 9BE74 800ABE74 0E80023C */  lui        $v0, %hi(plr + 0x28)
    /* 9BE78 800ABE78 60A5428C */  lw         $v0, %lo(plr + 0x28)($v0)
    /* 9BE7C 800ABE7C 0E80033C */  lui        $v1, %hi(plr + 0x2C)
    /* 9BE80 800ABE80 64A5638C */  lw         $v1, %lo(plr + 0x2C)($v1)
    /* 9BE84 800ABE84 0E80043C */  lui        $a0, %hi(plr + 0x1A10)
    /* 9BE88 800ABE88 48BF848C */  lw         $a0, %lo(plr + 0x1A10)($a0)
    /* 9BE8C 800ABE8C 0E80053C */  lui        $a1, %hi(plr + 0x1A14)
    /* 9BE90 800ABE90 4CBFA58C */  lw         $a1, %lo(plr + 0x1A14)($a1)
    /* 9BE94 800ABE94 A01F82AF */  sw         $v0, %gp_rel(D_8011C720)($gp)
    /* 9BE98 800ABE98 A81F83AF */  sw         $v1, %gp_rel(D_8011C728)($gp)
    /* 9BE9C 800ABE9C A41F84AF */  sw         $a0, %gp_rel(D_8011C724)($gp)
    /* 9BEA0 800ABEA0 AC1F85AF */  sw         $a1, %gp_rel(D_8011C72C)($gp)
    /* 9BEA4 800ABEA4 1400BF8F */  lw         $ra, 0x14($sp)
    /* 9BEA8 800ABEA8 1000B08F */  lw         $s0, 0x10($sp)
    /* 9BEAC 800ABEAC 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 9BEB0 800ABEB0 0800E003 */  jr         $ra
    /* 9BEB4 800ABEB4 00000000 */   nop
endlabel BIRD_StartPerch__FP10BIRDSTRUCT
