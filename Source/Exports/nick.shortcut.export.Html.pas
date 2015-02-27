unit nick.shortcut.export.Html;

interface

implementation

uses
  nick.shortcut.other.VirtualKeys,
  nick.shortcut.core.ShortcutExport,
  nick.shortcut.repository.ShortcutExport,
  {$IFDEF VER220}
  Forms,
  Classes,
  SysUtils,
  {$ELSE}
  Vcl.Forms,
  System.Classes,
  System.SysUtils,
  {$ENDIF}
  IdStrings;

type
  THtmlShortcutExport = class(TShortcutExport)
  private
    type
      THtmlShortcutData = class(TObject)
      private
        FStreamWriter : TStreamWriter;
        FRowDetails   : TStrings;
        FCellDetails : TStrings;
      public
        constructor Create(const AFileName : string);
        destructor Destroy; override;

        property CellDetails : TStrings read FCellDetails;
        property RowDetails : TStrings read FRowDetails;
      end;
  private
    function GetUserData(const AExportData : Pointer) : THtmlShortcutData;
  public
    class function ExportName() : string; override;

    function FileExtension : string; override;

    function InitialiseExport(const AFileName : string; out AExportData : Pointer) : Boolean; override;
    procedure FinaliseExport(const AExportData : Pointer); override;

    procedure StartHeader(const AExportData : Pointer); override;
    procedure AddHeader(const AExportData : Pointer; const AHeader : string); override;
    procedure EndHeader(const AExportData : Pointer); override;

    procedure StartKey(const AExportData : Pointer; const AVirtualKeyDetail: TVirtualKeyDetail); override;
    procedure EndKey(const AExportData : Pointer); override;

    procedure StartKeyWithModifier(const AExportData : Pointer); override;
    procedure AddKeyWithModifierDetails(const AExportData : Pointer; const ADetails : string; const ADetailsType : TDetailsType); override;
    procedure EndKeyWithModifier(const AExportData : Pointer); override;
  end;


{ THtmlShortcutExport }

class function THtmlShortcutExport.ExportName: string;
begin
  Result := 'HTML';
end;

function THtmlShortcutExport.GetUserData(const AExportData: Pointer): THtmlShortcutData;
begin
  Result := (TObject(AExportData) as THtmlShortcutData);
end;

function THtmlShortcutExport.InitialiseExport(const AFileName : string; out AExportData: Pointer): Boolean;
var
  LExportData: THtmlShortcutData;
