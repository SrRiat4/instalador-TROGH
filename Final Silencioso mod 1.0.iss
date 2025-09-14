
#define MyAppName        "American Truck Simulator TROGH"
#define MyAppVersion     "14.09.25"
#define MyExeRelDir      "bin\win_x64"
#define MyExeName        "amtrucks.exe"
#define MyAppId          "{{D67B2672-41D5-4F07-A7D8-6C18A19477C6}}"
#define RAR_PASSWORD     "BL6SOniYG3oABHKc51HDY6xPXt4W8O#x"
#define RAR_BASENAME     "ATSTROGH"   
#define GAME_SIZE_BYTES  24040935424

#define MyCompany        "TROGH"
#define MyURL            "https://trogh.netlify.app/"

#define ToolsDir         "C:\Users\PC\Desktop\Pruebas\iss\_tools"
#define DepsDir          "C:\Users\PC\Desktop\Pruebas\iss\_deps"

#define BrandHeaderBmp       "C:\Users\PC\Desktop\Pruebas\iss\banner\superior.bmp"
#define BrandFinishBmp       "C:\Users\PC\Desktop\Pruebas\iss\banner\final.bmp"
#define BrandPagesSmallImg   "C:\Users\PC\Desktop\Pruebas\iss\banner\pasos.bmp"

#define USE_HEADER_BANNER 1
#define USE_FINISH_BANNER 0

#define MyCompression    "lzma2/max"
#define MySetupIcon      "C:\Users\PC\Desktop\Escritorio\logos\LOGOico.ico"

; ===== EXTRAS opcionales (nombres tal como están en _deps) =====
#define Dep_VC_x64   AddBackslash(DepsDir) + "vc_redist.x64.exe"
#define Dep_VC_x86   AddBackslash(DepsDir) + "vc_redist.x86.exe"
#define Dep_DX       AddBackslash(DepsDir) + "directx_Jun2010_redist.exe"
#define Dep_DotNet8  AddBackslash(DepsDir) + "dotnet8_desktop_x64.exe"
#define Dep_OpenAL   AddBackslash(DepsDir) + "oalinst.exe"
#define Dep_PhysX    AddBackslash(DepsDir) + "PhysX-9.19.0218-SystemSoftware.exe"

; ===== SWITCHES para activar/excluir EXTRAS (1=incluye, 0=excluye) =====
#define EXTRA_VC64   1
#define EXTRA_VC86   0
#define EXTRA_DX     0
#define EXTRA_DN8    0
#define EXTRA_OAL    1
#define EXTRA_PHYSX  1

