Delphi-Shortcut-Finder
======================

Shows/find keyboard short-cuts have be assigned, that may be conflicting.

#### Supported versions of RadStudio/Delphi IDE

While there is only a package for XE7 (currently), I have tested it on Delphi XE successfully by copying the DPK file. The only restriction is that it relies on generics.

You will find the information under `Tools` -> `Options...` -> `Third Party` -> `ShortCut Finder` 

#### Mini-documentation

There is currently two tabs:
* ##### Known Add-ons
	This tab shows a list shortcuts that **Delphi-Shortcut-Finder** knows about that are currently installed and a description about them. It is possible to:
	* search by primary shortcut key, and/or 
	* secondary shortcut key, and/or
	* Description, by regular expression with/without case sensitivity,
	or
	* Just show the conflicting shortcuts.
 
	When searching by primary/secondary shortcut, the following applies:

	* If one or more modifier (ctrl, shift, alt) is press and no key, then all shortcuts that contain those modifiers are shown
	* If only a key is press, then all shortcuts with that key is shown
	* Due to a limitation of the control, SPACE and ESCAPE keys (and possibly others) can not be entered. 


* ##### IDE Registered ShortCuts
	This tab will ask the IDE if the shortcut provided has been registered. Using the information back from the IDE, it will try to find the module that deals with the shortcut. If **Delphi-Shortcut-Finder** can not find any information out, it will display "**< unknown >**"

	The order is the order of processing, from the top and going down downwards ie, the top one gets first go at the shortcut. 

#### History

The idea of this Delphi add-on came from a [discussion from Delphi Developers Google+ community](https://plus.google.com/105522328114529031567/posts/69wXU5DwkG8). 

I was thinking, why can't we check to see what add-ons there are and what short-cuts they use. When this was close to complete, I realised that there would be plenty of unknown add-ons with short-cuts that I don't have access to (because they are private, in-house for work, etc). Since I didn't want to scrap the work I had already done, I added an second section, where it asks the IDE which short-cuts are are registered and find the plug-in that registered it. It is not as nice but with some brain power, the user should be able to figure things out. :-)

#### Thanks

I would like to thank Andreas Hausladen for telling me where [DDevExtensions](http://andy.jgknet.de/blog/ide-tools/ddevextensions/) stores one of its settings.

#### Dependencies

* [Virtual TreeView](https://code.google.com/p/virtual-treeview/) for the UI. This needs to be installed first.
* [Jedi.inc](https://github.com/project-jedi/jedi) and that is only because of a [bug in Delphi XE7 registry settings](http://qc.embarcadero.com/wc/qcmain.aspx?d=127616).

#### Known issue(s)

* The TRichEdit component has a Zoom property that was introduced in XE6. If you are using a version previous to XE6, the IDE will pop-up a dialog saying that the property doesn't exists - click on `Ignore` and all should be fine.


#### History

* 2014/11/02
	* Initial release to the world
* 2014/11/03 
	* Modified finding module to only search the current process. Suggested by David Millington.
	* Changed the Virtual TreeViews to include full row selection and to use explorer themes. Suggested by Achim Kalwa.
	* Changed tab caption from a suggestion by David Millington.
