{$APPTYPE CONSOLE}

uses Sharemem, Sysutils;

procedure InitWaveOut; cdecl; external 'waveout.dll';
procedure DestroyWaveOut; cdecl; external 'waveout.dll';
procedure PlayWave(Sound: Pointer); cdecl; external 'waveout.dll';
function LoadWave(FileName: String): Pointer; cdecl; external 'waveout.dll';

var Sound: Pointer;

begin
  InitWaveOut;
  Sound := LoadWave(PChar('.\keydown.wav'));
  PlayWave(Sound);
  WriteLn('Press enter');
  ReadLn;
  PlayWave(Sound);
  WriteLn('Press enter');
  ReadLn;
  DestroyWaveOut;
end.
