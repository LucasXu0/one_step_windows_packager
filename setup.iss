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

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
; AppFlowy
Source: "AppFlowy.exe"; DestDir: "{app}"; Flags: ignoreversion
; Ollama
Source: "ollama.exe"; DestDir: "{app}"; Flags: ignoreversion
; AF Ollama Plugin
Source: "af_ollama_plugins.exe"; DestDir: "{app}"; Flags: ignoreversion
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{group}\AppFlowy"; Filename: "{app}\AppFlowy.exe"
Name: "{group}\Ollama"; Filename: "{app}\ollama.exe"
Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}"
Name: "{autodesktop}\AppFlowy"; Filename: "{app}\AppFlowy.exe"; Tasks: desktopicon

[Run]
Filename: "{app}\AppFlowy.exe"; Description: "{cm:LaunchProgram,AppFlowy}"; Flags: nowait postinstall skipifsilent
Filename: "{app}\ollama.exe"; Description: "Start Ollama Service"; Flags: nowait postinstall skipifsilent runhidden
Filename: "{app}\af_ollama_plugins.exe"; Description: "Initialize AF Ollama Plugin"; Flags: nowait postinstall skipifsilent runhidden