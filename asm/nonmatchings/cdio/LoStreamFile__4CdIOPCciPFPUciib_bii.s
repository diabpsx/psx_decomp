.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching LoStreamFile__4CdIOPCciPFPUciib_bii, 0x228

glabel LoStreamFile__4CdIOPCciPFPUciib_bii
    /* 76EE4 80086EE4 B0FFBD27 */  addiu      $sp, $sp, -0x50
    /* 76EE8 80086EE8 3000B2AF */  sw         $s2, 0x30($sp)
    /* 76EEC 80086EEC 6400B28F */  lw         $s2, 0x64($sp)
    /* 76EF0 80086EF0 3400B3AF */  sw         $s3, 0x34($sp)
    /* 76EF4 80086EF4 6000B38F */  lw         $s3, 0x60($sp)
    /* 76EF8 80086EF8 2C00B1AF */  sw         $s1, 0x2C($sp)
    /* 76EFC 80086EFC 2188A000 */  addu       $s1, $a1, $zero
    /* 76F00 80086F00 3C00B5AF */  sw         $s5, 0x3C($sp)
    /* 76F04 80086F04 21A8C000 */  addu       $s5, $a2, $zero
    /* 76F08 80086F08 4000B6AF */  sw         $s6, 0x40($sp)
    /* 76F0C 80086F0C 21B00000 */  addu       $s6, $zero, $zero
    /* 76F10 80086F10 4C00BFAF */  sw         $ra, 0x4C($sp)
    /* 76F14 80086F14 4800BEAF */  sw         $fp, 0x48($sp)
    /* 76F18 80086F18 4400B7AF */  sw         $s7, 0x44($sp)
    /* 76F1C 80086F1C 3800B4AF */  sw         $s4, 0x38($sp)
    /* 76F20 80086F20 2800B0AF */  sw         $s0, 0x28($sp)
    /* 76F24 80086F24 0600401E */  bgtz       $s2, .L80086F40
    /* 76F28 80086F28 1000A7AF */   sw        $a3, 0x10($sp)
    /* 76F2C 80086F2C 21200000 */  addu       $a0, $zero, $zero
    /* 76F30 80086F30 1180053C */  lui        $a1, %hi(D_80110214)
    /* 76F34 80086F34 1402A524 */  addiu      $a1, $a1, %lo(D_80110214)
    /* 76F38 80086F38 A583000C */  jal        DBG_Error
    /* 76F3C 80086F3C 2E010624 */   addiu     $a2, $zero, 0x12E
  .L80086F40:
    /* 76F40 80086F40 0500A01E */  bgtz       $s5, .L80086F58
    /* 76F44 80086F44 21200000 */   addu      $a0, $zero, $zero
    /* 76F48 80086F48 1180053C */  lui        $a1, %hi(D_80110214)
    /* 76F4C 80086F4C 1402A524 */  addiu      $a1, $a1, %lo(D_80110214)
    /* 76F50 80086F50 A583000C */  jal        DBG_Error
    /* 76F54 80086F54 2F010624 */   addiu     $a2, $zero, 0x12F
  .L80086F58:
    /* 76F58 80086F58 1280023C */  lui        $v0, %hi(CDWAIT)
    /* 76F5C 80086F5C ECAD428C */  lw         $v0, %lo(CDWAIT)($v0)
    /* 76F60 80086F60 00000000 */  nop
    /* 76F64 80086F64 05004010 */  beqz       $v0, .L80086F7C
    /* 76F68 80086F68 01001E24 */   addiu     $fp, $zero, 0x1
    /* 76F6C 80086F6C 9291020C */  jal        IsGameLoading__Fv
    /* 76F70 80086F70 00000000 */   nop
    /* 76F74 80086F74 01004238 */  xori       $v0, $v0, 0x1
    /* 76F78 80086F78 01005E2C */  sltiu      $fp, $v0, 0x1
  .L80086F7C:
    /* 76F7C 80086F7C 21202002 */  addu       $a0, $s1, $zero
    /* 76F80 80086F80 2180C003 */  addu       $s0, $fp, $zero
    /* 76F84 80086F84 FE1E020C */  jal        BL_FileExists__FPcc
    /* 76F88 80086F88 21280002 */   addu      $a1, $s0, $zero
    /* 76F8C 80086F8C 07004014 */  bnez       $v0, .L80086FAC
    /* 76F90 80086F90 00801534 */   ori       $s5, $zero, 0x8000
    /* 76F94 80086F94 21200000 */  addu       $a0, $zero, $zero
    /* 76F98 80086F98 1180053C */  lui        $a1, %hi(D_80110214)
    /* 76F9C 80086F9C 1402A524 */  addiu      $a1, $a1, %lo(D_80110214)
    /* 76FA0 80086FA0 A583000C */  jal        DBG_Error
    /* 76FA4 80086FA4 3C010624 */   addiu     $a2, $zero, 0x13C
    /* 76FA8 80086FA8 00801534 */  ori        $s5, $zero, 0x8000
  .L80086FAC:
    /* 76FAC 80086FAC 21202002 */  addu       $a0, $s1, $zero
    /* 76FB0 80086FB0 6820020C */  jal        BL_OpenStreamFile__FPcc
    /* 76FB4 80086FB4 21280002 */   addu      $a1, $s0, $zero
    /* 76FB8 80086FB8 21B84000 */  addu       $s7, $v0, $zero
    /* 76FBC 80086FBC 0500E016 */  bnez       $s7, .L80086FD4
    /* 76FC0 80086FC0 21200000 */   addu      $a0, $zero, $zero
    /* 76FC4 80086FC4 1180053C */  lui        $a1, %hi(D_80110214)
    /* 76FC8 80086FC8 1402A524 */  addiu      $a1, $a1, %lo(D_80110214)
    /* 76FCC 80086FCC A583000C */  jal        DBG_Error
    /* 76FD0 80086FD0 42010624 */   addiu     $a2, $zero, 0x142
  .L80086FD4:
    /* 76FD4 80086FD4 2000B2AF */  sw         $s2, 0x20($sp)
    /* 76FD8 80086FD8 0C00E28E */  lw         $v0, 0xC($s7)
    /* 76FDC 80086FDC 0C80033C */  lui        $v1, %hi(SFXTab + 0xEC)
    /* 76FE0 80086FE0 CC9C638C */  lw         $v1, %lo(SFXTab + 0xEC)($v1)
    /* 76FE4 80086FE4 21985300 */  addu       $s3, $v0, $s3
    /* 76FE8 80086FE8 04007326 */  addiu      $s3, $s3, 0x4
    /* 76FEC 80086FEC 1800A3AF */  sw         $v1, 0x18($sp)
  .L80086FF0:
    /* 76FF0 80086FF0 3600401A */  blez       $s2, .L800870CC
    /* 76FF4 80086FF4 2A10B202 */   slt       $v0, $s5, $s2
    /* 76FF8 80086FF8 1800B48F */  lw         $s4, 0x18($sp)
    /* 76FFC 80086FFC 02004010 */  beqz       $v0, .L80087008
    /* 77000 80087000 21884002 */   addu      $s1, $s2, $zero
    /* 77004 80087004 2188A002 */  addu       $s1, $s5, $zero
  .L80087008:
    /* 77008 80087008 01000224 */  addiu      $v0, $zero, 0x1
    /* 7700C 8008700C 0B80043C */  lui        $a0, %hi(STREAM_BIN)
    /* 77010 80087010 B4798424 */  addiu      $a0, $a0, %lo(STREAM_BIN)
    /* 77014 80087014 0300C217 */  bne        $fp, $v0, .L80087024
    /* 77018 80087018 00000000 */   nop
    /* 7701C 8008701C 1180043C */  lui        $a0, %hi(D_80110224)
    /* 77020 80087020 24028424 */  addiu      $a0, $a0, %lo(D_80110224)
  .L80087024:
    /* 77024 80087024 698F000C */  jal        setasyncfile
    /* 77028 80087028 00000000 */   nop
    /* 7702C 8008702C 21206002 */  addu       $a0, $s3, $zero
    /* 77030 80087030 21288002 */  addu       $a1, $s4, $zero
    /* 77034 80087034 3690000C */  jal        asyncloadsegment
    /* 77038 80087038 21302002 */   addu      $a2, $s1, $zero
    /* 7703C 8008703C 21804000 */  addu       $s0, $v0, $zero
  .L80087040:
    /* 77040 80087040 53BE000C */  jal        systemtask
    /* 77044 80087044 21200000 */   addu      $a0, $zero, $zero
    /* 77048 80087048 DB93000C */  jal        getasyncreadstatus
    /* 7704C 8008704C 21200002 */   addu      $a0, $s0, $zero
    /* 77050 80087050 FF004230 */  andi       $v0, $v0, 0xFF
    /* 77054 80087054 FAFF4010 */  beqz       $v0, .L80087040
    /* 77058 80087058 00000000 */   nop
    /* 7705C 8008705C 9A90000C */  jal        cancelasyncload
    /* 77060 80087060 21200002 */   addu      $a0, $s0, $zero
    /* 77064 80087064 21208002 */  addu       $a0, $s4, $zero
    /* 77068 80087068 2000A38F */  lw         $v1, 0x20($sp)
    /* 7706C 8008706C 21302002 */  addu       $a2, $s1, $zero
    /* 77070 80087070 23287200 */  subu       $a1, $v1, $s2
    /* 77074 80087074 1000A38F */  lw         $v1, 0x10($sp)
    /* 77078 80087078 00000000 */  nop
    /* 7707C 8008707C 09F86000 */  jalr       $v1
    /* 77080 80087080 0100472E */   sltiu     $a3, $s2, 0x1
    /* 77084 80087084 23905102 */  subu       $s2, $s2, $s1
    /* 77088 80087088 1000401A */  blez       $s2, .L800870CC
    /* 7708C 8008708C 21987102 */   addu      $s3, $s3, $s1
    /* 77090 80087090 0300C232 */  andi       $v0, $s6, 0x3
    /* 77094 80087094 09004014 */  bnez       $v0, .L800870BC
    /* 77098 80087098 00000000 */   nop
    /* 7709C 8008709C 9291020C */  jal        IsGameLoading__Fv
    /* 770A0 800870A0 00000000 */   nop
    /* 770A4 800870A4 05004010 */  beqz       $v0, .L800870BC
    /* 770A8 800870A8 00000000 */   nop
    /* 770AC 800870AC 5F91020C */  jal        UPDATEPROGRESS__Fi
    /* 770B0 800870B0 04000424 */   addiu     $a0, $zero, 0x4
    /* 770B4 800870B4 FC1B0208 */  j          .L80086FF0
    /* 770B8 800870B8 0100D626 */   addiu     $s6, $s6, 0x1
  .L800870BC:
    /* 770BC 800870BC EE80000C */  jal        TSK_Sleep
    /* 770C0 800870C0 01000424 */   addiu     $a0, $zero, 0x1
    /* 770C4 800870C4 FC1B0208 */  j          .L80086FF0
    /* 770C8 800870C8 0100D626 */   addiu     $s6, $s6, 0x1
  .L800870CC:
    /* 770CC 800870CC 7320020C */  jal        BL_CloseStreamFile__FP6STRHDR
    /* 770D0 800870D0 2120E002 */   addu      $a0, $s7, $zero
    /* 770D4 800870D4 01000224 */  addiu      $v0, $zero, 0x1
    /* 770D8 800870D8 4C00BF8F */  lw         $ra, 0x4C($sp)
    /* 770DC 800870DC 4800BE8F */  lw         $fp, 0x48($sp)
    /* 770E0 800870E0 4400B78F */  lw         $s7, 0x44($sp)
    /* 770E4 800870E4 4000B68F */  lw         $s6, 0x40($sp)
    /* 770E8 800870E8 3C00B58F */  lw         $s5, 0x3C($sp)
    /* 770EC 800870EC 3800B48F */  lw         $s4, 0x38($sp)
    /* 770F0 800870F0 3400B38F */  lw         $s3, 0x34($sp)
    /* 770F4 800870F4 3000B28F */  lw         $s2, 0x30($sp)
    /* 770F8 800870F8 2C00B18F */  lw         $s1, 0x2C($sp)
    /* 770FC 800870FC 2800B08F */  lw         $s0, 0x28($sp)
    /* 77100 80087100 5000BD27 */  addiu      $sp, $sp, 0x50
    /* 77104 80087104 0800E003 */  jr         $ra
    /* 77108 80087108 00000000 */   nop
endlabel LoStreamFile__4CdIOPCciPFPUciib_bii
