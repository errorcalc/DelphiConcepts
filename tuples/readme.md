# Tuples concept for Delphi Rio

```delphi
program ProjectTest;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Es.Core.Tuples in 'Es.Core.Tuples.pas';

begin
  var a := TTuple.Create<Integer, string>(123, 'abc');
  var b := TTuple.Create<Integer, string>(123, 'abc');

  writeln('a = b: ', a = b);

  a.Item1 := 0;

  writeln('a = b: ', a = b);

  readln;
end.
```
