unit nick.toolsapi.shortcut.DelphiEditorVisualStudioElement;

interface

uses
  nick.toolsapi.shortcut.DelphiEditorBaseElement;

type
  TDelphiEditorVisualStudioElement = class(TDelphiEditorBaseElement)
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

{ TDelphiBaseElement }

function TDelphiEditorVisualStudioElement.GetDescription: string;
begin
  Result := 'From: http://docwiki.embarcadero.com/RADStudio/XE6/en/Visual_Studio_Keyboard_Shortcuts';
end;

function TDelphiEditorVisualStudioElement.GetName: string;
begin
  Result := inherited GetName() + 'Visual Studio';
end;

function TDelphiEditorVisualStudioElement.GetSpeedSetting: string;
begin
  Result := 'Borland.VisualStudio';
end;

procedure TDelphiEditorVisualStudioElement.Populate();
begin
  AddShortCut(NewShortCut('Finds the matching delimiter (forward)', Menus.ShortCut({[}VK_OEM_4, [ssAlt]), scNone, ''));
  AddShortCut(NewShortCut('Finds the matching delimiter (backward)', Menus.ShortCut({]}VK_OEM_6, [ssAlt]), scNone, ''));
  AddShortCut(NewShortCut('Edit|Undo', Menus.ShortCut(VK_BACK, [ssAlt]), scNone, ''));
  AddShortCut(NewShortCut('Browse symbol at cursor (Delphi)', Menus.ShortCut(VK_F12, [ssAlt]), scNone, ''));
  AddShortCut(NewShortCut('Goes to the next tab', Menus.ShortCut(VK_PRIOR, [ssAlt]), scNone, ''));
  AddShortCut(NewShortCut('Goes to the previous tab', Menus.ShortCut(VK_NEXT, [ssAlt]), scNone, ''));
  AddShortCut(NewShortCut('Edit|Redo', Menus.ShortCut(VK_BACK, [ssAlt, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Moves the cursor down one line and selects the column from the left of the starting cursor position', Menus.ShortCut(VK_DOWN, [ssAlt, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Selects the column from the cursor position to the end of the current line', Menus.ShortCut(VK_END, [ssAlt, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Selects the column from the cursor position to the start of the current line', Menus.ShortCut(VK_HOME, [ssAlt, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Selects the column to the left of the cursor', Menus.ShortCut(VK_LEFT, [ssAlt, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Moves the cursor down one line and selects the column from the right of the starting cursor position', Menus.ShortCut(VK_PRIOR, [ssAlt, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Moves the cursor up one screen and selects the column from the left of the starting cursor position', Menus.ShortCut(VK_NEXT, [ssAlt, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Selects the column to the right of the cursor', Menus.ShortCut(VK_RIGHT, [ssAlt, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Moves the cursor up one line and selects the column from the left of the starting cursor position', Menus.ShortCut(VK_UP, [ssAlt, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Selects the column from the cursor position to the end of the current file', Menus.ShortCut(VK_END, [ssAlt, ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Selects the column from the cursor position to the start of the current file', Menus.ShortCut(VK_HOME, [ssAlt, ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Selects the column to the left of the cursor', Menus.ShortCut(VK_LEFT, [ssAlt, ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Selects the column from the cursor position to the top of the screen', Menus.ShortCut(VK_PRIOR, [ssAlt, ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Selects the column from the cursor position to the bottom of the screen', Menus.ShortCut(VK_NEXT, [ssAlt, ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Selects the column to the right of the cursor', Menus.ShortCut(VK_RIGHT, [ssAlt, ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Closes the current page', Menus.ShortCut(VK_F4, [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Templates pop-up menu', Menus.ShortCut(Ord('J'), [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Adds or removes // to each line in the selected code block to comment the code.', Menus.ShortCut(Ord('K'), [ssCtrl]), Menus.ShortCut(Ord('C'), []), ''));
  AddShortCut(NewShortCut('Converts the word under the cursor to lower case', Menus.ShortCut(Ord('K'), [ssCtrl]), Menus.ShortCut(Ord('E'), []), ''));
  AddShortCut(NewShortCut('Converts the word under the cursor to upper case', Menus.ShortCut(Ord('K'), [ssCtrl]), Menus.ShortCut(Ord('F'), []), ''));
  AddShortCut(NewShortCut('Search|Search Again', Menus.ShortCut(Ord('L'), [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Causes next character to be interpreted as an ASCII sequence', Menus.ShortCut(Ord('P'), [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Finds the matching delimiter (forward)', Menus.ShortCut(Ord('Q'), [ssCtrl]), Menus.ShortCut({[}VK_OEM_4, []), ''));
  AddShortCut(NewShortCut('Finds the matching delimiter (backward)', Menus.ShortCut(Ord('Q'), [ssCtrl]), Menus.ShortCut({]}VK_OEM_6, []), ''));
  AddShortCut(NewShortCut('Finds the matching delimiter (forward)', Menus.ShortCut(Ord('Q'), [ssCtrl]), Menus.ShortCut({[}VK_OEM_4, [ssCtrl]), ''));
  AddShortCut(NewShortCut('Finds the matching delimiter (backward)', Menus.ShortCut(Ord('Q'), [ssCtrl]), Menus.ShortCut({]}VK_OEM_6, [ssCtrl]), ''));
  AddShortCut(NewShortCut('Deletes to the end of a line', Menus.ShortCut(Ord('Q'), [ssCtrl]), Menus.ShortCut(Ord('Y'), []), ''));
  AddShortCut(NewShortCut('Invokes class completion for the class declaration in which the cursor is positioned', Menus.ShortCut(Ord('C'), [ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Selects from the cursor position to the end of the current file', Menus.ShortCut(VK_END, [ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Selects from the cursor position to the start of the current file', Menus.ShortCut(VK_HOME, [ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Selects the word to the left of the cursor', Menus.ShortCut(VK_LEFT, [ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Selects from the cursor position to the bottom of the screen', Menus.ShortCut(VK_PRIOR, [ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Selects from the cursor position to the top of the screen', Menus.ShortCut(VK_NEXT, [ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Selects the word to the right of the cursor', Menus.ShortCut(VK_RIGHT, [ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Displays the previous window in the buffer list', Menus.ShortCut(VK_TAB, [ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Deletes the word to the left of the cursor', Menus.ShortCut(Ord('T'), [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Displays the next window in the buffer list', Menus.ShortCut(VK_TAB, [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Deletes to the end of a line', Menus.ShortCut(Ord('Y'), [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Moves the cursor down one line and selects from the right of the starting cursor position', Menus.ShortCut(VK_DOWN, [ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Selects from the cursor position to the end of the current line', Menus.ShortCut(VK_END, [ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Inserts a new line character', Menus.ShortCut(VK_RETURN, [ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Selects from the cursor position to the start of the current line', Menus.ShortCut(VK_HOME, [ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Selects the character to the left of the cursor', Menus.ShortCut(VK_LEFT, [ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Moves the cursor down one line and selects from the right of the starting cursor position', Menus.ShortCut(VK_PRIOR, [ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Moves the cursor up one screen and selects from the left of the starting cursor position', Menus.ShortCut(VK_NEXT, [ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Selects the character to the right of the cursor', Menus.ShortCut(VK_RIGHT, [ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Inserts a blank space', Menus.ShortCut(Ord(' '), [ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Moves the cursor up one line and selects from the left of the starting cursor position', Menus.ShortCut(VK_UP, [ssShift]), scNone, ''));
end;

initialization
  nick.toolsapi.shortcut.ShortCutRepository.GetShortCutRepository().Add(TDelphiEditorVisualStudioElement);

end.
