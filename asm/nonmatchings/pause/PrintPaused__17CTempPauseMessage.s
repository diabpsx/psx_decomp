.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PrintPaused__17CTempPauseMessage, 0x150

glabel PrintPaused__17CTempPauseMessage
    /* 79168 80089168 B8FFBD27 */  addiu      $sp, $sp, -0x48
    /* 7916C 8008916C 4000BFAF */  sw         $ra, 0x40($sp)
    /* 79170 80089170 3C00B3AF */  sw         $s3, 0x3C($sp)
    /* 79174 80089174 3800B2AF */  sw         $s2, 0x38($sp)
    /* 79178 80089178 3400B1AF */  sw         $s1, 0x34($sp)
    /* 7917C 8008917C 9291020C */  jal        IsGameLoading__Fv
    /* 79180 80089180 3000B0AF */   sw        $s0, 0x30($sp)
    /* 79184 80089184 44004014 */  bnez       $v0, .L80089298
    /* 79188 80089188 00000000 */   nop
    /* 7918C 8008918C 3ED8000C */  jal        RedBack__Fv
    /* 79190 80089190 00000000 */   nop
    /* 79194 80089194 2925020C */  jal        GetMaxOtPos__7CBlocks_800894a4
    /* 79198 80089198 00000000 */   nop
    /* 7919C 8008919C 1280113C */  lui        $s1, %hi(D_8011CBC0)
    /* 791A0 800891A0 C0CB3126 */  addiu      $s1, $s1, %lo(D_8011CBC0)
    /* 791A4 800891A4 21202002 */  addu       $a0, $s1, $zero
    /* 791A8 800891A8 21804000 */  addu       $s0, $v0, $zero
    /* 791AC 800891AC 8A34020C */  jal        SetOTpos__6Dialogi
    /* 791B0 800891B0 FDFF0526 */   addiu     $a1, $s0, -0x3
    /* 791B4 800891B4 0C80123C */  lui        $s2, %hi(MediumFont)
    /* 791B8 800891B8 D8825226 */  addiu      $s2, $s2, %lo(MediumFont)
    /* 791BC 800891BC 21204002 */  addu       $a0, $s2, $zero
    /* 791C0 800891C0 FEFF0526 */  addiu      $a1, $s0, -0x2
    /* 791C4 800891C4 E82A020C */  jal        SetOTpos__5CFonti
    /* 791C8 800891C8 21984000 */   addu      $s3, $v0, $zero
    /* 791CC 800891CC 21202002 */  addu       $a0, $s1, $zero
    /* 791D0 800891D0 1280053C */  lui        $a1, %hi(BORDERR)
    /* 791D4 800891D4 F7ABA590 */  lbu        $a1, %lo(BORDERR)($a1)
    /* 791D8 800891D8 1280063C */  lui        $a2, %hi(BORDERG)
    /* 791DC 800891DC F8ABC690 */  lbu        $a2, %lo(BORDERG)($a2)
    /* 791E0 800891E0 1280073C */  lui        $a3, %hi(BORDERB)
    /* 791E4 800891E4 F9ABE790 */  lbu        $a3, %lo(BORDERB)($a3)
    /* 791E8 800891E8 F124020C */  jal        SetRGB__6DialogUcUcUc_800893c4
    /* 791EC 800891EC 21804000 */   addu      $s0, $v0, $zero
    /* 791F0 800891F0 21202002 */  addu       $a0, $s1, $zero
    /* 791F4 800891F4 F924020C */  jal        SetBack__6Dialogi_800893e4
    /* 791F8 800891F8 94000524 */   addiu     $a1, $zero, 0x94
    /* 791FC 800891FC 21202002 */  addu       $a0, $s1, $zero
    /* 79200 80089200 FB24020C */  jal        SetBorder__6Dialogi_800893ec
    /* 79204 80089204 12000524 */   addiu     $a1, $zero, 0x12
    /* 79208 80089208 21202002 */  addu       $a0, $s1, $zero
    /* 7920C 8008920C 80000524 */  addiu      $a1, $zero, 0x80
    /* 79210 80089210 70000624 */  addiu      $a2, $zero, 0x70
    /* 79214 80089214 40000724 */  addiu      $a3, $zero, 0x40
    /* 79218 80089218 0F000224 */  addiu      $v0, $zero, 0xF
    /* 7921C 8008921C B82F020C */  jal        Back__6Dialogiiii
    /* 79220 80089220 1000A2AF */   sw        $v0, 0x10($sp)
    /* 79224 80089224 02030424 */  addiu      $a0, $zero, 0x302
    /* 79228 80089228 80000224 */  addiu      $v0, $zero, 0x80
    /* 7922C 8008922C 2800A2A7 */  sh         $v0, 0x28($sp)
    /* 79230 80089230 70000224 */  addiu      $v0, $zero, 0x70
    /* 79234 80089234 2A00A2A7 */  sh         $v0, 0x2A($sp)
    /* 79238 80089238 40000224 */  addiu      $v0, $zero, 0x40
    /* 7923C 8008923C 2C00A2A7 */  sh         $v0, 0x2C($sp)
    /* 79240 80089240 0F000224 */  addiu      $v0, $zero, 0xF
    /* 79244 80089244 4AED010C */  jal        GetStr__Fi
    /* 79248 80089248 2E00A2A7 */   sh        $v0, 0x2E($sp)
    /* 7924C 8008924C 21204002 */  addu       $a0, $s2, $zero
    /* 79250 80089250 21280000 */  addu       $a1, $zero, $zero
    /* 79254 80089254 0B000624 */  addiu      $a2, $zero, 0xB
    /* 79258 80089258 21384000 */  addu       $a3, $v0, $zero
    /* 7925C 8008925C 01000224 */  addiu      $v0, $zero, 0x1
    /* 79260 80089260 1000A2AF */  sw         $v0, 0x10($sp)
    /* 79264 80089264 2800A227 */  addiu      $v0, $sp, 0x28
    /* 79268 80089268 1400A2AF */  sw         $v0, 0x14($sp)
    /* 7926C 8008926C FF000224 */  addiu      $v0, $zero, 0xFF
    /* 79270 80089270 1800A2AF */  sw         $v0, 0x18($sp)
    /* 79274 80089274 1C00A2AF */  sw         $v0, 0x1C($sp)
    /* 79278 80089278 2428020C */  jal        Print__5CFontiiPc8TXT_JUSTP4RECTUcUcUc
    /* 7927C 8008927C 2000A2AF */   sw        $v0, 0x20($sp)
    /* 79280 80089280 21204002 */  addu       $a0, $s2, $zero
    /* 79284 80089284 E82A020C */  jal        SetOTpos__5CFonti
    /* 79288 80089288 21280002 */   addu      $a1, $s0, $zero
    /* 7928C 8008928C 21202002 */  addu       $a0, $s1, $zero
    /* 79290 80089290 8A34020C */  jal        SetOTpos__6Dialogi
    /* 79294 80089294 21286002 */   addu      $a1, $s3, $zero
  .L80089298:
    /* 79298 80089298 4000BF8F */  lw         $ra, 0x40($sp)
    /* 7929C 8008929C 3C00B38F */  lw         $s3, 0x3C($sp)
    /* 792A0 800892A0 3800B28F */  lw         $s2, 0x38($sp)
    /* 792A4 800892A4 3400B18F */  lw         $s1, 0x34($sp)
    /* 792A8 800892A8 3000B08F */  lw         $s0, 0x30($sp)
    /* 792AC 800892AC 4800BD27 */  addiu      $sp, $sp, 0x48
    /* 792B0 800892B0 0800E003 */  jr         $ra
    /* 792B4 800892B4 00000000 */   nop
endlabel PrintPaused__17CTempPauseMessage
