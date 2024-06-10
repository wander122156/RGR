UNIT sortmodule;

INTERFACE

USES readmodule;
TYPE
  Tree = ^WordCount;
  WordCount = RECORD
               Word: ARRAY[1 .. Len] OF CHAR; {��� ������ �����}
               Left, Right: Tree;
               Count: INTEGER; {���-�� �����������}
               Length: ArrWordSize {����� �����-�������}
             END;
VAR
  Root: Tree;
PROCEDURE Insert(VAR Ptr: Tree; NowWord: NewRecord);
PROCEDURE PrintDictionary(Ptr: Tree);
FUNCTION CompareWords(VAR NowWord: NewRecord; Ptr: Tree): CHAR;

IMPLEMENTATION

FUNCTION CompareWords(VAR NowWord: NewRecord; Ptr: Tree): CHAR;
VAR
  Index: INTEGER;
  Res: CHAR;   
BEGIN {��������� � ��� ������}
  Index := 1;
  Res := '0';
  WHILE ((Index <= NowWord.Length) OR (Index <= Ptr^.Length)) AND (Res = '0'){������� and �� or 
  ��� ����, ����� ���� ������ ����� ����������� ���� �� ���������� � ����������� 
  ���� �� ������� ����� ���� ����������} 
  DO
    BEGIN  {WHILE}       
    {����� ������} 
      IF (NowWord.Word[Index] = Ptr^.Word[Index]) AND (Index = NowWord.Length) AND (Index <> Ptr^.Length)
      THEN
        Res := '1';{1 ������ 2}
      IF (NowWord.Word[Index] = Ptr^.Word[Index]) AND (Index <> NowWord.Length) AND (Index = Ptr^.Length)
      THEN
        Res := '2';{2 ������ 1}
      IF ((NowWord.Word[Index] = '�') AND (Ptr^.Word[Index] <> '�') OR (NowWord.Word[Index] <> '�') AND (Ptr^.Word[Index] = '�')) AND (Res = '0')
      THEN
        BEGIN {�}
          IF Ptr^.Word[Index] = '�'
          THEN
            IF NowWord.Word[Index] <= '�'
            THEN
              Res := '1' 
            ELSE
              IF NowWord.Word[Index] >= '�'
              THEN 
                Res := '2'
                    
          ELSE  
            IF NowWord.Word[Index] = '�'
            THEN
              IF Ptr^.Word[Index] <= '�'
              THEN
                Res := '2'
              ELSE
                IF Ptr^.Word[Index] >= '�'
                THEN 
                  Res := '1' 
        END {�}
      ELSE{��� �}       
        IF (NowWord.Word[Index] < Ptr^.Word[Index])
        THEN 
          Res := '1'
        ELSE
          IF (NowWord.Word[Index] > Ptr^.Word[Index])
          THEN 
            Res := '2';
      {����� ������}
      Index := Index + 1
    END;  {WHILE}
    CompareWords := Res;
END;                    
 
PROCEDURE Insert(VAR Ptr: Tree; NowWord: NewRecord);
VAR
  Index: INTEGER;
  Result: CHAR;
BEGIN {Insert}
  IF NowWord.Length <> 0
  THEN 
    BEGIN{NowWord.Length <> 0} 
      IF Ptr = NIL {����� �����}
      THEN
        BEGIN {������� ����� �� ��������� NowWord}
          NEW(Ptr);
          {�������� ����� � ������ WORD}
          FOR Index := 1 TO NowWord.Length
          DO 
            Ptr^.Word[Index] := NowWord.Word[Index]; 
          Ptr^.Length := NowWord.Length;      
          Ptr^.Left := NIL;
          Ptr^.Right := NIL;
          Ptr^.Count := 1                                           
        END
      ELSE
        BEGIN 
          Result := CompareWords(NowWord, Ptr);
          IF Result = '0'
          THEN
            Ptr^.Count:= Ptr^.Count + 1
          ELSE
            IF Result = '1'
            THEN 
              Insert(Ptr^.Left, NowWord) 
            ELSE
              Insert(Ptr^.Right, NowWord)
        END
    END{NowWord.Length <> 0} 
END;{Insert}

PROCEDURE PrintDictionary(Ptr: Tree);
VAR
  I : INTEGER;
BEGIN {PrintDictionary}
  { ���������� ������ ������ }
  IF Ptr <> NIL
  THEN
    BEGIN
      PrintDictionary(Ptr^.Left);     
      FOR I := 1 TO Ptr^.Length
      DO
 	      WRITE(OutF, Ptr^.Word[I]);
  	  WRITELN(OutF, ' ', Ptr^.Count);
  	  PrintDictionary(Ptr^.Right)
    END
END;  {PrintDictionary}
BEGIN
END.
