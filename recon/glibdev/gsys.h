#ifndef GLIBDEV_GSYS_H
#define GLIBDEV_GSYS_H
/* GSYS.H -- Climax GLIB machine-independent system API (C lane).
 * Prototypes/VAs: JAP skeleton GLIBDEV/SOURCE/PSX/GSYS.H; MEM_INFO = SYM STRTAG MEM_INFO (size 8)
 * == Climax's own SBSPSS Utils/Libs/GLib/gsys.h (Gary Liddon). */
#include "diabpsx_types.h"

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

typedef struct MEM_INFO
{
	void *	Addr;                       /* +0x00 */
	U32		Size;                       /* +0x04 */

}	MEM_INFO;

#ifdef __cplusplus
extern "C" {
#endif

/*	System Initialisation stuff */
BOOL	GSYS_InitMachine(void) GLIB_TEXT;                                       /* @0x800211E0 */

/*	Stack handling functions */
void	GSYS_SetStackAndJump(void *Stack,void(*Func)(void *),void *Param) GLIB_TEXT;   /* @0x8002117C */
void	GSYS_MarkStack(void * Stack, U32 StackSize) GLIB_TEXT;                  /* @0x800211B8 */
BOOL	GSYS_IsStackCorrupted(void * Stack, U32 StackSize) GLIB_TEXT;           /* @0x800211C8 */
BOOL	GSYS_CheckPtr(void *Ptr) GLIB_TEXT;                                     /* @0x80021234 */
BOOL	GSYS_IsStackOutOfBounds(void* Stack, U32 StackSize) GLIB_TEXT;          /* @0x80021268 */

/*	Machine Info Functions */
const MEM_INFO *	GSYS_GetWorkMemInfo(void) GLIB_TEXT;                                /* @0x8002116C */

/*	Global Vars (defined in the PSX memory-init C++ TU) */
extern UINT		GSYS_MemStart;          /* @0x8011AACC */
extern UINT		GSYS_MemEnd;            /* @0x8011AAD0 */

#ifdef __cplusplus
}
#endif
#endif
