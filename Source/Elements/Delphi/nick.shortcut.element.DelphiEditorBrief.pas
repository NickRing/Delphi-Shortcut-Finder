unit nick.shortcut.element.DelphiEditorBrief;

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
  TDelphiEditorBriefElement = class(TDelphiEditorBaseElement)
  private
  protected
    procedure Populate(); override;
    function GetName() : string; override;
    function GetDescription() : string; override;
    function GetSpeedSetting : string; override;
  public
  end;

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
  AddShortCut(NewShortCut('Marks a non-inclusive block', SystemRepository().ShortCut(Ord('A'), [ssAlt]), scNone, ''));
  AddShortCut(NewShortCut('Displays a list of open files', SystemRepository().ShortCut(Ord('B'), [ssAlt]), scNone, ''));
  AddShortCut(NewShortCut('Deletes the word to the right of the cursor', SystemRepository().ShortCut(VK_BACK, [ssAlt]), scNone, ''));
  AddShortCut(NewShortCut('Mark the beginning of a column block', SystemRepository().ShortCut(Ord('C'), [ssAlt]), scNone, ''));
  AddShortCut(NewShortCut('Deletes a line', SystemRepository().ShortCut(Ord('D'), [ssAlt]), scNone, ''));
  AddShortCut(NewShortCut('Displays the local menu', SystemRepository().ShortCut(VK_F9, [ssAlt]), scNone, ''));
  AddShortCut(NewShortCut('Jumps to the previous page', SystemRepository().ShortCut(Ord('-'), [ssAlt]), scNone, ''));
  AddShortCut(NewShortCut('Toggles insert mode', SystemRepository().ShortCut(Ord('I'), [ssAlt]), scNone, ''));
  AddShortCut(NewShortCut('Deletes of the end of a line', SystemRepository().ShortCut(Ord('K'), [ssAlt]), scNone, ''));
  AddShortCut(NewShortCut('Marks a line', SystemRepository().ShortCut(Ord('L'), [ssAlt]), scNone, ''));
  AddShortCut(NewShortCut('Marks an inclusive block', SystemRepository().ShortCut(Ord('M'), [ssAlt]), scNone, ''));
  AddShortCut(NewShortCut('Displays the contents of the next page', SystemRepository().ShortCut(Ord('N'), [ssAlt]), scNone, ''));
  AddShortCut(NewShortCut('Prints the selected block', SystemRepository().ShortCut(Ord('P'), [ssAlt]), scNone, ''));
  AddShortCut(NewShortCut('Goes to the next tab', SystemRepository().ShortCut(VK_PRIOR, [ssAlt]), scNone, ''));
  AddShortCut(NewShortCut('Goes to the previous tab', SystemRepository().ShortCut(VK_NEXT, [ssAlt]), scNone, ''));
  AddShortCut(NewShortCut('Causes next character to be interpreted as an ASCII sequence', SystemRepository().ShortCut(Ord('Q'), [ssAlt]), scNone, ''));
  AddShortCut(NewShortCut('Reads a block from a file', SystemRepository().ShortCut(Ord('R'), [ssAlt]), scNone, ''));
  AddShortCut(NewShortCut('Deletes the character to the left of the cursor', SystemRepository().ShortCut(VK_BACK, []), scNone, ''));
  AddShortCut(NewShortCut('Adds or removes // to each line in the selected code block to comment the code.', SystemRepository().ShortCut({/}VK_OEM_2, [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Closes the current page', SystemRepository().ShortCut(Ord('-'), [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Moves to the bottom of the window', SystemRepository().ShortCut(Ord('B'), [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Deletes the word to the left of the cursor', SystemRepository().ShortCut(VK_BACK, [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Centers line in window', SystemRepository().ShortCut(Ord('C'), [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Moves down one screen', SystemRepository().ShortCut(Ord('D'), [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Moves up one screen', SystemRepository().ShortCut(Ord('E'), [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Inserts an empty new line', SystemRepository().ShortCut(VK_RETURN, [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Help keyword search', SystemRepository().ShortCut(VK_F1, [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Toggles case-sensitive searching', SystemRepository().ShortCut(VK_F5, [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Toggles regular expression searching', SystemRepository().ShortCut(VK_F6, [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Deletes to the beginning of a line', SystemRepository().ShortCut(Ord('K'), [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Inserts a new line with a carriage return', SystemRepository().ShortCut(Ord('M'), [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Open file at cursor', SystemRepository().ShortCut(Ord('A'), [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Browse symbol at cursor', SystemRepository().ShortCut(Ord('B'), [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Toggles the case of a selection', SystemRepository().ShortCut(Ord('O'), [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Finds the matching delimiter (forward)', SystemRepository().ShortCut({[}VK_OEM_4, [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Finds the matching delimiter (backward)', SystemRepository().ShortCut({]}VK_OEM_6, [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Finds the matching delimiter (forward)', SystemRepository().ShortCut(Ord('Q'), [ssCtrl]), SystemRepository().ShortCut({[}VK_OEM_4, [ssCtrl]), ''));
  AddShortCut(NewShortCut('Finds the matching delimiter (backward)', SystemRepository().ShortCut(Ord('Q'), [ssCtrl]), SystemRepository().ShortCut({]}VK_OEM_6, [ssCtrl]), ''));
  AddShortCut(NewShortCut('Performs an incremental search', SystemRepository().ShortCut(Ord('S'), [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Moves to the top of the window', SystemRepository().ShortCut(Ord('T'), [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Invokes class completion for the class declaration in which the cursor is positioned', SystemRepository().ShortCut(Ord('C'), [ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Deletes a character or block at the cursor', SystemRepository().ShortCut(VK_DELETE, []), scNone, ''));
  AddShortCut(NewShortCut('Inserts a new line with a carriage return', SystemRepository().ShortCut(VK_RETURN, []), scNone, ''));
  AddShortCut(NewShortCut('Cancels a command at the prompt', SystemRepository().ShortCut(VK_ESCAPE, []), scNone, ''));
  AddShortCut(NewShortCut('Deletes the character to the left of the cursor', SystemRepository().ShortCut(VK_BACK, [ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Tiles windows horizontally', SystemRepository().ShortCut(VK_F4, [ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Repeats the last Search|Replace operation', SystemRepository().ShortCut(VK_F6, [ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Inserts a tab character', SystemRepository().ShortCut(VK_Tab, []), scNone, ''));
end;

initialization
  nick.shortcut.repository.ShortCut.GetShortCutRepository().Add(TDelphiEditorBriefElement);

end.
