.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching M_DoWalk2__Fi, 0x1EC

glabel M_DoWalk2__Fi
    /* 13168 8014CD60 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 1316C 8014CD64 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 13170 8014CD68 21888000 */  addu       $s1, $a0, $zero
    /* 13174 8014CD6C 40101100 */  sll        $v0, $s1, 1
    /* 13178 8014CD70 21105100 */  addu       $v0, $v0, $s1
    /* 1317C 8014CD74 80100200 */  sll        $v0, $v0, 2
    /* 13180 8014CD78 21105100 */  addu       $v0, $v0, $s1
    /* 13184 8014CD7C 1800B0AF */  sw         $s0, 0x18($sp)
    /* 13188 8014CD80 C0800200 */  sll        $s0, $v0, 3
    /* 1318C 8014CD84 2000BFAF */  sw         $ra, 0x20($sp)
    /* 13190 8014CD88 1080013C */  lui        $at, %hi(monster + 0x60)
    /* 13194 8014CD8C 21083000 */  addu       $at, $at, $s0
    /* 13198 8014CD90 F453228C */  lw         $v0, %lo(monster + 0x60)($at)
    /* 1319C 8014CD94 1080013C */  lui        $at, %hi(monster + 0x26)
    /* 131A0 8014CD98 21083000 */  addu       $at, $at, $s0
    /* 131A4 8014CD9C BA532384 */  lh         $v1, %lo(monster + 0x26)($at)
    /* 131A8 8014CDA0 06004280 */  lb         $v0, 0x6($v0)
    /* 131AC 8014CDA4 00000000 */  nop
    /* 131B0 8014CDA8 28006214 */  bne        $v1, $v0, .L8014CE4C
    /* 131B4 8014CDAC 21206000 */   addu      $a0, $v1, $zero
    /* 131B8 8014CDB0 1080013C */  lui        $at, %hi(monster + 0x1A)
    /* 131BC 8014CDB4 21083000 */  addu       $at, $at, $s0
    /* 131C0 8014CDB8 AE532384 */  lh         $v1, %lo(monster + 0x1A)($at)
    /* 131C4 8014CDBC 1080013C */  lui        $at, %hi(monster + 0x18)
    /* 131C8 8014CDC0 21083000 */  addu       $at, $at, $s0
    /* 131CC 8014CDC4 AC532484 */  lh         $a0, %lo(monster + 0x18)($at)
    /* 131D0 8014CDC8 C0180300 */  sll        $v1, $v1, 3
    /* 131D4 8014CDCC C0100400 */  sll        $v0, $a0, 3
    /* 131D8 8014CDD0 23104400 */  subu       $v0, $v0, $a0
    /* 131DC 8014CDD4 C0110200 */  sll        $v0, $v0, 7
    /* 131E0 8014CDD8 21186200 */  addu       $v1, $v1, $v0
    /* 131E4 8014CDDC 0E80013C */  lui        $at, %hi(dung_map)
    /* 131E8 8014CDE0 21082300 */  addu       $at, $at, $v1
    /* 131EC 8014CDE4 287A20A4 */  sh         $zero, %lo(dung_map)($at)
    /* 131F0 8014CDE8 1080013C */  lui        $at, %hi(monster + 0x4F)
    /* 131F4 8014CDEC 21083000 */  addu       $at, $at, $s0
    /* 131F8 8014CDF0 E3532290 */  lbu        $v0, %lo(monster + 0x4F)($at)
    /* 131FC 8014CDF4 00000000 */  nop
    /* 13200 8014CDF8 0D004010 */  beqz       $v0, .L8014CE30
    /* 13204 8014CDFC 21202002 */   addu      $a0, $s1, $zero
    /* 13208 8014CE00 1080013C */  lui        $at, %hi(monster + 0x59)
    /* 1320C 8014CE04 21083000 */  addu       $at, $at, $s0
    /* 13210 8014CE08 ED532490 */  lbu        $a0, %lo(monster + 0x59)($at)
    /* 13214 8014CE0C 1080013C */  lui        $at, %hi(monster + 0x34)
    /* 13218 8014CE10 21083000 */  addu       $at, $at, $s0
    /* 1321C 8014CE14 C8532580 */  lb         $a1, %lo(monster + 0x34)($at)
    /* 13220 8014CE18 1080013C */  lui        $at, %hi(monster + 0x35)
    /* 13224 8014CE1C 21083000 */  addu       $at, $at, $s0
    /* 13228 8014CE20 C9532680 */  lb         $a2, %lo(monster + 0x35)($at)
    /* 1322C 8014CE24 E134010C */  jal        ChangeLightXY__Fiii
    /* 13230 8014CE28 00000000 */   nop
    /* 13234 8014CE2C 21202002 */  addu       $a0, $s1, $zero
  .L8014CE30:
    /* 13238 8014CE30 1080013C */  lui        $at, %hi(monster + 0x3C)
    /* 1323C 8014CE34 21083000 */  addu       $at, $at, $s0
    /* 13240 8014CE38 D0532580 */  lb         $a1, %lo(monster + 0x3C)($at)
    /* 13244 8014CE3C 9CFF010C */  jal        M_StartStand__Fii
    /* 13248 8014CE40 01001024 */   addiu     $s0, $zero, 0x1
    /* 1324C 8014CE44 C0330508 */  j          .L8014CF00
    /* 13250 8014CE48 40101100 */   sll       $v0, $s1, 1
  .L8014CE4C:
    /* 13254 8014CE4C 1080013C */  lui        $at, %hi(monster + 0x3F)
    /* 13258 8014CE50 21083000 */  addu       $at, $at, $s0
    /* 1325C 8014CE54 D3532280 */  lb         $v0, %lo(monster + 0x3F)($at)
    /* 13260 8014CE58 00000000 */  nop
    /* 13264 8014CE5C 26004014 */  bnez       $v0, .L8014CEF8
    /* 13268 8014CE60 01008224 */   addiu     $v0, $a0, 0x1
    /* 1326C 8014CE64 1080013C */  lui        $at, %hi(monster + 0x26)
    /* 13270 8014CE68 21083000 */  addu       $at, $at, $s0
    /* 13274 8014CE6C BA5322A4 */  sh         $v0, %lo(monster + 0x26)($at)
    /* 13278 8014CE70 1080013C */  lui        $at, %hi(monster + 0x22)
    /* 1327C 8014CE74 21083000 */  addu       $at, $at, $s0
    /* 13280 8014CE78 B6532294 */  lhu        $v0, %lo(monster + 0x22)($at)
    /* 13284 8014CE7C 1080013C */  lui        $at, %hi(monster + 0x28)
    /* 13288 8014CE80 21083000 */  addu       $at, $at, $s0
    /* 1328C 8014CE84 BC532494 */  lhu        $a0, %lo(monster + 0x28)($at)
    /* 13290 8014CE88 1080013C */  lui        $at, %hi(monster + 0x24)
    /* 13294 8014CE8C 21083000 */  addu       $at, $at, $s0
    /* 13298 8014CE90 B8532394 */  lhu        $v1, %lo(monster + 0x24)($at)
    /* 1329C 8014CE94 1080013C */  lui        $at, %hi(monster + 0x2A)
    /* 132A0 8014CE98 21083000 */  addu       $at, $at, $s0
    /* 132A4 8014CE9C BE532594 */  lhu        $a1, %lo(monster + 0x2A)($at)
    /* 132A8 8014CEA0 21104400 */  addu       $v0, $v0, $a0
    /* 132AC 8014CEA4 1080013C */  lui        $at, %hi(monster + 0x22)
    /* 132B0 8014CEA8 21083000 */  addu       $at, $at, $s0
    /* 132B4 8014CEAC B65322A4 */  sh         $v0, %lo(monster + 0x22)($at)
    /* 132B8 8014CEB0 1080013C */  lui        $at, %hi(monster + 0x22)
    /* 132BC 8014CEB4 21083000 */  addu       $at, $at, $s0
    /* 132C0 8014CEB8 B6532294 */  lhu        $v0, %lo(monster + 0x22)($at)
    /* 132C4 8014CEBC 21186500 */  addu       $v1, $v1, $a1
    /* 132C8 8014CEC0 1080013C */  lui        $at, %hi(monster + 0x24)
    /* 132CC 8014CEC4 21083000 */  addu       $at, $at, $s0
    /* 132D0 8014CEC8 B85323A4 */  sh         $v1, %lo(monster + 0x24)($at)
    /* 132D4 8014CECC 1080013C */  lui        $at, %hi(monster + 0x24)
    /* 132D8 8014CED0 21083000 */  addu       $at, $at, $s0
    /* 132DC 8014CED4 B8532394 */  lhu        $v1, %lo(monster + 0x24)($at)
    /* 132E0 8014CED8 02110200 */  srl        $v0, $v0, 4
    /* 132E4 8014CEDC 02190300 */  srl        $v1, $v1, 4
    /* 132E8 8014CEE0 1080013C */  lui        $at, %hi(monster + 0x3A)
    /* 132EC 8014CEE4 21083000 */  addu       $at, $at, $s0
    /* 132F0 8014CEE8 CE5322A0 */  sb         $v0, %lo(monster + 0x3A)($at)
    /* 132F4 8014CEEC 1080013C */  lui        $at, %hi(monster + 0x3B)
    /* 132F8 8014CEF0 21083000 */  addu       $at, $at, $s0
    /* 132FC 8014CEF4 CF5323A0 */  sb         $v1, %lo(monster + 0x3B)($at)
  .L8014CEF8:
    /* 13300 8014CEF8 21800000 */  addu       $s0, $zero, $zero
    /* 13304 8014CEFC 40101100 */  sll        $v0, $s1, 1
  .L8014CF00:
    /* 13308 8014CF00 21105100 */  addu       $v0, $v0, $s1
    /* 1330C 8014CF04 80100200 */  sll        $v0, $v0, 2
    /* 13310 8014CF08 21105100 */  addu       $v0, $v0, $s1
    /* 13314 8014CF0C C0100200 */  sll        $v0, $v0, 3
    /* 13318 8014CF10 1080013C */  lui        $at, %hi(monster + 0x4F)
    /* 1331C 8014CF14 21082200 */  addu       $at, $at, $v0
    /* 13320 8014CF18 E3532290 */  lbu        $v0, %lo(monster + 0x4F)($at)
    /* 13324 8014CF1C 00000000 */  nop
    /* 13328 8014CF20 04004010 */  beqz       $v0, .L8014CF34
    /* 1332C 8014CF24 21100002 */   addu      $v0, $s0, $zero
    /* 13330 8014CF28 4A32050C */  jal        M_ChangeLightOffset__Fi
    /* 13334 8014CF2C 21202002 */   addu      $a0, $s1, $zero
    /* 13338 8014CF30 21100002 */  addu       $v0, $s0, $zero
  .L8014CF34:
    /* 1333C 8014CF34 2000BF8F */  lw         $ra, 0x20($sp)
    /* 13340 8014CF38 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 13344 8014CF3C 1800B08F */  lw         $s0, 0x18($sp)
    /* 13348 8014CF40 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 1334C 8014CF44 0800E003 */  jr         $ra
    /* 13350 8014CF48 00000000 */   nop
endlabel M_DoWalk2__Fi
