UNIT readmodule;

INTERFACE

CONST
  Len = 50;
TYPE
  ArrWordSize = 0 .. Len;
  NewRecord = RECORD
             Word: ARRAY[1 .. Len] OF CHAR;{для записи временного слова}
             Length: ArrWordSize{длина слова-массива}
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
            OR (Ch >= 'а') AND (Ch <= 'я') OR (Ch >= 'А') AND (Ch <= 'Я')
            OR (Ch = '-') 
            OR (Ch = 'ё')
            OR (Ch = 'Ё');
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

    'А' : Ch := 'а';
    'Б' : Ch := 'б';
    'В' : Ch := 'в';
    'Г' : Ch := 'г';
    'Д' : Ch := 'д';
    'Е' : Ch := 'е';
    'Ё' : Ch := 'ё';
    'Ж' : Ch := 'ж';
    'З' : Ch := 'з';
    'И' : Ch := 'и';
    'Й' : Ch := 'й';
    'К' : Ch := 'к';
    'Л' : Ch := 'л';
    'М' : Ch := 'м';
    'Н' : Ch := 'н';
    'О' : Ch := 'о';
    'П' : Ch := 'п';
    'Р' : Ch := 'р';
    'С' : Ch := 'с';
    'Т' : Ch := 'т';
    'У' : Ch := 'у';
    'Ф' : Ch := 'ф';
    'Х' : Ch := 'х';
    'Ц' : Ch := 'ц';
    'Ч' : Ch := 'ч';
    'Ш' : Ch := 'ш';
    'Щ' : Ch := 'щ';
    'Ъ' : Ch := 'ъ';
    'Ы' : Ch := 'ы';
    'Ь' : Ch := 'ь';
    'Э' : Ch := 'э';
    'Ю' : Ch := 'ю';
    'Я' : Ch := 'я';
  END;
END;

PROCEDURE ReadWord(VAR NowWord: NewRecord; Ch: CHAR);
VAR
   I: INTEGER;
BEGIN{ReadWord}
  {прочитать слово в массив NowWord и кол-во символов -> MaxInput}
  I := 0;
  NowWord.Length := 1;
  IF NOT EOLN(InpF)
  THEN
    READ(InpF, Ch);
  WHILE (NOT(IsLetter(Ch))) AND (NOT EOLN(InpF)){СКИП мусора}
  DO
    READ(InpF, Ch);
    IF (I = 0) AND (Ch = '-')
    THEN
      BEGIN
        WHILE (Ch <> ' ') AND (NOT EOLN(InpF))
        DO
          READ(InpF, Ch);
      END;
  WHILE (I < Len) AND (IsLetter(Ch)) AND (NOT EOLN(InpF)){читать СЛОВО}
  DO
    BEGIN
      ConvertToLowerCase(Ch);
      I := I + 1;
      NowWord.Word[I] := Ch;
      READ(InpF, Ch);
    END;
  IF IsLetter(Ch){если вышли по EOLN}
  THEN
    BEGIN
      ConvertToLowerCase(Ch);
      I := I + 1;
      NowWord.Word[I] := Ch
    END;
  IF (I = 1) AND (NowWord.Word[1] = '-'){если одно -}
  THEN
    I := 0; 
  NowWord.Length := I
END;{ReadWord}

BEGIN
END.
