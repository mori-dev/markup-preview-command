require 'rubygems' unless defined? Gem
require 'markup-preview-command/version'
require 'markup-preview-command/util/util'

module Markup::Preview::Command

  class Runner

    require 'github/markup'
    require 'fileutils'
    require 'tmpdir'

    include Util

    TMPDIR  = File.join(Dir.tmpdir, 'markup-preview')
    TMPFILE = File.join(TMPDIR, $$.to_s)
    FileUtils.mkdir_p(TMPDIR) unless FileTest.directory? TMPDIR


    def initialize(argv)
      @opts = Options.new(argv)
    end

    def self.run(argv)
      self.new(argv).run
    end

    def run
      create_html
      if @opts.browser
        open_browser
        exit($?.exitstatus || 0)
      else
        puts File.read(TMPFILE)
        exit 0
      end
    end


    private

    def create_html
      render_result = GitHub::Markup.render("dummy.#{@opts.format}", @opts.content)
      template_css  = File.read(File.join(File.dirname(__FILE__), 'markup-preview-command', 'css', 'template.css'))
      gollum_css    = File.read(File.join(File.dirname(__FILE__), 'markup-preview-command', 'css', 'gollum.css'))
      html          = ERB.new(File.read(File.join(File.dirname(__FILE__), 'markup-preview-command', 'view', 'template.erb')))
      File.open(TMPFILE, 'w') do |f|
        f.puts html.result(binding)
      end
    end

    def open_browser
      system "#{browser_command} #{TMPFILE}"
    end

  end


  class Options

    require 'slop'

    attr_reader :format, :browser, :content

    def initialize(argv)
      parse(argv)
    end


    private

    def parse(argv)

      usage if argv.length == 0

      help = <<-EOF
useage:
markup-preview -f path/to/foo.md -o browser
or,
cat foo.md | markup-preview -m markdown -o browser
  EOF

      opts = Slop.parse(argv) do
        on :h, :help, help, :tail => true do
          puts help
          exit
        end
        on :m,  :markup=,   'markup'
        on :f,  :filepath=, 'filepath'
        on :o,  :output=,   'set "-o browser" if see result by browser'
      end

      extensions = ['md','mkd','mkdn','mkdn','mdown','markdown','org','pod',
                    'creole','rst','rest','textile','rdoc','mediawiki']

      @format = opts[:markup].downcase if opts.markup?

      if opts.output? && (opts[:output] === 'browser')
        @browser = true
      end

      if opts.filepath? && (File::extname(opts[:filepath]) != "")
        @format = File::extname(opts[:filepath])[1..-1]
        unless extensions.include? @format
          warn "invalid extension. \nvalid extensions: #{extensions.join(', ')}"
          exit 1
        end
      end

      @content = opts.filepath? ? File.read(opts[:filepath]) : $stdin.read

    end

    def usage
      puts "Incorrect usage."
      puts "Check out --help for options"
      exit 1
    end

  end
end
