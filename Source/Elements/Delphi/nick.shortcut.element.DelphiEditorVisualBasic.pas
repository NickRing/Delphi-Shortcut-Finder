unit nick.shortcut.element.DelphiEditorVisualBasic;

interface

implementation

uses
  nick.shortcut.core.ShortCutItem,
  nick.shortcut.repository.ShortCut,
  nick.shortcut.element.DelphiEditorBase,
  System.Classes,
  Winapi.Windows,
  Vcl.Menus;

type
  TDelphiEditorVisualBasicElement = class(TDelphiEditorBaseElement)
  private
  protected
    procedure Populate(); override;
    function GetName() : string; override;
    function GetSpeedSetting : string; override;
    function GetDescription() : string; override;
  public
  end;

function TDelphiEditorVisualBasicElement.GetDescription: string;
begin
  Result := 'From: http://docwiki.embarcadero.com/RADStudio/XE6/en/Visual_Basic_Keyboard_Shortcuts';
end;

function TDelphiEditorVisualBasicElement.GetName: string;
begin
  Result := inherited GetName() + 'Visual Basic';
end;

function TDelphiEditorVisualBasicElement.GetSpeedSetting: string;
begin
  Result := 'Borland.VisualBasic';
end;

procedure TDelphiEditorVisualBasicElement.Populate();
begin
  AddShortCut(NewShortCut('Finds the matching delimiter (forward)', Vcl.Menus.ShortCut({[}VK_OEM_4, [ssAlt]), scNone, ''));
  AddShortCut(NewShortCut('Finds the matching delimiter (backward)', Vcl.Menus.ShortCut({]}VK_OEM_6, [ssAlt]), scNone, ''));
  AddShortCut(NewShortCut('Browse symbol at cursor (Delphi)', Vcl.Menus.ShortCut(VK_F12, [ssAlt]), scNone, ''));
  AddShortCut(NewShortCut('Goes to the next tab', Vcl.Menus.ShortCut(VK_PRIOR, [ssAlt]), scNone, ''));
  AddShortCut(NewShortCut('Goes to the previous tab', Vcl.Menus.ShortCut(VK_NEXT, [ssAlt]), scNone, ''));
  AddShortCut(NewShortCut('Edit|Redo', Vcl.Menus.ShortCut(VK_BACK, [ssAlt, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Moves the cursor down one line and selects the column from the left of the starting cursor position', Vcl.Menus.ShortCut(VK_DOWN, [ssAlt, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Selects the column from the cursor position to the end of the current line', Vcl.Menus.ShortCut(VK_END, [ssAlt, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Selects the column from the cursor position to the start of the current line', Vcl.Menus.ShortCut(VK_HOME, [ssAlt, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Selects the column to the left of the cursor', Vcl.Menus.ShortCut(VK_LEFT, [ssAlt, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Moves the cursor down one line and selects the column from the right of the starting cursor position', Vcl.Menus.ShortCut(VK_PRIOR, [ssAlt, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Moves the cursor up one screen and selects the column from the left of the starting cursor position', Vcl.Menus.ShortCut(VK_NEXT, [ssAlt, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Selects the column to the right of the cursor', Vcl.Menus.ShortCut(VK_RIGHT, [ssAlt, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Moves the cursor up one line and selects the column from the left of the starting cursor position', Vcl.Menus.ShortCut(VK_UP, [ssAlt, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Deletes the character to the left of the cursor', Vcl.Menus.ShortCut(VK_BACK, []), scNone, ''));
  AddShortCut(NewShortCut('Selects the column from the cursor position to the end of the current file', Vcl.Menus.ShortCut(VK_END, [ssAlt, ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Selects the column from the cursor position to the start of the current file', Vcl.Menus.ShortCut(VK_HOME, [ssAlt, ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Selects the column to the left of the cursor', Vcl.Menus.ShortCut(VK_LEFT, [ssAlt, ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Selects the column from the cursor position to the top of the screen', Vcl.Menus.ShortCut(VK_PRIOR, [ssAlt, ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Selects the column from the cursor position to the bottom of the screen', Vcl.Menus.ShortCut(VK_NEXT, [ssAlt, ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Selects the column to the right of the cursor', Vcl.Menus.ShortCut(VK_RIGHT, [ssAlt, ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Deletes the word to the left of the cursor', Vcl.Menus.ShortCut(VK_BACK, [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Closes the current page', Vcl.Menus.ShortCut(VK_F4, [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Open file at cursor', Vcl.Menus.ShortCut(Ord('G'), [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Templates pop-up menu', Vcl.Menus.ShortCut(Ord('J'), [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Adds or removes // to each line in the selected code block to comment the code.', Vcl.Menus.ShortCut(Ord('K'), [ssCtrl]), Vcl.Menus.ShortCut(Ord('C'),  []), ''));
  AddShortCut(NewShortCut('Converts the word under the cursor to lower case', Vcl.Menus.ShortCut(Ord('K'), [ssCtrl]), Vcl.Menus.ShortCut(Ord(' '), []), ''));
  AddShortCut(NewShortCut('Converts the word under the cursor to upper case', Vcl.Menus.ShortCut(Ord('K'), [ssCtrl]), Vcl.Menus.ShortCut(Ord('F'),  []), ''));
  AddShortCut(NewShortCut('Deletes a line', Vcl.Menus.ShortCut(Ord('L'), [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Causes next character to be interpreted as an ASCII sequence', Vcl.Menus.ShortCut(Ord('P'), [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Finds the matching delimiter (forward)', Vcl.Menus.ShortCut(Ord('Q'), [ssCtrl]), Vcl.Menus.ShortCut({[}VK_OEM_4, []), ''));
  AddShortCut(NewShortCut('Finds the matching delimiter (backward)', Vcl.Menus.ShortCut(Ord('Q'), [ssCtrl]), Vcl.Menus.ShortCut({]}VK_OEM_6, []), ''));
  AddShortCut(NewShortCut('Finds the matching delimiter (forward)', Vcl.Menus.ShortCut(Ord('Q'), [ssCtrl]), Vcl.Menus.ShortCut({[}VK_OEM_4, [ssCtrl]), ''));
  AddShortCut(NewShortCut('Finds the matching delimiter (backward)', Vcl.Menus.ShortCut(Ord('Q'), [ssCtrl]), Vcl.Menus.ShortCut({]}VK_OEM_6, [ssCtrl]), ''));
  AddShortCut(NewShortCut('Deletes to the end of a line', Vcl.Menus.ShortCut(Ord('Q'), [ssCtrl]), Vcl.Menus.ShortCut(Ord('Y'), []), ''));
  AddShortCut(NewShortCut('Invokes class completion for the class declaration in which the cursor is positioned', Vcl.Menus.ShortCut(Ord('C'), [ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Selects from the cursor position to the end of the current file', Vcl.Menus.ShortCut(VK_END, [ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Selects from the cursor position to the start of the current file', Vcl.Menus.ShortCut(VK_HOME, [ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Selects the word to the left of the cursor', Vcl.Menus.ShortCut(VK_LEFT, [ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Selects from the cursor position to the bottom of the screen', Vcl.Menus.ShortCut(VK_PRIOR, [ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Selects from the cursor position to the top of the screen', Vcl.Menus.ShortCut(VK_NEXT, [ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Selects the word to the right of the cursor', Vcl.Menus.ShortCut(VK_RIGHT, [ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Displays the previous window in the buffer list', Vcl.Menus.ShortCut(VK_TAB, [ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Deletes the word to the left of the cursor', Vcl.Menus.ShortCut(Ord('T'), [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Displays the next window in the buffer list', Vcl.Menus.ShortCut(VK_TAB, [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Deletes a line', Vcl.Menus.ShortCut(Ord('Y'), [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Deletes to the end of a line', Vcl.Menus.ShortCut(Ord('Y'), [ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Deletes a character or block at the cursor', Vcl.Menus.ShortCut(VK_DELETE, []), scNone, ''));
  AddShortCut(NewShortCut('Inserts a new line character', Vcl.Menus.ShortCut(VK_RETURN, []), scNone, ''));
  AddShortCut(NewShortCut('Toggles insert mode', Vcl.Menus.ShortCut(VK_INSERT, []), scNone, ''));
  AddShortCut(NewShortCut('Deletes the character to the left of the cursor', Vcl.Menus.ShortCut(VK_BACK, [ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Moves the cursor down one line and selects from the right of the starting cursor position', Vcl.Menus.ShortCut(VK_DOWN, [ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Selects from the cursor position to the end of the current line', Vcl.Menus.ShortCut(VK_END, [ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Inserts a new line character', Vcl.Menus.ShortCut(VK_RETURN, [ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Selects from the cursor position to the start of the current line', Vcl.Menus.ShortCut(VK_HOME, [ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Selects the character to the left of the cursor', Vcl.Menus.ShortCut(VK_LEFT, [ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Moves the cursor down one line and selects from the right of the starting cursor position', Vcl.Menus.ShortCut(VK_PRIOR, [ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Moves the cursor up one screen and selects from the left of the starting cursor position', Vcl.Menus.ShortCut(VK_NEXT, [ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Selects the character to the right of the cursor', Vcl.Menus.ShortCut(VK_RIGHT, [ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Inserts a blank space', Vcl.Menus.ShortCut(VK_SPACE, [ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Moves the cursor up one line and selects from the left of the starting cursor position', Vcl.Menus.ShortCut(VK_UP, [ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Inserts a tab character', Vcl.Menus.ShortCut(VK_TAB, []), scNone, ''));
end;

initialization
  nick.shortcut.repository.ShortCut.GetShortCutRepository().Add(TDelphiEditorVisualBasicElement);

end.
