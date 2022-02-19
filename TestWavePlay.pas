unit TestWavePlay;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure InitWaveOut; cdecl; external 'waveout.dll';
procedure DestroyWaveOut; cdecl; external 'waveout.dll';
procedure PlayWave(Sound: Pointer); cdecl; external 'waveout.dll';
function LoadWave(FileName: String): Pointer; cdecl; external 'waveout.dll';

var Sound: Pointer;

procedure TForm1.FormCreate(Sender: TObject);
begin
  InitWaveOut;
  Sound := LoadWave(PChar('.\keydown.wav'));
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  PlayWave(Sound);
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  DestroyWaveOut;
end;

end.
