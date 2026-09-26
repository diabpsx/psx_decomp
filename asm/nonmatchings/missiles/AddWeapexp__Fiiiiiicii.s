.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddWeapexp__Fiiiiiicii, 0x100

glabel AddWeapexp__Fiiiiiicii
    /* 5100 8013ECF8 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 5104 8013ECFC 1000B0AF */  sw         $s0, 0x10($sp)
    /* 5108 8013ED00 21808000 */  addu       $s0, $a0, $zero
    /* 510C 8013ED04 80101000 */  sll        $v0, $s0, 2
    /* 5110 8013ED08 21105000 */  addu       $v0, $v0, $s0
    /* 5114 8013ED0C 80100200 */  sll        $v0, $v0, 2
    /* 5118 8013ED10 23105000 */  subu       $v0, $v0, $s0
    /* 511C 8013ED14 80100200 */  sll        $v0, $v0, 2
    /* 5120 8013ED18 1400BFAF */  sw         $ra, 0x14($sp)
    /* 5124 8013ED1C 1080013C */  lui        $at, %hi(missile + 0x31)
    /* 5128 8013ED20 21082200 */  addu       $at, $at, $v0
    /* 512C 8013ED24 892C25A0 */  sb         $a1, %lo(missile + 0x31)($at)
    /* 5130 8013ED28 1080013C */  lui        $at, %hi(missile + 0x32)
    /* 5134 8013ED2C 21082200 */  addu       $at, $at, $v0
    /* 5138 8013ED30 8A2C26A0 */  sb         $a2, %lo(missile + 0x32)($at)
    /* 513C 8013ED34 1080013C */  lui        $at, %hi(missile + 0x35)
    /* 5140 8013ED38 21082200 */  addu       $at, $at, $v0
    /* 5144 8013ED3C 8D2C25A0 */  sb         $a1, %lo(missile + 0x35)($at)
    /* 5148 8013ED40 1080013C */  lui        $at, %hi(missile + 0x36)
    /* 514C 8013ED44 21082200 */  addu       $at, $at, $v0
    /* 5150 8013ED48 8E2C26A0 */  sb         $a2, %lo(missile + 0x36)($at)
    /* 5154 8013ED4C 1080013C */  lui        $at, %hi(missile)
    /* 5158 8013ED50 21082200 */  addu       $at, $at, $v0
    /* 515C 8013ED54 582C20AC */  sw         $zero, %lo(missile)($at)
    /* 5160 8013ED58 1080013C */  lui        $at, %hi(missile + 0x4)
    /* 5164 8013ED5C 21082200 */  addu       $at, $at, $v0
    /* 5168 8013ED60 5C2C20AC */  sw         $zero, %lo(missile + 0x4)($at)
    /* 516C 8013ED64 1080013C */  lui        $at, %hi(missile + 0x1E)
    /* 5170 8013ED68 21082200 */  addu       $at, $at, $v0
    /* 5174 8013ED6C 762C20A4 */  sh         $zero, %lo(missile + 0x1E)($at)
    /* 5178 8013ED70 1080013C */  lui        $at, %hi(missile + 0x20)
    /* 517C 8013ED74 21082200 */  addu       $at, $at, $v0
    /* 5180 8013ED78 782C27A4 */  sh         $a3, %lo(missile + 0x20)($at)
    /* 5184 8013ED7C 1080013C */  lui        $at, %hi(missile + 0x3F)
    /* 5188 8013ED80 21082200 */  addu       $at, $at, $v0
    /* 518C 8013ED84 972C20A0 */  sb         $zero, %lo(missile + 0x3F)($at)
    /* 5190 8013ED88 01000224 */  addiu      $v0, $zero, 0x1
    /* 5194 8013ED8C 0300E214 */  bne        $a3, $v0, .L8013ED9C
    /* 5198 8013ED90 1A000524 */   addiu     $a1, $zero, 0x1A
    /* 519C 8013ED94 68FB0408 */  j          .L8013EDA0
    /* 51A0 8013ED98 05000524 */   addiu     $a1, $zero, 0x5
  .L8013ED9C:
    /* 51A4 8013ED9C 21200002 */  addu       $a0, $s0, $zero
  .L8013EDA0:
    /* 51A8 8013EDA0 D3F4040C */  jal        SetMissAnim__Fii
    /* 51AC 8013EDA4 00000000 */   nop
    /* 51B0 8013EDA8 80181000 */  sll        $v1, $s0, 2
    /* 51B4 8013EDAC 21187000 */  addu       $v1, $v1, $s0
    /* 51B8 8013EDB0 80180300 */  sll        $v1, $v1, 2
    /* 51BC 8013EDB4 23187000 */  subu       $v1, $v1, $s0
    /* 51C0 8013EDB8 80180300 */  sll        $v1, $v1, 2
    /* 51C4 8013EDBC 1080013C */  lui        $at, %hi(missile + 0x42)
    /* 51C8 8013EDC0 21082300 */  addu       $at, $at, $v1
    /* 51CC 8013EDC4 9A2C2290 */  lbu        $v0, %lo(missile + 0x42)($at)
    /* 51D0 8013EDC8 00000000 */  nop
    /* 51D4 8013EDCC 00160200 */  sll        $v0, $v0, 24
    /* 51D8 8013EDD0 03160200 */  sra        $v0, $v0, 24
    /* 51DC 8013EDD4 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 51E0 8013EDD8 1080013C */  lui        $at, %hi(missile + 0x18)
    /* 51E4 8013EDDC 21082300 */  addu       $at, $at, $v1
    /* 51E8 8013EDE0 702C22A4 */  sh         $v0, %lo(missile + 0x18)($at)
    /* 51EC 8013EDE4 1400BF8F */  lw         $ra, 0x14($sp)
    /* 51F0 8013EDE8 1000B08F */  lw         $s0, 0x10($sp)
    /* 51F4 8013EDEC 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 51F8 8013EDF0 0800E003 */  jr         $ra
    /* 51FC 8013EDF4 00000000 */   nop
endlabel AddWeapexp__Fiiiiiicii
