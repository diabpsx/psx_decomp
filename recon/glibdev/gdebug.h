#ifndef GLIBDEV_GDEBUG_H
#define GLIBDEV_GDEBUG_H
/* GDEBUG.C — Climax GLIB debug (C lane). */
#ifdef __cplusplus
extern "C" {
#endif
void DBG_Error(char *Text, char *File, int Line);   /* @0x80020E94 */
#ifdef __cplusplus
}
#endif
#ifndef __cplusplus
/* C lane (GLIB TUs) only -- the rest of Climax's GDEBUG.H api (SBSPSS gdebug.h) plus DBG_SetPollRoutine
 * (retail @0x80020EE0).  Kept out of C++ TUs, which carry their own per-TU declarations.
 * DBG_SetMessageHandler (va_list parameter) is declared in gdebug.c. */
#include "diabpsx_types.h"
unsigned char DBG_OpenModule(void);                              /* @0x80020E54 (BOOL) */
void DBG_PollHost(void);                                         /* @0x80020E5C */
void DBG_Halt(void);                                             /* @0x80020E64 */
void DBG_SendMessage(char *e, ...);                              /* @0x80020E6C */
void DBG_SetErrorFunc(void (*EFunc)(char *Text, char *File, int Line));   /* @0x80020EC8 */
void SendPsyqString(char *e);                                    /* @0x80020ED8 */
void DBG_SetPollRoutine(void (*Func)(void));                     /* @0x80020EE0 */
#endif
#endif
