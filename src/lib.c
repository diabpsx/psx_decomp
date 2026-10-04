#include "common.h"

INCLUDE_ASM("asm/nonmatchings/lib", GTE_SetTransXYZ);

INCLUDE_ASM("asm/nonmatchings/lib", GTE_RotateFT4);

INCLUDE_ASM("asm/nonmatchings/lib", Ldv3Vec);

INCLUDE_ASM("asm/nonmatchings/lib", GTE_GetCol);

INCLUDE_ASM("asm/nonmatchings/lib", RGB);

INCLUDE_ASM("asm/nonmatchings/lib", IR0);

INCLUDE_ASM("asm/nonmatchings/lib", RGBFC);

INCLUDE_ASM("asm/nonmatchings/lib", RGBRES);

INCLUDE_ASM("asm/nonmatchings/lib", RES);

INCLUDE_ASM("asm/nonmatchings/lib", GTE_Test);

INCLUDE_ASM("asm/nonmatchings/lib", GTE_RotTrans2G4);

INCLUDE_ASM("asm/nonmatchings/lib", longjmp);

INCLUDE_ASM("asm/nonmatchings/lib", setjmp);

INCLUDE_ASM("asm/nonmatchings/lib", memset);

INCLUDE_ASM("asm/nonmatchings/lib", strcpy);

INCLUDE_ASM("asm/nonmatchings/lib", strcat);

INCLUDE_ASM("asm/nonmatchings/lib", strrchr);

INCLUDE_ASM("asm/nonmatchings/lib", strchr);

INCLUDE_ASM("asm/nonmatchings/lib", strlen2);

INCLUDE_ASM("asm/nonmatchings/lib", abs);

INCLUDE_ASM("asm/nonmatchings/lib", crunch);

INCLUDE_ASM("asm/nonmatchings/lib", func_800106D4);

INCLUDE_ASM("asm/nonmatchings/lib", func_8001097C);

INCLUDE_ASM("asm/nonmatchings/lib", func_80010A2C);

INCLUDE_ASM("asm/nonmatchings/lib", func_80010A7C);

INCLUDE_ASM("asm/nonmatchings/lib", decrunch);

INCLUDE_ASM("asm/nonmatchings/lib", func_80010D14);

INCLUDE_ASM("asm/nonmatchings/lib", func_80010D48);

INCLUDE_ASM("asm/nonmatchings/lib", SaveGP);

INCLUDE_ASM("asm/nonmatchings/lib", ReloadGP);

INCLUDE_ASM("asm/nonmatchings/lib", SetGP);

INCLUDE_ASM("asm/nonmatchings/lib", ABL_SetBlockRGBXY);

INCLUDE_ASM("asm/nonmatchings/lib", ABL_PrintPart);

INCLUDE_ASM("build/sdk/native", PCopen);

INCLUDE_ASM("build/sdk/native", PCclose);

INCLUDE_ASM("build/sdk/native", PClseek);

INCLUDE_ASM("build/sdk/native", PCcreat);

INCLUDE_ASM("build/sdk/native", __SN_ENTRY_POINT);

INCLUDE_ASM("build/sdk/native", __main);

INCLUDE_ASM("build/sdk/native", __do_global_dtors);

INCLUDE_ASM("build/sdk/native", PCinit);

INCLUDE_ASM("build/sdk/native", PCread);

INCLUDE_ASM("build/sdk/native", _SN_read);

INCLUDE_ASM("build/sdk/native", PCwrite);

INCLUDE_ASM("build/sdk/native", _SN_write);

INCLUDE_ASM("build/sdk/native", __pure_virtual);

INCLUDE_ASM("build/sdk/native", __divdi3);

INCLUDE_ASM("build/sdk/native", __builtin_delete);

INCLUDE_ASM("build/sdk/native", __udivmoddi4);

INCLUDE_ASM("build/sdk/native", InitHeap);

INCLUDE_ASM("build/sdk/native", FlushCache);

INCLUDE_ASM("build/sdk/native", _bu_init);

INCLUDE_ASM("build/sdk/native", OpenEvent);

INCLUDE_ASM("build/sdk/native", TestEvent);

INCLUDE_ASM("build/sdk/native", EnableEvent);

INCLUDE_ASM("build/sdk/native", EnterCriticalSection);

INCLUDE_ASM("build/sdk/native", ExitCriticalSection);

INCLUDE_ASM("build/sdk/native", SetSp);

INCLUDE_ASM("build/sdk/native", open);

INCLUDE_ASM("build/sdk/native", read);

INCLUDE_ASM("build/sdk/native", write);

INCLUDE_ASM("build/sdk/native", close);

INCLUDE_ASM("build/sdk/native", format);

INCLUDE_ASM("build/sdk/native", firstfile);

INCLUDE_ASM("build/sdk/native", nextfile);

INCLUDE_ASM("build/sdk/native", erase);

INCLUDE_ASM("build/sdk/native", _get_errno);

INCLUDE_ASM("build/sdk/native", ChangeClearPAD);

INCLUDE_ASM("build/sdk/native", PadInit);

INCLUDE_ASM("build/sdk/native", PadRead);

INCLUDE_ASM("build/sdk/native", PadStop);

INCLUDE_ASM("build/sdk/native", PAD_dr);

INCLUDE_ASM("build/sdk/native", SetInitPadFlag);

INCLUDE_ASM("build/sdk/native", ReadInitPadFlag);

INCLUDE_ASM("build/sdk/native", PAD_init);

INCLUDE_ASM("build/sdk/native", InitPAD);

INCLUDE_ASM("build/sdk/native", StartPAD);

INCLUDE_ASM("build/sdk/native", StopPAD);

INCLUDE_ASM("build/sdk/native", func_80011CC0);

INCLUDE_ASM("build/sdk/native", func_80011D38);

INCLUDE_ASM("build/sdk/native", InitPAD2);

INCLUDE_ASM("build/sdk/native", StartPAD2);

INCLUDE_ASM("build/sdk/native", StopPAD2);

INCLUDE_ASM("build/sdk/native", PAD_init2);

INCLUDE_ASM("build/sdk/native", SysEnqIntRP);

INCLUDE_ASM("build/sdk/native", SysDeqIntRP);

INCLUDE_ASM("build/sdk/native", EnablePAD);

INCLUDE_ASM("build/sdk/native", DisablePAD);

INCLUDE_ASM("build/sdk/native", _patch_pad);

INCLUDE_ASM("build/sdk/native", _SendPAD);

INCLUDE_ASM("build/sdk/native", _send_pad);

INCLUDE_ASM("build/sdk/native", _remove_ChgclrPAD);

INCLUDE_ASM("build/sdk/native", VSync);

INCLUDE_ASM("build/sdk/native", func_800121D4);

INCLUDE_ASM("build/sdk/native", ChangeClearRCnt);

INCLUDE_ASM("build/sdk/native", ResetCallback);

INCLUDE_ASM("build/sdk/native", InterruptCallback);

INCLUDE_ASM("build/sdk/native", DMACallback);

INCLUDE_ASM("build/sdk/native", VSyncCallback);

INCLUDE_ASM("build/sdk/native", VSyncCallbacks);

INCLUDE_ASM("build/sdk/native", StopCallback);

INCLUDE_ASM("build/sdk/native", RestartCallback);

INCLUDE_ASM("build/sdk/native", CheckCallback);

INCLUDE_ASM("build/sdk/native", GetIntrMask);

INCLUDE_ASM("build/sdk/native", SetIntrMask);

INCLUDE_ASM("build/sdk/native", func_800124E8);

INCLUDE_ASM("build/sdk/native", func_80012918);

INCLUDE_ASM("build/sdk/native", _96_remove);

INCLUDE_ASM("build/sdk/native", ReturnFromException);

INCLUDE_ASM("build/sdk/native", ResetEntryInt);

INCLUDE_ASM("build/sdk/native", HookEntryInt);

INCLUDE_ASM("build/sdk/native", startIntrVSync);

INCLUDE_ASM("build/sdk/native", func_80012A7C);

