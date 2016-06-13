unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Menus, ComCtrls, StdCtrls, jpeg;
   type
   mas1=array[1..8,1..8] of  TImage;
   mas2= array[0..9,0..9] of  Integer;
type
  TForm1 = class(TForm)
    Image1: TImage;
    Image2: TImage;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    ProgressBar1: TProgressBar;
    Newgame1: TMenuItem;
    Help1: TMenuItem;
    ProgressBar2: TProgressBar;
    Timer1: TTimer;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    Label1: TLabel;
    Label2: TLabel;
    Image3: TImage;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    Timer2: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure IClick(Sender: TObject);
    function p_levo(b:mas2;i1,j1,d,d1,k:integer):integer;
    function p_pravo(b:mas2;i1,j1,d,d1,k:integer):integer;
    function p_verh(b:mas2;i1,j1,d,d1,k:integer):integer;
    function p_vniz(b:mas2;i1,j1,d,d1,k:integer):integer;
    function p_dig1(b:mas2;i1,j1,d,d1,k:integer):integer;
    function p_dig2(b:mas2;i1,j1,d,d1,k:integer):integer;
    function p_dig3(b:mas2;i1,j1,d,d1,k:integer):integer;
    function p_dig4(b:mas2;i1,j1,d,d1,k:integer):integer;
    procedure pz_levo(var b:mas2;i1,j1,d:integer);
    procedure pz_pravo(var b:mas2;i1,j1,d:integer);
    procedure pz_verh(var b:mas2;i1,j1,d:integer);
    procedure pz_vniz(var b:mas2;i1,j1,d:integer);
    procedure pz_dig1(var b:mas2;i1,j1,d:integer);
    procedure pz_dig2(var b:mas2;i1,j1,d:integer);
    procedure pz_dig3(var b:mas2;i1,j1,d:integer);
    procedure pz_dig4(var b:mas2;i1,j1,d:integer);
    procedure Timer1Timer(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure Newgame1Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  a:mas1;
  b:mas2;
  n,i1,j1,imax,jmax:Integer;
  m:Boolean;
implementation

uses Unit2, Unit3;

{$R *.dfm}


procedure TForm1.FormCreate(Sender: TObject);
var i,j:integer;
begin
for I := 1 to 8 do
  for j := 1 to 8 do
    begin
     a[i,j]:=TImage.Create(Form1);
     a[i,j].Parent:=form1;
     a[i,j].Picture.LoadFromFile('0.bmp');
     a[i,j].AutoSize:=true;
     a[i,j].Left:=j*45;
     a[i,j].top:=i*45;
     a[i,j].OnClick:=IClick;
     b[i,j]:=0;
    end;

for I := 0 to 9 do
  for j := 0 to 9 do
    if (i=0) or (j=0) or (i=9) or (j=9) then
      b[i,j]:=-1;

for i:=4 to 5 do
  begin
    b[i,i]:=1;
    b[9-i,i]:=2;
    a[i,i].Picture.LoadFromFile('1.bmp');
    a[9-i,i].Picture.LoadFromFile('2.bmp');
  end;

end;

procedure TForm1.IClick(Sender: TObject);
var i,j:integer;
begin
i1:=(Sender as TImage).Top div 45;
j1:=(Sender as TImage).Left div 45;
if (Timer1.Enabled=false) then
  begin
    if p_levo(b,i1,j1,2,1,0)<>0 then
      begin pz_levo(b,i1,j1,1); Timer1.Enabled:=true; end;
    if p_pravo(b,i1,j1,2,1,0)<>0 then
      begin pz_pravo(b,i1,j1,1); Timer1.Enabled:=true; end;
    if p_verh(b,i1,j1,2,1,0)<>0 then
      begin pz_verh(b,i1,j1,1); Timer1.Enabled:=true; end;
    if p_vniz(b,i1,j1,2,1,0)<>0 then
      begin pz_vniz(b,i1,j1,1); Timer1.Enabled:=true; end;
    if p_dig1(b,i1,j1,2,1,0)<>0 then
      begin pz_dig1(b,i1,j1,1); Timer1.Enabled:=true; end;
    if p_dig2(b,i1,j1,2,1,0)<>0 then
      begin pz_dig2(b,i1,j1,1); Timer1.Enabled:=true; end;
    if p_dig3(b,i1,j1,2,1,0)<>0 then
      begin pz_dig3(b,i1,j1,1); Timer1.Enabled:=true; end;
    if p_dig4(b,i1,j1,2,1,0)<>0 then
      begin pz_dig4(b,i1,j1,1); Timer1.Enabled:=true; end;

    if p_levo(b,i1,j1,2,1,1)<>0 then pz_levo(b,i1,j1,1);
    if p_pravo(b,i1,j1,2,1,1)<>0 then pz_pravo(b,i1,j1,1);
    if p_verh(b,i1,j1,2,1,1)<>0 then pz_verh(b,i1,j1,1);
    if p_vniz(b,i1,j1,2,1,1)<>0 then pz_vniz(b,i1,j1,1);
    if p_dig1(b,i1,j1,2,1,1)<>0 then pz_dig1(b,i1,j1,1);
    if p_dig2(b,i1,j1,2,1,1)<>0 then pz_dig2(b,i1,j1,1);
    if p_dig3(b,i1,j1,2,1,1)<>0 then pz_dig3(b,i1,j1,1);
    if p_dig4(b,i1,j1,2,1,1)<>0 then pz_dig4(b,i1,j1,1);

ProgressBar1.Position:=0;
ProgressBar2.Position:=0;
for I := 0 to 9 do
  for j := 0 to 9 do
      begin
        if b[i,j]=1 then
          begin
            ProgressBar1.Position:=ProgressBar1.Position+1;
            Label1.Caption:=IntToStr(ProgressBar1.Position);
          end;
        if b[i,j]=2 then
          begin
            ProgressBar2.Position:=ProgressBar2.Position+1;
            Label2.Caption:=IntToStr(ProgressBar2.Position);
          end;
      end;
    // Timer1.Enabled:=true;
  end;
end;

procedure TForm1.N2Click(Sender: TObject);
begin
Form2.Show;
end;

procedure TForm1.N3Click(Sender: TObject);
begin
close;
end;

procedure TForm1.N4Click(Sender: TObject);
begin
Form3.Show;
end;

procedure TForm1.N6Click(Sender: TObject);
begin
Image3.Picture.LoadFromFile('f1.jpg');
end;

procedure TForm1.N7Click(Sender: TObject);
begin
Image3.Picture.LoadFromFile('f2.jpg');
end;

procedure TForm1.N8Click(Sender: TObject);
begin
Image3.Picture.LoadFromFile('f3.jpg');
end;

procedure TForm1.N9Click(Sender: TObject);
begin
Image3.Picture.LoadFromFile('f4.jpg');
end;

procedure TForm1.Newgame1Click(Sender: TObject);
var i,j:integer;
begin
for I := 1 to 8 do
  for j := 1 to 8 do
    begin
     a[i,j].Picture.LoadFromFile('0.bmp');
     a[i,j].Left:=j*45;
     a[i,j].top:=i*45;
     b[i,j]:=0;
    end;
  
for i:=4 to 5 do
  begin
    b[i,i]:=1;
    b[9-i,i]:=2;
    a[i,i].Picture.LoadFromFile('1.bmp');
    a[9-i,i].Picture.LoadFromFile('2.bmp');
  end;
ProgressBar1.Position:=2;
Label1.Caption:=IntToStr(ProgressBar1.Position);
ProgressBar2.Position:=2;
Label2.Caption:=IntToStr(ProgressBar2.Position);
end;

procedure TForm1.pz_levo(var b:mas2;i1,j1,d:integer);
var i,j:integer;
begin
i:=i1;
j:=j1;
  repeat
    begin
      b[i,j]:=d;
      a[i,j].Picture.LoadFromFile(IntToStr(d)+'.bmp');
      j:=j-1;
    end;
  until (b[i,j]=d)or(b[i,j]=0);
    b[i,j]:=d;
    a[i,j].Picture.LoadFromFile(IntToStr(d)+'.bmp');
end;

procedure TForm1.pz_pravo(var b:mas2;i1,j1,d:integer);
var i,j:integer;
begin
i:=i1;
j:=j1;
  repeat
    begin
      b[i,j]:=d;
      a[i,j].Picture.LoadFromFile(IntToStr(d)+'.bmp');
      j:=j+1;
    end;
  until (b[i,j]=d)or(b[i,j]=0);
    b[i,j]:=d;
    a[i,j].Picture.LoadFromFile(IntToStr(d)+'.bmp');
end;

procedure TForm1.pz_verh(var b:mas2;i1,j1,d:integer);
var i,j:integer;
begin
i:=i1;
j:=j1;
 repeat
    begin
      b[i,j]:=d;
      a[i,j].Picture.LoadFromFile(IntToStr(d)+'.bmp');
      i:=i-1;
    end;
 until (b[i,j]=d)or(b[i,j]=0);
    b[i,j]:=d;
    a[i,j].Picture.LoadFromFile(IntToStr(d)+'.bmp');
end;

procedure TForm1.pz_vniz(var b:mas2;i1,j1,d:integer);
var i,j:integer;
begin
i:=i1;
j:=j1;
  repeat
    begin
      b[i,j]:=d;
      a[i,j].Picture.LoadFromFile(IntToStr(d)+'.bmp');
      i:=i+1;
    end;
  until (b[i,j]=d)or(b[i,j]=0);
    b[i,j]:=d;
    a[i,j].Picture.LoadFromFile(IntToStr(d)+'.bmp');
end;

procedure TForm1.pz_dig1(var b:mas2;i1,j1,d:integer);
var i,j:integer;
begin
i:=i1;
j:=j1;
  repeat
    begin
      b[i,j]:=d;
      a[i,j].Picture.LoadFromFile(IntToStr(d)+'.bmp');
      i:=i-1;
      j:=j+1;
    end;
  until (b[i,j]=d)or(b[i,j]=0);
    b[i,j]:=d;
    a[i,j].Picture.LoadFromFile(IntToStr(d)+'.bmp');
end;

procedure TForm1.pz_dig2(var b:mas2;i1,j1,d:integer);
var i,j:integer;
begin
i:=i1;
j:=j1;
 repeat
    begin
      b[i,j]:=d;
      a[i,j].Picture.LoadFromFile(IntToStr(d)+'.bmp');
      i:=i+1;
      j:=j-1;
    end;
 until (b[i,j]=d)or(b[i,j]=0);
    b[i,j]:=d;
    a[i,j].Picture.LoadFromFile(IntToStr(d)+'.bmp');
end;

procedure TForm1.pz_dig3(var b:mas2;i1,j1,d:integer);
var i,j:integer;
begin
i:=i1;
j:=j1;
  repeat
    begin
      b[i,j]:=d;
      a[i,j].Picture.LoadFromFile(IntToStr(d)+'.bmp');
      i:=i-1;
      j:=j-1;
    end;
  until (b[i,j]=d)or(b[i,j]=0);
    b[i,j]:=d;
    a[i,j].Picture.LoadFromFile(IntToStr(d)+'.bmp');
end;

procedure TForm1.pz_dig4(var b:mas2;i1,j1,d:integer);
var i,j:integer;
begin
i:=i1;
j:=j1;
repeat
    begin
      b[i,j]:=d;
      a[i,j].Picture.LoadFromFile(IntToStr(d)+'.bmp');
      i:=i+1;
      j:=j+1;
    end;
until (b[i,j]=d)or(b[i,j]=0);
    b[i,j]:=d;
    a[i,j].Picture.LoadFromFile(IntToStr(d)+'.bmp');
end;

function TForm1.p_levo(b:mas2;i1,j1,d,d1,k:integer):integer;
var i,j,t:integer;
begin
t:=0;
if (b[i1,j1]=k)  and (b[i1,j1-1]=d) then
  begin
    j:=j1;
    repeat
      j:=j-1;
    until (b[i1,j]<>d);
      if (b[i1,j]=d1) then
        for I := j to j1 do
          t:=t+1;
  end;
p_levo:=t;
end;

function TForm1.p_pravo(b:mas2;i1,j1,d,d1,k:integer):integer;
var i,j,t:integer;
begin
t:=0;
if (b[i1,j1]=k)  and (b[i1,j1+1]=d) then
  begin
    j:=j1;
    repeat
      j:=j+1;
    until (b[i1,j]<>d);
      if (b[i1,j]=d1) then
        for I := j1 to j do
          t:=t+1;
  end;
p_pravo:=t;
end;

function TForm1.p_verh(b:mas2;i1,j1,d,d1,k:integer):integer;
var i,j,k1,t:integer;
begin
t:=0;
if (b[i1,j1]=k)  and (b[i1-1,j1]=d) then
  begin
    i:=i1;
    repeat
      i:=i-1;
    until (b[i,j1]<>d);
      if (b[i,j1]=d1) then
        for k1 := i1 downto i do
          t:=t+1;
  end;
p_verh:=t;
end;

function TForm1.p_vniz(b:mas2;i1,j1,d,d1,k:integer):integer;
var i,j,k1,t:integer;
begin
t:=0;
if (b[i1,j1]=k) and (b[i1+1,j1]=d) then
  begin
    i:=i1;
    repeat
      i:=i+1;
    until (b[i,j1]<>d);
      if (b[i,j1]=d1) then
        for k1 := i1 to i do
          t:=t+1;
  end;
p_vniz:=t;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var
jmax1,imax1,max,i,j,sum:integer;
begin
max:=0; imax:=0;jmax:=0;sum:=-1;
for I := 0 to 9 do
  for j := 0 to 9 do
    if (b[i,j]=2) then
      begin
        if p_levo(b,i,j,1,0,2)>=max then
          begin
            max:=p_levo(b,i,j,1,0,2);
            sum:=1;imax:=i;jmax:=j;
          end;
        if p_pravo(b,i,j,1,0,2)>=max then
          begin
            max:=p_pravo(b,i,j,1,0,2);
            sum:=2;imax:=i;jmax:=j;
          end;
        if p_verh(b,i,j,1,0,2)>=max then
          begin
            max:=p_verh(b,i,j,1,0,2);
            sum:=3;imax:=i;jmax:=j;
          end;
        if p_vniz(b,i,j,1,0,2)>=max then
          begin
            max:=p_vniz(b,i,j,1,0,2);
            sum:=4;imax:=i;jmax:=j;
          end;
        if p_dig1(b,i,j,1,0,2)>=max then
          begin
            max:=p_dig1(b,i,j,1,0,2);
            sum:=5;imax:=i;jmax:=j;
          end;
        if p_dig2(b,i,j,1,0,2)>=max then
          begin
            max:=p_dig2(b,i,j,1,0,2);
            sum:=6;imax:=i;jmax:=j;
          end;
        if p_dig3(b,i,j,1,0,2)>=max then
          begin
            max:=p_dig3(b,i,j,1,0,2);
            sum:=7;imax:=i;jmax:=j;
          end;
        if p_dig4(b,i,j,1,0,2)>=max then
          begin
            max:=p_dig4(b,i,j,1,0,2);
            sum:=8;imax:=i;jmax:=j;
          end;
      end;
if (p_levo(b,imax,jmax,1,0,2)<>0) and (sum=1) then
  begin
    jmax1:=jmax+p_levo(b,imax,jmax,1,0,2)-1; imax1:=imax;
    pz_levo(b,imax,jmax,2);
  end;
if (p_pravo(b,imax,jmax,1,0,2)<>0) and (sum=2) then
  begin
    jmax1:=jmax+p_pravo(b,imax,jmax,1,0,2)-1;imax1:=imax;
    pz_pravo(b,imax,jmax,2);
  end;
if (p_verh(b,imax,jmax,1,0,2)<>0) and (sum=3) then
  begin
    jmax1:=jmax; imax1:=imax-p_verh(b,imax,jmax,1,0,2)+1;
    pz_verh(b,imax,jmax,2);
  end;
if (p_vniz(b,imax,jmax,1,0,2)<>0) and (sum=4) then
  begin
    jmax1:=jmax; imax1:=imax+p_vniz(b,imax,jmax,1,0,2)-1;
    pz_vniz(b,imax,jmax,2);
  end;
if (p_dig1(b,imax,jmax,1,0,2)<>0) and (sum=5) then
  begin
    imax1:=imax-p_dig1(b,imax,jmax,1,0,2)+1; jmax1:=jmax+p_dig1(b,imax,jmax,1,0,2)-1;
    pz_dig1(b,imax,jmax,2);
  end;
if (p_dig2(b,imax,jmax,1,0,2)<>0) and (sum=6) then
  begin
    imax1:=imax+p_dig2(b,imax,jmax,1,0,2)-1; jmax1:=jmax-p_dig2(b,imax,jmax,1,0,2)+1;
    pz_dig2(b,imax,jmax,2);
  end;
if (p_dig3(b,imax,jmax,1,0,2)<>0) and (sum=7) then
  begin
    imax1:=imax-p_dig3(b,imax,jmax,1,0,2)+1; jmax1:=jmax-p_dig3(b,imax,jmax,1,0,2)+1;
    pz_dig3(b,Imax,jmax,2);
  end;
if (p_dig4(b,imax,jmax,1,0,2)<>0) and (sum=8) then
  begin
    imax1:=imax+p_dig4(b,imax,jmax,1,0,2)-1; jmax1:=jmax+p_dig4(b,imax,jmax,1,0,2)-1;
    pz_dig4(b,imax,jmax,2);
  end;

imax:=imax1;jmax:=jmax1;
if (p_levo(b,imax,jmax,1,2,2)<>0) then pz_levo(b,imax,jmax,2);
if (p_pravo(b,imax,jmax,1,2,2)<>0) then pz_pravo(b,imax,jmax,2);
if (p_verh(b,imax,jmax,1,2,2)<>0) then pz_verh(b,imax,jmax,2);
if (p_vniz(b,imax,jmax,1,2,2)<>0)then pz_vniz(b,imax,jmax,2);
if (p_dig1(b,imax,jmax,1,2,2)<>0) then pz_dig1(b,imax,jmax,2);
if (p_dig2(b,imax,jmax,1,2,2)<>0) then pz_dig2(b,imax,jmax,2);
if (p_dig3(b,imax,jmax,1,2,2)<>0) then pz_dig3(b,Imax,jmax,2);
if (p_dig4(b,imax,jmax,1,2,2)<>0)  then pz_dig4(b,imax,jmax,2);

ProgressBar1.Position:=0;
ProgressBar2.Position:=0;
for I := 0 to 9 do
  for j := 0 to 9 do
      begin
        if b[i,j]=1 then
          begin
            ProgressBar1.Position:=ProgressBar1.Position+1;
            Label1.Caption:=IntToStr(ProgressBar1.Position);
          end;
          if b[i,j]=2 then
            begin
              ProgressBar2.Position:=ProgressBar2.Position+1;
              Label2.Caption:=IntToStr(ProgressBar2.Position);
            end;
          
      end;
  Timer1.Enabled:=False;
end;

procedure TForm1.Timer2Timer(Sender: TObject);
var i,j,k:integer;
begin
k:=0;
for I := 1 to 8 do
  for j := 1 to 8 do
    begin
      if b[i,j]=0 then
        k:=k+1;
    end;
    if k=0 then
      begin
        Timer2.Enabled:=false;
        ShowMessage('Конец игры.');
      end;
end;

function TForm1.p_dig1(b:mas2;i1,j1,d,d1,k:integer):integer;
var i,j,k1,l,t:integer;
begin
t:=0;
if (b[i1,j1]=k) and (b[i1-1,j1+1]=d) then
  begin
    i:=i1;
    j:=j1;
    repeat
      i:=i-1;
      j:=j+1;
    until (b[i,j]<>d);
      if (b[i,j]=d1) then
        for k1 := i1 downto i do
            begin
              t:=t+1;
              j1:=j1+1;
            end;
  end;
p_dig1:=t;
end;

function TForm1.p_dig2(b:mas2;i1,j1,d,d1,k:integer):integer;
var i,j,k1,l,t:integer;
begin
t:=0;
if (b[i1,j1]=k)  and (b[i1+1,j1-1]=d) then
  begin
    i:=i1;
    j:=j1;
    repeat
      i:=i+1;
      j:=j-1;
    until (b[i,j]<>d);
      if (b[i,j]=d1) then
        for k1 := i1 to i do
            begin
              t:=t+1;
              j1:=j1-1;
            end;
  end;
p_dig2:=t;
end;

function TForm1.p_dig3(b:mas2;i1,j1,d,d1,k:integer):integer;
var i,j,k1,l,t:integer;
begin
t:=0;
if (b[i1,j1]=k)  and (b[i1-1,j1-1]=d) then
  begin
    i:=i1;
    j:=j1;
    repeat
      i:=i-1;
      j:=j-1;
    until (b[i,j]<>d);
      if (b[i,j]=d1) then
        for k1 := i1 downto i do
            begin
              t:=t+1;
              j1:=j1-1;
            end;
  end;
p_dig3:=t;
end;

function TForm1.p_dig4(b:mas2;i1,j1,d,d1,k:integer):integer;
var i,j,k1,l,t:integer;
begin
t:=0;
if (b[i1,j1]=k)  and (b[i1+1,j1+1]=d) then
  begin
    i:=i1;
    j:=j1;
    repeat
      i:=i+1;
      j:=j+1;
    until (b[i,j]<>d);
      if (b[i,j]=d1) then
        for k1 := i1 to i do
            begin
              t:=t+1;
              j1:=j1+1;
            end;
  end;
p_dig4:=t;
end;
end.