[Setup]
AppId={#MyAppId}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyCompany}
AppPublisherURL={#MyURL}
AppSupportURL={#MyURL}
AppUpdatesURL={#MyURL}
DefaultDirName={autopf}\{#MyAppName}
DefaultGroupName={#MyAppName}
AllowNoIcons=yes
OutputDir=.
OutputBaseFilename={#MyAppName}-{#MyAppVersion}-Setup

Compression={#MyCompression}
SolidCompression=yes
CompressionThreads=auto
LZMANumBlockThreads=2
LZMAUseSeparateProcess=yes

WizardStyle=modern
DisableWelcomePage=no
ShowLanguageDialog=no
LanguageDetectionMethod=uilanguage

PrivilegesRequired=admin
ArchitecturesInstallIn64BitMode=x64
CloseApplications=yes
DiskSpanning=no
UsePreviousAppDir=yes
UsePreviousLanguage=yes
DisableProgramGroupPage=no
SetupLogging=yes
UninstallDisplayIcon={app}\{#MyExeRelDir}\{#MyExeName}
#if MySetupIcon != ""
  SetupIconFile={#MySetupIcon}
#endif

ExtraDiskSpaceRequired={#GAME_SIZE_BYTES}

#if USE_HEADER_BANNER
WizardImageFile={#BrandHeaderBmp}
#endif
WizardSmallImageFile={#BrandPagesSmallImg}

[Languages]
Name: "spanish"; MessagesFile: "compiler:Languages\Spanish.isl"
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
; Iconos / ejecución
Name: "desktopicon";   Description: "Crear acceso directo en el Escritorio"; GroupDescription: "Iconos:"; Flags: checkedonce
Name: "startmenuicon"; Description: "Crear carpeta en el Menú Inicio";       GroupDescription: "Iconos:"; Flags: unchecked
Name: "runapp";        Description: "Iniciar {#MyAppName} al finalizar";     GroupDescription: "(OPCIONAL)"; Flags: checkedonce
; Extras opcionales (solo aparecen los activados)
#if EXTRA_VC64
Name: "x_vc64";  Description: "Instalar Visual C++ 2015-2022 (x64)"; GroupDescription: "Extras (opcionales):"; Flags: unchecked
#endif
#if EXTRA_VC86
Name: "x_vc86";  Description: "Instalar Visual C++ 2015-2022 (x86)"; GroupDescription: "Extras (opcionales):"; Flags: unchecked
#endif
#if EXTRA_DX
Name: "x_dx";    Description: "Instalar DirectX (Jun 2010)";         GroupDescription: "Extras (opcionales):"; Flags: unchecked
#endif
#if EXTRA_DN8
Name: "x_dn8";   Description: "Instalar .NET 8 Desktop (x64)";       GroupDescription: "Extras (opcionales):"; Flags: unchecked
#endif
#if EXTRA_OAL
Name: "x_oal";   Description: "Instalar OpenAL";                      GroupDescription: "Extras (opcionales):"; Flags: unchecked
#endif
#if EXTRA_PHYSX
Name: "x_physx"; Description: "Instalar NVIDIA PhysX";                GroupDescription: "Extras (opcionales):"; Flags: unchecked
#endif

[Files]
; >>> UnRAR DLL embebida
Source: "{#ToolsDir}\unrar\x86\UnRAR.dll";  Flags: dontcopy
; Branding
#if USE_HEADER_BANNER
Source: "{#BrandHeaderBmp}";     Flags: dontcopy
#endif
#if USE_FINISH_BANNER
Source: "{#BrandFinishBmp}";     Flags: dontcopy
#endif
Source: "{#BrandPagesSmallImg}"; Flags: dontcopy
; Extras -> {tmp}\deps (solo se empaquetan los activados)
#if EXTRA_VC64
Source: "{#Dep_VC_x64}";   DestDir: "{tmp}\deps"; Flags: deleteafterinstall
#endif
#if EXTRA_VC86
Source: "{#Dep_VC_x86}";   DestDir: "{tmp}\deps"; Flags: deleteafterinstall
#endif
#if EXTRA_DX
Source: "{#Dep_DX}";       DestDir: "{tmp}\deps"; Flags: deleteafterinstall
#endif
#if EXTRA_DN8
Source: "{#Dep_DotNet8}";  DestDir: "{tmp}\deps"; Flags: deleteafterinstall
#endif
#if EXTRA_OAL
Source: "{#Dep_OpenAL}";   DestDir: "{tmp}\deps"; Flags: deleteafterinstall
#endif
#if EXTRA_PHYSX
Source: "{#Dep_PhysX}";    DestDir: "{tmp}\deps"; Flags: deleteafterinstall
#endif

[Icons]
Name: "{group}\{#MyAppName}";       Filename: "{app}\{#MyExeRelDir}\{#MyExeName}"; WorkingDir: "{app}\{#MyExeRelDir}"; Tasks: startmenuicon
Name: "{commondesktop}\{#MyAppName}"; Filename: "{app}\{#MyExeRelDir}\{#MyExeName}"; WorkingDir: "{app}\{#MyExeRelDir}"; Tasks: desktopicon

[Run]
#if EXTRA_VC64
Filename: "{tmp}\deps\vc_redist.x64.exe"; Parameters: "/quiet /norestart"; Flags: waituntilterminated; Tasks: x_vc64
#endif
#if EXTRA_VC86
Filename: "{tmp}\deps\vc_redist.x86.exe"; Parameters: "/quiet /norestart"; Flags: waituntilterminated; Tasks: x_vc86
#endif

#if EXTRA_DX
Filename: "{tmp}\deps\directx_Jun2010_redist.exe"; Parameters: "/Q /T:""{tmp}\deps\dx"""; Flags: waituntilterminated; Tasks: x_dx; Check: EnsureDxDir
Filename: "{tmp}\deps\dx\DXSETUP.exe";             Parameters: "/silent";              WorkingDir: "{tmp}\deps\dx"; Flags: waituntilterminated; Tasks: x_dx; Check: DxSetupExtracted
#endif

#if EXTRA_DN8
Filename: "{tmp}\deps\dotnet8_desktop_x64.exe"; Parameters: "/install /quiet /norestart"; Flags: waituntilterminated; Tasks: x_dn8
#endif

#if EXTRA_OAL
Filename: "{tmp}\deps\oalinst.exe"; Parameters: "/S";       Flags: waituntilterminated; Tasks: x_oal
#endif
#if EXTRA_PHYSX
Filename: "{tmp}\deps\PhysX-9.19.0218-SystemSoftware.exe"; Parameters: "/silent"; Flags: waituntilterminated; Tasks: x_physx
#endif

; Lanzar juego al final
Filename: "{app}\{#MyExeRelDir}\{#MyExeName}"; Description: "Iniciar {#MyAppName}"; Flags: nowait postinstall skipifsilent; Tasks: runapp

[UninstallRun]
Filename: "taskkill.exe"; Parameters: "/IM {#MyExeName} /F"; Flags: runhidden
Filename: "rundll32.exe"; Parameters: "url.dll,FileProtocolHandler ""{#MyURL}"""; Flags: runhidden

[UninstallDelete]
Type: filesandordirs; Name: "{app}\*"
Type: dirifempty;     Name: "{app}"

[Code]
const
  SW_RESTORE     = 9;
  HWND_TOPMOST   = -1;
  HWND_NOTOPMOST = -2;
  SWP_NOMOVE     = $0002;
  SWP_NOSIZE     = $0001;
  SWP_SHOWWINDOW = $0040;

  TROGH_PULSES   = 8;
  TROGH_DELAY    = 120;

  RAR_OM_EXTRACT   = 1;
  RAR_EXTRACT      = 2;
  ERAR_END_ARCHIVE = 10;
  UCM_PROCESSDATA  = 1;

var
  FinishImg: TBitmapImage;
  DummyResult: Integer;

  LastPct: Integer;
  LastTick: Cardinal;

  TotalBytes: Int64;
  BytesProcessed: Int64;

  // *** FIX Type mismatch: buffer ANSI vacío para RARProcessFile ***
  EmptyAnsi: AnsiString;

function GetTickCount: Cardinal;
  external 'GetTickCount@kernel32.dll stdcall';

procedure ClampPct(var P: Integer);
begin
  if P < 0 then P := 0 else
  if P > 100 then P := 100;
end;

procedure UpdateGaugeCaption(const CaptionText: string; Pct: Integer; Force: Boolean);
var now: Cardinal;
begin
  ClampPct(Pct);
  now := GetTickCount;
  if Force or ((Pct <> LastPct) and (now - LastTick >= 120)) then
  begin
    LastPct := Pct; LastTick := now;
    WizardForm.ProgressGauge.Position := Pct;
    WizardForm.StatusLabel.Caption := CaptionText;
    WizardForm.ProgressGauge.Repaint;
    WizardForm.StatusLabel.Repaint;
  end;
end;

function ExistsInSrc(const FileName: string): Boolean;
begin
  Result := FileExists(ExpandConstant('{src}\' + FileName));
end;

function ListRarsFound: string;
var FR: TFindRec;
begin
  Result := '';
  if FindFirst(ExpandConstant('{src}\*.rar'), FR) then
  begin
    try
      repeat
        if (FR.Attributes and $10) = 0 then
          Result := Result + #13#10 + FR.Name;
      until not FindNext(FR);
    finally
      FindClose(FR);
    end;
  end;
  if Result = '' then Result := '(ninguno)';
end;

function GetExpectedRARFirstPart(): string;
var base: string;
begin
  base := '{#RAR_BASENAME}';
  Result := '';
  if base = '' then Exit;
  if ExistsInSrc(base + '.part1.rar')   then Result := ExpandConstant('{src}\' + base + '.part1.rar')   else
  if ExistsInSrc(base + '.part01.rar')  then Result := ExpandConstant('{src}\' + base + '.part01.rar')  else
  if ExistsInSrc(base + '.part001.rar') then Result := ExpandConstant('{src}\' + base + '.part001.rar') else
  if ExistsInSrc(base + '.rar')         then Result := ExpandConstant('{src}\' + base + '.rar');
end;

function InitializeSetup: Boolean;
var base, found: string;
begin
  base := '{#RAR_BASENAME}';
  found := GetExpectedRARFirstPart();
  if found = '' then
  begin
    MsgBox('No se encontró el primer volumen "' + base + '.part1/.part01/.part001/.rar" junto al instalador (' +
           ExpandConstant('{src}') + ').'#13#10#13#10'RAR presentes:' + ListRarsFound,
           mbCriticalError, MB_OK);
    Result := False; Exit;
  end;
  if '{#RAR_PASSWORD}' = '' then
  begin
    MsgBox('La contraseña RAR está vacía. Edita RAR_PASSWORD en el script.', mbCriticalError, MB_OK);
    Result := False; Exit;
  end;
  Result := True;
end;

#if USE_FINISH_BANNER
procedure AddFinishBranding;
begin
  try
    ExtractTemporaryFile('final.bmp');
    FinishImg := TBitmapImage.Create(WizardForm.FinishedPage);
    FinishImg.Parent := WizardForm.FinishedPage;
    FinishImg.Stretch := True;
    FinishImg.AutoSize := False;
    FinishImg.SetBounds(ScaleX(0), ScaleY(0), WizardForm.ClientWidth, ScaleY(120));
    FinishImg.Bitmap.LoadFromFile(ExpandConstant('{tmp}\final.bmp'));
    WizardForm.FinishedLabel.Top := FinishImg.Top + FinishImg.Height + ScaleY(8);
  except end;
end;

procedure CurPageChanged(CurPageID: Integer);
begin
  try
    if CurPageID = wpFinished then
    begin
      ExtractTemporaryFile('final.bmp');
      WizardForm.WizardBitmapImage.Bitmap.LoadFromFile(ExpandConstant('{tmp}\final.bmp'));
    end;
  except end;
end;
#endif

// Crea {tmp}\deps\dx si no existe (siempre devuelve True para que [Run] continúe)
function EnsureDxDir(): Boolean;
var
  p: string;
begin
  p := ExpandConstant('{tmp}\deps\dx');
  if not DirExists(p) then
    CreateDir(p);
  Result := True;
end;

// Verifica que DXSETUP.exe fue extraído antes de intentar ejecutarlo
function DxSetupExtracted(): Boolean;
begin
  Result := FileExists(ExpandConstant('{tmp}\deps\dx\DXSETUP.exe'));
end;

// ------------ API UnRAR.DLL ------------
type
  TRAROpenArchiveDataEx = record
    ArcName:    PAnsiChar;
    ArcNameW:   LongInt;
    OpenMode:   Cardinal;
    OpenResult: Cardinal;
    CmtBuf:     LongInt;
    CmtBufSize: Cardinal;
    CmtSize:    Cardinal;
    CmtState:   Cardinal;
    Flags:      Cardinal;
    Reserved:   array[0..31] of Cardinal;
  end;

  TRARHeaderDataEx = record
    ArcName:     array[0..1023] of AnsiChar;
    ArcNameW:    array[0..1023] of WideChar;
    FileName:    array[0..1023] of AnsiChar;
    FileNameW:   array[0..1023] of WideChar;
    Flags:       Cardinal;
    PackSize:    Cardinal;
    PackSizeHigh:Cardinal;
    UnpSize:     Cardinal;
    UnpSizeHigh: Cardinal;
    HostOS:      Cardinal;
    FileCRC:     Cardinal;
    FileTime:    Cardinal;
    UnpVer:      Cardinal;
    Method:      Cardinal;
    FileAttr:    Cardinal;
    CmtBuf:      LongInt;
    CmtBufSize:  Cardinal;
    CmtSize:     Cardinal;
    CmtState:    Cardinal;
    DictSize:    Cardinal;
    HashType:    Cardinal;
    Hash:        array[0..31] of Byte;
    RedirType:   Cardinal;
    RedirName:   LongInt;
    RedirNameSize: Cardinal;
    DirTarget:   Cardinal;
    mtimeLow:    Cardinal; mtimeHigh: Cardinal;
    ctimeLow:    Cardinal; ctimeHigh: Cardinal;
    atimeLow:    Cardinal; atimeHigh: Cardinal;
    Reserved:    array[0..113] of Cardinal;
  end;

function RAROpenArchiveEx(var Data: TRAROpenArchiveDataEx): LongInt;
  external 'RAROpenArchiveEx@files:UnRAR.dll stdcall';
procedure RARSetPassword(hArcData: LongInt; Password: PAnsiChar);
  external 'RARSetPassword@files:UnRAR.dll stdcall';
function RARReadHeaderEx(hArcData: LongInt; var HeaderData: TRARHeaderDataEx): Integer;
  external 'RARReadHeaderEx@files:UnRAR.dll stdcall';
function RARProcessFile(hArcData: LongInt; Operation: Integer; DestPath, DestName: PAnsiChar): Integer;
  external 'RARProcessFile@files:UnRAR.dll stdcall';
function RARSetCallback(hArcData: LongInt; Callback, UserData: LongInt): LongInt;
  external 'RARSetCallback@files:UnRAR.dll stdcall';
function RARSetProgressProc(hArcData: LongInt; Callback, UserData: LongInt): LongInt;
  external 'RARSetProgressProc@files:UnRAR.dll stdcall';
function RARCloseArchive(hArcData: LongInt): Integer;
  external 'RARCloseArchive@files:UnRAR.dll stdcall';

function C64(Low, High: Cardinal): Int64;
var t: Int64;
begin
  t := Int64(High) * 65536;
  t := t * 65536;
  Result := t + Int64(Low);
end;

function PreScanRAR(const FirstPart, Password: string): Int64;
var
  ao: TRAROpenArchiveDataEx;
  hd: TRARHeaderDataEx;
  h, rc, i: Integer;
  u: Int64;
begin
  Result := 0;

  // inicializar buffer ANSI vacío (FIX Type mismatch)
  EmptyAnsi := '';

  ao.ArcName := PAnsiChar(AnsiString(FirstPart));
  ao.ArcNameW := 0;
  ao.OpenMode := 0;  // LIST
  ao.OpenResult := 0;
  ao.CmtBuf := 0; ao.CmtBufSize := 0; ao.CmtSize := 0; ao.CmtState := 0; ao.Flags := 0;
  for i := 0 to 31 do ao.Reserved[i] := 0;

  h := RAROpenArchiveEx(ao);
  if h = 0 then Exit;

  RARSetPassword(h, PAnsiChar(AnsiString(Password)));

  while True do
  begin
    rc := RARReadHeaderEx(h, hd);
    if rc = 10 then Break;   // ERAR_END_ARCHIVE
    if rc <> 0 then Break;

    if (hd.FileAttr and $10) = 0 then
    begin
      u := C64(hd.UnpSize,  hd.UnpSizeHigh);
      if u > 0 then
        Result := Result + u;
    end;

    // evitar pasar literales -> usar punteros a buffer ANSI
    rc := RARProcessFile(h, 0 {RAR_SKIP}, PAnsiChar(EmptyAnsi), PAnsiChar(EmptyAnsi));
    if rc <> 0 then Break;
  end;

  RARCloseArchive(h);
end;

function TrimTrailingSlashUnlessRoot(const S: string): string;

var R: string;
begin
  R := S;
  while (Length(R) > 3) and (Copy(R, Length(R), 1) = '\') do
    SetLength(R, Length(R) - 1);
 Result := R;
end;


function RARCallbackProc(msg, UserData, P1, P2: Integer): Integer; stdcall;
var pct: Integer;
begin
  if msg = UCM_PROCESSDATA then
  begin
    BytesProcessed := BytesProcessed + Int64(P2);
    if TotalBytes > 0 then
      pct := Integer((BytesProcessed * 100) div TotalBytes)
    else
      pct := 0;
    UpdateGaugeCaption(Format('Extrayendo "%s" (%d%%)…', ['{#RAR_BASENAME}', pct]), pct, False);
  end;
  Result := 0;
end;

procedure DoExtractWithDll(const FirstPart, DestDir: string);
var
  ao: TRAROpenArchiveDataEx;
  hd: TRARHeaderDataEx;
  h, rc, i: Integer;
  destNoSlash: string;
begin
  destNoSlash := TrimTrailingSlashUnlessRoot(DestDir);
  if not DirExists(destNoSlash) then
    if not CreateDir(destNoSlash) then
      RaiseException('No se pudo crear el destino: ' + destNoSlash);

  TotalBytes := PreScanRAR(FirstPart, '{#RAR_PASSWORD}');
  if TotalBytes <= 0 then TotalBytes := {#GAME_SIZE_BYTES};

  BytesProcessed := 0;
  LastPct := -1; LastTick := 0;
  UpdateGaugeCaption('Preparando extracción…', 0, True);

  EmptyAnsi := '';
  ao.ArcName := PAnsiChar(AnsiString(FirstPart));
  ao.ArcNameW := 0;
  ao.OpenMode := RAR_OM_EXTRACT;
  ao.OpenResult := 0;
  ao.CmtBuf := 0; ao.CmtBufSize := 0; ao.CmtSize := 0; ao.CmtState := 0; ao.Flags := 0;
  for i := 0 to 31 do ao.Reserved[i] := 0;

  h := RAROpenArchiveEx(ao);
  if h = 0 then
    RaiseException('No se pudo abrir el archivo RAR.');

  RARSetPassword(h, PAnsiChar(AnsiString('{#RAR_PASSWORD}')));
  RARSetCallback(h, CreateCallback(@RARCallbackProc), 0);
  RARSetProgressProc(h, CreateCallback(@RARCallbackProc), 0);

  while True do
  begin
    rc := RARReadHeaderEx(h, hd);
    if rc = ERAR_END_ARCHIVE then Break;
    if rc <> 0 then
    begin
      RARCloseArchive(h);
      RaiseException('Error leyendo cabecera.');
    end;

    rc := RARProcessFile(h, RAR_EXTRACT, PAnsiChar(AnsiString(destNoSlash)), PAnsiChar(EmptyAnsi));
    if rc <> 0 then
    begin
      RARCloseArchive(h);
      RaiseException('Error extrayendo archivo.');
    end;
  end;

  RARCloseArchive(h);
  UpdateGaugeCaption(Format('Extrayendo "%s" (100%%)…', ['{#RAR_BASENAME}']), 100, True);
end;

//
// Focus fix
//

function IsIconic(hWnd: Integer): Boolean; external 'IsIconic@user32.dll stdcall';
function ShowWindow(hWnd: Integer; nCmdShow: Integer): Boolean; external 'ShowWindow@user32.dll stdcall';
function SetForegroundWindow(hWnd: Integer): Boolean; external 'SetForegroundWindow@user32.dll stdcall';
function SetActiveWindow(hWnd: Integer): Integer; external 'SetActiveWindow@user32.dll stdcall';
function SetWindowPos(hWnd, hWndInsertAfter: Integer; X, Y, cx, cy: Integer; uFlags: Cardinal): Boolean; external 'SetWindowPos@user32.dll stdcall';

procedure TROGH_BringWizardToFrontStrong;
var j: Integer;
begin
  try
    if IsIconic(WizardForm.Handle) then ShowWindow(WizardForm.Handle, SW_RESTORE);
    SetWindowPos(WizardForm.Handle, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOMOVE or SWP_NOSIZE or SWP_SHOWWINDOW);
    for j := 1 to TROGH_PULSES do
    begin
      SetForegroundWindow(WizardForm.Handle);
      SetActiveWindow(WizardForm.Handle);
      WizardForm.BringToFront;
      Sleep(TROGH_DELAY);
    end;
    SetWindowPos(WizardForm.Handle, HWND_NOTOPMOST, 0, 0, 0, 0, SWP_NOMOVE or SWP_NOSIZE);
  except end;
end;

procedure InitializeWizard;
begin
  #if USE_FINISH_BANNER
    AddFinishBranding;
  #endif
  TROGH_BringWizardToFrontStrong;
end;

procedure CurStepChanged(CurStep: TSetupStep);
var
  firstPart, destDir: string;
begin
  if CurStep = ssInstall then
  begin
    firstPart := GetExpectedRARFirstPart();
    if firstPart = '' then
      RaiseException('No se encontró "' + '{#RAR_BASENAME}' +
                     '" (.part1/.part01/.part001/.rar) junto al instalador.'#13#10#13#10'RAR presentes:' + ListRarsFound);

    destDir := ExpandConstant('{app}\');

    WizardForm.StatusLabel.Caption := 'Iniciando extracción…';
    WizardForm.ProgressGauge.Position := 0;
    WizardForm.ProgressGauge.Repaint;
    WizardForm.StatusLabel.Repaint;

    DoExtractWithDll(firstPart, destDir);
  end;

  if (CurStep = ssDone) and (not WizardSilent) then
    Exec('rundll32.exe', 'url.dll,FileProtocolHandler "' + '{#MyURL}' + '"',
         '', SW_SHOWNORMAL, ewNoWait, DummyResult);
end;