INCLUDE_ASM("build/sdk/native", startIntrDMA);

INCLUDE_ASM("build/sdk/native", func_80012D24);

INCLUDE_ASM("build/sdk/native", SetVideoMode);

INCLUDE_ASM("build/sdk/native", GetVideoMode);

INCLUDE_ASM("build/sdk/native", LoadTPage);

INCLUDE_ASM("build/sdk/native", LoadClut);

INCLUDE_ASM("build/sdk/native", LoadClut2);

INCLUDE_ASM("build/sdk/native", SetDefDrawEnv);

INCLUDE_ASM("build/sdk/native", SetDefDispEnv);

INCLUDE_ASM("build/sdk/native", GetTPage);

INCLUDE_ASM("build/sdk/native", GetClut);

INCLUDE_ASM("build/sdk/native", DumpTPage);

INCLUDE_ASM("build/sdk/native", DumpClut);

INCLUDE_ASM("build/sdk/native", NextPrim);

INCLUDE_ASM("build/sdk/native", IsEndPrim);

INCLUDE_ASM("build/sdk/native", AddPrim);

INCLUDE_ASM("build/sdk/native", AddPrims);

INCLUDE_ASM("build/sdk/native", CatPrim);

INCLUDE_ASM("build/sdk/native", TermPrim);

INCLUDE_ASM("build/sdk/native", SetSemiTrans);

INCLUDE_ASM("build/sdk/native", SetShadeTex);

INCLUDE_ASM("build/sdk/native", SetPolyF3);

INCLUDE_ASM("build/sdk/native", SetPolyFT3);

INCLUDE_ASM("build/sdk/native", SetPolyG3);

INCLUDE_ASM("build/sdk/native", SetPolyGT3);

INCLUDE_ASM("build/sdk/native", SetPolyF4);

INCLUDE_ASM("build/sdk/native", SetPolyFT4);

INCLUDE_ASM("build/sdk/native", SetPolyG4);

INCLUDE_ASM("build/sdk/native", SetPolyGT4);

INCLUDE_ASM("build/sdk/native", SetSprt8);

INCLUDE_ASM("build/sdk/native", SetSprt16);

INCLUDE_ASM("build/sdk/native", SetSprt);

INCLUDE_ASM("build/sdk/native", SetTile1);

INCLUDE_ASM("build/sdk/native", SetTile8);

INCLUDE_ASM("build/sdk/native", SetTile16);

INCLUDE_ASM("build/sdk/native", SetTile);

INCLUDE_ASM("build/sdk/native", SetLineF2);

INCLUDE_ASM("build/sdk/native", SetLineG2);

INCLUDE_ASM("build/sdk/native", SetLineF3);

INCLUDE_ASM("build/sdk/native", SetLineG3);

INCLUDE_ASM("build/sdk/native", SetLineF4);

INCLUDE_ASM("build/sdk/native", SetLineG4);

INCLUDE_ASM("build/sdk/native", SetDrawTPage);

INCLUDE_ASM("build/sdk/native", SetDrawMove);

INCLUDE_ASM("build/sdk/native", SetDrawLoad);

INCLUDE_ASM("build/sdk/native", MargePrim);

INCLUDE_ASM("build/sdk/native", DumpDrawEnv);

INCLUDE_ASM("build/sdk/native", DumpDispEnv);

INCLUDE_ASM("build/sdk/native", ResetGraph);

INCLUDE_ASM("build/sdk/native", SetGraphDebug);

INCLUDE_ASM("build/sdk/native", SetGraphQueue);

INCLUDE_ASM("build/sdk/native", GetGraphDebug);

INCLUDE_ASM("build/sdk/native", DrawSyncCallback);

INCLUDE_ASM("build/sdk/native", SetDispMask);

INCLUDE_ASM("build/sdk/native", DrawSync);

INCLUDE_ASM("build/sdk/native", func_80013AE0);

INCLUDE_ASM("build/sdk/native", ClearImage);

INCLUDE_ASM("build/sdk/native", ClearImage2);

INCLUDE_ASM("build/sdk/native", LoadImage);

INCLUDE_ASM("build/sdk/native", StoreImage);

INCLUDE_ASM("build/sdk/native", MoveImage);

INCLUDE_ASM("build/sdk/native", ClearOTag);

INCLUDE_ASM("build/sdk/native", ClearOTagR);

INCLUDE_ASM("build/sdk/native", DrawPrim);

INCLUDE_ASM("build/sdk/native", DrawOTag);

INCLUDE_ASM("build/sdk/native", PutDrawEnv);

INCLUDE_ASM("build/sdk/native", DrawOTagEnv);

INCLUDE_ASM("build/sdk/native", GetDrawEnv);

INCLUDE_ASM("build/sdk/native", PutDispEnv);

INCLUDE_ASM("build/sdk/native", GetDispEnv);

INCLUDE_ASM("build/sdk/native", GetODE);

INCLUDE_ASM("build/sdk/native", SetTexWindow);

INCLUDE_ASM("build/sdk/native", SetDrawArea);

INCLUDE_ASM("build/sdk/native", SetDrawOffset);

INCLUDE_ASM("build/sdk/native", SetPriority);

INCLUDE_ASM("build/sdk/native", SetDrawStp);

INCLUDE_ASM("build/sdk/native", SetDrawMode);

INCLUDE_ASM("build/sdk/native", SetDrawEnv);

INCLUDE_ASM("build/sdk/native", func_80014AD4);

INCLUDE_ASM("build/sdk/native", func_80014D44);

INCLUDE_ASM("build/sdk/native", func_80014D64);

INCLUDE_ASM("build/sdk/native", func_80014DFC);

INCLUDE_ASM("build/sdk/native", func_80014E94);

INCLUDE_ASM("build/sdk/native", func_80014EB0);

INCLUDE_ASM("build/sdk/native", func_8001578C);

INCLUDE_ASM("build/sdk/native", func_800157D4);

INCLUDE_ASM("build/sdk/native", func_80015828);

INCLUDE_ASM("build/sdk/native", func_80015AD8);

INCLUDE_ASM("build/sdk/native", func_80015D38);

INCLUDE_ASM("build/sdk/native", func_80015FC4);

INCLUDE_ASM("build/sdk/native", func_80015FF8);

INCLUDE_ASM("build/sdk/native", func_8001613C);

INCLUDE_ASM("build/sdk/native", LoadImage2);

INCLUDE_ASM("build/sdk/native", StoreImage2);

INCLUDE_ASM("build/sdk/native", MoveImage2);

INCLUDE_ASM("build/sdk/native", DrawOTag2);

INCLUDE_ASM("build/sdk/native", func_8001661C);

INCLUDE_ASM("build/sdk/native", GPU_cw);

INCLUDE_ASM("build/sdk/native", SpuInit);

INCLUDE_ASM("build/sdk/native", _SpuInit);

INCLUDE_ASM("build/sdk/native", SpuStart);

INCLUDE_ASM("build/sdk/native", _spu_init);

INCLUDE_ASM("build/sdk/native", func_80016A5C);

INCLUDE_ASM("build/sdk/native", _spu_FiDMA);

INCLUDE_ASM("build/sdk/native", _spu_Fr_);

INCLUDE_ASM("build/sdk/native", _spu_t);

INCLUDE_ASM("build/sdk/native", _spu_Fw);

INCLUDE_ASM("build/sdk/native", _spu_Fr);

INCLUDE_ASM("build/sdk/native", _spu_FsetRXX);

INCLUDE_ASM("build/sdk/native", _spu_FsetRXXa);

INCLUDE_ASM("build/sdk/native", _spu_FgetRXXa);

INCLUDE_ASM("build/sdk/native", _spu_FsetPCR);

INCLUDE_ASM("build/sdk/native", func_80017264);

INCLUDE_ASM("build/sdk/native", func_8001728C);

INCLUDE_ASM("build/sdk/native", _spu_Fw1ts);

INCLUDE_ASM("build/sdk/native", DeliverEvent);

