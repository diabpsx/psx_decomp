.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PrintMono__Fi, 0xB8

glabel PrintMono__Fi
    /* 9723C 800A723C 1280023C */  lui        $v0, %hi(MONO)
    /* 97240 800A7240 B0BB428C */  lw         $v0, %lo(MONO)($v0)
    /* 97244 800A7244 C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* 97248 800A7248 3000B2AF */  sw         $s2, 0x30($sp)
    /* 9724C 800A724C 21908000 */  addu       $s2, $a0, $zero
    /* 97250 800A7250 3400BFAF */  sw         $ra, 0x34($sp)
    /* 97254 800A7254 2C00B1AF */  sw         $s1, 0x2C($sp)
    /* 97258 800A7258 2800B0AF */  sw         $s0, 0x28($sp)
    /* 9725C 800A725C 02004010 */  beqz       $v0, .L800A7268
    /* 97260 800A7260 9C020424 */   addiu     $a0, $zero, 0x29C
    /* 97264 800A7264 9A020424 */  addiu      $a0, $zero, 0x29A
  .L800A7268:
    /* 97268 800A7268 4AED010C */  jal        GetStr__Fi
    /* 9726C 800A726C 00000000 */   nop
    /* 97270 800A7270 21884000 */  addu       $s1, $v0, $zero
    /* 97274 800A7274 0C80103C */  lui        $s0, %hi(MediumFont)
    /* 97278 800A7278 D8821026 */  addiu      $s0, $s0, %lo(MediumFont)
    /* 9727C 800A727C 21200002 */  addu       $a0, $s0, $zero
    /* 97280 800A7280 A92A020C */  jal        GetStrWidth__5CFontPc
    /* 97284 800A7284 21282002 */   addu      $a1, $s1, $zero
    /* 97288 800A7288 43380200 */  sra        $a3, $v0, 1
    /* 9728C 800A728C E80A858F */  lw         $a1, %gp_rel(MonoX)($gp)
    /* 97290 800A7290 1280023C */  lui        $v0, %hi(WHITER)
    /* 97294 800A7294 D1AB4290 */  lbu        $v0, %lo(WHITER)($v0)
    /* 97298 800A7298 1280033C */  lui        $v1, %hi(D_8011C710)
    /* 9729C 800A729C 10C76324 */  addiu      $v1, $v1, %lo(D_8011C710)
    /* 972A0 800A72A0 1400A3AF */  sw         $v1, 0x14($sp)
    /* 972A4 800A72A4 1280033C */  lui        $v1, %hi(WHITEG)
    /* 972A8 800A72A8 D2AB6390 */  lbu        $v1, %lo(WHITEG)($v1)
    /* 972AC 800A72AC 1280063C */  lui        $a2, %hi(WHITEB)
    /* 972B0 800A72B0 D3ABC690 */  lbu        $a2, %lo(WHITEB)($a2)
    /* 972B4 800A72B4 21200002 */  addu       $a0, $s0, $zero
    /* 972B8 800A72B8 1000A0AF */  sw         $zero, 0x10($sp)
    /* 972BC 800A72BC 2328A700 */  subu       $a1, $a1, $a3
    /* 972C0 800A72C0 2000A6AF */  sw         $a2, 0x20($sp)
    /* 972C4 800A72C4 21304002 */  addu       $a2, $s2, $zero
    /* 972C8 800A72C8 21382002 */  addu       $a3, $s1, $zero
    /* 972CC 800A72CC 1800A2AF */  sw         $v0, 0x18($sp)
    /* 972D0 800A72D0 2428020C */  jal        Print__5CFontiiPc8TXT_JUSTP4RECTUcUcUc
    /* 972D4 800A72D4 1C00A3AF */   sw        $v1, 0x1C($sp)
    /* 972D8 800A72D8 3400BF8F */  lw         $ra, 0x34($sp)
    /* 972DC 800A72DC 3000B28F */  lw         $s2, 0x30($sp)
    /* 972E0 800A72E0 2C00B18F */  lw         $s1, 0x2C($sp)
    /* 972E4 800A72E4 2800B08F */  lw         $s0, 0x28($sp)
    /* 972E8 800A72E8 3800BD27 */  addiu      $sp, $sp, 0x38
    /* 972EC 800A72EC 0800E003 */  jr         $ra
    /* 972F0 800A72F0 00000000 */   nop
endlabel PrintMono__Fi
