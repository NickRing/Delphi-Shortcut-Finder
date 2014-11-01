Delphi-Shortcut-Finder
======================

Shows/find keyboard short-cuts have be assigned, that may be conflicting.

#### Supported versions of RadStudio/Delphi IDE

While there is only a package for XE7 (currently), I have tested it on Delphi XE successfully by copying the DPK file. The only restriction is that it relies on generics.

#### History

The idea of this Delphi add-on came from a [discussion from Delphi Developers Google+ community](https://plus.google.com/105522328114529031567/posts/69wXU5DwkG8). 

I was thinking, why can't we check to see what add-ons there are and what short-cuts they use. When this was close to complete, I realised that there would be plenty of unknown add-ons with short-cuts that I don't have access to (because they are private, in-house for work, etc). Since I didn't want to scrap the work I had already done, I added an second section, where it asks the IDE which short-cuts are are registered and find the plug-in that registered it. It is not as nice but with some brain power, the user should be able to figure things out. :-)

#### Thanks

I would like to thank Andreas Hausladen for telling me where [DDevExtensions](http://andy.jgknet.de/blog/ide-tools/ddevextensions/) stores one of its settings.

#### Dependencies

The only dependencies is on [Jedi.inc](https://github.com/project-jedi/jedi) and that is only because of a [bug in Delphi XE7 registry settings](http://qc.embarcadero.com/wc/qcmain.aspx?d=127616).
