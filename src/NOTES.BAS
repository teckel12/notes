DEFINT A-Z

GOSUB loadnotes
GOSUB selectnote
END

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
CLS
PRINT "Notes:" + CHR$(13)
FOR i = 1 TO notescnt
    PRINT i; "- " + notes$(i, 1)
NEXT i
PRINT
INPUT "Select note from list"; note
PRINT note
RETURN

