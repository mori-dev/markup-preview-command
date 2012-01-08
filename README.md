Markup Previw Command
=======================

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

    markup-preview --filepath foo --markup markdown
    markup-preview --filepath foo.md
    markup-preview --f foo.md
    cat bar.md | markup-preview -m markdown

Or, more realistically:

    cp path/to/markup-preview-command/etc/markup-preview.el ${HOME}/.emacs.d/elisp/markup-preview.el

    And in your emacs config file,

    (add-to-list 'load-path "~/.emacs.d/elisp")
    (require 'markup-preview)

    Then

    M-x markup-preview

Contributing
------------

Fork it.
