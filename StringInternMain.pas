unit StringInternMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, StringPool, Vcl.ExtCtrls,

  UITypes, FastMM4, System.Diagnostics, Vcl.Grids, Vcl.Samples.Spin,
  Vcl.WinXCtrls;

type
  TStringInternForm = class(TForm)
    pnl1: TPanel;
    ProgressBar1: TProgressBar;
    btnGrow: TButton;
    btnIntern: TButton;
    btnClear: TButton;
    Timer1: TTimer;
    ProgressBar2: TProgressBar;
    lbxLog: TListBox;
    grd1: TStringGrid;
    txt1: TStaticText;
    txt2: TStaticText;
    SpinEdit1: TSpinEdit;
    lbl1: TLabel;
    ProgressBar3: TProgressBar;
    txt3: TStaticText;
    txt4: TStaticText;
    ProgressBar4: TProgressBar;
    RelativePanel1: TRelativePanel;
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnGrowClick(Sender: TObject);
    procedure btnInternClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
    var pool: TStringPool;
    procedure Validate;
    procedure LogTime(sw: TStopWatch);
  public
    { Public declarations }
    var MaxMem, CurMem, Count: UInt64;
    var Strings: TArray<string>;
  end;

var
  StringInternForm: TStringInternForm;

implementation

{$R *.dfm}

uses IOUtils, System.Generics.Collections,
  PsAPI;

function GetFastMMUsage: UInt64;
var
  st: TMemoryManagerState;
  sb: TSmallBlockTypeState;
begin
  GetMemoryManagerState(st);
  result :=  st.TotalAllocatedMediumBlockSize
           + st.TotalAllocatedLargeBlockSize;
  for sb in st.SmallBlockTypeStates do begin
    result := result + sb.UseableBlockSize * sb.AllocatedBlockCount;
  end;
end;

procedure TStringInternForm.FormDestroy(Sender: TObject);
begin
  Pool.Free;
end;

procedure TStringInternForm.LogTime(sw: TStopWatch);
begin
  lbxLog.Items.Add(Format('%.0n ticks',[sw.ElapsedTicks+0.0]));
end;

procedure TStringInternForm.btnGrowClick(Sender: TObject);
begin
  var sw := TStopWatch.StartNew;
  var Text := TFile.ReadAllText('..\..\StringInternMain.pas');
  var oldLen := Length(Strings);
  var newLen := oldLen + 50_000;
  SetLength(Strings, newLen);
  Count := oldLen;
  for var i := OldLen to pred(NewLen) do
  begin
    // Use ToUpper to make it a new copy of the string
    if SpinEdit1.Value > 0 then
      Strings[i] := Text.ToUpper + Random(SpinEdit1.Value).ToString
    else
      Strings[i] := Text.ToUpper;
    Inc(Count);
  end;
  Logtime(Sw);
  Validate;
  Count := NewLen;
end;

procedure TStringInternForm.Validate;
begin
  var pointers := TList<Pointer>.Create;
  try
    Count := Length(Strings);
    if Count > 0  then
      for var i := 0 to pred(count) do
      begin
        if not pointers.Contains(pointer(Strings[i])) then
          pointers.Add(Pointer(Strings[i]));
        if Strings[i] = '' then
        begin
          var Msg := Format('Index %d is blank. Aborting!',[i]);
          lbxLog.Items.Add(Msg);
          MessageDlg(msg, TMsgDlgType.mtError, [mbOK], 0);
          Exit;
        end;
      end;

    lbxLog.Items.Add(Format('Contains %.0n strings with values',[Count+0.0]));
    lbxLog.Items.Add(Format('%.0n unique pointer(s)',[pointers.Count+0.0]));
    lbxLog.Items.Add('—————————');
  finally
    pointers.Free;
  end;
end;

procedure TStringInternForm.btnInternClick(Sender: TObject);
begin
  var sw := TStopWatch.StartNew;
  for var i := 0 to pred(Length(Strings)) do
    Pool.StringIntern(Strings[i]);
  LogTime(sw);
  Validate;
end;

procedure TStringInternForm.FormCreate(Sender: TObject);
begin
  pool := TStringPool.Create;
  grd1.ColAlignments[0] := taRightJustify;
  grd1.ColAlignments[2] := taRightJustify;
  grd1.Row := 4;
  grd1.Col := 1;
end;

procedure TStringInternForm.btnClearClick(Sender: TObject);
begin
  Count := 0;
  pool.Clear;
  SetLength(Strings,0);
  MaxMem := 0;
  lbxLog.Clear;
end;

procedure TStringInternForm.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  CurMem := GetFastMMUsage;
  if CurMem > MaxMem then
  begin
    MaxMem := CurMem;
    if MaxMem > ProgressBar1.Max then
    begin
      ProgressBar1.Max := MaxMem * 2;
      ProgressBar2.Max := MaxMem * 2;
    end;
    ProgressBar2.Position := MaxMem;

  end;
  var len: Uint64 := 0;
  if Count > 0 then len := Count * Uint64(length(Strings[0]));

  var MemCounters: TProcessMemoryCountersEx;
  MemCounters.cb := SizeOf(MemCounters);
  var CallSuccess := GetProcessMemoryInfo(
      GetCurrentProcess, @MemCounters, SizeOf(MemCounters));
  if not CallSuccess then
    RaiseLastOSError;
  grd1.ColWidths[0] := (grd1.Width div 4) - 2;
  grd1.ColWidths[1] := (grd1.Width div 4) - 2;
  grd1.ColWidths[2] := (grd1.Width div 4) - 2;
  grd1.ColWidths[3] := (grd1.Width div 4) - 2;

  ProgressBar1.Position := CurMem;
  ProgressBar2.Position := MaxMem;
  ProgressBar3.Position := MemCounters.WorkingSetSize;
  ProgressBar4.Position := MemCounters.PeakWorkingSetSize;

  grd1.cells[0,0] := 'Logical';
  grd1.Cells[1,0] := Format('%.0n strings',[Count+0.0]);
  grd1.cells[2,0] := 'Length';
  grd1.Cells[3,0] := Format('%n M chars',[Len/1024/1024]);
  grd1.cells[0,1] := 'FastMM.Now';
  grd1.Cells[1,1] := Format('%n MB',[CurMem/1024/1024]);
  grd1.cells[2,1] := 'FastMM.Peak';
  grd1.Cells[3,1] := Format('%n MB',[MaxMem/1024/1024]);
  grd1.cells[0,2] := 'Working.Now';
  grd1.Cells[1,2] := Format('%n MB',[MemCounters.WorkingSetSize/1024/1024]);
  grd1.cells[2,2] := 'Working.Peak';
  grd1.Cells[3,2] := Format('%n MB',[MemCounters.PeakWorkingSetSize/1024/1024]);
  grd1.cells[0,3] := 'Private';
  grd1.Cells[1,3] := Format('%n MB',[MemCounters.PrivateUsage/1024/1024]);
  grd1.cells[2,3] := 'Non-Page Pool';
  grd1.Cells[3,3] := Format('%n KB',[MemCounters.QuotaNonPagedPoolUsage/1024]);
  Timer1.Enabled := True;
end;

end.