INCLUDE_ASM("build/sdk/native", _SpuDataCallback);

INCLUDE_ASM("build/sdk/native", SpuInitMalloc);

INCLUDE_ASM("build/sdk/native", SpuMalloc);

INCLUDE_ASM("build/sdk/native", _spu_gcSPU);

INCLUDE_ASM("build/sdk/native", SpuFree);

INCLUDE_ASM("build/sdk/native", SpuSetReverb);

INCLUDE_ASM("build/sdk/native", _SpuIsInAllocateArea);

INCLUDE_ASM("build/sdk/native", _SpuIsInAllocateArea_);

INCLUDE_ASM("build/sdk/native", SpuSetReverbModeParam);

INCLUDE_ASM("build/sdk/native", _spu_setReverbAttr);

INCLUDE_ASM("build/sdk/native", SpuReserveReverbWorkArea);

INCLUDE_ASM("build/sdk/native", SpuSetReverbDepth);

INCLUDE_ASM("build/sdk/native", SpuSetReverbVoice);

INCLUDE_ASM("build/sdk/native", _SpuSetAnyVoice);

INCLUDE_ASM("build/sdk/native", SpuClearReverbWorkArea);

INCLUDE_ASM("build/sdk/native", WaitEvent);

INCLUDE_ASM("build/sdk/native", SpuSetKey);

INCLUDE_ASM("build/sdk/native", SpuSetKeyOnWithAttr);

INCLUDE_ASM("build/sdk/native", SpuWrite);

INCLUDE_ASM("build/sdk/native", SpuWrite0);

INCLUDE_ASM("build/sdk/native", SpuSetTransferStartAddr);

INCLUDE_ASM("build/sdk/native", SpuSetTransferMode);

INCLUDE_ASM("build/sdk/native", SpuIsTransferCompleted);

INCLUDE_ASM("build/sdk/native", SpuSetCommonAttr);

INCLUDE_ASM("build/sdk/native", SpuRGetAllKeysStatus);

INCLUDE_ASM("build/sdk/native", SpuGetAllKeysStatus);

INCLUDE_ASM("build/sdk/native", SpuSetVoiceAttr);

INCLUDE_ASM("build/sdk/native", _spu_2pitch);

INCLUDE_ASM("build/sdk/native", _spu_note2pitch);

INCLUDE_ASM("build/sdk/native", _spu_pitch2note);

INCLUDE_ASM("build/sdk/native", puts);

INCLUDE_ASM("build/sdk/native", strncat);

INCLUDE_ASM("build/sdk/native", strcmp);

INCLUDE_ASM("build/sdk/native", strncpy);

INCLUDE_ASM("build/sdk/native", strlen);

INCLUDE_ASM("build/sdk/native", memcpy);

INCLUDE_ASM("build/sdk/native", free);

INCLUDE_ASM("build/sdk/native", printf);

INCLUDE_ASM("build/sdk/native", sprintf);

INCLUDE_ASM("build/sdk/native", memchr);

INCLUDE_ASM("build/sdk/native", memmove);

INCLUDE_ASM("build/sdk/native", memcmp);

INCLUDE_ASM("build/sdk/native", _card_info);

INCLUDE_ASM("build/sdk/native", _card_load);

INCLUDE_ASM("build/sdk/native", _card_read);

INCLUDE_ASM("build/sdk/native", _card_wait);

INCLUDE_ASM("build/sdk/native", _card_clear);

INCLUDE_ASM("build/sdk/native", _card_write);

INCLUDE_ASM("build/sdk/native", _new_card);

INCLUDE_ASM("build/sdk/native", InitCARD);

INCLUDE_ASM("build/sdk/native", StartCARD);

INCLUDE_ASM("build/sdk/native", StopCARD);

INCLUDE_ASM("build/sdk/native", InitCARD2);

INCLUDE_ASM("build/sdk/native", StartCARD2);

INCLUDE_ASM("build/sdk/native", StopCARD2);

INCLUDE_ASM("build/sdk/native", _patch_card);

INCLUDE_ASM("build/sdk/native", _patch_card2);

INCLUDE_ASM("build/sdk/native", _copy_memcard_patch);

INCLUDE_ASM("build/sdk/native", _ExitCard);

INCLUDE_ASM("build/sdk/native", CdInit);

INCLUDE_ASM("build/sdk/native", CdStatus);

INCLUDE_ASM("build/sdk/native", CdMode);

INCLUDE_ASM("build/sdk/native", CdLastCom);

INCLUDE_ASM("build/sdk/native", CdLastPos);

INCLUDE_ASM("build/sdk/native", CdReset);

INCLUDE_ASM("build/sdk/native", CdFlush);

INCLUDE_ASM("build/sdk/native", CdSetDebug);

INCLUDE_ASM("build/sdk/native", CdComstr);

INCLUDE_ASM("build/sdk/native", CdIntstr);

INCLUDE_ASM("build/sdk/native", CdSync);

INCLUDE_ASM("build/sdk/native", CdReady);

INCLUDE_ASM("build/sdk/native", CdSyncCallback);

INCLUDE_ASM("build/sdk/native", CdReadyCallback);

INCLUDE_ASM("build/sdk/native", CdControl);

INCLUDE_ASM("build/sdk/native", CdControlF);

INCLUDE_ASM("build/sdk/native", CdControlB);

INCLUDE_ASM("build/sdk/native", CdMix);

INCLUDE_ASM("build/sdk/native", CdGetSector);

INCLUDE_ASM("build/sdk/native", CdGetSector2);

INCLUDE_ASM("build/sdk/native", CdDataCallback);

INCLUDE_ASM("build/sdk/native", CdDataSync);

INCLUDE_ASM("build/sdk/native", CdIntToPos);

INCLUDE_ASM("build/sdk/native", CdPosToInt);

INCLUDE_ASM("build/sdk/native", func_8001B43C);

INCLUDE_ASM("build/sdk/native", CD_sync);

INCLUDE_ASM("build/sdk/native", CD_ready);

INCLUDE_ASM("build/sdk/native", CD_cw);

INCLUDE_ASM("build/sdk/native", CD_vol);

INCLUDE_ASM("build/sdk/native", CD_flush);

INCLUDE_ASM("build/sdk/native", CD_initvol);

INCLUDE_ASM("build/sdk/native", CD_initintr);

INCLUDE_ASM("build/sdk/native", CD_init);

INCLUDE_ASM("build/sdk/native", CD_datasync);

INCLUDE_ASM("build/sdk/native", CD_getsector);

INCLUDE_ASM("build/sdk/native", CD_getsector2);

INCLUDE_ASM("build/sdk/native", CD_set_test_parmnum);

INCLUDE_ASM("build/sdk/native", CdSearchFile);

INCLUDE_ASM("build/sdk/native", func_8001CE74);

INCLUDE_ASM("build/sdk/native", func_8001CE94);

INCLUDE_ASM("build/sdk/native", func_8001D158);

INCLUDE_ASM("build/sdk/native", func_8001D1FC);

INCLUDE_ASM("build/sdk/native", func_8001D498);

INCLUDE_ASM("build/sdk/native", strncmp);

INCLUDE_ASM("build/sdk/native", func_8001D848);

INCLUDE_ASM("build/sdk/native", CdReadBreak);

INCLUDE_ASM("build/sdk/native", CdRead);

INCLUDE_ASM("build/sdk/native", CdReadSync);

INCLUDE_ASM("build/sdk/native", CdReadCallback);

INCLUDE_ASM("build/sdk/native", CdReadMode);

INCLUDE_ASM("build/sdk/native", CdRead2);

INCLUDE_ASM("build/sdk/native", data_ready_callback);

INCLUDE_ASM("build/sdk/native", StGetBackloc);

INCLUDE_ASM("build/sdk/native", StSetRing);

INCLUDE_ASM("build/sdk/native", StClearRing);

INCLUDE_ASM("build/sdk/native", StSetStream);

INCLUDE_ASM("build/sdk/native", init_ring_status);

INCLUDE_ASM("build/sdk/native", StSetMask);

