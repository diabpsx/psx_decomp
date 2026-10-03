/* ===========================================================================
	File:		GDEBUG.C

	Notes:		PSX Implementation of glib debug api

	Author:		G Robert Liddon @ 73b

	Created:	Wednesday 27th March 1996

	Copyright (C) 1996 DCI Ltd All rights reserved. 
  ============================================================================ */


/* ---------------------------------------------------------------------------
	Standard Lib Includes
	--------------------- */
#define GLIB_TEXT __attribute__((section(".text.lib")))	/* recon: lib-segment placement */
typedef char *va_list;								/* gcc va-mips.h (retail SYM: va_list = PTR CHAR) */
#define GLIB_API									/* GTYPES.H */
#define FALSE 0									/* GTYPES.H */
#define TRUE (!FALSE)								/* GTYPES.H */

/* ---------------------------------------------------------------------------
	Glib Includes
	------------- */
#include "glibdev/gdebug.h"

/* ---------------------------------------------------------------------------
	Game Includes
	------------- */

/* ---------------------------------------------------------------------------
	Function Prototypes
	------------------- */
GLIB_API BOOL	DBG_OpenModule(void) GLIB_TEXT;
GLIB_API void	DBG_PollHost(void) GLIB_TEXT;
GLIB_API void	DBG_Halt(void) GLIB_TEXT;
GLIB_API void	DBG_SendMessage(char *e,...) GLIB_TEXT;
GLIB_API void	DBG_SetMessageHandler(void (*Func)(char *e,va_list argptr)) GLIB_TEXT;
GLIB_API void	DBG_Error(char *Text,char *File,int Line) GLIB_TEXT;
GLIB_API void	DBG_SetErrorFunc(void (*EFunc)(char *Text,char *File,int Line)) GLIB_TEXT;
void			SendPsyqString(char *e) GLIB_TEXT;
GLIB_API void	DBG_SetPollRoutine(void (*Func)(void)) GLIB_TEXT;

/* ---------------------------------------------------------------------------
	Vars
	---- */
void (*PollFunc)(void);
void (*MsgFunc)(char *e,va_list argptr);
void (*ErrorFunc)(char *Text,char *File,int Line);

/*	---------------------------------------------------------------------------
	Function:	BOOL DBG_OpenModule(void);

	Purpose:	Initialise the debug module

	Returns:	FALSE if unable to init

	--------------------------------------------------------------------------- */
GLIB_API BOOL DBG_OpenModule(void)
{
	return(TRUE);
}	


/*	---------------------------------------------------------------------------
	Function:	void	DBG_PollHost(void)

	Purpose:	Poll the host to enable debugging

	--------------------------------------------------------------------------- */
GLIB_API void DBG_PollHost(void)
{
}	

/*	---------------------------------------------------------------------------
	Function:	void	DBG_Halt(void)

	Purpose:	Stop where I am

	--------------------------------------------------------------------------- */
GLIB_API void DBG_Halt(void)
{
	while (1);
}	


/*	---------------------------------------------------------------------------
	Function:	void DBG_SendMessage(char *e,...)

	Purpose:	Send a diagnostic messgae

	--------------------------------------------------------------------------- */

GLIB_API void DBG_SendMessage(char *e,...)
{
}	

/*	---------------------------------------------------------------------------
	Function:	void DBG_SetMessageHandler(void (*Func)(char *e,va_list argptr))

	Purpose:	Set the message handler

	--------------------------------------------------------------------------- */
GLIB_API void DBG_SetMessageHandler(void (*Func)(char *e,va_list argptr))
{
	MsgFunc=Func;
}	
/*	---------------------------------------------------------------------------
	Function:	void DBG_Error(char *Text,char *File,int Line);

	Purpose:	Send a msg to psyq host

	--------------------------------------------------------------------------- */

GLIB_API void DBG_Error(char *Text,char *File,int Line)
{
	if (ErrorFunc)
		ErrorFunc(Text,File,Line);

	DBG_Halt();
}	

GLIB_API void DBG_SetErrorFunc(void (*EFunc)(char *Text,char *File,int Line))
{
	ErrorFunc=EFunc;
}

/*	---------------------------------------------------------------------------
	Function:	static void SendPsyqString(char *e)

	Purpose:	Send a msg to psyq host

	--------------------------------------------------------------------------- */
void SendPsyqString(char *e)
{
}	

/*	---------------------------------------------------------------------------
	Function:	void DBG_SetPollRoutine(void (*Func)(void))

	Purpose:	Set the routine called when polling the host

	--------------------------------------------------------------------------- */
GLIB_API void DBG_SetPollRoutine(void (*Func)(void))
{
	PollFunc=Func;
}	


/* ---------------------------------------------------------------------------
	ends */

/* Reconstruction notes (appended after Climax's footer):
   Retail: C:\DIABPSX\GLIBDEV\SOURCE\PSX\GDEBUG.C @0x80020E54..0x80020EF0 (oracles asm/nonmatchings/lib/DBG_*.s,
   SendPsyqString.s; SYM function/param records). Base text = Climax's own Gdebug.c (SBSPSS). Added from
   the retail evidence: PollFunc (SYM EXT, common @0x8011CA88; declared first = retail SYM record order), DBG_SetPollRoutine (its comment block is
   modelled on the neighbours'), DBG_Error = ErrorFunc dispatch with the incoming arguments then DBG_Halt
   (the 1997-12-12 beta has the dispatch without DBG_Halt), the GLIB_TEXT prototype list and the
   GTYPES.H/va_list lines. Retail line numbers are larger throughout (compiled-out debug text that no
   available copy carries), so SLD lines differ; code is unaffected. GLIB C objects are -G0. */
