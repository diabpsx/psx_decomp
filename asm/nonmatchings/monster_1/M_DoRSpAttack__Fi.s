.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching M_DoRSpAttack__Fi, 0x208

glabel M_DoRSpAttack__Fi
    /* 14178 8014DD70 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 1417C 8014DD74 2800B0AF */  sw         $s0, 0x28($sp)
    /* 14180 8014DD78 21808000 */  addu       $s0, $a0, $zero
    /* 14184 8014DD7C 40101000 */  sll        $v0, $s0, 1
    /* 14188 8014DD80 21105000 */  addu       $v0, $v0, $s0
    /* 1418C 8014DD84 80100200 */  sll        $v0, $v0, 2
    /* 14190 8014DD88 21105000 */  addu       $v0, $v0, $s0
    /* 14194 8014DD8C C0400200 */  sll        $t0, $v0, 3
    /* 14198 8014DD90 2C00BFAF */  sw         $ra, 0x2C($sp)
    /* 1419C 8014DD94 1080013C */  lui        $at, %hi(monster + 0x64)
    /* 141A0 8014DD98 21082800 */  addu       $at, $at, $t0
    /* 141A4 8014DD9C F853228C */  lw         $v0, %lo(monster + 0x64)($at)
    /* 141A8 8014DDA0 1080013C */  lui        $at, %hi(monster + 0x41)
    /* 141AC 8014DDA4 21082800 */  addu       $at, $at, $t0
    /* 141B0 8014DDA8 D5532380 */  lb         $v1, %lo(monster + 0x41)($at)
    /* 141B4 8014DDAC 2A004290 */  lbu        $v0, 0x2A($v0)
    /* 141B8 8014DDB0 00000000 */  nop
    /* 141BC 8014DDB4 28006214 */  bne        $v1, $v0, .L8014DE58
    /* 141C0 8014DDB8 40101000 */   sll       $v0, $s0, 1
    /* 141C4 8014DDBC 1080013C */  lui        $at, %hi(monster + 0x3F)
    /* 141C8 8014DDC0 21082800 */  addu       $at, $at, $t0
    /* 141CC 8014DDC4 D3532280 */  lb         $v0, %lo(monster + 0x3F)($at)
    /* 141D0 8014DDC8 00000000 */  nop
    /* 141D4 8014DDCC 22004014 */  bnez       $v0, .L8014DE58
    /* 141D8 8014DDD0 40101000 */   sll       $v0, $s0, 1
    /* 141DC 8014DDD4 1080013C */  lui        $at, %hi(monster + 0x3C)
    /* 141E0 8014DDD8 21082800 */  addu       $at, $at, $t0
    /* 141E4 8014DDDC D0532280 */  lb         $v0, %lo(monster + 0x3C)($at)
    /* 141E8 8014DDE0 1080013C */  lui        $at, %hi(monster + 0x34)
    /* 141EC 8014DDE4 21082800 */  addu       $at, $at, $t0
    /* 141F0 8014DDE8 C8532480 */  lb         $a0, %lo(monster + 0x34)($at)
    /* 141F4 8014DDEC 1080013C */  lui        $at, %hi(monster + 0x35)
    /* 141F8 8014DDF0 21082800 */  addu       $at, $at, $t0
    /* 141FC 8014DDF4 C9532580 */  lb         $a1, %lo(monster + 0x35)($at)
    /* 14200 8014DDF8 1080013C */  lui        $at, %hi(monster + 0x4A)
    /* 14204 8014DDFC 21082800 */  addu       $at, $at, $t0
    /* 14208 8014DE00 DE532690 */  lbu        $a2, %lo(monster + 0x4A)($at)
    /* 1420C 8014DE04 1080013C */  lui        $at, %hi(monster + 0x4B)
    /* 14210 8014DE08 21082800 */  addu       $at, $at, $t0
    /* 14214 8014DE0C DF532790 */  lbu        $a3, %lo(monster + 0x4B)($at)
    /* 14218 8014DE10 1000A2AF */  sw         $v0, 0x10($sp)
    /* 1421C 8014DE14 1080013C */  lui        $at, %hi(monster + 0x18)
    /* 14220 8014DE18 21082800 */  addu       $at, $at, $t0
    /* 14224 8014DE1C AC532384 */  lh         $v1, %lo(monster + 0x18)($at)
    /* 14228 8014DE20 01000224 */  addiu      $v0, $zero, 0x1
    /* 1422C 8014DE24 1800A2AF */  sw         $v0, 0x18($sp)
    /* 14230 8014DE28 1C00B0AF */  sw         $s0, 0x1C($sp)
    /* 14234 8014DE2C 1400A3AF */  sw         $v1, 0x14($sp)
    /* 14238 8014DE30 1080013C */  lui        $at, %hi(monster + 0x1C)
    /* 1423C 8014DE34 21082800 */  addu       $at, $at, $t0
    /* 14240 8014DE38 B0532284 */  lh         $v0, %lo(monster + 0x1C)($at)
    /* 14244 8014DE3C 2400A0AF */  sw         $zero, 0x24($sp)
    /* 14248 8014DE40 810A050C */  jal        AddMissile__Fiiiiiiciii
    /* 1424C 8014DE44 2000A2AF */   sw        $v0, 0x20($sp)
    /* 14250 8014DE48 21200002 */  addu       $a0, $s0, $zero
    /* 14254 8014DE4C 4AF5000C */  jal        PlayEffect__Fii
    /* 14258 8014DE50 03000524 */   addiu     $a1, $zero, 0x3
    /* 1425C 8014DE54 40101000 */  sll        $v0, $s0, 1
  .L8014DE58:
    /* 14260 8014DE58 21105000 */  addu       $v0, $v0, $s0
    /* 14264 8014DE5C 80100200 */  sll        $v0, $v0, 2
    /* 14268 8014DE60 21105000 */  addu       $v0, $v0, $s0
    /* 1426C 8014DE64 C0200200 */  sll        $a0, $v0, 3
    /* 14270 8014DE68 1080013C */  lui        $at, %hi(monster + 0x4C)
    /* 14274 8014DE6C 21082400 */  addu       $at, $at, $a0
    /* 14278 8014DE70 E0532390 */  lbu        $v1, %lo(monster + 0x4C)($at)
    /* 1427C 8014DE74 1A000224 */  addiu      $v0, $zero, 0x1A
    /* 14280 8014DE78 27006214 */  bne        $v1, $v0, .L8014DF18
    /* 14284 8014DE7C 40101000 */   sll       $v0, $s0, 1
    /* 14288 8014DE80 1080013C */  lui        $at, %hi(monster + 0x41)
    /* 1428C 8014DE84 21082400 */  addu       $at, $at, $a0
    /* 14290 8014DE88 D5532380 */  lb         $v1, %lo(monster + 0x41)($at)
    /* 14294 8014DE8C 03000224 */  addiu      $v0, $zero, 0x3
    /* 14298 8014DE90 21006214 */  bne        $v1, $v0, .L8014DF18
    /* 1429C 8014DE94 40101000 */   sll       $v0, $s0, 1
    /* 142A0 8014DE98 1080013C */  lui        $at, %hi(monster + 0x1A)
    /* 142A4 8014DE9C 21082400 */  addu       $at, $at, $a0
    /* 142A8 8014DEA0 AE532294 */  lhu        $v0, %lo(monster + 0x1A)($at)
    /* 142AC 8014DEA4 01000324 */  addiu      $v1, $zero, 0x1
    /* 142B0 8014DEA8 01004224 */  addiu      $v0, $v0, 0x1
    /* 142B4 8014DEAC 1080013C */  lui        $at, %hi(monster + 0x1A)
    /* 142B8 8014DEB0 21082400 */  addu       $at, $at, $a0
    /* 142BC 8014DEB4 AE5322A4 */  sh         $v0, %lo(monster + 0x1A)($at)
    /* 142C0 8014DEB8 00140200 */  sll        $v0, $v0, 16
    /* 142C4 8014DEBC 03140200 */  sra        $v0, $v0, 16
    /* 142C8 8014DEC0 06004314 */  bne        $v0, $v1, .L8014DEDC
    /* 142CC 8014DEC4 00000000 */   nop
    /* 142D0 8014DEC8 1080013C */  lui        $at, %hi(monster + 0x2C)
    /* 142D4 8014DECC 21082400 */  addu       $at, $at, $a0
    /* 142D8 8014DED0 C0532294 */  lhu        $v0, %lo(monster + 0x2C)($at)
    /* 142DC 8014DED4 C2370508 */  j          .L8014DF08
    /* 142E0 8014DED8 04004234 */   ori       $v0, $v0, 0x4
  .L8014DEDC:
    /* 142E4 8014DEDC 1080013C */  lui        $at, %hi(monster + 0x1A)
    /* 142E8 8014DEE0 21082400 */  addu       $at, $at, $a0
    /* 142EC 8014DEE4 AE532384 */  lh         $v1, %lo(monster + 0x1A)($at)
    /* 142F0 8014DEE8 0F000224 */  addiu      $v0, $zero, 0xF
    /* 142F4 8014DEEC 0A006214 */  bne        $v1, $v0, .L8014DF18
    /* 142F8 8014DEF0 40101000 */   sll       $v0, $s0, 1
    /* 142FC 8014DEF4 1080013C */  lui        $at, %hi(monster + 0x2C)
    /* 14300 8014DEF8 21082400 */  addu       $at, $at, $a0
    /* 14304 8014DEFC C0532294 */  lhu        $v0, %lo(monster + 0x2C)($at)
    /* 14308 8014DF00 00000000 */  nop
    /* 1430C 8014DF04 FBFF4230 */  andi       $v0, $v0, 0xFFFB
  .L8014DF08:
    /* 14310 8014DF08 1080013C */  lui        $at, %hi(monster + 0x2C)
    /* 14314 8014DF0C 21082400 */  addu       $at, $at, $a0
    /* 14318 8014DF10 C05322A4 */  sh         $v0, %lo(monster + 0x2C)($at)
    /* 1431C 8014DF14 40101000 */  sll        $v0, $s0, 1
  .L8014DF18:
    /* 14320 8014DF18 21105000 */  addu       $v0, $v0, $s0
    /* 14324 8014DF1C 80100200 */  sll        $v0, $v0, 2
    /* 14328 8014DF20 21105000 */  addu       $v0, $v0, $s0
    /* 1432C 8014DF24 C0200200 */  sll        $a0, $v0, 3
    /* 14330 8014DF28 1080013C */  lui        $at, %hi(monster + 0x41)
    /* 14334 8014DF2C 21082400 */  addu       $at, $at, $a0
    /* 14338 8014DF30 D5532380 */  lb         $v1, %lo(monster + 0x41)($at)
    /* 1433C 8014DF34 1080013C */  lui        $at, %hi(monster + 0x40)
    /* 14340 8014DF38 21082400 */  addu       $at, $at, $a0
    /* 14344 8014DF3C D4532280 */  lb         $v0, %lo(monster + 0x40)($at)
    /* 14348 8014DF40 00000000 */  nop
    /* 1434C 8014DF44 07006214 */  bne        $v1, $v0, .L8014DF64
    /* 14350 8014DF48 21100000 */   addu      $v0, $zero, $zero
    /* 14354 8014DF4C 1080013C */  lui        $at, %hi(monster + 0x3C)
    /* 14358 8014DF50 21082400 */  addu       $at, $at, $a0
    /* 1435C 8014DF54 D0532580 */  lb         $a1, %lo(monster + 0x3C)($at)
    /* 14360 8014DF58 9CFF010C */  jal        M_StartStand__Fii
    /* 14364 8014DF5C 21200002 */   addu      $a0, $s0, $zero
    /* 14368 8014DF60 01000224 */  addiu      $v0, $zero, 0x1
  .L8014DF64:
    /* 1436C 8014DF64 2C00BF8F */  lw         $ra, 0x2C($sp)
    /* 14370 8014DF68 2800B08F */  lw         $s0, 0x28($sp)
    /* 14374 8014DF6C 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 14378 8014DF70 0800E003 */  jr         $ra
    /* 1437C 8014DF74 00000000 */   nop
endlabel M_DoRSpAttack__Fi
