unit nick.toolsapi.shortcut.DelphiEditorBriefElement;

interface

uses
  nick.toolsapi.shortcut.DelphiEditorBaseElement;

type
  TDelphiEditorBriefElement = class(TDelphiEditorBaseElement)
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

function TDelphiEditorBriefElement.GetDescription: string;
begin
  Result := 'From: http://docwiki.embarcadero.com/RADStudio/XE6/en/BRIEF_Keyboard_Shortcuts';
end;

function TDelphiEditorBriefElement.GetName: string;
begin
  Result := inherited GetName() + 'Brief';
end;

function TDelphiEditorBriefElement.GetSpeedSetting: string;
begin
  Result := 'Borland.Brief';
end;

procedure TDelphiEditorBriefElement.Populate();
begin
  AddShortCut(NewShortCut('Marks a non-inclusive block', Menus.ShortCut(Ord('A'), [ssAlt]), scNone, ''));
  AddShortCut(NewShortCut('Displays a list of open files', Menus.ShortCut(Ord('B'), [ssAlt]), scNone, ''));
  AddShortCut(NewShortCut('Deletes the word to the right of the cursor', Menus.ShortCut(VK_BACK, [ssAlt]), scNone, ''));
  AddShortCut(NewShortCut('Mark the beginning of a column block', Menus.ShortCut(Ord('C'), [ssAlt]), scNone, ''));
  AddShortCut(NewShortCut('Deletes a line', Menus.ShortCut(Ord('D'), [ssAlt]), scNone, ''));
  AddShortCut(NewShortCut('Displays the local menu', Menus.ShortCut(VK_F9, [ssAlt]), scNone, ''));
  AddShortCut(NewShortCut('Jumps to the previous page', Menus.ShortCut(Ord('-'), [ssAlt]), scNone, ''));
  AddShortCut(NewShortCut('Toggles insert mode', Menus.ShortCut(Ord('I'), [ssAlt]), scNone, ''));
  AddShortCut(NewShortCut('Deletes of the end of a line', Menus.ShortCut(Ord('K'), [ssAlt]), scNone, ''));
  AddShortCut(NewShortCut('Marks a line', Menus.ShortCut(Ord('L'), [ssAlt]), scNone, ''));
  AddShortCut(NewShortCut('Marks an inclusive block', Menus.ShortCut(Ord('M'), [ssAlt]), scNone, ''));
  AddShortCut(NewShortCut('Displays the contents of the next page', Menus.ShortCut(Ord('N'), [ssAlt]), scNone, ''));
  AddShortCut(NewShortCut('Prints the selected block', Menus.ShortCut(Ord('P'), [ssAlt]), scNone, ''));
  AddShortCut(NewShortCut('Goes to the next tab', Menus.ShortCut(VK_PRIOR, [ssAlt]), scNone, ''));
  AddShortCut(NewShortCut('Goes to the previous tab', Menus.ShortCut(VK_NEXT, [ssAlt]), scNone, ''));
  AddShortCut(NewShortCut('Causes next character to be interpreted as an ASCII sequence', Menus.ShortCut(Ord('Q'), [ssAlt]), scNone, ''));
  AddShortCut(NewShortCut('Reads a block from a file', Menus.ShortCut(Ord('R'), [ssAlt]), scNone, ''));
  AddShortCut(NewShortCut('Deletes the character to the left of the cursor', Menus.ShortCut(VK_BACK, []), scNone, ''));
  AddShortCut(NewShortCut('Adds or removes // to each line in the selected code block to comment the code.', Menus.ShortCut({/}VK_OEM_2, [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Closes the current page', Menus.ShortCut(Ord('-'), [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Moves to the bottom of the window', Menus.ShortCut(Ord('B'), [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Deletes the word to the left of the cursor', Menus.ShortCut(VK_BACK, [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Centers line in window', Menus.ShortCut(Ord('C'), [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Moves down one screen', Menus.ShortCut(Ord('D'), [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Moves up one screen', Menus.ShortCut(Ord('E'), [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Inserts an empty new line', Menus.ShortCut(VK_RETURN, [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Help keyword search', Menus.ShortCut(VK_F1, [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Toggles case-sensitive searching', Menus.ShortCut(VK_F5, [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Toggles regular expression searching', Menus.ShortCut(VK_F6, [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Deletes to the beginning of a line', Menus.ShortCut(Ord('K'), [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Inserts a new line with a carriage return', Menus.ShortCut(Ord('M'), [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Open file at cursor', Menus.ShortCut(Ord('A'), [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Browse symbol at cursor', Menus.ShortCut(Ord('B'), [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Toggles the case of a selection', Menus.ShortCut(Ord('O'), [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Finds the matching delimiter (forward)', Menus.ShortCut({[}VK_OEM_4, [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Finds the matching delimiter (backward)', Menus.ShortCut({]}VK_OEM_6, [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Finds the matching delimiter (forward)', Menus.ShortCut(Ord('Q'), [ssCtrl]), Menus.ShortCut({[}VK_OEM_4, [ssCtrl]), ''));
  AddShortCut(NewShortCut('Finds the matching delimiter (backward)', Menus.ShortCut(Ord('Q'), [ssCtrl]), Menus.ShortCut({]}VK_OEM_6, [ssCtrl]), ''));
  AddShortCut(NewShortCut('Performs an incremental search', Menus.ShortCut(Ord('S'), [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Moves to the top of the window', Menus.ShortCut(Ord('T'), [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Invokes class completion for the class declaration in which the cursor is positioned', Menus.ShortCut(Ord('C'), [ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Deletes a character or block at the cursor', Menus.ShortCut(VK_DELETE, []), scNone, ''));
  AddShortCut(NewShortCut('Inserts a new line with a carriage return', Menus.ShortCut(VK_RETURN, []), scNone, ''));
  AddShortCut(NewShortCut('Cancels a command at the prompt', Menus.ShortCut(VK_ESCAPE, []), scNone, ''));
  AddShortCut(NewShortCut('Deletes the character to the left of the cursor', Menus.ShortCut(VK_BACK, [ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Tiles windows horizontally', Menus.ShortCut(VK_F4, [ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Repeats the last Search|Replace operation', Menus.ShortCut(VK_F6, [ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Inserts a tab character', Menus.ShortCut(VK_Tab, []), scNone, ''));
end;

initialization
  nick.toolsapi.shortcut.ShortCutRepository.GetShortCutRepository().Add(TDelphiEditorBriefElement);

end.
