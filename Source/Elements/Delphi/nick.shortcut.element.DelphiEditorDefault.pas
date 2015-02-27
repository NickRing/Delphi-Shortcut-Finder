unit nick.shortcut.element.DelphiEditorDefault;

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
  TDelphiEditorDefaultElement = class(TDelphiEditorBaseElement)
  private
  protected
    procedure Populate(); override;
    function GetName() : string; override;
    function GetSpeedSetting : string; override;
    function GetDescription() : string; override;
  public
  end;

function TDelphiEditorDefaultElement.GetDescription: string;
begin
  Result := 'From: http://docwiki.embarcadero.com/RADStudio/XE6/en/Default_Keyboard_Shortcuts';
end;

function TDelphiEditorDefaultElement.GetName: string;
begin
  Result := inherited GetName() + 'Default';
end;

function TDelphiEditorDefaultElement.GetSpeedSetting: string;
begin
  Result := 'Borland.Default';
end;

procedure TDelphiEditorDefaultElement.Populate();
begin
  AddShortCut(NewShortCut('Finds the matching delimiter (forward)', SystemRepository().ShortCut({[}VK_OEM_4, [ssAlt]), scNone, ''));
  AddShortCut(NewShortCut('Finds the matching delimiter (backward)', SystemRepository().ShortCut({]}VK_OEM_6, [ssAlt]), scNone, ''));
  AddShortCut(NewShortCut('Go back after Alt+Up Arrow or Ctrl+Click (go to declaration) operation', SystemRepository().ShortCut(VK_LEFT, [ssAlt]), scNone, 'Code browse/Find declarations history backwards'));
  AddShortCut(NewShortCut('Go to previous error or message in Messages View', SystemRepository().ShortCut(VK_F7, [ssAlt]), scNone, 'Previous result (for Find in Files and Build Error Messages)'));
  AddShortCut(NewShortCut('Go to next error / message in Messages View', SystemRepository().ShortCut(VK_F8, [ssAlt]), scNone, 'Next result (for Find in Files and Build Error Messages)'));
  AddShortCut(NewShortCut('Goes to the next tab', SystemRepository().ShortCut(VK_NEXT, [ssAlt]), scNone, ''));
  AddShortCut(NewShortCut('Goes to the previous tab', SystemRepository().ShortCut(VK_PRIOR, [ssAlt]), scNone, ''));
  AddShortCut(NewShortCut('Go forward after Alt+Left Arrow operation', SystemRepository().ShortCut(VK_RIGHT, [ssAlt]), scNone, 'Code browse/Find declarations history forwards'));
  AddShortCut(NewShortCut('Moves the cursor down one line and selects the column from the left of the starting cursor position', SystemRepository().ShortCut(VK_DOWN, [ssAlt, ssShift]), scNone, 'Selects column-oriented blocks'));
  AddShortCut(NewShortCut('Selects the column from the cursor position to the end of the current line', SystemRepository().ShortCut(VK_END, [ssAlt, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Selects the column from the cursor position to the start of the current line', SystemRepository().ShortCut(VK_HOME, [ssAlt, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Selects the column to the left of the cursor', SystemRepository().ShortCut(VK_LEFT, [ssAlt, ssShift]), scNone, 'Selects column-oriented blocks'));
  AddShortCut(NewShortCut('Moves the cursor down one line and selects the column from the right of the starting cursor position', SystemRepository().ShortCut(VK_NEXT, [ssAlt, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Moves the cursor up one screen and selects the column from the left of the starting cursor position', SystemRepository().ShortCut(VK_PRIOR, [ssAlt, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Selects the column to the right of the cursor', SystemRepository().ShortCut(VK_RIGHT, [ssAlt, ssShift]), scNone, 'Selects column-oriented blocks'));
  AddShortCut(NewShortCut('Moves the cursor up one line and selects the column from the left of the starting cursor position', SystemRepository().ShortCut(VK_UP, [ssAlt, ssShift]), scNone, 'Selects column-oriented blocks'));
  AddShortCut(NewShortCut('Go to declaration', SystemRepository().ShortCut(VK_UP, [ssAlt]), scNone, 'Initiates Find declaration / code browsing'));
  (*AddShortCut(NewShortCut('Selects column-oriented blocks', SystemRepository().ShortCut(VK_MOUSEMOVE, [ssAlt]), scNone, ''));*)
  AddShortCut(NewShortCut('Adds or removes // to each line in the selected code block to comment the code', SystemRepository().ShortCut({/}VK_OEM_2, [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Display a drop down list of open files', SystemRepository().ShortCut(VK_F12, [ssAlt, ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Selects the column from the cursor position to the end of the current file', SystemRepository().ShortCut(VK_END, [ssAlt, ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Selects the column from the cursor position to the start of the current file', SystemRepository().ShortCut(VK_HOME, [ssAlt, ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Selects the column to the left of the cursor', SystemRepository().ShortCut(VK_LEFT, [ssAlt, ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Selects the column from the cursor position to the top of the screen', SystemRepository().ShortCut(VK_NEXT, [ssAlt, ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Selects the column from the cursor position to the bottom of the screen', SystemRepository().ShortCut(VK_PRIOR, [ssAlt, ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Selects the column to the right of the cursor', SystemRepository().ShortCut(VK_RIGHT, [ssAlt, ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Deletes the word to the left of the cursor (deletes characters to the preceding space)', SystemRepository().ShortCut(VK_BACK, [ssCtrl]), scNone, ''));
  (*AddShortCut(NewShortCut('Go to declaration', SystemRepository().ShortCut(VK_CLICK, [ssCtrl]), scNone, ''));*)
  AddShortCut(NewShortCut('Deletes a currently selected block', SystemRepository().ShortCut(VK_DELETE, [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Scrolls down one line', SystemRepository().ShortCut(VK_DOWN, [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Moves to the end of a file', SystemRepository().ShortCut(VK_END, [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Opens file at cursor', SystemRepository().ShortCut(VK_RETURN, [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Moves to the top of a file', SystemRepository().ShortCut(VK_HOME, [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Inserts a tab character', SystemRepository().ShortCut(Ord('I'), [ssCtrl]), scNone, 'Inserts a tab character / Indents block by the amount specified in the block indent editor setting'));
  AddShortCut(NewShortCut('Templates pop-up menu', SystemRepository().ShortCut(Ord('J'), [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Creates/remove bookmark 0', SystemRepository().ShortCut(Ord('0'), [ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Creates/remove bookmark 1', SystemRepository().ShortCut(Ord('1'), [ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Creates/remove bookmark 2', SystemRepository().ShortCut(Ord('2'), [ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Creates/remove bookmark 3', SystemRepository().ShortCut(Ord('3'), [ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Creates/remove bookmark 4', SystemRepository().ShortCut(Ord('4'), [ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Creates/remove bookmark 5', SystemRepository().ShortCut(Ord('5'), [ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Creates/remove bookmark 6', SystemRepository().ShortCut(Ord('6'), [ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Creates/remove bookmark 7', SystemRepository().ShortCut(Ord('7'), [ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Creates/remove bookmark 8', SystemRepository().ShortCut(Ord('8'), [ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Creates/remove bookmark 9', SystemRepository().ShortCut(Ord('9'), [ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Lowercases the current word', SystemRepository().ShortCut(Ord('K'), [ssCtrl]), SystemRepository().ShortCut(Ord('E'), []), 'Changes a word to lowercase and deselects selection'));
  AddShortCut(NewShortCut('Uppercases the current word', SystemRepository().ShortCut(Ord('K'), [ssCtrl]), SystemRepository().ShortCut(Ord('F'), []), 'Changes a word to uppercase and deselects selection'));
  AddShortCut(NewShortCut('Select word', SystemRepository().ShortCut(Ord('K'), [ssCtrl]), SystemRepository().ShortCut(Ord('T'), []), 'Marks word as a block'));
  AddShortCut(NewShortCut('Moves one word left', SystemRepository().ShortCut(VK_LEFT, [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Goto/Jumps to bookmark 0', SystemRepository().ShortCut(Ord('0'), [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Goto/Jumps to bookmark 1', SystemRepository().ShortCut(Ord('1'), [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Goto/Jumps to bookmark 2', SystemRepository().ShortCut(Ord('2'), [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Goto/Jumps to bookmark 3', SystemRepository().ShortCut(Ord('3'), [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Goto/Jumps to bookmark 4', SystemRepository().ShortCut(Ord('4'), [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Goto/Jumps to bookmark 5', SystemRepository().ShortCut(Ord('5'), [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Goto/Jumps to bookmark 6', SystemRepository().ShortCut(Ord('6'), [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Goto/Jumps to bookmark 7', SystemRepository().ShortCut(Ord('7'), [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Goto/Jumps to bookmark 8', SystemRepository().ShortCut(Ord('8'), [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Goto/Jumps to bookmark 9', SystemRepository().ShortCut(Ord('9'), [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Inserts a new line', SystemRepository().ShortCut(Ord('N'), [ssCtrl]), scNone, 'Insert new line after cursor (cursor stays in current line)'));
  AddShortCut(NewShortCut('Turns on column blocking', SystemRepository().ShortCut(Ord('O'), [ssCtrl]), SystemRepository().ShortCut(Ord('C'), []), ''));
  AddShortCut(NewShortCut('Turns off column blocking', SystemRepository().ShortCut(Ord('O'), [ssCtrl]), SystemRepository().ShortCut(Ord('K'), []), 'Turns off column blocking or line blocking/ Disable inclusive block'));
  AddShortCut(NewShortCut('Turn on line blocking mode', SystemRepository().ShortCut(Ord('O'), [ssCtrl]), SystemRepository().ShortCut(Ord('L'), []), 'Turns on line block mode/Marks a line as a block'));
  AddShortCut(NewShortCut('Insert compiler options', SystemRepository().ShortCut(Ord('O'), [ssCtrl]), SystemRepository().ShortCut(Ord('O'), []), 'Inserts compiler options and directives'));
  AddShortCut(NewShortCut('Causes next character to be interpreted as an ASCII sequence', SystemRepository().ShortCut(Ord('P'), [ssCtrl]), scNone, 'Causes next character to be interpreted as an ASCII sequence (not in newer versions)'));
  AddShortCut(NewShortCut('Moves to the bottom of a screen', SystemRepository().ShortCut(VK_NEXT, [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Moves to the top of a screen', SystemRepository().ShortCut(VK_PRIOR, [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Moves one word right', SystemRepository().ShortCut(VK_RIGHT, [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Invokes class completion for the class declaration in which the cursor is positioned', SystemRepository().ShortCut(Ord('C'), [ssCtrl, ssShift]), scNone, 'Invoke class completion for the class that currently contains the cursor'));
  AddShortCut(NewShortCut('Display buffer list', SystemRepository().ShortCut(Ord('B'), [ssCtrl, ssShift]), scNone, 'Invoke Browser window'));
  AddShortCut(NewShortCut('Jump between declaration and implementation', SystemRepository().ShortCut(VK_DOWN, [ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Find usages', SystemRepository().ShortCut(VK_RETURN, [ssCtrl, ssShift]), scNone, 'Display Find References pane'));
  AddShortCut(NewShortCut('SyncEdit', SystemRepository().ShortCut(Ord('J'), [ssCtrl, ssShift]), scNone, ''));
  (*AddShortCut(NewShortCut('Expands all blocks of code', SystemRepository().ShortCut(Ord('A'), [ssCtrl, ssShift]), scNone, ''));*)
  AddShortCut(NewShortCut('Collapses all classes', SystemRepository().ShortCut(Ord('K'), [ssCtrl, ssShift]), SystemRepository().ShortCut(Ord('C'), [ssCtrl, ssShift]), 'Regions & Code folding: Collapse all classes'));
  AddShortCut(NewShortCut('Collapses a block of code', SystemRepository().ShortCut(Ord('K'), [ssCtrl, ssShift]), SystemRepository().ShortCut(Ord('E'), [ssCtrl, ssShift]), 'Regions & Code folding: Collapses current region'));
  AddShortCut(NewShortCut('Initializes/finalize or interface/implementation', SystemRepository().ShortCut(Ord('K'), [ssCtrl, ssShift]), SystemRepository().ShortCut(Ord('G'), [ssCtrl, ssShift]), 'Regions & Code folding: Collapses interface, implementation, initialization, and finalization sections'));
  AddShortCut(NewShortCut('Collapses all methods', SystemRepository().ShortCut(Ord('K'), [ssCtrl, ssShift]), SystemRepository().ShortCut(Ord('M'), [ssCtrl, ssShift]), 'Regions & Code folding: Collapses all methods'));
  AddShortCut(NewShortCut('Collapses namespace/Unit', SystemRepository().ShortCut(Ord('K'), [ssCtrl, ssShift]), SystemRepository().ShortCut(Ord('N'), [ssCtrl, ssShift]), 'Regions & Code folding: Collapses namespace/unit'));
  AddShortCut(NewShortCut('Toggles between enabling and disabling Code Folding', SystemRepository().ShortCut(Ord('K'), [ssCtrl, ssShift]), SystemRepository().ShortCut(Ord('O'), [ssCtrl, ssShift]), 'Regions & Code folding: Toggles code folding on and off'));
  AddShortCut(NewShortCut('Collapses nested procedures', SystemRepository().ShortCut(Ord('K'), [ssCtrl, ssShift]), SystemRepository().ShortCut(Ord('P'), [ssCtrl, ssShift]), 'Regions & Code folding: Collapses nested procedures'));
  AddShortCut(NewShortCut('Collapses all regions', SystemRepository().ShortCut(Ord('K'), [ssCtrl, ssShift]), SystemRepository().ShortCut(Ord('R'), [ssCtrl, ssShift]), 'Regions & Code folding: Collapse all custom regions {$REGION ''comment''}..{$ENDREGION}'));
  AddShortCut(NewShortCut('Toggles the current block between collapsed and expanded', SystemRepository().ShortCut(Ord('K'), [ssCtrl, ssShift]), SystemRepository().ShortCut(Ord('T'), [ssCtrl, ssShift]), 'Regions & Code folding: Expands/collapses current region'));
  AddShortCut(NewShortCut('Expands a block of code', SystemRepository().ShortCut(Ord('K'), [ssCtrl, ssShift]), SystemRepository().ShortCut(Ord('U'), [ssCtrl, ssShift]), 'Regions & Code folding: Expand current block of code'));
  AddShortCut(NewShortCut('Selects from the cursor position to the end of the current file', SystemRepository().ShortCut(VK_END, [ssCtrl, ssShift]), scNone, 'Selects from the cursor position to the end of the current file'));
  AddShortCut(NewShortCut('Inserts a new Globally Unique Identifier (GUID)', SystemRepository().ShortCut(Ord('G'), [ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Selects from the cursor position to the start of the current file', SystemRepository().ShortCut(VK_HOME, [ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Indents block', SystemRepository().ShortCut(Ord('I'), [ssCtrl, ssShift]), scNone, 'Indents block by the amount specified in the block indent editor setting'));
  AddShortCut(NewShortCut('Selects the word to the left of the cursor', SystemRepository().ShortCut(VK_LEFT, [ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Plays a recorded keystroke macro', SystemRepository().ShortCut(Ord('P'), [ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Selects from the cursor position to the bottom of the screen', SystemRepository().ShortCut(VK_NEXT, [ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Selects from the cursor position to the top of the screen', SystemRepository().ShortCut(VK_PRIOR, [ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Toggles between starting and stopping the recording of a keystroke macro', SystemRepository().ShortCut(Ord('R'), [ssCtrl, ssShift]), scNone, 'Starts/stops keystroke macro recording'));
  AddShortCut(NewShortCut('Selects the word to the right of the cursor', SystemRepository().ShortCut(VK_RIGHT, [ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Code Parameters pop-up window', SystemRepository().ShortCut(VK_SPACE, [ssCtrl, ssShift]), scNone, 'Invoke code parameter hints'));
  AddShortCut(NewShortCut('Create ToDo entry', SystemRepository().ShortCut(Ord('T'), [ssCtrl, ssShift]), scNone, 'Add todo item'));
  AddShortCut(NewShortCut('Moves to the next code page (or file)', SystemRepository().ShortCut(VK_TAB, [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Moves to the previous page', SystemRepository().ShortCut(VK_TAB, [ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Outdents block', SystemRepository().ShortCut(Ord('U'), [ssCtrl, ssShift]), scNone, 'Outdents the current selected block by the amount specified in the block indent setting'));
  AddShortCut(NewShortCut('Jump between declaration and implementation', SystemRepository().ShortCut(VK_UP, [ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Deletes to the end of a line', SystemRepository().ShortCut(Ord('Y'), [ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Code Completion pop-up window', SystemRepository().ShortCut(VK_SPACE, [ssCtrl]), scNone, 'Invoke code completion'));
  AddShortCut(NewShortCut('Deletes a word to the right (deletes characters to the next space)', SystemRepository().ShortCut(Ord('T'), [ssCtrl]), scNone, 'Deletes word to right of cursor'));
  AddShortCut(NewShortCut('Deletes a line', SystemRepository().ShortCut(Ord('Y'), [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Displays Help for the selected fully qualified namespace', SystemRepository().ShortCut(VK_F1, []), scNone, 'Displays context-sensitive Help'));
  AddShortCut(NewShortCut('Deletes the character to the left of the cursor', SystemRepository().ShortCut(VK_BACK, [ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Moves the cursor down one line and selects from the right of the starting cursor position', SystemRepository().ShortCut(VK_DOWN, [ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Selects from the cursor position to the end of the current line', SystemRepository().ShortCut(VK_END, [ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Inserts a new line with a carriage return', SystemRepository().ShortCut(VK_RETURN, [ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Selects from the cursor position to the start of the current line', SystemRepository().ShortCut(VK_HOME, [ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Selects the character to the left of the cursor', SystemRepository().ShortCut(VK_LEFT, [ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Moves the cursor down one line and selects from the right of the starting cursor position', SystemRepository().ShortCut(VK_NEXT, [ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Moves the cursor up one screen and selects from the left of the starting cursor position', SystemRepository().ShortCut(VK_PRIOR, [ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Selects the character to the right of the cursor', SystemRepository().ShortCut(VK_RIGHT, [ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Inserts a blank space', SystemRepository().ShortCut(VK_SPACE, [ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Moves the cursor to the left one tab position', SystemRepository().ShortCut(VK_TAB, [ssShift]), scNone, 'Moves the cursor to the left one tab position / Outdents the current selected block by the amount specified in the block indent setting'));
  AddShortCut(NewShortCut('Moves the cursor up one line and selects from the left of the starting cursor position', SystemRepository().ShortCut(VK_UP, [ssShift]), scNone, ''));

  // Extras...

  AddShortCut(NewShortCut('Undo', SystemRepository().ShortCut(VK_BACK, [ssAlt]), scNone, ''));
  AddShortCut(NewShortCut('Navigate through opened windows in the IDE (undocked view)', SystemRepository().ShortCut(VK_END, [ssAlt]), scNone, ''));
  AddShortCut(NewShortCut('Displays editor context menu', SystemRepository().ShortCut(VK_F10, [ssAlt]), scNone, ''));
  AddShortCut(NewShortCut('Displays Use unit dialogue', SystemRepository().ShortCut(VK_F11, [ssAlt]), scNone, ''));
  AddShortCut(NewShortCut('Closes Delphi', SystemRepository().ShortCut(VK_F4, [ssAlt]), scNone, ''));
  AddShortCut(NewShortCut('Inspect symbol under cursor in debugger', SystemRepository().ShortCut(VK_F5, [ssAlt]), scNone, ''));
  AddShortCut(NewShortCut('Go to line number', SystemRepository().ShortCut(Ord('G'), [ssAlt]), scNone, 'Goto line number in editor'));
  AddShortCut(NewShortCut('Redo (opposite of Undo)', SystemRepository().ShortCut(VK_BACK, [ssAlt, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Invoke Structure window', SystemRepository().ShortCut(VK_F11, [ssAlt, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Cut word under cursor / current selected block', SystemRepository().ShortCut(Ord('X'), [ssAlt]), scNone, ''));
  AddShortCut(NewShortCut('Invoke Window List', SystemRepository().ShortCut(Ord('0'), [ssAlt]), scNone, ''));
  AddShortCut(NewShortCut('Display Popup menu', SystemRepository().ShortCut(VK_F10, [ssShift]), scNone, 'Displays editor context menu'));
  AddShortCut(NewShortCut('Toggle between Form as text mode or design mode', SystemRepository().ShortCut(VK_F12, [ssAlt]), scNone, ''));
  (*AddShortCut(NewShortCut('Select editor window tab', SystemRepository().ShortCut(VK_F12, [AltGr]), scNone, ''));*)
  AddShortCut(NewShortCut('Deletes the character to the left of the cursor', SystemRepository().ShortCut(VK_BACK, []), scNone, ''));
  (*AddShortCut(NewShortCut('Makes Tooltip popups transparent in debugger', SystemRepository().ShortCut(ssCtrl, []), scNone, ''));*)
  AddShortCut(NewShortCut('IDE Insight - Displays Code Completion popup window or Argument Value List', SystemRepository().ShortCut({.}VK_OEM_PERIOD, [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Select All', SystemRepository().ShortCut(Ord('A'), [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Comments selected block', SystemRepository().ShortCut({.}VK_OEM_PERIOD, [ssCtrl, ssAlt]), scNone, ''));
  AddShortCut(NewShortCut('Uncomments selected block', SystemRepository().ShortCut({,}VK_OEM_COMMA, [ssCtrl, ssAlt]), scNone, ''));
  AddShortCut(NewShortCut('Adds current date to source code', SystemRepository().ShortCut(Ord('A'), [ssCtrl, ssAlt]), scNone, ''));
  AddShortCut(NewShortCut('Invoke Breakpoint window', SystemRepository().ShortCut(Ord('B'), [ssCtrl, ssAlt]), scNone, ''));
  AddShortCut(NewShortCut('Invoke CPU window', SystemRepository().ShortCut(Ord('C'), [ssCtrl, ssAlt]), scNone, 'Displays CPU Window'));
  AddShortCut(NewShortCut('Displays Disassembly pane in debugger"', SystemRepository().ShortCut(Ord('D'), [ssCtrl, ssAlt]), scNone, ''));
  AddShortCut(NewShortCut('Next method hopping', SystemRepository().ShortCut(VK_DOWN, [ssCTRL, ssALT]), scNone, 'Navigate to next method implementation in lexical order in this source unit, or within the class to which scope has been limited using Ctrl+Q+L'));
  AddShortCut(NewShortCut('Last method hopping', SystemRepository().ShortCut(VK_END, [ssCTRL, ssALT]), scNone, 'Navigate to the lexically last method implementation in this source unit, or within the class to which scope has been limited using Ctrl+Q+L'));
  AddShortCut(NewShortCut('Invoke FPU window', SystemRepository().ShortCut(Ord('F'), [ssCtrl, ssAlt]), scNone, ''));
  AddShortCut(NewShortCut('Invoke Project manager window', SystemRepository().ShortCut(VK_F11, [ssCtrl, ssAlt]), scNone, ''));
  AddShortCut(NewShortCut('First method hopping', SystemRepository().ShortCut(VK_HOME, [ssCTRL, ssALT]), scNone, 'Navigate to the lexically first method implementation in this source unit, or within the class to which scope has been limited using Ctrl+Q+L'));
  AddShortCut(NewShortCut('Displays Stack pane in debugger', SystemRepository().ShortCut(Ord('K'), [ssCtrl, ssAlt]), scNone, ''));
  AddShortCut(NewShortCut('Invoke Local Variables window', SystemRepository().ShortCut(Ord('L'), [ssCtrl, ssAlt]), scNone, ''));
  AddShortCut(NewShortCut('Invoke Modules window', SystemRepository().ShortCut(Ord('M'), [ssCtrl, ssAlt]), scNone, ''));
  AddShortCut(NewShortCut('Activate the Tool Palette in filtering mode', SystemRepository().ShortCut(Ord('P'), [ssCtrl, ssAlt]), scNone, 'Start typing, press Enter to drop component'));
  AddShortCut(NewShortCut('Displays Registers pane in debugger', SystemRepository().ShortCut(Ord('R'), [ssCtrl, ssAlt]), scNone, ''));
  AddShortCut(NewShortCut('Invoke Call Stack window', SystemRepository().ShortCut(Ord('S'), [ssCtrl, ssAlt]), scNone, ''));
  AddShortCut(NewShortCut('Invoke Threads window', SystemRepository().ShortCut(Ord('T'), [ssCtrl, ssAlt]), scNone, ''));
  AddShortCut(NewShortCut('Method hopping - Navigate to previous method implementation in lexical order in this source unit, or within the class to which scope has been limited using ssCtrl+Q+L', SystemRepository().ShortCut(VK_UP, [ssCtrl, ssAlt]), scNone, ''));
  AddShortCut(NewShortCut('Invoke Event window', SystemRepository().ShortCut(Ord('V'), [ssCtrl, ssAlt]), scNone, ''));
  AddShortCut(NewShortCut('Invoke Watches window', SystemRepository().ShortCut(Ord('W'), [ssCtrl, ssAlt]), scNone, ''));
  AddShortCut(NewShortCut('Invoke buffer window when focus is on editor. The buffer window shows a list of all different tabs.', SystemRepository().ShortCut(Ord('B'), [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Copy word under Cursor / selected block', SystemRepository().ShortCut(Ord('C'), [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Code formatting', SystemRepository().ShortCut(Ord('D'), [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Starts Incremental Search', SystemRepository().ShortCut(Ord('E'), [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Displays Find dialogue', SystemRepository().ShortCut(Ord('F'), [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Displays Help topic search', SystemRepository().ShortCut(VK_F1, [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Access \ Open Main Menu', SystemRepository().ShortCut(VK_F10, [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Invoke Open Project Dialogue', SystemRepository().ShortCut(VK_F11, [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Displays View units dialogue', SystemRepository().ShortCut(VK_F12, [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Program Reset', SystemRepository().ShortCut(VK_F2, [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Displays call stack window', SystemRepository().ShortCut(VK_F3, [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Closes current file', SystemRepository().ShortCut(VK_F4, [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Displays Watch Properties dialogue box in the debugger / Displays Add Watch dialogue in the debugger', SystemRepository().ShortCut(VK_F5, [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Switches between source (.cpp) and header (.h)', SystemRepository().ShortCut(VK_F6, [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Displays Evaluate/modify dialogue in the debugger', SystemRepository().ShortCut(VK_F7, [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Compiles project', SystemRepository().ShortCut(VK_F9, [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Displays Search Replace dialogue', SystemRepository().ShortCut(Ord('H'), [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Copy word under Cursor / selected block', SystemRepository().ShortCut(VK_INSERT, [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Creates/removes bookmark 0', SystemRepository().ShortCut(Ord('K'), [ssCtrl]), SystemRepository().ShortCut(Ord('0'), []), ''));
  AddShortCut(NewShortCut('Creates/removes bookmark 1', SystemRepository().ShortCut(Ord('K'), [ssCtrl]), SystemRepository().ShortCut(Ord('1'), []), ''));
  AddShortCut(NewShortCut('Creates/removes bookmark 2', SystemRepository().ShortCut(Ord('K'), [ssCtrl]), SystemRepository().ShortCut(Ord('2'), []), ''));
  AddShortCut(NewShortCut('Creates/removes bookmark 3', SystemRepository().ShortCut(Ord('K'), [ssCtrl]), SystemRepository().ShortCut(Ord('3'), []), ''));
  AddShortCut(NewShortCut('Creates/removes bookmark 4', SystemRepository().ShortCut(Ord('K'), [ssCtrl]), SystemRepository().ShortCut(Ord('4'), []), ''));
  AddShortCut(NewShortCut('Creates/removes bookmark 5', SystemRepository().ShortCut(Ord('K'), [ssCtrl]), SystemRepository().ShortCut(Ord('5'), []), ''));
  AddShortCut(NewShortCut('Creates/removes bookmark 6', SystemRepository().ShortCut(Ord('K'), [ssCtrl]), SystemRepository().ShortCut(Ord('6'), []), ''));
  AddShortCut(NewShortCut('Creates/removes bookmark 7', SystemRepository().ShortCut(Ord('K'), [ssCtrl]), SystemRepository().ShortCut(Ord('7'), []), ''));
  AddShortCut(NewShortCut('Creates/removes bookmark 8', SystemRepository().ShortCut(Ord('K'), [ssCtrl]), SystemRepository().ShortCut(Ord('8'), []), ''));
  AddShortCut(NewShortCut('Creates/removes bookmark 9', SystemRepository().ShortCut(Ord('K'), [ssCtrl]), SystemRepository().ShortCut(Ord('9'), []), ''));
  AddShortCut(NewShortCut('Marks beginning of a block', SystemRepository().ShortCut(Ord('K'), [ssCtrl]), SystemRepository().ShortCut(Ord('B'), []), ''));
  AddShortCut(NewShortCut('Copies selected block', SystemRepository().ShortCut(Ord('K'), [ssCtrl]), SystemRepository().ShortCut(Ord('C'), []), ''));
  AddShortCut(NewShortCut('Accesses the menu bar', SystemRepository().ShortCut(Ord('K'), [ssCtrl]), SystemRepository().ShortCut(Ord('D'), []), ''));
  AddShortCut(NewShortCut('Hides/shows selected block', SystemRepository().ShortCut(Ord('K'), [ssCtrl]), SystemRepository().ShortCut(Ord('H'), []), ''));
  AddShortCut(NewShortCut('Indents block by the amount specified in the block indent editor setting', SystemRepository().ShortCut(Ord('K'), [ssCtrl]), SystemRepository().ShortCut(Ord('I'), []), ''));
  AddShortCut(NewShortCut('Marks end of a block', SystemRepository().ShortCut(Ord('K'), [ssCtrl]), SystemRepository().ShortCut(Ord('K'), []), ''));
  AddShortCut(NewShortCut('Marks the current line as a block', SystemRepository().ShortCut(Ord('K'), [ssCtrl]), SystemRepository().ShortCut(Ord('L'), []), ''));
  AddShortCut(NewShortCut('Changes a block to uppercase', SystemRepository().ShortCut(Ord('K'), [ssCtrl]), SystemRepository().ShortCut(Ord('N'), []), ''));
  AddShortCut(NewShortCut('Changes a block to lowercase', SystemRepository().ShortCut(Ord('K'), [ssCtrl]), SystemRepository().ShortCut(Ord('O'), []), ''));
  AddShortCut(NewShortCut('Prints selected block', SystemRepository().ShortCut(Ord('K'), [ssCtrl]), SystemRepository().ShortCut(Ord('P'), []), ''));
  AddShortCut(NewShortCut('Invokes Read block from file (inserts text at cursor)', SystemRepository().ShortCut(Ord('K'), [ssCtrl]), SystemRepository().ShortCut(Ord('R'), []), ''));
  AddShortCut(NewShortCut('Save file', SystemRepository().ShortCut(Ord('K'), [ssCtrl]), SystemRepository().ShortCut(Ord('S'), []), ''));
  AddShortCut(NewShortCut('Outdents the current selected block by the amount specified in the block indent setting', SystemRepository().ShortCut(Ord('K'), [ssCtrl]), SystemRepository().ShortCut(Ord('U'), []), ''));
  AddShortCut(NewShortCut('Moves a selected block', SystemRepository().ShortCut(Ord('K'), [ssCtrl]), SystemRepository().ShortCut(Ord('V'), []), ''));
  AddShortCut(NewShortCut('Invokes Write block to file (selected text)', SystemRepository().ShortCut(Ord('K'), [ssCtrl]), SystemRepository().ShortCut(Ord('W'), []), ''));
  AddShortCut(NewShortCut('Deletes selected block or the character to the right of the cursor', SystemRepository().ShortCut(Ord('K'), [ssCtrl]), SystemRepository().ShortCut(Ord('Y'), []), ''));
  AddShortCut(NewShortCut('Find next Find/Replace/Incremental search', SystemRepository().ShortCut(Ord('L'), [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Insert new line (same as Enter)', SystemRepository().ShortCut(Ord('M'), [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Triggers Open file at cursor or go to declaration', SystemRepository().ShortCut(Ord('O'), [ssCtrl]), SystemRepository().ShortCut(Ord('A'), []), ''));
  AddShortCut(NewShortCut('Browses symbol at cursor', SystemRepository().ShortCut(Ord('O'), [ssCtrl]), SystemRepository().ShortCut(Ord('B'), []), ''));
  AddShortCut(NewShortCut('Go to line number', SystemRepository().ShortCut(Ord('O'), [ssCtrl]), SystemRepository().ShortCut(Ord('G'), []), ''));
  AddShortCut(NewShortCut('Marks an inclusive block', SystemRepository().ShortCut(Ord('O'), [ssCtrl]), SystemRepository().ShortCut(Ord('I'), []), ''));
  AddShortCut(NewShortCut('Toggles case of block', SystemRepository().ShortCut(Ord('O'), [ssCtrl]), SystemRepository().ShortCut(Ord('U'), []), ''));
  AddShortCut(NewShortCut('Go to bookmark 0', SystemRepository().ShortCut(Ord('Q'), [ssCtrl]), SystemRepository().ShortCut(Ord('0'), []), ''));
  AddShortCut(NewShortCut('Go to bookmark 1', SystemRepository().ShortCut(Ord('Q'), [ssCtrl]), SystemRepository().ShortCut(Ord('1'), []), ''));
  AddShortCut(NewShortCut('Go to bookmark 2', SystemRepository().ShortCut(Ord('Q'), [ssCtrl]), SystemRepository().ShortCut(Ord('2'), []), ''));
  AddShortCut(NewShortCut('Go to bookmark 3', SystemRepository().ShortCut(Ord('Q'), [ssCtrl]), SystemRepository().ShortCut(Ord('3'), []), ''));
  AddShortCut(NewShortCut('Go to bookmark 4', SystemRepository().ShortCut(Ord('Q'), [ssCtrl]), SystemRepository().ShortCut(Ord('4'), []), ''));
  AddShortCut(NewShortCut('Go to bookmark 5', SystemRepository().ShortCut(Ord('Q'), [ssCtrl]), SystemRepository().ShortCut(Ord('5'), []), ''));
  AddShortCut(NewShortCut('Go to bookmark 6', SystemRepository().ShortCut(Ord('Q'), [ssCtrl]), SystemRepository().ShortCut(Ord('6'), []), ''));
  AddShortCut(NewShortCut('Go to bookmark 7', SystemRepository().ShortCut(Ord('Q'), [ssCtrl]), SystemRepository().ShortCut(Ord('7'), []), ''));
  AddShortCut(NewShortCut('Go to bookmark 8', SystemRepository().ShortCut(Ord('Q'), [ssCtrl]), SystemRepository().ShortCut(Ord('8'), []), ''));
  AddShortCut(NewShortCut('Go to bookmark 9', SystemRepository().ShortCut(Ord('Q'), [ssCtrl]), SystemRepository().ShortCut(Ord('9'), []), ''));
  AddShortCut(NewShortCut('Finds the matching delimiter (forward)', SystemRepository().ShortCut(Ord('Q'), [ssCtrl]), SystemRepository().ShortCut({[}VK_OEM_4, []), ''));
  AddShortCut(NewShortCut('Finds the matching delimiter (backward)', SystemRepository().ShortCut(Ord('Q'), [ssCtrl]), SystemRepository().ShortCut({]}VK_OEM_6, []), ''));
  AddShortCut(NewShortCut('Displays Search Replace dialogue', SystemRepository().ShortCut(Ord('Q'), [ssCtrl]), SystemRepository().ShortCut(Ord('A'), []), ''));
  AddShortCut(NewShortCut('Moves to the beginning of a block', SystemRepository().ShortCut(Ord('Q'), [ssCtrl]), SystemRepository().ShortCut(Ord('B'), []), ''));
  AddShortCut(NewShortCut('Moves to end of file', SystemRepository().ShortCut(Ord('Q'), [ssCtrl]), SystemRepository().ShortCut(Ord('C'), []), ''));
  AddShortCut(NewShortCut('Finds the matching delimiter (forward)', SystemRepository().ShortCut(Ord('Q'), [ssCtrl]), SystemRepository().ShortCut({[}VK_OEM_4, [ssCtrl]), ''));
  AddShortCut(NewShortCut('Finds the matching delimiter (backward)', SystemRepository().ShortCut(Ord('Q'), [ssCtrl]), SystemRepository().ShortCut({]}VK_OEM_6, [ssCtrl]), ''));
  AddShortCut(NewShortCut('Moves to the end of line', SystemRepository().ShortCut(Ord('Q'), [ssCtrl]), SystemRepository().ShortCut(Ord('D'), []), ''));
  AddShortCut(NewShortCut('Moves the cursor to the top of the window', SystemRepository().ShortCut(Ord('Q'), [ssCtrl]), SystemRepository().ShortCut(Ord('E'), []), ''));
  AddShortCut(NewShortCut('Displays Find dialogue', SystemRepository().ShortCut(Ord('Q'), [ssCtrl]), SystemRepository().ShortCut(Ord('F'), []), ''));
  AddShortCut(NewShortCut('Moves to the end of block', SystemRepository().ShortCut(Ord('Q'), [ssCtrl]), SystemRepository().ShortCut(Ord('K'), []), ''));
  AddShortCut(NewShortCut('Method hopping - Toggles between limiting the ssCtrl+Alt navigation shortcuts to the current class, or limiting it to the current unit', SystemRepository().ShortCut(Ord('Q'), [ssCtrl]), SystemRepository().ShortCut(Ord('L'), []), ''));
  AddShortCut(NewShortCut('Moves to previous position', SystemRepository().ShortCut(Ord('Q'), [ssCtrl]), SystemRepository().ShortCut(Ord('P'), []), ''));
  AddShortCut(NewShortCut('Moves to the beginning of a file', SystemRepository().ShortCut(Ord('Q'), [ssCtrl]), SystemRepository().ShortCut(Ord('R'), []), ''));
  AddShortCut(NewShortCut('Moves to the beginning of a line', SystemRepository().ShortCut(Ord('Q'), [ssCtrl]), SystemRepository().ShortCut(Ord('S'), []), ''));
  AddShortCut(NewShortCut('Shifts editor so the current line is at the top of the window', SystemRepository().ShortCut(Ord('Q'), [ssCtrl]), SystemRepository().ShortCut(Ord('T'), []), ''));
  AddShortCut(NewShortCut('Shifts editor so the current line is at the bottom of the window, if possible', SystemRepository().ShortCut(Ord('Q'), [ssCtrl]), SystemRepository().ShortCut(Ord('U'), []), ''));
  AddShortCut(NewShortCut('Go to next item of Messages window', SystemRepository().ShortCut(Ord('Q'), [ssCtrl]), SystemRepository().ShortCut(Ord('W'), []), ''));
  AddShortCut(NewShortCut('Moves the cursor to the bottom of the window', SystemRepository().ShortCut(Ord('Q'), [ssCtrl]), SystemRepository().ShortCut(Ord('X'), []), ''));
  AddShortCut(NewShortCut('Deletes to the end of a line', SystemRepository().ShortCut(Ord('Q'), [ssCtrl]), SystemRepository().ShortCut(Ord('Y'), []), ''));
  AddShortCut(NewShortCut('Displays Search Replace dialogue', SystemRepository().ShortCut(Ord('R'), [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Save File', SystemRepository().ShortCut(Ord('S'), [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Structure Pane: Expand all', SystemRepository().ShortCut(VK_OEM_PLUS, [ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Structure Pane: Collapse all', SystemRepository().ShortCut(VK_OEM_MINUS, [ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Displays Code Parameters popup window', SystemRepository().ShortCut({.}VK_OEM_PERIOD, [ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Invoke Add to uses clause (Find unit in Delphi 2006) window (Refactoring)', SystemRepository().ShortCut(Ord('A'), [ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Displays the Declare Field dialogue', SystemRepository().ShortCut(Ord('D'), [ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Displays Rename refactoring dialogue', SystemRepository().ShortCut(Ord('E'), [ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Display Find in Files dialogue', SystemRepository().ShortCut(Ord('F'), [ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Invoke Project Options window', SystemRepository().ShortCut(VK_F11, [ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Closes all other editor pages', SystemRepository().ShortCut(VK_F4, [ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Runs without debugging', SystemRepository().ShortCut(VK_F9, [ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Invoke Help Insight for the symbol that currently contains the cursor', SystemRepository().ShortCut(Ord('H'), [ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Regions & Code folding: Expands all collapsed regions', SystemRepository().ShortCut(Ord('K'),[ssCtrl, ssShift]), SystemRepository().ShortCut(Ord('A'), []), ''));
  AddShortCut(NewShortCut('Displays the Extract Resource String dialogue', SystemRepository().ShortCut(Ord('L'), [ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Displays the Extract Method dialogue', SystemRepository().ShortCut(Ord('M'), [ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Saves all files', SystemRepository().ShortCut(Ord('S'), [ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Displays the Declare Variable dialogue', SystemRepository().ShortCut(Ord('V'), [ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Displays the Change Params dialogue', SystemRepository().ShortCut(Ord('X'), [ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Redo', SystemRepository().ShortCut(Ord('Z'), [ssCtrl, ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Paste', SystemRepository().ShortCut(Ord('V'), [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Cut selection to clipboard', SystemRepository().ShortCut(Ord('X'), [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Undo', SystemRepository().ShortCut(Ord('Z'), [ssCtrl]), scNone, ''));
  AddShortCut(NewShortCut('Deletes selected block or the character to the right of the cursor', SystemRepository().ShortCut(VK_DELETE, []), scNone, ''));
  (*AddShortCut(NewShortCut('Marks word as a block', SystemRepository().ShortCut(Double Left Click, []), scNone, ''));*)
  AddShortCut(NewShortCut('Moves down one line', SystemRepository().ShortCut(VK_DOWN, []), scNone, ''));
  AddShortCut(NewShortCut('Moves to the end of a line', SystemRepository().ShortCut(VK_END, []), scNone, ''));
  AddShortCut(NewShortCut('Inserts a carriage return / Block completion', SystemRepository().ShortCut(VK_RETURN, []), scNone, ''));
  AddShortCut(NewShortCut('Gives focus to Delphi''s main menu', SystemRepository().ShortCut(VK_F10, []), scNone, ''));
  AddShortCut(NewShortCut('Invoke Object Inspector window', SystemRepository().ShortCut(VK_F11, []), scNone, ''));
  AddShortCut(NewShortCut('Toggle between code view and design view', SystemRepository().ShortCut(VK_F12, []), scNone, ''));
  AddShortCut(NewShortCut('Find next Find/Replace/Incremental search', SystemRepository().ShortCut(VK_F3, []), scNone, ''));
  AddShortCut(NewShortCut('Run program to current cursor position', SystemRepository().ShortCut(VK_F4, []), scNone, ''));
  AddShortCut(NewShortCut('Toggle breakpoint', SystemRepository().ShortCut(VK_F5, []), scNone, ''));
  AddShortCut(NewShortCut('IDE Insight', SystemRepository().ShortCut(VK_F6, []), scNone, ''));
  AddShortCut(NewShortCut('Debugger step into', SystemRepository().ShortCut(VK_F7, []), scNone, ''));
  AddShortCut(NewShortCut('Debugger step over', SystemRepository().ShortCut(VK_F8, []), scNone, ''));
  AddShortCut(NewShortCut('Compiles and runs project in the debugger', SystemRepository().ShortCut(VK_F9, []), scNone, ''));
  AddShortCut(NewShortCut('Moves to the start of a line', SystemRepository().ShortCut(VK_HOME, []), scNone, ''));
  AddShortCut(NewShortCut('Toggles insert/overwrite mode', SystemRepository().ShortCut(VK_INSERT, []), scNone, ''));
  AddShortCut(NewShortCut('Moves the cursor left one column', SystemRepository().ShortCut(VK_LEFT, []), scNone, ''));
  AddShortCut(NewShortCut('Moves down one page', SystemRepository().ShortCut(VK_NEXT, []), scNone, ''));
  AddShortCut(NewShortCut('Moves up one page', SystemRepository().ShortCut(VK_PRIOR, []), scNone, ''));
  AddShortCut(NewShortCut('Moves the cursor right one column', SystemRepository().ShortCut(VK_RIGHT, []), scNone, ''));
  AddShortCut(NewShortCut('Cut selection to clipboard', SystemRepository().ShortCut(VK_DELETE, [ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Displays Add To Project dialogue', SystemRepository().ShortCut(VK_F11, [ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Displays Forms list', SystemRepository().ShortCut(VK_F12, [ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Trace into next source line', SystemRepository().ShortCut(VK_F7, [ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Run until return', SystemRepository().ShortCut(VK_F8, [ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Build project', SystemRepository().ShortCut(VK_F9, [ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Pastes from clipboard', SystemRepository().ShortCut(VK_INSERT, [ssShift]), scNone, ''));
  AddShortCut(NewShortCut('Inserts a blank space', SystemRepository().ShortCut(VK_SPACE, []), scNone, ''));
  AddShortCut(NewShortCut('Inserts a tab / Indents block by the amount specified in the block indent editor setting', SystemRepository().ShortCut(VK_TAB, []), scNone, ''));
  AddShortCut(NewShortCut('Moves up one line', SystemRepository().ShortCut(VK_UP, []), scNone, ''));
end;

initialization
  nick.shortcut.repository.ShortCut.GetShortCutRepository().Add(TDelphiEditorDefaultElement);


end.