INCLUDE_ASM("build/sdk/native", StCdInterrupt);

INCLUDE_ASM("build/sdk/native", func_8001E908);

INCLUDE_ASM("build/sdk/native", func_8001E934);

INCLUDE_ASM("build/sdk/native", func_8001EADC);

INCLUDE_ASM("build/sdk/native", func_8001EAF4);

INCLUDE_ASM("build/sdk/native", func_8001EB68);

INCLUDE_ASM("build/sdk/native", func_8001EBA4);

INCLUDE_ASM("build/sdk/native", func_8001FAE0);

INCLUDE_ASM("build/sdk/native", func_8001FB14);

INCLUDE_ASM("build/sdk/native", func_8001FBBC);

INCLUDE_ASM("build/sdk/native", func_8001FBDC);

INCLUDE_ASM("build/sdk/native", func_8001FC5C);

INCLUDE_ASM("build/sdk/native", func_8001FCA0);

INCLUDE_ASM("build/sdk/native", func_8001FCB0);

INCLUDE_ASM("build/sdk/native", InitTAP);

INCLUDE_ASM("build/sdk/native", StartTAP);

INCLUDE_ASM("build/sdk/native", StopTAP);

INCLUDE_ASM("build/sdk/native", SendTAP);

INCLUDE_ASM("build/sdk/native", EnableTAP);

INCLUDE_ASM("build/sdk/native", DisableTAP);

INCLUDE_ASM("build/sdk/native", bzero);

INCLUDE_ASM("build/sdk/native", InitGeom);

INCLUDE_ASM("build/sdk/native", _patch_gte);

INCLUDE_ASM("asm/nonmatchings/lib", DoEpi);

INCLUDE_ASM("asm/nonmatchings/lib", DoPro);

INCLUDE_ASM("asm/nonmatchings/lib", TSK_OpenModule);

INCLUDE_ASM("asm/nonmatchings/lib", TSK_AddTask);

INCLUDE_ASM("asm/nonmatchings/lib", TSK_DoTasks);

INCLUDE_ASM("asm/nonmatchings/lib", TSK_Sleep);

INCLUDE_ASM("asm/nonmatchings/lib", ReturnToSchedulerIfCurrentTask);

INCLUDE_ASM("asm/nonmatchings/lib", TSK_Die);

INCLUDE_ASM("asm/nonmatchings/lib", TSK_Kill);

INCLUDE_ASM("asm/nonmatchings/lib", TSK_GetFirstActive);

INCLUDE_ASM("asm/nonmatchings/lib", TSK_IsStackCorrupted);

INCLUDE_ASM("asm/nonmatchings/lib", TSK_JumpAndResetStack);

INCLUDE_ASM("asm/nonmatchings/lib", TSK_RepointProc);

INCLUDE_ASM("asm/nonmatchings/lib", TSK_GetCurrentTask);

INCLUDE_ASM("asm/nonmatchings/lib", TSK_IsCurrentTask);

INCLUDE_ASM("asm/nonmatchings/lib", TSK_Exist);

INCLUDE_ASM("asm/nonmatchings/lib", TSK_SetExecFilter);

INCLUDE_ASM("asm/nonmatchings/lib", TSK_ClearExecFilter);

INCLUDE_ASM("asm/nonmatchings/lib", TSK_KillTasks);

INCLUDE_ASM("asm/nonmatchings/lib", TSK_IterateTasks);

INCLUDE_ASM("asm/nonmatchings/lib", TSK_MakeTaskInactive);

INCLUDE_ASM("asm/nonmatchings/lib", TSK_MakeTaskActive);

INCLUDE_ASM("asm/nonmatchings/lib", TSK_MakeTaskImmortal);

INCLUDE_ASM("asm/nonmatchings/lib", TSK_MakeTaskMortal);

INCLUDE_ASM("asm/nonmatchings/lib", TSK_IsTaskActive);

INCLUDE_ASM("asm/nonmatchings/lib", TSK_IsTaskMortal);

INCLUDE_ASM("asm/nonmatchings/lib", DetachFromList);

INCLUDE_ASM("asm/nonmatchings/lib", AddToList);

INCLUDE_ASM("asm/nonmatchings/lib", LoTskKill);

INCLUDE_ASM("asm/nonmatchings/lib", ExecuteTask);

INCLUDE_ASM("asm/nonmatchings/lib", TSK_SetDoTasksPrologue);

INCLUDE_ASM("asm/nonmatchings/lib", TSK_SetDoTasksEpilogue);

INCLUDE_ASM("asm/nonmatchings/lib", TSK_SetTaskPrologue);

INCLUDE_ASM("asm/nonmatchings/lib", TSK_SetTaskEpilogue);

INCLUDE_ASM("asm/nonmatchings/lib", TSK_SetEpiProFilter);

INCLUDE_ASM("asm/nonmatchings/lib", TSK_ClearEpiProFilter);

INCLUDE_ASM("asm/nonmatchings/lib", TSK_SetExtraStackProtection);

INCLUDE_ASM("asm/nonmatchings/lib", TSK_SetStackFloodCallback);

INCLUDE_ASM("asm/nonmatchings/lib", TSK_SetExtraStackSize);

INCLUDE_ASM("asm/nonmatchings/lib", ExtraMarkStack);

INCLUDE_ASM("asm/nonmatchings/lib", CheckExtraStack);

INCLUDE_ASM("asm/nonmatchings/lib", TICK_InitModule);

INCLUDE_ASM("asm/nonmatchings/lib", TICK_Set);

INCLUDE_ASM("asm/nonmatchings/lib", TICK_Get);

INCLUDE_ASM("asm/nonmatchings/lib", TICK_Update);

INCLUDE_ASM("asm/nonmatchings/lib", TICK_GetAge);

INCLUDE_ASM("asm/nonmatchings/lib", TICK_GetDateString);

INCLUDE_ASM("asm/nonmatchings/lib", TICK_GetTimeString);

INCLUDE_ASM("asm/nonmatchings/lib", GU_InitModule);

INCLUDE_ASM("asm/nonmatchings/lib", GU_SetRndSeed);

INCLUDE_ASM("asm/nonmatchings/lib", GU_GetRnd);

INCLUDE_ASM("asm/nonmatchings/lib", GU_GetSRnd);

INCLUDE_ASM("asm/nonmatchings/lib", GU_GetRndRange);

INCLUDE_ASM("asm/nonmatchings/lib", GU_AlignVal);

INCLUDE_ASM("asm/nonmatchings/lib", main);

INCLUDE_ASM("asm/nonmatchings/lib", DBG_OpenModule);

void DBG_PollHost(void) {
}

INCLUDE_ASM("asm/nonmatchings/lib", DBG_Halt);

INCLUDE_ASM("asm/nonmatchings/lib", DBG_SendMessage);

INCLUDE_ASM("asm/nonmatchings/lib", DBG_SetMessageHandler);

INCLUDE_ASM("asm/nonmatchings/lib", DBG_Error);

INCLUDE_ASM("asm/nonmatchings/lib", DBG_SetErrorFunc);

void SendPsyqString(void) {
}

INCLUDE_ASM("asm/nonmatchings/lib", DBG_SetPollRoutine);

INCLUDE_ASM("asm/nonmatchings/lib", GTIMSYS_GetTimer);

INCLUDE_ASM("asm/nonmatchings/lib", GTIMSYS_ResetTimer);

INCLUDE_ASM("asm/nonmatchings/lib", GTIMSYS_InitTimer);

INCLUDE_ASM("build/sdk/native", SetRCnt);

INCLUDE_ASM("build/sdk/native", GetRCnt);

INCLUDE_ASM("build/sdk/native", StartRCnt);

INCLUDE_ASM("build/sdk/native", StopRCnt);

INCLUDE_ASM("build/sdk/native", ResetRCnt);

INCLUDE_ASM("asm/nonmatchings/lib", GSYS_GetWorkMemInfo);

INCLUDE_ASM("asm/nonmatchings/lib", GSYS_SetStackAndJump);

