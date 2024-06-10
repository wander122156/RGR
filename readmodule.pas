UNIT readmodule;

INTERFACE

CONST
  Len = 50;
TYPE
  ArrWordSize = 0 .. Len;
  NewRecord = RECORD
             Word: ARRAY[1 .. Len] OF CHAR;{��� ������ ���������� �����}
             Length: ArrWordSize{����� �����-�������}
           END; 
VAR
  Ch: CHAR;
  NowWord: NewRecord;
  InpF, OutF: TEXT;
  I: INTEGER;
FUNCTION IsLetter(Ch: CHAR): BOOLEAN;  
PROCEDURE ConvertToLowerCase(VAR Ch: Char);
PROCEDURE ReadWord(VAR NowWord: NewRecord; Ch: CHAR);  
  
IMPLEMENTATION

FUNCTION IsLetter(Ch: CHAR): BOOLEAN;
BEGIN
  IsLetter := (Ch >= 'a') AND (Ch <= 'z') OR (Ch >= 'A') AND (Ch <= 'Z')
            OR (Ch >= '�') AND (Ch <= '�') OR (Ch >= '�') AND (Ch <= '�')
            OR (Ch = '-') 
            OR (Ch = '�')
            OR (Ch = '�');
END;

PROCEDURE ConvertToLowerCase(var Ch: Char);
BEGIN
  CASE Ch OF
    'A' : Ch := 'a';
    'B' : Ch := 'b';
    'C' : Ch := 'c';
    'D' : Ch := 'd';
    'E' : Ch := 'e';
    'F' : Ch := 'f';
    'G' : Ch := 'g';
    'H' : Ch := 'h';
    'I' : Ch := 'i';
    'J' : Ch := 'j';
    'K' : Ch := 'k';
    'L' : Ch := 'l';
    'M' : Ch := 'm';
    'N' : Ch := 'n';
    'O' : Ch := 'o';
    'P' : Ch := 'p';
    'Q' : Ch := 'q';
    'R' : Ch := 'r';
    'S' : Ch := 's';
    'T' : Ch := 't';
    'U' : Ch := 'u';
    'V' : Ch := 'v';
    'W' : Ch := 'w';
    'X' : Ch := 'x';
    'Y' : Ch := 'y';
    'Z' : Ch := 'z';

    '�' : Ch := '�';
    '�' : Ch := '�';
    '�' : Ch := '�';
    '�' : Ch := '�';
    '�' : Ch := '�';
    '�' : Ch := '�';
    '�' : Ch := '�';
    '�' : Ch := '�';
    '�' : Ch := '�';
    '�' : Ch := '�';
    '�' : Ch := '�';
    '�' : Ch := '�';
    '�' : Ch := '�';
    '�' : Ch := '�';
    '�' : Ch := '�';
    '�' : Ch := '�';
    '�' : Ch := '�';
    '�' : Ch := '�';
    '�' : Ch := '�';
    '�' : Ch := '�';
    '�' : Ch := '�';
    '�' : Ch := '�';
    '�' : Ch := '�';
    '�' : Ch := '�';
    '�' : Ch := '�';
    '�' : Ch := '�';
    '�' : Ch := '�';
    '�' : Ch := '�';
    '�' : Ch := '�';
    '�' : Ch := '�';
    '�' : Ch := '�';
    '�' : Ch := '�';
    '�' : Ch := '�';
  END;
END;

PROCEDURE ReadWord(VAR NowWord: NewRecord; Ch: CHAR);
VAR
   I: INTEGER;
BEGIN{ReadWord}
  {��������� ����� � ������ NowWord � ���-�� �������� -> MaxInput}
  I := 0;
  NowWord.Length := 1;
  IF NOT EOLN(InpF)
  THEN
    READ(InpF, Ch);
  WHILE (NOT(IsLetter(Ch))) AND (NOT EOLN(InpF)){���� ������}
  DO
    READ(InpF, Ch);
    IF (I = 0) AND (Ch = '-')
    THEN
      BEGIN
        WHILE (Ch <> ' ') AND (NOT EOLN(InpF))
        DO
          READ(InpF, Ch);
      END;
  WHILE (I < Len) AND (IsLetter(Ch)) AND (NOT EOLN(InpF)){������ �����}
  DO
    BEGIN
      ConvertToLowerCase(Ch);
      I := I + 1;
      NowWord.Word[I] := Ch;
      READ(InpF, Ch);
    END;
  IF IsLetter(Ch){���� ����� �� EOLN}
  THEN
    BEGIN
      ConvertToLowerCase(Ch);
      I := I + 1;
      NowWord.Word[I] := Ch
    END;
  IF (I = 1) AND (NowWord.Word[1] = '-'){���� ���� -}
  THEN
    I := 0; 
  NowWord.Length := I
END;{ReadWord}

BEGIN
END.