begin
  Result := False;
  try
    AExportData := THtmlShortcutData.Create(AFileName);

    LExportData := GetUserData(AExportData);
    LExportData.RowDetails.Clear;
    LExportData.RowDetails.Add('<html>');
    LExportData.RowDetails.Add('<head>');

    LExportData.RowDetails.Add('<script type="text/javascript">');
    LExportData.RowDetails.Add('<!--');

    // From: http://www.imaputz.com/cssStuff/bulletVersion.html
    LExportData.RowDetails.Add('/* http://www.alistapart.com/articles/zebratables/ */');
    LExportData.RowDetails.Add('function removeClassName (elem, className) {');
    LExportData.RowDetails.Add('    elem.className = elem.className.replace(className, "").trim();');
    LExportData.RowDetails.Add('}');
    LExportData.RowDetails.Add('');
    LExportData.RowDetails.Add('function addCSSClass (elem, className) {');
    LExportData.RowDetails.Add('    removeClassName (elem, className);');
    LExportData.RowDetails.Add('    elem.className = (elem.className + " " + className).trim();');
    LExportData.RowDetails.Add('}');
    LExportData.RowDetails.Add('');
    LExportData.RowDetails.Add('String.prototype.trim = function() {');
    LExportData.RowDetails.Add('    return this.replace( /^\s+|\s+$/, "" );');
    LExportData.RowDetails.Add('}');
    LExportData.RowDetails.Add('');
    LExportData.RowDetails.Add('function stripedTable() {');
    LExportData.RowDetails.Add('    if (document.getElementById && document.getElementsByTagName) {');
    LExportData.RowDetails.Add('        var allTables = document.getElementsByTagName(''table'');');
    LExportData.RowDetails.Add('        if (!allTables) { return; }');
    LExportData.RowDetails.Add('');
    LExportData.RowDetails.Add('        for (var i = 0; i < allTables.length; i++) {');
    LExportData.RowDetails.Add('            if (allTables[i].className.match(/[\w\s ]*scrollTable[\w\s ]*/)) {');
    LExportData.RowDetails.Add('                var trs = allTables[i].getElementsByTagName("tr");');
    LExportData.RowDetails.Add('                for (var j = 0; j < trs.length; j++) {');
    LExportData.RowDetails.Add('                    removeClassName(trs[j], ''alternateRow'');');
    LExportData.RowDetails.Add('                    addCSSClass(trs[j], ''normalRow'');');
    LExportData.RowDetails.Add('                }');
    LExportData.RowDetails.Add('                for (var k = 0; k < trs.length; k += 2) {');
    LExportData.RowDetails.Add('                    removeClassName(trs[k], ''normalRow'');');
    LExportData.RowDetails.Add('                    addCSSClass(trs[k], ''alternateRow'');');
    LExportData.RowDetails.Add('                }');
    LExportData.RowDetails.Add('            }');
    LExportData.RowDetails.Add('        }');
    LExportData.RowDetails.Add('    }');
    LExportData.RowDetails.Add('}');
    LExportData.RowDetails.Add('');

    // From: http://kjell.haxx.se/tablelock/
    LExportData.RowDetails.Add('/*****************************************************************');
    LExportData.RowDetails.Add(' Copyright 2014, Kjell.Ericson@haxx.se, version 2014-09-16');
    LExportData.RowDetails.Add('');
    LExportData.RowDetails.Add('The script uses classes for defining what parts to use for scrolling.');
    LExportData.RowDetails.Add('');
    LExportData.RowDetails.Add('Source at: https://github.com/kjellericson/TableLock.git');
    LExportData.RowDetails.Add('');
    LExportData.RowDetails.Add('You shall mark the things:');
    LExportData.RowDetails.Add('');
    LExportData.RowDetails.Add('1) One id for the table.');
    LExportData.RowDetails.Add('2) One class name for to row cells to lock');
    LExportData.RowDetails.Add('3) One class name for the column cells to lock');
    LExportData.RowDetails.Add('4) The upper left cell that moves both ways (I call it "locked").');
    LExportData.RowDetails.Add('');
    LExportData.RowDetails.Add('Set a field to null in order to skip that part.');
    LExportData.RowDetails.Add('');
    LExportData.RowDetails.Add('You init the function by calling:');
    LExportData.RowDetails.Add('');
    LExportData.RowDetails.Add('  TableLock("table_class_name", "row_class_name", "column_class_name", "locked_class_name");');
    LExportData.RowDetails.Add('');
    LExportData.RowDetails.Add('The table is made up like this:');
    LExportData.RowDetails.Add('');
    LExportData.RowDetails.Add(' <table class=''table_class_name''>');
    LExportData.RowDetails.Add('  <tr>');
    LExportData.RowDetails.Add('    <td class=''locked_class_name''>Upper left is moving both wayslocked</td>');
    LExportData.RowDetails.Add('    <td class=''column_class_name''>column 1</td>');
    LExportData.RowDetails.Add('    <td class=''column_class_name''>column 2</td>');
    LExportData.RowDetails.Add('    <td class=''column_class_name''>column 3</td>');
    LExportData.RowDetails.Add('  </tr>');
    LExportData.RowDetails.Add('  <tr>');
    LExportData.RowDetails.Add('    <td class=''row_class_name''>row 1</td>');
    LExportData.RowDetails.Add('    <td>data 1</td>');
    LExportData.RowDetails.Add('    <td>data 2</td>');
    LExportData.RowDetails.Add('    <td>data 3</td>');
    LExportData.RowDetails.Add('  </tr>');
    LExportData.RowDetails.Add('  <tr>');
    LExportData.RowDetails.Add('    <td class=''row_class_name''>row 2</td>');
    LExportData.RowDetails.Add('    <td>data 1</td>');
    LExportData.RowDetails.Add('    <td>data 2</td>');
    LExportData.RowDetails.Add('    <td>data 3</td>');
    LExportData.RowDetails.Add('  </tr>');
    LExportData.RowDetails.Add('</table>');
    LExportData.RowDetails.Add('');
    LExportData.RowDetails.Add('******************************/');
    LExportData.RowDetails.Add('');
    LExportData.RowDetails.Add('TL_tables = new Array();');
    LExportData.RowDetails.Add('');
    LExportData.RowDetails.Add('function TL_settings(table_id, left_class_name, headline_class_name, ');
    LExportData.RowDetails.Add('                     lock_class_name) ');
    LExportData.RowDetails.Add('');
    LExportData.RowDetails.Add('{');
    LExportData.RowDetails.Add('    this.row_elements = new Array();');
    LExportData.RowDetails.Add('    this.col_elements = new Array();');
    LExportData.RowDetails.Add('    this.lock_elements = new Array();');
    LExportData.RowDetails.Add('    this.table_id = table_id;');
    LExportData.RowDetails.Add('    this.left_class_name = left_class_name;');
    LExportData.RowDetails.Add('    this.headline_class_name = headline_class_name;');
    LExportData.RowDetails.Add('    this.lock_class_name = lock_class_name;');
    LExportData.RowDetails.Add('}');
    LExportData.RowDetails.Add('');
    LExportData.RowDetails.Add('function TL_struct(node, oldnode, xpos, ypos)');
    LExportData.RowDetails.Add('{');
    LExportData.RowDetails.Add('    this.node = node;');
    LExportData.RowDetails.Add('    this.oldnode = oldnode;');
    LExportData.RowDetails.Add('    this.x = xpos;');
    LExportData.RowDetails.Add('    this.y = ypos;');
    LExportData.RowDetails.Add('}');
    LExportData.RowDetails.Add('');
    LExportData.RowDetails.Add('function TableLock(table_id, ');
    LExportData.RowDetails.Add('                   left_class_name,');
    LExportData.RowDetails.Add('                   headline_class_name, ');
    LExportData.RowDetails.Add('                   lock_class_name) ');
    LExportData.RowDetails.Add('{');
    LExportData.RowDetails.Add('    var tlt = new TL_settings(table_id, left_class_name, headline_class_name, ');
    LExportData.RowDetails.Add('                   lock_class_name);');
    LExportData.RowDetails.Add('    TableLock_resize(tlt);');
    LExportData.RowDetails.Add('    TL_tables.push(tlt);');
    LExportData.RowDetails.Add('    this.onscroll = TableLock_update;');
    LExportData.RowDetails.Add('    TableLock_update();');
    LExportData.RowDetails.Add('');
    LExportData.RowDetails.Add('    // Detect resize every second');
    LExportData.RowDetails.Add('    window.setInterval(function(){');
    LExportData.RowDetails.Add('        var width = window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth;');
    LExportData.RowDetails.Add('        var height = window.innerHeight || document.documentElement.clientHeight || document.body.clientHeight;');
    LExportData.RowDetails.Add('        if(tlt.innerwidth != width &&');
    LExportData.RowDetails.Add('           tlt.innerheight != height){');
    LExportData.RowDetails.Add('            TableLock_resize(tlt);');
    LExportData.RowDetails.Add('            TableLock_update();');
    LExportData.RowDetails.Add('        }');
    LExportData.RowDetails.Add('    }, 1000);');
    LExportData.RowDetails.Add('}');
    LExportData.RowDetails.Add('');
    LExportData.RowDetails.Add('function TableLock_resize(tlt) ');
    LExportData.RowDetails.Add('{');
    LExportData.RowDetails.Add('    tlt.table_element = document.getElementById(tlt.table_id);');
    LExportData.RowDetails.Add('    if (tlt.table_element == undefined) {');
    LExportData.RowDetails.Add('        alert("TableLock can''t find table " + tlt.table_id);');
    LExportData.RowDetails.Add('        return;');
    LExportData.RowDetails.Add('    }');
    LExportData.RowDetails.Add('');
    LExportData.RowDetails.Add('    // Remove any old objects');
    LExportData.RowDetails.Add('    for(var i = 0; i < tlt.row_elements.length; i++){');
    LExportData.RowDetails.Add('        var obj = tlt.row_elements[i];');
    LExportData.RowDetails.Add('        document.body.removeChild(obj.node);');
    LExportData.RowDetails.Add('    }');
    LExportData.RowDetails.Add('    for(var i = 0; i < tlt.col_elements.length; i++){');
    LExportData.RowDetails.Add('        var obj = tlt.col_elements[i];');
    LExportData.RowDetails.Add('        document.body.removeChild(obj.node);');
    LExportData.RowDetails.Add('    }');
    LExportData.RowDetails.Add('    for(var i = 0; i < tlt.lock_elements.length; i++){');
    LExportData.RowDetails.Add('        var obj = tlt.lock_elements[i];');
    LExportData.RowDetails.Add('        document.body.removeChild(obj.node);');
    LExportData.RowDetails.Add('    }');
    LExportData.RowDetails.Add('');
    LExportData.RowDetails.Add('    // Reset settings');
    LExportData.RowDetails.Add('    tlt.innerwidth = window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth;');
    LExportData.RowDetails.Add('    tlt.innerheight = window.innerHeight || document.documentElement.clientHeight || document.body.clientHeight;');
    LExportData.RowDetails.Add('');
    LExportData.RowDetails.Add('    tlt.last_x = -1;');
    LExportData.RowDetails.Add('    tlt.row_elements = new Array();');
    LExportData.RowDetails.Add('    tlt.col_elements = new Array();');
    LExportData.RowDetails.Add('    tlt.lock_elements = new Array();');
    LExportData.RowDetails.Add('');
    LExportData.RowDetails.Add('    tlt.min_x = 10000;');
    LExportData.RowDetails.Add('    tlt.min_y = 10000;');
    LExportData.RowDetails.Add('');
    LExportData.RowDetails.Add('    tlt.max_x = 0;');
    LExportData.RowDetails.Add('    tlt.max_y = 0;');
    LExportData.RowDetails.Add('');
    LExportData.RowDetails.Add('    var tags = new Array("td", "th");');
    LExportData.RowDetails.Add('    var max = 2000;');
    LExportData.RowDetails.Add('    for(var t = 0; t < tags.length; t++){');
    LExportData.RowDetails.Add('        var tag = tags[t];');
    LExportData.RowDetails.Add('        var elements = tlt.table_element.getElementsByTagName(tag);');
    LExportData.RowDetails.Add('        for(var i = 0; i < elements.length; i++){');
    LExportData.RowDetails.Add('            var node = elements.item(i);');
    LExportData.RowDetails.Add('            var pos = TL_getPos(node);');
    LExportData.RowDetails.Add('            // Store bounderies for table.');
    LExportData.RowDetails.Add('            if (pos.x < tlt.min_x)');
    LExportData.RowDetails.Add('                tlt.min_x = pos.x;');
    LExportData.RowDetails.Add('            if (pos.y < tlt.min_y)');
    LExportData.RowDetails.Add('                tlt.min_y = pos.y;');
    LExportData.RowDetails.Add('                ');
    LExportData.RowDetails.Add('            if (pos.x > tlt.max_x)');
    LExportData.RowDetails.Add('                tlt.max_x = pos.x;');
    LExportData.RowDetails.Add('            if (pos.y > tlt.max_y)');
    LExportData.RowDetails.Add('                tlt.max_y = pos.y;');
    LExportData.RowDetails.Add('');
    LExportData.RowDetails.Add('            for(var j = 0; j < node.attributes.length; j++) {');
    LExportData.RowDetails.Add('                var n = node.attributes.item(j); ');
    LExportData.RowDetails.Add('');
    LExportData.RowDetails.Add('                if(n.nodeName == ''class'') {');
    LExportData.RowDetails.Add('                           ');
    LExportData.RowDetails.Add('                    if ((tlt.left_class_name && n.nodeValue.indexOf(tlt.left_class_name) >= 0) ||');
    LExportData.RowDetails.Add('                        (tlt.lock_class_name && n.nodeValue.indexOf(tlt.lock_class_name) >= 0) ||');
    LExportData.RowDetails.Add('                        (tlt.headline_class_name && n.nodeValue.indexOf(tlt.headline_class_name) >= 0)) {');
    LExportData.RowDetails.Add('                        var newNode = document.createElement("div"); ');
    LExportData.RowDetails.Add('                        for (var p in node.style) {');
    LExportData.RowDetails.Add('                            try {');
    LExportData.RowDetails.Add('                                newNode.style[p] = node.style[p]');
    LExportData.RowDetails.Add('                                    }');
    LExportData.RowDetails.Add('                            catch (e) {');
    LExportData.RowDetails.Add('                            }');
    LExportData.RowDetails.Add('                        }');
    LExportData.RowDetails.Add('                        newNode.innerHTML = node.innerHTML;');
    LExportData.RowDetails.Add('                        newNode.style.height = node.offsetHeight + "px";');
    LExportData.RowDetails.Add('                        newNode.style.width = node.offsetWidth + "px";');
    LExportData.RowDetails.Add('                        newNode.style.position = "absolute";');
    LExportData.RowDetails.Add('                        // newNode.class = node.class;');
    LExportData.RowDetails.Add('                        newNode.style.left = pos.x + "px";');
    LExportData.RowDetails.Add('                        newNode.style.top = pos.y + "px";');
    LExportData.RowDetails.Add('');
    LExportData.RowDetails.Add('                        if (max-- == 0) return;');
    LExportData.RowDetails.Add('                        if (tlt.headline_class_name &&');
    LExportData.RowDetails.Add('                            node.attributes.item(j).nodeValue.indexOf(tlt.headline_class_name) >= 0)');
    LExportData.RowDetails.Add('                            tlt.col_elements.push(new TL_struct(newNode, node, pos.x, pos.y));');
    LExportData.RowDetails.Add('                        else if (tlt.lock_class_name &&');
    LExportData.RowDetails.Add('                                 node.attributes.item(j).nodeValue.indexOf(tlt.lock_class_name) >= 0)');
    LExportData.RowDetails.Add('                            tlt.lock_elements.push(new TL_struct(newNode, node, pos.x, pos.y));');
    LExportData.RowDetails.Add('                        else');
    LExportData.RowDetails.Add('                            tlt.row_elements.push(new TL_struct(newNode, node, pos.x, pos.y));');
    LExportData.RowDetails.Add('                    }');
    LExportData.RowDetails.Add('                }');
    LExportData.RowDetails.Add('            }');
    LExportData.RowDetails.Add('        }');
    LExportData.RowDetails.Add('    }');
    LExportData.RowDetails.Add('');
    LExportData.RowDetails.Add('    for(var i = 0; i < tlt.row_elements.length; i++){');
    LExportData.RowDetails.Add('        var obj = tlt.row_elements[i];');
    LExportData.RowDetails.Add('        //obj.oldnode.parentNode.insertBefore(obj.node, obj.oldnode);');
    LExportData.RowDetails.Add('        document.body.appendChild(obj.node);');
    LExportData.RowDetails.Add('    }');
    LExportData.RowDetails.Add('    for(var i = 0; i < tlt.col_elements.length; i++){');
    LExportData.RowDetails.Add('        var obj = tlt.col_elements[i];');
    LExportData.RowDetails.Add('        document.body.appendChild(obj.node);');
    LExportData.RowDetails.Add('    }');
    LExportData.RowDetails.Add('    for(var i = 0; i < tlt.lock_elements.length; i++){');
    LExportData.RowDetails.Add('        var obj = tlt.lock_elements[i];');
    LExportData.RowDetails.Add('        document.body.appendChild(obj.node);');
    LExportData.RowDetails.Add('    }');
    LExportData.RowDetails.Add(' }');
    LExportData.RowDetails.Add('');
    LExportData.RowDetails.Add('function TableLock_update() ');
    LExportData.RowDetails.Add('{');
    LExportData.RowDetails.Add('    var iebody=(document.compatMode && document.compatMode != "BackCompat")? document.documentElement : document.body;');
    LExportData.RowDetails.Add('    ');
    LExportData.RowDetails.Add('    var scroll_left=document.all? iebody.scrollLeft : pageXOffset;');
    LExportData.RowDetails.Add('    var scroll_top=document.all? iebody.scrollTop : pageYOffset;');
    LExportData.RowDetails.Add('');
    LExportData.RowDetails.Add('    for(var t = 0; t < TL_tables.length; t++){');
    LExportData.RowDetails.Add('        var tlt = TL_tables[t];');
    LExportData.RowDetails.Add('        for(var i = 0; i < tlt.row_elements.length; i++){');
    LExportData.RowDetails.Add('	    var obj = tlt.row_elements[i];');
    LExportData.RowDetails.Add('            var x = obj.x;');
    LExportData.RowDetails.Add('            if (scroll_left > tlt.min_x)');
    LExportData.RowDetails.Add('                x = scroll_left - tlt.min_x + x;');
    LExportData.RowDetails.Add('            if (x > tlt.max_x)');
    LExportData.RowDetails.Add('                x = tlt.max_x;');
    LExportData.RowDetails.Add('	    obj.node.style.left = x + "px";');
    LExportData.RowDetails.Add('	}');
    LExportData.RowDetails.Add('	for(var i = 0; i < tlt.col_elements.length; i++){');
    LExportData.RowDetails.Add('	    var obj = tlt.col_elements[i];');
    LExportData.RowDetails.Add('            var y = obj.y;');
    LExportData.RowDetails.Add('            if (scroll_top > tlt.min_y)');
    LExportData.RowDetails.Add('                y = scroll_top - tlt.min_y + y;');
    LExportData.RowDetails.Add('            if (y > tlt.max_y)');
    LExportData.RowDetails.Add('                y = tlt.max_y;');
    LExportData.RowDetails.Add('            obj.node.style.top = y + "px";');
    LExportData.RowDetails.Add('	}');
    LExportData.RowDetails.Add('	for(var i = 0; i < tlt.lock_elements.length; i++){');
    LExportData.RowDetails.Add('	    var obj = tlt.lock_elements[i];');
    LExportData.RowDetails.Add('            var x = obj.x;');
    LExportData.RowDetails.Add('            if (scroll_left > tlt.min_x)');
    LExportData.RowDetails.Add('                x = scroll_left - tlt.min_x + x;');
    LExportData.RowDetails.Add('            if (x > tlt.max_x)');
    LExportData.RowDetails.Add('                x = tlt.max_x;');
    LExportData.RowDetails.Add('	    obj.node.style.left = x + "px";');
    LExportData.RowDetails.Add('            var y = obj.y;');
    LExportData.RowDetails.Add('            if (scroll_top > tlt.min_y)');
    LExportData.RowDetails.Add('                y = scroll_top - tlt.min_y + y;');
    LExportData.RowDetails.Add('            if (y > tlt.max_y)');
    LExportData.RowDetails.Add('                y = tlt.max_y;');
    LExportData.RowDetails.Add('            obj.node.style.top = y + "px";');
    LExportData.RowDetails.Add('	}');
    LExportData.RowDetails.Add('    }');
    LExportData.RowDetails.Add('}');
    LExportData.RowDetails.Add('');
    LExportData.RowDetails.Add('function TL_getPos( oElement )');
    LExportData.RowDetails.Add('{');
    LExportData.RowDetails.Add('    var y = 0;');
    LExportData.RowDetails.Add('    var x = 0;');
    LExportData.RowDetails.Add('    while( oElement != null ) {');
    LExportData.RowDetails.Add('        y += oElement.offsetTop;');
    LExportData.RowDetails.Add('        x += oElement.offsetLeft;');
    LExportData.RowDetails.Add('        oElement = oElement.offsetParent;');
    LExportData.RowDetails.Add('    }');
    LExportData.RowDetails.Add('    return {x:x, y:y};');
    LExportData.RowDetails.Add('}');
    LExportData.RowDetails.Add('window.onload = function() { stripedTable(); }');
    LExportData.RowDetails.Add('-->');
    LExportData.RowDetails.Add('</script>');

    LExportData.RowDetails.Add('');

    LExportData.RowDetails.Add('<style type="text/css">');
    LExportData.RowDetails.Add('<!--');
    LExportData.RowDetails.Add('/* make TD elements pretty. Provide alternating classes for striping the table */');
    LExportData.RowDetails.Add('/* http://www.alistapart.com/articles/zebratables/                             */');
    LExportData.RowDetails.Add('tbody tr.normalRow td {');
    LExportData.RowDetails.Add('    background: #FFF;');
    LExportData.RowDetails.Add('    border-bottom: none;');
    LExportData.RowDetails.Add('    border-left: none;');
    LExportData.RowDetails.Add('    border-right: 1px solid #CCC;');
    LExportData.RowDetails.Add('    border-top: 1px solid #DDD;');
    LExportData.RowDetails.Add('    padding: 2px 3px 3px 4px');
    LExportData.RowDetails.Add('}');
    LExportData.RowDetails.Add('');
    LExportData.RowDetails.Add('tbody tr.alternateRow td {');
    LExportData.RowDetails.Add('    background: #EEE;');
    LExportData.RowDetails.Add('    border-bottom: none;');
    LExportData.RowDetails.Add('    border-left: none;');
    LExportData.RowDetails.Add('    border-right: 1px solid #CCC;');
    LExportData.RowDetails.Add('    border-top: 1px solid #DDD;');
    LExportData.RowDetails.Add('    padding: 2px 3px 3px 4px');
    LExportData.RowDetails.Add('}');
    LExportData.RowDetails.Add('-->');
    LExportData.RowDetails.Add('</style>');

    LExportData.RowDetails.Add('');

    LExportData.RowDetails.Add('</head>');
