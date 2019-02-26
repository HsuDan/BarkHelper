unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ShellAPI, IniFiles, ExtCtrls;

type
  TForm1 = class(TForm)
    lb1: TLabel;
    edt1: TEdit;
    edt2: TEdit;
    rb1: TRadioButton;
    rb2: TRadioButton;
    rb3: TRadioButton;
    rb4: TRadioButton;
    edt3: TEdit;
    btn3: TButton;
    btn4: TButton;
    lb2: TLabel;
    mmo1: TMemo;
    cb1: TComboBox;
    btn5: TButton;
    lb3: TLabel;
    procedure rb1Click(Sender: TObject);
    procedure rb2Click(Sender: TObject);
    procedure rb3Click(Sender: TObject);
    procedure rb4Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.rb1Click(Sender: TObject);
begin
  btn5.Enabled:=True;
  edt3.Enabled:=False;
  edt3.Color:=clScrollBar;
  edt2.SetFocus;
  edt2.Text:='推送内容（仅支持单行文本）';
  edt3.Text:='推送标题（仅支持单行文本）';
end;

procedure TForm1.rb2Click(Sender: TObject);
begin
  btn5.Enabled:=True;
  edt3.Enabled:=True;
  edt3.Color:=clWindow;
  edt3.SetFocus;
  edt2.Text:='推送内容（仅支持单行文本）';
  edt3.Text:='推送标题（仅支持单行文本）';
end;

procedure TForm1.rb3Click(Sender: TObject);
begin
  btn5.Enabled:=True;
  edt3.Enabled:=False;
  edt3.Color:=clScrollBar;
  edt2.Text:='请粘贴含 Http:// 或 Https:// 的完整链接至此处';
  edt3.Text:='推送标题（仅支持单行文本）';
  edt2.SetFocus;
end;

procedure TForm1.rb4Click(Sender: TObject);
begin
  btn5.Enabled:=True;
  edt3.Enabled:=False;
  edt3.Color:=clScrollBar;
  edt2.SetFocus;
  edt2.Text:='推送内容（仅支持单行文本）';
  edt3.Text:='推送标题（仅支持单行文本）';
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
  btn3.Enabled:=False
end;

procedure TForm1.btn4Click(Sender: TObject);
begin
  edt1.Enabled:=True;
  edt1.Color:=clWindow;
  edt1.SetFocus;
  btn3.Enabled:=True;
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

procedure TForm1.btn5Click(Sender: TObject);
var
  f,key,txt,head,title,brs:string;
  ini:TIniFile;
begin
  if cb1.ItemIndex=0 then
    begin
      lb3.Caption:='iexplore.exe';
    end
    else if cb1.ItemIndex=1 then
      begin
        lb3.Caption:='360chrome.exe';
      end
      else if cb1.ItemIndex=2 then
        begin
          lb3.Caption:='chrome.exe';
        end
        else if cb1.ItemIndex=3 then
          begin
            lb3.Caption:='firefox.exe';
          end
          else if cb1.Text='调用 Internet Explorer 推送（默认）' then
          begin
            lb3.Caption:='iexplore.exe';
          end;
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
        lb1.Caption:=head+key+'/点击访问链接'+'?url='+txt;
        end
          else if rb4.Checked then
          begin
          lb1.Caption:='https://api.day.app/';
          head:=lb1.Caption;
          key:=edt1.Text;
          txt:=edt2.Text;
          lb1.Caption:=head+key+'/'+txt+'?automaticallyCopy=1';
          end;
  f:=lb1.Caption;
  key:=edt1.Text;
  ini:=TIniFile.Create(ExtractFilePath(ParamStr(0))+'config.ini');
  ini.WriteString('config','key',key);
  ini.Free;
  brs:=lb3.caption;
  ShellExecute(Handle,'open',Pchar(brs),PChar(f),nil,SW_SHOWNORMAL);
end;

end.

