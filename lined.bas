''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
''Example FreeBASIC code for wrapper around linenoise.c
''http://github.com/antirez/linenoise
''Copyright (C) 2022, Anirban Banerjee anirbax at gmail dot com
''License GNU GPL v3
''All rights reserved.
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
#include "lined.bi"
dim as zstring ptr lineStrPtr

sub completion cdecl (byval buf as zstring ptr, byval lc as linenoiseCompletions ptr)
	linenoiseAddCompletion(lc,"hello")
	linenoiseAddCompletion(lc,"hello world")
	linenoiseAddCompletion(lc,"hello FreeBASIC")
end sub

function hints cdecl (byval buf as zstring ptr, byval c as integer ptr, byval b as integer ptr) as zstring ptr
    if *buf = "hello" then
        *c = 35
        *b = 0
        return @" world"
    elseif *buf = "hello " then
        *c = 35
        *b = 0
        return @"there"
    end if
    return 0
end function

dim cmdCount as ulongint = 1
dim completionSubPtr as linenoiseCompletionCallback = @completion
dim hintsFunctionPtr as linenoiseHintsCallback = @hints

linenoiseSetCompletionCallback(completionSubPtr)
linenoiseSetHintsCallback(hintsFunctionPtr)
linenoiseHistoryLoad("history.txt")

do
	lineStrPtr = linenoise(!"\x1B[37mbasic #" & str(cmdCount) & !">\x1B[0m ")
	if lineStrPtr = 0 then
		exit do
	end if
	if *lineStrPtr <> "" then
		print "received: "; *lineStrPtr
		cmdCount += 1
	end if

    linenoiseHistoryAdd(lineStrPtr)
	if lineStrPtr <> 0 then
		deallocate(lineStrPtr)
	end if
loop

linenoiseHistorySave("history.txt")
