program Piton;

uses
  SysUtils;

const
  n = 10;       // default number of decimals
  max = 10000;  // max number of decimals

var
  a: array[1..((10*max) div 3)] of Integer; // array of remainders
  i, j, q, x: LongInt; // loop variables and quotient
  nines, predigit: LongInt; // number of nines and previous digit  
  len: LongInt = 0;
  n2: LongInt = 0;  
  p: string;

procedure DisplayInfoScreen();
begin
  WriteLn('Usage: piton [<integer [3..10000>]');
  WriteLn('');
  WriteLn('Writes the number pi to <arg> number of digits');
  WriteLn('');
  WriteLn('Created by Kjetil Kristoffer Solberg and ChatGPT <post@ikjetil.no>');
  WriteLn('Written in Pascal for the Free Pascal Compiler');  
end;

begin  
  // check for single argument number of digits
  if paramcount = 1 then
  begin
    p := paramstr(1);
    if not TryStrToInt(p,n2) then
    begin
      DisplayInfoScreen();
      exit;
    end;   

    if n2 > max then
    begin
      DisplayInfoScreen();
      exit;
    end; 
  end
  else 
  begin
    n2 := n;
  end;

  // Update length
  len := ((10 * n2) div 3); // length of array
  
  // Initialize the array with 2s
  for i := 1 to len do a[i] := 2;

  // Start with 3 as the first digit
  nines := 0;
  predigit := 0;

  // Loop until all decimals are computed
  for j := 1 to n2 do begin
    q := 0;

    // Work backwards
    for i := len downto 1 do begin
      x := 10 * a[i] + q * i;
      a[i] := x mod (2 * i - 1);
      q := x div (2 * i - 1);
    end;

    // Extract the next digit
    a[1] := q mod 10;
    q := q div 10;

    // Handle carry over
    if q = 9 then Inc(nines)
    else if q = 10 then begin      
      Write(predigit + 1);
      for i := 1 to nines do Write('0');
      predigit := 0;
      nines := 0;
    end else begin
      if j > 1 then
      begin
        Write(predigit);        
      end;

      if j = 2 then  
      begin     
        Write('.');
      end;

      predigit := q;
      if nines > 0 then begin
        for i := 1 to nines do Write('9');
        nines := 0;
      end;
    end;
  end;
  
  // Write the last digit and end line
  WriteLn(predigit);
end.