INCLUDE_ASM("asm/nonmatchings/lib", GSYS_MarkStack);

INCLUDE_ASM("asm/nonmatchings/lib", GSYS_IsStackCorrupted);

INCLUDE_ASM("asm/nonmatchings/lib", GSYS_InitMachine);

INCLUDE_ASM("asm/nonmatchings/lib", GSYS_CheckPtr);

INCLUDE_ASM("asm/nonmatchings/lib", GSYS_IsStackOutOfBounds);

INCLUDE_ASM("build/sdk/native", GetSp);

INCLUDE_ASM("asm/nonmatchings/lib", GAL_SetErrorChecking);

INCLUDE_ASM("asm/nonmatchings/lib", GAL_SplitBlock);

INCLUDE_ASM("asm/nonmatchings/lib", GAL_InitModule);

INCLUDE_ASM("asm/nonmatchings/lib", GAL_AddMemType);

INCLUDE_ASM("asm/nonmatchings/lib", GAL_Alloc);

INCLUDE_ASM("asm/nonmatchings/lib", GAL_Lock);

INCLUDE_ASM("asm/nonmatchings/lib", GAL_Unlock);

INCLUDE_ASM("asm/nonmatchings/lib", GAL_Free);

INCLUDE_ASM("asm/nonmatchings/lib", GAL_GetFreeMem);

INCLUDE_ASM("asm/nonmatchings/lib", GAL_GetUsedMem);

INCLUDE_ASM("asm/nonmatchings/lib", GAL_LargestFreeBlock);

INCLUDE_ASM("asm/nonmatchings/lib", AttachHdrToList);

INCLUDE_ASM("asm/nonmatchings/lib", DetachHdrFromList);

INCLUDE_ASM("asm/nonmatchings/lib", IsActiveValidHandle);

INCLUDE_ASM("asm/nonmatchings/lib", AlignPtr);

INCLUDE_ASM("asm/nonmatchings/lib", AlignSize);

INCLUDE_ASM("asm/nonmatchings/lib", FindClosestSizedBlock);

INCLUDE_ASM("asm/nonmatchings/lib", FindHighestMemBlock);

INCLUDE_ASM("asm/nonmatchings/lib", FindLowestMemBlock);

INCLUDE_ASM("asm/nonmatchings/lib", GetMemInitInfoBlockFromType);

INCLUDE_ASM("asm/nonmatchings/lib", MergeToEmptyList);

INCLUDE_ASM("asm/nonmatchings/lib", GAL_AllocAt);

INCLUDE_ASM("asm/nonmatchings/lib", LoAlloc);

INCLUDE_ASM("asm/nonmatchings/lib", FindBlockInTheseBounds);

INCLUDE_ASM("asm/nonmatchings/lib", GetFreeMemHdrBlock);

INCLUDE_ASM("asm/nonmatchings/lib", ReleaseMemHdrBlock);

INCLUDE_ASM("asm/nonmatchings/lib", GAL_IterateEmptyMem);

INCLUDE_ASM("asm/nonmatchings/lib", GAL_IterateUsedMem);

INCLUDE_ASM("asm/nonmatchings/lib", GAL_SetMemName);

INCLUDE_ASM("asm/nonmatchings/lib", GAL_TotalMem);

INCLUDE_ASM("asm/nonmatchings/lib", GAL_MemBase);

INCLUDE_ASM("asm/nonmatchings/lib", GAL_DefragMem);

INCLUDE_ASM("asm/nonmatchings/lib", GSetError);

INCLUDE_ASM("asm/nonmatchings/lib", GAL_CheckMem);

INCLUDE_ASM("asm/nonmatchings/lib", CheckCollisions);

INCLUDE_ASM("asm/nonmatchings/lib", AreBlocksColliding);

INCLUDE_ASM("asm/nonmatchings/lib", GAL_GetErrorText);

INCLUDE_ASM("asm/nonmatchings/lib", GAL_GetLastErrorCode);

INCLUDE_ASM("asm/nonmatchings/lib", GAL_GetLastErrorText);

INCLUDE_ASM("asm/nonmatchings/lib", GAL_HowManyEmptyRegions);

INCLUDE_ASM("asm/nonmatchings/lib", GAL_HowManyUsedRegions);

INCLUDE_ASM("asm/nonmatchings/lib", GAL_SetTimeStamp);

INCLUDE_ASM("asm/nonmatchings/lib", GAL_IncTimeStamp);

INCLUDE_ASM("asm/nonmatchings/lib", GAL_GetTimeStamp);

INCLUDE_ASM("asm/nonmatchings/lib", GAL_AlignSizeToType);

INCLUDE_ASM("asm/nonmatchings/lib", GAL_AllocMultiStruct);

INCLUDE_ASM("asm/nonmatchings/lib", GAL_ProcessMultiStruct);

INCLUDE_ASM("asm/nonmatchings/lib", GAL_GetSize);

INCLUDE_ASM("asm/nonmatchings/lib", GazDefragMem);

INCLUDE_ASM("asm/nonmatchings/lib", PutBlocksInRegionIntoList);

INCLUDE_ASM("asm/nonmatchings/lib", CollideRegions);

INCLUDE_ASM("asm/nonmatchings/lib", DeleteEmptyBlocks);

INCLUDE_ASM("asm/nonmatchings/lib", GetRegion);

INCLUDE_ASM("asm/nonmatchings/lib", FindNextBlock);

INCLUDE_ASM("asm/nonmatchings/lib", ShuffleBlocks);

INCLUDE_ASM("asm/nonmatchings/lib", PutAllLockedBlocksOntoList);

INCLUDE_ASM("asm/nonmatchings/lib", SortMemHdrListByAddr);

INCLUDE_ASM("asm/nonmatchings/lib", GraftMemHdrList);

INCLUDE_ASM("asm/nonmatchings/lib", GAL_MemDump);

INCLUDE_ASM("asm/nonmatchings/lib", GAL_SetVerbosity);

INCLUDE_ASM("asm/nonmatchings/lib", CountFreeBlocks);

INCLUDE_ASM("asm/nonmatchings/lib", SetBlockName);

INCLUDE_ASM("asm/nonmatchings/lib", GAL_GetNumFreeHeaders);

INCLUDE_ASM("asm/nonmatchings/lib", GAL_GetLastTypeAlloced);

INCLUDE_ASM("asm/nonmatchings/lib", GAL_SetAllocFilter);

INCLUDE_ASM("asm/nonmatchings/lib", GAL_SortUsedRegionsBySize);

INCLUDE_ASM("asm/nonmatchings/lib", SortSize);

INCLUDE_ASM("asm/nonmatchings/lib", GAL_SortUsedRegionsByAddress);

INCLUDE_ASM("asm/nonmatchings/lib", SortAddr);

INCLUDE_ASM("asm/nonmatchings/lib", SortMemHdrList);

INCLUDE_ASM("asm/nonmatchings/lib", SwapByte);

INCLUDE_ASM("asm/nonmatchings/lib", PutLong);

INCLUDE_ASM("asm/nonmatchings/lib", GetLong);

INCLUDE_ASM("asm/nonmatchings/lib", DDXinit);

INCLUDE_ASM("asm/nonmatchings/lib", DDXcreate);

INCLUDE_ASM("asm/nonmatchings/lib", DDXopen);

INCLUDE_ASM("asm/nonmatchings/lib", DDXclose);

INCLUDE_ASM("asm/nonmatchings/lib", DDXread);

INCLUDE_ASM("asm/nonmatchings/lib", DDXwrite);

INCLUDE_ASM("asm/nonmatchings/lib", DDXlseek);

INCLUDE_ASM("asm/nonmatchings/lib", DDXpollhost);

INCLUDE_ASM("asm/nonmatchings/lib", DDXputchar);

INCLUDE_ASM("asm/nonmatchings/lib", asyncreadmsecs);

INCLUDE_ASM("asm/nonmatchings/lib", asyncstructsize);

INCLUDE_ASM("asm/nonmatchings/lib", initasyncstruct);

