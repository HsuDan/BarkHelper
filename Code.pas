unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ShellAPI, IniFiles, ExtCtrls;

type
  TForm1 = class(TForm)
    lb1: TLabel;
    edt1: TEdit;
    btn1: TButton;
    edt2: TEdit;
    btn2: TButton;
    rb1: TRadioButton;
    rb2: TRadioButton;
    rb3: TRadioButton;
    rb4: TRadioButton;
    edt3: TEdit;
    btn3: TButton;
    btn4: TButton;
    lb2: TLabel;
    mmo1: TMemo;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure rb1Click(Sender: TObject);
    procedure rb2Click(Sender: TObject);
    procedure rb3Click(Sender: TObject);
    procedure rb4Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btn1Click(Sender: TObject);
var
  f,key,txt,head,title:string;
  ini:TIniFile;
begin
  if rb1.Checked then
    begin
      lb1.Caption:='https://api.day.app/';
      head:=lb1.Caption;
      key:=edt1.Text;
      txt:=edt2.Text;
      lb1.Caption:=head+key+'/'+txt;
    end
      else if rb2.Checked then
      begin
      lb1.Caption:='https://api.day.app/';
      head:=lb1.Caption;
      key:=edt1.Text;
      txt:=edt2.Text;
      title:=edt3.Text;
      lb1.Caption:=head+key+'/'+title+'/'+txt;
      end
        else if rb3.Checked then
        begin
        lb1.Caption:='https://api.day.app/';
        head:=lb1.Caption;
        key:=edt1.Text;
        txt:=edt2.Text;
        lb1.Caption:=head+key+'/URL test?url='+txt;
        end
          else if rb4.Checked then
          begin
          lb1.Caption:='https://api.day.app/';
          head:=lb1.Caption;
          key:=edt1.Text;
          txt:=edt2.Text;
          lb1.Caption:=head+key+'/'+txt+'?automaticallyCopy=1&copy=optional';
          end;
  f:=lb1.Caption;
  key:=edt1.Text;
  ini:=TIniFile.Create(ExtractFilePath(ParamStr(0))+'config.ini');
  ini.WriteString('config','key',key);
  ini.Free;
  ShellExecute(Handle,'open','360chrome.exe',PChar(f),nil,SW_SHOWNORMAL);
end;

procedure TForm1.btn2Click(Sender: TObject);
var
  f,key,txt,head,title:string;
  ini:TIniFile;
begin
  if rb1.Checked then
    begin
      lb1.Caption:='https://api.day.app/';
      head:=lb1.Caption;
      key:=edt1.Text;
      txt:=edt2.Text;
      lb1.Caption:=head+key+'/'+txt;
    end
      else if rb2.Checked then
      begin
      lb1.Caption:='https://api.day.app/';
      head:=lb1.Caption;
      key:=edt1.Text;
      txt:=edt2.Text;
      title:=edt3.Text;
      lb1.Caption:=head+key+'/'+title+'/'+txt;
      end
        else if rb3.Checked then
        begin
        lb1.Caption:='https://api.day.app/';
        head:=lb1.Caption;
        key:=edt1.Text;
        txt:=edt2.Text;
        lb1.Caption:=head+key+'/URL test?url='+txt;
        end
          else if rb4.Checked then
          begin
          lb1.Caption:='https://api.day.app/';
          head:=lb1.Caption;
          key:=edt1.Text;
          txt:=edt2.Text;
          lb1.Caption:=head+key+'/'+txt+'?automaticallyCopy=1&copy=optional';
          end;
  f:=lb1.Caption;
  key:=edt1.Text;
  ini:=TIniFile.Create(ExtractFilePath(ParamStr(0))+'config.ini');
  ini.WriteString('config','key',key);
  ini.Free;
  ShellExecute(Handle,'open','iexplore.exe',PChar(f),nil,SW_SHOWNORMAL);
end;

procedure TForm1.rb1Click(Sender: TObject);
begin
  btn1.Enabled:=True;
  btn2.Enabled:=True;
  edt3.Enabled:=False;
  edt3.Color:=clScrollBar;
end;

procedure TForm1.rb2Click(Sender: TObject);
begin
  btn1.Enabled:=True;
  btn2.Enabled:=True;
  edt3.Enabled:=True;
  edt3.Color:=clWindow;
end;

procedure TForm1.rb3Click(Sender: TObject);
begin
  btn1.Enabled:=True;
  btn2.Enabled:=True;
  edt3.Enabled:=False;
  edt3.Color:=clScrollBar;
end;

procedure TForm1.rb4Click(Sender: TObject);
begin
  btn1.Enabled:=True;
  btn2.Enabled:=True;
  edt3.Enabled:=False;
  edt3.Color:=clScrollBar;
end;

procedure TForm1.btn3Click(Sender: TObject);
var
  ini:TIniFile;
  key:string;
begin
  key:=edt1.Text;
  ini:=TIniFile.Create(ExtractFilePath(ParamStr(0))+'config.ini');
  ini.WriteString('config','key',key);
  ini.Free;
  edt1.Enabled:=False;
  edt1.Color:=clScrollBar;
end;

procedure TForm1.btn4Click(Sender: TObject);
begin
  edt1.Enabled:=True;
  edt1.Color:=clWindow;
  edt1.Focused;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  ini:TIniFile;
begin
  if not FileExists((ExtractFilePath(ParamStr(0))+'config.ini')) then
  begin
    edt1.Text:='INPUT YOUR KEY';
    edt1.Enabled:=True;
    edt1.Color:=clWindow;
    edt1.Focused;
  end
    else
    begin
      ini:=TIniFile.Create(ExtractFilePath(ParamStr(0))+'config.ini');
      edt1.Text:=ini.ReadString('config','key','INPUT YOUR KEY');
      edt1.Enabled:=False;
      edt1.Color:=clScrollBar;
      ini.Free;
    end; 
end;

end.
