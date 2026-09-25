.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GoLoadGame__Fv, 0x158

glabel GoLoadGame__Fv
    /* 87130 80097130 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 87134 80097134 1000BFAF */  sw         $ra, 0x10($sp)
    /* 87138 80097138 5F5D020C */  jal        LevelToLevelInit__Fv
    /* 8713C 8009713C 00000000 */   nop
    /* 87140 80097140 7372050C */  jal        func_8015C9CC
    /* 87144 80097144 01000424 */   addiu     $a0, $zero, 0x1
    /* 87148 80097148 6688010C */  jal        CheckPlrDead__Fi
    /* 8714C 8009714C 21200000 */   addu      $a0, $zero, $zero
    /* 87150 80097150 6688010C */  jal        CheckPlrDead__Fi
    /* 87154 80097154 01000424 */   addiu     $a0, $zero, 0x1
    /* 87158 80097158 A0EB010C */  jal        InitGamePadVars__Fv
    /* 8715C 8009715C 00000000 */   nop
    /* 87160 80097160 FC05848F */  lw         $a0, %gp_rel(D_8011AD7C)($gp)
    /* 87164 80097164 D692020C */  jal        PutUpCutScreen__Fi
    /* 87168 80097168 00000000 */   nop
    /* 8716C 8009716C 0955020C */  jal        OVR_LoadPregame__Fv
    /* 87170 80097170 00000000 */   nop
    /* 87174 80097174 21300000 */  addu       $a2, $zero, $zero
    /* 87178 80097178 0E80073C */  lui        $a3, %hi(quests + 0x16)
    /* 8717C 8009717C 56DAE724 */  addiu      $a3, $a3, %lo(quests + 0x16)
    /* 87180 80097180 03000C24 */  addiu      $t4, $zero, 0x3
    /* 87184 80097184 FFFF0B24 */  addiu      $t3, $zero, -0x1
    /* 87188 80097188 2C000924 */  addiu      $t1, $zero, 0x2C
    /* 8718C 8009718C 01000824 */  addiu      $t0, $zero, 0x1
    /* 87190 80097190 11800A3C */  lui        $t2, %hi(AllItemsList + 0x22)
    /* 87194 80097194 C6134A81 */  lb         $t2, %lo(AllItemsList + 0x22)($t2)
  .L80097198:
    /* 87198 80097198 1280023C */  lui        $v0, %hi(FePlayerNo)
    /* 8719C 8009719C 78B3428C */  lw         $v0, %lo(FePlayerNo)($v0)
    /* 871A0 800971A0 00000000 */  nop
    /* 871A4 800971A4 01004224 */  addiu      $v0, $v0, 0x1
    /* 871A8 800971A8 2A10C200 */  slt        $v0, $a2, $v0
    /* 871AC 800971AC 21004010 */  beqz       $v0, .L80097234
    /* 871B0 800971B0 00000000 */   nop
    /* 871B4 800971B4 0000E290 */  lbu        $v0, 0x0($a3)
    /* 871B8 800971B8 00000000 */  nop
    /* 871BC 800971BC 1B004C14 */  bne        $v0, $t4, .L8009722C
    /* 871C0 800971C0 00000000 */   nop
    /* 871C4 800971C4 0D00E290 */  lbu        $v0, 0xD($a3)
    /* 871C8 800971C8 00000000 */  nop
    /* 871CC 800971CC FEFF4224 */  addiu      $v0, $v0, -0x2
    /* 871D0 800971D0 0300422C */  sltiu      $v0, $v0, 0x3
    /* 871D4 800971D4 15004014 */  bnez       $v0, .L8009722C
    /* 871D8 800971D8 00000000 */   nop
    /* 871DC 800971DC 13004B11 */  beq        $t2, $t3, .L8009722C
    /* 871E0 800971E0 01000424 */   addiu     $a0, $zero, 0x1
    /* 871E4 800971E4 FFFF0524 */  addiu      $a1, $zero, -0x1
    /* 871E8 800971E8 20000324 */  addiu      $v1, $zero, 0x20
  .L800971EC:
    /* 871EC 800971EC 1180013C */  lui        $at, %hi(AllItemsList + 0x18)
    /* 871F0 800971F0 21082300 */  addu       $at, $at, $v1
    /* 871F4 800971F4 BC132290 */  lbu        $v0, %lo(AllItemsList + 0x18)($at)
    /* 871F8 800971F8 00000000 */  nop
    /* 871FC 800971FC 04004914 */  bne        $v0, $t1, .L80097210
    /* 87200 80097200 00000000 */   nop
    /* 87204 80097204 0D80013C */  lui        $at, %hi(AllItemsUseable)
    /* 87208 80097208 21082400 */  addu       $at, $at, $a0
    /* 8720C 8009720C 401B28A0 */  sb         $t0, %lo(AllItemsUseable)($at)
  .L80097210:
    /* 87210 80097210 20006324 */  addiu      $v1, $v1, 0x20
    /* 87214 80097214 1180013C */  lui        $at, %hi(AllItemsList + 0x2)
    /* 87218 80097218 21082300 */  addu       $at, $at, $v1
    /* 8721C 8009721C A6132280 */  lb         $v0, %lo(AllItemsList + 0x2)($at)
    /* 87220 80097220 00000000 */  nop
    /* 87224 80097224 F1FF4514 */  bne        $v0, $a1, .L800971EC
    /* 87228 80097228 01008424 */   addiu     $a0, $a0, 0x1
  .L8009722C:
    /* 8722C 8009722C 665C0208 */  j          .L80097198
    /* 87230 80097230 0100C624 */   addiu     $a2, $a2, 0x1
  .L80097234:
    /* 87234 80097234 378B050C */  jal        func_80162CDC
    /* 87238 80097238 00000000 */   nop
    /* 8723C 8009723C 748B050C */  jal        func_80162DD0
    /* 87240 80097240 00000000 */   nop
    /* 87244 80097244 21200000 */  addu       $a0, $zero, $zero
    /* 87248 80097248 9CE4000C */  jal        LoadGameLevel__FUci
    /* 8724C 8009724C 04000524 */   addiu     $a1, $zero, 0x4
    /* 87250 80097250 1C7D050C */  jal        func_8015F470
    /* 87254 80097254 00000000 */   nop
    /* 87258 80097258 93F8000C */  jal        InitItemGFX__Fv
    /* 8725C 8009725C 00000000 */   nop
    /* 87260 80097260 5936010C */  jal        InitQuestText__Fv
    /* 87264 80097264 00000000 */   nop
    /* 87268 80097268 AF7D050C */  jal        func_8015F6BC
    /* 8726C 8009726C 00000000 */   nop
    /* 87270 80097270 717E010C */  jal        RestoreObjectLight__Fv
    /* 87274 80097274 00000000 */   nop
    /* 87278 80097278 1000BF8F */  lw         $ra, 0x10($sp)
    /* 8727C 8009727C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 87280 80097280 0800E003 */  jr         $ra
    /* 87284 80097284 00000000 */   nop
endlabel GoLoadGame__Fv
