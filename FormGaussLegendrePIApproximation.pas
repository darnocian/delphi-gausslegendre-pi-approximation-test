unit FormGaussLegendrePIApproximation;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Edit, FMX.EditBox, FMX.NumberBox;

type
  TTGaussLegendrePIApproximationForm = class(TForm)
    lblTimingMSValue: TLabel;
    butCalculate: TButton;
    edtDigits: TNumberBox;
    edtSamples: TNumberBox;
    lblTimingMS: TLabel;
    lblSamples: TLabel;
    lblDigits: TLabel;
    lblApproximation: TLabel;
    lblApproximationValue: TLabel;
    lblPlatform: TLabel;
    lblPlatformValue: TLabel;
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
  System.Math,
  gauss.legendre.pi;

procedure TTGaussLegendrePIApproximationForm.butCalculateClick(Sender: TObject);
var
  i, deltaMS, iterations, samples: integer;
  startime, endtime: tdatetime;
  approx: double;
begin
  butCalculate.Enabled := false;
  lblTimingMSValue.Text := '(pending)';
  lblApproximationValue.Text := '(pending)';
  samples := trunc(edtSamples.Value);
  iterations := trunc(Log2(edtDigits.Value));
  startime := now;
  for i := 1 to samples do
    approx := approximatePI(iterations);
  endtime := now;
  lblApproximationValue.Text := FloatToStr(approx);
  deltaMS := trunc(TimeStampToMSecs(DateTimeToTimeStamp(endtime)) -
    TimeStampToMSecs(DateTimeToTimeStamp(startime)));

  lblTimingMSValue.Text := FloatToStr(deltaMS);
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
{$IFDEF LINUX}
  lblPlatformValue.Text := 'Linux';
{$ENDIF}
end;

end.
