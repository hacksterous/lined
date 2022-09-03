''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
''FreeBASIC wrapper around linenoise.c
''http://github.com/antirez/linenoise
''Copyright (C) 2022, Anirban Banerjee anirbax at gmail dot com
''License GNU GPL v3
''All rights reserved.
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
type linenoiseCompletions
	as integer len
	as zstring ptr ptr cvec
end type  
type linenoiseCompletionCallback as sub cdecl (byval as zstring ptr, byval as linenoiseCompletions ptr)
type linenoiseHintsCallback as function cdecl (byval as zstring ptr, byval as integer ptr, byval as integer ptr) as zstring ptr
type linenoiseFreeHintsCallback as sub cdecl (byval as any ptr)

declare sub linenoiseSetCompletionCallback cdecl alias "linenoiseSetCompletionCallback" (byval as linenoiseCompletionCallback)
declare sub linenoiseSetHintsCallback cdecl alias "linenoiseSetHintsCallback" (byval as linenoiseHintsCallback)
declare sub linenoiseSetFreeHintsCallback cdecl alias "linenoiseSetFreeHintsCallback" (byval as linenoiseFreeHintsCallback)
declare sub linenoiseAddCompletion cdecl alias "linenoiseAddCompletion" (byval as linenoiseCompletions ptr, byval as zstring ptr)

declare function linenoise cdecl alias "linenoise" (byval as const zstring ptr) as zstring ptr
declare sub linenoiseFree cdecl alias "linenoiseFree" (byval as any ptr)
declare sub linenoiseHistoryAdd cdecl alias "linenoiseHistoryAdd" (byval as const zstring ptr)
declare sub linenoiseHistorySetMaxLen cdecl alias "linenoiseHistorySetMaxLen" (byval as integer)
declare sub linenoiseHistorySave cdecl alias "linenoiseHistorySave" (byval as const zstring ptr)
declare sub linenoiseHistoryLoad cdecl alias "linenoiseHistoryLoad" (byval as const zstring ptr)
declare sub linenoiseClearScreen cdecl alias "linenoiseClearScreen" ()
declare sub linenoiseSetMultiLine cdecl alias "linenoiseSetMultiLine" (byval as integer)
declare sub linenoisePrintKeyCodes cdecl alias "linenoisePrintKeyCodes" ()
declare sub linenoiseMaskModeEnable cdecl alias "linenoiseMaskModeEnable" ()
declare sub linenoiseMaskModeDisable cdecl alias "linenoiseMaskModeDisable" ()

