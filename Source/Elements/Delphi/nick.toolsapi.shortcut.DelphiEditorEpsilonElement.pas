unit nick.toolsapi.shortcut.DelphiEditorEpsilonElement;

interface

uses
  nick.toolsapi.shortcut.DelphiEditorBaseElement;

type
  TDelphiEditorEpsilonElement = class(TDelphiEditorBaseElement)
  private
  protected
    procedure Populate(); override;
    function GetName() : string; override;
    function GetSpeedSetting : string; override;
    function GetDescription() : string; override;
  public
  end;

implementation

uses
  nick.toolsapi.shortcut.ShortCutItem,
  nick.toolsapi.shortcut.ShortCutRepository,
  Classes,
  Windows,
  Menus;

function TDelphiEditorEpsilonElement.GetDescription: string;
begin
  Result := 'From: http://docwiki.embarcadero.com/RADStudio/XE6/en/Epsilon_Keyboard_Shortcuts';
end;

function TDelphiEditorEpsilonElement.GetName: string;
begin
  Result := inherited GetName() + 'Epsilon';
end;

function TDelphiEditorEpsilonElement.GetSpeedSetting: string;
begin
  Result := 'Borland.Epsilon';
end;

procedure TDelphiEditorEpsilonElement.Populate();
begin
  AddShortCut(NewShortCut('Locates the next matching delimiter (cursor must be on ")", "}" or "]")', Menus.ShortCut(Ord(')'), [ssAlt]), scNone, ''));
  AddShortCut(NewShortCut('Displays context-sensitive Help', Menus.ShortCut(Ord('?'), [ssAlt]), scNone, ''));
  AddShortCut(NewShortCut('Deletes spaces and tabs around the cursor on the same line', Menus.ShortCut({\}VK_OEM_5, [ssAlt]), scNone, ''));
  AddShortCut(NewShortCut('Deletes the word to the left of the current cursor position', Menus.ShortCut(VK_BACK, [ssAlt]), scNone, ''));
  AddShortCut(NewShortCut('Capitalizes the first letter of the character after the cursor and lowercases all other letters to the end of the word', Menus.ShortCut(Ord('C'), [ssAlt]), scNone, ''));
  AddShortCut(NewShortCut('Deletes to word to the right of the cursor', Menus.ShortCut(Ord('D'), [ssAlt]), scNone, ''));
  AddShortCut(NewShortCut('Deletes all text in the block between the cursor and the previous matching delimiter (cursor must be on ")", "}" or "]")', Menus.ShortCut(VK_DELETE, [ssAlt]), scNone, ''));
  AddShortCut(NewShortCut('Converts the current word to lowercase', Menus.ShortCut(Ord('L'), [ssAlt]), scNone, ''));
  AddShortCut(NewShortCut('Displays context-sensitive Help', Menus.ShortCut({/}VK_OEM_2, [ssAlt, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Locates the next matching delimiter (cursor must be on ")", "}" or "]")', Menus.ShortCut(Ord('O'), [ssAlt, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Transposes the two words on either side of the cursor', Menus.ShortCut(Ord('T'), [ssAlt]), scNone, ''));
  AddShortCut(NewShortCut('Indents to the current line to the text on the previous line', Menus.ShortCut(VK_TAB, [ssAlt]), scNone, ''));
  AddShortCut(NewShortCut('Converts a selected word to uppercase or converts from the cursor position to the end of the word to uppercase', Menus.ShortCut(Ord('U'), [ssAlt]), scNone, ''));
  AddShortCut(NewShortCut('Invokes the specified command or macro', Menus.ShortCut(Ord('X'), [ssAlt]), scNone, ''));
  AddShortCut(NewShortCut('Deletes the character to the left of the current cursor position', Menus.ShortCut(VK_BACK, []), scNone, ''));
  AddShortCut(NewShortCut('Adds or removes // to each line in the selected code block to comment the code.', Menus.ShortCut({/}VK_OEM_2, [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Displays context-sensitive Help', Menus.ShortCut(Ord('_'), [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Locates the next matching delimiter (cursor must be on ")", "}" or "]")', Menus.ShortCut(Ord('B'), [ssAlt, ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Locates the previous matching delimiter (cursor must be on ")", "}" or "]")', Menus.ShortCut(Ord('F'), [ssAlt, ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Deletes the word to the left of the current cursor position', Menus.ShortCut(Ord('H'), [ssAlt, ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Deletes all text in the block between the cursor and the next matching delimiter (cursor must be on ")", "}" or "]")', Menus.ShortCut(Ord('K'), [ssAlt, ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Deletes the currently selected character or character to the right of the cursor', Menus.ShortCut(Ord('D'), [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Deletes the character to the left of the current cursor position', Menus.ShortCut(Ord('H'), [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Cuts the contents of line and places it in the clipboard', Menus.ShortCut(Ord('K'), [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Centers the active window', Menus.ShortCut(Ord('L'), [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Inserts a carriage return', Menus.ShortCut(Ord('M'), [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Inserts a new line after the cursor', Menus.ShortCut(Ord('O'), [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Interpret next character as an ASCII code', Menus.ShortCut(Ord('Q'), [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Incrementally searches backward through the current file', Menus.ShortCut(Ord('R'), [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Incrementally searches for a string entered from the keyboard', Menus.ShortCut(Ord('S'), [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Displays context-sensitive Help', Menus.ShortCut(Ord('-'), [ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Invokes class completion for the class declaration in which the cursor is positioned', Menus.ShortCut(Ord('C'), [ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Transposes the two characters on either side of the cursor', Menus.ShortCut(Ord('T'), [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Browses the symbol at the cursor', Menus.ShortCut(VK_OEM_COMMA, [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Deletes the contents of the current window', Menus.ShortCut(Ord('0'), [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Invoke a command processor', Menus.ShortCut(Ord('X'), [ssCtrl]), Menus.ShortCut(Ord('E'), [ssCtrl]), ''));
  AddShortCut(NewShortCut('Transposes the two lines on either side of the cursor', Menus.ShortCut(Ord('X'), [ssCtrl]), Menus.ShortCut(Ord('T'), [ssCtrl]), ''));
  AddShortCut(NewShortCut('Exchanges the locations of the cursor position and a bookmark', Menus.ShortCut(Ord('X'), [ssCtrl]), Menus.ShortCut(Ord('X'), [ssCtrl]), ''));
  AddShortCut(NewShortCut('Inserts the contents of a file at the cursor', Menus.ShortCut(Ord('X'), [ssCtrl]), Menus.ShortCut(Ord('I'), []), ''));
  AddShortCut(NewShortCut('Displays the next window in the buffer list', Menus.ShortCut(Ord('X'), [ssCtrl]), Menus.ShortCut(Ord('N'), []), ''));
  AddShortCut(NewShortCut('Displays the previous window in the buffer list', Menus.ShortCut(Ord('X'), [ssCtrl]), Menus.ShortCut(Ord('P'), []), ''));
  AddShortCut(NewShortCut('Locates the next matching delimiter (cursor must be on ")", "}" or "]")', Menus.ShortCut(VK_ESCAPE, []), Menus.ShortCut(Ord(')'), []), ''));
  AddShortCut(NewShortCut('Displays context-sensitive Help', Menus.ShortCut(VK_ESCAPE, []), Menus.ShortCut(Ord('?'), []), ''));
  AddShortCut(NewShortCut('Deletes spaces and tabs around the cursor on the same line', Menus.ShortCut(VK_ESCAPE, []), Menus.ShortCut({\}VK_OEM_5, []), ''));
  AddShortCut(NewShortCut('Deletes the word to the left of the current cursor position', Menus.ShortCut(VK_ESCAPE, []), Menus.ShortCut(VK_BACK, []), ''));
  AddShortCut(NewShortCut('Capitalizes the first letter of the character after the cursor and lowercases all other letters to the end of the word', Menus.ShortCut(VK_ESCAPE, []), Menus.ShortCut(Ord('C'), []), ''));
  AddShortCut(NewShortCut('Locates the next matching delimiter (cursor must be on ")", "}" or "]")', Menus.ShortCut(VK_ESCAPE, []), Menus.ShortCut(Ord('B'), [ssCtrl]), ''));
  AddShortCut(NewShortCut('Locates the previous matching delimiter (cursor must be on ")", "}" or "]")', Menus.ShortCut(VK_ESCAPE, []), Menus.ShortCut(Ord('F'), []), ''));
  AddShortCut(NewShortCut('Deletes the word to the left of the current cursor position', Menus.ShortCut(VK_ESCAPE, []), Menus.ShortCut(Ord('H'), []), ''));
  AddShortCut(NewShortCut('Deletes all text in the block between the cursor and the next matching delimiter (cursor must be on ")", "}" or "]")', Menus.ShortCut(VK_ESCAPE, []), Menus.ShortCut(Ord('K'), []), ''));
  AddShortCut(NewShortCut('Deletes to word to the right of the cursor', Menus.ShortCut(VK_ESCAPE, []), Menus.ShortCut(Ord('D'), []), ''));
  AddShortCut(NewShortCut('Deletes all text in the block between the cursor and the previous matching delimiter (cursor must be on ")", "}" or "]")', Menus.ShortCut(VK_ESCAPE, []), Menus.ShortCut(VK_DELETE, []), ''));
  AddShortCut(NewShortCut('Displays the next window in the buffer list', Menus.ShortCut(VK_ESCAPE, []), Menus.ShortCut(VK_END, []), ''));
  AddShortCut(NewShortCut('Displays the previous window in the buffer list', Menus.ShortCut(VK_ESCAPE, []), Menus.ShortCut(VK_HOME, []), ''));
  AddShortCut(NewShortCut('Converts the current word to lowercase', Menus.ShortCut(VK_ESCAPE, []), Menus.ShortCut(Ord('L'), []), ''));
  AddShortCut(NewShortCut('Transposes the two words on either side of the cursor', Menus.ShortCut(VK_ESCAPE, []), Menus.ShortCut(Ord('T'), []), ''));
  AddShortCut(NewShortCut('Indents to the current line to the text on the previous line', Menus.ShortCut(VK_ESCAPE, []), Menus.ShortCut(VK_TAB, []), ''));
  AddShortCut(NewShortCut('Converts a selected word to uppercase or converts from the cursor position to the end of the word to uppercase', Menus.ShortCut(VK_ESCAPE, []), Menus.ShortCut(Ord('U'), []), ''));
  AddShortCut(NewShortCut('Invokes the specified command or macro', Menus.ShortCut(VK_ESCAPE, []), Menus.ShortCut(Ord('X'), []), ''));
  AddShortCut(NewShortCut('Invokes the specified command or macro', Menus.ShortCut(VK_F2, []), scNone, ''));
end;

initialization
  nick.toolsapi.shortcut.ShortCutRepository.GetShortCutRepository().Add(TDelphiEditorEpsilonElement);

end.
