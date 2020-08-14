program GaussLegendrePIApproximation;

uses
  System.StartUpCopy,
  FMX.Forms,
  FormGaussLegendrePIApproximation in 'FormGaussLegendrePIApproximation.pas' {TGaussLegendrePIApproximationForm},
  gauss.legendre.pi in 'gauss.legendre.pi.pas',
  utils in 'utils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TTGaussLegendrePIApproximationForm, TGaussLegendrePIApproximationForm);
  Application.Run;
end.
