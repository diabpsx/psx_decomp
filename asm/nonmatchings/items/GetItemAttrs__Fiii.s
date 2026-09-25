.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetItemAttrs__Fiii, 0x570

glabel GetItemAttrs__Fiii
    /* 3129C 8004129C D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 312A0 800412A0 2400B5AF */  sw         $s5, 0x24($sp)
    /* 312A4 800412A4 21A88000 */  addu       $s5, $a0, $zero
    /* 312A8 800412A8 1800B2AF */  sw         $s2, 0x18($sp)
    /* 312AC 800412AC 2190A000 */  addu       $s2, $a1, $zero
    /* 312B0 800412B0 2800B6AF */  sw         $s6, 0x28($sp)
    /* 312B4 800412B4 21B0C000 */  addu       $s6, $a2, $zero
    /* 312B8 800412B8 1000B0AF */  sw         $s0, 0x10($sp)
    /* 312BC 800412BC 40811200 */  sll        $s0, $s2, 5
    /* 312C0 800412C0 2000B4AF */  sw         $s4, 0x20($sp)
    /* 312C4 800412C4 21A00000 */  addu       $s4, $zero, $zero
    /* 312C8 800412C8 C0101500 */  sll        $v0, $s5, 3
    /* 312CC 800412CC 23105500 */  subu       $v0, $v0, $s5
    /* 312D0 800412D0 1180013C */  lui        $at, %hi(AllItemsList + 0x4)
    /* 312D4 800412D4 21083000 */  addu       $at, $at, $s0
    /* 312D8 800412D8 A8132390 */  lbu        $v1, %lo(AllItemsList + 0x4)($at)
    /* 312DC 800412DC 1180013C */  lui        $at, %hi(AllItemsList + 0xF)
    /* 312E0 800412E0 21083000 */  addu       $at, $at, $s0
    /* 312E4 800412E4 B3132490 */  lbu        $a0, %lo(AllItemsList + 0xF)($at)
    /* 312E8 800412E8 80100200 */  sll        $v0, $v0, 2
    /* 312EC 800412EC 1400B1AF */  sw         $s1, 0x14($sp)
    /* 312F0 800412F0 1180013C */  lui        $at, %hi(AllItemsList + 0xE)
    /* 312F4 800412F4 21083000 */  addu       $at, $at, $s0
    /* 312F8 800412F8 B2133190 */  lbu        $s1, %lo(AllItemsList + 0xE)($at)
    /* 312FC 800412FC 1180013C */  lui        $at, %hi(AllItemsList + 0x3)
    /* 31300 80041300 21083000 */  addu       $at, $at, $s0
    /* 31304 80041304 A7132690 */  lbu        $a2, %lo(AllItemsList + 0x3)($at)
    /* 31308 80041308 1180013C */  lui        $at, %hi(AllItemsList + 0x6)
    /* 3130C 8004130C 21083000 */  addu       $at, $at, $s0
    /* 31310 80041310 AA132594 */  lhu        $a1, %lo(AllItemsList + 0x6)($at)
    /* 31314 80041314 1180013C */  lui        $at, %hi(AllItemsList + 0x2)
    /* 31318 80041318 21083000 */  addu       $at, $at, $s0
    /* 3131C 8004131C A6132790 */  lbu        $a3, %lo(AllItemsList + 0x2)($at)
    /* 31320 80041320 1180013C */  lui        $at, %hi(AllItemsList + 0x1)
    /* 31324 80041324 21083000 */  addu       $at, $at, $s0
    /* 31328 80041328 A5132890 */  lbu        $t0, %lo(AllItemsList + 0x1)($at)
    /* 3132C 8004132C 1180013C */  lui        $at, %hi(AllItemsList + 0xC)
    /* 31330 80041330 21083000 */  addu       $at, $at, $s0
    /* 31334 80041334 B0132990 */  lbu        $t1, %lo(AllItemsList + 0xC)($at)
    /* 31338 80041338 1180013C */  lui        $at, %hi(AllItemsList + 0xD)
    /* 3133C 8004133C 21083000 */  addu       $at, $at, $s0
    /* 31340 80041340 B1132A90 */  lbu        $t2, %lo(AllItemsList + 0xD)($at)
    /* 31344 80041344 23105500 */  subu       $v0, $v0, $s5
    /* 31348 80041348 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 3134C 8004134C 80980200 */  sll        $s3, $v0, 2
    /* 31350 80041350 2C00BFAF */  sw         $ra, 0x2C($sp)
    /* 31354 80041354 001E0300 */  sll        $v1, $v1, 24
    /* 31358 80041358 031E0300 */  sra        $v1, $v1, 24
    /* 3135C 8004135C 23209100 */  subu       $a0, $a0, $s1
    /* 31360 80041360 0D80013C */  lui        $at, %hi(item + 0x2C)
    /* 31364 80041364 21083300 */  addu       $at, $at, $s3
    /* 31368 80041368 801D23A4 */  sh         $v1, %lo(item + 0x2C)($at)
    /* 3136C 8004136C 0D80013C */  lui        $at, %hi(item + 0x4C)
    /* 31370 80041370 21083300 */  addu       $at, $at, $s3
    /* 31374 80041374 A01D26A0 */  sb         $a2, %lo(item + 0x4C)($at)
    /* 31378 80041378 0D80013C */  lui        $at, %hi(item + 0x26)
    /* 3137C 8004137C 21083300 */  addu       $at, $at, $s3
    /* 31380 80041380 7A1D25A4 */  sh         $a1, %lo(item + 0x26)($at)
    /* 31384 80041384 0D80013C */  lui        $at, %hi(item + 0x28)
    /* 31388 80041388 21083300 */  addu       $at, $at, $s3
    /* 3138C 8004138C 7C1D25A4 */  sh         $a1, %lo(item + 0x28)($at)
    /* 31390 80041390 0D80013C */  lui        $at, %hi(item + 0x54)
    /* 31394 80041394 21083300 */  addu       $at, $at, $s3
    /* 31398 80041398 A81D27A0 */  sb         $a3, %lo(item + 0x54)($at)
    /* 3139C 8004139C 0D80013C */  lui        $at, %hi(item + 0x55)
    /* 313A0 800413A0 21083300 */  addu       $at, $at, $s3
    /* 313A4 800413A4 A91D28A0 */  sb         $t0, %lo(item + 0x55)($at)
    /* 313A8 800413A8 0D80013C */  lui        $at, %hi(item + 0x3B)
    /* 313AC 800413AC 21083300 */  addu       $at, $at, $s3
    /* 313B0 800413B0 8F1D29A0 */  sb         $t1, %lo(item + 0x3B)($at)
    /* 313B4 800413B4 0D80013C */  lui        $at, %hi(item + 0x3C)
    /* 313B8 800413B8 21083300 */  addu       $at, $at, $s3
    /* 313BC 800413BC 901D2AA0 */  sb         $t2, %lo(item + 0x3C)($at)
    /* 313C0 800413C0 C9F6000C */  jal        ENG_random__Fl
    /* 313C4 800413C4 01008424 */   addiu     $a0, $a0, 0x1
    /* 313C8 800413C8 1180013C */  lui        $at, %hi(AllItemsList + 0x14)
    /* 313CC 800413CC 21083000 */  addu       $at, $at, $s0
    /* 313D0 800413D0 B813258C */  lw         $a1, %lo(AllItemsList + 0x14)($at)
    /* 313D4 800413D4 1180013C */  lui        $at, %hi(AllItemsList + 0x18)
    /* 313D8 800413D8 21083000 */  addu       $at, $at, $s0
    /* 313DC 800413DC BC132690 */  lbu        $a2, %lo(AllItemsList + 0x18)($at)
    /* 313E0 800413E0 1180013C */  lui        $at, %hi(AllItemsList + 0x19)
    /* 313E4 800413E4 21083000 */  addu       $at, $at, $s0
    /* 313E8 800413E8 BD132790 */  lbu        $a3, %lo(AllItemsList + 0x19)($at)
    /* 313EC 800413EC 1180013C */  lui        $at, %hi(AllItemsList + 0x1C)
    /* 313F0 800413F0 21083000 */  addu       $at, $at, $s0
    /* 313F4 800413F4 C0132394 */  lhu        $v1, %lo(AllItemsList + 0x1C)($at)
    /* 313F8 800413F8 1180013C */  lui        $at, %hi(AllItemsList + 0xB)
    /* 313FC 800413FC 21083000 */  addu       $at, $at, $s0
    /* 31400 80041400 AF132490 */  lbu        $a0, %lo(AllItemsList + 0xB)($at)
    /* 31404 80041404 1180013C */  lui        $at, %hi(AllItemsList + 0x10)
    /* 31408 80041408 21083000 */  addu       $at, $at, $s0
    /* 3140C 8004140C B4132890 */  lbu        $t0, %lo(AllItemsList + 0x10)($at)
    /* 31410 80041410 1180013C */  lui        $at, %hi(AllItemsList + 0x11)
    /* 31414 80041414 21083000 */  addu       $at, $at, $s0
    /* 31418 80041418 B5132990 */  lbu        $t1, %lo(AllItemsList + 0x11)($at)
    /* 3141C 8004141C 1180013C */  lui        $at, %hi(AllItemsList + 0x12)
    /* 31420 80041420 21083000 */  addu       $at, $at, $s0
    /* 31424 80041424 B6132A90 */  lbu        $t2, %lo(AllItemsList + 0x12)($at)
    /* 31428 80041428 21882202 */  addu       $s1, $s1, $v0
    /* 3142C 8004142C 0D80013C */  lui        $at, %hi(item + 0x4A)
    /* 31430 80041430 21083300 */  addu       $at, $at, $s3
    /* 31434 80041434 9E1D31A0 */  sb         $s1, %lo(item + 0x4A)($at)
    /* 31438 80041438 0D80013C */  lui        $at, %hi(item + 0x51)
    /* 3143C 8004143C 21083300 */  addu       $at, $at, $s3
    /* 31440 80041440 A51D20A0 */  sb         $zero, %lo(item + 0x51)($at)
    /* 31444 80041444 0D80013C */  lui        $at, %hi(item)
    /* 31448 80041448 21083300 */  addu       $at, $at, $s3
    /* 3144C 8004144C 541D20AC */  sw         $zero, %lo(item)($at)
    /* 31450 80041450 0D80013C */  lui        $at, %hi(item + 0x4)
    /* 31454 80041454 21083300 */  addu       $at, $at, $s3
    /* 31458 80041458 581D20AC */  sw         $zero, %lo(item + 0x4)($at)
    /* 3145C 8004145C 0D80013C */  lui        $at, %hi(item + 0x8)
    /* 31460 80041460 21083300 */  addu       $at, $at, $s3
    /* 31464 80041464 5C1D20AC */  sw         $zero, %lo(item + 0x8)($at)
    /* 31468 80041468 0D80013C */  lui        $at, %hi(item + 0xC)
    /* 3146C 8004146C 21083300 */  addu       $at, $at, $s3
    /* 31470 80041470 601D20AC */  sw         $zero, %lo(item + 0xC)($at)
    /* 31474 80041474 0D80013C */  lui        $at, %hi(item + 0x38)
    /* 31478 80041478 21083300 */  addu       $at, $at, $s3
    /* 3147C 8004147C 8C1D20A4 */  sh         $zero, %lo(item + 0x38)($at)
    /* 31480 80041480 0D80013C */  lui        $at, %hi(item + 0x36)
    /* 31484 80041484 21083300 */  addu       $at, $at, $s3
    /* 31488 80041488 8A1D20A4 */  sh         $zero, %lo(item + 0x36)($at)
    /* 3148C 8004148C 0D80013C */  lui        $at, %hi(item + 0x20)
    /* 31490 80041490 21083300 */  addu       $at, $at, $s3
    /* 31494 80041494 741D20AC */  sw         $zero, %lo(item + 0x20)($at)
    /* 31498 80041498 0D80013C */  lui        $at, %hi(item + 0x56)
    /* 3149C 8004149C 21083300 */  addu       $at, $at, $s3
    /* 314A0 800414A0 AA1D20A0 */  sb         $zero, %lo(item + 0x56)($at)
    /* 314A4 800414A4 0D80013C */  lui        $at, %hi(item + 0x57)
    /* 314A8 800414A8 21083300 */  addu       $at, $at, $s3
    /* 314AC 800414AC AB1D20A0 */  sb         $zero, %lo(item + 0x57)($at)
    /* 314B0 800414B0 0D80013C */  lui        $at, %hi(item + 0x58)
    /* 314B4 800414B4 21083300 */  addu       $at, $at, $s3
    /* 314B8 800414B8 AC1D20A0 */  sb         $zero, %lo(item + 0x58)($at)
    /* 314BC 800414BC 0D80013C */  lui        $at, %hi(item + 0x59)
    /* 314C0 800414C0 21083300 */  addu       $at, $at, $s3
    /* 314C4 800414C4 AD1D20A0 */  sb         $zero, %lo(item + 0x59)($at)
    /* 314C8 800414C8 0D80013C */  lui        $at, %hi(item + 0x49)
    /* 314CC 800414CC 21083300 */  addu       $at, $at, $s3
    /* 314D0 800414D0 9D1D20A0 */  sb         $zero, %lo(item + 0x49)($at)
    /* 314D4 800414D4 0D80013C */  lui        $at, %hi(item + 0x4B)
    /* 314D8 800414D8 21083300 */  addu       $at, $at, $s3
    /* 314DC 800414DC 9F1D20A0 */  sb         $zero, %lo(item + 0x4B)($at)
    /* 314E0 800414E0 0D80013C */  lui        $at, %hi(item + 0x1C)
    /* 314E4 800414E4 21083300 */  addu       $at, $at, $s3
    /* 314E8 800414E8 701D25AC */  sw         $a1, %lo(item + 0x1C)($at)
    /* 314EC 800414EC 0D80013C */  lui        $at, %hi(item + 0x4D)
    /* 314F0 800414F0 21083300 */  addu       $at, $at, $s3
    /* 314F4 800414F4 A11D26A0 */  sb         $a2, %lo(item + 0x4D)($at)
    /* 314F8 800414F8 0D80013C */  lui        $at, %hi(item + 0x3D)
    /* 314FC 800414FC 21083300 */  addu       $at, $at, $s3
    /* 31500 80041500 911D27A0 */  sb         $a3, %lo(item + 0x3D)($at)
    /* 31504 80041504 0D80013C */  lui        $at, %hi(item + 0x14)
    /* 31508 80041508 21083300 */  addu       $at, $at, $s3
    /* 3150C 8004150C 681D23AC */  sw         $v1, %lo(item + 0x14)($at)
    /* 31510 80041510 0D80013C */  lui        $at, %hi(item + 0x18)
    /* 31514 80041514 21083300 */  addu       $at, $at, $s3
    /* 31518 80041518 6C1D23AC */  sw         $v1, %lo(item + 0x18)($at)
    /* 3151C 8004151C 0D80013C */  lui        $at, %hi(item + 0x3E)
    /* 31520 80041520 21083300 */  addu       $at, $at, $s3
    /* 31524 80041524 921D24A4 */  sh         $a0, %lo(item + 0x3E)($at)
    /* 31528 80041528 0D80013C */  lui        $at, %hi(item + 0x40)
    /* 3152C 8004152C 21083300 */  addu       $at, $at, $s3
    /* 31530 80041530 941D24A4 */  sh         $a0, %lo(item + 0x40)($at)
    /* 31534 80041534 0D80013C */  lui        $at, %hi(item + 0x61)
    /* 31538 80041538 21083300 */  addu       $at, $at, $s3
    /* 3153C 8004153C B51D28A0 */  sb         $t0, %lo(item + 0x61)($at)
    /* 31540 80041540 0D80013C */  lui        $at, %hi(item + 0x64)
    /* 31544 80041544 21083300 */  addu       $at, $at, $s3
    /* 31548 80041548 B81D29A0 */  sb         $t1, %lo(item + 0x64)($at)
    /* 3154C 8004154C 0D80013C */  lui        $at, %hi(item + 0x62)
    /* 31550 80041550 21083300 */  addu       $at, $at, $s3
    /* 31554 80041554 B61D2AA0 */  sb         $t2, %lo(item + 0x62)($at)
    /* 31558 80041558 0D80013C */  lui        $at, %hi(item + 0x5A)
    /* 3155C 8004155C 21083300 */  addu       $at, $at, $s3
    /* 31560 80041560 AE1D20A0 */  sb         $zero, %lo(item + 0x5A)($at)
    /* 31564 80041564 0D80013C */  lui        $at, %hi(item + 0x4D)
    /* 31568 80041568 21083300 */  addu       $at, $at, $s3
    /* 3156C 8004156C A11D2390 */  lbu        $v1, %lo(item + 0x4D)($at)
    /* 31570 80041570 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 31574 80041574 0D80013C */  lui        $at, %hi(item + 0x5F)
    /* 31578 80041578 21083300 */  addu       $at, $at, $s3
    /* 3157C 8004157C B31D22A0 */  sb         $v0, %lo(item + 0x5F)($at)
    /* 31580 80041580 0D80013C */  lui        $at, %hi(item + 0x60)
    /* 31584 80041584 21083300 */  addu       $at, $at, $s3
    /* 31588 80041588 B41D22A0 */  sb         $v0, %lo(item + 0x60)($at)
    /* 3158C 8004158C 18000224 */  addiu      $v0, $zero, 0x18
    /* 31590 80041590 0D80013C */  lui        $at, %hi(item + 0x5B)
    /* 31594 80041594 21083300 */  addu       $at, $at, $s3
    /* 31598 80041598 AF1D20A0 */  sb         $zero, %lo(item + 0x5B)($at)
    /* 3159C 8004159C 0D80013C */  lui        $at, %hi(item + 0x5C)
    /* 315A0 800415A0 21083300 */  addu       $at, $at, $s3
    /* 315A4 800415A4 B01D20A0 */  sb         $zero, %lo(item + 0x5C)($at)
    /* 315A8 800415A8 0D80013C */  lui        $at, %hi(item + 0x2E)
    /* 315AC 800415AC 21083300 */  addu       $at, $at, $s3
    /* 315B0 800415B0 821D32A4 */  sh         $s2, %lo(item + 0x2E)($at)
    /* 315B4 800415B4 0D80013C */  lui        $at, %hi(item + 0x3A)
    /* 315B8 800415B8 21083300 */  addu       $at, $at, $s3
    /* 315BC 800415BC 8E1D20A0 */  sb         $zero, %lo(item + 0x3A)($at)
    /* 315C0 800415C0 0D80013C */  lui        $at, %hi(item + 0x42)
    /* 315C4 800415C4 21083300 */  addu       $at, $at, $s3
    /* 315C8 800415C8 961D20A0 */  sb         $zero, %lo(item + 0x42)($at)
    /* 315CC 800415CC 0D80013C */  lui        $at, %hi(item + 0x43)
    /* 315D0 800415D0 21083300 */  addu       $at, $at, $s3
    /* 315D4 800415D4 971D20A0 */  sb         $zero, %lo(item + 0x43)($at)
    /* 315D8 800415D8 0D80013C */  lui        $at, %hi(item + 0x5D)
    /* 315DC 800415DC 21083300 */  addu       $at, $at, $s3
    /* 315E0 800415E0 B11D20A0 */  sb         $zero, %lo(item + 0x5D)($at)
    /* 315E4 800415E4 0D80013C */  lui        $at, %hi(item + 0x5E)
    /* 315E8 800415E8 21083300 */  addu       $at, $at, $s3
    /* 315EC 800415EC B21D20A0 */  sb         $zero, %lo(item + 0x5E)($at)
    /* 315F0 800415F0 0D80013C */  lui        $at, %hi(item + 0x44)
    /* 315F4 800415F4 21083300 */  addu       $at, $at, $s3
    /* 315F8 800415F8 981D20A0 */  sb         $zero, %lo(item + 0x44)($at)
    /* 315FC 800415FC 0D80013C */  lui        $at, %hi(item + 0x45)
    /* 31600 80041600 21083300 */  addu       $at, $at, $s3
    /* 31604 80041604 991D20A0 */  sb         $zero, %lo(item + 0x45)($at)
    /* 31608 80041608 0D80013C */  lui        $at, %hi(item + 0x46)
    /* 3160C 8004160C 21083300 */  addu       $at, $at, $s3
    /* 31610 80041610 9A1D20A0 */  sb         $zero, %lo(item + 0x46)($at)
    /* 31614 80041614 0D80013C */  lui        $at, %hi(item + 0x47)
    /* 31618 80041618 21083300 */  addu       $at, $at, $s3
    /* 3161C 8004161C 9B1D20A0 */  sb         $zero, %lo(item + 0x47)($at)
    /* 31620 80041620 0D80013C */  lui        $at, %hi(item + 0x48)
    /* 31624 80041624 21083300 */  addu       $at, $at, $s3
    /* 31628 80041628 9C1D20A0 */  sb         $zero, %lo(item + 0x48)($at)
    /* 3162C 8004162C 0D80013C */  lui        $at, %hi(item + 0x30)
    /* 31630 80041630 21083300 */  addu       $at, $at, $s3
    /* 31634 80041634 841D20A4 */  sh         $zero, %lo(item + 0x30)($at)
    /* 31638 80041638 0D80013C */  lui        $at, %hi(item + 0x32)
    /* 3163C 8004163C 21083300 */  addu       $at, $at, $s3
    /* 31640 80041640 861D20A4 */  sh         $zero, %lo(item + 0x32)($at)
    /* 31644 80041644 03006214 */  bne        $v1, $v0, .L80041654
    /* 31648 80041648 2120A002 */   addu      $a0, $s5, $zero
    /* 3164C 8004164C DF02010C */  jal        GetBookSpell__Fii
    /* 31650 80041650 2128C002 */   addu      $a1, $s6, $zero
  .L80041654:
    /* 31654 80041654 0D80013C */  lui        $at, %hi(item + 0x2C)
    /* 31658 80041658 21083300 */  addu       $at, $at, $s3
    /* 3165C 8004165C 801D2384 */  lh         $v1, %lo(item + 0x2C)($at)
    /* 31660 80041660 0B000224 */  addiu      $v0, $zero, 0xB
    /* 31664 80041664 55006214 */  bne        $v1, $v0, .L800417BC
    /* 31668 80041668 C0101500 */   sll       $v0, $s5, 3
    /* 3166C 8004166C 1280023C */  lui        $v0, %hi(gnDifficulty)
    /* 31670 80041670 08C1428C */  lw         $v0, %lo(gnDifficulty)($v0)
    /* 31674 80041674 00000000 */  nop
    /* 31678 80041678 0E004014 */  bnez       $v0, .L800416B4
    /* 3167C 8004167C 00000000 */   nop
    /* 31680 80041680 1280023C */  lui        $v0, %hi(currlevel)
    /* 31684 80041684 0CC14290 */  lbu        $v0, %lo(currlevel)($v0)
    /* 31688 80041688 00000000 */  nop
    /* 3168C 8004168C 80200200 */  sll        $a0, $v0, 2
    /* 31690 80041690 21208200 */  addu       $a0, $a0, $v0
    /* 31694 80041694 C9F6000C */  jal        ENG_random__Fl
    /* 31698 80041698 40200400 */   sll       $a0, $a0, 1
    /* 3169C 8004169C 1280043C */  lui        $a0, %hi(currlevel)
    /* 316A0 800416A0 0CC18490 */  lbu        $a0, %lo(currlevel)($a0)
    /* 316A4 800416A4 00000000 */  nop
    /* 316A8 800416A8 80180400 */  sll        $v1, $a0, 2
    /* 316AC 800416AC 21186400 */  addu       $v1, $v1, $a0
    /* 316B0 800416B0 21A06200 */  addu       $s4, $v1, $v0
  .L800416B4:
    /* 316B4 800416B4 1280033C */  lui        $v1, %hi(gnDifficulty)
    /* 316B8 800416B8 08C1638C */  lw         $v1, %lo(gnDifficulty)($v1)
    /* 316BC 800416BC 01000224 */  addiu      $v0, $zero, 0x1
    /* 316C0 800416C0 13006214 */  bne        $v1, $v0, .L80041710
    /* 316C4 800416C4 02000224 */   addiu     $v0, $zero, 0x2
    /* 316C8 800416C8 1280023C */  lui        $v0, %hi(currlevel)
    /* 316CC 800416CC 0CC14290 */  lbu        $v0, %lo(currlevel)($v0)
    /* 316D0 800416D0 00000000 */  nop
    /* 316D4 800416D4 10004224 */  addiu      $v0, $v0, 0x10
    /* 316D8 800416D8 80200200 */  sll        $a0, $v0, 2
    /* 316DC 800416DC 21208200 */  addu       $a0, $a0, $v0
    /* 316E0 800416E0 C9F6000C */  jal        ENG_random__Fl
    /* 316E4 800416E4 40200400 */   sll       $a0, $a0, 1
    /* 316E8 800416E8 1280043C */  lui        $a0, %hi(currlevel)
    /* 316EC 800416EC 0CC18490 */  lbu        $a0, %lo(currlevel)($a0)
    /* 316F0 800416F0 00000000 */  nop
    /* 316F4 800416F4 10008424 */  addiu      $a0, $a0, 0x10
    /* 316F8 800416F8 80180400 */  sll        $v1, $a0, 2
    /* 316FC 800416FC 21186400 */  addu       $v1, $v1, $a0
    /* 31700 80041700 21A06200 */  addu       $s4, $v1, $v0
    /* 31704 80041704 1280033C */  lui        $v1, %hi(gnDifficulty)
    /* 31708 80041708 08C1638C */  lw         $v1, %lo(gnDifficulty)($v1)
    /* 3170C 8004170C 02000224 */  addiu      $v0, $zero, 0x2
  .L80041710:
    /* 31710 80041710 10006214 */  bne        $v1, $v0, .L80041754
    /* 31714 80041714 00000000 */   nop
    /* 31718 80041718 1280023C */  lui        $v0, %hi(currlevel)
    /* 3171C 8004171C 0CC14290 */  lbu        $v0, %lo(currlevel)($v0)
    /* 31720 80041720 00000000 */  nop
    /* 31724 80041724 20004224 */  addiu      $v0, $v0, 0x20
    /* 31728 80041728 80200200 */  sll        $a0, $v0, 2
    /* 3172C 8004172C 21208200 */  addu       $a0, $a0, $v0
    /* 31730 80041730 C9F6000C */  jal        ENG_random__Fl
    /* 31734 80041734 40200400 */   sll       $a0, $a0, 1
    /* 31738 80041738 1280043C */  lui        $a0, %hi(currlevel)
    /* 3173C 8004173C 0CC18490 */  lbu        $a0, %lo(currlevel)($a0)
    /* 31740 80041740 00000000 */  nop
    /* 31744 80041744 20008424 */  addiu      $a0, $a0, 0x20
    /* 31748 80041748 80180400 */  sll        $v1, $a0, 2
    /* 3174C 8004174C 21186400 */  addu       $v1, $v1, $a0
    /* 31750 80041750 21A06200 */  addu       $s4, $v1, $v0
  .L80041754:
    /* 31754 80041754 1280033C */  lui        $v1, %hi(leveltype)
    /* 31758 80041758 0DC16390 */  lbu        $v1, %lo(leveltype)($v1)
    /* 3175C 8004175C 04000224 */  addiu      $v0, $zero, 0x4
    /* 31760 80041760 04006214 */  bne        $v1, $v0, .L80041774
    /* 31764 80041764 8913822A */   slti      $v0, $s4, 0x1389
    /* 31768 80041768 C3101400 */  sra        $v0, $s4, 3
    /* 3176C 8004176C 21A08202 */  addu       $s4, $s4, $v0
    /* 31770 80041770 8913822A */  slti       $v0, $s4, 0x1389
  .L80041774:
    /* 31774 80041774 02004014 */  bnez       $v0, .L80041780
    /* 31778 80041778 00000000 */   nop
    /* 3177C 8004177C 88131424 */  addiu      $s4, $zero, 0x1388
  .L80041780:
    /* 31780 80041780 0D80013C */  lui        $at, %hi(item + 0x14)
    /* 31784 80041784 21083300 */  addu       $at, $at, $s3
    /* 31788 80041788 681D34AC */  sw         $s4, %lo(item + 0x14)($at)
    /* 3178C 8004178C C409822A */  slti       $v0, $s4, 0x9C4
    /* 31790 80041790 03004014 */  bnez       $v0, .L800417A0
    /* 31794 80041794 E903822A */   slti      $v0, $s4, 0x3E9
    /* 31798 80041798 EB050108 */  j          .L800417AC
    /* 3179C 8004179C 06000224 */   addiu     $v0, $zero, 0x6
  .L800417A0:
    /* 317A0 800417A0 02004014 */  bnez       $v0, .L800417AC
    /* 317A4 800417A4 04000224 */   addiu     $v0, $zero, 0x4
    /* 317A8 800417A8 05000224 */  addiu      $v0, $zero, 0x5
  .L800417AC:
    /* 317AC 800417AC 0D80013C */  lui        $at, %hi(item + 0x4C)
    /* 317B0 800417B0 21083300 */  addu       $at, $at, $s3
    /* 317B4 800417B4 A01D22A0 */  sb         $v0, %lo(item + 0x4C)($at)
    /* 317B8 800417B8 C0101500 */  sll        $v0, $s5, 3
  .L800417BC:
    /* 317BC 800417BC 23105500 */  subu       $v0, $v0, $s5
    /* 317C0 800417C0 80100200 */  sll        $v0, $v0, 2
    /* 317C4 800417C4 23105500 */  subu       $v0, $v0, $s5
    /* 317C8 800417C8 1280033C */  lui        $v1, %hi(FePlayerNo)
    /* 317CC 800417CC 78B3638C */  lw         $v1, %lo(FePlayerNo)($v1)
    /* 317D0 800417D0 80100200 */  sll        $v0, $v0, 2
    /* 317D4 800417D4 0D80013C */  lui        $at, %hi(item + 0x65)
    /* 317D8 800417D8 21082200 */  addu       $at, $at, $v0
    /* 317DC 800417DC B91D23A0 */  sb         $v1, %lo(item + 0x65)($at)
    /* 317E0 800417E0 2C00BF8F */  lw         $ra, 0x2C($sp)
    /* 317E4 800417E4 2800B68F */  lw         $s6, 0x28($sp)
    /* 317E8 800417E8 2400B58F */  lw         $s5, 0x24($sp)
    /* 317EC 800417EC 2000B48F */  lw         $s4, 0x20($sp)
    /* 317F0 800417F0 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 317F4 800417F4 1800B28F */  lw         $s2, 0x18($sp)
    /* 317F8 800417F8 1400B18F */  lw         $s1, 0x14($sp)
    /* 317FC 800417FC 1000B08F */  lw         $s0, 0x10($sp)
    /* 31800 80041800 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 31804 80041804 0800E003 */  jr         $ra
    /* 31808 80041808 00000000 */   nop
endlabel GetItemAttrs__Fiii
