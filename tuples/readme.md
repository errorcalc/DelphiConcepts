# Tuples concept for Delphi Rio

```delphi
program ProjectTest;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Es.Core.Tuples in 'Es.Core.Tuples.pas';

function GetAnyTuple: TTuple<Integer, string>;
begin
  Result := TTuple.Create<Integer, string>(123, 'SUPER');
end;

begin
  var a := TTuple.Create<Integer, string>(123, 'abc');
  var b := TTuple.Create<Integer, string>(123, 'abc');

  writeln('a = b: ', a = b);

  a.Item1 := 0;

  writeln('a = b: ', a = b);

  writeln('GetAnyTuple = TTuple.Create<Integer, string>(123, ''SUPER''): ',
    GetAnyTuple = TTuple.Create<Integer, string>(123, 'SUPER'));

  readln;
end.
```
