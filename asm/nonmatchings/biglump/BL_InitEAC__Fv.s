.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching BL_InitEAC__Fv, 0xF8

glabel BL_InitEAC__Fv
    /* 7725C 8008725C E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 77260 80087260 01000224 */  addiu      $v0, $zero, 0x1
    /* 77264 80087264 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 77268 80087268 1800B0AF */  sw         $s0, 0x18($sp)
    /* 7726C 8008726C F10380A3 */  sb         $zero, %gp_rel(NoQuedAsyncs)($gp)
    /* 77270 80087270 F20382A3 */  sb         $v0, %gp_rel(CurrAsync)($gp)
    /* 77274 80087274 1280013C */  lui        $at, %hi(disablecd)
    /* 77278 80087278 2CC520AC */  sw         $zero, %lo(disablecd)($at)
    /* 7727C 8008727C 4F46000C */  jal        FlushCache
    /* 77280 80087280 00000000 */   nop
    /* 77284 80087284 1280023C */  lui        $v0, %hi(disablecd)
    /* 77288 80087288 2CC5428C */  lw         $v0, %lo(disablecd)($v0)
    /* 7728C 8008728C 0B80103C */  lui        $s0, %hi(EAC_DirectoryCache)
    /* 77290 80087290 C4791026 */  addiu      $s0, $s0, %lo(EAC_DirectoryCache)
    /* 77294 80087294 03004014 */  bnez       $v0, .L800872A4
    /* 77298 80087298 00000000 */   nop
    /* 7729C 8008729C 919C000C */  jal        initpsxcdrom
    /* 772A0 800872A0 00000000 */   nop
  .L800872A4:
    /* 772A4 800872A4 9F48000C */  jal        ResetCallback
    /* 772A8 800872A8 00000000 */   nop
    /* 772AC 800872AC 1280043C */  lui        $a0, %hi(timerhz)
    /* 772B0 800872B0 9CC5848C */  lw         $a0, %lo(timerhz)($a0)
    /* 772B4 800872B4 41BF000C */  jal        inittimer
    /* 772B8 800872B8 00000000 */   nop
    /* 772BC 800872BC 1280023C */  lui        $v0, %hi(disablecd)
    /* 772C0 800872C0 2CC5428C */  lw         $v0, %lo(disablecd)($v0)
    /* 772C4 800872C4 00000000 */  nop
    /* 772C8 800872C8 12004014 */  bnez       $v0, .L80087314
    /* 772CC 800872CC 00000000 */   nop
    /* 772D0 800872D0 1280043C */  lui        $a0, %hi(D_8011AB74)
    /* 772D4 800872D4 74AB8424 */  addiu      $a0, $a0, %lo(D_8011AB74)
    /* 772D8 800872D8 46A2000C */  jal        setdirectory
    /* 772DC 800872DC 00000000 */   nop
    /* 772E0 800872E0 21200002 */  addu       $a0, $s0, $zero
    /* 772E4 800872E4 A0B1000C */  jal        blockclear
    /* 772E8 800872E8 90010524 */   addiu     $a1, $zero, 0x190
    /* 772EC 800872EC 21200002 */  addu       $a0, $s0, $zero
    /* 772F0 800872F0 759F000C */  jal        setdirectorycache
    /* 772F4 800872F4 14000524 */   addiu     $a1, $zero, 0x14
    /* 772F8 800872F8 1280043C */  lui        $a0, %hi(D_8011AB7C)
    /* 772FC 800872FC 7CAB8424 */  addiu      $a0, $a0, %lo(D_8011AB7C)
    /* 77300 80087300 1000A527 */  addiu      $a1, $sp, 0x10
    /* 77304 80087304 F79F000C */  jal        cdromdirectoryentry
    /* 77308 80087308 1400A627 */   addiu     $a2, $sp, 0x14
    /* 7730C 8008730C C91C0208 */  j          .L80087324
    /* 77310 80087310 00000000 */   nop
  .L80087314:
    /* 77314 80087314 1280043C */  lui        $a0, %hi(D_8011AB84)
    /* 77318 80087318 84AB8424 */  addiu      $a0, $a0, %lo(D_8011AB84)
    /* 7731C 8008731C 46A2000C */  jal        setdirectory
    /* 77320 80087320 00000000 */   nop
  .L80087324:
    /* 77324 80087324 E7A5000C */  jal        initloadfilecallback
    /* 77328 80087328 00000000 */   nop
    /* 7732C 8008732C 0380043C */  lui        $a0, %hi(ioreader)
    /* 77330 80087330 F8928424 */  addiu      $a0, $a0, %lo(ioreader)
    /* 77334 80087334 21280000 */  addu       $a1, $zero, $zero
    /* 77338 80087338 F5BD000C */  jal        addsystemtask
    /* 7733C 8008733C 21300000 */   addu      $a2, $zero, $zero
    /* 77340 80087340 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 77344 80087344 1800B08F */  lw         $s0, 0x18($sp)
    /* 77348 80087348 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 7734C 8008734C 0800E003 */  jr         $ra
    /* 77350 80087350 00000000 */   nop
endlabel BL_InitEAC__Fv
