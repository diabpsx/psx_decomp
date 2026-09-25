.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching eacloadfilecallback, 0x188

glabel eacloadfilecallback
    /* 19614 80029614 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 19618 80029618 2000B2AF */  sw         $s2, 0x20($sp)
    /* 1961C 8002961C 21908000 */  addu       $s2, $a0, $zero
    /* 19620 80029620 2800B4AF */  sw         $s4, 0x28($sp)
    /* 19624 80029624 21A0A000 */  addu       $s4, $a1, $zero
    /* 19628 80029628 1800B0AF */  sw         $s0, 0x18($sp)
    /* 1962C 8002962C 2180E000 */  addu       $s0, $a3, $zero
    /* 19630 80029630 2C00BFAF */  sw         $ra, 0x2C($sp)
    /* 19634 80029634 2400B3AF */  sw         $s3, 0x24($sp)
    /* 19638 80029638 4E004012 */  beqz       $s2, .L80029774
    /* 1963C 8002963C 1C00B1AF */   sw        $s1, 0x1C($sp)
    /* 19640 80029640 45A5000C */  jal        iscrcblock
    /* 19644 80029644 00000000 */   nop
    /* 19648 80029648 21984000 */  addu       $s3, $v0, $zero
    /* 1964C 8002964C 18006016 */  bnez       $s3, .L800296B0
    /* 19650 80029650 00000000 */   nop
    /* 19654 80029654 141D828F */  lw         $v0, %gp_rel(crcrequired)($gp)
    /* 19658 80029658 00000000 */  nop
    /* 1965C 8002965C 12004010 */  beqz       $v0, .L800296A8
    /* 19660 80029660 00000000 */   nop
    /* 19664 80029664 EFAD000C */  jal        getblocklen
    /* 19668 80029668 21204002 */   addu      $a0, $s2, $zero
    /* 1966C 8002966C 3C000012 */  beqz       $s0, .L80029760
    /* 19670 80029670 21304000 */   addu      $a2, $v0, $zero
    /* 19674 80029674 1180043C */  lui        $a0, %hi(D_8010F294)
    /* 19678 80029678 94F28424 */  addiu      $a0, $a0, %lo(D_8010F294)
    /* 1967C 8002967C 1180023C */  lui        $v0, %hi(D_8010F284)
    /* 19680 80029680 84F24224 */  addiu      $v0, $v0, %lo(D_8010F284)
    /* 19684 80029684 1280013C */  lui        $at, %hi(abortfile)
    /* 19688 80029688 B8C322AC */  sw         $v0, %lo(abortfile)($at)
    /* 1968C 8002968C 59000224 */  addiu      $v0, $zero, 0x59
    /* 19690 80029690 1280013C */  lui        $at, %hi(abortline)
    /* 19694 80029694 BCC322AC */  sw         $v0, %lo(abortline)($at)
    /* 19698 80029698 0F95000C */  jal        abortmessage
    /* 1969C 8002969C 21288002 */   addu      $a1, $s4, $zero
    /* 196A0 800296A0 D8A50008 */  j          .L80029760
    /* 196A4 800296A4 00000000 */   nop
  .L800296A8:
    /* 196A8 800296A8 D8A50008 */  j          .L80029760
    /* 196AC 800296AC 01001324 */   addiu     $s3, $zero, 0x1
  .L800296B0:
    /* 196B0 800296B0 64A5000C */  jal        checkcrcblock
    /* 196B4 800296B4 21204002 */   addu      $a0, $s2, $zero
    /* 196B8 800296B8 21984000 */  addu       $s3, $v0, $zero
    /* 196BC 800296BC 21006016 */  bnez       $s3, .L80029744
    /* 196C0 800296C0 00000000 */   nop
    /* 196C4 800296C4 26000012 */  beqz       $s0, .L80029760
    /* 196C8 800296C8 00000000 */   nop
    /* 196CC 800296CC E9AD000C */  jal        getblockadr
    /* 196D0 800296D0 21204002 */   addu      $a0, $s2, $zero
    /* 196D4 800296D4 21204002 */  addu       $a0, $s2, $zero
    /* 196D8 800296D8 EFAD000C */  jal        getblocklen
    /* 196DC 800296DC 21884000 */   addu      $s1, $v0, $zero
    /* 196E0 800296E0 21804000 */  addu       $s0, $v0, $zero
    /* 196E4 800296E4 21203002 */  addu       $a0, $s1, $s0
    /* 196E8 800296E8 FCFF8424 */  addiu      $a0, $a0, -0x4
    /* 196EC 800296EC D3B2000C */  jal        geti
    /* 196F0 800296F0 04000524 */   addiu     $a1, $zero, 0x4
    /* 196F4 800296F4 21202002 */  addu       $a0, $s1, $zero
    /* 196F8 800296F8 F4FF0526 */  addiu      $a1, $s0, -0xC
    /* 196FC 800296FC EDA5000C */  jal        crc16
    /* 19700 80029700 21884000 */   addu      $s1, $v0, $zero
    /* 19704 80029704 1180043C */  lui        $a0, %hi(D_8010F2D4)
    /* 19708 80029708 D4F28424 */  addiu      $a0, $a0, %lo(D_8010F2D4)
    /* 1970C 8002970C 21288002 */  addu       $a1, $s4, $zero
    /* 19710 80029710 21300002 */  addu       $a2, $s0, $zero
    /* 19714 80029714 1180033C */  lui        $v1, %hi(D_8010F284)
    /* 19718 80029718 84F26324 */  addiu      $v1, $v1, %lo(D_8010F284)
    /* 1971C 8002971C 1280013C */  lui        $at, %hi(abortfile)
    /* 19720 80029720 B8C323AC */  sw         $v1, %lo(abortfile)($at)
    /* 19724 80029724 6B000324 */  addiu      $v1, $zero, 0x6B
    /* 19728 80029728 21382002 */  addu       $a3, $s1, $zero
    /* 1972C 8002972C 1280013C */  lui        $at, %hi(abortline)
    /* 19730 80029730 BCC323AC */  sw         $v1, %lo(abortline)($at)
    /* 19734 80029734 0F95000C */  jal        abortmessage
    /* 19738 80029738 1000A2AF */   sw        $v0, 0x10($sp)
    /* 1973C 8002973C D8A50008 */  j          .L80029760
    /* 19740 80029740 00000000 */   nop
  .L80029744:
    /* 19744 80029744 EFAD000C */  jal        getblocklen
    /* 19748 80029748 21204002 */   addu      $a0, $s2, $zero
    /* 1974C 8002974C 101D858F */  lw         $a1, %gp_rel(crcresize)($gp)
    /* 19750 80029750 21204002 */  addu       $a0, $s2, $zero
    /* 19754 80029754 21300002 */  addu       $a2, $s0, $zero
    /* 19758 80029758 FAAF000C */  jal        resizememblocka
    /* 1975C 8002975C 23284500 */   subu      $a1, $v0, $a1
  .L80029760:
    /* 19760 80029760 05006016 */  bnez       $s3, .L80029778
    /* 19764 80029764 21104002 */   addu      $v0, $s2, $zero
    /* 19768 80029768 C3AB000C */  jal        purgememblock
    /* 1976C 8002976C 21204002 */   addu      $a0, $s2, $zero
    /* 19770 80029770 21900000 */  addu       $s2, $zero, $zero
  .L80029774:
    /* 19774 80029774 21104002 */  addu       $v0, $s2, $zero
  .L80029778:
    /* 19778 80029778 2C00BF8F */  lw         $ra, 0x2C($sp)
    /* 1977C 8002977C 2800B48F */  lw         $s4, 0x28($sp)
    /* 19780 80029780 2400B38F */  lw         $s3, 0x24($sp)
    /* 19784 80029784 2000B28F */  lw         $s2, 0x20($sp)
    /* 19788 80029788 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 1978C 8002978C 1800B08F */  lw         $s0, 0x18($sp)
    /* 19790 80029790 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 19794 80029794 0800E003 */  jr         $ra
    /* 19798 80029798 00000000 */   nop
endlabel eacloadfilecallback
