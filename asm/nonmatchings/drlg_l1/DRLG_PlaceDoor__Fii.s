.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DRLG_PlaceDoor__Fii, 0x4E0

glabel DRLG_PlaceDoor__Fii
    /* 20B8 8013BCB0 80100500 */  sll        $v0, $a1, 2
    /* 20BC 8013BCB4 21104500 */  addu       $v0, $v0, $a1
    /* 20C0 8013BCB8 C0100200 */  sll        $v0, $v0, 3
    /* 20C4 8013BCBC 1280033C */  lui        $v1, %hi(mydflags)
    /* 20C8 8013BCC0 D8C0638C */  lw         $v1, %lo(mydflags)($v1)
    /* 20CC 8013BCC4 21104400 */  addu       $v0, $v0, $a0
    /* 20D0 8013BCC8 21186200 */  addu       $v1, $v1, $v0
    /* 20D4 8013BCCC 00006390 */  lbu        $v1, 0x0($v1)
    /* 20D8 8013BCD0 00000000 */  nop
    /* 20DC 8013BCD4 80006230 */  andi       $v0, $v1, 0x80
    /* 20E0 8013BCD8 24014014 */  bnez       $v0, .L8013C16C
    /* 20E4 8013BCDC 80100500 */   sll       $v0, $a1, 2
    /* 20E8 8013BCE0 7F006830 */  andi       $t0, $v1, 0x7F
    /* 20EC 8013BCE4 0E80033C */  lui        $v1, %hi(dungeon)
    /* 20F0 8013BCE8 C4406324 */  addiu      $v1, $v1, %lo(dungeon)
    /* 20F4 8013BCEC 40100400 */  sll        $v0, $a0, 1
    /* 20F8 8013BCF0 21104400 */  addu       $v0, $v0, $a0
    /* 20FC 8013BCF4 40110200 */  sll        $v0, $v0, 5
    /* 2100 8013BCF8 21104300 */  addu       $v0, $v0, $v1
    /* 2104 8013BCFC 40180500 */  sll        $v1, $a1, 1
    /* 2108 8013BD00 21186200 */  addu       $v1, $v1, $v0
    /* 210C 8013BD04 00006790 */  lbu        $a3, 0x0($v1)
    /* 2110 8013BD08 FF000631 */  andi       $a2, $t0, 0xFF
    /* 2114 8013BD0C 01000224 */  addiu      $v0, $zero, 0x1
    /* 2118 8013BD10 4000C214 */  bne        $a2, $v0, .L8013BE14
    /* 211C 8013BD14 00000000 */   nop
    /* 2120 8013BD18 1600A610 */  beq        $a1, $a2, .L8013BD74
    /* 2124 8013BD1C FF00E630 */   andi      $a2, $a3, 0xFF
    /* 2128 8013BD20 02000224 */  addiu      $v0, $zero, 0x2
    /* 212C 8013BD24 0400C214 */  bne        $a2, $v0, .L8013BD38
    /* 2130 8013BD28 07000224 */   addiu     $v0, $zero, 0x7
    /* 2134 8013BD2C 1A000224 */  addiu      $v0, $zero, 0x1A
    /* 2138 8013BD30 000062A4 */  sh         $v0, 0x0($v1)
    /* 213C 8013BD34 07000224 */  addiu      $v0, $zero, 0x7
  .L8013BD38:
    /* 2140 8013BD38 0400C214 */  bne        $a2, $v0, .L8013BD4C
    /* 2144 8013BD3C 0E000224 */   addiu     $v0, $zero, 0xE
    /* 2148 8013BD40 1F000224 */  addiu      $v0, $zero, 0x1F
    /* 214C 8013BD44 000062A4 */  sh         $v0, 0x0($v1)
    /* 2150 8013BD48 0E000224 */  addiu      $v0, $zero, 0xE
  .L8013BD4C:
    /* 2154 8013BD4C 0400C214 */  bne        $a2, $v0, .L8013BD60
    /* 2158 8013BD50 04000224 */   addiu     $v0, $zero, 0x4
    /* 215C 8013BD54 2A000224 */  addiu      $v0, $zero, 0x2A
    /* 2160 8013BD58 000062A4 */  sh         $v0, 0x0($v1)
    /* 2164 8013BD5C 04000224 */  addiu      $v0, $zero, 0x4
  .L8013BD60:
    /* 2168 8013BD60 0400C214 */  bne        $a2, $v0, .L8013BD74
    /* 216C 8013BD64 01000224 */   addiu     $v0, $zero, 0x1
    /* 2170 8013BD68 2B000224 */  addiu      $v0, $zero, 0x2B
    /* 2174 8013BD6C 000062A4 */  sh         $v0, 0x0($v1)
    /* 2178 8013BD70 01000224 */  addiu      $v0, $zero, 0x1
  .L8013BD74:
    /* 217C 8013BD74 27008210 */  beq        $a0, $v0, .L8013BE14
    /* 2180 8013BD78 FF00E630 */   andi      $a2, $a3, 0xFF
    /* 2184 8013BD7C 0C00C214 */  bne        $a2, $v0, .L8013BDB0
    /* 2188 8013BD80 0A000224 */   addiu     $v0, $zero, 0xA
    /* 218C 8013BD84 0E80033C */  lui        $v1, %hi(dungeon)
    /* 2190 8013BD88 C4406324 */  addiu      $v1, $v1, %lo(dungeon)
    /* 2194 8013BD8C 40100400 */  sll        $v0, $a0, 1
    /* 2198 8013BD90 21104400 */  addu       $v0, $v0, $a0
    /* 219C 8013BD94 40110200 */  sll        $v0, $v0, 5
    /* 21A0 8013BD98 21104300 */  addu       $v0, $v0, $v1
    /* 21A4 8013BD9C 40180500 */  sll        $v1, $a1, 1
    /* 21A8 8013BDA0 21186200 */  addu       $v1, $v1, $v0
    /* 21AC 8013BDA4 19000224 */  addiu      $v0, $zero, 0x19
    /* 21B0 8013BDA8 000062A4 */  sh         $v0, 0x0($v1)
    /* 21B4 8013BDAC 0A000224 */  addiu      $v0, $zero, 0xA
  .L8013BDB0:
    /* 21B8 8013BDB0 0C00C214 */  bne        $a2, $v0, .L8013BDE4
    /* 21BC 8013BDB4 06000224 */   addiu     $v0, $zero, 0x6
    /* 21C0 8013BDB8 0E80033C */  lui        $v1, %hi(dungeon)
    /* 21C4 8013BDBC C4406324 */  addiu      $v1, $v1, %lo(dungeon)
    /* 21C8 8013BDC0 40100400 */  sll        $v0, $a0, 1
    /* 21CC 8013BDC4 21104400 */  addu       $v0, $v0, $a0
    /* 21D0 8013BDC8 40110200 */  sll        $v0, $v0, 5
    /* 21D4 8013BDCC 21104300 */  addu       $v0, $v0, $v1
    /* 21D8 8013BDD0 40180500 */  sll        $v1, $a1, 1
    /* 21DC 8013BDD4 21186200 */  addu       $v1, $v1, $v0
    /* 21E0 8013BDD8 28000224 */  addiu      $v0, $zero, 0x28
    /* 21E4 8013BDDC 000062A4 */  sh         $v0, 0x0($v1)
    /* 21E8 8013BDE0 06000224 */  addiu      $v0, $zero, 0x6
  .L8013BDE4:
    /* 21EC 8013BDE4 0C00C214 */  bne        $a2, $v0, .L8013BE18
    /* 21F0 8013BDE8 FF000331 */   andi      $v1, $t0, 0xFF
    /* 21F4 8013BDEC 0E80033C */  lui        $v1, %hi(dungeon)
    /* 21F8 8013BDF0 C4406324 */  addiu      $v1, $v1, %lo(dungeon)
    /* 21FC 8013BDF4 40100400 */  sll        $v0, $a0, 1
    /* 2200 8013BDF8 21104400 */  addu       $v0, $v0, $a0
    /* 2204 8013BDFC 40110200 */  sll        $v0, $v0, 5
    /* 2208 8013BE00 21104300 */  addu       $v0, $v0, $v1
    /* 220C 8013BE04 40180500 */  sll        $v1, $a1, 1
    /* 2210 8013BE08 21186200 */  addu       $v1, $v1, $v0
    /* 2214 8013BE0C 1E000224 */  addiu      $v0, $zero, 0x1E
    /* 2218 8013BE10 000062A4 */  sh         $v0, 0x0($v1)
  .L8013BE14:
    /* 221C 8013BE14 FF000331 */  andi       $v1, $t0, 0xFF
  .L8013BE18:
    /* 2220 8013BE18 02000224 */  addiu      $v0, $zero, 0x2
    /* 2224 8013BE1C 60006214 */  bne        $v1, $v0, .L8013BFA0
    /* 2228 8013BE20 01000224 */   addiu     $v0, $zero, 0x1
    /* 222C 8013BE24 35008210 */  beq        $a0, $v0, .L8013BEFC
    /* 2230 8013BE28 FF00E630 */   andi      $a2, $a3, 0xFF
    /* 2234 8013BE2C 0C00C214 */  bne        $a2, $v0, .L8013BE60
    /* 2238 8013BE30 06000224 */   addiu     $v0, $zero, 0x6
    /* 223C 8013BE34 0E80033C */  lui        $v1, %hi(dungeon)
    /* 2240 8013BE38 C4406324 */  addiu      $v1, $v1, %lo(dungeon)
    /* 2244 8013BE3C 40100400 */  sll        $v0, $a0, 1
    /* 2248 8013BE40 21104400 */  addu       $v0, $v0, $a0
    /* 224C 8013BE44 40110200 */  sll        $v0, $v0, 5
    /* 2250 8013BE48 21104300 */  addu       $v0, $v0, $v1
    /* 2254 8013BE4C 40180500 */  sll        $v1, $a1, 1
    /* 2258 8013BE50 21186200 */  addu       $v1, $v1, $v0
    /* 225C 8013BE54 19000224 */  addiu      $v0, $zero, 0x19
    /* 2260 8013BE58 000062A4 */  sh         $v0, 0x0($v1)
    /* 2264 8013BE5C 06000224 */  addiu      $v0, $zero, 0x6
  .L8013BE60:
    /* 2268 8013BE60 0C00C214 */  bne        $a2, $v0, .L8013BE94
    /* 226C 8013BE64 0A000224 */   addiu     $v0, $zero, 0xA
    /* 2270 8013BE68 0E80033C */  lui        $v1, %hi(dungeon)
    /* 2274 8013BE6C C4406324 */  addiu      $v1, $v1, %lo(dungeon)
    /* 2278 8013BE70 40100400 */  sll        $v0, $a0, 1
    /* 227C 8013BE74 21104400 */  addu       $v0, $v0, $a0
    /* 2280 8013BE78 40110200 */  sll        $v0, $v0, 5
    /* 2284 8013BE7C 21104300 */  addu       $v0, $v0, $v1
    /* 2288 8013BE80 40180500 */  sll        $v1, $a1, 1
    /* 228C 8013BE84 21186200 */  addu       $v1, $v1, $v0
    /* 2290 8013BE88 1E000224 */  addiu      $v0, $zero, 0x1E
    /* 2294 8013BE8C 000062A4 */  sh         $v0, 0x0($v1)
    /* 2298 8013BE90 0A000224 */  addiu      $v0, $zero, 0xA
  .L8013BE94:
    /* 229C 8013BE94 0C00C214 */  bne        $a2, $v0, .L8013BEC8
    /* 22A0 8013BE98 04000224 */   addiu     $v0, $zero, 0x4
    /* 22A4 8013BE9C 0E80033C */  lui        $v1, %hi(dungeon)
    /* 22A8 8013BEA0 C4406324 */  addiu      $v1, $v1, %lo(dungeon)
    /* 22AC 8013BEA4 40100400 */  sll        $v0, $a0, 1
    /* 22B0 8013BEA8 21104400 */  addu       $v0, $v0, $a0
    /* 22B4 8013BEAC 40110200 */  sll        $v0, $v0, 5
    /* 22B8 8013BEB0 21104300 */  addu       $v0, $v0, $v1
    /* 22BC 8013BEB4 40180500 */  sll        $v1, $a1, 1
    /* 22C0 8013BEB8 21186200 */  addu       $v1, $v1, $v0
    /* 22C4 8013BEBC 28000224 */  addiu      $v0, $zero, 0x28
    /* 22C8 8013BEC0 000062A4 */  sh         $v0, 0x0($v1)
    /* 22CC 8013BEC4 04000224 */  addiu      $v0, $zero, 0x4
  .L8013BEC8:
    /* 22D0 8013BEC8 0C00C214 */  bne        $a2, $v0, .L8013BEFC
    /* 22D4 8013BECC 01000224 */   addiu     $v0, $zero, 0x1
    /* 22D8 8013BED0 0E80033C */  lui        $v1, %hi(dungeon)
    /* 22DC 8013BED4 C4406324 */  addiu      $v1, $v1, %lo(dungeon)
    /* 22E0 8013BED8 40100400 */  sll        $v0, $a0, 1
    /* 22E4 8013BEDC 21104400 */  addu       $v0, $v0, $a0
    /* 22E8 8013BEE0 40110200 */  sll        $v0, $v0, 5
    /* 22EC 8013BEE4 21104300 */  addu       $v0, $v0, $v1
    /* 22F0 8013BEE8 40180500 */  sll        $v1, $a1, 1
    /* 22F4 8013BEEC 21186200 */  addu       $v1, $v1, $v0
    /* 22F8 8013BEF0 29000224 */  addiu      $v0, $zero, 0x29
    /* 22FC 8013BEF4 000062A4 */  sh         $v0, 0x0($v1)
    /* 2300 8013BEF8 01000224 */  addiu      $v0, $zero, 0x1
  .L8013BEFC:
    /* 2304 8013BEFC 2800A210 */  beq        $a1, $v0, .L8013BFA0
    /* 2308 8013BF00 FF00E630 */   andi      $a2, $a3, 0xFF
    /* 230C 8013BF04 02000224 */  addiu      $v0, $zero, 0x2
    /* 2310 8013BF08 0C00C214 */  bne        $a2, $v0, .L8013BF3C
    /* 2314 8013BF0C 0E000224 */   addiu     $v0, $zero, 0xE
    /* 2318 8013BF10 0E80033C */  lui        $v1, %hi(dungeon)
    /* 231C 8013BF14 C4406324 */  addiu      $v1, $v1, %lo(dungeon)
    /* 2320 8013BF18 40100400 */  sll        $v0, $a0, 1
    /* 2324 8013BF1C 21104400 */  addu       $v0, $v0, $a0
    /* 2328 8013BF20 40110200 */  sll        $v0, $v0, 5
    /* 232C 8013BF24 21104300 */  addu       $v0, $v0, $v1
    /* 2330 8013BF28 40180500 */  sll        $v1, $a1, 1
    /* 2334 8013BF2C 21186200 */  addu       $v1, $v1, $v0
    /* 2338 8013BF30 1A000224 */  addiu      $v0, $zero, 0x1A
    /* 233C 8013BF34 000062A4 */  sh         $v0, 0x0($v1)
    /* 2340 8013BF38 0E000224 */  addiu      $v0, $zero, 0xE
  .L8013BF3C:
    /* 2344 8013BF3C 0C00C214 */  bne        $a2, $v0, .L8013BF70
    /* 2348 8013BF40 07000224 */   addiu     $v0, $zero, 0x7
    /* 234C 8013BF44 0E80033C */  lui        $v1, %hi(dungeon)
    /* 2350 8013BF48 C4406324 */  addiu      $v1, $v1, %lo(dungeon)
    /* 2354 8013BF4C 40100400 */  sll        $v0, $a0, 1
    /* 2358 8013BF50 21104400 */  addu       $v0, $v0, $a0
    /* 235C 8013BF54 40110200 */  sll        $v0, $v0, 5
    /* 2360 8013BF58 21104300 */  addu       $v0, $v0, $v1
    /* 2364 8013BF5C 40180500 */  sll        $v1, $a1, 1
    /* 2368 8013BF60 21186200 */  addu       $v1, $v1, $v0
    /* 236C 8013BF64 2A000224 */  addiu      $v0, $zero, 0x2A
    /* 2370 8013BF68 000062A4 */  sh         $v0, 0x0($v1)
    /* 2374 8013BF6C 07000224 */  addiu      $v0, $zero, 0x7
  .L8013BF70:
    /* 2378 8013BF70 0C00C214 */  bne        $a2, $v0, .L8013BFA4
    /* 237C 8013BF74 FF000331 */   andi      $v1, $t0, 0xFF
    /* 2380 8013BF78 0E80033C */  lui        $v1, %hi(dungeon)
    /* 2384 8013BF7C C4406324 */  addiu      $v1, $v1, %lo(dungeon)
    /* 2388 8013BF80 40100400 */  sll        $v0, $a0, 1
    /* 238C 8013BF84 21104400 */  addu       $v0, $v0, $a0
    /* 2390 8013BF88 40110200 */  sll        $v0, $v0, 5
    /* 2394 8013BF8C 21104300 */  addu       $v0, $v0, $v1
    /* 2398 8013BF90 40180500 */  sll        $v1, $a1, 1
    /* 239C 8013BF94 21186200 */  addu       $v1, $v1, $v0
    /* 23A0 8013BF98 1F000224 */  addiu      $v0, $zero, 0x1F
    /* 23A4 8013BF9C 000062A4 */  sh         $v0, 0x0($v1)
  .L8013BFA0:
    /* 23A8 8013BFA0 FF000331 */  andi       $v1, $t0, 0xFF
  .L8013BFA4:
    /* 23AC 8013BFA4 03000224 */  addiu      $v0, $zero, 0x3
    /* 23B0 8013BFA8 70006214 */  bne        $v1, $v0, .L8013C16C
    /* 23B4 8013BFAC 80100500 */   sll       $v0, $a1, 2
    /* 23B8 8013BFB0 01000224 */  addiu      $v0, $zero, 0x1
    /* 23BC 8013BFB4 21008210 */  beq        $a0, $v0, .L8013C03C
    /* 23C0 8013BFB8 00000000 */   nop
    /* 23C4 8013BFBC 0F00A210 */  beq        $a1, $v0, .L8013BFFC
    /* 23C8 8013BFC0 FF00E330 */   andi      $v1, $a3, 0xFF
    /* 23CC 8013BFC4 04000224 */  addiu      $v0, $zero, 0x4
    /* 23D0 8013BFC8 0C006214 */  bne        $v1, $v0, .L8013BFFC
    /* 23D4 8013BFCC 01000224 */   addiu     $v0, $zero, 0x1
    /* 23D8 8013BFD0 0E80033C */  lui        $v1, %hi(dungeon)
    /* 23DC 8013BFD4 C4406324 */  addiu      $v1, $v1, %lo(dungeon)
    /* 23E0 8013BFD8 40100400 */  sll        $v0, $a0, 1
    /* 23E4 8013BFDC 21104400 */  addu       $v0, $v0, $a0
    /* 23E8 8013BFE0 40110200 */  sll        $v0, $v0, 5
    /* 23EC 8013BFE4 21104300 */  addu       $v0, $v0, $v1
    /* 23F0 8013BFE8 40180500 */  sll        $v1, $a1, 1
    /* 23F4 8013BFEC 21186200 */  addu       $v1, $v1, $v0
    /* 23F8 8013BFF0 1C000224 */  addiu      $v0, $zero, 0x1C
    /* 23FC 8013BFF4 000062A4 */  sh         $v0, 0x0($v1)
    /* 2400 8013BFF8 01000224 */  addiu      $v0, $zero, 0x1
  .L8013BFFC:
    /* 2404 8013BFFC 0E008210 */  beq        $a0, $v0, .L8013C038
    /* 2408 8013C000 FF00E330 */   andi      $v1, $a3, 0xFF
    /* 240C 8013C004 0A000224 */  addiu      $v0, $zero, 0xA
    /* 2410 8013C008 0C006214 */  bne        $v1, $v0, .L8013C03C
    /* 2414 8013C00C 01000224 */   addiu     $v0, $zero, 0x1
    /* 2418 8013C010 0E80033C */  lui        $v1, %hi(dungeon)
    /* 241C 8013C014 C4406324 */  addiu      $v1, $v1, %lo(dungeon)
    /* 2420 8013C018 40100400 */  sll        $v0, $a0, 1
    /* 2424 8013C01C 21104400 */  addu       $v0, $v0, $a0
    /* 2428 8013C020 40110200 */  sll        $v0, $v0, 5
    /* 242C 8013C024 21104300 */  addu       $v0, $v0, $v1
    /* 2430 8013C028 40180500 */  sll        $v1, $a1, 1
    /* 2434 8013C02C 21186200 */  addu       $v1, $v1, $v0
    /* 2438 8013C030 28000224 */  addiu      $v0, $zero, 0x28
    /* 243C 8013C034 000062A4 */  sh         $v0, 0x0($v1)
  .L8013C038:
    /* 2440 8013C038 01000224 */  addiu      $v0, $zero, 0x1
  .L8013C03C:
    /* 2444 8013C03C 1B00A210 */  beq        $a1, $v0, .L8013C0AC
    /* 2448 8013C040 FF00E630 */   andi      $a2, $a3, 0xFF
    /* 244C 8013C044 0E000224 */  addiu      $v0, $zero, 0xE
    /* 2450 8013C048 0C00C214 */  bne        $a2, $v0, .L8013C07C
    /* 2454 8013C04C 02000224 */   addiu     $v0, $zero, 0x2
    /* 2458 8013C050 0E80033C */  lui        $v1, %hi(dungeon)
    /* 245C 8013C054 C4406324 */  addiu      $v1, $v1, %lo(dungeon)
    /* 2460 8013C058 40100400 */  sll        $v0, $a0, 1
    /* 2464 8013C05C 21104400 */  addu       $v0, $v0, $a0
    /* 2468 8013C060 40110200 */  sll        $v0, $v0, 5
    /* 246C 8013C064 21104300 */  addu       $v0, $v0, $v1
    /* 2470 8013C068 40180500 */  sll        $v1, $a1, 1
    /* 2474 8013C06C 21186200 */  addu       $v1, $v1, $v0
    /* 2478 8013C070 2A000224 */  addiu      $v0, $zero, 0x2A
    /* 247C 8013C074 000062A4 */  sh         $v0, 0x0($v1)
    /* 2480 8013C078 02000224 */  addiu      $v0, $zero, 0x2
  .L8013C07C:
    /* 2484 8013C07C 0C00C214 */  bne        $a2, $v0, .L8013C0B0
    /* 2488 8013C080 01000224 */   addiu     $v0, $zero, 0x1
    /* 248C 8013C084 0E80033C */  lui        $v1, %hi(dungeon)
    /* 2490 8013C088 C4406324 */  addiu      $v1, $v1, %lo(dungeon)
    /* 2494 8013C08C 40100400 */  sll        $v0, $a0, 1
    /* 2498 8013C090 21104400 */  addu       $v0, $v0, $a0
    /* 249C 8013C094 40110200 */  sll        $v0, $v0, 5
    /* 24A0 8013C098 21104300 */  addu       $v0, $v0, $v1
    /* 24A4 8013C09C 40180500 */  sll        $v1, $a1, 1
    /* 24A8 8013C0A0 21186200 */  addu       $v1, $v1, $v0
    /* 24AC 8013C0A4 1A000224 */  addiu      $v0, $zero, 0x1A
    /* 24B0 8013C0A8 000062A4 */  sh         $v0, 0x0($v1)
  .L8013C0AC:
    /* 24B4 8013C0AC 01000224 */  addiu      $v0, $zero, 0x1
  .L8013C0B0:
    /* 24B8 8013C0B0 0D008210 */  beq        $a0, $v0, .L8013C0E8
    /* 24BC 8013C0B4 00000000 */   nop
    /* 24C0 8013C0B8 0C00E214 */  bne        $a3, $v0, .L8013C0EC
    /* 24C4 8013C0BC 01000224 */   addiu     $v0, $zero, 0x1
    /* 24C8 8013C0C0 0E80033C */  lui        $v1, %hi(dungeon)
    /* 24CC 8013C0C4 C4406324 */  addiu      $v1, $v1, %lo(dungeon)
    /* 24D0 8013C0C8 40100400 */  sll        $v0, $a0, 1
    /* 24D4 8013C0CC 21104400 */  addu       $v0, $v0, $a0
    /* 24D8 8013C0D0 40110200 */  sll        $v0, $v0, 5
    /* 24DC 8013C0D4 21104300 */  addu       $v0, $v0, $v1
    /* 24E0 8013C0D8 40180500 */  sll        $v1, $a1, 1
    /* 24E4 8013C0DC 21186200 */  addu       $v1, $v1, $v0
    /* 24E8 8013C0E0 19000224 */  addiu      $v0, $zero, 0x19
    /* 24EC 8013C0E4 000062A4 */  sh         $v0, 0x0($v1)
  .L8013C0E8:
    /* 24F0 8013C0E8 01000224 */  addiu      $v0, $zero, 0x1
  .L8013C0EC:
    /* 24F4 8013C0EC 0E00A210 */  beq        $a1, $v0, .L8013C128
    /* 24F8 8013C0F0 FF00E330 */   andi      $v1, $a3, 0xFF
    /* 24FC 8013C0F4 07000224 */  addiu      $v0, $zero, 0x7
    /* 2500 8013C0F8 0C006214 */  bne        $v1, $v0, .L8013C12C
    /* 2504 8013C0FC 01000224 */   addiu     $v0, $zero, 0x1
    /* 2508 8013C100 0E80033C */  lui        $v1, %hi(dungeon)
    /* 250C 8013C104 C4406324 */  addiu      $v1, $v1, %lo(dungeon)
    /* 2510 8013C108 40100400 */  sll        $v0, $a0, 1
    /* 2514 8013C10C 21104400 */  addu       $v0, $v0, $a0
    /* 2518 8013C110 40110200 */  sll        $v0, $v0, 5
    /* 251C 8013C114 21104300 */  addu       $v0, $v0, $v1
    /* 2520 8013C118 40180500 */  sll        $v1, $a1, 1
    /* 2524 8013C11C 21186200 */  addu       $v1, $v1, $v0
    /* 2528 8013C120 1F000224 */  addiu      $v0, $zero, 0x1F
    /* 252C 8013C124 000062A4 */  sh         $v0, 0x0($v1)
  .L8013C128:
    /* 2530 8013C128 01000224 */  addiu      $v0, $zero, 0x1
  .L8013C12C:
    /* 2534 8013C12C 0E008210 */  beq        $a0, $v0, .L8013C168
    /* 2538 8013C130 FF00E330 */   andi      $v1, $a3, 0xFF
    /* 253C 8013C134 06000224 */  addiu      $v0, $zero, 0x6
    /* 2540 8013C138 0C006214 */  bne        $v1, $v0, .L8013C16C
    /* 2544 8013C13C 80100500 */   sll       $v0, $a1, 2
    /* 2548 8013C140 0E80033C */  lui        $v1, %hi(dungeon)
    /* 254C 8013C144 C4406324 */  addiu      $v1, $v1, %lo(dungeon)
    /* 2550 8013C148 40100400 */  sll        $v0, $a0, 1
    /* 2554 8013C14C 21104400 */  addu       $v0, $v0, $a0
    /* 2558 8013C150 40110200 */  sll        $v0, $v0, 5
    /* 255C 8013C154 21104300 */  addu       $v0, $v0, $v1
    /* 2560 8013C158 40180500 */  sll        $v1, $a1, 1
    /* 2564 8013C15C 21186200 */  addu       $v1, $v1, $v0
    /* 2568 8013C160 1E000224 */  addiu      $v0, $zero, 0x1E
    /* 256C 8013C164 000062A4 */  sh         $v0, 0x0($v1)
  .L8013C168:
    /* 2570 8013C168 80100500 */  sll        $v0, $a1, 2
  .L8013C16C:
    /* 2574 8013C16C 21104500 */  addu       $v0, $v0, $a1
    /* 2578 8013C170 C0100200 */  sll        $v0, $v0, 3
    /* 257C 8013C174 1280033C */  lui        $v1, %hi(mydflags)
    /* 2580 8013C178 D8C0638C */  lw         $v1, %lo(mydflags)($v1)
    /* 2584 8013C17C 21104400 */  addu       $v0, $v0, $a0
    /* 2588 8013C180 21186200 */  addu       $v1, $v1, $v0
    /* 258C 8013C184 80000224 */  addiu      $v0, $zero, 0x80
    /* 2590 8013C188 0800E003 */  jr         $ra
    /* 2594 8013C18C 000062A0 */   sb        $v0, 0x0($v1)
endlabel DRLG_PlaceDoor__Fii