//    LExportData.RowDetails.Add('<body>');
    LExportData.RowDetails.Add('<body onload=''TableLock("scrollTable", "locked_column", "locked_row", "locked_row_column");''>');
    LExportData.RowDetails.Add('<div>');
    LExportData.RowDetails.Add('<table border="2" cellpadding="2" cellspacing="0" width="100%" class="scrollTable" id="scrollTable">');

    LExportData.FStreamWriter.WriteLine(LExportData.RowDetails.Text);

    Result := True;
  except
    THtmlShortcutData(AExportData).Free;
  end;
end;

function THtmlShortcutExport.FileExtension: string;
begin
  Result := 'htm';
end;

procedure THtmlShortcutExport.FinaliseExport(const AExportData: Pointer);
var
  LExportData: THtmlShortcutData;
begin
  LExportData := GetUserData(AExportData);
  LExportData.RowDetails.Clear;
  LExportData.RowDetails.Add('</tbody>');
  LExportData.RowDetails.Add('</table>');
  LExportData.RowDetails.Add('</div>');
  LExportData.RowDetails.Add('</body>');
  LExportData.RowDetails.Add('</html>');

  LExportData.FStreamWriter.WriteLine(LExportData.RowDetails.Text);

  LExportData.Free;
end;

procedure THtmlShortcutExport.StartHeader(const AExportData: Pointer);
var
  LExportData: THtmlShortcutData;
