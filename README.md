# RubyPants Unicode — SmartyPants ported to Ruby

It just occurred to me that if we are encoding our HTML pages in UTF-8 to
handle multiple languages and using web fonts with multilanguage support,
shouldn't we be able to directly insert the simple apostrophe, ellipsis, and
em-dash?

Switched to direct unicode output (UTF-8) instead of HTML entities by Chris Chapman
  Copyright © 2012 Chris Chapman

Ported by Christian Neukirchen <mailto:chneukirchen@gmail.com>
  Copyright © 2004 Christian Neukirchen

Incooporates ideas, comments and documentation by Chad Miller
  Copyright © 2004 Chad Miller

Original SmartyPants by John Gruber
  Copyright © 2003 John Gruber


## RubyPants

RubyPants is a Ruby port of the smart-quotes library SmartyPants.

The original “SmartyPants” is a free web publishing plug-in for
Movable Type, Blosxom, and BBEdit that easily translates plain ASCII
punctuation characters into “smart” typographic punctuation HTML
entities.

See rubypants.rb for more information.


## Incompatibilities

RubyPants uses a different API than SmartyPants; it is compatible to
Red- and BlueCloth.  Usually, you call RubyPants like this:

```ruby
  nicehtml = RubyPants.new(uglyhtml, options).to_html
```

where +options+ is an Array of Integers and/or Symbols (if you don’t
pass any options, RubyPants will use <tt>[2]</tt> as default.)

*Note*:: This is incompatible to SmartyPants, which uses <tt>[1]</tt>
         for default.

The exact meaning of numbers and symbols is documented at RubyPants#new.


## SmartyPants license:

Copyright © 2003 John Gruber
(http://daringfireball.net)
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions
are met:

* Redistributions of source code must retain the above copyright
  notice, this list of conditions and the following disclaimer.

* Redistributions in binary form must reproduce the above copyright
  notice, this list of conditions and the following disclaimer in
  the documentation and/or other materials provided with the
  distribution.

* Neither the name “SmartyPants” nor the names of its contributors
  may be used to endorse or promote products derived from this
  software without specific prior written permission.

This software is provided by the copyright holders and contributors
“as is” and any express or implied warranties, including, but not
limited to, the implied warranties of merchantability and fitness
for a particular purpose are disclaimed. In no event shall the
copyright owner or contributors be liable for any direct, indirect,
incidental, special, exemplary, or consequential damages (including,
but not limited to, procurement of substitute goods or services;
loss of use, data, or profits; or business interruption) however
caused and on any theory of liability, whether in contract, strict
liability, or tort (including negligence or otherwise) arising in
any way out of the use of this software, even if advised of the
possibility of such damage.


## RubyPants license

Copyright © 2004 Christian Neukirchen

RubyPants is a derivative work of SmartyPants and smartypants.py.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions
are met:

* Redistributions of source code must retain the above copyright
  notice, this list of conditions and the following disclaimer.

* Redistributions in binary form must reproduce the above copyright
  notice, this list of conditions and the following disclaimer in
  the documentation and/or other materials provided with the
  distribution.

This software is provided by the copyright holders and contributors
“as is” and any express or implied warranties, including, but not
limited to, the implied warranties of merchantability and fitness
for a particular purpose are disclaimed. In no event shall the
copyright owner or contributors be liable for any direct, indirect,
incidental, special, exemplary, or consequential damages (including,
but not limited to, procurement of substitute goods or services;
loss of use, data, or profits; or business interruption) however
caused and on any theory of liability, whether in contract, strict
liability, or tort (including negligence or otherwise) arising in
any way out of the use of this software, even if advised of the
possibility of such damage.


## Links

- John Gruber:: http://daringfireball.net
- SmartyPants:: http://daringfireball.net/projects/smartypants
- Chad Miller:: http://web.chad.org
- Christian Neukirchen:: http://kronavita.de/chris
