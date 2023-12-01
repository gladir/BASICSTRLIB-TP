{ @author: Sylvain Maltais (support@gladir.com)
  @created: 2023
  @website(https://www.gladir.com/CODER/BASICSTRLIB-TP)
  @abstract(Target: Turbo Pascal 7, Free Pascal)
}

Unit BASICSTR;

INTERFACE

Function CurDir:String;
Function Date:String;
Function DuplicateString(C:Char;Num:Integer):String;
Function LCase(S:String):String;
Function Left(S:String;L:Integer):String;
Function LTrim(S:String):String;
Function PadRight(S:String;Space:Byte):String;
Function PadZeroLeft(Value:Integer;Space:Byte):String;
Function Right(S:String;L:Integer):String;
Function RTrim(s:String):String;
Function Space(L:Byte):String;
Function StrComp(A,B:String):Integer;
Function StrReverse(S:String):String;
Function Time:String;
Function Trim(s:String):String;
Function UCase(S:String):String;

IMPLEMENTATION

Uses DOS;

Function Left(S:String;L:Integer):String;Begin
 Left:=Copy(S,1,L);
End;

Function Right(S:String;L:Integer):String;
Begin
 If(L>=Length(S))Then Right:=S
                 Else Right:=Copy(S,Length(S)-L,L);
End;

Function PadRight(S:String;Space:Byte):String;
Var
 I:Byte;
Begin
 If Length(S)<Space Then For I:=Length(S)+1 to Space do S:=S+' ';
 PadRight:=S;
End;

Function PadZeroLeft(Value:Integer;Space:Byte):String;
Var
 S:String;
Begin
 Str(Value,S);
 While Length(S)<Space do S:='0'+S;
 PadZeroLeft:=S;
End;

Function LTrim(S:String):String;
Var
 I:Byte;
Begin
 For I:=1to Length(S)do Begin
  If S[I]<>' 'Then Begin
   LTrim:=Copy(S,I,255);
   Exit;
  End;
 End;
 LTrim:=S;
End;

Function RTrim(s:String):String;
Var
 i:Integer;
Begin
 i:=Length(s);
 While (i>0)and(s[i]in[#9,' '])do Dec(i);
 s[0]:=Chr(i);
 RTrim:=S;
End;

Function Trim(s:String):String;Begin
 Trim:=LTrim(RTrim(s));
End;

Function LCase(S:String):String;
Var
 I:Byte;
Begin
 For I:=1 to Length(S)do Begin
  If S[I] in['A'..'Z']Then S[I]:=Chr(Ord(S[I])+32);
 End;
 LCase:=S;
End;

Function UCase(S:String):String;
Var
 I:Byte;
Begin
 For I:=1 to Length(S)do Begin
  If S[I] in['a'..'z']Then S[I]:=Chr(Ord(S[I])-32);
 End;
 UCase:=S;
End;

Function DuplicateString(C:Char;Num:Integer):String;
Var
 I:Byte;
 S:String;
Begin
 S:='';
 For I:=1 to Num do S:=S+C;
 DuplicateString:=S;
End;

Function Space(L:Byte):String;
Var
 S:String;
Begin
 If(L=0)Then Space:=''
  else
 Begin
  FillChar(S[1],L,' ');
  S[0]:=Char(L);
  Space:=S;
 End;
End;

Function StrComp(A,B:String):Integer;Begin
 If A<B Then StrComp:=-1 Else
 If A=B Then StrComp:=0
        Else StrComp:=1;
End;

Function StrReverse(S:String):String;
Var
 I:Integer;
 R:String;
Begin
 R:='';
 For I:=1 to Length(S)do Begin
  R:=S[I]+R;
 End;
 StrReverse:=R;
End;

Function Time:String;
Var
 S:String;
 Hour,Min,Sec,Sec100:Word;
Begin
 GetTime(Hour,Min,Sec,Sec100);
 S:=PadZeroLeft(Hour,2);
 S:=S+':';
 S:=S+PadZeroLeft(Min,2);
 S:=S+':';
 S:=S+PadZeroLeft(Sec,2);
 Time:=S;
End;

Function Date:String;
Var
 Year,Month,Day,DayOfWeek:Word;
 S:String;
Begin
 GetDate(Year,Month,Day,DayOfWeek);
 S:=PadZeroLeft(Month,2);
 S:=S+'/';
 S:=S+PadZeroLeft(Day,2);
 S:=S+'/';
 S:=S+PadZeroLeft(Year,4);
 Date:=S;
End;

Function CurDir:String;
Var
 S:String;
Begin
 GetDir(0,S);
 CurDir:=S;
End;

END.