begin
  LExportData := GetUserData(AExportData);
  LExportData.RowDetails.Clear;
  LExportData.RowDetails.Add('<thead>');
  LExportData.RowDetails.Add('<tr>');
end;

procedure THtmlShortcutExport.AddHeader(const AExportData: Pointer; const AHeader: string);
var
  LExportData: THtmlShortcutData;
  LHeaderClass: string;
begin
  LExportData := GetUserData(AExportData);

  LHeaderClass := 'locked_row';
  if (LExportData.RowDetails.Count = 0) then
    LHeaderClass := 'locked_row_column';

  LExportData.RowDetails.Add('<th style="background: #C96;" class="' + LHeaderClass + '" id="' + LHeaderClass + '">' + IdStrings.StrHtmlEncode(AHeader) + '</th>');
end;

procedure THtmlShortcutExport.EndHeader(const AExportData: Pointer);
var
  LExportData: THtmlShortcutData;
begin
  LExportData := GetUserData(AExportData);
  LExportData.RowDetails.Add('</tr>');
  LExportData.RowDetails.Add('</thead>');
  LExportData.RowDetails.Add('<tbody>');
  LExportData.FStreamWriter.WriteLine(LExportData.RowDetails.Text);
end;

procedure THtmlShortcutExport.StartKey(const AExportData: Pointer; const AVirtualKeyDetail: TVirtualKeyDetail);
var
  LExportData: THtmlShortcutData;
