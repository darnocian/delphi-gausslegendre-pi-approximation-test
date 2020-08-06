unit FormGaussLegendrePIApproximation;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls, FMX.Controls.Presentation, FMX.Edit, FMX.EditBox, FMX.NumberBox;

type
  TTGaussLegendrePIApproximationForm = class(TForm)
    lblTimingMSValue: TLabel;
    butCalculate: TButton;
    edtIterations: TNumberBox;
    edtSamples: TNumberBox;
    lblTimingMS: TLabel;
    lblSamples: TLabel;
    Label1: TLabel;
    lblApproximation: TLabel;
    lblApproximationValue: TLabel;
    lblPlatform: TLabel;
    lblPlatformValue: TLabel;
    cbTryFaster: TCheckBox;
    procedure butCalculateClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TGaussLegendrePIApproximationForm: TTGaussLegendrePIApproximationForm;

implementation

{$R *.fmx}

uses
  gauss.legendre.pi;

type
  TApproxFunc = function(Iter: integer): TFloat;

procedure TTGaussLegendrePIApproximationForm.butCalculateClick(Sender: TObject);
var
  i, deltaMS, iterations, samples: integer;
  startime, endtime: tdatetime;
  f: TApproxFunc;
begin
  butCalculate.Enabled := false;
  if cbTryFaster.IsChecked then
    f := approximatePIFaster
  else
    f := approximatePI;
  lblTimingMSValue.Text := '(pending';
  lblApproximationValue.Text := '(pending';
  samples := trunc(edtSamples.Value);
  iterations := trunc(edtIterations.Value);
  startime := now;
  for i := 1 to samples do
  begin
    lblApproximationValue.Text := FloatToStr(f(iterations));
  end;
  endtime := now;
  deltaMS := trunc(TimeStampToMSecs(DateTimeToTimeStamp(endtime)) - TimeStampToMSecs(DateTimeToTimeStamp(startime)));

  lblTimingMSValue.Text := inttostr(deltaMS div samples);
  butCalculate.Enabled := true;
end;

procedure TTGaussLegendrePIApproximationForm.FormCreate(Sender: TObject);
begin
  lblPlatformValue.Text := 'not configured';
{$IFDEF WIN32}
  lblPlatformValue.Text := 'Win32';
{$ENDIF}
{$IFDEF WIN64}
  lblPlatformValue.Text := 'Win64';
{$ENDIF}
{$IFDEF IOS}
  lblPlatformValue.Text := 'iOS';
{$ENDIF}
{$IFDEF OSX}
  lblPlatformValue.Text := 'OSX';
{$ENDIF}
{$IFDEF ANDROID}
  lblPlatformValue.Text := 'Android';
{$ENDIF}
end;

end.
