.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching STR_setvolume__FP6SFXHDR, 0xCC

glabel STR_setvolume__FP6SFXHDR
    /* 89010 80099010 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 89014 80099014 1000B0AF */  sw         $s0, 0x10($sp)
    /* 89018 80099018 21808000 */  addu       $s0, $a0, $zero
    /* 8901C 8009901C 1800B2AF */  sw         $s2, 0x18($sp)
    /* 89020 80099020 03001224 */  addiu      $s2, $zero, 0x3
    /* 89024 80099024 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 89028 80099028 1400B1AF */  sw         $s1, 0x14($sp)
    /* 8902C 8009902C 0D80013C */  lui        $at, %hi(voice_attr + 0x4)
    /* 89030 80099030 ECBC32AC */  sw         $s2, %lo(voice_attr + 0x4)($at)
    /* 89034 80099034 1000028E */  lw         $v0, 0x10($s0)
    /* 89038 80099038 01001124 */  addiu      $s1, $zero, 0x1
    /* 8903C 8009903C 04105100 */  sllv       $v0, $s1, $v0
    /* 89040 80099040 0D80013C */  lui        $at, %hi(voice_attr)
    /* 89044 80099044 E8BC22AC */  sw         $v0, %lo(voice_attr)($at)
    /* 89048 80099048 1400028E */  lw         $v0, 0x14($s0)
    /* 8904C 8009904C 0D80013C */  lui        $at, %hi(voice_attr + 0x8)
    /* 89050 80099050 F0BC22A4 */  sh         $v0, %lo(voice_attr + 0x8)($at)
    /* 89054 80099054 1400028E */  lw         $v0, 0x14($s0)
    /* 89058 80099058 0D80013C */  lui        $at, %hi(voice_attr + 0xA)
    /* 8905C 8009905C F2BC22A4 */  sh         $v0, %lo(voice_attr + 0xA)($at)
    /* 89060 80099060 D2EC010C */  jal        LANG_GetLang__Fv
    /* 89064 80099064 00000000 */   nop
    /* 89068 80099068 03005110 */  beq        $v0, $s1, .L80099078
    /* 8906C 8009906C 00000000 */   nop
    /* 89070 80099070 0F005214 */  bne        $v0, $s2, .L800990B0
    /* 89074 80099074 00000000 */   nop
  .L80099078:
    /* 89078 80099078 1000028E */  lw         $v0, 0x10($s0)
    /* 8907C 8009907C 00000000 */  nop
    /* 89080 80099080 0B005114 */  bne        $v0, $s1, .L800990B0
    /* 89084 80099084 00000000 */   nop
    /* 89088 80099088 0D80023C */  lui        $v0, %hi(voice_attr + 0x8)
    /* 8908C 8009908C F0BC4294 */  lhu        $v0, %lo(voice_attr + 0x8)($v0)
    /* 89090 80099090 0D80033C */  lui        $v1, %hi(voice_attr + 0xA)
    /* 89094 80099094 F2BC6394 */  lhu        $v1, %lo(voice_attr + 0xA)($v1)
    /* 89098 80099098 40100200 */  sll        $v0, $v0, 1
    /* 8909C 8009909C 40180300 */  sll        $v1, $v1, 1
    /* 890A0 800990A0 0D80013C */  lui        $at, %hi(voice_attr + 0x8)
    /* 890A4 800990A4 F0BC22A4 */  sh         $v0, %lo(voice_attr + 0x8)($at)
    /* 890A8 800990A8 0D80013C */  lui        $at, %hi(voice_attr + 0xA)
    /* 890AC 800990AC F2BC23A4 */  sh         $v1, %lo(voice_attr + 0xA)($at)
  .L800990B0:
    /* 890B0 800990B0 0D80043C */  lui        $a0, %hi(voice_attr)
    /* 890B4 800990B4 E8BC8424 */  addiu      $a0, $a0, %lo(voice_attr)
    /* 890B8 800990B8 3765000C */  jal        SpuSetVoiceAttr
    /* 890BC 800990BC 00000000 */   nop
    /* 890C0 800990C0 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 890C4 800990C4 1800B28F */  lw         $s2, 0x18($sp)
    /* 890C8 800990C8 1400B18F */  lw         $s1, 0x14($sp)
    /* 890CC 800990CC 1000B08F */  lw         $s0, 0x10($sp)
    /* 890D0 800990D0 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 890D4 800990D4 0800E003 */  jr         $ra
    /* 890D8 800990D8 00000000 */   nop
endlabel STR_setvolume__FP6SFXHDR
