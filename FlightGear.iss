; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!
;
; This script creates an installable FlightGear package for Win32 using the
; "Inno Setup" package builder.  Inno Setup is free (but probably not open
; source?.)  The official web site for this package building software is:
;
;     http://www.jrsoftware.org/isinfo.php
;
; Note: the files must appear in the X: drive.
; You can do this with the command below:
;
;     subst X: path_to_files
;
; For example:
;
;     C:\> subst X: F:\Path\to\FlightGear\root
;     C:\> subst X: F:\
;

#include "InstallConfig.iss"

#if GetEnv("VSINSTALLDIR") == ""
  #define VSInstallDir "C:\Program Files (x86)\Microsoft Visual Studio 14.0"
#else
  #define VSInstallDir GetEnv("VSINSTALLDIR")
#endif

#define VCInstallDir VSInstallDir + "\VC"
#define InstallDir32 "X:\install\msvc140"
#define OSGInstallDir InstallDir32 + "\OpenSceneGraph"
#define OSGPluginsDir OSGInstallDir + "\bin\osgPlugins-" + OSGVersion

#define InstallDir64 "X:\install\msvc140-64"
#define OSG64InstallDir InstallDir64 + "\OpenSceneGraph"
#define OSG64PluginsDir OSG64InstallDir + "\bin\osgPlugins-" + OSGVersion

#define ThirdPartyDir "X:\windows-3rd-party\msvc140"

; we copy everything in install/<arch>/bin except these, which aren't
; useful to the end-user to ship
#define ExcludedBinaries "*smooth.exe,metar.exe,js_demo.exe"

