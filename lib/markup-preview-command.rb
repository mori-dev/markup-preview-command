require 'rubygems' unless defined? Gem
require 'markup-preview-command/version'
require 'markup-preview-command/util'

module Markup::Preview::Command
  class Render

    require 'markup/markup'
    require 'fileutils'
    require 'tmpdir'

    include Util

    TMPDIR  = File.join(Dir.tmpdir, 'markup-preview')
    TMPFILE = File.join(TMPDIR, $$.to_s)
    FileUtils.mkdir_p(TMPDIR) unless FileTest.directory? TMPDIR

    def initialize(opts)
      @content = nil
      @format  = nil
      parse_options(opts)
    end

    def self.execute(opts)
      new(opts).execute
    end

    def execute
      create_html
      open_browser
      exit($?.exitstatus || 0)
    end


    private

    def create_html
      render_result = Markup::Markup.render("dummy.#{@format}", @content)
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

    def parse_options(opts)

      extensions = ['md','mkd','mkdn','mkdn','mdown','markdown','org','pod',
                    'creole','rst','rest','textile','rdoc','mediawiki']

      if opts.markup?
        @format = opts[:markup].downcase
      end

      if opts.filepath? && (File::extname(opts[:filepath]) != "")
        @format = File::extname(opts[:filepath])[1..-1]
        unless extensions.include? @format
          warn "invalid extension. \nvalid extensions: #{extensions.join(', ')}"
          exit 1
        end
      end

      if opts.filepath?
        @content = File.read(opts[:filepath])
      else
        @content = $stdin.read
      end

    end
  end
end
