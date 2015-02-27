unit nick.shortcut.element.DelphiEditorClassic;

interface

implementation

uses
  nick.shortcut.core.ShortCutItem,
  nick.shortcut.repository.ShortCut,
  nick.shortcut.element.DelphiEditorBase,
  {$IFDEF VER220}
  Classes,
  Windows,
  Menus;
  {$ELSE}
  System.Classes,
  Winapi.Windows,
  Vcl.Menus;
  {$ENDIF}

type
  TDelphiEditorClassicElement = class(TDelphiEditorBaseElement)
  private
  protected
    procedure Populate(); override;
    function GetName() : string; override;
    function GetDescription() : string; override;
    function GetSpeedSetting : string; override;
  public
  end;

function TDelphiEditorClassicElement.GetDescription: string;
begin
  Result := 'From: http://docwiki.embarcadero.com/RADStudio/XE6/en/IDE_Classic_Keyboard_Shortcuts';
end;

function TDelphiEditorClassicElement.GetName: string;
begin
  Result := inherited GetName() + 'Classic';
end;

function TDelphiEditorClassicElement.GetSpeedSetting: string;
begin
  Result := 'Borland.Classic';
end;

procedure TDelphiEditorClassicElement.Populate();
begin
  AddShortCut(NewShortCut('Finds the matching delimiter (forward)', SystemRepository().ShortCut({[}VK_OEM_4, [ssAlt]), scNone, ''));
  AddShortCut(NewShortCut('Finds the matching delimiter (backward)', SystemRepository().ShortCut({]}VK_OEM_6, [ssAlt]), scNone, ''));
  AddShortCut(NewShortCut('Goes to the next tab', SystemRepository().ShortCut(VK_PRIOR, [ssAlt]), scNone, ''));
  AddShortCut(NewShortCut('Goes to the previous tab', SystemRepository().ShortCut(VK_NEXT, [ssAlt]), scNone, ''));
  AddShortCut(NewShortCut('Moves the cursor down one line and selects the column from the left of the starting cursor position', SystemRepository().ShortCut(VK_DOWN, [ssAlt, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Selects the column from the cursor position to the end of the current line', SystemRepository().ShortCut(VK_END, [ssAlt, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Selects the column from the cursor position to the start of the current line', SystemRepository().ShortCut(VK_HOME, [ssAlt, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Selects the column to the left of the cursor', SystemRepository().ShortCut(VK_LEFT, [ssAlt, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Moves the cursor down one line and selects the column from the right of the starting cursor position', SystemRepository().ShortCut(VK_PRIOR, [ssAlt, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Moves the cursor up one screen and selects the column from the left of the starting cursor position', SystemRepository().ShortCut(VK_NEXT, [ssAlt, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Selects the column to the right of the cursor', SystemRepository().ShortCut(VK_RIGHT, [ssAlt, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Moves the cursor up one line and selects the column from the left of the starting cursor position', SystemRepository().ShortCut(VK_UP, [ssAlt, ssShift]), scNone, ''));
  (*AddShortCut(NewShortCut('Selects column-oriented blocks', SystemRepository().ShortCut(Ord('mousemove'), [ssAlt]), scNone, ''));*)
  AddShortCut(NewShortCut('Adds or removes // to each line in the selected code block to comment the code.', SystemRepository().ShortCut({/}VK_OEM_2, [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Selects the column from the cursor position to the end of the current file', SystemRepository().ShortCut(VK_END, [ssAlt, ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Selects the column from the cursor position to the start of the current file', SystemRepository().ShortCut(VK_HOME, [ssAlt, ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Selects the column to the left of the cursor', SystemRepository().ShortCut(VK_LEFT, [ssAlt, ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Selects the column from the cursor position to the top of the screen', SystemRepository().ShortCut(VK_PRIOR, [ssAlt, ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Selects the column from the cursor position to the bottom of the screen', SystemRepository().ShortCut(VK_NEXT, [ssAlt, ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Selects the column to the right of the cursor', SystemRepository().ShortCut(VK_RIGHT, [ssAlt, ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Deletes the word to the left of the cursor (deletes characters to the next space)', SystemRepository().ShortCut(VK_BACK, [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Deletes a currently selected block', SystemRepository().ShortCut(VK_DELETE, [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Scrolls down one line', SystemRepository().ShortCut(VK_DOWN, [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Moves to the end of a file', SystemRepository().ShortCut(VK_END, [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Opens file at cursor', SystemRepository().ShortCut(VK_RETURN, [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Moves to the top of a file', SystemRepository().ShortCut(VK_HOME, [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Inserts a tab character', SystemRepository().ShortCut(Ord('I'), [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Templates pop-up menu', SystemRepository().ShortCut(Ord('J'), [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Lowercases the current word.', SystemRepository().ShortCut(Ord('E'), [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Uppercases the current word.', SystemRepository().ShortCut(Ord('F'), [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Moves one word left', SystemRepository().ShortCut(VK_LEFT, [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Inserts a new line', SystemRepository().ShortCut(Ord('N'), [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Turns on column blocking', SystemRepository().ShortCut(Ord('C'), [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Turns off column blocking', SystemRepository().ShortCut(Ord('K'), [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Insert compiler options', SystemRepository().ShortCut(Ord('O'), [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Causes next character to be interpreted as an ASCII sequence', SystemRepository().ShortCut(Ord('P'), [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Moves to the bottom of a screen', SystemRepository().ShortCut(VK_PRIOR, [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Moves to the top of a screen', SystemRepository().ShortCut(VK_NEXT, [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Moves one word right', SystemRepository().ShortCut(VK_RIGHT, [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Invokes class completion for the class declaration in which the cursor is positioned', SystemRepository().ShortCut(Ord('C'), [ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Expands all blocks of code', SystemRepository().ShortCut(Ord('K'), [ssCtrl, ssShift]), SystemRepository().ShortCut(Ord('A'), []), ''));
  AddShortCut(NewShortCut('Collapses a block of code', SystemRepository().ShortCut(Ord('K'), [ssCtrl, ssShift]), SystemRepository().ShortCut(Ord('E'), []), ''));
  AddShortCut(NewShortCut('Toggles between enabling and disabling Code Folding', SystemRepository().ShortCut(Ord('K'), [ssCtrl, ssShift]), SystemRepository().ShortCut(Ord('O'), []), ''));
  AddShortCut(NewShortCut('Toggles the current block between collapsed and expanded', SystemRepository().ShortCut(Ord('K'), [ssCtrl, ssShift]), SystemRepository().ShortCut(Ord('T'), []), ''));
  AddShortCut(NewShortCut('Expands a block of code', SystemRepository().ShortCut(Ord('K'), [ssCtrl, ssShift]), SystemRepository().ShortCut(Ord('U'), []), ''));
  AddShortCut(NewShortCut('Selects from the cursor position to the end of the current file', SystemRepository().ShortCut(VK_END, [ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Inserts a new Globally Unique Identifier (GUID)', SystemRepository().ShortCut(Ord('G'), [ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Selects from the cursor position to the start of the current file', SystemRepository().ShortCut(VK_HOME, [ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Indents block', SystemRepository().ShortCut(Ord('I'), [ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Selects the word to the left of the cursor', SystemRepository().ShortCut(VK_LEFT, [ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Selects from the cursor position to the bottom of the screen', SystemRepository().ShortCut(VK_PRIOR, [ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Selects from the cursor position to the top of the screen', SystemRepository().ShortCut(VK_NEXT, [ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Selects the word to the right of the cursor', SystemRepository().ShortCut(VK_RIGHT, [ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Code Parameters pop-up window', SystemRepository().ShortCut(Ord(' '), [ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Moves to the previous code page (or file)', SystemRepository().ShortCut(VK_TAB, [ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Moves to the previous page', SystemRepository().ShortCut(VK_TAB, [ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Outdents block', SystemRepository().ShortCut(Ord('U'), [ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Deletes to the end of a line', SystemRepository().ShortCut(Ord('Y'), [ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Code Completion pop-up window', SystemRepository().ShortCut(Ord(' '), [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Deletes a word to the right (deletes characters to the next space)', SystemRepository().ShortCut(Ord('T'), [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Moves to the next code page (or file)', SystemRepository().ShortCut(VK_TAB, [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Scrolls up one line', SystemRepository().ShortCut(VK_UP, [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Deletes a line', SystemRepository().ShortCut(Ord('Y'), [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Displays Help for the selected fully qualified namespace', SystemRepository().ShortCut(VK_F1, []), scNone, ''));
  //AddShortCut(NewShortCut('Selects column-oriented blocks', SystemRepository().ShortCut(VK_LEFT, [ssAlt, ssShift]), scNone, ''));
  //AddShortCut(NewShortCut('Selects column-oriented blocks', SystemRepository().ShortCut(VK_RIGHT, [ssAlt, ssShift]), scNone, ''));
  //AddShortCut(NewShortCut('Selects column-oriented blocks', SystemRepository().ShortCut(VK_UP, [ssAlt, ssShift]), scNone, ''));
  //AddShortCut(NewShortCut('Selects column-oriented blocks', SystemRepository().ShortCut(VK_DOWN, [ssAlt, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Deletes the character to the left of the cursor', SystemRepository().ShortCut(VK_BACK, [ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Moves the cursor down one line and selects from the right of the starting cursor position', SystemRepository().ShortCut(VK_DOWN, [ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Selects from the cursor position to the end of the current line', SystemRepository().ShortCut(VK_END, [ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Inserts a new line with a carriage return', SystemRepository().ShortCut(VK_RETURN, [ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Selects from the cursor position to the start of the current line', SystemRepository().ShortCut(VK_HOME, [ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Selects the character to the left of the cursor', SystemRepository().ShortCut(VK_LEFT, [ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Moves the cursor down one line and selects from the right of the starting cursor position', SystemRepository().ShortCut(VK_PRIOR, [ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Moves the cursor up one screen and selects from the left of the starting cursor position', SystemRepository().ShortCut(VK_NEXT, [ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Selects the character to the right of the cursor', SystemRepository().ShortCut(VK_RIGHT, [ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Inserts a blank space', SystemRepository().ShortCut(Ord(' '), [ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Moves the cursor to the left one tab position', SystemRepository().ShortCut(VK_TAB, [ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Moves the cursor up one line and selects from the left of the starting cursor position', SystemRepository().ShortCut(VK_UP, [ssShift]), scNone, ''));
end;

initialization
  nick.shortcut.repository.ShortCut.GetShortCutRepository().Add(TDelphiEditorClassicElement);

end.
