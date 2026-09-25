.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ChangeLang__Fv, 0xC4

glabel ChangeLang__Fv
    /* 97170 800A7170 8C1F838F */  lw         $v1, %gp_rel(D_8011C70C)($gp)
    /* 97174 800A7174 841F828F */  lw         $v0, %gp_rel(D_8011C704)($gp)
    /* 97178 800A7178 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 9717C 800A717C 1400BFAF */  sw         $ra, 0x14($sp)
    /* 97180 800A7180 27006210 */  beq        $v1, $v0, .L800A7220
    /* 97184 800A7184 1000B0AF */   sw        $s0, 0x10($sp)
    /* 97188 800A7188 A4DF010C */  jal        music_fade__Fv
    /* 9718C 800A718C 00000000 */   nop
    /* 97190 800A7190 1280033C */  lui        $v1, %hi(FileSYS)
    /* 97194 800A7194 ECAA638C */  lw         $v1, %lo(FileSYS)($v1)
    /* 97198 800A7198 01000224 */  addiu      $v0, $zero, 0x1
    /* 9719C 800A719C 0C006210 */  beq        $v1, $v0, .L800A71D0
    /* 971A0 800A71A0 00000000 */   nop
    /* 971A4 800A71A4 6D9C0208 */  j          .L800A71B4
    /* 971A8 800A71A8 00000000 */   nop
  .L800A71AC:
    /* 971AC 800A71AC EE80000C */  jal        TSK_Sleep
    /* 971B0 800A71B0 01000424 */   addiu     $a0, $zero, 0x1
  .L800A71B4:
    /* 971B4 800A71B4 1280023C */  lui        $v0, %hi(sghMusic)
    /* 971B8 800A71B8 B4BB428C */  lw         $v0, %lo(sghMusic)($v0)
    /* 971BC 800A71BC 00000000 */  nop
    /* 971C0 800A71C0 1400428C */  lw         $v0, 0x14($v0)
    /* 971C4 800A71C4 00000000 */  nop
    /* 971C8 800A71C8 F8FF401C */  bgtz       $v0, .L800A71AC
    /* 971CC 800A71CC 00000000 */   nop
  .L800A71D0:
    /* 971D0 800A71D0 8C1F848F */  lw         $a0, %gp_rel(D_8011C70C)($gp)
    /* 971D4 800A71D4 01001024 */  addiu      $s0, $zero, 0x1
    /* 971D8 800A71D8 1280013C */  lui        $at, %hi(CDWAIT)
    /* 971DC 800A71DC ECAD30AC */  sw         $s0, %lo(CDWAIT)($at)
    /* 971E0 800A71E0 7AED010C */  jal        LANG_SetLang__F9LANG_TYPE
    /* 971E4 800A71E4 00000000 */   nop
    /* 971E8 800A71E8 1280023C */  lui        $v0, %hi(FileSYS)
    /* 971EC 800A71EC ECAA428C */  lw         $v0, %lo(FileSYS)($v0)
    /* 971F0 800A71F0 00000000 */  nop
    /* 971F4 800A71F4 03005010 */  beq        $v0, $s0, .L800A7204
    /* 971F8 800A71F8 00000000 */   nop
    /* 971FC 800A71FC BD1D020C */  jal        BL_LoadStreamDir__Fv
    /* 97200 800A7200 00000000 */   nop
  .L800A7204:
    /* 97204 800A7204 1280013C */  lui        $at, %hi(CDWAIT)
    /* 97208 800A7208 ECAD20AC */  sw         $zero, %lo(CDWAIT)($at)
    /* 9720C 800A720C B4DF010C */  jal        music_start__Fi
    /* 97210 800A7210 05000424 */   addiu     $a0, $zero, 0x5
    /* 97214 800A7214 8C1F828F */  lw         $v0, %gp_rel(D_8011C70C)($gp)
    /* 97218 800A7218 00000000 */  nop
    /* 9721C 800A721C 841F82AF */  sw         $v0, %gp_rel(D_8011C704)($gp)
  .L800A7220:
    /* 97220 800A7220 1400BF8F */  lw         $ra, 0x14($sp)
    /* 97224 800A7224 1000B08F */  lw         $s0, 0x10($sp)
    /* 97228 800A7228 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 9722C 800A722C 0800E003 */  jr         $ra
    /* 97230 800A7230 00000000 */   nop
endlabel ChangeLang__Fv
