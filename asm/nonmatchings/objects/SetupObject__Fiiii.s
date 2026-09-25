.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetupObject__Fiiii, 0x280

glabel SetupObject__Fiiii
    /* 437F0 800537F0 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 437F4 800537F4 1800B2AF */  sw         $s2, 0x18($sp)
    /* 437F8 800537F8 21908000 */  addu       $s2, $a0, $zero
    /* 437FC 800537FC 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 43800 80053800 2198E000 */  addu       $s3, $a3, $zero
    /* 43804 80053804 40101200 */  sll        $v0, $s2, 1
    /* 43808 80053808 21105200 */  addu       $v0, $v0, $s2
    /* 4380C 8005380C 80100200 */  sll        $v0, $v0, 2
    /* 43810 80053810 23105200 */  subu       $v0, $v0, $s2
    /* 43814 80053814 80100200 */  sll        $v0, $v0, 2
    /* 43818 80053818 2000BFAF */  sw         $ra, 0x20($sp)
    /* 4381C 8005381C 1400B1AF */  sw         $s1, 0x14($sp)
    /* 43820 80053820 1000B0AF */  sw         $s0, 0x10($sp)
    /* 43824 80053824 0E80013C */  lui        $at, %hi(object + 0x1E)
    /* 43828 80053828 21082200 */  addu       $at, $at, $v0
    /* 4382C 8005382C 6A8C33A0 */  sb         $s3, %lo(object + 0x1E)($at)
    /* 43830 80053830 0E80013C */  lui        $at, %hi(object + 0x1F)
    /* 43834 80053834 21082200 */  addu       $at, $at, $v0
    /* 43838 80053838 6B8C25A0 */  sb         $a1, %lo(object + 0x1F)($at)
    /* 4383C 8005383C 0E80013C */  lui        $at, %hi(object + 0x20)
    /* 43840 80053840 21082200 */  addu       $at, $at, $v0
    /* 43844 80053844 6C8C26A0 */  sb         $a2, %lo(object + 0x20)($at)
    /* 43848 80053848 C0101300 */  sll        $v0, $s3, 3
    /* 4384C 8005384C 21105300 */  addu       $v0, $v0, $s3
    /* 43850 80053850 40100200 */  sll        $v0, $v0, 1
    /* 43854 80053854 0E80013C */  lui        $at, %hi(AllObjects + 0x1)
    /* 43858 80053858 21082200 */  addu       $at, $at, $v0
    /* 4385C 8005385C B1842480 */  lb         $a0, %lo(AllObjects + 0x1)($at)
    /* 43860 80053860 0E80023C */  lui        $v0, %hi(ObjFileList)
    /* 43864 80053864 20A34280 */  lb         $v0, %lo(ObjFileList)($v0)
    /* 43868 80053868 00000000 */  nop
    /* 4386C 8005386C 08004410 */  beq        $v0, $a0, .L80053890
    /* 43870 80053870 21180000 */   addu      $v1, $zero, $zero
    /* 43874 80053874 01006324 */  addiu      $v1, $v1, 0x1
  .L80053878:
    /* 43878 80053878 0E80013C */  lui        $at, %hi(ObjFileList)
    /* 4387C 8005387C 21082300 */  addu       $at, $at, $v1
    /* 43880 80053880 20A32280 */  lb         $v0, %lo(ObjFileList)($at)
    /* 43884 80053884 00000000 */  nop
    /* 43888 80053888 FBFF4414 */  bne        $v0, $a0, .L80053878
    /* 4388C 8005388C 01006324 */   addiu     $v1, $v1, 0x1
  .L80053890:
    /* 43890 80053890 40101200 */  sll        $v0, $s2, 1
    /* 43894 80053894 21105200 */  addu       $v0, $v0, $s2
    /* 43898 80053898 80100200 */  sll        $v0, $v0, 2
    /* 4389C 8005389C 23105200 */  subu       $v0, $v0, $s2
    /* 438A0 800538A0 C0181300 */  sll        $v1, $s3, 3
    /* 438A4 800538A4 21187300 */  addu       $v1, $v1, $s3
    /* 438A8 800538A8 40880300 */  sll        $s1, $v1, 1
    /* 438AC 800538AC 0E80013C */  lui        $at, %hi(AllObjects + 0x7)
    /* 438B0 800538B0 21083100 */  addu       $at, $at, $s1
    /* 438B4 800538B4 B7842390 */  lbu        $v1, %lo(AllObjects + 0x7)($at)
    /* 438B8 800538B8 80800200 */  sll        $s0, $v0, 2
    /* 438BC 800538BC 0E80013C */  lui        $at, %hi(object + 0x25)
    /* 438C0 800538C0 21083000 */  addu       $at, $at, $s0
    /* 438C4 800538C4 718C23A0 */  sb         $v1, %lo(object + 0x25)($at)
    /* 438C8 800538C8 1C006010 */  beqz       $v1, .L8005393C
    /* 438CC 800538CC 00000000 */   nop
    /* 438D0 800538D0 0E80013C */  lui        $at, %hi(AllObjects + 0x8)
    /* 438D4 800538D4 21083100 */  addu       $at, $at, $s1
    /* 438D8 800538D8 B8842294 */  lhu        $v0, %lo(AllObjects + 0x8)($at)
    /* 438DC 800538DC 0E80013C */  lui        $at, %hi(object + 0x8)
    /* 438E0 800538E0 21083000 */  addu       $at, $at, $s0
    /* 438E4 800538E4 548C22A4 */  sh         $v0, %lo(object + 0x8)($at)
    /* 438E8 800538E8 0E80013C */  lui        $at, %hi(AllObjects + 0x8)
    /* 438EC 800538EC 21083100 */  addu       $at, $at, $s1
    /* 438F0 800538F0 B8842484 */  lh         $a0, %lo(AllObjects + 0x8)($at)
    /* 438F4 800538F4 C9F6000C */  jal        ENG_random__Fl
    /* 438F8 800538F8 00000000 */   nop
    /* 438FC 800538FC 0E80013C */  lui        $at, %hi(object + 0xA)
    /* 43900 80053900 21083000 */  addu       $at, $at, $s0
    /* 43904 80053904 568C22A4 */  sh         $v0, %lo(object + 0xA)($at)
    /* 43908 80053908 0E80013C */  lui        $at, %hi(AllObjects + 0xA)
    /* 4390C 8005390C 21083100 */  addu       $at, $at, $s1
    /* 43910 80053910 BA842294 */  lhu        $v0, %lo(AllObjects + 0xA)($at)
    /* 43914 80053914 0E80013C */  lui        $at, %hi(object + 0xC)
    /* 43918 80053918 21083000 */  addu       $at, $at, $s0
    /* 4391C 8005391C 588C22A4 */  sh         $v0, %lo(object + 0xC)($at)
    /* 43920 80053920 0E80013C */  lui        $at, %hi(AllObjects + 0xA)
    /* 43924 80053924 21083100 */  addu       $at, $at, $s1
    /* 43928 80053928 BA842484 */  lh         $a0, %lo(AllObjects + 0xA)($at)
    /* 4392C 8005392C C9F6000C */  jal        ENG_random__Fl
    /* 43930 80053930 FFFF8424 */   addiu     $a0, $a0, -0x1
    /* 43934 80053934 5F4E0108 */  j          .L8005397C
    /* 43938 80053938 01004224 */   addiu     $v0, $v0, 0x1
  .L8005393C:
    /* 4393C 8005393C E8030224 */  addiu      $v0, $zero, 0x3E8
    /* 43940 80053940 0E80013C */  lui        $at, %hi(object + 0x8)
    /* 43944 80053944 21083000 */  addu       $at, $at, $s0
    /* 43948 80053948 548C22A4 */  sh         $v0, %lo(object + 0x8)($at)
    /* 4394C 8005394C 0E80013C */  lui        $at, %hi(object + 0xA)
    /* 43950 80053950 21083000 */  addu       $at, $at, $s0
    /* 43954 80053954 568C20A4 */  sh         $zero, %lo(object + 0xA)($at)
    /* 43958 80053958 0E80013C */  lui        $at, %hi(AllObjects + 0xA)
    /* 4395C 8005395C 21083100 */  addu       $at, $at, $s1
    /* 43960 80053960 BA842294 */  lhu        $v0, %lo(AllObjects + 0xA)($at)
    /* 43964 80053964 0E80013C */  lui        $at, %hi(object + 0xC)
    /* 43968 80053968 21083000 */  addu       $at, $at, $s0
    /* 4396C 8005396C 588C22A4 */  sh         $v0, %lo(object + 0xC)($at)
    /* 43970 80053970 0E80013C */  lui        $at, %hi(AllObjects + 0x8)
    /* 43974 80053974 21083100 */  addu       $at, $at, $s1
    /* 43978 80053978 B8842294 */  lhu        $v0, %lo(AllObjects + 0x8)($at)
  .L8005397C:
    /* 4397C 8005397C 0E80013C */  lui        $at, %hi(object + 0x21)
    /* 43980 80053980 21083000 */  addu       $at, $at, $s0
    /* 43984 80053984 6D8C22A0 */  sb         $v0, %lo(object + 0x21)($at)
    /* 43988 80053988 40101200 */  sll        $v0, $s2, 1
    /* 4398C 8005398C 21105200 */  addu       $v0, $v0, $s2
    /* 43990 80053990 80100200 */  sll        $v0, $v0, 2
    /* 43994 80053994 23105200 */  subu       $v0, $v0, $s2
    /* 43998 80053998 C0181300 */  sll        $v1, $s3, 3
    /* 4399C 8005399C 21187300 */  addu       $v1, $v1, $s3
    /* 439A0 800539A0 40180300 */  sll        $v1, $v1, 1
    /* 439A4 800539A4 0E80013C */  lui        $at, %hi(AllObjects + 0xC)
    /* 439A8 800539A8 21082300 */  addu       $at, $at, $v1
    /* 439AC 800539AC BC842490 */  lbu        $a0, %lo(AllObjects + 0xC)($at)
    /* 439B0 800539B0 80100200 */  sll        $v0, $v0, 2
    /* 439B4 800539B4 0E80013C */  lui        $at, %hi(object + 0x27)
    /* 439B8 800539B8 21082200 */  addu       $at, $at, $v0
    /* 439BC 800539BC 738C24A0 */  sb         $a0, %lo(object + 0x27)($at)
    /* 439C0 800539C0 0E80013C */  lui        $at, %hi(AllObjects + 0xD)
    /* 439C4 800539C4 21082300 */  addu       $at, $at, $v1
    /* 439C8 800539C8 BD842490 */  lbu        $a0, %lo(AllObjects + 0xD)($at)
    /* 439CC 800539CC 0E80013C */  lui        $at, %hi(object + 0x28)
    /* 439D0 800539D0 21082200 */  addu       $at, $at, $v0
    /* 439D4 800539D4 748C24A0 */  sb         $a0, %lo(object + 0x28)($at)
    /* 439D8 800539D8 0E80013C */  lui        $at, %hi(AllObjects + 0xE)
    /* 439DC 800539DC 21082300 */  addu       $at, $at, $v1
    /* 439E0 800539E0 BE842490 */  lbu        $a0, %lo(AllObjects + 0xE)($at)
    /* 439E4 800539E4 0E80013C */  lui        $at, %hi(object + 0x26)
    /* 439E8 800539E8 21082200 */  addu       $at, $at, $v0
    /* 439EC 800539EC 728C20A0 */  sb         $zero, %lo(object + 0x26)($at)
    /* 439F0 800539F0 0E80013C */  lui        $at, %hi(object + 0x24)
    /* 439F4 800539F4 21082200 */  addu       $at, $at, $v0
    /* 439F8 800539F8 708C24A0 */  sb         $a0, %lo(object + 0x24)($at)
    /* 439FC 800539FC 0E80013C */  lui        $at, %hi(AllObjects + 0xF)
    /* 43A00 80053A00 21082300 */  addu       $at, $at, $v1
    /* 43A04 80053A04 BF842490 */  lbu        $a0, %lo(AllObjects + 0xF)($at)
    /* 43A08 80053A08 0E80013C */  lui        $at, %hi(object + 0x22)
    /* 43A0C 80053A0C 21082200 */  addu       $at, $at, $v0
    /* 43A10 80053A10 6E8C24A0 */  sb         $a0, %lo(object + 0x22)($at)
    /* 43A14 80053A14 0E80013C */  lui        $at, %hi(AllObjects + 0x10)
    /* 43A18 80053A18 21082300 */  addu       $at, $at, $v1
    /* 43A1C 80053A1C C0842390 */  lbu        $v1, %lo(AllObjects + 0x10)($at)
    /* 43A20 80053A20 0E80013C */  lui        $at, %hi(object + 0x29)
    /* 43A24 80053A24 21082200 */  addu       $at, $at, $v0
    /* 43A28 80053A28 758C20A0 */  sb         $zero, %lo(object + 0x29)($at)
    /* 43A2C 80053A2C 0E80013C */  lui        $at, %hi(object + 0x2A)
    /* 43A30 80053A30 21082200 */  addu       $at, $at, $v0
    /* 43A34 80053A34 768C20A0 */  sb         $zero, %lo(object + 0x2A)($at)
    /* 43A38 80053A38 0E80013C */  lui        $at, %hi(object + 0x2B)
    /* 43A3C 80053A3C 21082200 */  addu       $at, $at, $v0
    /* 43A40 80053A40 778C20A0 */  sb         $zero, %lo(object + 0x2B)($at)
    /* 43A44 80053A44 0E80013C */  lui        $at, %hi(object + 0x23)
    /* 43A48 80053A48 21082200 */  addu       $at, $at, $v0
    /* 43A4C 80053A4C 6F8C23A0 */  sb         $v1, %lo(object + 0x23)($at)
    /* 43A50 80053A50 2000BF8F */  lw         $ra, 0x20($sp)
    /* 43A54 80053A54 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 43A58 80053A58 1800B28F */  lw         $s2, 0x18($sp)
    /* 43A5C 80053A5C 1400B18F */  lw         $s1, 0x14($sp)
    /* 43A60 80053A60 1000B08F */  lw         $s0, 0x10($sp)
    /* 43A64 80053A64 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 43A68 80053A68 0800E003 */  jr         $ra
    /* 43A6C 80053A6C 00000000 */   nop
endlabel SetupObject__Fiiii