begin
  LExportData := GetUserData(AExportData);
  LExportData.RowDetails.Clear;
  LExportData.RowDetails.Add('<tr>');

  if (AVirtualKeyDetail.ConstantName <> '') then
    LExportData.RowDetails.Add('<td style="background:#c96;" class="locked_column" id="locked_column">' + IdStrings.StrHtmlEncode(AVirtualKeyDetail.ConstantName) + '</td>')
  else
    LExportData.RowDetails.Add('<td style="background:#c96;" class="locked_column" id="locked_column">' + '$' + IntToHex(AVirtualKeyDetail.Value, 2) + '</td>');

  LExportData.RowDetails.Add('<td>' + IdStrings.StrHtmlEncode(AVirtualKeyDetail.Description) + '</td>');
end;

procedure THtmlShortcutExport.EndKey(const AExportData: Pointer);
var
  LExportData: THtmlShortcutData;
begin
  LExportData := GetUserData(AExportData);
  LExportData.RowDetails.Add('</tr>');
  LExportData.FStreamWriter.WriteLine(LExportData.RowDetails.Text);
end;

procedure THtmlShortcutExport.StartKeyWithModifier(const AExportData: Pointer);
begin
  GetUserData(AExportData).CellDetails.Clear;
end;

procedure THtmlShortcutExport.AddKeyWithModifierDetails(const AExportData: Pointer; const ADetails: string; const ADetailsType: TDetailsType);
var
  LExportData: THtmlShortcutData;
  LSetColor : string;
  LColourClose : string;
