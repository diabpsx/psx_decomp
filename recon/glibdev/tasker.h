#ifndef GLIBDEV_TASKER_H
#define GLIBDEV_TASKER_H
/* TASKER.H -- Climax GLIB cooperative multitasking (C lane).
 * Function list/VAs: JAP skeleton GLIBDEV/SOURCE/TASKER.H; TASK layout: SYM STRTAG TASK (size 92)
 * == Climax's own SBSPSS Utils/Libs/GLib/tasker.h (Gary Liddon). */
#include "diabpsx_types.h"

/* GLIB_TEXT: tasker.c defines it as the lib-segment section attribute before including this header. */
#ifndef GLIB_TEXT
#define GLIB_TEXT
#endif

#ifndef FALSE
#define FALSE 0                         /* GLIB GTYPES.H */
#endif
#ifndef TRUE
#define TRUE (!FALSE)
#endif

#ifndef GLIBDEV_U32_DEFINED
#define GLIBDEV_U32_DEFINED
typedef unsigned long U32;
#endif
#ifndef GLIBDEV_MHANDLE_DEFINED
#define GLIBDEV_MHANDLE_DEFINED
typedef long MHANDLE;                   /* SYM TPDEF MHANDLE = LONG */
#endif

/* PsyQ 4.0 SETJMP.H: jmp_buf = int[JB_SIZE=12] */
#ifndef GLIBDEV_JMP_BUF_DEFINED
#define GLIBDEV_JMP_BUF_DEFINED
typedef int jmp_buf[12];
#endif

#ifdef __cplusplus
extern "C" {
#endif
extern int setjmp(jmp_buf);
extern void longjmp(jmp_buf, int);
#ifdef __cplusplus
}
#endif

typedef struct TASK
{
	struct TASK *Next;                  /* +0x00 */
	struct TASK *Prev;                  /* +0x04 */

	U32		Id;                         /* +0x08 */
	U32		SleepTime;                  /* +0x0C */

	U32		fToInit:1,                  /* +0x10 bit 0: Has this task been inited */
			fToDie:1,                   /*       bit 1: Does this task deserve to die! */
			fKillable:1,                /*       bit 2: Can this task be killed */
			fActive:1,                  /*       bit 3: Is this task active or what */
			fXtraStack:1;               /*       bit 4 */

	void *	Stack;                      /* +0x14 */
	U32		StackSize;                  /* +0x18 */

	void *	Data;                       /* +0x1C */

	jmp_buf	TskEnv;                     /* +0x20 */

	void (*Main)(struct TASK *T);       /* +0x50 */

	MHANDLE		hndTask;                /* +0x54 */
	u16			XtraLongs;              /* +0x58 */
	u16			MaxStackSizeBytes;      /* +0x5A */

} TASK;                                 /* sizeof 92 */

typedef void (*TSK_CBACK)(TASK *T);
typedef void (*DOTSK_CBACK)(void);

#ifdef __cplusplus
extern "C" {
#endif

BOOL	TSK_OpenModule(U32 MemType) GLIB_TEXT;                                   /* @0x8001FF9C */
TASK *	TSK_AddTask(U32 Id,void (*Main)(TASK *T),int StackSize,int DataSize) GLIB_TEXT;   /* @0x80020010 */
void	TSK_DoTasks(void) GLIB_TEXT;                                             /* @0x800201F8 */
void	TSK_Sleep(int Frames) GLIB_TEXT;                                         /* @0x800203B8 */
void	TSK_Die(void) GLIB_TEXT;                                                 /* @0x8002051C */
void	TSK_Kill(TASK *T) GLIB_TEXT;                                             /* @0x80020548 */
TASK *	TSK_GetFirstActive(void) GLIB_TEXT;                                      /* @0x80020598 */
BOOL	TSK_IsStackCorrupted(TASK *T) GLIB_TEXT;                                 /* @0x800205A8 */
void	TSK_JumpAndResetStack(void (*RunFunc)(TASK *)) GLIB_TEXT;                /* @0x80020624 */
void	TSK_RepointProc(TASK *T,void (*Func)(TASK *T)) GLIB_TEXT;                /* @0x8002066C */
TASK *	TSK_GetCurrentTask(void) GLIB_TEXT;                                      /* @0x800206B0 */
BOOL	TSK_IsCurrentTask(TASK *T) GLIB_TEXT;                                    /* @0x800206C0 */
TASK *	TSK_Exist(TASK *T,U32 Id,U32 Mask) GLIB_TEXT;                            /* @0x800206D8 */
void	TSK_SetExecFilter(U32 Id,U32 Mask) GLIB_TEXT;                            /* @0x80020730 */
void	TSK_ClearExecFilter(void) GLIB_TEXT;                                     /* @0x80020748 */
int		TSK_KillTasks(TASK * CallingT,U32 Id,U32 Mask) GLIB_TEXT;                /* @0x8002076C */
void	TSK_IterateTasks(U32 Id,U32 Mask,void (*CallBack)(TASK *T)) GLIB_TEXT;   /* @0x8002086C */
void	TSK_MakeTaskInactive(TASK *T) GLIB_TEXT;                                 /* @0x800208E4 */
void	TSK_MakeTaskActive(TASK *T) GLIB_TEXT;                                   /* @0x800208F8 */
void	TSK_MakeTaskImmortal(TASK *T) GLIB_TEXT;                                 /* @0x8002090C */
void	TSK_MakeTaskMortal(TASK *T) GLIB_TEXT;                                   /* @0x80020920 */
BOOL	TSK_IsTaskActive(TASK *T) GLIB_TEXT;                                     /* @0x80020934 */
BOOL	TSK_IsTaskMortal(TASK *T) GLIB_TEXT;                                     /* @0x80020948 */

DOTSK_CBACK TSK_SetDoTasksPrologue(DOTSK_CBACK Func) GLIB_TEXT;                  /* @0x80020A88 */
DOTSK_CBACK TSK_SetDoTasksEpilogue(DOTSK_CBACK Func) GLIB_TEXT;                  /* @0x80020AA0 */
TSK_CBACK 	TSK_SetTaskPrologue(TSK_CBACK Pro) GLIB_TEXT;                        /* @0x80020AB8 */
TSK_CBACK 	TSK_SetTaskEpilogue(TSK_CBACK Epi) GLIB_TEXT;                        /* @0x80020AD0 */
void		TSK_SetEpiProFilter(U32 Id,U32 Mask) GLIB_TEXT;                      /* @0x80020AE8 */
void		TSK_ClearEpiProFilter(void) GLIB_TEXT;                               /* @0x80020B00 */
void		TSK_SetExtraStackProtection(BOOL OnOff) GLIB_TEXT;                   /* @0x80020B34 */
TSK_CBACK	TSK_SetStackFloodCallback(TSK_CBACK Func) GLIB_TEXT;                 /* @0x80020B44 */
int			TSK_SetExtraStackSize(int Size) GLIB_TEXT;                           /* @0x80020B5C */

/* File-static in TASKER.C (declared there): DoEpi @0x8001FEFC, DoPro @0x8001FF4C,
 * ReturnToSchedulerIfCurrentTask @0x80020494, DetachFromList @0x8002095C, AddToList @0x800209A8,
 * LoTskKill @0x800209C8, ExecuteTask @0x80020A38, ExtraMarkStack @0x80020B84, CheckExtraStack @0x80020BB0. */

#ifdef __cplusplus
}
#endif
#endif
