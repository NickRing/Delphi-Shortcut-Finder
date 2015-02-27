unit nick.shortcut.element.DelphiEditorVisualBasic;

interface

implementation

uses
  nick.shortcut.core.ShortCutItem,
  nick.shortcut.repository.ShortCut,
  nick.shortcut.element.DelphiEditorBase,
  {$IFDEF VER220}
  Classes,
  Windows;
  {$ELSE}
  System.Classes,
  Winapi.Windows;
  {$ENDIF}

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
  AddShortCut(NewShortCut('Finds the matching delimiter (forward)', SystemRepository().ShortCut({[}VK_OEM_4, [ssAlt]), scNone, ''));
  AddShortCut(NewShortCut('Finds the matching delimiter (backward)', SystemRepository().ShortCut({]}VK_OEM_6, [ssAlt]), scNone, ''));
  AddShortCut(NewShortCut('Browse symbol at cursor (Delphi)', SystemRepository().ShortCut(VK_F12, [ssAlt]), scNone, ''));
  AddShortCut(NewShortCut('Goes to the next tab', SystemRepository().ShortCut(VK_PRIOR, [ssAlt]), scNone, ''));
  AddShortCut(NewShortCut('Goes to the previous tab', SystemRepository().ShortCut(VK_NEXT, [ssAlt]), scNone, ''));
  AddShortCut(NewShortCut('Edit|Redo', SystemRepository().ShortCut(VK_BACK, [ssAlt, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Moves the cursor down one line and selects the column from the left of the starting cursor position', SystemRepository().ShortCut(VK_DOWN, [ssAlt, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Selects the column from the cursor position to the end of the current line', SystemRepository().ShortCut(VK_END, [ssAlt, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Selects the column from the cursor position to the start of the current line', SystemRepository().ShortCut(VK_HOME, [ssAlt, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Selects the column to the left of the cursor', SystemRepository().ShortCut(VK_LEFT, [ssAlt, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Moves the cursor down one line and selects the column from the right of the starting cursor position', SystemRepository().ShortCut(VK_PRIOR, [ssAlt, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Moves the cursor up one screen and selects the column from the left of the starting cursor position', SystemRepository().ShortCut(VK_NEXT, [ssAlt, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Selects the column to the right of the cursor', SystemRepository().ShortCut(VK_RIGHT, [ssAlt, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Moves the cursor up one line and selects the column from the left of the starting cursor position', SystemRepository().ShortCut(VK_UP, [ssAlt, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Deletes the character to the left of the cursor', SystemRepository().ShortCut(VK_BACK, []), scNone, ''));
  AddShortCut(NewShortCut('Selects the column from the cursor position to the end of the current file', SystemRepository().ShortCut(VK_END, [ssAlt, ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Selects the column from the cursor position to the start of the current file', SystemRepository().ShortCut(VK_HOME, [ssAlt, ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Selects the column to the left of the cursor', SystemRepository().ShortCut(VK_LEFT, [ssAlt, ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Selects the column from the cursor position to the top of the screen', SystemRepository().ShortCut(VK_PRIOR, [ssAlt, ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Selects the column from the cursor position to the bottom of the screen', SystemRepository().ShortCut(VK_NEXT, [ssAlt, ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Selects the column to the right of the cursor', SystemRepository().ShortCut(VK_RIGHT, [ssAlt, ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Deletes the word to the left of the cursor', SystemRepository().ShortCut(VK_BACK, [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Closes the current page', SystemRepository().ShortCut(VK_F4, [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Open file at cursor', SystemRepository().ShortCut(Ord('G'), [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Templates pop-up menu', SystemRepository().ShortCut(Ord('J'), [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Adds or removes // to each line in the selected code block to comment the code.', SystemRepository().ShortCut(Ord('K'), [ssCtrl]), SystemRepository().ShortCut(Ord('C'),  []), ''));
  AddShortCut(NewShortCut('Converts the word under the cursor to lower case', SystemRepository().ShortCut(Ord('K'), [ssCtrl]), SystemRepository().ShortCut(Ord(' '), []), ''));
  AddShortCut(NewShortCut('Converts the word under the cursor to upper case', SystemRepository().ShortCut(Ord('K'), [ssCtrl]), SystemRepository().ShortCut(Ord('F'),  []), ''));
  AddShortCut(NewShortCut('Deletes a line', SystemRepository().ShortCut(Ord('L'), [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Causes next character to be interpreted as an ASCII sequence', SystemRepository().ShortCut(Ord('P'), [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Finds the matching delimiter (forward)', SystemRepository().ShortCut(Ord('Q'), [ssCtrl]), SystemRepository().ShortCut({[}VK_OEM_4, []), ''));
  AddShortCut(NewShortCut('Finds the matching delimiter (backward)', SystemRepository().ShortCut(Ord('Q'), [ssCtrl]), SystemRepository().ShortCut({]}VK_OEM_6, []), ''));
  AddShortCut(NewShortCut('Finds the matching delimiter (forward)', SystemRepository().ShortCut(Ord('Q'), [ssCtrl]), SystemRepository().ShortCut({[}VK_OEM_4, [ssCtrl]), ''));
  AddShortCut(NewShortCut('Finds the matching delimiter (backward)', SystemRepository().ShortCut(Ord('Q'), [ssCtrl]), SystemRepository().ShortCut({]}VK_OEM_6, [ssCtrl]), ''));
  AddShortCut(NewShortCut('Deletes to the end of a line', SystemRepository().ShortCut(Ord('Q'), [ssCtrl]), SystemRepository().ShortCut(Ord('Y'), []), ''));
  AddShortCut(NewShortCut('Invokes class completion for the class declaration in which the cursor is positioned', SystemRepository().ShortCut(Ord('C'), [ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Selects from the cursor position to the end of the current file', SystemRepository().ShortCut(VK_END, [ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Selects from the cursor position to the start of the current file', SystemRepository().ShortCut(VK_HOME, [ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Selects the word to the left of the cursor', SystemRepository().ShortCut(VK_LEFT, [ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Selects from the cursor position to the bottom of the screen', SystemRepository().ShortCut(VK_PRIOR, [ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Selects from the cursor position to the top of the screen', SystemRepository().ShortCut(VK_NEXT, [ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Selects the word to the right of the cursor', SystemRepository().ShortCut(VK_RIGHT, [ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Displays the previous window in the buffer list', SystemRepository().ShortCut(VK_TAB, [ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Deletes the word to the left of the cursor', SystemRepository().ShortCut(Ord('T'), [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Displays the next window in the buffer list', SystemRepository().ShortCut(VK_TAB, [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Deletes a line', SystemRepository().ShortCut(Ord('Y'), [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Deletes to the end of a line', SystemRepository().ShortCut(Ord('Y'), [ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Deletes a character or block at the cursor', SystemRepository().ShortCut(VK_DELETE, []), scNone, ''));
  AddShortCut(NewShortCut('Inserts a new line character', SystemRepository().ShortCut(VK_RETURN, []), scNone, ''));
  AddShortCut(NewShortCut('Toggles insert mode', SystemRepository().ShortCut(VK_INSERT, []), scNone, ''));
  AddShortCut(NewShortCut('Deletes the character to the left of the cursor', SystemRepository().ShortCut(VK_BACK, [ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Moves the cursor down one line and selects from the right of the starting cursor position', SystemRepository().ShortCut(VK_DOWN, [ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Selects from the cursor position to the end of the current line', SystemRepository().ShortCut(VK_END, [ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Inserts a new line character', SystemRepository().ShortCut(VK_RETURN, [ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Selects from the cursor position to the start of the current line', SystemRepository().ShortCut(VK_HOME, [ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Selects the character to the left of the cursor', SystemRepository().ShortCut(VK_LEFT, [ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Moves the cursor down one line and selects from the right of the starting cursor position', SystemRepository().ShortCut(VK_PRIOR, [ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Moves the cursor up one screen and selects from the left of the starting cursor position', SystemRepository().ShortCut(VK_NEXT, [ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Selects the character to the right of the cursor', SystemRepository().ShortCut(VK_RIGHT, [ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Inserts a blank space', SystemRepository().ShortCut(VK_SPACE, [ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Moves the cursor up one line and selects from the left of the starting cursor position', SystemRepository().ShortCut(VK_UP, [ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Inserts a tab character', SystemRepository().ShortCut(VK_TAB, []), scNone, ''));
end;

initialization
  nick.shortcut.repository.ShortCut.GetShortCutRepository().Add(TDelphiEditorVisualBasicElement);

end.
