# Delphi DLL call fail with return value proof of concept

Reproduction:

1. build WaveOut.dpr (`dcc32.exe WaveOut.dpr`) - this will create the WaveOut.dll
2. build DllCallFailPoC.dpr - this will create the form application
3. buidl ConsoleFailPoc.dpr - this is a console application supposed to work exactly as the form one

Observation:

Start the GUI application: it is capable to play the wave file regardless of how many times you click on the button.  
The console application can play the wave only once (press enter), then it fails:

- without `sysutil` used: `Runtime Error 216`.
- with `sysutils` used:

```
Exception EAccessViolation in module waveout.dll at 000096A6.  
Access violation at address 00A096A6 in module 'waveout.dll'. Read of address 0000001E.
```