INCLUDE_ASM("asm/nonmatchings/lib", initasyncstructsize);

INCLUDE_ASM("asm/nonmatchings/lib", initasync);

INCLUDE_ASM("asm/nonmatchings/lib", delasyncstruct);

INCLUDE_ASM("asm/nonmatchings/lib", delasync);

INCLUDE_ASM("asm/nonmatchings/lib", asyncloadfilecallback);

INCLUDE_ASM("asm/nonmatchings/lib", asyncloadfile);

INCLUDE_ASM("asm/nonmatchings/lib", asyncloadfileatcallback);

INCLUDE_ASM("asm/nonmatchings/lib", asyncloadfileat);

INCLUDE_ASM("asm/nonmatchings/lib", setasyncfile);

INCLUDE_ASM("asm/nonmatchings/lib", asyncloadchunkcallback);

INCLUDE_ASM("asm/nonmatchings/lib", asyncloadchunk);

INCLUDE_ASM("asm/nonmatchings/lib", asyncloadsegmentcallback);

INCLUDE_ASM("asm/nonmatchings/lib", asyncloadsegment);

INCLUDE_ASM("asm/nonmatchings/lib", asyncreadcallback);

INCLUDE_ASM("asm/nonmatchings/lib", asyncread);

INCLUDE_ASM("asm/nonmatchings/lib", getasyncstatus);

INCLUDE_ASM("asm/nonmatchings/lib", cancelasyncload);

INCLUDE_ASM("asm/nonmatchings/lib", asyncidle);

INCLUDE_ASM("asm/nonmatchings/lib", asyncreader);

INCLUDE_ASM("asm/nonmatchings/lib", asynctopupoverride);

INCLUDE_ASM("asm/nonmatchings/lib", localasyncreader);

INCLUDE_ASM("asm/nonmatchings/lib", getasyncreadblock);

INCLUDE_ASM("asm/nonmatchings/lib", getasyncreadstatus);

INCLUDE_ASM("asm/nonmatchings/lib", initasyncblocks);

INCLUDE_ASM("asm/nonmatchings/lib", putasyncblock);

INCLUDE_ASM("asm/nonmatchings/lib", getasyncblock);

INCLUDE_ASM("asm/nonmatchings/lib", func_80025254);

INCLUDE_ASM("asm/nonmatchings/lib", abortmessage);

INCLUDE_ASM("asm/nonmatchings/lib", abortoverride);

INCLUDE_ASM("asm/nonmatchings/lib", vsprintf);

INCLUDE_ASM("asm/nonmatchings/lib", _doprnt);

INCLUDE_ASM("build/sdk/native", putc);

INCLUDE_ASM("asm/nonmatchings/lib", print);

INCLUDE_ASM("asm/nonmatchings/lib", printxy);

INCLUDE_ASM("asm/nonmatchings/lib", handlesector);

INCLUDE_ASM("asm/nonmatchings/lib", openblockhandlea);

INCLUDE_ASM("asm/nonmatchings/lib", openblockhandle);

INCLUDE_ASM("asm/nonmatchings/lib", openblockhandlez);

INCLUDE_ASM("asm/nonmatchings/lib", asyncopenblockhandlea);

INCLUDE_ASM("asm/nonmatchings/lib", asyncopenblockhandlebysector);

INCLUDE_ASM("asm/nonmatchings/lib", asyncopenblockhandle);

INCLUDE_ASM("asm/nonmatchings/lib", asyncopenblockhandlez);

INCLUDE_ASM("asm/nonmatchings/lib", blockhandlefile);

INCLUDE_ASM("asm/nonmatchings/lib", closeblockhandle);

INCLUDE_ASM("asm/nonmatchings/lib", readblockhandle);

INCLUDE_ASM("asm/nonmatchings/lib", asyncreadblockcallback);

INCLUDE_ASM("asm/nonmatchings/lib", blockreadcallback);

INCLUDE_ASM("asm/nonmatchings/lib", asyncreadblockhandle);

INCLUDE_ASM("asm/nonmatchings/lib", seekblockhandlea);

INCLUDE_ASM("asm/nonmatchings/lib", seekblockhandle);

INCLUDE_ASM("asm/nonmatchings/lib", seekblockhandlez);

INCLUDE_ASM("asm/nonmatchings/lib", asyncseekblockhandlea);

INCLUDE_ASM("asm/nonmatchings/lib", asyncseekblockhandle);

INCLUDE_ASM("asm/nonmatchings/lib", asyncseekblockhandlez);

INCLUDE_ASM("asm/nonmatchings/lib", timetosector);

INCLUDE_ASM("asm/nonmatchings/lib", sectortotime);

INCLUDE_ASM("asm/nonmatchings/lib", initpsxcdrom);

INCLUDE_ASM("asm/nonmatchings/lib", closecdrom);

INCLUDE_ASM("asm/nonmatchings/lib", psxcdromseek);

INCLUDE_ASM("asm/nonmatchings/lib", readdonecallback);

INCLUDE_ASM("asm/nonmatchings/lib", psxcdromread);

INCLUDE_ASM("asm/nonmatchings/lib", psxcdromasyncseek);

INCLUDE_ASM("asm/nonmatchings/lib", setasyncreadcallback);

INCLUDE_ASM("asm/nonmatchings/lib", psxcdromasyncpause);

INCLUDE_ASM("asm/nonmatchings/lib", asyncinitread);

INCLUDE_ASM("asm/nonmatchings/lib", asynctimer);

INCLUDE_ASM("asm/nonmatchings/lib", psxcdromstopread);

INCLUDE_ASM("asm/nonmatchings/lib", Iasyncreadcallback);

INCLUDE_ASM("asm/nonmatchings/lib", psxcdromasyncread);

INCLUDE_ASM("asm/nonmatchings/lib", parsedir);

INCLUDE_ASM("asm/nonmatchings/lib", basefilename);

INCLUDE_ASM("asm/nonmatchings/lib", setdirectorycache);

INCLUDE_ASM("asm/nonmatchings/lib", initdirectorycache);

INCLUDE_ASM("asm/nonmatchings/lib", cachedirectoryentry);

INCLUDE_ASM("asm/nonmatchings/lib", directoryentrycached);

INCLUDE_ASM("asm/nonmatchings/lib", cdromdirectoryentry);

INCLUDE_ASM("asm/nonmatchings/lib", setdirentrycallback);

INCLUDE_ASM("asm/nonmatchings/lib", asyncdirentry);

INCLUDE_ASM("build/sdk/native", toupper);

INCLUDE_ASM("build/sdk/native", CdGetToc);

INCLUDE_ASM("build/sdk/native", CdGetToc2);

INCLUDE_ASM("asm/nonmatchings/lib", PCfilelen);

INCLUDE_ASM("asm/nonmatchings/lib", initfileio);

INCLUDE_ASM("asm/nonmatchings/lib", setdirectory);

INCLUDE_ASM("asm/nonmatchings/lib", getdirectory);

INCLUDE_ASM("asm/nonmatchings/lib", openhandlea);

INCLUDE_ASM("asm/nonmatchings/lib", openhandle);

INCLUDE_ASM("asm/nonmatchings/lib", openhandlez);

INCLUDE_ASM("asm/nonmatchings/lib", openhandlewa);

INCLUDE_ASM("asm/nonmatchings/lib", openhandlew);

INCLUDE_ASM("asm/nonmatchings/lib", libclosehandle);

INCLUDE_ASM("asm/nonmatchings/lib", readhandle);

INCLUDE_ASM("asm/nonmatchings/lib", writehandle);

INCLUDE_ASM("asm/nonmatchings/lib", seekhandle);

INCLUDE_ASM("build/sdk/native", _96_init);

INCLUDE_ASM("build/sdk/native", lseek);

INCLUDE_ASM("asm/nonmatchings/lib", filesize);

INCLUDE_ASM("asm/nonmatchings/lib", filesizez);

INCLUDE_ASM("asm/nonmatchings/lib", filesizea);

