unit nick.shortcut.export.Html;

interface

implementation

{$REGION 'Example'}
(*
http://www.w3schools.com/tags/tag_td.asp
http://www.w3schools.com/tags/ref_eventattributes.asp


/*
Crosshair routine
Released into the public domain by John Kaster and Jeff Overcash, 2000
Please submit any enhancements back to the CodeCentral repository
Updated 4/11/2005 by Robert Love to support ASP.NET snippet matrix
*/
function crosshair(iRow,iCol,sColor)
{
  var r, c;
  var obj;
  /* check to see if getElementById exists if not replace with older document.all function */
  if(document.all && !document.getElementById) {
    document.getElementById = function(id) {
         return document.all[id];
    }
  }

  if ( iRow && iCol ) // Crosshair
  {
    for ( r = 0; r <= iRow; r++ )
    {
      id = 'ucSnippetMatrix_RC' + r + '_' + iCol;
      obj = document.getElementById( id );
      if (obj)
        obj.bgColor = sColor;
    }

    for ( c = 0; c <= iCol; c++ )
    {
      id = 'ucSnippetMatrix_RC' + iRow + '_' + c;
      obj = document.getElementById( id );
      if (obj)
        obj.bgColor = sColor;
    }

  }
  else if ( iRow == 0 ) // Doing the whole column
  {
    r = 0;
    id = 'ucSnippetMatrix_RC' + r + '_' + iCol;
    obj = document.getElementById( id );
    while (obj)
    {
      obj.bgColor = sColor;
      r++;
      id = 'ucSnippetMatrix_RC' + r + '_' + iCol;
      obj = document.getElementById( id );
    }
  }
  else if ( iCol == 0 ) // Doing the whole row
  {
    c = 0;
    id = 'ucSnippetMatrix_RC' + iRow + '_' + c;
    obj = document.getElementById( id );
    while (obj)
    {
      obj.bgColor = sColor;
      c++;
      id = 'ucSnippetMatrix_RC' + iRow + '_' + c;
      obj = document.getElementById( id );
    }
  }
}



<table id="ucSnippetMatrix_tblMatrix" border="0" style="border-width:0px;border-style:None;">

    <tr>

        <td id="ucSnippetMatrix_RC0_0" style="background-color:#DDDDDD;">
            Category</td>
        <td id="ucSnippetMatrix_RC0_1" bgcolor="#DDDDDD" style="font-weight:bold;">
            <a onMouseOver="crosshair(0,1,'#FFFF80')" onMouseOut="crosshair(0,1,'#DDDDDD')" href="/Products.aspx?prodid=35">
            All-Access</a>
    </td>
        <td id="ucSnippetMatrix_RC0_2" bgcolor="#DDDDDD" style="font-weight:bold;">
            <a onMouseOver="crosshair(0,2,'#FFFF80')" onMouseOut="crosshair(0,2,'#DDDDDD')" href="/Products.aspx?prodid=49">
            AppWave</a>
    </td>
        <td id="ucSnippetMatrix_RC0_3" bgcolor="#DDDDDD" style="font-weight:bold;">
            <a onMouseOver="crosshair(0,3,'#FFFF80')" onMouseOut="crosshair(0,3,'#DDDDDD')" href="/Products.aspx?prodid=10">
            Blackfish SQL</a>
    </td>
        <td id="ucSnippetMatrix_RC0_4" bgcolor="#DDDDDD" style="font-weight:bold;">
            <a onMouseOver="crosshair(0,4,'#FFFF80')" onMouseOut="crosshair(0,4,'#DDDDDD')" href="/Products.aspx?prodid=2">
            C++Builder</a>
    </td>
        <td id="ucSnippetMatrix_RC0_5" bgcolor="#DDDDDD" style="font-weight:bold;">
            <a onMouseOver="crosshair(0,5,'#FFFF80')" onMouseOut="crosshair(0,5,'#DDDDDD')" href="/Products.aspx?prodid=50">
            CONNECT</a>
    </td>
        <td id="ucSnippetMatrix_RC0_6" bgcolor="#DDDDDD" style="font-weight:bold;">
            <a onMouseOver="crosshair(0,6,'#FFFF80')" onMouseOut="crosshair(0,6,'#DDDDDD')" href="/Products.aspx?prodid=17">
            Change Manager</a>
    </td>
        <td id="ucSnippetMatrix_RC0_7" bgcolor="#DDDDDD" style="font-weight:bold;">
            <a onMouseOver="crosshair(0,7,'#FFFF80')" onMouseOut="crosshair(0,7,'#DDDDDD')" href="/Products.aspx?prodid=21">
            DB Optimizer</a>
    </td>
        <td id="ucSnippetMatrix_RC0_8" bgcolor="#DDDDDD" style="font-weight:bold;">
            <a onMouseOver="crosshair(0,8,'#FFFF80')" onMouseOut="crosshair(0,8,'#DDDDDD')" href="/Products.aspx?prodid=46">
            DB PowerStudio XE</a>
    </td>
        <td id="ucSnippetMatrix_RC0_9" bgcolor="#DDDDDD" style="font-weight:bold;">
            <a onMouseOver="crosshair(0,9,'#FFFF80')" onMouseOut="crosshair(0,9,'#DDDDDD')" href="/Products.aspx?prodid=48">
            DB PowerStudio for DB2</a>
    </td>
        <td id="ucSnippetMatrix_RC0_10" bgcolor="#DDDDDD" style="font-weight:bold;">
            <a onMouseOver="crosshair(0,10,'#FFFF80')" onMouseOut="crosshair(0,10,'#DDDDDD')" href="/Products.aspx?prodid=45">
            DB PowerStudio for Oracle</a>
    </td>
        <td id="ucSnippetMatrix_RC0_11" bgcolor="#DDDDDD" style="font-weight:bold;">
            <a onMouseOver="crosshair(0,11,'#FFFF80')" onMouseOut="crosshair(0,11,'#DDDDDD')" href="/Products.aspx?prodid=44">
            DB PowerStudio for SQL Server</a>
    </td>
        <td id="ucSnippetMatrix_RC0_12" bgcolor="#DDDDDD" style="font-weight:bold;">
            <a onMouseOver="crosshair(0,12,'#FFFF80')" onMouseOut="crosshair(0,12,'#DDDDDD')" href="/Products.aspx?prodid=47">
            DB PowerStudio for Sybase</a>
    </td>
        <td id="ucSnippetMatrix_RC0_13" bgcolor="#DDDDDD" style="font-weight:bold;">
            <a onMouseOver="crosshair(0,13,'#FFFF80')" onMouseOut="crosshair(0,13,'#DDDDDD')" href="/Products.aspx?prodid=23">
            DBArtisan</a>
    </td>
        <td id="ucSnippetMatrix_RC0_14" bgcolor="#DDDDDD" style="font-weight:bold;">
            <a onMouseOver="crosshair(0,14,'#FFFF80')" onMouseOut="crosshair(0,14,'#DDDDDD')" href="/Products.aspx?prodid=1">
            Delphi</a>
    </td>
        <td id="ucSnippetMatrix_RC0_15" bgcolor="#DDDDDD" style="font-weight:bold;">
            <a onMouseOver="crosshair(0,15,'#FFFF80')" onMouseOut="crosshair(0,15,'#DDDDDD')" href="/Products.aspx?prodid=19">
            ER/Studio</a>
    </td>
        <td id="ucSnippetMatrix_RC0_16" bgcolor="#DDDDDD" style="font-weight:bold;">
            <a onMouseOver="crosshair(0,16,'#FFFF80')" onMouseOut="crosshair(0,16,'#DDDDDD')" href="/Products.aspx?prodid=36">
            ER/Studio Business Architect</a>
    </td>
        <td id="ucSnippetMatrix_RC0_17" bgcolor="#DDDDDD" style="font-weight:bold;">
            <a onMouseOver="crosshair(0,17,'#FFFF80')" onMouseOut="crosshair(0,17,'#DDDDDD')" href="/Products.aspx?prodid=37">
            ER/Studio Data Architect</a>
    </td>
        <td id="ucSnippetMatrix_RC0_18" bgcolor="#DDDDDD" style="font-weight:bold;">
            <a onMouseOver="crosshair(0,18,'#FFFF80')" onMouseOut="crosshair(0,18,'#DDDDDD')" href="/Products.aspx?prodid=51">
            ER/Studio Data Architect Professional</a>
    </td>
        <td id="ucSnippetMatrix_RC0_19" bgcolor="#DDDDDD" style="font-weight:bold;">
            <a onMouseOver="crosshair(0,19,'#FFFF80')" onMouseOut="crosshair(0,19,'#DDDDDD')" h
    </tr>
    <tr>

    <td id="ucSnippetMatrix_RC1_0" bgcolor="#DDDDDD" style="font-weight:bold;">
        <a onMouseOver="crosshair(1,0,'#FFFF80')" onMouseOut="crosshair(1,0,'#DDDDDD')" href="/Categories.aspx?catid=4">
        APIs</a>
</td>
    <td id="ucSnippetMatrix_RC1_1" align="right" bgcolor="#DDDDDD">
        <a onMouseOver="crosshair(1,1,'lightgreen')" onMouseOut="crosshair(1,1,'#DDDDDD')" href="/ProdCat.aspx?prodid=35&amp;catid=4">
        0</a>
    <a title="Add a new All-Access submission in the APIs category" onMouseOver="crosshair(1,1,'lightgreen')" onMouseOut="crosshair(1,1,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=35&amp;catid=4">
        +</a>
</td>
    <td id="ucSnippetMatrix_RC1_2" align="right" bgcolor="#DDDDDD">
        <a onMouseOver="crosshair(1,2,'lightgreen')" onMouseOut="crosshair(1,2,'#DDDDDD')" href="/ProdCat.aspx?prodid=49&amp;catid=4">
        0</a>
    <a title="Add a new AppWave submission in the APIs category" onMouseOver="crosshair(1,2,'lightgreen')" onMouseOut="crosshair(1,2,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=49&amp;catid=4">
        +</a>
</td>
    <td id="ucSnippetMatrix_RC1_3" align="right" bgcolor="#DDDDDD">
        <a onMouseOver="crosshair(1,3,'lightgreen')" onMouseOut="crosshair(1,3,'#DDDDDD')" href="/ProdCat.aspx?prodid=10&amp;catid=4">
        0</a>
    <a title="Add a new Blackfish SQL submission in the APIs category" onMouseOver="crosshair(1,3,'lightgreen')" onMouseOut="crosshair(1,3,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=10&amp;catid=4">
        +</a>
</td>
    <td id="ucSnippetMatrix_RC1_4" align="right" bgcolor="#DDDDDD">
        <a onMouseOver="crosshair(1,4,'lightgreen')" onMouseOut="crosshair(1,4,'#DDDDDD')" href="/ProdCat.aspx?prodid=2&amp;catid=4">
        28</a>
    <a title="Add a new C++Builder submission in the APIs category" onMouseOver="crosshair(1,4,'lightgreen')" onMouseOut="crosshair(1,4,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=2&amp;catid=4">
        +</a>
</td>
    <td id="ucSnippetMatrix_RC1_5" align="right" bgcolor="#DDDDDD">
        <a onMouseOver="crosshair(1,5,'lightgreen')" onMouseOut="crosshair(1,5,'#DDDDDD')" href="/ProdCat.aspx?prodid=50&amp;catid=4">
        0</a>
    <a title="Add a new CONNECT submission in the APIs category" onMouseOver="crosshair(1,5,'lightgreen')" onMouseOut="crosshair(1,5,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=50&amp;catid=4">
        +</a>
</td>
    <td id="ucSnippetMatrix_RC1_6" align="right" bgcolor="#DDDDDD">
        <a onMouseOver="crosshair(1,6,'lightgreen')" onMouseOut="crosshair(1,6,'#DDDDDD')" href="/ProdCat.aspx?prodid=17&amp;catid=4">
        0</a>
    <a title="Add a new Change Manager submission in the APIs category" onMouseOver="crosshair(1,6,'lightgreen')" onMouseOut="crosshair(1,6,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=17&amp;catid=4">
        +</a>
</td>
    <td id="ucSnippetMatrix_RC1_7" align="right" bgcolor="#DDDDDD">
        <a onMouseOver="crosshair(1,7,'lightgreen')" onMouseOut="crosshair(1,7,'#DDDDDD')" href="/ProdCat.aspx?prodid=21&amp;catid=4">
        0</a>
    <a title="Add a new DB Optimizer submission in the APIs category" onMouseOver="crosshair(1,7,'lightgreen')" onMouseOut="crosshair(1,7,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=21&amp;catid=4">
        +</a>
</td>
    <td id="ucSnippetMatrix_RC1_8" align="right" bgcolor="#DDDDDD">
        <a onMouseOver="crosshair(1,8,'lightgreen')" onMouseOut="crosshair(1,8,'#DDDDDD')" href="/ProdCat.aspx?prodid=46&amp;catid=4">
        1</a>
    <a title="Add a new DB PowerStudio XE submission in the APIs category" onMouseOver="crosshair(1,8,'lightgreen')" onMouseOut="crosshair(1,8,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=46&amp;catid=4">
        +</a>
</td>
    <td id="ucSnippetMatrix_RC1_9" align="right" bgcolor="#DDDDDD">
        <a onMouseOver="crosshair(1,9,'lightgreen')" onMouseOut="crosshair(1,9,'#DDDDDD')" href="/ProdCat.aspx?prodid=48&amp;catid=4">
        0</a>
    <a title="Add a new DB PowerStudio for DB2 submission in the APIs category" onMouseOver="crosshair(1,9,'lightgreen')" onMouseOut="crosshair(1,9,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Ins">
</tr>
<tr>

<td id="ucSnippetMatrix_RC2_0" bgcolor="#DDDDDD" style="font-weight:bold;">
    <a onMouseOver="crosshair(2,0,'#FFFF80')" onMouseOut="crosshair(2,0,'#DDDDDD')" href="/Categories.aspx?catid=12">
    Best Techniques</a>
</td>
<td id="ucSnippetMatrix_RC2_1" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(2,1,'lightgreen')" onMouseOut="crosshair(2,1,'#DDDDDD')" href="/ProdCat.aspx?prodid=35&amp;catid=12">
    0</a>
<a title="Add a new All-Access submission in the Best Techniques category" onMouseOver="crosshair(2,1,'lightgreen')" onMouseOut="crosshair(2,1,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=35&amp;catid=12">
    +</a>
</td>
<td id="ucSnippetMatrix_RC2_2" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(2,2,'lightgreen')" onMouseOut="crosshair(2,2,'#DDDDDD')" href="/ProdCat.aspx?prodid=49&amp;catid=12">
    0</a>
<a title="Add a new AppWave submission in the Best Techniques category" onMouseOver="crosshair(2,2,'lightgreen')" onMouseOut="crosshair(2,2,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=49&amp;catid=12">
    +</a>
</td>
<td id="ucSnippetMatrix_RC2_3" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(2,3,'lightgreen')" onMouseOut="crosshair(2,3,'#DDDDDD')" href="/ProdCat.aspx?prodid=10&amp;catid=12">
    0</a>
<a title="Add a new Blackfish SQL submission in the Best Techniques category" onMouseOver="crosshair(2,3,'lightgreen')" onMouseOut="crosshair(2,3,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=10&amp;catid=12">
    +</a>
</td>
<td id="ucSnippetMatrix_RC2_4" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(2,4,'lightgreen')" onMouseOut="crosshair(2,4,'#DDDDDD')" href="/ProdCat.aspx?prodid=2&amp;catid=12">
    8</a>
<a title="Add a new C++Builder submission in the Best Techniques category" onMouseOver="crosshair(2,4,'lightgreen')" onMouseOut="crosshair(2,4,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=2&amp;catid=12">
    +</a>
</td>
<td id="ucSnippetMatrix_RC2_5" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(2,5,'lightgreen')" onMouseOut="crosshair(2,5,'#DDDDDD')" href="/ProdCat.aspx?prodid=50&amp;catid=12">
    0</a>
<a title="Add a new CONNECT submission in the Best Techniques category" onMouseOver="crosshair(2,5,'lightgreen')" onMouseOut="crosshair(2,5,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=50&amp;catid=12">
    +</a>
</td>
<td id="ucSnippetMatrix_RC2_6" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(2,6,'lightgreen')" onMouseOut="crosshair(2,6,'#DDDDDD')" href="/ProdCat.aspx?prodid=17&amp;catid=12">
    0</a>
<a title="Add a new Change Manager submission in the Best Techniques category" onMouseOver="crosshair(2,6,'lightgreen')" onMouseOut="crosshair(2,6,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=17&amp;catid=12">
    +</a>
</td>
<td id="ucSnippetMatrix_RC2_7" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(2,7,'lightgreen')" onMouseOut="crosshair(2,7,'#DDDDDD')" href="/ProdCat.aspx?prodid=21&amp;catid=12">
    0</a>
<a title="Add a new DB Optimizer submission in the Best Techniques category" onMouseOver="crosshair(2,7,'lightgreen')" onMouseOut="crosshair(2,7,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=21&amp;catid=12">
    +</a>
</td>
<td id="ucSnippetMatrix_RC2_8" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(2,8,'lightgreen')" onMouseOut="crosshair(2,8,'#DDDDDD')" href="/ProdCat.aspx?prodid=46&amp;catid=12">
    0</a>
<a title="Add a new DB PowerStudio XE submission in the Best Techniques category" onMouseOver="crosshair(2,8,'lightgreen')" onMouseOut="crosshair(2,8,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=46&amp;catid=12">
    +</a>
</td>
<td id="ucSnippetMatrix_RC2_9" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(2,9,'lightgreen')" onMouseOut="crosshair(2,9,'#DDDDDD')" href="/ProdCat.aspx?prodid=48&amp;catid=12">
    0</a>
<a title="Add a new DB PowerStudio for DB2 submission in the Best Techniques category" onMouseO
</tr>
<tr>

<td id="ucSnippetMatrix_RC3_0" bgcolor="#DDDDDD" style="font-weight:bold;">
    <a onMouseOver="crosshair(3,0,'#FFFF80')" onMouseOut="crosshair(3,0,'#DDDDDD')" href="/Categories.aspx?catid=14">
    Binaries</a>
</td>
<td id="ucSnippetMatrix_RC3_1" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(3,1,'lightgreen')" onMouseOut="crosshair(3,1,'#DDDDDD')" href="/ProdCat.aspx?prodid=35&amp;catid=14">
    0</a>
<a title="Add a new All-Access submission in the Binaries category" onMouseOver="crosshair(3,1,'lightgreen')" onMouseOut="crosshair(3,1,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=35&amp;catid=14">
    +</a>
</td>
<td id="ucSnippetMatrix_RC3_2" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(3,2,'lightgreen')" onMouseOut="crosshair(3,2,'#DDDDDD')" href="/ProdCat.aspx?prodid=49&amp;catid=14">
    19</a>
<a title="Add a new AppWave submission in the Binaries category" onMouseOver="crosshair(3,2,'lightgreen')" onMouseOut="crosshair(3,2,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=49&amp;catid=14">
    +</a>
</td>
<td id="ucSnippetMatrix_RC3_3" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(3,3,'lightgreen')" onMouseOut="crosshair(3,3,'#DDDDDD')" href="/ProdCat.aspx?prodid=10&amp;catid=14">
    9</a>
<a title="Add a new Blackfish SQL submission in the Binaries category" onMouseOver="crosshair(3,3,'lightgreen')" onMouseOut="crosshair(3,3,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=10&amp;catid=14">
    +</a>
</td>
<td id="ucSnippetMatrix_RC3_4" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(3,4,'lightgreen')" onMouseOut="crosshair(3,4,'#DDDDDD')" href="/ProdCat.aspx?prodid=2&amp;catid=14">
    128</a>
<a title="Add a new C++Builder submission in the Binaries category" onMouseOver="crosshair(3,4,'lightgreen')" onMouseOut="crosshair(3,4,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=2&amp;catid=14">
    +</a>
</td>
<td id="ucSnippetMatrix_RC3_5" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(3,5,'lightgreen')" onMouseOut="crosshair(3,5,'#DDDDDD')" href="/ProdCat.aspx?prodid=50&amp;catid=14">
    1</a>
<a title="Add a new CONNECT submission in the Binaries category" onMouseOver="crosshair(3,5,'lightgreen')" onMouseOut="crosshair(3,5,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=50&amp;catid=14">
    +</a>
</td>
<td id="ucSnippetMatrix_RC3_6" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(3,6,'lightgreen')" onMouseOut="crosshair(3,6,'#DDDDDD')" href="/ProdCat.aspx?prodid=17&amp;catid=14">
    131</a>
<a title="Add a new Change Manager submission in the Binaries category" onMouseOver="crosshair(3,6,'lightgreen')" onMouseOut="crosshair(3,6,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=17&amp;catid=14">
    +</a>
</td>
<td id="ucSnippetMatrix_RC3_7" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(3,7,'lightgreen')" onMouseOut="crosshair(3,7,'#DDDDDD')" href="/ProdCat.aspx?prodid=21&amp;catid=14">
    90</a>
<a title="Add a new DB Optimizer submission in the Binaries category" onMouseOver="crosshair(3,7,'lightgreen')" onMouseOut="crosshair(3,7,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=21&amp;catid=14">
    +</a>
</td>
<td id="ucSnippetMatrix_RC3_8" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(3,8,'lightgreen')" onMouseOut="crosshair(3,8,'#DDDDDD')" href="/ProdCat.aspx?prodid=46&amp;catid=14">
    6</a>
<a title="Add a new DB PowerStudio XE submission in the Binaries category" onMouseOver="crosshair(3,8,'lightgreen')" onMouseOut="crosshair(3,8,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=46&amp;catid=14">
    +</a>
</td>
<td id="ucSnippetMatrix_RC3_9" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(3,9,'lightgreen')" onMouseOut="crosshair(3,9,'#DDDDDD')" href="/ProdCat.aspx?prodid=48&amp;catid=14">
    12</a>
<a title="Add a new DB PowerStudio for DB2 submission in the Binaries category" onMouseOver="crosshair(3,9,'lightgreen')" onMouseOut="crosshair(3,9,'#D">
</tr>
<tr>

<td id="ucSnippetMatrix_RC4_0" bgcolor="#DDDDDD" style="font-weight:bold;">
    <a onMouseOver="crosshair(4,0,'#FFFF80')" onMouseOut="crosshair(4,0,'#DDDDDD')" href="/Categories.aspx?catid=13">
    Complete Projects</a>
</td>
<td id="ucSnippetMatrix_RC4_1" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(4,1,'lightgreen')" onMouseOut="crosshair(4,1,'#DDDDDD')" href="/ProdCat.aspx?prodid=35&amp;catid=13">
    0</a>
<a title="Add a new All-Access submission in the Complete Projects category" onMouseOver="crosshair(4,1,'lightgreen')" onMouseOut="crosshair(4,1,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=35&amp;catid=13">
    +</a>
</td>
<td id="ucSnippetMatrix_RC4_2" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(4,2,'lightgreen')" onMouseOut="crosshair(4,2,'#DDDDDD')" href="/ProdCat.aspx?prodid=49&amp;catid=13">
    0</a>
<a title="Add a new AppWave submission in the Complete Projects category" onMouseOver="crosshair(4,2,'lightgreen')" onMouseOut="crosshair(4,2,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=49&amp;catid=13">
    +</a>
</td>
<td id="ucSnippetMatrix_RC4_3" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(4,3,'lightgreen')" onMouseOut="crosshair(4,3,'#DDDDDD')" href="/ProdCat.aspx?prodid=10&amp;catid=13">
    0</a>
<a title="Add a new Blackfish SQL submission in the Complete Projects category" onMouseOver="crosshair(4,3,'lightgreen')" onMouseOut="crosshair(4,3,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=10&amp;catid=13">
    +</a>
</td>
<td id="ucSnippetMatrix_RC4_4" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(4,4,'lightgreen')" onMouseOut="crosshair(4,4,'#DDDDDD')" href="/ProdCat.aspx?prodid=2&amp;catid=13">
    68</a>
<a title="Add a new C++Builder submission in the Complete Projects category" onMouseOver="crosshair(4,4,'lightgreen')" onMouseOut="crosshair(4,4,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=2&amp;catid=13">
    +</a>
</td>
<td id="ucSnippetMatrix_RC4_5" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(4,5,'lightgreen')" onMouseOut="crosshair(4,5,'#DDDDDD')" href="/ProdCat.aspx?prodid=50&amp;catid=13">
    0</a>
<a title="Add a new CONNECT submission in the Complete Projects category" onMouseOver="crosshair(4,5,'lightgreen')" onMouseOut="crosshair(4,5,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=50&amp;catid=13">
    +</a>
</td>
<td id="ucSnippetMatrix_RC4_6" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(4,6,'lightgreen')" onMouseOut="crosshair(4,6,'#DDDDDD')" href="/ProdCat.aspx?prodid=17&amp;catid=13">
    0</a>
<a title="Add a new Change Manager submission in the Complete Projects category" onMouseOver="crosshair(4,6,'lightgreen')" onMouseOut="crosshair(4,6,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=17&amp;catid=13">
    +</a>
</td>
<td id="ucSnippetMatrix_RC4_7" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(4,7,'lightgreen')" onMouseOut="crosshair(4,7,'#DDDDDD')" href="/ProdCat.aspx?prodid=21&amp;catid=13">
    0</a>
<a title="Add a new DB Optimizer submission in the Complete Projects category" onMouseOver="crosshair(4,7,'lightgreen')" onMouseOut="crosshair(4,7,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=21&amp;catid=13">
    +</a>
</td>
<td id="ucSnippetMatrix_RC4_8" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(4,8,'lightgreen')" onMouseOut="crosshair(4,8,'#DDDDDD')" href="/ProdCat.aspx?prodid=46&amp;catid=13">
    0</a>
<a title="Add a new DB PowerStudio XE submission in the Complete Projects category" onMouseOver="crosshair(4,8,'lightgreen')" onMouseOut="crosshair(4,8,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=46&amp;catid=13">
    +</a>
</td>
<td id="ucSnippetMatrix_RC4_9" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(4,9,'lightgreen')" onMouseOut="crosshair(4,9,'#DDDDDD')" href="/ProdCat.aspx?prodid=48&amp;catid=13">
    0</a>
<a title="Add a new DB PowerStudio for DB2 submission in the Complete Projec">
</tr>
<tr>

<td id="ucSnippetMatrix_RC5_0" bgcolor="#DDDDDD" style="font-weight:bold;">
    <a onMouseOver="crosshair(5,0,'#FFFF80')" onMouseOut="crosshair(5,0,'#DDDDDD')" href="/Categories.aspx?catid=2">
    Components</a>
</td>
<td id="ucSnippetMatrix_RC5_1" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(5,1,'lightgreen')" onMouseOut="crosshair(5,1,'#DDDDDD')" href="/ProdCat.aspx?prodid=35&amp;catid=2">
    0</a>
<a title="Add a new All-Access submission in the Components category" onMouseOver="crosshair(5,1,'lightgreen')" onMouseOut="crosshair(5,1,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=35&amp;catid=2">
    +</a>
</td>
<td id="ucSnippetMatrix_RC5_2" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(5,2,'lightgreen')" onMouseOut="crosshair(5,2,'#DDDDDD')" href="/ProdCat.aspx?prodid=49&amp;catid=2">
    0</a>
<a title="Add a new AppWave submission in the Components category" onMouseOver="crosshair(5,2,'lightgreen')" onMouseOut="crosshair(5,2,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=49&amp;catid=2">
    +</a>
</td>
<td id="ucSnippetMatrix_RC5_3" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(5,3,'lightgreen')" onMouseOut="crosshair(5,3,'#DDDDDD')" href="/ProdCat.aspx?prodid=10&amp;catid=2">
    0</a>
<a title="Add a new Blackfish SQL submission in the Components category" onMouseOver="crosshair(5,3,'lightgreen')" onMouseOut="crosshair(5,3,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=10&amp;catid=2">
    +</a>
</td>
<td id="ucSnippetMatrix_RC5_4" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(5,4,'lightgreen')" onMouseOut="crosshair(5,4,'#DDDDDD')" href="/ProdCat.aspx?prodid=2&amp;catid=2">
    372</a>
<a title="Add a new C++Builder submission in the Components category" onMouseOver="crosshair(5,4,'lightgreen')" onMouseOut="crosshair(5,4,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=2&amp;catid=2">
    +</a>
</td>
<td id="ucSnippetMatrix_RC5_5" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(5,5,'lightgreen')" onMouseOut="crosshair(5,5,'#DDDDDD')" href="/ProdCat.aspx?prodid=50&amp;catid=2">
    0</a>
<a title="Add a new CONNECT submission in the Components category" onMouseOver="crosshair(5,5,'lightgreen')" onMouseOut="crosshair(5,5,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=50&amp;catid=2">
    +</a>
</td>
<td id="ucSnippetMatrix_RC5_6" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(5,6,'lightgreen')" onMouseOut="crosshair(5,6,'#DDDDDD')" href="/ProdCat.aspx?prodid=17&amp;catid=2">
    0</a>
<a title="Add a new Change Manager submission in the Components category" onMouseOver="crosshair(5,6,'lightgreen')" onMouseOut="crosshair(5,6,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=17&amp;catid=2">
    +</a>
</td>
<td id="ucSnippetMatrix_RC5_7" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(5,7,'lightgreen')" onMouseOut="crosshair(5,7,'#DDDDDD')" href="/ProdCat.aspx?prodid=21&amp;catid=2">
    0</a>
<a title="Add a new DB Optimizer submission in the Components category" onMouseOver="crosshair(5,7,'lightgreen')" onMouseOut="crosshair(5,7,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=21&amp;catid=2">
    +</a>
</td>
<td id="ucSnippetMatrix_RC5_8" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(5,8,'lightgreen')" onMouseOut="crosshair(5,8,'#DDDDDD')" href="/ProdCat.aspx?prodid=46&amp;catid=2">
    0</a>
<a title="Add a new DB PowerStudio XE submission in the Components category" onMouseOver="crosshair(5,8,'lightgreen')" onMouseOut="crosshair(5,8,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=46&amp;catid=2">
    +</a>
</td>
<td id="ucSnippetMatrix_RC5_9" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(5,9,'lightgreen')" onMouseOut="crosshair(5,9,'#DDDDDD')" href="/ProdCat.aspx?prodid=48&amp;catid=2">
    0</a>
<a title="Add a new DB PowerStudio for DB2 submission in the Components category" onMouseOver="crosshair(5,9,'lightgreen')" onMouseOut="crosshair(5,9,'#DDDD">
</tr>
<tr>

<td id="ucSnippetMatrix_RC6_0" bgcolor="#DDDDDD" style="font-weight:bold;">
    <a onMouseOver="crosshair(6,0,'#FFFF80')" onMouseOut="crosshair(6,0,'#DDDDDD')" href="/Categories.aspx?catid=3">
    Database</a>
</td>
<td id="ucSnippetMatrix_RC6_1" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(6,1,'lightgreen')" onMouseOut="crosshair(6,1,'#DDDDDD')" href="/ProdCat.aspx?prodid=35&amp;catid=3">
    0</a>
<a title="Add a new All-Access submission in the Database category" onMouseOver="crosshair(6,1,'lightgreen')" onMouseOut="crosshair(6,1,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=35&amp;catid=3">
    +</a>
</td>
<td id="ucSnippetMatrix_RC6_2" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(6,2,'lightgreen')" onMouseOut="crosshair(6,2,'#DDDDDD')" href="/ProdCat.aspx?prodid=49&amp;catid=3">
    0</a>
<a title="Add a new AppWave submission in the Database category" onMouseOver="crosshair(6,2,'lightgreen')" onMouseOut="crosshair(6,2,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=49&amp;catid=3">
    +</a>
</td>
<td id="ucSnippetMatrix_RC6_3" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(6,3,'lightgreen')" onMouseOut="crosshair(6,3,'#DDDDDD')" href="/ProdCat.aspx?prodid=10&amp;catid=3">
    0</a>
<a title="Add a new Blackfish SQL submission in the Database category" onMouseOver="crosshair(6,3,'lightgreen')" onMouseOut="crosshair(6,3,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=10&amp;catid=3">
    +</a>
</td>
<td id="ucSnippetMatrix_RC6_4" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(6,4,'lightgreen')" onMouseOut="crosshair(6,4,'#DDDDDD')" href="/ProdCat.aspx?prodid=2&amp;catid=3">
    44</a>
<a title="Add a new C++Builder submission in the Database category" onMouseOver="crosshair(6,4,'lightgreen')" onMouseOut="crosshair(6,4,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=2&amp;catid=3">
    +</a>
</td>
<td id="ucSnippetMatrix_RC6_5" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(6,5,'lightgreen')" onMouseOut="crosshair(6,5,'#DDDDDD')" href="/ProdCat.aspx?prodid=50&amp;catid=3">
    0</a>
<a title="Add a new CONNECT submission in the Database category" onMouseOver="crosshair(6,5,'lightgreen')" onMouseOut="crosshair(6,5,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=50&amp;catid=3">
    +</a>
</td>
<td id="ucSnippetMatrix_RC6_6" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(6,6,'lightgreen')" onMouseOut="crosshair(6,6,'#DDDDDD')" href="/ProdCat.aspx?prodid=17&amp;catid=3">
    0</a>
<a title="Add a new Change Manager submission in the Database category" onMouseOver="crosshair(6,6,'lightgreen')" onMouseOut="crosshair(6,6,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=17&amp;catid=3">
    +</a>
</td>
<td id="ucSnippetMatrix_RC6_7" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(6,7,'lightgreen')" onMouseOut="crosshair(6,7,'#DDDDDD')" href="/ProdCat.aspx?prodid=21&amp;catid=3">
    0</a>
<a title="Add a new DB Optimizer submission in the Database category" onMouseOver="crosshair(6,7,'lightgreen')" onMouseOut="crosshair(6,7,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=21&amp;catid=3">
    +</a>
</td>
<td id="ucSnippetMatrix_RC6_8" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(6,8,'lightgreen')" onMouseOut="crosshair(6,8,'#DDDDDD')" href="/ProdCat.aspx?prodid=46&amp;catid=3">
    0</a>
<a title="Add a new DB PowerStudio XE submission in the Database category" onMouseOver="crosshair(6,8,'lightgreen')" onMouseOut="crosshair(6,8,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=46&amp;catid=3">
    +</a>
</td>
<td id="ucSnippetMatrix_RC6_9" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(6,9,'lightgreen')" onMouseOut="crosshair(6,9,'#DDDDDD')" href="/ProdCat.aspx?prodid=48&amp;catid=3">
    0</a>
<a title="Add a new DB PowerStudio for DB2 submission in the Database category" onMouseOver="crosshair(6,9,'lightgreen')" onMouseOut="crosshair(6,9,'#DDDDDD')" class="atombtn"
</tr>
<tr>

<td id="ucSnippetMatrix_RC7_0" bgcolor="#DDDDDD" style="font-weight:bold;">
    <a onMouseOver="crosshair(7,0,'#FFFF80')" onMouseOut="crosshair(7,0,'#DDDDDD')" href="/Categories.aspx?catid=9">
    Documentation</a>
</td>
<td id="ucSnippetMatrix_RC7_1" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(7,1,'lightgreen')" onMouseOut="crosshair(7,1,'#DDDDDD')" href="/ProdCat.aspx?prodid=35&amp;catid=9">
    0</a>
<a title="Add a new All-Access submission in the Documentation category" onMouseOver="crosshair(7,1,'lightgreen')" onMouseOut="crosshair(7,1,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=35&amp;catid=9">
    +</a>
</td>
<td id="ucSnippetMatrix_RC7_2" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(7,2,'lightgreen')" onMouseOut="crosshair(7,2,'#DDDDDD')" href="/ProdCat.aspx?prodid=49&amp;catid=9">
    0</a>
<a title="Add a new AppWave submission in the Documentation category" onMouseOver="crosshair(7,2,'lightgreen')" onMouseOut="crosshair(7,2,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=49&amp;catid=9">
    +</a>
</td>
<td id="ucSnippetMatrix_RC7_3" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(7,3,'lightgreen')" onMouseOut="crosshair(7,3,'#DDDDDD')" href="/ProdCat.aspx?prodid=10&amp;catid=9">
    0</a>
<a title="Add a new Blackfish SQL submission in the Documentation category" onMouseOver="crosshair(7,3,'lightgreen')" onMouseOut="crosshair(7,3,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=10&amp;catid=9">
    +</a>
</td>
<td id="ucSnippetMatrix_RC7_4" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(7,4,'lightgreen')" onMouseOut="crosshair(7,4,'#DDDDDD')" href="/ProdCat.aspx?prodid=2&amp;catid=9">
    15</a>
<a title="Add a new C++Builder submission in the Documentation category" onMouseOver="crosshair(7,4,'lightgreen')" onMouseOut="crosshair(7,4,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=2&amp;catid=9">
    +</a>
</td>
<td id="ucSnippetMatrix_RC7_5" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(7,5,'lightgreen')" onMouseOut="crosshair(7,5,'#DDDDDD')" href="/ProdCat.aspx?prodid=50&amp;catid=9">
    0</a>
<a title="Add a new CONNECT submission in the Documentation category" onMouseOver="crosshair(7,5,'lightgreen')" onMouseOut="crosshair(7,5,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=50&amp;catid=9">
    +</a>
</td>
<td id="ucSnippetMatrix_RC7_6" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(7,6,'lightgreen')" onMouseOut="crosshair(7,6,'#DDDDDD')" href="/ProdCat.aspx?prodid=17&amp;catid=9">
    1</a>
<a title="Add a new Change Manager submission in the Documentation category" onMouseOver="crosshair(7,6,'lightgreen')" onMouseOut="crosshair(7,6,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=17&amp;catid=9">
    +</a>
</td>
<td id="ucSnippetMatrix_RC7_7" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(7,7,'lightgreen')" onMouseOut="crosshair(7,7,'#DDDDDD')" href="/ProdCat.aspx?prodid=21&amp;catid=9">
    1</a>
<a title="Add a new DB Optimizer submission in the Documentation category" onMouseOver="crosshair(7,7,'lightgreen')" onMouseOut="crosshair(7,7,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=21&amp;catid=9">
    +</a>
</td>
<td id="ucSnippetMatrix_RC7_8" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(7,8,'lightgreen')" onMouseOut="crosshair(7,8,'#DDDDDD')" href="/ProdCat.aspx?prodid=46&amp;catid=9">
    1</a>
<a title="Add a new DB PowerStudio XE submission in the Documentation category" onMouseOver="crosshair(7,8,'lightgreen')" onMouseOut="crosshair(7,8,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=46&amp;catid=9">
    +</a>
</td>
<td id="ucSnippetMatrix_RC7_9" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(7,9,'lightgreen')" onMouseOut="crosshair(7,9,'#DDDDDD')" href="/ProdCat.aspx?prodid=48&amp;catid=9">
    0</a>
<a title="Add a new DB PowerStudio for DB2 submission in the Documentation category" onMouseOver="crosshair(7,9,'lightgreen')" onM
</tr>
<tr>

<td id="ucSnippetMatrix_RC8_0" bgcolor="#DDDDDD" style="font-weight:bold;">
    <a onMouseOver="crosshair(8,0,'#FFFF80')" onMouseOut="crosshair(8,0,'#DDDDDD')" href="/Categories.aspx?catid=16">
    EJBs</a>
</td>
<td id="ucSnippetMatrix_RC8_1" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(8,1,'lightgreen')" onMouseOut="crosshair(8,1,'#DDDDDD')" href="/ProdCat.aspx?prodid=35&amp;catid=16">
    0</a>
<a title="Add a new All-Access submission in the EJBs category" onMouseOver="crosshair(8,1,'lightgreen')" onMouseOut="crosshair(8,1,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=35&amp;catid=16">
    +</a>
</td>
<td id="ucSnippetMatrix_RC8_2" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(8,2,'lightgreen')" onMouseOut="crosshair(8,2,'#DDDDDD')" href="/ProdCat.aspx?prodid=49&amp;catid=16">
    0</a>
<a title="Add a new AppWave submission in the EJBs category" onMouseOver="crosshair(8,2,'lightgreen')" onMouseOut="crosshair(8,2,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=49&amp;catid=16">
    +</a>
</td>
<td id="ucSnippetMatrix_RC8_3" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(8,3,'lightgreen')" onMouseOut="crosshair(8,3,'#DDDDDD')" href="/ProdCat.aspx?prodid=10&amp;catid=16">
    0</a>
<a title="Add a new Blackfish SQL submission in the EJBs category" onMouseOver="crosshair(8,3,'lightgreen')" onMouseOut="crosshair(8,3,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=10&amp;catid=16">
    +</a>
</td>
<td id="ucSnippetMatrix_RC8_4" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(8,4,'lightgreen')" onMouseOut="crosshair(8,4,'#DDDDDD')" href="/ProdCat.aspx?prodid=2&amp;catid=16">
    3</a>
<a title="Add a new C++Builder submission in the EJBs category" onMouseOver="crosshair(8,4,'lightgreen')" onMouseOut="crosshair(8,4,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=2&amp;catid=16">
    +</a>
</td>
<td id="ucSnippetMatrix_RC8_5" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(8,5,'lightgreen')" onMouseOut="crosshair(8,5,'#DDDDDD')" href="/ProdCat.aspx?prodid=50&amp;catid=16">
    0</a>
<a title="Add a new CONNECT submission in the EJBs category" onMouseOver="crosshair(8,5,'lightgreen')" onMouseOut="crosshair(8,5,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=50&amp;catid=16">
    +</a>
</td>
<td id="ucSnippetMatrix_RC8_6" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(8,6,'lightgreen')" onMouseOut="crosshair(8,6,'#DDDDDD')" href="/ProdCat.aspx?prodid=17&amp;catid=16">
    0</a>
<a title="Add a new Change Manager submission in the EJBs category" onMouseOver="crosshair(8,6,'lightgreen')" onMouseOut="crosshair(8,6,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=17&amp;catid=16">
    +</a>
</td>
<td id="ucSnippetMatrix_RC8_7" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(8,7,'lightgreen')" onMouseOut="crosshair(8,7,'#DDDDDD')" href="/ProdCat.aspx?prodid=21&amp;catid=16">
    0</a>
<a title="Add a new DB Optimizer submission in the EJBs category" onMouseOver="crosshair(8,7,'lightgreen')" onMouseOut="crosshair(8,7,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=21&amp;catid=16">
    +</a>
</td>
<td id="ucSnippetMatrix_RC8_8" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(8,8,'lightgreen')" onMouseOut="crosshair(8,8,'#DDDDDD')" href="/ProdCat.aspx?prodid=46&amp;catid=16">
    0</a>
<a title="Add a new DB PowerStudio XE submission in the EJBs category" onMouseOver="crosshair(8,8,'lightgreen')" onMouseOut="crosshair(8,8,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=46&amp;catid=16">
    +</a>
</td>
<td id="ucSnippetMatrix_RC8_9" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(8,9,'lightgreen')" onMouseOut="crosshair(8,9,'#DDDDDD')" href="/ProdCat.aspx?prodid=48&amp;catid=16">
    0</a>
<a title="Add a new DB PowerStudio for DB2 submission in the EJBs category" onMouseOver="crosshair(8,9,'lightgreen')" onMouseOut="crosshair(8,9,'#DDDDDD')" class="atombtn" href="http://ccedit.em">
</tr>
<tr>

<td id="ucSnippetMatrix_RC9_0" bgcolor="#DDDDDD" style="font-weight:bold;">
    <a onMouseOver="crosshair(9,0,'#FFFF80')" onMouseOut="crosshair(9,0,'#DDDDDD')" href="/Categories.aspx?catid=15">
    JavaBeans</a>
</td>
<td id="ucSnippetMatrix_RC9_1" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(9,1,'lightgreen')" onMouseOut="crosshair(9,1,'#DDDDDD')" href="/ProdCat.aspx?prodid=35&amp;catid=15">
    0</a>
<a title="Add a new All-Access submission in the JavaBeans category" onMouseOver="crosshair(9,1,'lightgreen')" onMouseOut="crosshair(9,1,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=35&amp;catid=15">
    +</a>
</td>
<td id="ucSnippetMatrix_RC9_2" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(9,2,'lightgreen')" onMouseOut="crosshair(9,2,'#DDDDDD')" href="/ProdCat.aspx?prodid=49&amp;catid=15">
    0</a>
<a title="Add a new AppWave submission in the JavaBeans category" onMouseOver="crosshair(9,2,'lightgreen')" onMouseOut="crosshair(9,2,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=49&amp;catid=15">
    +</a>
</td>
<td id="ucSnippetMatrix_RC9_3" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(9,3,'lightgreen')" onMouseOut="crosshair(9,3,'#DDDDDD')" href="/ProdCat.aspx?prodid=10&amp;catid=15">
    0</a>
<a title="Add a new Blackfish SQL submission in the JavaBeans category" onMouseOver="crosshair(9,3,'lightgreen')" onMouseOut="crosshair(9,3,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=10&amp;catid=15">
    +</a>
</td>
<td id="ucSnippetMatrix_RC9_4" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(9,4,'lightgreen')" onMouseOut="crosshair(9,4,'#DDDDDD')" href="/ProdCat.aspx?prodid=2&amp;catid=15">
    0</a>
<a title="Add a new C++Builder submission in the JavaBeans category" onMouseOver="crosshair(9,4,'lightgreen')" onMouseOut="crosshair(9,4,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=2&amp;catid=15">
    +</a>
</td>
<td id="ucSnippetMatrix_RC9_5" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(9,5,'lightgreen')" onMouseOut="crosshair(9,5,'#DDDDDD')" href="/ProdCat.aspx?prodid=50&amp;catid=15">
    0</a>
<a title="Add a new CONNECT submission in the JavaBeans category" onMouseOver="crosshair(9,5,'lightgreen')" onMouseOut="crosshair(9,5,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=50&amp;catid=15">
    +</a>
</td>
<td id="ucSnippetMatrix_RC9_6" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(9,6,'lightgreen')" onMouseOut="crosshair(9,6,'#DDDDDD')" href="/ProdCat.aspx?prodid=17&amp;catid=15">
    0</a>
<a title="Add a new Change Manager submission in the JavaBeans category" onMouseOver="crosshair(9,6,'lightgreen')" onMouseOut="crosshair(9,6,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=17&amp;catid=15">
    +</a>
</td>
<td id="ucSnippetMatrix_RC9_7" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(9,7,'lightgreen')" onMouseOut="crosshair(9,7,'#DDDDDD')" href="/ProdCat.aspx?prodid=21&amp;catid=15">
    0</a>
<a title="Add a new DB Optimizer submission in the JavaBeans category" onMouseOver="crosshair(9,7,'lightgreen')" onMouseOut="crosshair(9,7,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=21&amp;catid=15">
    +</a>
</td>
<td id="ucSnippetMatrix_RC9_8" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(9,8,'lightgreen')" onMouseOut="crosshair(9,8,'#DDDDDD')" href="/ProdCat.aspx?prodid=46&amp;catid=15">
    0</a>
<a title="Add a new DB PowerStudio XE submission in the JavaBeans category" onMouseOver="crosshair(9,8,'lightgreen')" onMouseOut="crosshair(9,8,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=46&amp;catid=15">
    +</a>
</td>
<td id="ucSnippetMatrix_RC9_9" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(9,9,'lightgreen')" onMouseOut="crosshair(9,9,'#DDDDDD')" href="/ProdCat.aspx?prodid=48&amp;catid=15">
    0</a>
<a title="Add a new DB PowerStudio for DB2 submission in the JavaBeans category" onMouseOver="crosshair(9,9,'lightgreen')" onMouseOut="crosshair(9,9,">
</tr>
<tr>

<td id="ucSnippetMatrix_RC10_0" bgcolor="#DDDDDD" style="font-weight:bold;">
    <a onMouseOver="crosshair(10,0,'#FFFF80')" onMouseOut="crosshair(10,0,'#DDDDDD')" href="/Categories.aspx?catid=19">
    Live Templates</a>
</td>
<td id="ucSnippetMatrix_RC10_1" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(10,1,'lightgreen')" onMouseOut="crosshair(10,1,'#DDDDDD')" href="/ProdCat.aspx?prodid=35&amp;catid=19">
    0</a>
<a title="Add a new All-Access submission in the Live Templates category" onMouseOver="crosshair(10,1,'lightgreen')" onMouseOut="crosshair(10,1,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=35&amp;catid=19">
    +</a>
</td>
<td id="ucSnippetMatrix_RC10_2" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(10,2,'lightgreen')" onMouseOut="crosshair(10,2,'#DDDDDD')" href="/ProdCat.aspx?prodid=49&amp;catid=19">
    0</a>
<a title="Add a new AppWave submission in the Live Templates category" onMouseOver="crosshair(10,2,'lightgreen')" onMouseOut="crosshair(10,2,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=49&amp;catid=19">
    +</a>
</td>
<td id="ucSnippetMatrix_RC10_3" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(10,3,'lightgreen')" onMouseOut="crosshair(10,3,'#DDDDDD')" href="/ProdCat.aspx?prodid=10&amp;catid=19">
    0</a>
<a title="Add a new Blackfish SQL submission in the Live Templates category" onMouseOver="crosshair(10,3,'lightgreen')" onMouseOut="crosshair(10,3,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=10&amp;catid=19">
    +</a>
</td>
<td id="ucSnippetMatrix_RC10_4" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(10,4,'lightgreen')" onMouseOut="crosshair(10,4,'#DDDDDD')" href="/ProdCat.aspx?prodid=2&amp;catid=19">
    2</a>
<a title="Add a new C++Builder submission in the Live Templates category" onMouseOver="crosshair(10,4,'lightgreen')" onMouseOut="crosshair(10,4,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=2&amp;catid=19">
    +</a>
</td>
<td id="ucSnippetMatrix_RC10_5" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(10,5,'lightgreen')" onMouseOut="crosshair(10,5,'#DDDDDD')" href="/ProdCat.aspx?prodid=50&amp;catid=19">
    0</a>
<a title="Add a new CONNECT submission in the Live Templates category" onMouseOver="crosshair(10,5,'lightgreen')" onMouseOut="crosshair(10,5,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=50&amp;catid=19">
    +</a>
</td>
<td id="ucSnippetMatrix_RC10_6" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(10,6,'lightgreen')" onMouseOut="crosshair(10,6,'#DDDDDD')" href="/ProdCat.aspx?prodid=17&amp;catid=19">
    0</a>
<a title="Add a new Change Manager submission in the Live Templates category" onMouseOver="crosshair(10,6,'lightgreen')" onMouseOut="crosshair(10,6,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=17&amp;catid=19">
    +</a>
</td>
<td id="ucSnippetMatrix_RC10_7" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(10,7,'lightgreen')" onMouseOut="crosshair(10,7,'#DDDDDD')" href="/ProdCat.aspx?prodid=21&amp;catid=19">
    0</a>
<a title="Add a new DB Optimizer submission in the Live Templates category" onMouseOver="crosshair(10,7,'lightgreen')" onMouseOut="crosshair(10,7,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=21&amp;catid=19">
    +</a>
</td>
<td id="ucSnippetMatrix_RC10_8" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(10,8,'lightgreen')" onMouseOut="crosshair(10,8,'#DDDDDD')" href="/ProdCat.aspx?prodid=46&amp;catid=19">
    0</a>
<a title="Add a new DB PowerStudio XE submission in the Live Templates category" onMouseOver="crosshair(10,8,'lightgreen')" onMouseOut="crosshair(10,8,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=46&amp;catid=19">
    +</a>
</td>
<td id="ucSnippetMatrix_RC10_9" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(10,9,'lightgreen')" onMouseOut="crosshair(10,9,'#DDDDDD')" href="/ProdCat.aspx?prodid=48&amp;catid=19">
    0</a>
<a title="Add a new DB PowerStudio for DB2 submission in t">
</tr>
<tr>

<td id="ucSnippetMatrix_RC11_0" bgcolor="#DDDDDD" style="font-weight:bold;">
    <a onMouseOver="crosshair(11,0,'#FFFF80')" onMouseOut="crosshair(11,0,'#DDDDDD')" href="/Categories.aspx?catid=22">
    Macros</a>
</td>
<td id="ucSnippetMatrix_RC11_1" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(11,1,'lightgreen')" onMouseOut="crosshair(11,1,'#DDDDDD')" href="/ProdCat.aspx?prodid=35&amp;catid=22">
    0</a>
<a title="Add a new All-Access submission in the Macros category" onMouseOver="crosshair(11,1,'lightgreen')" onMouseOut="crosshair(11,1,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=35&amp;catid=22">
    +</a>
</td>
<td id="ucSnippetMatrix_RC11_2" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(11,2,'lightgreen')" onMouseOut="crosshair(11,2,'#DDDDDD')" href="/ProdCat.aspx?prodid=49&amp;catid=22">
    0</a>
<a title="Add a new AppWave submission in the Macros category" onMouseOver="crosshair(11,2,'lightgreen')" onMouseOut="crosshair(11,2,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=49&amp;catid=22">
    +</a>
</td>
<td id="ucSnippetMatrix_RC11_3" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(11,3,'lightgreen')" onMouseOut="crosshair(11,3,'#DDDDDD')" href="/ProdCat.aspx?prodid=10&amp;catid=22">
    0</a>
<a title="Add a new Blackfish SQL submission in the Macros category" onMouseOver="crosshair(11,3,'lightgreen')" onMouseOut="crosshair(11,3,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=10&amp;catid=22">
    +</a>
</td>
<td id="ucSnippetMatrix_RC11_4" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(11,4,'lightgreen')" onMouseOut="crosshair(11,4,'#DDDDDD')" href="/ProdCat.aspx?prodid=2&amp;catid=22">
    0</a>
<a title="Add a new C++Builder submission in the Macros category" onMouseOver="crosshair(11,4,'lightgreen')" onMouseOut="crosshair(11,4,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=2&amp;catid=22">
    +</a>
</td>
<td id="ucSnippetMatrix_RC11_5" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(11,5,'lightgreen')" onMouseOut="crosshair(11,5,'#DDDDDD')" href="/ProdCat.aspx?prodid=50&amp;catid=22">
    0</a>
<a title="Add a new CONNECT submission in the Macros category" onMouseOver="crosshair(11,5,'lightgreen')" onMouseOut="crosshair(11,5,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=50&amp;catid=22">
    +</a>
</td>
<td id="ucSnippetMatrix_RC11_6" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(11,6,'lightgreen')" onMouseOut="crosshair(11,6,'#DDDDDD')" href="/ProdCat.aspx?prodid=17&amp;catid=22">
    0</a>
<a title="Add a new Change Manager submission in the Macros category" onMouseOver="crosshair(11,6,'lightgreen')" onMouseOut="crosshair(11,6,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=17&amp;catid=22">
    +</a>
</td>
<td id="ucSnippetMatrix_RC11_7" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(11,7,'lightgreen')" onMouseOut="crosshair(11,7,'#DDDDDD')" href="/ProdCat.aspx?prodid=21&amp;catid=22">
    0</a>
<a title="Add a new DB Optimizer submission in the Macros category" onMouseOver="crosshair(11,7,'lightgreen')" onMouseOut="crosshair(11,7,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=21&amp;catid=22">
    +</a>
</td>
<td id="ucSnippetMatrix_RC11_8" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(11,8,'lightgreen')" onMouseOut="crosshair(11,8,'#DDDDDD')" href="/ProdCat.aspx?prodid=46&amp;catid=22">
    0</a>
<a title="Add a new DB PowerStudio XE submission in the Macros category" onMouseOver="crosshair(11,8,'lightgreen')" onMouseOut="crosshair(11,8,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=46&amp;catid=22">
    +</a>
</td>
<td id="ucSnippetMatrix_RC11_9" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(11,9,'lightgreen')" onMouseOut="crosshair(11,9,'#DDDDDD')" href="/ProdCat.aspx?prodid=48&amp;catid=22">
    0</a>
<a title="Add a new DB PowerStudio for DB2 submission in the Macros category" onMouseOver="crosshair(11,9,'lightgreen')" onMouseOu
</tr>
<tr>

<td id="ucSnippetMatrix_RC12_0" bgcolor="#DDDDDD" style="font-weight:bold;">
    <a onMouseOver="crosshair(12,0,'#FFFF80')" onMouseOut="crosshair(12,0,'#DDDDDD')" href="/Categories.aspx?catid=17">
    Models</a>
</td>
<td id="ucSnippetMatrix_RC12_1" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(12,1,'lightgreen')" onMouseOut="crosshair(12,1,'#DDDDDD')" href="/ProdCat.aspx?prodid=35&amp;catid=17">
    0</a>
<a title="Add a new All-Access submission in the Models category" onMouseOver="crosshair(12,1,'lightgreen')" onMouseOut="crosshair(12,1,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=35&amp;catid=17">
    +</a>
</td>
<td id="ucSnippetMatrix_RC12_2" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(12,2,'lightgreen')" onMouseOut="crosshair(12,2,'#DDDDDD')" href="/ProdCat.aspx?prodid=49&amp;catid=17">
    0</a>
<a title="Add a new AppWave submission in the Models category" onMouseOver="crosshair(12,2,'lightgreen')" onMouseOut="crosshair(12,2,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=49&amp;catid=17">
    +</a>
</td>
<td id="ucSnippetMatrix_RC12_3" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(12,3,'lightgreen')" onMouseOut="crosshair(12,3,'#DDDDDD')" href="/ProdCat.aspx?prodid=10&amp;catid=17">
    0</a>
<a title="Add a new Blackfish SQL submission in the Models category" onMouseOver="crosshair(12,3,'lightgreen')" onMouseOut="crosshair(12,3,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=10&amp;catid=17">
    +</a>
</td>
<td id="ucSnippetMatrix_RC12_4" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(12,4,'lightgreen')" onMouseOut="crosshair(12,4,'#DDDDDD')" href="/ProdCat.aspx?prodid=2&amp;catid=17">
    0</a>
<a title="Add a new C++Builder submission in the Models category" onMouseOver="crosshair(12,4,'lightgreen')" onMouseOut="crosshair(12,4,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=2&amp;catid=17">
    +</a>
</td>
<td id="ucSnippetMatrix_RC12_5" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(12,5,'lightgreen')" onMouseOut="crosshair(12,5,'#DDDDDD')" href="/ProdCat.aspx?prodid=50&amp;catid=17">
    0</a>
<a title="Add a new CONNECT submission in the Models category" onMouseOver="crosshair(12,5,'lightgreen')" onMouseOut="crosshair(12,5,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=50&amp;catid=17">
    +</a>
</td>
<td id="ucSnippetMatrix_RC12_6" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(12,6,'lightgreen')" onMouseOut="crosshair(12,6,'#DDDDDD')" href="/ProdCat.aspx?prodid=17&amp;catid=17">
    0</a>
<a title="Add a new Change Manager submission in the Models category" onMouseOver="crosshair(12,6,'lightgreen')" onMouseOut="crosshair(12,6,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=17&amp;catid=17">
    +</a>
</td>
<td id="ucSnippetMatrix_RC12_7" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(12,7,'lightgreen')" onMouseOut="crosshair(12,7,'#DDDDDD')" href="/ProdCat.aspx?prodid=21&amp;catid=17">
    0</a>
<a title="Add a new DB Optimizer submission in the Models category" onMouseOver="crosshair(12,7,'lightgreen')" onMouseOut="crosshair(12,7,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=21&amp;catid=17">
    +</a>
</td>
<td id="ucSnippetMatrix_RC12_8" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(12,8,'lightgreen')" onMouseOut="crosshair(12,8,'#DDDDDD')" href="/ProdCat.aspx?prodid=46&amp;catid=17">
    0</a>
<a title="Add a new DB PowerStudio XE submission in the Models category" onMouseOver="crosshair(12,8,'lightgreen')" onMouseOut="crosshair(12,8,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=46&amp;catid=17">
    +</a>
</td>
<td id="ucSnippetMatrix_RC12_9" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(12,9,'lightgreen')" onMouseOut="crosshair(12,9,'#DDDDDD')" href="/ProdCat.aspx?prodid=48&amp;catid=17">
    0</a>
<a title="Add a new DB PowerStudio for DB2 submission in the Models category" onMouseOver="crosshair(12,9,'lightgreen')" onMouseOu
</tr>
<tr>

<td id="ucSnippetMatrix_RC13_0" bgcolor="#DDDDDD" style="font-weight:bold;">
    <a onMouseOver="crosshair(13,0,'#FFFF80')" onMouseOut="crosshair(13,0,'#DDDDDD')" href="/Categories.aspx?catid=11">
    OpenTools</a>
</td>
<td id="ucSnippetMatrix_RC13_1" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(13,1,'lightgreen')" onMouseOut="crosshair(13,1,'#DDDDDD')" href="/ProdCat.aspx?prodid=35&amp;catid=11">
    0</a>
<a title="Add a new All-Access submission in the OpenTools category" onMouseOver="crosshair(13,1,'lightgreen')" onMouseOut="crosshair(13,1,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=35&amp;catid=11">
    +</a>
</td>
<td id="ucSnippetMatrix_RC13_2" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(13,2,'lightgreen')" onMouseOut="crosshair(13,2,'#DDDDDD')" href="/ProdCat.aspx?prodid=49&amp;catid=11">
    0</a>
<a title="Add a new AppWave submission in the OpenTools category" onMouseOver="crosshair(13,2,'lightgreen')" onMouseOut="crosshair(13,2,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=49&amp;catid=11">
    +</a>
</td>
<td id="ucSnippetMatrix_RC13_3" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(13,3,'lightgreen')" onMouseOut="crosshair(13,3,'#DDDDDD')" href="/ProdCat.aspx?prodid=10&amp;catid=11">
    0</a>
<a title="Add a new Blackfish SQL submission in the OpenTools category" onMouseOver="crosshair(13,3,'lightgreen')" onMouseOut="crosshair(13,3,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=10&amp;catid=11">
    +</a>
</td>
<td id="ucSnippetMatrix_RC13_4" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(13,4,'lightgreen')" onMouseOut="crosshair(13,4,'#DDDDDD')" href="/ProdCat.aspx?prodid=2&amp;catid=11">
    16</a>
<a title="Add a new C++Builder submission in the OpenTools category" onMouseOver="crosshair(13,4,'lightgreen')" onMouseOut="crosshair(13,4,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=2&amp;catid=11">
    +</a>
</td>
<td id="ucSnippetMatrix_RC13_5" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(13,5,'lightgreen')" onMouseOut="crosshair(13,5,'#DDDDDD')" href="/ProdCat.aspx?prodid=50&amp;catid=11">
    0</a>
<a title="Add a new CONNECT submission in the OpenTools category" onMouseOver="crosshair(13,5,'lightgreen')" onMouseOut="crosshair(13,5,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=50&amp;catid=11">
    +</a>
</td>
<td id="ucSnippetMatrix_RC13_6" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(13,6,'lightgreen')" onMouseOut="crosshair(13,6,'#DDDDDD')" href="/ProdCat.aspx?prodid=17&amp;catid=11">
    0</a>
<a title="Add a new Change Manager submission in the OpenTools category" onMouseOver="crosshair(13,6,'lightgreen')" onMouseOut="crosshair(13,6,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=17&amp;catid=11">
    +</a>
</td>
<td id="ucSnippetMatrix_RC13_7" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(13,7,'lightgreen')" onMouseOut="crosshair(13,7,'#DDDDDD')" href="/ProdCat.aspx?prodid=21&amp;catid=11">
    0</a>
<a title="Add a new DB Optimizer submission in the OpenTools category" onMouseOver="crosshair(13,7,'lightgreen')" onMouseOut="crosshair(13,7,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=21&amp;catid=11">
    +</a>
</td>
<td id="ucSnippetMatrix_RC13_8" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(13,8,'lightgreen')" onMouseOut="crosshair(13,8,'#DDDDDD')" href="/ProdCat.aspx?prodid=46&amp;catid=11">
    0</a>
<a title="Add a new DB PowerStudio XE submission in the OpenTools category" onMouseOver="crosshair(13,8,'lightgreen')" onMouseOut="crosshair(13,8,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=46&amp;catid=11">
    +</a>
</td>
<td id="ucSnippetMatrix_RC13_9" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(13,9,'lightgreen')" onMouseOut="crosshair(13,9,'#DDDDDD')" href="/ProdCat.aspx?prodid=48&amp;catid=11">
    0</a>
<a title="Add a new DB PowerStudio for DB2 submission in the OpenTools category" onMouseOver="crosshai">
</tr>
<tr>

<td id="ucSnippetMatrix_RC14_0" bgcolor="#DDDDDD" style="font-weight:bold;">
    <a onMouseOver="crosshair(14,0,'#FFFF80')" onMouseOut="crosshair(14,0,'#DDDDDD')" href="/Categories.aspx?catid=18">
    Patterns</a>
</td>
<td id="ucSnippetMatrix_RC14_1" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(14,1,'lightgreen')" onMouseOut="crosshair(14,1,'#DDDDDD')" href="/ProdCat.aspx?prodid=35&amp;catid=18">
    0</a>
<a title="Add a new All-Access submission in the Patterns category" onMouseOver="crosshair(14,1,'lightgreen')" onMouseOut="crosshair(14,1,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=35&amp;catid=18">
    +</a>
</td>
<td id="ucSnippetMatrix_RC14_2" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(14,2,'lightgreen')" onMouseOut="crosshair(14,2,'#DDDDDD')" href="/ProdCat.aspx?prodid=49&amp;catid=18">
    0</a>
<a title="Add a new AppWave submission in the Patterns category" onMouseOver="crosshair(14,2,'lightgreen')" onMouseOut="crosshair(14,2,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=49&amp;catid=18">
    +</a>
</td>
<td id="ucSnippetMatrix_RC14_3" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(14,3,'lightgreen')" onMouseOut="crosshair(14,3,'#DDDDDD')" href="/ProdCat.aspx?prodid=10&amp;catid=18">
    0</a>
<a title="Add a new Blackfish SQL submission in the Patterns category" onMouseOver="crosshair(14,3,'lightgreen')" onMouseOut="crosshair(14,3,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=10&amp;catid=18">
    +</a>
</td>
<td id="ucSnippetMatrix_RC14_4" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(14,4,'lightgreen')" onMouseOut="crosshair(14,4,'#DDDDDD')" href="/ProdCat.aspx?prodid=2&amp;catid=18">
    1</a>
<a title="Add a new C++Builder submission in the Patterns category" onMouseOver="crosshair(14,4,'lightgreen')" onMouseOut="crosshair(14,4,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=2&amp;catid=18">
    +</a>
</td>
<td id="ucSnippetMatrix_RC14_5" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(14,5,'lightgreen')" onMouseOut="crosshair(14,5,'#DDDDDD')" href="/ProdCat.aspx?prodid=50&amp;catid=18">
    0</a>
<a title="Add a new CONNECT submission in the Patterns category" onMouseOver="crosshair(14,5,'lightgreen')" onMouseOut="crosshair(14,5,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=50&amp;catid=18">
    +</a>
</td>
<td id="ucSnippetMatrix_RC14_6" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(14,6,'lightgreen')" onMouseOut="crosshair(14,6,'#DDDDDD')" href="/ProdCat.aspx?prodid=17&amp;catid=18">
    0</a>
<a title="Add a new Change Manager submission in the Patterns category" onMouseOver="crosshair(14,6,'lightgreen')" onMouseOut="crosshair(14,6,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=17&amp;catid=18">
    +</a>
</td>
<td id="ucSnippetMatrix_RC14_7" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(14,7,'lightgreen')" onMouseOut="crosshair(14,7,'#DDDDDD')" href="/ProdCat.aspx?prodid=21&amp;catid=18">
    0</a>
<a title="Add a new DB Optimizer submission in the Patterns category" onMouseOver="crosshair(14,7,'lightgreen')" onMouseOut="crosshair(14,7,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=21&amp;catid=18">
    +</a>
</td>
<td id="ucSnippetMatrix_RC14_8" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(14,8,'lightgreen')" onMouseOut="crosshair(14,8,'#DDDDDD')" href="/ProdCat.aspx?prodid=46&amp;catid=18">
    0</a>
<a title="Add a new DB PowerStudio XE submission in the Patterns category" onMouseOver="crosshair(14,8,'lightgreen')" onMouseOut="crosshair(14,8,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=46&amp;catid=18">
    +</a>
</td>
<td id="ucSnippetMatrix_RC14_9" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(14,9,'lightgreen')" onMouseOut="crosshair(14,9,'#DDDDDD')" href="/ProdCat.aspx?prodid=48&amp;catid=18">
    0</a>
<a title="Add a new DB PowerStudio for DB2 submission in the Patterns category" onMouseOver="crosshair(14,9,'lig">
</tr>
<tr>

<td id="ucSnippetMatrix_RC15_0" bgcolor="#DDDDDD" style="font-weight:bold;">
    <a onMouseOver="crosshair(15,0,'#FFFF80')" onMouseOut="crosshair(15,0,'#DDDDDD')" href="/Categories.aspx?catid=1">
    Source Code</a>
</td>
<td id="ucSnippetMatrix_RC15_1" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(15,1,'lightgreen')" onMouseOut="crosshair(15,1,'#DDDDDD')" href="/ProdCat.aspx?prodid=35&amp;catid=1">
    14</a>
<a title="Add a new All-Access submission in the Source Code category" onMouseOver="crosshair(15,1,'lightgreen')" onMouseOut="crosshair(15,1,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=35&amp;catid=1">
    +</a>
</td>
<td id="ucSnippetMatrix_RC15_2" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(15,2,'lightgreen')" onMouseOut="crosshair(15,2,'#DDDDDD')" href="/ProdCat.aspx?prodid=49&amp;catid=1">
    0</a>
<a title="Add a new AppWave submission in the Source Code category" onMouseOver="crosshair(15,2,'lightgreen')" onMouseOut="crosshair(15,2,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=49&amp;catid=1">
    +</a>
</td>
<td id="ucSnippetMatrix_RC15_3" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(15,3,'lightgreen')" onMouseOut="crosshair(15,3,'#DDDDDD')" href="/ProdCat.aspx?prodid=10&amp;catid=1">
    2</a>
<a title="Add a new Blackfish SQL submission in the Source Code category" onMouseOver="crosshair(15,3,'lightgreen')" onMouseOut="crosshair(15,3,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=10&amp;catid=1">
    +</a>
</td>
<td id="ucSnippetMatrix_RC15_4" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(15,4,'lightgreen')" onMouseOut="crosshair(15,4,'#DDDDDD')" href="/ProdCat.aspx?prodid=2&amp;catid=1">
    411</a>
<a title="Add a new C++Builder submission in the Source Code category" onMouseOver="crosshair(15,4,'lightgreen')" onMouseOut="crosshair(15,4,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=2&amp;catid=1">
    +</a>
</td>
<td id="ucSnippetMatrix_RC15_5" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(15,5,'lightgreen')" onMouseOut="crosshair(15,5,'#DDDDDD')" href="/ProdCat.aspx?prodid=50&amp;catid=1">
    0</a>
<a title="Add a new CONNECT submission in the Source Code category" onMouseOver="crosshair(15,5,'lightgreen')" onMouseOut="crosshair(15,5,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=50&amp;catid=1">
    +</a>
</td>
<td id="ucSnippetMatrix_RC15_6" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(15,6,'lightgreen')" onMouseOut="crosshair(15,6,'#DDDDDD')" href="/ProdCat.aspx?prodid=17&amp;catid=1">
    3</a>
<a title="Add a new Change Manager submission in the Source Code category" onMouseOver="crosshair(15,6,'lightgreen')" onMouseOut="crosshair(15,6,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=17&amp;catid=1">
    +</a>
</td>
<td id="ucSnippetMatrix_RC15_7" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(15,7,'lightgreen')" onMouseOut="crosshair(15,7,'#DDDDDD')" href="/ProdCat.aspx?prodid=21&amp;catid=1">
    0</a>
<a title="Add a new DB Optimizer submission in the Source Code category" onMouseOver="crosshair(15,7,'lightgreen')" onMouseOut="crosshair(15,7,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=21&amp;catid=1">
    +</a>
</td>
<td id="ucSnippetMatrix_RC15_8" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(15,8,'lightgreen')" onMouseOut="crosshair(15,8,'#DDDDDD')" href="/ProdCat.aspx?prodid=46&amp;catid=1">
    0</a>
<a title="Add a new DB PowerStudio XE submission in the Source Code category" onMouseOver="crosshair(15,8,'lightgreen')" onMouseOut="crosshair(15,8,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=46&amp;catid=1">
    +</a>
</td>
<td id="ucSnippetMatrix_RC15_9" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(15,9,'lightgreen')" onMouseOut="crosshair(15,9,'#DDDDDD')" href="/ProdCat.aspx?prodid=48&amp;catid=1">
    0</a>
<a title="Add a new DB PowerStudio for DB2 submission in the Source Code category" onMouseOver="cros">
</tr>
<tr>

<td id="ucSnippetMatrix_RC16_0" bgcolor="#DDDDDD" style="font-weight:bold;">
    <a onMouseOver="crosshair(16,0,'#FFFF80')" onMouseOut="crosshair(16,0,'#DDDDDD')" href="/Categories.aspx?catid=21">
    Video</a>
</td>
<td id="ucSnippetMatrix_RC16_1" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(16,1,'lightgreen')" onMouseOut="crosshair(16,1,'#DDDDDD')" href="/ProdCat.aspx?prodid=35&amp;catid=21">
    5</a>
<a title="Add a new All-Access submission in the Video category" onMouseOver="crosshair(16,1,'lightgreen')" onMouseOut="crosshair(16,1,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=35&amp;catid=21">
    +</a>
</td>
<td id="ucSnippetMatrix_RC16_2" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(16,2,'lightgreen')" onMouseOut="crosshair(16,2,'#DDDDDD')" href="/ProdCat.aspx?prodid=49&amp;catid=21">
    1</a>
<a title="Add a new AppWave submission in the Video category" onMouseOver="crosshair(16,2,'lightgreen')" onMouseOut="crosshair(16,2,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=49&amp;catid=21">
    +</a>
</td>
<td id="ucSnippetMatrix_RC16_3" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(16,3,'lightgreen')" onMouseOut="crosshair(16,3,'#DDDDDD')" href="/ProdCat.aspx?prodid=10&amp;catid=21">
    0</a>
<a title="Add a new Blackfish SQL submission in the Video category" onMouseOver="crosshair(16,3,'lightgreen')" onMouseOut="crosshair(16,3,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=10&amp;catid=21">
    +</a>
</td>
<td id="ucSnippetMatrix_RC16_4" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(16,4,'lightgreen')" onMouseOut="crosshair(16,4,'#DDDDDD')" href="/ProdCat.aspx?prodid=2&amp;catid=21">
    50</a>
<a title="Add a new C++Builder submission in the Video category" onMouseOver="crosshair(16,4,'lightgreen')" onMouseOut="crosshair(16,4,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=2&amp;catid=21">
    +</a>
</td>
<td id="ucSnippetMatrix_RC16_5" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(16,5,'lightgreen')" onMouseOut="crosshair(16,5,'#DDDDDD')" href="/ProdCat.aspx?prodid=50&amp;catid=21">
    0</a>
<a title="Add a new CONNECT submission in the Video category" onMouseOver="crosshair(16,5,'lightgreen')" onMouseOut="crosshair(16,5,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=50&amp;catid=21">
    +</a>
</td>
<td id="ucSnippetMatrix_RC16_6" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(16,6,'lightgreen')" onMouseOut="crosshair(16,6,'#DDDDDD')" href="/ProdCat.aspx?prodid=17&amp;catid=21">
    7</a>
<a title="Add a new Change Manager submission in the Video category" onMouseOver="crosshair(16,6,'lightgreen')" onMouseOut="crosshair(16,6,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=17&amp;catid=21">
    +</a>
</td>
<td id="ucSnippetMatrix_RC16_7" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(16,7,'lightgreen')" onMouseOut="crosshair(16,7,'#DDDDDD')" href="/ProdCat.aspx?prodid=21&amp;catid=21">
    9</a>
<a title="Add a new DB Optimizer submission in the Video category" onMouseOver="crosshair(16,7,'lightgreen')" onMouseOut="crosshair(16,7,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=21&amp;catid=21">
    +</a>
</td>
<td id="ucSnippetMatrix_RC16_8" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(16,8,'lightgreen')" onMouseOut="crosshair(16,8,'#DDDDDD')" href="/ProdCat.aspx?prodid=46&amp;catid=21">
    0</a>
<a title="Add a new DB PowerStudio XE submission in the Video category" onMouseOver="crosshair(16,8,'lightgreen')" onMouseOut="crosshair(16,8,'#DDDDDD')" class="atombtn" href="http://ccedit.embarcadero.com/Insert.aspx?prodid=46&amp;catid=21">
    +</a>
</td>
<td id="ucSnippetMatrix_RC16_9" align="right" bgcolor="#DDDDDD">
    <a onMouseOver="crosshair(16,9,'lightgreen')" onMouseOut="crosshair(16,9,'#DDDDDD')" href="/ProdCat.aspx?prodid=48&amp;catid=21">
    0</a>
<a title="Add a new DB PowerStudio for DB2 submission in the Video category" onMouseOver="crosshair(16,9,'lightgreen')" onMouseOut="crossh">
</tr>

</table>
*)
{$ENDREGION}

uses
  nick.shortcut.other.VirtualKeys,
  nick.shortcut.core.ShortcutExport,
  nick.shortcut.repository.ShortcutExport,
  Vcl.Forms,
  System.Classes,
  System.SysUtils, IdStrings;

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

