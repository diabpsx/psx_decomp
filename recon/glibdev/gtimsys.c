/* ===========================================================================
	File:		GTIMSYS.C

	Notes:		Timing system stuff needed by gtim

	Author:		G Robert Liddon @ 73b

	Copyright (C) 1996 DCI Ltd All rights reserved. 
  ============================================================================ */

/* ---------------------------------------------------------------------------
	Standard Lib Includes
	--------------------- */

/*	Standard Lib
	------------ */
#define GLIB_TEXT __attribute__((section(".text.lib")))   /* stdio.h */

/*	PSX Os
	------ */

#define RCntCNT1 (0xf2000000|0x01)   /* KERNEL.H DescRC|0x01 */
#define RCntMdNOINTR 0x2000
extern long SetRCnt(unsigned long, unsigned short, long); extern long GetRCnt(unsigned long); extern long ResetRCnt(unsigned long); extern long StartRCnt(unsigned long);
extern int EnterCriticalSection(void); extern void ExitCriticalSection(void);
extern int VSync(int mode);   /* LIBETC.H */
/*	Glib
	---- */
typedef unsigned long U32; void DBG_SendMessage(char *e,...); /* gdebug.h (GTYPES.H, __GL_DEBUG__) */

/*	Headers
	------- */
U32 GTIMSYS_InitTimer(void) GLIB_TEXT; void GTIMSYS_ResetTimer(void) GLIB_TEXT; U32 GTIMSYS_GetTimer(void) GLIB_TEXT;   /* gtimsys.h */

/* ---------------------------------------------------------------------------
	Defines and Enums
	----------------- */

/* ---------------------------------------------------------------------------
	Structs
	------- */

/* ---------------------------------------------------------------------------
	Vars
	---- */

/* ---------------------------------------------------------------------------
	Code n that
   --------------------------------------------------------------------------- */

U32 GTIMSYS_GetTimer(void)
{
	return(GetRCnt(RCntCNT1));
}

void GTIMSYS_ResetTimer(void)
{
	ResetRCnt(RCntCNT1);
}


U32 GTIMSYS_InitTimer(void)
{
	int		f;
	U32		Total;


	EnterCriticalSection();

	SetRCnt(RCntCNT1,0xffff,RCntMdNOINTR);
	StartRCnt(RCntCNT1);
	ResetRCnt(RCntCNT1);
	ExitCriticalSection();

	Total=0;


	for (f=0;f<10;f++)
		{
		VSync(0);
		ResetRCnt(RCntCNT1);
		VSync(0);
		Total+=GetRCnt(RCntCNT1);
		}

	Total/=10;

	DBG_SendMessage("tff %ld",Total);

	return(Total);
}



/* ---------------------------------------------------------------------------
	ends */