begin
  LExportData := GetUserData(AExportData);

  LSetColor := '';
  LColourClose := '';
  if (ADetailsType = TDetailsType.OperatingSystem) then
  begin
    LSetColor := '<font color="FF0000">';
    LColourClose := '</font>';
  end;

  LExportData.CellDetails.Add(LSetColor + IdStrings.StrHtmlEncode(ADetails) + LColourClose);
end;

procedure THtmlShortcutExport.EndKeyWithModifier(const AExportData: Pointer);
var
  LExportData: THtmlShortcutData;
  LString : string;
begin
  LExportData := GetUserData(AExportData);
  LExportData.RowDetails.Add('<td>');

  if (LExportData.CellDetails.Count > 1) then
  begin
    LExportData.RowDetails.Add('<ol>');
    for LString in LExportData.CellDetails do
      LExportData.RowDetails.Add('<li>' +LString + '</li>');

    LExportData.RowDetails.Add('</ol>');
  end
  else if (LExportData.CellDetails.Count = 1) then
  begin
    LExportData.RowDetails.Add(LExportData.CellDetails.Strings[0]);
  end;

  LExportData.RowDetails.Add('</td>');
end;

{ THtmlShortcutExport.TCsvShortcutData }
constructor THtmlShortcutExport.THtmlShortcutData.Create(const AFileName: string);
begin
  inherited Create;

  FStreamWriter := TStreamWriter.Create(AFileName, False, TEncoding.Default, 4096);
  FRowDetails   := TStringList.Create;
  FCellDetails := TStringList.Create;
end;

destructor THtmlShortcutExport.THtmlShortcutData.Destroy;
begin
  FRowDetails.Free;
  FCellDetails.Free;
  FStreamWriter.Free;
  inherited;
end;

initialization
  GetShortcutExportRepository().Add(THtmlShortcutExport);

end.

