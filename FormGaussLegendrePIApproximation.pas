unit FormGaussLegendrePIApproximation;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Edit, FMX.EditBox, FMX.NumberBox;

type
  TTGaussLegendrePIApproximationForm = class(TForm)
    lblTimingMSValueD: TLabel;
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
    lblTimingMSValueE: TLabel;
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
  utils,
  gauss.legendre.pi;

procedure TTGaussLegendrePIApproximationForm.butCalculateClick(Sender: TObject);
var
  i, iterations, samples: integer;
  startime, endtime: tdatetime;
  approx: double;
begin
  butCalculate.Enabled := false;
  lblTimingMSValueE.Text := '(pending)';
  lblTimingMSValueD.Text := '(pending)';
  lblApproximationValue.Text := '(pending)';
  samples := trunc(edtSamples.Value);
  iterations := trunc(Log2(edtDigits.Value));

  // using Extended
  startime := now;
  for i := 1 to samples do
    approx := ApproximatePIE(iterations);
  endtime := now;
  lblApproximationValue.Text := FloatToStr(approx);

  lblTimingMSValueE.Text := FloatToStr(MillisecondDiff(startime, endtime));

  // using double
  startime := now;
  for i := 1 to samples do
    approx := ApproximatePID(iterations);
  endtime := now;

  lblTimingMSValueD.Text := FloatToStr(MillisecondDiff(startime, endtime));

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
