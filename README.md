Markup Previw Command
========================

[![Build Status](https://secure.travis-ci.org/mori-dev/markup-preview-command.png)](http://travis-ci.org/mori-dev/markup-preview-command)

We use this library on Github when rendering your README or any other
rich text file, *When We are editing by Emacs or other editor*.

Markups
-------

The following markups are supported. Because We use github-markup gem.

* [.markdown](http://daringfireball.net/projects/markdown/)
* [.textile](http://www.textism.com/tools/textile/)
* [.rdoc](http://rdoc.sourceforge.net/)
* [.org](http://orgmode.org/)
* [.creole](http://wikicreole.org/)
* [.mediawiki](http://www.mediawiki.org/wiki/Help:Formatting)
* [.rst](http://docutils.sourceforge.net/rst.html) -- `pip docutils`
* [.asciidoc](http://www.methods.co.nz/asciidoc/) -- `brew install asciidoc, sudo apt-get install asciidoc`
* [.pod](http://search.cpan.org/dist/perl/pod/perlpod.pod) -- `Pod::Simple::HTML`
  comes with Perl >= 5.10. Lower versions should install Pod::Simple from CPAN.


Installation
--------------

    gem install markup-preview-command

Usage
-----

    markup-preview --filepath foo --markup markdown --output browser
    markup-preview --filepath foo.md --output browser
    markup-preview -f foo.md -o browser
    cat bar.md | markup-preview -m markdown

Or, more realistically:

    Put markup-preview.el in your load-path.
    cp path/to/markup-preview-command/etc/markup-preview.el ${HOME}/.emacs.d/elisp/markup-preview.el

    Add following code.
    (require 'markup-preview)
    (global-set-key (kbd "M--") 'markup-preview) ; key bind example

Contributing
------------

Fork, fix, then send me a pull request.

Copyright
------------

Copyright (c) mori_dev. See LICENSE for details.
