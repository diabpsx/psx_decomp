.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching Iasyncreadcallback, 0x384

glabel Iasyncreadcallback
    /* 17744 80027744 B0FEBD27 */  addiu      $sp, $sp, -0x150
    /* 17748 80027748 4001B0AF */  sw         $s0, 0x140($sp)
    /* 1774C 8002774C 21808000 */  addu       $s0, $a0, $zero
    /* 17750 80027750 3801A427 */  addiu      $a0, $sp, 0x138
    /* 17754 80027754 4801BFAF */  sw         $ra, 0x148($sp)
    /* 17758 80027758 01C0000C */  jal        savegp_ci
    /* 1775C 8002775C 4401B1AF */   sw        $s1, 0x144($sp)
    /* 17760 80027760 901C828F */  lw         $v0, %gp_rel(cdcallbacks)($gp)
    /* 17764 80027764 00000000 */  nop
    /* 17768 80027768 01004224 */  addiu      $v0, $v0, 0x1
    /* 1776C 8002776C 901C82AF */  sw         $v0, %gp_rel(cdcallbacks)($gp)
    /* 17770 80027770 901C828F */  lw         $v0, %gp_rel(cdcallbacks)($gp)
    /* 17774 80027774 981C828F */  lw         $v0, %gp_rel(asyncpausereq)($gp)
    /* 17778 80027778 00000000 */  nop
    /* 1777C 8002777C 0A004010 */  beqz       $v0, .L800277A8
    /* 17780 80027780 00000000 */   nop
    /* 17784 80027784 0C23828F */  lw         $v0, %gp_rel(asyncsectors)($gp)
    /* 17788 80027788 00000000 */  nop
    /* 1778C 8002778C 06004014 */  bnez       $v0, .L800277A8
    /* 17790 80027790 00000000 */   nop
    /* 17794 80027794 916B000C */  jal        CdReadyCallback
    /* 17798 80027798 21200000 */   addu      $a0, $zero, $zero
    /* 1779C 8002779C 3801A48F */  lw         $a0, 0x138($sp)
    /* 177A0 800277A0 AA9E0008 */  j          .L80027AA8
    /* 177A4 800277A4 00000000 */   nop
  .L800277A8:
    /* 177A8 800277A8 7C1C828F */  lw         $v0, %gp_rel(cdreadybusy)($gp)
    /* 177AC 800277AC 00000000 */  nop
    /* 177B0 800277B0 01004224 */  addiu      $v0, $v0, 0x1
    /* 177B4 800277B4 7C1C82AF */  sw         $v0, %gp_rel(cdreadybusy)($gp)
    /* 177B8 800277B8 7C1C828F */  lw         $v0, %gp_rel(cdreadybusy)($gp)
    /* 177BC 800277BC 01000324 */  addiu      $v1, $zero, 0x1
    /* 177C0 800277C0 0D004310 */  beq        $v0, $v1, .L800277F8
    /* 177C4 800277C4 00000000 */   nop
    /* 177C8 800277C8 06000316 */  bne        $s0, $v1, .L800277E4
    /* 177CC 800277CC 00000000 */   nop
    /* 177D0 800277D0 881C828F */  lw         $v0, %gp_rel(cdreentcount)($gp)
    /* 177D4 800277D4 00000000 */  nop
    /* 177D8 800277D8 01004224 */  addiu      $v0, $v0, 0x1
    /* 177DC 800277DC 881C82AF */  sw         $v0, %gp_rel(cdreentcount)($gp)
    /* 177E0 800277E0 881C828F */  lw         $v0, %gp_rel(cdreentcount)($gp)
  .L800277E4:
    /* 177E4 800277E4 3801A48F */  lw         $a0, 0x138($sp)
    /* 177E8 800277E8 90010224 */  addiu      $v0, $zero, 0x190
    /* 177EC 800277EC 781C82AF */  sw         $v0, %gp_rel(asynctimeout)($gp)
    /* 177F0 800277F0 AA9E0008 */  j          .L80027AA8
    /* 177F4 800277F4 00000000 */   nop
  .L800277F8:
    /* 177F8 800277F8 95000216 */  bne        $s0, $v0, .L80027A50
    /* 177FC 800277FC 05000224 */   addiu     $v0, $zero, 0x5
    /* 17800 80027800 0C23828F */  lw         $v0, %gp_rel(asyncsectors)($gp)
    /* 17804 80027804 00000000 */  nop
    /* 17808 80027808 51004010 */  beqz       $v0, .L80027950
    /* 1780C 8002780C 00000000 */   nop
    /* 17810 80027810 EBBE000C */  jal        getcycle
    /* 17814 80027814 00000000 */   nop
    /* 17818 80027818 1000A427 */  addiu      $a0, $sp, 0x10
    /* 1781C 8002781C 03000524 */  addiu      $a1, $zero, 0x3
    /* 17820 80027820 A01C82AF */  sw         $v0, %gp_rel(cdcallbacktime)($gp)
    /* 17824 80027824 8D6C000C */  jal        CdGetSector
    /* 17828 80027828 00000000 */   nop
    /* 1782C 8002782C CC22848F */  lw         $a0, %gp_rel(asyncmemadr)($gp)
    /* 17830 80027830 8D6C000C */  jal        CdGetSector
    /* 17834 80027834 00020524 */   addiu     $a1, $zero, 0x200
    /* 17838 80027838 1C00A427 */  addiu      $a0, $sp, 0x1C
    /* 1783C 8002783C 8D6C000C */  jal        CdGetSector
    /* 17840 80027840 46000524 */   addiu     $a1, $zero, 0x46
    /* 17844 80027844 A66C000C */  jal        CdDataSync
    /* 17848 80027848 21200000 */   addu      $a0, $zero, $zero
    /* 1784C 8002784C EBBE000C */  jal        getcycle
    /* 17850 80027850 00000000 */   nop
    /* 17854 80027854 A01C838F */  lw         $v1, %gp_rel(cdcallbacktime)($gp)
    /* 17858 80027858 00000000 */  nop
    /* 1785C 8002785C 23104300 */  subu       $v0, $v0, $v1
    /* 17860 80027860 A01C82AF */  sw         $v0, %gp_rel(cdcallbacktime)($gp)
    /* 17864 80027864 A01C828F */  lw         $v0, %gp_rel(cdcallbacktime)($gp)
    /* 17868 80027868 00000000 */  nop
    /* 1786C 8002786C 05004104 */  bgez       $v0, .L80027884
    /* 17870 80027870 00000000 */   nop
    /* 17874 80027874 A01C828F */  lw         $v0, %gp_rel(cdcallbacktime)($gp)
    /* 17878 80027878 0100033C */  lui        $v1, (0x10000 >> 16)
    /* 1787C 8002787C 21104300 */  addu       $v0, $v0, $v1
    /* 17880 80027880 A01C82AF */  sw         $v0, %gp_rel(cdcallbacktime)($gp)
  .L80027884:
    /* 17884 80027884 2D9C000C */  jal        timetosector
    /* 17888 80027888 1000A427 */   addiu     $a0, $sp, 0x10
    /* 1788C 8002788C E422838F */  lw         $v1, %gp_rel(asyncsector)($gp)
    /* 17890 80027890 00000000 */  nop
    /* 17894 80027894 1E004314 */  bne        $v0, $v1, .L80027910
    /* 17898 80027898 00000000 */   nop
    /* 1789C 8002789C 0C23828F */  lw         $v0, %gp_rel(asyncsectors)($gp)
    /* 178A0 800278A0 00000000 */  nop
    /* 178A4 800278A4 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 178A8 800278A8 0C2382AF */  sw         $v0, %gp_rel(asyncsectors)($gp)
    /* 178AC 800278AC 0C23828F */  lw         $v0, %gp_rel(asyncsectors)($gp)
    /* 178B0 800278B0 E422828F */  lw         $v0, %gp_rel(asyncsector)($gp)
    /* 178B4 800278B4 00000000 */  nop
    /* 178B8 800278B8 01004224 */  addiu      $v0, $v0, 0x1
    /* 178BC 800278BC E42282AF */  sw         $v0, %gp_rel(asyncsector)($gp)
    /* 178C0 800278C0 E422828F */  lw         $v0, %gp_rel(asyncsector)($gp)
    /* 178C4 800278C4 3C23828F */  lw         $v0, %gp_rel(currentsector)($gp)
    /* 178C8 800278C8 00000000 */  nop
    /* 178CC 800278CC 01004224 */  addiu      $v0, $v0, 0x1
    /* 178D0 800278D0 3C2382AF */  sw         $v0, %gp_rel(currentsector)($gp)
    /* 178D4 800278D4 3C23828F */  lw         $v0, %gp_rel(currentsector)($gp)
    /* 178D8 800278D8 CC22828F */  lw         $v0, %gp_rel(asyncmemadr)($gp)
    /* 178DC 800278DC 0C23838F */  lw         $v1, %gp_rel(asyncsectors)($gp)
    /* 178E0 800278E0 00084224 */  addiu      $v0, $v0, 0x800
    /* 178E4 800278E4 CC2282AF */  sw         $v0, %gp_rel(asyncmemadr)($gp)
    /* 178E8 800278E8 0600601C */  bgtz       $v1, .L80027904
    /* 178EC 800278EC 90010224 */   addiu     $v0, $zero, 0x190
    /* 178F0 800278F0 D422828F */  lw         $v0, %gp_rel(asyncreadcallbackfunc)($gp)
    /* 178F4 800278F4 00000000 */  nop
    /* 178F8 800278F8 09F84000 */  jalr       $v0
    /* 178FC 800278FC 21200000 */   addu      $a0, $zero, $zero
    /* 17900 80027900 90010224 */  addiu      $v0, $zero, 0x190
  .L80027904:
    /* 17904 80027904 781C82AF */  sw         $v0, %gp_rel(asynctimeout)($gp)
    /* 17908 80027908 A39E0008 */  j          .L80027A8C
    /* 1790C 8002790C 00000000 */   nop
  .L80027910:
    /* 17910 80027910 941C828F */  lw         $v0, %gp_rel(asyncreadreq)($gp)
    /* 17914 80027914 00000000 */  nop
    /* 17918 80027918 05004014 */  bnez       $v0, .L80027930
    /* 1791C 8002791C 00000000 */   nop
    /* 17920 80027920 809D000C */  jal        asyncinitread
    /* 17924 80027924 00000000 */   nop
    /* 17928 80027928 4D9E0008 */  j          .L80027934
    /* 1792C 8002792C 00000000 */   nop
  .L80027930:
    /* 17930 80027930 941C80AF */  sw         $zero, %gp_rel(asyncreadreq)($gp)
  .L80027934:
    /* 17934 80027934 8C1C828F */  lw         $v0, %gp_rel(cdsectorreseek)($gp)
    /* 17938 80027938 00000000 */  nop
    /* 1793C 8002793C 01004224 */  addiu      $v0, $v0, 0x1
    /* 17940 80027940 8C1C82AF */  sw         $v0, %gp_rel(cdsectorreseek)($gp)
    /* 17944 80027944 8C1C828F */  lw         $v0, %gp_rel(cdsectorreseek)($gp)
    /* 17948 80027948 A49E0008 */  j          .L80027A90
    /* 1794C 8002794C 00000000 */   nop
  .L80027950:
    /* 17950 80027950 21800000 */  addu       $s0, $zero, $zero
    /* 17954 80027954 1480113C */  lui        $s1, %hi(cdrombufsector)
    /* 17958 80027958 E09B3126 */  addiu      $s1, $s1, %lo(cdrombufsector)
    /* 1795C 8002795C 21182002 */  addu       $v1, $s1, $zero
  .L80027960:
    /* 17960 80027960 0000628C */  lw         $v0, 0x0($v1)
    /* 17964 80027964 00000000 */  nop
    /* 17968 80027968 06004010 */  beqz       $v0, .L80027984
    /* 1796C 8002796C 0400022A */   slti      $v0, $s0, 0x4
    /* 17970 80027970 01001026 */  addiu      $s0, $s0, 0x1
    /* 17974 80027974 0400022A */  slti       $v0, $s0, 0x4
    /* 17978 80027978 F9FF4014 */  bnez       $v0, .L80027960
    /* 1797C 8002797C 04006324 */   addiu     $v1, $v1, 0x4
    /* 17980 80027980 0400022A */  slti       $v0, $s0, 0x4
  .L80027984:
    /* 17984 80027984 18004010 */  beqz       $v0, .L800279E8
    /* 17988 80027988 1000A427 */   addiu     $a0, $sp, 0x10
    /* 1798C 8002798C 8D6C000C */  jal        CdGetSector
    /* 17990 80027990 03000524 */   addiu     $a1, $zero, 0x3
    /* 17994 80027994 80801000 */  sll        $s0, $s0, 2
    /* 17998 80027998 0B80013C */  lui        $at, %hi(cdrombufadr)
    /* 1799C 8002799C 21083000 */  addu       $at, $at, $s0
    /* 179A0 800279A0 F468248C */  lw         $a0, %lo(cdrombufadr)($at)
    /* 179A4 800279A4 8D6C000C */  jal        CdGetSector
    /* 179A8 800279A8 00020524 */   addiu     $a1, $zero, 0x200
    /* 179AC 800279AC 1C00A427 */  addiu      $a0, $sp, 0x1C
    /* 179B0 800279B0 8D6C000C */  jal        CdGetSector
    /* 179B4 800279B4 46000524 */   addiu     $a1, $zero, 0x46
    /* 179B8 800279B8 A66C000C */  jal        CdDataSync
    /* 179BC 800279BC 21200000 */   addu      $a0, $zero, $zero
    /* 179C0 800279C0 2D9C000C */  jal        timetosector
    /* 179C4 800279C4 1000A427 */   addiu     $a0, $sp, 0x10
    /* 179C8 800279C8 3C23838F */  lw         $v1, %gp_rel(currentsector)($gp)
    /* 179CC 800279CC 21801102 */  addu       $s0, $s0, $s1
    /* 179D0 800279D0 000002AE */  sw         $v0, 0x0($s0)
    /* 179D4 800279D4 01006324 */  addiu      $v1, $v1, 0x1
    /* 179D8 800279D8 3C2383AF */  sw         $v1, %gp_rel(currentsector)($gp)
    /* 179DC 800279DC 3C23828F */  lw         $v0, %gp_rel(currentsector)($gp)
    /* 179E0 800279E0 919E0008 */  j          .L80027A44
    /* 179E4 800279E4 00000000 */   nop
  .L800279E8:
    /* 179E8 800279E8 941C828F */  lw         $v0, %gp_rel(asyncreadreq)($gp)
    /* 179EC 800279EC 00000000 */  nop
    /* 179F0 800279F0 13004014 */  bnez       $v0, .L80027A40
    /* 179F4 800279F4 20030224 */   addiu     $v0, $zero, 0x320
    /* 179F8 800279F8 781C82AF */  sw         $v0, %gp_rel(asynctimeout)($gp)
    /* 179FC 800279FC 556B000C */  jal        CdFlush
    /* 17A00 80027A00 00000000 */   nop
    /* 17A04 80027A04 21200000 */  addu       $a0, $zero, $zero
    /* 17A08 80027A08 7C6B000C */  jal        CdSync
    /* 17A0C 80027A0C 21280000 */   addu      $a1, $zero, $zero
    /* 17A10 80027A10 3C23858F */  lw         $a1, %gp_rel(currentsector)($gp)
    /* 17A14 80027A14 1280043C */  lui        $a0, %hi(asyncloc)
    /* 17A18 80027A18 9CCA8424 */  addiu      $a0, $a0, %lo(asyncloc)
    /* 17A1C 80027A1C 4C9C000C */  jal        sectortotime
    /* 17A20 80027A20 00000000 */   nop
    /* 17A24 80027A24 1B000424 */  addiu      $a0, $zero, 0x1B
    /* 17A28 80027A28 1280053C */  lui        $a1, %hi(asyncloc)
    /* 17A2C 80027A2C 9CCAA524 */  addiu      $a1, $a1, %lo(asyncloc)
    /* 17A30 80027A30 966B000C */  jal        CdControl
    /* 17A34 80027A34 1000A627 */   addiu     $a2, $sp, 0x10
    /* 17A38 80027A38 919E0008 */  j          .L80027A44
    /* 17A3C 80027A3C 00000000 */   nop
  .L80027A40:
    /* 17A40 80027A40 941C80AF */  sw         $zero, %gp_rel(asyncreadreq)($gp)
  .L80027A44:
    /* 17A44 80027A44 781C80AF */  sw         $zero, %gp_rel(asynctimeout)($gp)
    /* 17A48 80027A48 A49E0008 */  j          .L80027A90
    /* 17A4C 80027A4C 00000000 */   nop
  .L80027A50:
    /* 17A50 80027A50 0F000216 */  bne        $s0, $v0, .L80027A90
    /* 17A54 80027A54 00000000 */   nop
    /* 17A58 80027A58 841C828F */  lw         $v0, %gp_rel(cderrorcount)($gp)
    /* 17A5C 80027A5C 00000000 */  nop
    /* 17A60 80027A60 01004224 */  addiu      $v0, $v0, 0x1
    /* 17A64 80027A64 841C82AF */  sw         $v0, %gp_rel(cderrorcount)($gp)
    /* 17A68 80027A68 841C828F */  lw         $v0, %gp_rel(cderrorcount)($gp)
    /* 17A6C 80027A6C 941C828F */  lw         $v0, %gp_rel(asyncreadreq)($gp)
    /* 17A70 80027A70 00000000 */  nop
    /* 17A74 80027A74 05004014 */  bnez       $v0, .L80027A8C
    /* 17A78 80027A78 00000000 */   nop
    /* 17A7C 80027A7C 809D000C */  jal        asyncinitread
    /* 17A80 80027A80 00000000 */   nop
    /* 17A84 80027A84 A49E0008 */  j          .L80027A90
    /* 17A88 80027A88 00000000 */   nop
  .L80027A8C:
    /* 17A8C 80027A8C 941C80AF */  sw         $zero, %gp_rel(asyncreadreq)($gp)
  .L80027A90:
    /* 17A90 80027A90 0280043C */  lui        $a0, %hi(Iasyncreadcallback)
    /* 17A94 80027A94 44778424 */  addiu      $a0, $a0, %lo(Iasyncreadcallback)
    /* 17A98 80027A98 916B000C */  jal        CdReadyCallback
    /* 17A9C 80027A9C 00000000 */   nop
    /* 17AA0 80027AA0 3801A48F */  lw         $a0, 0x138($sp)
    /* 17AA4 80027AA4 7C1C80AF */  sw         $zero, %gp_rel(cdreadybusy)($gp)
  .L80027AA8:
    /* 17AA8 80027AA8 06C0000C */  jal        restoregp
    /* 17AAC 80027AAC 00000000 */   nop
    /* 17AB0 80027AB0 4801BF8F */  lw         $ra, 0x148($sp)
    /* 17AB4 80027AB4 4401B18F */  lw         $s1, 0x144($sp)
    /* 17AB8 80027AB8 4001B08F */  lw         $s0, 0x140($sp)
    /* 17ABC 80027ABC 5001BD27 */  addiu      $sp, $sp, 0x150
    /* 17AC0 80027AC0 0800E003 */  jr         $ra
    /* 17AC4 80027AC4 00000000 */   nop
endlabel Iasyncreadcallback
