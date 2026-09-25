.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetLoadedLang__F9LANG_TYPE, 0xB0

glabel SetLoadedLang__F9LANG_TYPE
    /* 970C0 800A70C0 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 970C4 800A70C4 1400B1AF */  sw         $s1, 0x14($sp)
    /* 970C8 800A70C8 21888000 */  addu       $s1, $a0, $zero
    /* 970CC 800A70CC 1800BFAF */  sw         $ra, 0x18($sp)
    /* 970D0 800A70D0 D2EC010C */  jal        LANG_GetLang__Fv
    /* 970D4 800A70D4 1000B0AF */   sw        $s0, 0x10($sp)
    /* 970D8 800A70D8 1D002212 */  beq        $s1, $v0, .L800A7150
    /* 970DC 800A70DC 01001024 */   addiu     $s0, $zero, 0x1
    /* 970E0 800A70E0 1280013C */  lui        $at, %hi(CDWAIT)
    /* 970E4 800A70E4 ECAD30AC */  sw         $s0, %lo(CDWAIT)($at)
    /* 970E8 800A70E8 94DF010C */  jal        music_stop__Fv
    /* 970EC 800A70EC 00000000 */   nop
    /* 970F0 800A70F0 7AED010C */  jal        LANG_SetLang__F9LANG_TYPE
    /* 970F4 800A70F4 21202002 */   addu      $a0, $s1, $zero
    /* 970F8 800A70F8 1280023C */  lui        $v0, %hi(FileSYS)
    /* 970FC 800A70FC ECAA428C */  lw         $v0, %lo(FileSYS)($v0)
    /* 97100 800A7100 00000000 */  nop
    /* 97104 800A7104 03005010 */  beq        $v0, $s0, .L800A7114
    /* 97108 800A7108 00000000 */   nop
    /* 9710C 800A710C BD1D020C */  jal        BL_LoadStreamDir__Fv
    /* 97110 800A7110 00000000 */   nop
  .L800A7114:
    /* 97114 800A7114 9291020C */  jal        IsGameLoading__Fv
    /* 97118 800A7118 00000000 */   nop
    /* 9711C 800A711C 01004238 */  xori       $v0, $v0, 0x1
    /* 97120 800A7120 09004010 */  beqz       $v0, .L800A7148
    /* 97124 800A7124 00000000 */   nop
    /* 97128 800A7128 1280043C */  lui        $a0, %hi(sgnMusicTrack)
    /* 9712C 800A712C ACBB848C */  lw         $a0, %lo(sgnMusicTrack)($a0)
    /* 97130 800A7130 B4DF010C */  jal        music_start__Fi
    /* 97134 800A7134 00000000 */   nop
    /* 97138 800A7138 8D64020C */  jal        STR_pauseall__Fv
    /* 9713C 800A713C 00000000 */   nop
    /* 97140 800A7140 47DF010C */  jal        snd_stop_snd__FP4TSnd
    /* 97144 800A7144 21200000 */   addu      $a0, $zero, $zero
  .L800A7148:
    /* 97148 800A7148 1280013C */  lui        $at, %hi(CDWAIT)
    /* 9714C 800A714C ECAD20AC */  sw         $zero, %lo(CDWAIT)($at)
  .L800A7150:
    /* 97150 800A7150 8C1F91AF */  sw         $s1, %gp_rel(D_8011C70C)($gp)
    /* 97154 800A7154 841F91AF */  sw         $s1, %gp_rel(D_8011C704)($gp)
    /* 97158 800A7158 1800BF8F */  lw         $ra, 0x18($sp)
    /* 9715C 800A715C 1400B18F */  lw         $s1, 0x14($sp)
    /* 97160 800A7160 1000B08F */  lw         $s0, 0x10($sp)
    /* 97164 800A7164 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 97168 800A7168 0800E003 */  jr         $ra
    /* 9716C 800A716C 00000000 */   nop
endlabel SetLoadedLang__F9LANG_TYPE
