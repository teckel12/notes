DEFINT A-Z

GOSUB loadnotes

mainloop:
GOSUB selectnote
GOSUB displaynote
GOTO mainloop

loadnotes:
OPEN "NOTES.DAT" FOR INPUT AS #1
INPUT #1, notescnt
DIM notes$(notescnt, 2)
FOR i = 1 TO notescnt
    LINE INPUT #1, notes$(i, 1)
    OPEN notes$(i, 1) + ".txt" FOR INPUT AS #2
    note$ = ""
    DO
        LINE INPUT #2, tmp$
        note$ = note$ + tmp$ + CHR$(13)
    LOOP WHILE NOT EOF(2)
    CLOSE #2
    notes$(i, 2) = note$
NEXT i
CLOSE #1
RETURN

selectnote:
PRINT CHR$(13) + "Notes:" + CHR$(13)
FOR i = 1 TO notescnt
    PRINT i; "- " + notes$(i, 1)
NEXT i
PRINT
INPUT "Select note from list (0 to exit)"; note
IF note = 0 THEN
    END
END IF
IF note > notescnt THEN
    PRINT CHR$(13) + "Invalid note, press any key to try again"
    a$ = ""
    WHILE a$ = "": a$ = UCASE$(INKEY$): WEND
    CLS
    GOTO selectnote
END IF
RETURN

displaynote:
CLS
PRINT "Note: " + notes$(note, 1) + CHR$(13)
PRINT notes$(note, 2)
RETURN