INCLUDE_ASM("asm/nonmatchings/lib", fileexists);

INCLUDE_ASM("asm/nonmatchings/lib", reserveioforasync);

INCLUDE_ASM("asm/nonmatchings/lib", reserveioforstream);

INCLUDE_ASM("asm/nonmatchings/lib", streamhasio);

INCLUDE_ASM("asm/nonmatchings/lib", asynchasio);

INCLUDE_ASM("asm/nonmatchings/lib", setstreamtopup);

INCLUDE_ASM("asm/nonmatchings/lib", topupstream);

INCLUDE_ASM("asm/nonmatchings/lib", signalstreamtopup);

INCLUDE_ASM("asm/nonmatchings/lib", streamtoppedup);

INCLUDE_ASM("asm/nonmatchings/lib", loadfiletopup);

INCLUDE_ASM("asm/nonmatchings/lib", ioidle);

INCLUDE_ASM("asm/nonmatchings/lib", ioreader);

INCLUDE_ASM("asm/nonmatchings/lib", setstreameriofuncs);

INCLUDE_ASM("asm/nonmatchings/lib", setasynciofuncs);

INCLUDE_ASM("asm/nonmatchings/lib", iscrcblock);

INCLUDE_ASM("asm/nonmatchings/lib", checkcrcblock);

INCLUDE_ASM("asm/nonmatchings/lib", eacloadfilecallback);

INCLUDE_ASM("asm/nonmatchings/lib", initloadfilecallback);

INCLUDE_ASM("asm/nonmatchings/lib", crc16);

INCLUDE_ASM("asm/nonmatchings/lib", loadfileatadra);

INCLUDE_ASM("asm/nonmatchings/lib", loadfileatadr);

INCLUDE_ASM("asm/nonmatchings/lib", loadfileatadrz);

INCLUDE_ASM("asm/nonmatchings/lib", seekmsecs);

INCLUDE_ASM("asm/nonmatchings/lib", returnseekmsecs);

INCLUDE_ASM("asm/nonmatchings/lib", cachememadr);

INCLUDE_ASM("asm/nonmatchings/lib", cachememblock);

INCLUDE_ASM("asm/nonmatchings/lib", prioritycachememadr);

INCLUDE_ASM("asm/nonmatchings/lib", prioritycachememblock);

INCLUDE_ASM("asm/nonmatchings/lib", findnamedpurgeableblockinclass);

INCLUDE_ASM("asm/nonmatchings/lib", findnamedpurgeableblock);

INCLUDE_ASM("asm/nonmatchings/lib", cacheone);

INCLUDE_ASM("asm/nonmatchings/lib", cacheonei);

INCLUDE_ASM("asm/nonmatchings/lib", checkcacheadr);

INCLUDE_ASM("asm/nonmatchings/lib", checkcacheblock);

INCLUDE_ASM("asm/nonmatchings/lib", checkcacheinclassadr);

INCLUDE_ASM("asm/nonmatchings/lib", checkcacheinclassblock);

INCLUDE_ASM("asm/nonmatchings/lib", initmemmanadr);

INCLUDE_ASM("asm/nonmatchings/lib", creatememclass);

INCLUDE_ASM("asm/nonmatchings/lib", libmembreak);

INCLUDE_ASM("asm/nonmatchings/lib", reservememblock);

INCLUDE_ASM("asm/nonmatchings/lib", reservememblockz);

INCLUDE_ASM("asm/nonmatchings/lib", reservememadr);

INCLUDE_ASM("asm/nonmatchings/lib", reservememadrz);

INCLUDE_ASM("asm/nonmatchings/lib", reservememadra);

INCLUDE_ASM("asm/nonmatchings/lib", reservememblocka);

INCLUDE_ASM("asm/nonmatchings/lib", reservememblockai);

INCLUDE_ASM("asm/nonmatchings/lib", findmemblocka);

INCLUDE_ASM("asm/nonmatchings/lib", findmemblock);

INCLUDE_ASM("asm/nonmatchings/lib", purgememadr);

INCLUDE_ASM("asm/nonmatchings/lib", purgememblock);

INCLUDE_ASM("asm/nonmatchings/lib", purgememblocki);

INCLUDE_ASM("asm/nonmatchings/lib", purgememaboveadr);

INCLUDE_ASM("asm/nonmatchings/lib", purgememaboveblock);

INCLUDE_ASM("asm/nonmatchings/lib", purgeone);

INCLUDE_ASM("asm/nonmatchings/lib", purgeonei);

INCLUDE_ASM("asm/nonmatchings/lib", findnamedmemblockinclass);

INCLUDE_ASM("asm/nonmatchings/lib", findnamedmemblock);

INCLUDE_ASM("asm/nonmatchings/lib", updatehighwater);

INCLUDE_ASM("asm/nonmatchings/lib", largestunused);

INCLUDE_ASM("asm/nonmatchings/lib", largestunusedinclass);

INCLUDE_ASM("asm/nonmatchings/lib", largestunusedinclassi);

INCLUDE_ASM("asm/nonmatchings/lib", lockedmem);

INCLUDE_ASM("asm/nonmatchings/lib", relocateablemem);

INCLUDE_ASM("asm/nonmatchings/lib", purgeablemem);

INCLUDE_ASM("asm/nonmatchings/lib", availablemem);

INCLUDE_ASM("asm/nonmatchings/lib", largestreserveableinclass);

INCLUDE_ASM("asm/nonmatchings/lib", initmemblocks);

INCLUDE_ASM("asm/nonmatchings/lib", putmemblock);

INCLUDE_ASM("asm/nonmatchings/lib", getmemblock);

INCLUDE_ASM("asm/nonmatchings/lib", memsizeadr);

INCLUDE_ASM("asm/nonmatchings/lib", getblockadr);

INCLUDE_ASM("asm/nonmatchings/lib", getblockoffset);

INCLUDE_ASM("asm/nonmatchings/lib", getblocklen);

INCLUDE_ASM("asm/nonmatchings/lib", getblockname);

INCLUDE_ASM("asm/nonmatchings/lib", getblocktype);

INCLUDE_ASM("asm/nonmatchings/lib", lockmemblock);

INCLUDE_ASM("asm/nonmatchings/lib", unlockmemblock);

INCLUDE_ASM("asm/nonmatchings/lib", breakmemadr);

INCLUDE_ASM("asm/nonmatchings/lib", breakmemblock);

INCLUDE_ASM("asm/nonmatchings/lib", breakmemblocki);

INCLUDE_ASM("asm/nonmatchings/lib", findcontainingmemblocka);

INCLUDE_ASM("asm/nonmatchings/lib", findcontainingmemblock);

INCLUDE_ASM("asm/nonmatchings/lib", findcontainingmemblockz);

INCLUDE_ASM("asm/nonmatchings/lib", compactup);

INCLUDE_ASM("asm/nonmatchings/lib", compactupi);

INCLUDE_ASM("asm/nonmatchings/lib", compactdown);

INCLUDE_ASM("asm/nonmatchings/lib", compactdowni);

INCLUDE_ASM("asm/nonmatchings/lib", resizememadra);

INCLUDE_ASM("asm/nonmatchings/lib", resizememadr);

INCLUDE_ASM("asm/nonmatchings/lib", resizememadrz);

INCLUDE_ASM("asm/nonmatchings/lib", resizememblock);

INCLUDE_ASM("asm/nonmatchings/lib", resizememblockz);

INCLUDE_ASM("asm/nonmatchings/lib", resizememblocka);

INCLUDE_ASM("asm/nonmatchings/lib", addsentinel);

INCLUDE_ASM("asm/nonmatchings/lib", checksentinelz);

INCLUDE_ASM("asm/nonmatchings/lib", validatemema);

INCLUDE_ASM("asm/nonmatchings/lib", validatemem);

INCLUDE_ASM("asm/nonmatchings/lib", validatememz);

INCLUDE_ASM("asm/nonmatchings/lib", blockclear);

INCLUDE_ASM("asm/nonmatchings/lib", blockfill);

