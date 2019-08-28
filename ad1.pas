unit ad1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    btnLimpar: TButton;
    btnCC: TButton;
    btnCF: TButton;
    btnCK: TButton;
    txtConvert: TEdit;
    Label6: TLabel;
    txtKelvin: TEdit;
    txtFah: TEdit;
    txtCelcius: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    txtTexto: TEdit;
    Label1: TLabel;

    procedure btnCCClick(Sender: TObject);
    procedure btnCFClick(Sender: TObject);
    procedure btnCKClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }

  end;

var
  Form1: TForm1;
  frase,cfrase: string;
  temp,final,posicao,F,C,K,numero,tam: integer;
  strNum,palavra: string;
implementation

{$R *.lfm}

{ TForm1 }
function GetToken(var a: String; Sep: Char): String;
    var
       Token: String; TEnd: Byte;
    begin
      TEnd:= Length(a);
      Result:='';
      TEnd:= Pos(Sep,a);
      if TEnd <> 0 then
         begin
                 Token:=Copy(a,1,TEnd-1);
                 Delete(a,1,TEnd);
         end
      else
          begin
                Token:=a;
                a:='';
          end;
      Result:=Token;
    end;

procedure TForm1.btnLimparClick(Sender: TObject);
begin
  txtTexto.text:='';
  txtCelcius.text:='';
  txtFah.text:='';
  txtKelvin.text:='';
  txtConvert.text:='';
end;

procedure TForm1.btnCCClick(Sender: TObject);
begin
  frase:= txtTexto.text;
  cfrase:= frase;
  C:= 0;
  K:= 0;
  F:= 0;
  while cfrase <> '' do
  begin
	palavra:=GetToken(cfrase,' ');
	if palavra[length(palavra)] = 'F' then {converter para celcius}
	begin
		numero:=StrToInt(Copy(palavra,1,length(palavra)-1));
		temp:=(((numero-32)*5)div 9);
		strNum:=IntToStr(temp);
		posicao:=pos(palavra,frase);
		tam:=length(palavra);
		final:= posicao+tam-1;
		delete(frase,posicao,final);
		insert(strNum,frase,posicao);
		insert('C',frase,posicao+length(strNum));
		txtConvert.text:=frase;
		F:= F+1;
	end
	else
	begin
		if palavra[length(palavra)]='K' then
		begin
			numero:=StrToInt(Copy(palavra,1,length(palavra)-1));
			temp:=(numero-273);
			strNum:=IntToStr(temp);
			posicao:=pos(palavra,frase);
			tam:=length(palavra);
			final:= posicao+tam-1;
			delete(frase,posicao,final);
			insert(strNum,frase,posicao);
			insert('C',frase,posicao+length(strNum));
			txtConvert.text:=frase;
			K:= K+1;
		end
	end;
	if palavra[length(palavra)]='C' then
		C:=C+1;
  end;
  txtCelcius.text:= IntToStr(C);
  txtFah.text:= IntToStr(F);
  txtKelvin.text:= IntToStr(K);

end;

procedure TForm1.btnCFClick(Sender: TObject);
begin
  frase:= txtTexto.text;
  cfrase:= frase;
  C:= 0;
  K:= 0;
  F:= 0;
  while cfrase <> '' do
  begin
	palavra:=GetToken(cfrase,' ');
	if palavra[length(palavra)] = 'C' then
	begin
		numero:=StrToInt(Copy(palavra,1,length(palavra)-1));
		temp:=(((numero div 5)*9)+32);
		strNum:=IntToStr(temp);
		posicao:=pos(palavra,frase);
		tam:=length(palavra);
		final:= posicao+tam-1;
		delete(frase,posicao,final);
		insert(strNum,frase,posicao);
		insert('F',frase,posicao+length(strNum));
		txtConvert.text:=frase;
		C:= C+1;
	end
	else
	begin
		if palavra[length(palavra)]='K' then
		begin
			numero:=StrToInt(Copy(palavra,1,length(palavra)-1));
			temp:=((((numero-273) div 5)*9)+32);
			strNum:=IntToStr(temp);
			posicao:=pos(palavra,frase);
			tam:=length(palavra);
			final:= posicao+tam-1;
			delete(frase,posicao,final);
			insert(strNum,frase,posicao);
			insert('F',frase,posicao+length(strNum));
			txtConvert.text:=frase;
			K:= K+1;
		end
	end;
	if palavra[length(palavra)]='F' then
		F:=F+1;
  end;
  txtCelcius.text:= IntToStr(C);
  txtFah.text:= IntToStr(F);
  txtKelvin.text:= IntToStr(K);
end;

procedure TForm1.btnCKClick(Sender: TObject);
begin
  frase:= txtTexto.text;
  cfrase:= frase;
  C:= 0;
  K:= 0;
  F:= 0;
  while cfrase <> '' do
  begin
	palavra:=GetToken(cfrase,' ');
	if palavra[length(palavra)] = 'C' then
	begin
		numero:=StrToInt(Copy(palavra,1,length(palavra)-1));
		temp:=(numero+273);
		strNum:=IntToStr(temp);
		posicao:=pos(palavra,frase);
		tam:=length(palavra);
		final:= posicao+tam-1;
		delete(frase,posicao,final);
		insert(strNum,frase,posicao);
		insert('K',frase,posicao+length(strNum));
		txtConvert.text:=frase;
		C:= C+1;
	end
	else
	begin
		if palavra[length(palavra)]='F' then
		begin
			numero:=StrToInt(Copy(palavra,1,length(palavra)-1));
			temp:=((((numero-32)div 9)*5)+273);
			strNum:=IntToStr(temp);
			posicao:=pos(palavra,frase);
			tam:=length(palavra);
			final:= posicao+tam-1;
			delete(frase,posicao,final);
			insert(strNum,frase,posicao);
			insert('K',frase,posicao+length(strNum));
			txtConvert.text:=frase;
			F:= F+1;
		end
	end;
	if palavra[length(palavra)]='K' then
		K:=K+1;
  end;
  txtCelcius.text:= IntToStr(C);
  txtFah.text:= IntToStr(F);
  txtKelvin.text:= IntToStr(K);
end;



end.

