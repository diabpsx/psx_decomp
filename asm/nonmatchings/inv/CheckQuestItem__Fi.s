.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CheckQuestItem__Fi, 0x4B0

glabel CheckQuestItem__Fi
    /* 240D8 8015DCD0 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 240DC 8015DCD4 1000B0AF */  sw         $s0, 0x10($sp)
    /* 240E0 8015DCD8 21808000 */  addu       $s0, $a0, $zero
    /* 240E4 8015DCDC 40101000 */  sll        $v0, $s0, 1
    /* 240E8 8015DCE0 21105000 */  addu       $v0, $v0, $s0
    /* 240EC 8015DCE4 80100200 */  sll        $v0, $v0, 2
    /* 240F0 8015DCE8 21105000 */  addu       $v0, $v0, $s0
    /* 240F4 8015DCEC 00110200 */  sll        $v0, $v0, 4
    /* 240F8 8015DCF0 23105000 */  subu       $v0, $v0, $s0
    /* 240FC 8015DCF4 80100200 */  sll        $v0, $v0, 2
    /* 24100 8015DCF8 21105000 */  addu       $v0, $v0, $s0
    /* 24104 8015DCFC C0200200 */  sll        $a0, $v0, 3
    /* 24108 8015DD00 1400BFAF */  sw         $ra, 0x14($sp)
    /* 2410C 8015DD04 0E80013C */  lui        $at, %hi(plr + 0x193E)
    /* 24110 8015DD08 21082400 */  addu       $at, $at, $a0
    /* 24114 8015DD0C 76BE2284 */  lh         $v0, %lo(plr + 0x193E)($at)
    /* 24118 8015DD10 0A000624 */  addiu      $a2, $zero, 0xA
    /* 2411C 8015DD14 06004614 */  bne        $v0, $a2, .L8015DD30
    /* 24120 8015DD18 03000224 */   addiu     $v0, $zero, 0x3
    /* 24124 8015DD1C 0E80013C */  lui        $at, %hi(quests + 0xA2)
    /* 24128 8015DD20 E2DA22A0 */  sb         $v0, %lo(quests + 0xA2)($at)
    /* 2412C 8015DD24 01000224 */  addiu      $v0, $zero, 0x1
    /* 24130 8015DD28 0E80013C */  lui        $at, %hi(quests + 0xB2)
    /* 24134 8015DD2C F2DA22A0 */  sb         $v0, %lo(quests + 0xB2)($at)
  .L8015DD30:
    /* 24138 8015DD30 0E80013C */  lui        $at, %hi(plr + 0x193E)
    /* 2413C 8015DD34 21082400 */  addu       $at, $at, $a0
    /* 24140 8015DD38 76BE2384 */  lh         $v1, %lo(plr + 0x193E)($at)
    /* 24144 8015DD3C 11000224 */  addiu      $v0, $zero, 0x11
    /* 24148 8015DD40 26006214 */  bne        $v1, $v0, .L8015DDDC
    /* 2414C 8015DD44 40101000 */   sll       $v0, $s0, 1
    /* 24150 8015DD48 0E80053C */  lui        $a1, %hi(quests + 0x16)
    /* 24154 8015DD4C 56DAA590 */  lbu        $a1, %lo(quests + 0x16)($a1)
    /* 24158 8015DD50 01000224 */  addiu      $v0, $zero, 0x1
    /* 2415C 8015DD54 0E80013C */  lui        $at, %hi(quests + 0x26)
    /* 24160 8015DD58 66DA22A0 */  sb         $v0, %lo(quests + 0x26)($at)
    /* 24164 8015DD5C 02000224 */  addiu      $v0, $zero, 0x2
    /* 24168 8015DD60 1A00A214 */  bne        $a1, $v0, .L8015DDCC
    /* 2416C 8015DD64 03000224 */   addiu     $v0, $zero, 0x3
    /* 24170 8015DD68 0E80033C */  lui        $v1, %hi(quests + 0x23)
    /* 24174 8015DD6C 63DA6390 */  lbu        $v1, %lo(quests + 0x23)($v1)
    /* 24178 8015DD70 00000000 */  nop
    /* 2417C 8015DD74 15006214 */  bne        $v1, $v0, .L8015DDCC
    /* 24180 8015DD78 00000000 */   nop
    /* 24184 8015DD7C 1280013C */  lui        $at, %hi(sfxdelay)
    /* 24188 8015DD80 50B826AC */  sw         $a2, %lo(sfxdelay)($at)
    /* 2418C 8015DD84 0E80013C */  lui        $at, %hi(plr + 0xF6)
    /* 24190 8015DD88 21082400 */  addu       $at, $at, $a0
    /* 24194 8015DD8C 2EA62380 */  lb         $v1, %lo(plr + 0xF6)($at)
    /* 24198 8015DD90 00000000 */  nop
    /* 2419C 8015DD94 03006014 */  bnez       $v1, .L8015DDA4
    /* 241A0 8015DD98 01000224 */   addiu     $v0, $zero, 0x1
    /* 241A4 8015DD9C 6E770508 */  j          .L8015DDB8
    /* 241A8 8015DDA0 31030224 */   addiu     $v0, $zero, 0x331
  .L8015DDA4:
    /* 241AC 8015DDA4 04006210 */  beq        $v1, $v0, .L8015DDB8
    /* 241B0 8015DDA8 C3020224 */   addiu     $v0, $zero, 0x2C3
    /* 241B4 8015DDAC 05006514 */  bne        $v1, $a1, .L8015DDC4
    /* 241B8 8015DDB0 04000224 */   addiu     $v0, $zero, 0x4
    /* 241BC 8015DDB4 5B020224 */  addiu      $v0, $zero, 0x25B
  .L8015DDB8:
    /* 241C0 8015DDB8 1280013C */  lui        $at, %hi(sfxdnum)
    /* 241C4 8015DDBC 54B822AC */  sw         $v0, %lo(sfxdnum)($at)
    /* 241C8 8015DDC0 04000224 */  addiu      $v0, $zero, 0x4
  .L8015DDC4:
    /* 241CC 8015DDC4 0E80013C */  lui        $at, %hi(quests + 0x23)
    /* 241D0 8015DDC8 63DA22A0 */  sb         $v0, %lo(quests + 0x23)($at)
  .L8015DDCC:
    /* 241D4 8015DDCC 01000424 */  addiu      $a0, $zero, 0x1
    /* 241D8 8015DDD0 323E010C */  jal        NetSendCmdQuest__FUcUc
    /* 241DC 8015DDD4 01000524 */   addiu     $a1, $zero, 0x1
    /* 241E0 8015DDD8 40101000 */  sll        $v0, $s0, 1
  .L8015DDDC:
    /* 241E4 8015DDDC 21105000 */  addu       $v0, $v0, $s0
    /* 241E8 8015DDE0 80100200 */  sll        $v0, $v0, 2
    /* 241EC 8015DDE4 21105000 */  addu       $v0, $v0, $s0
    /* 241F0 8015DDE8 00110200 */  sll        $v0, $v0, 4
    /* 241F4 8015DDEC 23105000 */  subu       $v0, $v0, $s0
    /* 241F8 8015DDF0 80100200 */  sll        $v0, $v0, 2
    /* 241FC 8015DDF4 21105000 */  addu       $v0, $v0, $s0
    /* 24200 8015DDF8 C0100200 */  sll        $v0, $v0, 3
    /* 24204 8015DDFC 0E80013C */  lui        $at, %hi(plr + 0x193E)
    /* 24208 8015DE00 21082200 */  addu       $at, $at, $v0
    /* 2420C 8015DE04 76BE2384 */  lh         $v1, %lo(plr + 0x193E)($at)
    /* 24210 8015DE08 10000224 */  addiu      $v0, $zero, 0x10
    /* 24214 8015DE0C 32006214 */  bne        $v1, $v0, .L8015DED8
    /* 24218 8015DE10 40101000 */   sll       $v0, $s0, 1
    /* 2421C 8015DE14 01000424 */  addiu      $a0, $zero, 0x1
    /* 24220 8015DE18 0E80023C */  lui        $v0, %hi(quests + 0xCA)
    /* 24224 8015DE1C 0ADB4290 */  lbu        $v0, %lo(quests + 0xCA)($v0)
    /* 24228 8015DE20 01000324 */  addiu      $v1, $zero, 0x1
    /* 2422C 8015DE24 0E80013C */  lui        $at, %hi(quests + 0xDA)
    /* 24230 8015DE28 1ADB24A0 */  sb         $a0, %lo(quests + 0xDA)($at)
    /* 24234 8015DE2C 05004314 */  bne        $v0, $v1, .L8015DE44
    /* 24238 8015DE30 02000224 */   addiu     $v0, $zero, 0x2
    /* 2423C 8015DE34 0E80013C */  lui        $at, %hi(quests + 0xCA)
    /* 24240 8015DE38 0ADB22A0 */  sb         $v0, %lo(quests + 0xCA)($at)
    /* 24244 8015DE3C 0E80013C */  lui        $at, %hi(quests + 0xD7)
    /* 24248 8015DE40 17DB24A0 */  sb         $a0, %lo(quests + 0xD7)($at)
  .L8015DE44:
    /* 2424C 8015DE44 0E80043C */  lui        $a0, %hi(quests + 0xD9)
    /* 24250 8015DE48 19DB8490 */  lbu        $a0, %lo(quests + 0xD9)($a0)
    /* 24254 8015DE4C 00000000 */  nop
    /* 24258 8015DE50 1D008314 */  bne        $a0, $v1, .L8015DEC8
    /* 2425C 8015DE54 0A000224 */   addiu     $v0, $zero, 0xA
    /* 24260 8015DE58 1280033C */  lui        $v1, %hi(myplr)
    /* 24264 8015DE5C 08BA638C */  lw         $v1, %lo(myplr)($v1)
    /* 24268 8015DE60 1280013C */  lui        $at, %hi(sfxdelay)
    /* 2426C 8015DE64 50B822AC */  sw         $v0, %lo(sfxdelay)($at)
    /* 24270 8015DE68 40100300 */  sll        $v0, $v1, 1
    /* 24274 8015DE6C 21104300 */  addu       $v0, $v0, $v1
    /* 24278 8015DE70 80100200 */  sll        $v0, $v0, 2
    /* 2427C 8015DE74 21104300 */  addu       $v0, $v0, $v1
    /* 24280 8015DE78 00110200 */  sll        $v0, $v0, 4
    /* 24284 8015DE7C 23104300 */  subu       $v0, $v0, $v1
    /* 24288 8015DE80 80100200 */  sll        $v0, $v0, 2
    /* 2428C 8015DE84 21104300 */  addu       $v0, $v0, $v1
    /* 24290 8015DE88 C0100200 */  sll        $v0, $v0, 3
    /* 24294 8015DE8C 0E80013C */  lui        $at, %hi(plr + 0xF6)
    /* 24298 8015DE90 21082200 */  addu       $at, $at, $v0
    /* 2429C 8015DE94 2EA62380 */  lb         $v1, %lo(plr + 0xF6)($at)
    /* 242A0 8015DE98 00000000 */  nop
    /* 242A4 8015DE9C 08006010 */  beqz       $v1, .L8015DEC0
    /* 242A8 8015DEA0 2B030224 */   addiu     $v0, $zero, 0x32B
    /* 242AC 8015DEA4 03006414 */  bne        $v1, $a0, .L8015DEB4
    /* 242B0 8015DEA8 02000224 */   addiu     $v0, $zero, 0x2
    /* 242B4 8015DEAC B0770508 */  j          .L8015DEC0
    /* 242B8 8015DEB0 BD020224 */   addiu     $v0, $zero, 0x2BD
  .L8015DEB4:
    /* 242BC 8015DEB4 05006214 */  bne        $v1, $v0, .L8015DECC
    /* 242C0 8015DEB8 01000424 */   addiu     $a0, $zero, 0x1
    /* 242C4 8015DEBC 55020224 */  addiu      $v0, $zero, 0x255
  .L8015DEC0:
    /* 242C8 8015DEC0 1280013C */  lui        $at, %hi(sfxdnum)
    /* 242CC 8015DEC4 54B822AC */  sw         $v0, %lo(sfxdnum)($at)
  .L8015DEC8:
    /* 242D0 8015DEC8 01000424 */  addiu      $a0, $zero, 0x1
  .L8015DECC:
    /* 242D4 8015DECC 323E010C */  jal        NetSendCmdQuest__FUcUc
    /* 242D8 8015DED0 0A000524 */   addiu     $a1, $zero, 0xA
    /* 242DC 8015DED4 40101000 */  sll        $v0, $s0, 1
  .L8015DED8:
    /* 242E0 8015DED8 21105000 */  addu       $v0, $v0, $s0
    /* 242E4 8015DEDC 80100200 */  sll        $v0, $v0, 2
    /* 242E8 8015DEE0 21105000 */  addu       $v0, $v0, $s0
    /* 242EC 8015DEE4 00110200 */  sll        $v0, $v0, 4
    /* 242F0 8015DEE8 23105000 */  subu       $v0, $v0, $s0
    /* 242F4 8015DEEC 80100200 */  sll        $v0, $v0, 2
    /* 242F8 8015DEF0 21105000 */  addu       $v0, $v0, $s0
    /* 242FC 8015DEF4 C0100200 */  sll        $v0, $v0, 3
    /* 24300 8015DEF8 0E80013C */  lui        $at, %hi(plr + 0x193E)
    /* 24304 8015DEFC 21082200 */  addu       $at, $at, $v0
    /* 24308 8015DF00 76BE2384 */  lh         $v1, %lo(plr + 0x193E)($at)
    /* 2430C 8015DF04 0F000224 */  addiu      $v0, $zero, 0xF
    /* 24310 8015DF08 25006214 */  bne        $v1, $v0, .L8015DFA0
    /* 24314 8015DF0C 40101000 */   sll       $v0, $s0, 1
    /* 24318 8015DF10 0E80033C */  lui        $v1, %hi(quests + 0x52)
    /* 2431C 8015DF14 92DA6390 */  lbu        $v1, %lo(quests + 0x52)($v1)
    /* 24320 8015DF18 03000224 */  addiu      $v0, $zero, 0x3
    /* 24324 8015DF1C 1F006210 */  beq        $v1, $v0, .L8015DF9C
    /* 24328 8015DF20 1E000224 */   addiu     $v0, $zero, 0x1E
    /* 2432C 8015DF24 1280033C */  lui        $v1, %hi(myplr)
    /* 24330 8015DF28 08BA638C */  lw         $v1, %lo(myplr)($v1)
    /* 24334 8015DF2C 1280013C */  lui        $at, %hi(sfxdelay)
    /* 24338 8015DF30 50B822AC */  sw         $v0, %lo(sfxdelay)($at)
    /* 2433C 8015DF34 40100300 */  sll        $v0, $v1, 1
    /* 24340 8015DF38 21104300 */  addu       $v0, $v0, $v1
    /* 24344 8015DF3C 80100200 */  sll        $v0, $v0, 2
    /* 24348 8015DF40 21104300 */  addu       $v0, $v0, $v1
    /* 2434C 8015DF44 00110200 */  sll        $v0, $v0, 4
    /* 24350 8015DF48 23104300 */  subu       $v0, $v0, $v1
    /* 24354 8015DF4C 80100200 */  sll        $v0, $v0, 2
    /* 24358 8015DF50 21104300 */  addu       $v0, $v0, $v1
    /* 2435C 8015DF54 C0100200 */  sll        $v0, $v0, 3
    /* 24360 8015DF58 0E80013C */  lui        $at, %hi(plr + 0xF6)
    /* 24364 8015DF5C 21082200 */  addu       $at, $at, $v0
    /* 24368 8015DF60 2EA62380 */  lb         $v1, %lo(plr + 0xF6)($at)
    /* 2436C 8015DF64 00000000 */  nop
    /* 24370 8015DF68 03006014 */  bnez       $v1, .L8015DF78
    /* 24374 8015DF6C 01000224 */   addiu     $v0, $zero, 0x1
    /* 24378 8015DF70 E5770508 */  j          .L8015DF94
    /* 2437C 8015DF74 2A030224 */   addiu     $v0, $zero, 0x32A
  .L8015DF78:
    /* 24380 8015DF78 03006214 */  bne        $v1, $v0, .L8015DF88
    /* 24384 8015DF7C 02000224 */   addiu     $v0, $zero, 0x2
    /* 24388 8015DF80 E5770508 */  j          .L8015DF94
    /* 2438C 8015DF84 BC020224 */   addiu     $v0, $zero, 0x2BC
  .L8015DF88:
    /* 24390 8015DF88 05006214 */  bne        $v1, $v0, .L8015DFA0
    /* 24394 8015DF8C 40101000 */   sll       $v0, $s0, 1
    /* 24398 8015DF90 54020224 */  addiu      $v0, $zero, 0x254
  .L8015DF94:
    /* 2439C 8015DF94 1280013C */  lui        $at, %hi(sfxdnum)
    /* 243A0 8015DF98 54B822AC */  sw         $v0, %lo(sfxdnum)($at)
  .L8015DF9C:
    /* 243A4 8015DF9C 40101000 */  sll        $v0, $s0, 1
  .L8015DFA0:
    /* 243A8 8015DFA0 21105000 */  addu       $v0, $v0, $s0
    /* 243AC 8015DFA4 80100200 */  sll        $v0, $v0, 2
    /* 243B0 8015DFA8 21105000 */  addu       $v0, $v0, $s0
    /* 243B4 8015DFAC 00110200 */  sll        $v0, $v0, 4
    /* 243B8 8015DFB0 23105000 */  subu       $v0, $v0, $s0
    /* 243BC 8015DFB4 80100200 */  sll        $v0, $v0, 2
    /* 243C0 8015DFB8 21105000 */  addu       $v0, $v0, $s0
    /* 243C4 8015DFBC C0100200 */  sll        $v0, $v0, 3
    /* 243C8 8015DFC0 0E80013C */  lui        $at, %hi(plr + 0x193E)
    /* 243CC 8015DFC4 21082200 */  addu       $at, $at, $v0
    /* 243D0 8015DFC8 76BE2384 */  lh         $v1, %lo(plr + 0x193E)($at)
    /* 243D4 8015DFCC 09000224 */  addiu      $v0, $zero, 0x9
    /* 243D8 8015DFD0 32006214 */  bne        $v1, $v0, .L8015E09C
    /* 243DC 8015DFD4 40101000 */   sll       $v0, $s0, 1
    /* 243E0 8015DFD8 01000224 */  addiu      $v0, $zero, 0x1
    /* 243E4 8015DFDC 0E80013C */  lui        $at, %hi(quests + 0x12)
    /* 243E8 8015DFE0 52DA22A0 */  sb         $v0, %lo(quests + 0x12)($at)
    /* 243EC 8015DFE4 0E80023C */  lui        $v0, %hi(quests + 0x2)
    /* 243F0 8015DFE8 42DA4290 */  lbu        $v0, %lo(quests + 0x2)($v0)
    /* 243F4 8015DFEC 01000324 */  addiu      $v1, $zero, 0x1
    /* 243F8 8015DFF0 05004314 */  bne        $v0, $v1, .L8015E008
    /* 243FC 8015DFF4 02000224 */   addiu     $v0, $zero, 0x2
    /* 24400 8015DFF8 0E80013C */  lui        $at, %hi(quests + 0x2)
    /* 24404 8015DFFC 42DA22A0 */  sb         $v0, %lo(quests + 0x2)($at)
    /* 24408 8015E000 0E80013C */  lui        $at, %hi(quests + 0xF)
    /* 2440C 8015E004 4FDA22A0 */  sb         $v0, %lo(quests + 0xF)($at)
  .L8015E008:
    /* 24410 8015E008 0E80043C */  lui        $a0, %hi(quests + 0x11)
    /* 24414 8015E00C 51DA8490 */  lbu        $a0, %lo(quests + 0x11)($a0)
    /* 24418 8015E010 00000000 */  nop
    /* 2441C 8015E014 1D008314 */  bne        $a0, $v1, .L8015E08C
    /* 24420 8015E018 0A000224 */   addiu     $v0, $zero, 0xA
    /* 24424 8015E01C 1280033C */  lui        $v1, %hi(myplr)
    /* 24428 8015E020 08BA638C */  lw         $v1, %lo(myplr)($v1)
    /* 2442C 8015E024 1280013C */  lui        $at, %hi(sfxdelay)
    /* 24430 8015E028 50B822AC */  sw         $v0, %lo(sfxdelay)($at)
    /* 24434 8015E02C 40100300 */  sll        $v0, $v1, 1
    /* 24438 8015E030 21104300 */  addu       $v0, $v0, $v1
    /* 2443C 8015E034 80100200 */  sll        $v0, $v0, 2
    /* 24440 8015E038 21104300 */  addu       $v0, $v0, $v1
    /* 24444 8015E03C 00110200 */  sll        $v0, $v0, 4
    /* 24448 8015E040 23104300 */  subu       $v0, $v0, $v1
    /* 2444C 8015E044 80100200 */  sll        $v0, $v0, 2
    /* 24450 8015E048 21104300 */  addu       $v0, $v0, $v1
    /* 24454 8015E04C C0100200 */  sll        $v0, $v0, 3
    /* 24458 8015E050 0E80013C */  lui        $at, %hi(plr + 0xF6)
    /* 2445C 8015E054 21082200 */  addu       $at, $at, $v0
    /* 24460 8015E058 2EA62380 */  lb         $v1, %lo(plr + 0xF6)($at)
    /* 24464 8015E05C 00000000 */  nop
    /* 24468 8015E060 08006010 */  beqz       $v1, .L8015E084
    /* 2446C 8015E064 29030224 */   addiu     $v0, $zero, 0x329
    /* 24470 8015E068 03006414 */  bne        $v1, $a0, .L8015E078
    /* 24474 8015E06C 02000224 */   addiu     $v0, $zero, 0x2
    /* 24478 8015E070 21780508 */  j          .L8015E084
    /* 2447C 8015E074 BB020224 */   addiu     $v0, $zero, 0x2BB
  .L8015E078:
    /* 24480 8015E078 05006214 */  bne        $v1, $v0, .L8015E090
    /* 24484 8015E07C 01000424 */   addiu     $a0, $zero, 0x1
    /* 24488 8015E080 53020224 */  addiu      $v0, $zero, 0x253
  .L8015E084:
    /* 2448C 8015E084 1280013C */  lui        $at, %hi(sfxdnum)
    /* 24490 8015E088 54B822AC */  sw         $v0, %lo(sfxdnum)($at)
  .L8015E08C:
    /* 24494 8015E08C 01000424 */  addiu      $a0, $zero, 0x1
  .L8015E090:
    /* 24498 8015E090 323E010C */  jal        NetSendCmdQuest__FUcUc
    /* 2449C 8015E094 21280000 */   addu      $a1, $zero, $zero
    /* 244A0 8015E098 40101000 */  sll        $v0, $s0, 1
  .L8015E09C:
    /* 244A4 8015E09C 21105000 */  addu       $v0, $v0, $s0
    /* 244A8 8015E0A0 80100200 */  sll        $v0, $v0, 2
    /* 244AC 8015E0A4 21105000 */  addu       $v0, $v0, $s0
    /* 244B0 8015E0A8 00110200 */  sll        $v0, $v0, 4
    /* 244B4 8015E0AC 23105000 */  subu       $v0, $v0, $s0
    /* 244B8 8015E0B0 80100200 */  sll        $v0, $v0, 2
    /* 244BC 8015E0B4 21105000 */  addu       $v0, $v0, $s0
    /* 244C0 8015E0B8 C0100200 */  sll        $v0, $v0, 3
    /* 244C4 8015E0BC 0E80013C */  lui        $at, %hi(plr + 0x193E)
    /* 244C8 8015E0C0 21082200 */  addu       $at, $at, $v0
    /* 244CC 8015E0C4 76BE2384 */  lh         $v1, %lo(plr + 0x193E)($at)
    /* 244D0 8015E0C8 1C000224 */  addiu      $v0, $zero, 0x1C
    /* 244D4 8015E0CC 27006214 */  bne        $v1, $v0, .L8015E16C
    /* 244D8 8015E0D0 01000424 */   addiu     $a0, $zero, 0x1
    /* 244DC 8015E0D4 01000224 */  addiu      $v0, $zero, 0x1
    /* 244E0 8015E0D8 0E80013C */  lui        $at, %hi(quests + 0xC6)
    /* 244E4 8015E0DC 06DB22A0 */  sb         $v0, %lo(quests + 0xC6)($at)
    /* 244E8 8015E0E0 03000224 */  addiu      $v0, $zero, 0x3
    /* 244EC 8015E0E4 0E80013C */  lui        $at, %hi(quests + 0xB6)
    /* 244F0 8015E0E8 F6DA22A0 */  sb         $v0, %lo(quests + 0xB6)($at)
    /* 244F4 8015E0EC 323E010C */  jal        NetSendCmdQuest__FUcUc
    /* 244F8 8015E0F0 09000524 */   addiu     $a1, $zero, 0x9
    /* 244FC 8015E0F4 1280033C */  lui        $v1, %hi(myplr)
    /* 24500 8015E0F8 08BA638C */  lw         $v1, %lo(myplr)($v1)
    /* 24504 8015E0FC 14000224 */  addiu      $v0, $zero, 0x14
    /* 24508 8015E100 1280013C */  lui        $at, %hi(sfxdelay)
    /* 2450C 8015E104 50B822AC */  sw         $v0, %lo(sfxdelay)($at)
    /* 24510 8015E108 40100300 */  sll        $v0, $v1, 1
    /* 24514 8015E10C 21104300 */  addu       $v0, $v0, $v1
    /* 24518 8015E110 80100200 */  sll        $v0, $v0, 2
    /* 2451C 8015E114 21104300 */  addu       $v0, $v0, $v1
    /* 24520 8015E118 00110200 */  sll        $v0, $v0, 4
    /* 24524 8015E11C 23104300 */  subu       $v0, $v0, $v1
    /* 24528 8015E120 80100200 */  sll        $v0, $v0, 2
    /* 2452C 8015E124 21104300 */  addu       $v0, $v0, $v1
    /* 24530 8015E128 C0100200 */  sll        $v0, $v0, 3
    /* 24534 8015E12C 0E80013C */  lui        $at, %hi(plr + 0xF6)
    /* 24538 8015E130 21082200 */  addu       $at, $at, $v0
    /* 2453C 8015E134 2EA62380 */  lb         $v1, %lo(plr + 0xF6)($at)
    /* 24540 8015E138 00000000 */  nop
    /* 24544 8015E13C 03006014 */  bnez       $v1, .L8015E14C
    /* 24548 8015E140 01000224 */   addiu     $v0, $zero, 0x1
    /* 2454C 8015E144 59780508 */  j          .L8015E164
    /* 24550 8015E148 2D030224 */   addiu     $v0, $zero, 0x32D
  .L8015E14C:
    /* 24554 8015E14C 03006214 */  bne        $v1, $v0, .L8015E15C
    /* 24558 8015E150 02000224 */   addiu     $v0, $zero, 0x2
    /* 2455C 8015E154 59780508 */  j          .L8015E164
    /* 24560 8015E158 BF020224 */   addiu     $v0, $zero, 0x2BF
  .L8015E15C:
    /* 24564 8015E15C 03006214 */  bne        $v1, $v0, .L8015E16C
    /* 24568 8015E160 57020224 */   addiu     $v0, $zero, 0x257
  .L8015E164:
    /* 2456C 8015E164 1280013C */  lui        $at, %hi(sfxdnum)
    /* 24570 8015E168 54B822AC */  sw         $v0, %lo(sfxdnum)($at)
  .L8015E16C:
    /* 24574 8015E16C 1400BF8F */  lw         $ra, 0x14($sp)
    /* 24578 8015E170 1000B08F */  lw         $s0, 0x10($sp)
    /* 2457C 8015E174 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 24580 8015E178 0800E003 */  jr         $ra
    /* 24584 8015E17C 00000000 */   nop
endlabel CheckQuestItem__Fi