[Setup]
AppId=FlightGear
AppName=FlightGear
AppPublisher=The FlightGear Team
OutputBaseFilename=FlightGear-{#FGVersion}{#FGDetails}
AppVerName=FlightGear v{#FGVersion}
AppPublisherURL=http://www.flightgear.org
AppSupportURL=http://www.flightgear.org
AppUpdatesURL=http://www.flightgear.org
DefaultDirName={pf}\FlightGear {#FGVersion}
UsePreviousAppDir=no
DefaultGroupName=FlightGear {#FGVersion}
UsePreviousGroup=no
LicenseFile=X:\flightgear\COPYING
Uninstallable=yes
SetupIconFile=X:\flightgear\package\flightgear.ico
VersionInfoVersion={#FGVersion}.0
InfoBeforeFile=X:\flightgear\package\windows\infobefore.txt
WizardImageFile=X:\flightgear\package\windows\setupimg.bmp
WizardImageStretch=No
WizardSmallImageFile=X:\flightgear\package\windows\setupsmall.bmp
VersionInfoCompany=The FlightGear Team
UninstallDisplayIcon={app}\bin\fgfs.exe
ArchitecturesInstallIn64BitMode=x64
ArchitecturesAllowed=x86 x64

; Sign tool must be defined in the Inno Setup GUI, to avoid
; exposing the certificate password
; SignTool=fg_code_sign1

[Tasks]
; NOTE: The following entry contains English phrases ("Create a desktop icon" and "Additional icons"). You are free to translate them into another language if required.
Name: "desktopicon"; Description: "Create a &desktop icon"; GroupDescription: "Additional icons:"

[Files]
; NOTE: run subst X: F:\ (or whatever path the expanded tree resides at)
;Source: "X:\*.txt"; DestDir: "{app}"; Flags: ignoreversion
; 32 bits install

Source: "{#InstallDir32}\bin\*.*"; DestDir: "{app}\bin"; Excludes: "{#ExcludedBinaries}"; Flags: ignoreversion recursesubdirs; Check: not Is64BitInstallMode
;locale only exists for fgrun - which has been disabled
;Source: "{#InstallDir32}\share\locale\*"; DestDir: "{app}\bin\locale"; Flags: ignoreversion recursesubdirs; Check: not Is64BitInstallMode

Source: "{#ThirdPartyDir}\3rdParty\bin\zlib.dll"; DestDir: "{app}\bin"; Check: not Is64BitInstallMode
Source: "{#ThirdPartyDir}\3rdParty\bin\OpenAL32.dll"; DestDir: "{app}\bin"; Check: not Is64BitInstallMode
Source: "{#ThirdPartyDir}\3rdParty\bin\libpng.dll"; DestDir: "{app}\bin"; Check: not Is64BitInstallMode
Source: "{#ThirdPartyDir}\3rdParty\bin\libcurl.dll"; DestDir: "{app}\bin"; Check: not Is64BitInstallMode
Source: "{#ThirdPartyDir}\3rdParty\bin\libintl-8.dll"; DestDir: "{app}\bin"; Check: not Is64BitInstallMode
Source: "{#ThirdPartyDir}\3rdParty\bin\CrashRpt1403.dll"; DestDir: "{app}\bin"; Check: not Is64BitInstallMode
Source: "{#ThirdPartyDir}\3rdParty\bin\crashrpt_lang.ini"; DestDir: "{app}\bin"; Check: not Is64BitInstallMode
Source: "{#ThirdPartyDir}\3rdParty\bin\CrashSender1403.exe"; DestDir: "{app}\bin"; Check: not Is64BitInstallMode
Source: "{#VCInstallDir}\redist\x86\Microsoft.VC140.CRT\*.dll"; DestDir:  "{app}\bin"; Check: not Is64BitInstallMode

; 64 bits install
Source: "{#InstallDir64}\bin\*.*"; DestDir: "{app}\bin"; Excludes: "{#ExcludedBinaries}"; Flags: ignoreversion recursesubdirs; Check: Is64BitInstallMode
;locale only exists for fgrun - which has been disabled
;Source: "{#InstallDir64}\share\locale\*"; DestDir: "{app}\bin\locale"; Flags: ignoreversion recursesubdirs; Check: Is64BitInstallMode

Source: "{#ThirdPartyDir}\3rdParty.x64\bin\zlib.dll"; DestDir: "{app}\bin"; Check: Is64BitInstallMode
Source: "{#ThirdPartyDir}\3rdParty.x64\bin\OpenAL32.dll"; DestDir: "{app}\bin"; Check: Is64BitInstallMode
Source: "{#ThirdPartyDir}\3rdParty.x64\bin\libpng.dll"; DestDir: "{app}\bin"; Check: Is64BitInstallMode
Source: "{#ThirdPartyDir}\3rdParty.x64\bin\libcurl.dll"; DestDir: "{app}\bin"; Check: Is64BitInstallMode
Source: "{#ThirdPartyDir}\3rdParty.x64\bin\libintl-8.dll"; DestDir: "{app}\bin"; Check: Is64BitInstallMode
Source: "{#ThirdPartyDir}\3rdParty.x64\bin\CrashRpt1403.dll"; DestDir: "{app}\bin"; Check: Is64BitInstallMode
Source: "{#ThirdPartyDir}\3rdParty.x64\bin\crashrpt_lang.ini"; DestDir: "{app}\bin"; Check: Is64BitInstallMode
Source: "{#ThirdPartyDir}\3rdParty.x64\bin\CrashSender1403.exe"; DestDir: "{app}\bin"; Check: Is64BitInstallMode
Source: "{#VCInstallDir}\redist\x64\Microsoft.VC140.CRT\*.dll"; DestDir: "{app}\bin"; Check: Is64BitInstallMode

; 32/64 bits install
;NOTE: FGPanel has no 64 bits equivalent, so we are using the 32 bits binary for 32&64 bits OS
;Torsten 2017-02-21: currently no FGPanel due to missing glew dependency
;Source: "{#InstallDir32}\bin\fgpanel.exe"; DestDir: "{app}\bin"; Flags: ignoreversion


; Include the base package
#if IncludeData == "TRUE"
Source: "X:\fgdata\*.*"; DestDir: "{app}\data"; Flags: ignoreversion recursesubdirs skipifsourcedoesntexist
#endif

; 32 bits install
Source: "{#OSGInstallDir}\bin\osg{#OSGSoNumber}-osg.dll"; DestDir: "{app}\bin"; Check: not Is64BitInstallMode
Source: "{#OSGInstallDir}\bin\osg{#OSGSoNumber}-osgDB.dll"; DestDir: "{app}\bin"; Check: not Is64BitInstallMode
Source: "{#OSGInstallDir}\bin\osg{#OSGSoNumber}-osgGA.dll"; DestDir: "{app}\bin"; Check: not Is64BitInstallMode
Source: "{#OSGInstallDir}\bin\osg{#OSGSoNumber}-osgParticle.dll"; DestDir: "{app}\bin"; Check: not Is64BitInstallMode
Source: "{#OSGInstallDir}\bin\osg{#OSGSoNumber}-osgText.dll"; DestDir: "{app}\bin"; Check: not Is64BitInstallMode
Source: "{#OSGInstallDir}\bin\osg{#OSGSoNumber}-osgUtil.dll"; DestDir: "{app}\bin"; Check: not Is64BitInstallMode
Source: "{#OSGInstallDir}\bin\osg{#OSGSoNumber}-osgViewer.dll"; DestDir: "{app}\bin"; Check: not Is64BitInstallMode
Source: "{#OSGInstallDir}\bin\osg{#OSGSoNumber}-osgSim.dll"; DestDir: "{app}\bin"; Check: not Is64BitInstallMode
Source: "{#OSGInstallDir}\bin\osg{#OSGSoNumber}-osgFX.dll"; DestDir: "{app}\bin"; Check: not Is64BitInstallMode
Source: "{#OSGInstallDir}\bin\ot{#OTSoNumber}-OpenThreads.dll"; DestDir: "{app}\bin"; Check: not Is64BitInstallMode

Source: "{#OSGPluginsDir}\osgdb_ac.dll"; DestDir: "{app}\bin\osgPlugins-{#OSGVersion}"; Check: not Is64BitInstallMode
Source: "{#OSGPluginsDir}\osgdb_osg.dll"; DestDir: "{app}\bin\osgPlugins-{#OSGVersion}"; Check: not Is64BitInstallMode
Source: "{#OSGPluginsDir}\osgdb_osga.dll"; DestDir: "{app}\bin\osgPlugins-{#OSGVersion}"; Check: not Is64BitInstallMode
Source: "{#OSGPluginsDir}\osgdb_3ds.dll"; DestDir: "{app}\bin\osgPlugins-{#OSGVersion}"; Check: not Is64BitInstallMode
Source: "{#OSGPluginsDir}\osgdb_mdl.dll"; DestDir: "{app}\bin\osgPlugins-{#OSGVersion}"; Check: not Is64BitInstallMode
Source: "{#OSGPluginsDir}\osgdb_jpeg.dll"; DestDir: "{app}\bin\osgPlugins-{#OSGVersion}"; Check: not Is64BitInstallMode
Source: "{#OSGPluginsDir}\osgdb_rgb.dll"; DestDir: "{app}\bin\osgPlugins-{#OSGVersion}"; Check: not Is64BitInstallMode
Source: "{#OSGPluginsDir}\osgdb_png.dll"; DestDir: "{app}\bin\osgPlugins-{#OSGVersion}"; Check: not Is64BitInstallMode
Source: "{#OSGPluginsDir}\osgdb_dds.dll"; DestDir: "{app}\bin\osgPlugins-{#OSGVersion}"; Check: not Is64BitInstallMode
Source: "{#OSGPluginsDir}\osgdb_txf.dll"; DestDir: "{app}\bin\osgPlugins-{#OSGVersion}"; Check: not Is64BitInstallMode
Source: "{#OSGPluginsDir}\osgdb_tiff.dll"; DestDir: "{app}\bin\osgPlugins-{#OSGVersion}"; Check: not Is64BitInstallMode
Source: "{#OSGPluginsDir}\osgdb_freetype.dll"; DestDir: "{app}\bin\osgPlugins-{#OSGVersion}"; Check: not Is64BitInstallMode

;Source: "{#OSGPluginsDir}\osgdb_serializers_osg.dll"; DestDir: "{app}\bin\osgPlugins-{#OSGVersion}"; Check: not Is64BitInstallMode
;Source: "{#OSGPluginsDir}\osgdb_serializers_osganimation.dll"; DestDir: "{app}\bin\osgPlugins-{#OSGVersion}"; Check: not Is64BitInstallMode
;Source: "{#OSGPluginsDir}\osgdb_serializers_osgfx.dll"; DestDir: "{app}\bin\osgPlugins-{#OSGVersion}"; Check: not Is64BitInstallMode
;Source: "{#OSGPluginsDir}\osgdb_serializers_osgmanipulator.dll"; DestDir: "{app}\bin\osgPlugins-{#OSGVersion}"; Check: not Is64BitInstallMode
;Source: "{#OSGPluginsDir}\osgdb_serializers_osgparticle.dll"; DestDir: "{app}\bin\osgPlugins-{#OSGVersion}"; Check: not Is64BitInstallMode
;Source: "{#OSGPluginsDir}\osgdb_serializers_osgshadow.dll"; DestDir: "{app}\bin\osgPlugins-{#OSGVersion}"; Check: not Is64BitInstallMode
;Source: "{#OSGPluginsDir}\osgdb_serializers_osgsim.dll"; DestDir: "{app}\bin\osgPlugins-{#OSGVersion}"; Check: not Is64BitInstallMode
;Source: "{#OSGPluginsDir}\osgdb_serializers_osgterrain.dll"; DestDir: "{app}\bin\osgPlugins-{#OSGVersion}"; Check: not Is64BitInstallMode
;Source: "{#OSGPluginsDir}\osgdb_serializers_osgtext.dll"; DestDir: "{app}\bin\osgPlugins-{#OSGVersion}"; Check: not Is64BitInstallMode
;Source: "{#OSGPluginsDir}\osgdb_serializers_osgvolume.dll"; DestDir: "{app}\bin\osgPlugins-{#OSGVersion}"; Check: not Is64BitInstallMode
;Source: "{#OSGPluginsDir}\osgdb_deprecated_osg.dll"; DestDir: "{app}\bin\osgPlugins-{#OSGVersion}"; Check: not Is64BitInstallMode
;Source: "{#OSGPluginsDir}\osgdb_deprecated_osgparticle.dll"; DestDir: "{app}\bin\osgPlugins-{#OSGVersion}"; Check: not Is64BitInstallMode

; 64 bits install
Source: "{#OSG64InstallDir}\bin\osg{#OSGSoNumber}-osg.dll"; DestDir: "{app}\bin"; Check: Is64BitInstallMode
Source: "{#OSG64InstallDir}\bin\osg{#OSGSoNumber}-osgDB.dll"; DestDir: "{app}\bin"; Check: Is64BitInstallMode
Source: "{#OSG64InstallDir}\bin\osg{#OSGSoNumber}-osgGA.dll"; DestDir: "{app}\bin"; Check: Is64BitInstallMode
Source: "{#OSG64InstallDir}\bin\osg{#OSGSoNumber}-osgParticle.dll"; DestDir: "{app}\bin"; Check: Is64BitInstallMode
Source: "{#OSG64InstallDir}\bin\osg{#OSGSoNumber}-osgText.dll"; DestDir: "{app}\bin"; Check: Is64BitInstallMode
Source: "{#OSG64InstallDir}\bin\osg{#OSGSoNumber}-osgUtil.dll"; DestDir: "{app}\bin"; Check: Is64BitInstallMode
Source: "{#OSG64InstallDir}\bin\osg{#OSGSoNumber}-osgViewer.dll"; DestDir: "{app}\bin"; Check: Is64BitInstallMode
Source: "{#OSG64InstallDir}\bin\osg{#OSGSoNumber}-osgSim.dll"; DestDir: "{app}\bin"; Check: Is64BitInstallMode
Source: "{#OSG64InstallDir}\bin\osg{#OSGSoNumber}-osgFX.dll"; DestDir: "{app}\bin"; Check: Is64BitInstallMode
Source: "{#OSG64InstallDir}\bin\ot{#OTSoNumber}-OpenThreads.dll"; DestDir: "{app}\bin"; Check: Is64BitInstallMode

Source: "{#OSG64PluginsDir}\osgdb_ac.dll"; DestDir: "{app}\bin\osgPlugins-{#OSGVersion}"; Flags: skipifsourcedoesntexist; Check: Is64BitInstallMode
Source: "{#OSG64PluginsDir}\osgdb_osg.dll"; DestDir: "{app}\bin\osgPlugins-{#OSGVersion}"; Flags: skipifsourcedoesntexist; Check: Is64BitInstallMode
Source: "{#OSG64PluginsDir}\osgdb_osga.dll"; DestDir: "{app}\bin\osgPlugins-{#OSGVersion}"; Flags: skipifsourcedoesntexist; Check: Is64BitInstallMode
Source: "{#OSG64PluginsDir}\osgdb_3ds.dll"; DestDir: "{app}\bin\osgPlugins-{#OSGVersion}"; Flags: skipifsourcedoesntexist; Check: Is64BitInstallMode
Source: "{#OSG64PluginsDir}\osgdb_mdl.dll"; DestDir: "{app}\bin\osgPlugins-{#OSGVersion}"; Flags: skipifsourcedoesntexist; Check: Is64BitInstallMode
Source: "{#OSG64PluginsDir}\osgdb_jpeg.dll"; DestDir: "{app}\bin\osgPlugins-{#OSGVersion}"; Flags: skipifsourcedoesntexist; Check: Is64BitInstallMode
Source: "{#OSG64PluginsDir}\osgdb_rgb.dll"; DestDir: "{app}\bin\osgPlugins-{#OSGVersion}"; Flags: skipifsourcedoesntexist; Check: Is64BitInstallMode
Source: "{#OSG64PluginsDir}\osgdb_png.dll"; DestDir: "{app}\bin\osgPlugins-{#OSGVersion}"; Flags: skipifsourcedoesntexist; Check: Is64BitInstallMode
Source: "{#OSG64PluginsDir}\osgdb_dds.dll"; DestDir: "{app}\bin\osgPlugins-{#OSGVersion}"; Flags: skipifsourcedoesntexist; Check: Is64BitInstallMode
Source: "{#OSG64PluginsDir}\osgdb_txf.dll"; DestDir: "{app}\bin\osgPlugins-{#OSGVersion}"; Flags: skipifsourcedoesntexist; Check: Is64BitInstallMode
Source: "{#OSG64PluginsDir}\osgdb_tiff.dll"; DestDir: "{app}\bin\osgPlugins-{#OSGVersion}"; Flags: skipifsourcedoesntexist; Check: Is64BitInstallMode
Source: "{#OSG64PluginsDir}\osgdb_freetype.dll"; DestDir: "{app}\bin\osgPlugins-{#OSGVersion}"; Flags: skipifsourcedoesntexist; Check: Is64BitInstallMode

;Source: "{#OSG64PluginsDir}\osgdb_serializers_osg.dll"; DestDir: "{app}\bin\osgPlugins-{#OSGVersion}"; Flags: skipifsourcedoesntexist; Check: Is64BitInstallMode
;Source: "{#OSG64PluginsDir}\osgdb_serializers_osganimation.dll"; DestDir: "{app}\bin\osgPlugins-{#OSGVersion}"; Flags: skipifsourcedoesntexist; Check: Is64BitInstallMode
;Source: "{#OSG64PluginsDir}\osgdb_serializers_osgfx.dll"; DestDir: "{app}\bin\osgPlugins-{#OSGVersion}"; Flags: skipifsourcedoesntexist; Check: Is64BitInstallMode
;Source: "{#OSG64PluginsDir}\osgdb_serializers_osgmanipulator.dll"; DestDir: "{app}\bin\osgPlugins-{#OSGVersion}"; Flags: skipifsourcedoesntexist; Check: Is64BitInstallMode
;Source: "{#OSG64PluginsDir}\osgdb_serializers_osgparticle.dll"; DestDir: "{app}\bin\osgPlugins-{#OSGVersion}"; Flags: skipifsourcedoesntexist; Check: Is64BitInstallMode
;Source: "{#OSG64PluginsDir}\osgdb_serializers_osgshadow.dll"; DestDir: "{app}\bin\osgPlugins-{#OSGVersion}"; Flags: skipifsourcedoesntexist; Check: Is64BitInstallMode
;Source: "{#OSG64PluginsDir}\osgdb_serializers_osgsim.dll"; DestDir: "{app}\bin\osgPlugins-{#OSGVersion}"; Flags: skipifsourcedoesntexist; Check: Is64BitInstallMode
;Source: "{#OSG64PluginsDir}\osgdb_serializers_osgterrain.dll"; DestDir: "{app}\bin\osgPlugins-{#OSGVersion}"; Flags: skipifsourcedoesntexist; Check: Is64BitInstallMode
;Source: "{#OSG64PluginsDir}\osgdb_serializers_osgtext.dll"; DestDir: "{app}\bin\osgPlugins-{#OSGVersion}"; Flags: skipifsourcedoesntexist; Check: Is64BitInstallMode
;Source: "{#OSG64PluginsDir}\osgdb_serializers_osgvolume.dll"; DestDir: "{app}\bin\osgPlugins-{#OSGVersion}"; Flags: skipifsourcedoesntexist; Check: Is64BitInstallMode
;Source: "{#OSG64PluginsDir}\osgdb_deprecated_osg.dll"; DestDir: "{app}\bin\osgPlugins-{#OSGVersion}"; Flags: skipifsourcedoesntexist; Check: Is64BitInstallMode
;Source: "{#OSG64PluginsDir}\osgdb_deprecated_osgparticle.dll"; DestDir: "{app}\bin\osgPlugins-{#OSGVersion}"; Flags: skipifsourcedoesntexist; Check: Is64BitInstallMode

[Dirs]
; Make the user installable scenery directory
Name: "{userdocs}\FlightGear\Aircraft"; Permissions: everyone-modify; Check: not DirExists(ExpandConstant('{userdocs}\FlightGear\Aircraft'))
Name: "{userdocs}\FlightGear\TerraSync"; Permissions: everyone-modify; Check: not DirExists(ExpandConstant('{userdocs}\FlightGear\TerraSync'))
Name: "{userdocs}\FlightGear\Custom Scenery"; Permissions: everyone-modify; Check: not DirExists(ExpandConstant('{userdocs}\FlightGear\Custom Scenery'))

[Icons]
Name: "{userdesktop}\FlightGear {#FGVersion}"; Filename: "{app}\bin\fgfs.exe"; Parameters: "--launcher"; WorkingDir: "{app}\bin"; Tasks: desktopicon;
Name: "{group}\FlightGear"; Filename: "{app}\bin\fgfs.exe"; Parameters: "--launcher"; WorkingDir: "{app}\bin";
Name: "{group}\FlightGear Manual"; Filename: "{app}\data\Docs\getstart.pdf"
Name: "{group}\FlightGear Documentation"; Filename: "{app}\data\Docs\index.html"
Name: "{group}\Flightgear Wiki"; Filename: "http://wiki.flightgear.org"
Name: "{group}\Tools\Uninstall FlightGear"; Filename: "{uninstallexe}"
Name: "{group}\Tools\fgjs"; Filename: "cmd"; Parameters: "/k fgjs.exe ""--fg-root={app}\data"""; WorkingDir: "{app}\bin"
Name: "{group}\Tools\yasim"; Filename: "cmd"; Parameters: "/k ""{app}\bin\yasim.exe"" -h"; WorkingDir: "{app}\bin"
;Name: "{group}\Tools\fgpanel"; Filename: "cmd"; Parameters: "/k ""{app}\bin\fgpanel.exe"" -h"; WorkingDir: "{app}\bin"
Name: "{group}\Tools\FGCom"; Filename: "{app}\bin\fgcom.exe"; WorkingDir: "{app}\bin"
Name: "{group}\Tools\FGCom-testing"; Filename: "{app}\bin\fgcom.exe"; Parameters: "--frequency=910"; WorkingDir: "{app}\bin"
Name: "{group}\Tools\Explore Documentation Folder"; Filename: "{app}\data\Docs"

[Code]
const
  NET_FW_SCOPE_ALL = 0;
  NET_FW_IP_VERSION_ANY = 2;
  NET_FW_ACTION_ALLOW = 1;
  NET_FW_RULE_DIR_ALL = 0;
  NET_FW_RULE_DIR_IN = 1;
  NET_FW_RULE_DIR_OUT = 2;
  NET_FW_IP_PROTOCOL_ALL = 0;
  NET_FW_IP_PROTOCOL_TCP = 6;
  NET_FW_IP_PROTOCOL_UDP = 17;
  NET_FW_PROFILE2_DOMAIN = 1;
  NET_FW_PROFILE2_PRIVATE = 2;
  NET_FW_PROFILE2_PUBLIC = 4;

procedure URLLabelOnClick(Sender: TObject);
var
  ErrorCode: Integer;
begin
  ShellExec('open', 'http://www.flightgear.org', '', '', SW_SHOWNORMAL, ewNoWait, ErrorCode);
end;

procedure CreateURLLabel(ParentForm: TSetupForm; CancelButton: TNewButton);
var
  URLLabel: TNewStaticText;
begin
  URLLabel := TNewStaticText.Create(ParentForm);
  URLLabel.Caption := 'www.flightgear.org';
  URLLabel.Cursor := crHand;
  URLLabel.OnClick := @URLLabelOnClick;
  URLLabel.Parent := ParentForm;
  { Alter Font *after* setting Parent so the correct defaults are inherited first }
  URLLabel.Font.Style := URLLabel.Font.Style + [fsUnderline];
  URLLabel.Font.Color := clBlue;
  URLLabel.Top := CancelButton.Top + CancelButton.Height - URLLabel.Height - 2;
  URLLabel.Left := ScaleX(20);
end;

function UpdateReadyMemo(Space, NewLine, MemoUserInfoInfo, MemoDirInfo, MemoTypeInfo, MemoComponentsInfo, MemoGroupInfo, MemoTasksInfo: String): String;
var
  S: String;
begin
  S := '';
  S := S + MemoDirInfo + NewLine + NewLine;
  S := S + MemoGroupInfo + NewLine + NewLine;
  S := S + MemoTasksInfo + NewLine + NewLine;

  Result := S;
end;

procedure AddBasicFirewallException(AppName, FileName: String);
var
  FirewallObject: variant;
  RuleObject: variant;
begin
  try
    FirewallObject := CreateOleObject('HNetCfg.FwMgr');
    RuleObject := CreateOleObject('HNetCfg.FwAuthorizedApplication');
    RuleObject.ProcessImageFileName := FileName;
    RuleObject.Name := AppName;
    RuleObject.Scope := NET_FW_SCOPE_ALL;
    RuleObject.IpVersion := NET_FW_IP_VERSION_ANY;
    RuleObject.Enabled := true;
    FirewallObject.LocalPolicy.CurrentProfile.AuthorizedApplications.Add(RuleObject);
  except
  end;
end;

procedure AddAdvancedFirewallException(AppName, AppDescription, FileName: String; Protocol: Integer; LocalPorts, RemotePorts: String; Direction: Integer);
var
  FirewallObject: variant;
  RuleObject: variant;
begin
  try
    FirewallObject := CreateOleObject('HNetCfg.FwPolicy2');
    RuleObject := CreateOleObject('HNetCfg.FWRule');
    RuleObject.Name := AppName;
    RuleObject.Description := AppDescription;
    RuleObject.ApplicationName := FileName;
    if (Protocol <> NET_FW_IP_PROTOCOL_ALL) then
      RuleObject.Protocol := Protocol;
    if (LocalPorts <> '') then
      RuleObject.LocalPorts := LocalPorts;
    if (RemotePorts <> '') then
      RuleObject.RemotePorts := RemotePorts;
    if (Direction <> NET_FW_RULE_DIR_ALL) then
      RuleObject.Direction := Direction;
    RuleObject.Enabled := true;
    RuleObject.Grouping := 'FlightGear';
    RuleObject.Profiles := NET_FW_PROFILE2_DOMAIN + NET_FW_PROFILE2_PRIVATE + NET_FW_PROFILE2_PUBLIC;
    RuleObject.Action := NET_FW_ACTION_ALLOW;
    RuleObject.RemoteAddresses := '*';
    FirewallObject.Rules.Add(RuleObject);
  except
  end;
end;

procedure RemoveFirewallException(AppName, FileName: String);
var
  FirewallObject: variant;
  Version: TWindowsVersion;
begin
  GetWindowsVersionEx(Version);
  try
    if (Version.Major >= 6) then
      begin
        FirewallObject := CreateOleObject('HNetCfg.FwPolicy2');
        FirewallObject.Rules.Remove(AppName);
      end
    else if (Version.Major = 5) and (((Version.Minor = 1) and (Version.ServicePackMajor >= 2)) or ((Version.Minor = 2) and (Version.ServicePackMajor >= 1))) then
      begin
        FirewallObject := CreateOleObject('HNetCfg.FwMgr');
        FirewallObject.LocalPolicy.CurrentProfile.AuthorizedApplications.Remove(FileName);
      end;
  except
  end;
end;

procedure CurStepChanged(CurStep: TSetupStep);
var
  Version: TWindowsVersion;
begin
  if CurStep = ssPostInstall then
    begin
      GetWindowsVersionEx(Version);
      if (Version.Major >= 6) then
        begin
          { IN and OUT rules must be specified separately, otherwise the firewall will create only the IN rule }
          AddAdvancedFirewallException('FlightGear', 'Allows FlightGear to send and receive data over the multiplayer network and to get METARs.', ExpandConstant('{app}') + '\bin\fgfs.exe', NET_FW_IP_PROTOCOL_ALL, '', '', NET_FW_RULE_DIR_IN);
          AddAdvancedFirewallException('FlightGear', 'Allows FlightGear to send and receive data over the multiplayer network and to get METARs.', ExpandConstant('{app}') + '\bin\fgfs.exe', NET_FW_IP_PROTOCOL_ALL, '', '', NET_FW_RULE_DIR_OUT);
          AddAdvancedFirewallException('FlightGear FGCom', 'Allows FGCom to establish a connection to FlightGear and the VoIP server for voice ATC communication.', ExpandConstant('{app}') + '\bin\fgcom.exe', NET_FW_IP_PROTOCOL_ALL, '', '', NET_FW_RULE_DIR_IN);
          AddAdvancedFirewallException('FlightGear FGCom', 'Allows FGCom to establish a connection to FlightGear and the VoIP server for voice ATC communication.', ExpandConstant('{app}') + '\bin\fgcom.exe', NET_FW_IP_PROTOCOL_ALL, '', '', NET_FW_RULE_DIR_OUT);
        end
      else if (Version.Major = 5) and (((Version.Minor = 1) and (Version.ServicePackMajor >= 2)) or ((Version.Minor = 2) and (Version.ServicePackMajor >= 1))) then
        begin
          { The Windows XP/Server 2003 firewall does not block outgoing connections at all, so only listening processes should be added }
          AddBasicFirewallException('FlightGear', ExpandConstant('{app}') + '\bin\fgfs.exe');
          AddBasicFirewallException('FlightGear FGCom', ExpandConstant('{app}') + '\bin\fgcom.exe');
        end;
    end;
end;

procedure CurUninstallStepChanged(CurUninstallStep: TUninstallStep);
begin
  if CurUninstallStep = usPostUninstall then
    begin
      RemoveFirewallException('FlightGear', ExpandConstant('{app}') + '\bin\fgfs.exe');
      RemoveFirewallException('FlightGear FGCom', ExpandConstant('{app}') + '\bin\fgcom.exe');
    end;
end;
