PROGRAM CountWordsFirst(INPUT, OUTPUT);
USES sortmodule;
USES readmodule;

{VAR
  WordInCounter: INTEGER;}


BEGIN {TreeSort}
  ASSIGN(InpF, 'InpF.txt');
  RESET(InpF);
  ASSIGN(OutF, 'OutF.txt');
  REWRITE(OutF);
  Root := NIL;
  {WordInCounter := 1; }
  WHILE NOT EOF(InpF){ AND (WordInCounter < 1000)}
  DO
    BEGIN
      WHILE NOT EOLN(InpF){ AND (WordInCounter < 1000) }
      DO
        BEGIN
          ReadWord(NowWord, Ch);
          Insert(Root, NowWord);
          {WordInCounter := WordInCounter + 1}
        END;
      READLN(InpF)
    END;                                                 
  PrintDictionary(Root){заменить на PrintDictionary}
END.  {TreeSort}
