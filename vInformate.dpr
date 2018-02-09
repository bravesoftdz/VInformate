program vInformate;

uses
  System.StartUpCopy,
  FMX.Forms,
  fm_VIDirect in 'fm_VIDirect.pas' {VIDirectForm},
  ServiceClasses in 'Common\ServiceClasses.pas',
  u_getVersion in 'Common\u_getVersion.pas',
  u_MMFClass in 'Common\u_MMFClass.pas',
  u_wCodeSite in 'Common\u_wCodeSite.pas',
  u_wCodeTrace in 'Common\u_wCodeTrace.pas',
  w_iniSettings in 'Common\w_iniSettings.pas',
  wAppEnviron in 'Common\wAppEnviron.pas',
  wAppEnvironClass in 'Common\wAppEnvironClass.pas',
  wMessagesHook in 'Common\wMessagesHook.pas',
  u_appParamsFuncs in 'Common\u_appParamsFuncs.pas',
  u_AppLogClass in 'Common\u_AppLogClass.pas',
  dm_VIDir in 'dm_VIDir.pas' {VD_DM: TDataModule};

{$R *.res}

begin
 with appParams do
   begin
    guIDStr:='{B0161CA8-C888-4C1C-BC9A-F2795E71A2E8}';
    Id:=1;  // ��� ���������
    Caption:='Visual works informator';
    CaptionLeftPart:=' Visual work inform ';
    winSendRStr:='vInformate';
    iniCodeKey:='VWINFPORM';
    iniShift:=9;
    mpIdentStr:='VINFORM';
    // FMT ��� FMX wndClassNames:='FMTDCRForm';
    wndClassNames:='FMTVIDirectForm';
    ShortName:='vInformate';
    winAutoHookFlag:=true;
    publicPrefix:='WILLI';
    runAppName:='vInformate';
    PublisherStr:='Willi Spb';
    CompanyDirectoryPart:='Spb Comp';
    CompanyName:='SPB';
   // CopyRightStr:='CopyRight � 2017 by '+PublisherStr;
    CopyRightStr:='CopyRight by � 2017 '+PublisherStr;
    portabled:=true;
    defLicenseCode:=1; // ��� ��������
   end;
  /// ���������� ��������� � ���������
  appEnvironCreateWithParams;
  ///
  try
   /// �������� �� ������ ��������� � ���� - ���� ��� ���� ����������
   if (appEnv.VerifyRepetition('')=false) then
    begin // ��� ������ ��������� ���������
       // MessageDlg('��������� "'+appParams.Caption+'" ��� ��������'+#13#10+'�������� � ��� ��������� ����������.',mtWarning,[mbOk],0);
     Exit;
    end;

   {$IFDEF DEBUG}
     ReportMemoryLeaksOnShutdown:=true;
   {$ELSE}
     // w_CodeSiteState(false);
   {$ENDIF}
     begin
      Application.Initialize;
      Application.CreateForm(TVD_DM, VD_DM);
  Application.CreateForm(TVIDirectForm, VIDirectForm);
  Application.Run;
     end;
  finally
    wLog('prev','Free App');
    appEnvironFree;
  end;
end.
