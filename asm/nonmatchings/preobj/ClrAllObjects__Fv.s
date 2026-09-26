.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ClrAllObjects__Fv, 0xF0

glabel ClrAllObjects__Fv
    /* 1E130 80157D28 21200000 */  addu       $a0, $zero, $zero
    /* 1E134 80157D2C 21180000 */  addu       $v1, $zero, $zero
  .L80157D30:
    /* 1E138 80157D30 0E80013C */  lui        $at, %hi(object + 0x1F)
    /* 1E13C 80157D34 21082300 */  addu       $at, $at, $v1
    /* 1E140 80157D38 6B8C20A0 */  sb         $zero, %lo(object + 0x1F)($at)
    /* 1E144 80157D3C 0E80013C */  lui        $at, %hi(object + 0x20)
    /* 1E148 80157D40 21082300 */  addu       $at, $at, $v1
    /* 1E14C 80157D44 6C8C20A0 */  sb         $zero, %lo(object + 0x20)($at)
    /* 1E150 80157D48 0E80013C */  lui        $at, %hi(object + 0x8)
    /* 1E154 80157D4C 21082300 */  addu       $at, $at, $v1
    /* 1E158 80157D50 548C20A4 */  sh         $zero, %lo(object + 0x8)($at)
    /* 1E15C 80157D54 0E80013C */  lui        $at, %hi(object + 0xA)
    /* 1E160 80157D58 21082300 */  addu       $at, $at, $v1
    /* 1E164 80157D5C 568C20A4 */  sh         $zero, %lo(object + 0xA)($at)
    /* 1E168 80157D60 0E80013C */  lui        $at, %hi(object + 0xC)
    /* 1E16C 80157D64 21082300 */  addu       $at, $at, $v1
    /* 1E170 80157D68 588C20A4 */  sh         $zero, %lo(object + 0xC)($at)
    /* 1E174 80157D6C 0E80013C */  lui        $at, %hi(object + 0x21)
    /* 1E178 80157D70 21082300 */  addu       $at, $at, $v1
    /* 1E17C 80157D74 6D8C20A0 */  sb         $zero, %lo(object + 0x21)($at)
    /* 1E180 80157D78 0E80013C */  lui        $at, %hi(object + 0x26)
    /* 1E184 80157D7C 21082300 */  addu       $at, $at, $v1
    /* 1E188 80157D80 728C20A0 */  sb         $zero, %lo(object + 0x26)($at)
    /* 1E18C 80157D84 0E80013C */  lui        $at, %hi(object + 0xE)
    /* 1E190 80157D88 21082300 */  addu       $at, $at, $v1
    /* 1E194 80157D8C 5A8C20A4 */  sh         $zero, %lo(object + 0xE)($at)
    /* 1E198 80157D90 0E80013C */  lui        $at, %hi(object + 0x10)
    /* 1E19C 80157D94 21082300 */  addu       $at, $at, $v1
    /* 1E1A0 80157D98 5C8C20A4 */  sh         $zero, %lo(object + 0x10)($at)
    /* 1E1A4 80157D9C 0E80013C */  lui        $at, %hi(object + 0x12)
    /* 1E1A8 80157DA0 21082300 */  addu       $at, $at, $v1
    /* 1E1AC 80157DA4 5E8C20A4 */  sh         $zero, %lo(object + 0x12)($at)
    /* 1E1B0 80157DA8 0E80013C */  lui        $at, %hi(object + 0x14)
    /* 1E1B4 80157DAC 21082300 */  addu       $at, $at, $v1
    /* 1E1B8 80157DB0 608C20A4 */  sh         $zero, %lo(object + 0x14)($at)
    /* 1E1BC 80157DB4 01008424 */  addiu      $a0, $a0, 0x1
    /* 1E1C0 80157DB8 7F008228 */  slti       $v0, $a0, 0x7F
    /* 1E1C4 80157DBC DCFF4014 */  bnez       $v0, .L80157D30
    /* 1E1C8 80157DC0 2C006324 */   addiu     $v1, $v1, 0x2C
    /* 1E1CC 80157DC4 1280013C */  lui        $at, %hi(numobjects)
    /* 1E1D0 80157DC8 CCB920AC */  sw         $zero, %lo(numobjects)($at)
    /* 1E1D4 80157DCC 21200000 */  addu       $a0, $zero, $zero
  .L80157DD0:
    /* 1E1D8 80157DD0 0E80013C */  lui        $at, %hi(objectavail)
    /* 1E1DC 80157DD4 21082400 */  addu       $at, $at, $a0
    /* 1E1E0 80157DD8 A0A224A0 */  sb         $a0, %lo(objectavail)($at)
    /* 1E1E4 80157DDC 0E80013C */  lui        $at, %hi(objectactive)
    /* 1E1E8 80157DE0 21082400 */  addu       $at, $at, $a0
    /* 1E1EC 80157DE4 20A220A0 */  sb         $zero, %lo(objectactive)($at)
    /* 1E1F0 80157DE8 01008424 */  addiu      $a0, $a0, 0x1
    /* 1E1F4 80157DEC 7F008228 */  slti       $v0, $a0, 0x7F
    /* 1E1F8 80157DF0 F7FF4014 */  bnez       $v0, .L80157DD0
    /* 1E1FC 80157DF4 01000224 */   addiu     $v0, $zero, 0x1
    /* 1E200 80157DF8 1280013C */  lui        $at, %hi(trapid)
    /* 1E204 80157DFC D4B922AC */  sw         $v0, %lo(trapid)($at)
    /* 1E208 80157E00 1280013C */  lui        $at, %hi(trapdir)
    /* 1E20C 80157E04 D8B920AC */  sw         $zero, %lo(trapdir)($at)
    /* 1E210 80157E08 1280013C */  lui        $at, %hi(leverid)
    /* 1E214 80157E0C DCB922AC */  sw         $v0, %lo(leverid)($at)
    /* 1E218 80157E10 0800E003 */  jr         $ra
    /* 1E21C 80157E14 00000000 */   nop
endlabel ClrAllObjects__Fv