INCLUDE_ASM("asm/nonmatchings/lib", blockmove);

INCLUDE_ASM("asm/nonmatchings/lib", getm);

INCLUDE_ASM("asm/nonmatchings/lib", geti);

INCLUDE_ASM("asm/nonmatchings/lib", putm);

INCLUDE_ASM("asm/nonmatchings/lib", puti);

INCLUDE_ASM("asm/nonmatchings/lib", setstreamqueuesize);

INCLUDE_ASM("asm/nonmatchings/lib", initstreamstructa);

INCLUDE_ASM("asm/nonmatchings/lib", initstreamstructz);

INCLUDE_ASM("asm/nonmatchings/lib", initstreamstruct);

INCLUDE_ASM("asm/nonmatchings/lib", initstreama);

INCLUDE_ASM("asm/nonmatchings/lib", initstreamz);

INCLUDE_ASM("asm/nonmatchings/lib", initstream);

INCLUDE_ASM("asm/nonmatchings/lib", setstreamspeed);

INCLUDE_ASM("asm/nonmatchings/lib", defaultstreamspeed);

INCLUDE_ASM("asm/nonmatchings/lib", delstreamstruct);

INCLUDE_ASM("asm/nonmatchings/lib", delstream);

INCLUDE_ASM("asm/nonmatchings/lib", streamcommanda);

INCLUDE_ASM("asm/nonmatchings/lib", purgestreamcommanda);

INCLUDE_ASM("asm/nonmatchings/lib", startstream);

INCLUDE_ASM("asm/nonmatchings/lib", startstreamz);

INCLUDE_ASM("asm/nonmatchings/lib", queuestartstream);

INCLUDE_ASM("asm/nonmatchings/lib", queuestartstreamz);

INCLUDE_ASM("asm/nonmatchings/lib", purgestartstream);

INCLUDE_ASM("asm/nonmatchings/lib", purgestartstreamz);

INCLUDE_ASM("asm/nonmatchings/lib", startstreamidle);

INCLUDE_ASM("asm/nonmatchings/lib", startstreamidlez);

INCLUDE_ASM("asm/nonmatchings/lib", queuestartstreamidle);

INCLUDE_ASM("asm/nonmatchings/lib", queuestartstreamidlez);

INCLUDE_ASM("asm/nonmatchings/lib", purgestartstreamidle);

INCLUDE_ASM("asm/nonmatchings/lib", purgestartstreamidlez);

INCLUDE_ASM("asm/nonmatchings/lib", seekstream);

INCLUDE_ASM("asm/nonmatchings/lib", seekstreamz);

INCLUDE_ASM("asm/nonmatchings/lib", queueseekstream);

INCLUDE_ASM("asm/nonmatchings/lib", queueseekstreamz);

INCLUDE_ASM("asm/nonmatchings/lib", purgeseekstream);

INCLUDE_ASM("asm/nonmatchings/lib", purgeseekstreamz);

INCLUDE_ASM("asm/nonmatchings/lib", purgestreamqueue);

INCLUDE_ASM("asm/nonmatchings/lib", secondarystreamstruct);

INCLUDE_ASM("asm/nonmatchings/lib", secondarystream);

INCLUDE_ASM("asm/nonmatchings/lib", resetstreamstatus);

INCLUDE_ASM("asm/nonmatchings/lib", getstreamstatus);

INCLUDE_ASM("asm/nonmatchings/lib", PSXistreamreader);

INCLUDE_ASM("asm/nonmatchings/lib", streamreader);

INCLUDE_ASM("asm/nonmatchings/lib", coordinatestream);

INCLUDE_ASM("asm/nonmatchings/lib", localstreamreader);

INCLUDE_ASM("asm/nonmatchings/lib", releasechunks);

INCLUDE_ASM("asm/nonmatchings/lib", streamspace);

INCLUDE_ASM("asm/nonmatchings/lib", streamendspace);

INCLUDE_ASM("asm/nonmatchings/lib", streamstartspace);

INCLUDE_ASM("asm/nonmatchings/lib", getstreamchunk);

INCLUDE_ASM("asm/nonmatchings/lib", releasestreamchunk);

INCLUDE_ASM("asm/nonmatchings/lib", streamgetstatus);

INCLUDE_ASM("asm/nonmatchings/lib", streamreleasestatus);

INCLUDE_ASM("asm/nonmatchings/lib", streamidle);

INCLUDE_ASM("asm/nonmatchings/lib", streamsetnotfull);

INCLUDE_ASM("asm/nonmatchings/lib", streamfull);

INCLUDE_ASM("asm/nonmatchings/lib", isendofstream);

INCLUDE_ASM("asm/nonmatchings/lib", setstreamcrc);

INCLUDE_ASM("asm/nonmatchings/lib", clearstreamcrc);

INCLUDE_ASM("asm/nonmatchings/lib", initstreamblocks);

INCLUDE_ASM("asm/nonmatchings/lib", putstreamblock);

INCLUDE_ASM("asm/nonmatchings/lib", checkstreamblocksfree);

INCLUDE_ASM("asm/nonmatchings/lib", streamblocksfree);

INCLUDE_ASM("asm/nonmatchings/lib", getstreamblocka);

INCLUDE_ASM("asm/nonmatchings/lib", filename);

INCLUDE_ASM("asm/nonmatchings/lib", stricmp);

INCLUDE_ASM("asm/nonmatchings/lib", strnicmp);

INCLUDE_ASM("asm/nonmatchings/lib", eacexit);

INCLUDE_ASM("asm/nonmatchings/lib", addexit);

INCLUDE_ASM("asm/nonmatchings/lib", removeexit);

INCLUDE_ASM("build/sdk/native", exit);

INCLUDE_ASM("asm/nonmatchings/lib", getlocksemaphore);

INCLUDE_ASM("asm/nonmatchings/lib", locksemaphore);

INCLUDE_ASM("asm/nonmatchings/lib", locksemaphorereturn);

INCLUDE_ASM("asm/nonmatchings/lib", unlocksemaphore);

INCLUDE_ASM("asm/nonmatchings/lib", addsystemtask);

INCLUDE_ASM("asm/nonmatchings/lib", delsystemtask);

INCLUDE_ASM("asm/nonmatchings/lib", systemtask);

INCLUDE_ASM("asm/nonmatchings/lib", abortablewait);

INCLUDE_ASM("asm/nonmatchings/lib", getcycleint);

INCLUDE_ASM("asm/nonmatchings/lib", restoregetcycle);

INCLUDE_ASM("asm/nonmatchings/lib", initgetcycle);

INCLUDE_ASM("asm/nonmatchings/lib", getcycle);

INCLUDE_ASM("asm/nonmatchings/lib", shortgetcycle);

INCLUDE_ASM("asm/nonmatchings/lib", addtimer);

INCLUDE_ASM("asm/nonmatchings/lib", deltimer);

INCLUDE_ASM("asm/nonmatchings/lib", delalltimers);

INCLUDE_ASM("asm/nonmatchings/lib", timercount);

INCLUDE_ASM("asm/nonmatchings/lib", inittimer);

INCLUDE_ASM("asm/nonmatchings/lib", restoretimer);

INCLUDE_ASM("asm/nonmatchings/lib", tmrint);

INCLUDE_ASM("asm/nonmatchings/lib", initgp);

INCLUDE_ASM("asm/nonmatchings/lib", savegp_ci);

INCLUDE_ASM("asm/nonmatchings/lib", restoregp);

INCLUDE_ASM("asm/nonmatchings/lib", gettick);

INCLUDE_ASM("asm/nonmatchings/lib", tickcount);

INCLUDE_ASM("asm/nonmatchings/lib", elapsedticks);

INCLUDE_ASM("asm/nonmatchings/lib", resettick);

INCLUDE_ASM("asm/nonmatchings/lib", setticks);

INCLUDE_ASM("asm/nonmatchings/lib", waitticks);

INCLUDE_ASM("asm/nonmatchings/lib", testticks);

INCLUDE_ASM("asm/nonmatchings/lib", timedwait);
