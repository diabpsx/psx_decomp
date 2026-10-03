/* ===========================================================================
	File:		GSYS.C

	Notes:		PSX implemtatiom of GSYS.H api (reconstructed from the MSVS PC GSYS.C text)

	Author:		G Robert Liddon @ 73b

	Created:	Wednesday 27th March 1996

	Copyright (C) 1996 DCI Ltd All rights reserved. 
  ============================================================================ */


 /* ---------------------------------------------------------------------------
	Includes
	-------- */

/*	Standard Lib
	------------ */
#define GLIB_TEXT __attribute__((section(".text.lib")))	/* recon: lib-segment placement */
extern unsigned long SetSp(unsigned long);		/* PsyQ 4.0 KERNEL.H */
extern unsigned long GetSp( void );				/* PsyQ 4.0 KERNEL.H */

/*	Glib
	---- */
#include "glibdev/gsys.h"
extern void FirstFreeByte(void);				/* GSYSASM.H: first byte after the linked image (@0x80163E20) */


/* ---------------------------------------------------------------------------
	Defines
	------- */

/* ---------------------------------------------------------------------------
	Function Prototypes
	------------------- */
extern int ResetCallback(void) ;				/* PsyQ 4.0 LIBETC.H */

/* ---------------------------------------------------------------------------
	Defines
	------- */

/* ---------------------------------------------------------------------------
	Exterenal Variables
	------------------- */

/* ---------------------------------------------------------------------------
	Variables
	--------- */

/* ---------------------------------------------------------------------------
	Define the PSX stack
	-------------------- */
extern int		_stacksize;

/* ---------------------------------------------------------------------------
	Tables
	------ */
MEM_INFO WorkMemInfo=
{
	NULL,
	0,
};

/*	---------------------------------------------------------------------------
	Function:	const MEM_INFO *GSYS_GetMemInfo(MEM_ID Id)

	Purpose:	Get description of a free mem type for this system

	Returns:	-> struct containg info

	--------------------------------------------------------------------------- */
const MEM_INFO *GSYS_GetWorkMemInfo(void)
{
	return(&WorkMemInfo);
}	

/*	---------------------------------------------------------------------------
	Function:	void GSYS_SetStackAndJump(void *Stack,void(*Func)(void *),void *Param)

	Purpose:	Set the stack pointer and jump to a routine on PSX

	Params:		Stack ->	New Stack Ptr
				Func ->		Routine to jump to
				Param		Parameter to pass to function

	--------------------------------------------------------------------------- */
void GSYS_SetStackAndJump(void *Stack,void(*Func)(void *),void *Param)
{
	SetSp((unsigned long)Stack);
	Func(Param);
}	


/*	---------------------------------------------------------------------------
	Function:	void GSYS_MarkStack(void * Stack, U32 StackSize)

	Purpose:	Marks a stack so that it can be checked to see if it's
				been corrupted. In GSYS to account for stack direction
				on different platforms

	Params:		Stack ->	Stack
				StackSize	Stack Size

	--------------------------------------------------------------------------- */

#define STACK_MARK_CODE 0xabcd0123

void GSYS_MarkStack(void * Stack, U32 StackSize)
{
	U32 *	StackStart;

	StackStart=Stack;
	(*StackStart)=STACK_MARK_CODE;
}


/*	---------------------------------------------------------------------------
	Function:	BOOL GSYS_IsStackCorrupted(void * Stack, U32 StackSize)

	Purpose:	Check to see if a previously marked stack has been corrupted

	Params:		Stack ->	Stack
				StackSize	Stack Size

	Returns:	TRUE if it has

	--------------------------------------------------------------------------- */
BOOL GSYS_IsStackCorrupted(void * Stack, U32 StackSize)
{
	U32 *	StackStart;
	StackStart=Stack;

	return (*StackStart!=STACK_MARK_CODE);
}	


/*	---------------------------------------------------------------------------
	Function:	BOOL	GSYS_InitMachine(void)

	Purpose:	Initialise the machine for work
	
	Returns:	Succesful of not

	--------------------------------------------------------------------------- */
BOOL GSYS_InitMachine(void)
{
	ResetCallback();

	WorkMemInfo.Addr=(void *)FirstFreeByte;
	WorkMemInfo.Size=GSYS_MemEnd-(U32)FirstFreeByte-_stacksize;
	return(TRUE);
}	


/*	---------------------------------------------------------------------------
	Function:	BOOL GSYS_CheckPtr(void *Ptr)


	Purpose:	See if this ptr -> to an address within the machines
				memor
	
	Returns:	Succesful of not

	--------------------------------------------------------------------------- */
void *		LastPtr;


BOOL GSYS_CheckPtr(void *Ptr)
{
	U32		Addr;

	LastPtr=Ptr;

	Addr=(U32)Ptr;

	if (Addr < GSYS_MemStart)
		return(FALSE);

	if (Addr >= GSYS_MemEnd)
		return(FALSE);

	return(TRUE);
}	

/*	---------------------------------------------------------------------------
	Function:	BOOL GSYS_IsStackOutOfBounds(void* Stack, U32 StackSize)

	Purpose:	Is the current sp outside the range of the stack
	
	Returns:	TRUE if so

	--------------------------------------------------------------------------- */
BOOL GSYS_IsStackOutOfBounds(void* Stack, U32 StackSize)
{
	U32		ThisSp;
	ThisSp=GetSp();
	return(ThisSp < (U32)Stack || ThisSp >= (U32)Stack+StackSize);
}	

/* ---------------------------------------------------------------------------
	ends */

/* Reconstruction notes (appended after Climax's footer; no retail line moves):
   Retail: C:\DIABPSX\GLIBDEV\SOURCE\PSX\GSYS.C @0x8002116C..0x800212C4 (oracles asm/nonmatchings/lib/GSYS_*.s,
   SYM function/param/local/block records, per-instruction SLD). Text = Climax's PC GSYS.C with the PSX
   bodies; every statement sits on its retail SLD line. Non-code lines that differ from the PC text
   (SDK prototype lines, the LastPtr definition before GSYS_CheckPtr, one blank before the InitMachine
   comment) are inferred from the retail line map, their exact original wording is unknown.
   GLIB C objects are -G0 (owned commons LastPtr/WorkMemInfo are addressed absolutely). */
