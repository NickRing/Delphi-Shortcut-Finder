unit nick.toolsapi.shortcut.DelphiEditorClassicElement;

interface

uses
  nick.toolsapi.shortcut.DelphiEditorBaseElement;

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

implementation

uses
  nick.toolsapi.shortcut.ShortCutItem,
  nick.toolsapi.shortcut.ShortCutRepository,
  Classes,
  Windows,
  Menus;

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
  AddShortCut(NewShortCut('Finds the matching delimiter (forward)', Menus.ShortCut({[}VK_OEM_4, [ssAlt]), scNone, ''));
  AddShortCut(NewShortCut('Finds the matching delimiter (backward)', Menus.ShortCut({]}VK_OEM_6, [ssAlt]), scNone, ''));
  AddShortCut(NewShortCut('Goes to the next tab', Menus.ShortCut(VK_PRIOR, [ssAlt]), scNone, ''));
  AddShortCut(NewShortCut('Goes to the previous tab', Menus.ShortCut(VK_NEXT, [ssAlt]), scNone, ''));
  AddShortCut(NewShortCut('Moves the cursor down one line and selects the column from the left of the starting cursor position', Menus.ShortCut(VK_DOWN, [ssAlt, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Selects the column from the cursor position to the end of the current line', Menus.ShortCut(VK_END, [ssAlt, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Selects the column from the cursor position to the start of the current line', Menus.ShortCut(VK_HOME, [ssAlt, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Selects the column to the left of the cursor', Menus.ShortCut(VK_LEFT, [ssAlt, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Moves the cursor down one line and selects the column from the right of the starting cursor position', Menus.ShortCut(VK_PRIOR, [ssAlt, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Moves the cursor up one screen and selects the column from the left of the starting cursor position', Menus.ShortCut(VK_NEXT, [ssAlt, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Selects the column to the right of the cursor', Menus.ShortCut(VK_RIGHT, [ssAlt, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Moves the cursor up one line and selects the column from the left of the starting cursor position', Menus.ShortCut(VK_UP, [ssAlt, ssShift]), scNone, ''));
  (*AddShortCut(NewShortCut('Selects column-oriented blocks', Menus.ShortCut(Ord('mousemove'), [ssAlt]), scNone, ''));*)
  AddShortCut(NewShortCut('Adds or removes // to each line in the selected code block to comment the code.', Menus.ShortCut({/}VK_OEM_2, [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Selects the column from the cursor position to the end of the current file', Menus.ShortCut(VK_END, [ssAlt, ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Selects the column from the cursor position to the start of the current file', Menus.ShortCut(VK_HOME, [ssAlt, ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Selects the column to the left of the cursor', Menus.ShortCut(VK_LEFT, [ssAlt, ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Selects the column from the cursor position to the top of the screen', Menus.ShortCut(VK_PRIOR, [ssAlt, ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Selects the column from the cursor position to the bottom of the screen', Menus.ShortCut(VK_NEXT, [ssAlt, ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Selects the column to the right of the cursor', Menus.ShortCut(VK_RIGHT, [ssAlt, ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Deletes the word to the left of the cursor (deletes characters to the next space)', Menus.ShortCut(VK_BACK, [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Deletes a currently selected block', Menus.ShortCut(VK_DELETE, [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Scrolls down one line', Menus.ShortCut(VK_DOWN, [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Moves to the end of a file', Menus.ShortCut(VK_END, [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Opens file at cursor', Menus.ShortCut(VK_RETURN, [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Moves to the top of a file', Menus.ShortCut(VK_HOME, [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Inserts a tab character', Menus.ShortCut(Ord('I'), [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Templates pop-up menu', Menus.ShortCut(Ord('J'), [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Lowercases the current word.', Menus.ShortCut(Ord('E'), [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Uppercases the current word.', Menus.ShortCut(Ord('F'), [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Moves one word left', Menus.ShortCut(VK_LEFT, [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Inserts a new line', Menus.ShortCut(Ord('N'), [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Turns on column blocking', Menus.ShortCut(Ord('C'), [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Turns off column blocking', Menus.ShortCut(Ord('K'), [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Insert compiler options', Menus.ShortCut(Ord('O'), [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Causes next character to be interpreted as an ASCII sequence', Menus.ShortCut(Ord('P'), [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Moves to the bottom of a screen', Menus.ShortCut(VK_PRIOR, [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Moves to the top of a screen', Menus.ShortCut(VK_NEXT, [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Moves one word right', Menus.ShortCut(VK_RIGHT, [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Invokes class completion for the class declaration in which the cursor is positioned', Menus.ShortCut(Ord('C'), [ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Expands all blocks of code', Menus.ShortCut(Ord('K'), [ssCtrl, ssShift]), Menus.ShortCut(Ord('A'), []), ''));
  AddShortCut(NewShortCut('Collapses a block of code', Menus.ShortCut(Ord('K'), [ssCtrl, ssShift]), Menus.ShortCut(Ord('E'), []), ''));
  AddShortCut(NewShortCut('Toggles between enabling and disabling Code Folding', Menus.ShortCut(Ord('K'), [ssCtrl, ssShift]), Menus.ShortCut(Ord('O'), []), ''));
  AddShortCut(NewShortCut('Toggles the current block between collapsed and expanded', Menus.ShortCut(Ord('K'), [ssCtrl, ssShift]), Menus.ShortCut(Ord('T'), []), ''));
  AddShortCut(NewShortCut('Expands a block of code', Menus.ShortCut(Ord('K'), [ssCtrl, ssShift]), Menus.ShortCut(Ord('U'), []), ''));
  AddShortCut(NewShortCut('Selects from the cursor position to the end of the current file', Menus.ShortCut(VK_END, [ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Inserts a new Globally Unique Identifier (GUID)', Menus.ShortCut(Ord('G'), [ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Selects from the cursor position to the start of the current file', Menus.ShortCut(VK_HOME, [ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Indents block', Menus.ShortCut(Ord('I'), [ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Selects the word to the left of the cursor', Menus.ShortCut(VK_LEFT, [ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Selects from the cursor position to the bottom of the screen', Menus.ShortCut(VK_PRIOR, [ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Selects from the cursor position to the top of the screen', Menus.ShortCut(VK_NEXT, [ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Selects the word to the right of the cursor', Menus.ShortCut(VK_RIGHT, [ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Code Parameters pop-up window', Menus.ShortCut(Ord(' '), [ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Moves to the previous code page (or file)', Menus.ShortCut(VK_TAB, [ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Moves to the previous page', Menus.ShortCut(VK_TAB, [ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Outdents block', Menus.ShortCut(Ord('U'), [ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Deletes to the end of a line', Menus.ShortCut(Ord('Y'), [ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Code Completion pop-up window', Menus.ShortCut(Ord(' '), [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Deletes a word to the right (deletes characters to the next space)', Menus.ShortCut(Ord('T'), [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Moves to the next code page (or file)', Menus.ShortCut(VK_TAB, [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Scrolls up one line', Menus.ShortCut(VK_UP, [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Deletes a line', Menus.ShortCut(Ord('Y'), [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Displays Help for the selected fully qualified namespace', Menus.ShortCut(VK_F1, []), scNone, ''));
  //AddShortCut(NewShortCut('Selects column-oriented blocks', Menus.ShortCut(VK_LEFT, [ssAlt, ssShift]), scNone, ''));
  //AddShortCut(NewShortCut('Selects column-oriented blocks', Menus.ShortCut(VK_RIGHT, [ssAlt, ssShift]), scNone, ''));
  //AddShortCut(NewShortCut('Selects column-oriented blocks', Menus.ShortCut(VK_UP, [ssAlt, ssShift]), scNone, ''));
  //AddShortCut(NewShortCut('Selects column-oriented blocks', Menus.ShortCut(VK_DOWN, [ssAlt, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Deletes the character to the left of the cursor', Menus.ShortCut(VK_BACK, [ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Moves the cursor down one line and selects from the right of the starting cursor position', Menus.ShortCut(VK_DOWN, [ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Selects from the cursor position to the end of the current line', Menus.ShortCut(VK_END, [ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Inserts a new line with a carriage return', Menus.ShortCut(VK_RETURN, [ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Selects from the cursor position to the start of the current line', Menus.ShortCut(VK_HOME, [ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Selects the character to the left of the cursor', Menus.ShortCut(VK_LEFT, [ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Moves the cursor down one line and selects from the right of the starting cursor position', Menus.ShortCut(VK_PRIOR, [ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Moves the cursor up one screen and selects from the left of the starting cursor position', Menus.ShortCut(VK_NEXT, [ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Selects the character to the right of the cursor', Menus.ShortCut(VK_RIGHT, [ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Inserts a blank space', Menus.ShortCut(Ord(' '), [ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Moves the cursor to the left one tab position', Menus.ShortCut(VK_TAB, [ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Moves the cursor up one line and selects from the left of the starting cursor position', Menus.ShortCut(VK_UP, [ssShift]), scNone, ''));
end;

initialization
  nick.toolsapi.shortcut.ShortCutRepository.GetShortCutRepository().Add(TDelphiEditorClassicElement);

end.
