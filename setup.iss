#define MyAppName "AppFlowy Bundle"
#define MyAppVersion "1.0"
#define MyAppPublisher "AppFlowy"
#define MyAppURL "https://appflowy.io"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
AppId={{E8F2C064-D9C4-4C8A-9959-3A6929D6802D}}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={autopf}\{#MyAppName}
DefaultGroupName={#MyAppName}
AllowNoIcons=yes
OutputDir=output
OutputBaseFilename=AppFlowyBundleSetup
Compression=lzma
SolidCompression=yes
WizardStyle=modern
; Create the app directory if it doesn't exist
DirExists=yes

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
; Ollama Setup
Source: "app\OllamaSetup.exe"; DestDir: "{app}"; Flags: ignoreversion

; AppFlowy Main Application
Source: "app\AppFlowy.exe"; DestDir: "{app}"; Flags: ignoreversion

; AppFlowy LAI
Source: "app\AppFlowyLAI\AppFlowy_LAI.exe"; DestDir: "{app}\AppFlowyLAI"; Flags: ignoreversion

; AF Ollama Plugin
Source: "app\AppFlowyLAI\_internal\af_ollama_plugin.exe"; DestDir: "{app}\AppFlowyLAI\_internal"; Flags: ignoreversion createallsubdirs

[Icons]
Name: "{group}\AppFlowy"; Filename: "{app}\AppFlowy.exe"
Name: "{group}\AppFlowy LAI"; Filename: "{app}\AppFlowyLAI\AppFlowy_LAI.exe"
Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}"
Name: "{autodesktop}\AppFlowy"; Filename: "{app}\AppFlowy.exe"; Tasks: desktopicon

[Run]
; First install Ollama
Filename: "{app}\OllamaSetup.exe"; Description: "Installing Ollama..."; Flags: waituntilterminated
; Then launch AppFlowy
Filename: "{app}\AppFlowy.exe"; Description: "{cm:LaunchProgram,AppFlowy}"; Flags: nowait postinstall skipifsilent
; Launch AppFlowy LAI
Filename: "{app}\AppFlowyLAI\AppFlowy_LAI.exe"; Description: "Launch AppFlowy LAI"; Flags: nowait postinstall skipifsilent
; Initialize AF Ollama Plugin
Filename: "{app}\AppFlowyLAI\_internal\af_ollama_plugin.exe"; Description: "Initialize AF Ollama Plugin"; Flags: nowait postinstall skipifsilent runhidden