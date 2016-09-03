[Setup]
AppName=Tsukihime: русская демо-версия 0.1.1
AppVerName=Tsukihime: русская демо-версия 0.1.1
DefaultDirName={pf}\Tsukihime Rus Demo
DisableProgramGroupPage=true
UninstallDisplayIcon={app}\Tsukihime.exe
OutputDir=d:\MyWorks\Setup\Tsukihime\Setup Source\Ouput\
OutputBaseFilename=tsukihime_rus
AppCopyright=Jiyuu-VN
ExtraDiskSpaceRequired=103307812
PrivilegesRequired=none
AppPublisher=Jiyuu-VN
AppPublisherURL=http://jiyuu-vn.ru
AppSupportURL=http://jiyuu-vn.ru
AppUpdatesURL=http://jiyuu-vn.ru
AppVersion=0.1.1
UninstallDisplayName=Tsukihime: русификатор
WizardImageFile=D:\MyWorks\Setup\Tsukihime\Setup Source\ark.bmp
WizardSmallImageFile=D:\MyWorks\Setup\Tsukihime\Setup Source\arks_55.bmp
SetupIconFile=D:\MyWorks\Setup\Tsukihime\Setup Source\tsukihime.ico
LicenseFile=readme.txt

[Languages]
Name: ru; MessagesFile: compiler:Languages\Russian.isl

[Files]
Source: ..\Tsukihime.exe; DestDir: {app}
Source: ..\ONSlaught.exe; DestDir: {app}; Attribs: hidden
Source: ..\SDL.dll; DestDir: {app}
Source: ..\Arguments.txt; DestDir: {app}; Attribs: hidden
Source: ..\arc.nsa; DestDir: {app}
Source: ..\nscript.dat; DestDir: {app}
Source: ..\default.ttf; DestDir: {app}
Source: ..\readme.txt; DestDir: {app}
Source: {code:GetNSAFile}; DestDir: {app}; Flags: external

[Code]
var
  NSAArc: TInputFileWizardPage;
  NSAFile : String;

procedure InitializeWizard;
begin
  { Create the pages }

  NSAArc := CreateInputFilePage(wpWelcome,
  'Шаг 1: оригинальные файлы.', 'Укажите путь к необходимым файлам.',
  'Укажите путь к arc.sar и нажмите Далее.');

  NSAArc.Add('Путь к arc.sar:',
    'Файлы Tsukihime sar|*.sar',
    '.sar');

end;

function ShouldSkipPage(PageID: Integer): Boolean;
begin
    Result := False;
end;

function NextButtonClick(CurPageID: Integer): Boolean;
var
  I: Integer;
begin

  if CurPageID = NSAArc.ID then begin
    if NSAArc.Values[0] = '' then begin
      MsgBox('Укажите путь к arc.sar: он необходим для установки!', mbError, MB_OK);
      Result := False;
    end else begin
      NSAFile := NSAArc.Values[0];
      Result := True;
     end;
  end else Result := True;

end;

{function UpdateReadyMemo(Space, NewLine, MemoUserInfoInfo, MemoDirInfo, MemoTypeInfo,
  MemoComponentsInfo, MemoGroupInfo, MemoTasksInfo: String): String;
var
  S: String;
begin

end;}

function GetNSAFile(Param : String) : string;
begin
  Result := NSAFile;
end;


