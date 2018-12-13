unit Es.Core.Tuples;

interface

type
  TTuple<T1> = record
  public
    Item1: T1;
    class operator Equal(a, b: TTuple<T1>) : Boolean;
    class operator NotEqual(a, b: TTuple<T1>) : Boolean;
    constructor Create(Item1: T1); overload;
  end;

  TTuple<T1, T2> = record
  public
    Item1: T1;
    Item2: T2;
    class operator Equal(a, b: TTuple<T1, T2>) : Boolean;
    class operator NotEqual(a, b: TTuple<T1, T2>) : Boolean;
    constructor Create(Item1: T1; Item2: T2); overload;
  end;

  // need create TTuple<...> for three to eight arguments

  TTuple = class
    class function Create<T1>(Item1: T1): TTuple<T1>; overload; static;
    class function Create<T1, T2>(Item1: T1; Item2: T2): TTuple<T1, T2>; overload; static;
  end;

implementation

uses
  System.Generics.Defaults;

{ TTuple }

class function TTuple.Create<T1>(Item1: T1): TTuple<T1>;
begin
  Result := TTuple<T1>.Create(Item1);
end;

class function TTuple.Create<T1, T2>(Item1: T1; Item2: T2): TTuple<T1, T2>;
begin
  Result := TTuple<T1, T2>.Create(Item1, Item2);
end;

{ TTuple<T1> }

constructor TTuple<T1>.Create(Item1: T1);
begin
  Self.Item1 := Item1;
end;

class operator TTuple<T1>.Equal(a, b: TTuple<T1>): Boolean;
begin
  Result := (TComparer<T1>.Default.Compare(a.Item1, b.Item1) = 0);
end;

class operator TTuple<T1>.NotEqual(a, b: TTuple<T1>): Boolean;
begin
  Result := not (a = b);
end;

{ Tuple<T1, T2> }

constructor TTuple<T1, T2>.Create(Item1: T1; Item2: T2);
begin
  Self.Item1 := Item1;
  Self.Item2 := Item2;
end;

class operator TTuple<T1, T2>.Equal(a, b: TTuple<T1, T2>): Boolean;
begin
  Result := (TComparer<T1>.Default.Compare(a.Item1, b.Item1) = 0) and
            (TComparer<T2>.Default.Compare(a.Item2, b.Item2) = 0);
end;

class operator TTuple<T1, T2>.NotEqual(a, b: TTuple<T1, T2>): Boolean;
begin
  Result := not (a = b);
end;

end.
