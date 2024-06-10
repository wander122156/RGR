UNIT sortmodule;

INTERFACE

USES readmodule;
TYPE
  Tree = ^WordCount;
  WordCount = RECORD
               Word: ARRAY[1 .. Len] OF CHAR; {для записи слова}
               Left, Right: Tree;
               Count: INTEGER; {кол-во встреченных}
               Length: ArrWordSize {длина слова-массива}
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
BEGIN {сравнение с сущ веткой}
  Index := 1;
  Res := '0';
  WHILE ((Index <= NowWord.Length) OR (Index <= Ptr^.Length)) AND (Res = '0'){Изменил and на or 
  для того, чтобы если первое слово закончилось цикл не прерывался и проверилось 
  одно из условий когда файл закончился} 
  DO
    BEGIN  {WHILE}       
    {общий случай} 
      IF (NowWord.Word[Index] = Ptr^.Word[Index]) AND (Index = NowWord.Length) AND (Index <> Ptr^.Length)
      THEN
        Res := '1';{1 короче 2}
      IF (NowWord.Word[Index] = Ptr^.Word[Index]) AND (Index <> NowWord.Length) AND (Index = Ptr^.Length)
      THEN
        Res := '2';{2 короче 1}
      IF ((NowWord.Word[Index] = 'ё') AND (Ptr^.Word[Index] <> 'ё') OR (NowWord.Word[Index] <> 'ё') AND (Ptr^.Word[Index] = 'ё')) AND (Res = '0')
      THEN
        BEGIN {ё}
          IF Ptr^.Word[Index] = 'ё'
          THEN
            IF NowWord.Word[Index] <= 'е'
            THEN
              Res := '1' 
            ELSE
              IF NowWord.Word[Index] >= 'ж'
              THEN 
                Res := '2'
                    
          ELSE  
            IF NowWord.Word[Index] = 'ё'
            THEN
              IF Ptr^.Word[Index] <= 'е'
              THEN
                Res := '2'
              ELSE
                IF Ptr^.Word[Index] >= 'ж'
                THEN 
                  Res := '1' 
        END {ё}
      ELSE{нет ё}       
        IF (NowWord.Word[Index] < Ptr^.Word[Index])
        THEN 
          Res := '1'
        ELSE
          IF (NowWord.Word[Index] > Ptr^.Word[Index])
          THEN 
            Res := '2';
      {общий случай}
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
      IF Ptr = NIL {новая ветка}
      THEN
        BEGIN {Создаем ветвь со значением NowWord}
          NEW(Ptr);
          {записать слово в массив WORD}
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
  { Реализуйте печать дерева }
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
