.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching resizememblocka, 0x418

glabel resizememblocka
    /* 1BFE8 8002BFE8 C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* 1BFEC 8002BFEC 2000B4AF */  sw         $s4, 0x20($sp)
    /* 1BFF0 8002BFF0 21A0A000 */  addu       $s4, $a1, $zero
    /* 1BFF4 8002BFF4 2C00B7AF */  sw         $s7, 0x2C($sp)
    /* 1BFF8 8002BFF8 21B8C000 */  addu       $s7, $a2, $zero
    /* 1BFFC 8002BFFC 1400B1AF */  sw         $s1, 0x14($sp)
    /* 1C000 8002C000 21888000 */  addu       $s1, $a0, $zero
    /* 1C004 8002C004 3000BFAF */  sw         $ra, 0x30($sp)
    /* 1C008 8002C008 2800B6AF */  sw         $s6, 0x28($sp)
    /* 1C00C 8002C00C 2400B5AF */  sw         $s5, 0x24($sp)
    /* 1C010 8002C010 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 1C014 8002C014 1800B2AF */  sw         $s2, 0x18($sp)
    /* 1C018 8002C018 0C002016 */  bnez       $s1, .L8002C04C
    /* 1C01C 8002C01C 1000B0AF */   sw        $s0, 0x10($sp)
    /* 1C020 8002C020 1180043C */  lui        $a0, %hi(D_8010F96C)
    /* 1C024 8002C024 6CF98424 */  addiu      $a0, $a0, %lo(D_8010F96C)
    /* 1C028 8002C028 1180023C */  lui        $v0, %hi(D_8010F95C)
    /* 1C02C 8002C02C 5CF94224 */  addiu      $v0, $v0, %lo(D_8010F95C)
    /* 1C030 8002C030 1280013C */  lui        $at, %hi(abortfile)
    /* 1C034 8002C034 B8C322AC */  sw         $v0, %lo(abortfile)($at)
    /* 1C038 8002C038 9A000224 */  addiu      $v0, $zero, 0x9A
    /* 1C03C 8002C03C 1280013C */  lui        $at, %hi(abortline)
    /* 1C040 8002C040 BCC322AC */  sw         $v0, %lo(abortline)($at)
    /* 1C044 8002C044 0F95000C */  jal        abortmessage
    /* 1C048 8002C048 00000000 */   nop
  .L8002C04C:
    /* 1C04C 8002C04C 1800228E */  lw         $v0, 0x18($s1)
    /* 1C050 8002C050 00000000 */  nop
    /* 1C054 8002C054 00204230 */  andi       $v0, $v0, 0x2000
    /* 1C058 8002C058 06004010 */  beqz       $v0, .L8002C074
    /* 1C05C 8002C05C 00000000 */   nop
    /* 1C060 8002C060 1280023C */  lui        $v0, %hi(membreak)
    /* 1C064 8002C064 C0C4428C */  lw         $v0, %lo(membreak)($v0)
    /* 1C068 8002C068 00000000 */  nop
    /* 1C06C 8002C06C 09F84000 */  jalr       $v0
    /* 1C070 8002C070 21202002 */   addu      $a0, $s1, $zero
  .L8002C074:
    /* 1C074 8002C074 1800228E */  lw         $v0, 0x18($s1)
    /* 1C078 8002C078 00000000 */  nop
    /* 1C07C 8002C07C 00804230 */  andi       $v0, $v0, 0x8000
    /* 1C080 8002C080 0C004010 */  beqz       $v0, .L8002C0B4
    /* 1C084 8002C084 00000000 */   nop
    /* 1C088 8002C088 1180043C */  lui        $a0, %hi(D_8010F98C)
    /* 1C08C 8002C08C 8CF98424 */  addiu      $a0, $a0, %lo(D_8010F98C)
    /* 1C090 8002C090 1180023C */  lui        $v0, %hi(D_8010F95C)
    /* 1C094 8002C094 5CF94224 */  addiu      $v0, $v0, %lo(D_8010F95C)
    /* 1C098 8002C098 1280013C */  lui        $at, %hi(abortfile)
    /* 1C09C 8002C09C B8C322AC */  sw         $v0, %lo(abortfile)($at)
    /* 1C0A0 8002C0A0 9C000224 */  addiu      $v0, $zero, 0x9C
    /* 1C0A4 8002C0A4 1280013C */  lui        $at, %hi(abortline)
    /* 1C0A8 8002C0A8 BCC322AC */  sw         $v0, %lo(abortline)($at)
    /* 1C0AC 8002C0AC 0F95000C */  jal        abortmessage
    /* 1C0B0 8002C0B0 00000000 */   nop
  .L8002C0B4:
    /* 1C0B4 8002C0B4 1800228E */  lw         $v0, 0x18($s1)
    /* 1C0B8 8002C0B8 00000000 */  nop
    /* 1C0BC 8002C0BC 00404230 */  andi       $v0, $v0, 0x4000
    /* 1C0C0 8002C0C0 12004010 */  beqz       $v0, .L8002C10C
    /* 1C0C4 8002C0C4 00000000 */   nop
    /* 1C0C8 8002C0C8 1BB1000C */  jal        checksentinelz
    /* 1C0CC 8002C0CC 21202002 */   addu      $a0, $s1, $zero
    /* 1C0D0 8002C0D0 0E004014 */  bnez       $v0, .L8002C10C
    /* 1C0D4 8002C0D4 00000000 */   nop
    /* 1C0D8 8002C0D8 0000268E */  lw         $a2, 0x0($s1)
    /* 1C0DC 8002C0DC 1400278E */  lw         $a3, 0x14($s1)
    /* 1C0E0 8002C0E0 1180043C */  lui        $a0, %hi(D_8010F9BC)
    /* 1C0E4 8002C0E4 BCF98424 */  addiu      $a0, $a0, %lo(D_8010F9BC)
    /* 1C0E8 8002C0E8 1180023C */  lui        $v0, %hi(D_8010F95C)
    /* 1C0EC 8002C0EC 5CF94224 */  addiu      $v0, $v0, %lo(D_8010F95C)
    /* 1C0F0 8002C0F0 1280013C */  lui        $at, %hi(abortfile)
    /* 1C0F4 8002C0F4 B8C322AC */  sw         $v0, %lo(abortfile)($at)
    /* 1C0F8 8002C0F8 A2000224 */  addiu      $v0, $zero, 0xA2
    /* 1C0FC 8002C0FC 1280013C */  lui        $at, %hi(abortline)
    /* 1C100 8002C100 BCC322AC */  sw         $v0, %lo(abortline)($at)
    /* 1C104 8002C104 0F95000C */  jal        abortmessage
    /* 1C108 8002C108 04002526 */   addiu     $a1, $s1, 0x4
  .L8002C10C:
    /* 1C10C 8002C10C 1800228E */  lw         $v0, 0x18($s1)
    /* 1C110 8002C110 1280043C */  lui        $a0, %hi(_lv)
    /* 1C114 8002C114 94CA848C */  lw         $a0, %lo(_lv)($a0)
    /* 1C118 8002C118 1380033C */  lui        $v1, %hi(memclass)
    /* 1C11C 8002C11C 307A6324 */  addiu      $v1, $v1, %lo(memclass)
    /* 1C120 8002C120 000F4230 */  andi       $v0, $v0, 0xF00
    /* 1C124 8002C124 02B20200 */  srl        $s6, $v0, 8
    /* 1C128 8002C128 40101600 */  sll        $v0, $s6, 1
    /* 1C12C 8002C12C 21105600 */  addu       $v0, $v0, $s6
    /* 1C130 8002C130 C0100200 */  sll        $v0, $v0, 3
    /* 1C134 8002C134 E8BD000C */  jal        locksemaphore
    /* 1C138 8002C138 21804300 */   addu      $s0, $v0, $v1
    /* 1C13C 8002C13C 2000238E */  lw         $v1, 0x20($s1)
    /* 1C140 8002C140 0800058E */  lw         $a1, 0x8($s0)
    /* 1C144 8002C144 1400028E */  lw         $v0, 0x14($s0)
    /* 1C148 8002C148 0000268E */  lw         $a2, 0x0($s1)
    /* 1C14C 8002C14C 0000638C */  lw         $v1, 0x0($v1)
    /* 1C150 8002C150 27200500 */  nor        $a0, $zero, $a1
    /* 1C154 8002C154 21108202 */  addu       $v0, $s4, $v0
    /* 1C158 8002C158 21104500 */  addu       $v0, $v0, $a1
    /* 1C15C 8002C15C 24984400 */  and        $s3, $v0, $a0
    /* 1C160 8002C160 23186600 */  subu       $v1, $v1, $a2
    /* 1C164 8002C164 17008106 */  bgez       $s4, .L8002C1C4
    /* 1C168 8002C168 24906400 */   and       $s2, $v1, $a0
    /* 1C16C 8002C16C 21988002 */  addu       $s3, $s4, $zero
    /* 1C170 8002C170 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 1C174 8002C174 14006212 */  beq        $s3, $v0, .L8002C1C8
    /* 1C178 8002C178 21A80000 */   addu      $s5, $zero, $zero
    /* 1C17C 8002C17C 1280043C */  lui        $a0, %hi(_lv)
    /* 1C180 8002C180 94CA848C */  lw         $a0, %lo(_lv)($a0)
    /* 1C184 8002C184 F3BD000C */  jal        unlocksemaphore
    /* 1C188 8002C188 00000000 */   nop
    /* 1C18C 8002C18C 8F00E012 */  beqz       $s7, .L8002C3CC
    /* 1C190 8002C190 00000000 */   nop
    /* 1C194 8002C194 D7AC000C */  jal        largestunused
    /* 1C198 8002C198 00000000 */   nop
    /* 1C19C 8002C19C 1180043C */  lui        $a0, %hi(D_8010FA00)
    /* 1C1A0 8002C1A0 00FA8424 */  addiu      $a0, $a0, %lo(D_8010FA00)
    /* 1C1A4 8002C1A4 21286002 */  addu       $a1, $s3, $zero
    /* 1C1A8 8002C1A8 21304000 */  addu       $a2, $v0, $zero
    /* 1C1AC 8002C1AC 1180023C */  lui        $v0, %hi(D_8010F95C)
    /* 1C1B0 8002C1B0 5CF94224 */  addiu      $v0, $v0, %lo(D_8010F95C)
    /* 1C1B4 8002C1B4 1280013C */  lui        $at, %hi(abortfile)
    /* 1C1B8 8002C1B8 B8C322AC */  sw         $v0, %lo(abortfile)($at)
    /* 1C1BC 8002C1BC EFB00008 */  j          .L8002C3BC
    /* 1C1C0 8002C1C0 CE000224 */   addiu     $v0, $zero, 0xCE
  .L8002C1C4:
    /* 1C1C4 8002C1C4 21A80000 */  addu       $s5, $zero, $zero
  .L8002C1C8:
    /* 1C1C8 8002C1C8 2A105302 */  slt        $v0, $s2, $s3
    /* 1C1CC 8002C1CC 0D004014 */  bnez       $v0, .L8002C204
    /* 1C1D0 8002C1D0 00000000 */   nop
    /* 1C1D4 8002C1D4 0B006006 */  bltz       $s3, .L8002C204
    /* 1C1D8 8002C1D8 00000000 */   nop
    /* 1C1DC 8002C1DC 140034AE */  sw         $s4, 0x14($s1)
    /* 1C1E0 8002C1E0 100033AE */  sw         $s3, 0x10($s1)
    /* 1C1E4 8002C1E4 1400028E */  lw         $v0, 0x14($s0)
    /* 1C1E8 8002C1E8 00000000 */  nop
    /* 1C1EC 8002C1EC 5D004010 */  beqz       $v0, .L8002C364
    /* 1C1F0 8002C1F0 00000000 */   nop
    /* 1C1F4 8002C1F4 00B1000C */  jal        addsentinel
    /* 1C1F8 8002C1F8 21202002 */   addu      $a0, $s1, $zero
    /* 1C1FC 8002C1FC D9B00008 */  j          .L8002C364
    /* 1C200 8002C200 00000000 */   nop
  .L8002C204:
    /* 1C204 8002C204 1280023C */  lui        $v0, %hi(autocompact)
    /* 1C208 8002C208 B8C4428C */  lw         $v0, %lo(autocompact)($v0)
    /* 1C20C 8002C20C 00000000 */  nop
    /* 1C210 8002C210 5A004010 */  beqz       $v0, .L8002C37C
    /* 1C214 8002C214 00000000 */   nop
    /* 1C218 8002C218 2000228E */  lw         $v0, 0x20($s1)
    /* 1C21C 8002C21C 00000000 */  nop
    /* 1C220 8002C220 1800428C */  lw         $v0, 0x18($v0)
    /* 1C224 8002C224 00000000 */  nop
    /* 1C228 8002C228 18004230 */  andi       $v0, $v0, 0x18
    /* 1C22C 8002C22C 0A004010 */  beqz       $v0, .L8002C258
    /* 1C230 8002C230 00000000 */   nop
    /* 1C234 8002C234 0800A016 */  bnez       $s5, .L8002C258
    /* 1C238 8002C238 00000000 */   nop
    /* 1C23C 8002C23C 0400048E */  lw         $a0, 0x4($s0)
    /* 1C240 8002C240 E9AE000C */  jal        compactupi
    /* 1C244 8002C244 21282002 */   addu      $a1, $s1, $zero
    /* 1C248 8002C248 13004014 */  bnez       $v0, .L8002C298
    /* 1C24C 8002C24C 00000000 */   nop
    /* 1C250 8002C250 72B00008 */  j          .L8002C1C8
    /* 1C254 8002C254 01001524 */   addiu     $s5, $zero, 0x1
  .L8002C258:
    /* 1C258 8002C258 1280023C */  lui        $v0, %hi(autocompact)
    /* 1C25C 8002C25C B8C4428C */  lw         $v0, %lo(autocompact)($v0)
    /* 1C260 8002C260 00000000 */  nop
    /* 1C264 8002C264 45004010 */  beqz       $v0, .L8002C37C
    /* 1C268 8002C268 00000000 */   nop
    /* 1C26C 8002C26C 1800228E */  lw         $v0, 0x18($s1)
    /* 1C270 8002C270 00000000 */  nop
    /* 1C274 8002C274 10004230 */  andi       $v0, $v0, 0x10
    /* 1C278 8002C278 40004010 */  beqz       $v0, .L8002C37C
    /* 1C27C 8002C27C 00000000 */   nop
    /* 1C280 8002C280 0000048E */  lw         $a0, 0x0($s0)
    /* 1C284 8002C284 2000258E */  lw         $a1, 0x20($s1)
    /* 1C288 8002C288 5CAF000C */  jal        compactdowni
    /* 1C28C 8002C28C 00000000 */   nop
    /* 1C290 8002C290 09004010 */  beqz       $v0, .L8002C2B8
    /* 1C294 8002C294 21288002 */   addu      $a1, $s4, $zero
  .L8002C298:
    /* 1C298 8002C298 2000228E */  lw         $v0, 0x20($s1)
    /* 1C29C 8002C29C 0000248E */  lw         $a0, 0x0($s1)
    /* 1C2A0 8002C2A0 0000438C */  lw         $v1, 0x0($v0)
    /* 1C2A4 8002C2A4 0800028E */  lw         $v0, 0x8($s0)
    /* 1C2A8 8002C2A8 23186400 */  subu       $v1, $v1, $a0
    /* 1C2AC 8002C2AC 27100200 */  nor        $v0, $zero, $v0
    /* 1C2B0 8002C2B0 72B00008 */  j          .L8002C1C8
    /* 1C2B4 8002C2B4 24906200 */   and       $s2, $v1, $v0
  .L8002C2B8:
    /* 1C2B8 8002C2B8 1280043C */  lui        $a0, %hi(D_8011C4DC)
    /* 1C2BC 8002C2BC DCC48424 */  addiu      $a0, $a0, %lo(D_8011C4DC)
    /* 1C2C0 8002C2C0 2130C002 */  addu       $a2, $s6, $zero
    /* 1C2C4 8002C2C4 BAA9000C */  jal        reservememblockai
    /* 1C2C8 8002C2C8 21380000 */   addu      $a3, $zero, $zero
    /* 1C2CC 8002C2CC 21804000 */  addu       $s0, $v0, $zero
    /* 1C2D0 8002C2D0 2A000012 */  beqz       $s0, .L8002C37C
    /* 1C2D4 8002C2D4 00000000 */   nop
    /* 1C2D8 8002C2D8 0000248E */  lw         $a0, 0x0($s1)
    /* 1C2DC 8002C2DC 0000058E */  lw         $a1, 0x0($s0)
    /* 1C2E0 8002C2E0 1400268E */  lw         $a2, 0x14($s1)
    /* 1C2E4 8002C2E4 F1B1000C */  jal        blockmove
    /* 1C2E8 8002C2E8 00000000 */   nop
    /* 1C2EC 8002C2EC 2400238E */  lw         $v1, 0x24($s1)
    /* 1C2F0 8002C2F0 2000228E */  lw         $v0, 0x20($s1)
    /* 1C2F4 8002C2F4 00000000 */  nop
    /* 1C2F8 8002C2F8 200062AC */  sw         $v0, 0x20($v1)
    /* 1C2FC 8002C2FC 2000238E */  lw         $v1, 0x20($s1)
    /* 1C300 8002C300 2400228E */  lw         $v0, 0x24($s1)
    /* 1C304 8002C304 00000000 */  nop
    /* 1C308 8002C308 240062AC */  sw         $v0, 0x24($v1)
    /* 1C30C 8002C30C 2400028E */  lw         $v0, 0x24($s0)
    /* 1C310 8002C310 00000000 */  nop
    /* 1C314 8002C314 200051AC */  sw         $s1, 0x20($v0)
    /* 1C318 8002C318 2000028E */  lw         $v0, 0x20($s0)
    /* 1C31C 8002C31C 00000000 */  nop
    /* 1C320 8002C320 240051AC */  sw         $s1, 0x24($v0)
    /* 1C324 8002C324 0000028E */  lw         $v0, 0x0($s0)
    /* 1C328 8002C328 00000000 */  nop
    /* 1C32C 8002C32C 000022AE */  sw         $v0, 0x0($s1)
    /* 1C330 8002C330 2000028E */  lw         $v0, 0x20($s0)
    /* 1C334 8002C334 00000000 */  nop
    /* 1C338 8002C338 200022AE */  sw         $v0, 0x20($s1)
    /* 1C33C 8002C33C 2400028E */  lw         $v0, 0x24($s0)
    /* 1C340 8002C340 00000000 */  nop
    /* 1C344 8002C344 240022AE */  sw         $v0, 0x24($s1)
    /* 1C348 8002C348 1400028E */  lw         $v0, 0x14($s0)
    /* 1C34C 8002C34C 00000000 */  nop
    /* 1C350 8002C350 140022AE */  sw         $v0, 0x14($s1)
    /* 1C354 8002C354 1000028E */  lw         $v0, 0x10($s0)
    /* 1C358 8002C358 21200002 */  addu       $a0, $s0, $zero
    /* 1C35C 8002C35C C4AD000C */  jal        putmemblock
    /* 1C360 8002C360 100022AE */   sw        $v0, 0x10($s1)
  .L8002C364:
    /* 1C364 8002C364 1280043C */  lui        $a0, %hi(_lv)
    /* 1C368 8002C368 94CA848C */  lw         $a0, %lo(_lv)($a0)
    /* 1C36C 8002C36C F3BD000C */  jal        unlocksemaphore
    /* 1C370 8002C370 00000000 */   nop
    /* 1C374 8002C374 F4B00008 */  j          .L8002C3D0
    /* 1C378 8002C378 21108002 */   addu      $v0, $s4, $zero
  .L8002C37C:
    /* 1C37C 8002C37C 1280043C */  lui        $a0, %hi(_lv)
    /* 1C380 8002C380 94CA848C */  lw         $a0, %lo(_lv)($a0)
    /* 1C384 8002C384 F3BD000C */  jal        unlocksemaphore
    /* 1C388 8002C388 00000000 */   nop
    /* 1C38C 8002C38C 10008006 */  bltz       $s4, .L8002C3D0
    /* 1C390 8002C390 21104002 */   addu      $v0, $s2, $zero
    /* 1C394 8002C394 0D00E012 */  beqz       $s7, .L8002C3CC
    /* 1C398 8002C398 21286002 */   addu      $a1, $s3, $zero
    /* 1C39C 8002C39C 1180043C */  lui        $a0, %hi(D_8010FA40)
    /* 1C3A0 8002C3A0 40FA8424 */  addiu      $a0, $a0, %lo(D_8010FA40)
    /* 1C3A4 8002C3A4 21304002 */  addu       $a2, $s2, $zero
    /* 1C3A8 8002C3A8 1180023C */  lui        $v0, %hi(D_8010F95C)
    /* 1C3AC 8002C3AC 5CF94224 */  addiu      $v0, $v0, %lo(D_8010F95C)
    /* 1C3B0 8002C3B0 1280013C */  lui        $at, %hi(abortfile)
    /* 1C3B4 8002C3B4 B8C322AC */  sw         $v0, %lo(abortfile)($at)
    /* 1C3B8 8002C3B8 20010224 */  addiu      $v0, $zero, 0x120
  .L8002C3BC:
    /* 1C3BC 8002C3BC 1280013C */  lui        $at, %hi(abortline)
    /* 1C3C0 8002C3C0 BCC322AC */  sw         $v0, %lo(abortline)($at)
    /* 1C3C4 8002C3C4 0F95000C */  jal        abortmessage
    /* 1C3C8 8002C3C8 00000000 */   nop
  .L8002C3CC:
    /* 1C3CC 8002C3CC 21100000 */  addu       $v0, $zero, $zero
  .L8002C3D0:
    /* 1C3D0 8002C3D0 3000BF8F */  lw         $ra, 0x30($sp)
    /* 1C3D4 8002C3D4 2C00B78F */  lw         $s7, 0x2C($sp)
    /* 1C3D8 8002C3D8 2800B68F */  lw         $s6, 0x28($sp)
    /* 1C3DC 8002C3DC 2400B58F */  lw         $s5, 0x24($sp)
    /* 1C3E0 8002C3E0 2000B48F */  lw         $s4, 0x20($sp)
    /* 1C3E4 8002C3E4 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 1C3E8 8002C3E8 1800B28F */  lw         $s2, 0x18($sp)
    /* 1C3EC 8002C3EC 1400B18F */  lw         $s1, 0x14($sp)
    /* 1C3F0 8002C3F0 1000B08F */  lw         $s0, 0x10($sp)
    /* 1C3F4 8002C3F4 3800BD27 */  addiu      $sp, $sp, 0x38
    /* 1C3F8 8002C3F8 0800E003 */  jr         $ra
    /* 1C3FC 8002C3FC 00000000 */   nop
endlabel resizememblocka
