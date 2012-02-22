module Markup::Preview::Command
  module Util

    def command_exist? (command)
      system "which #{command} >/dev/null 2>&1"
    end

    def browser_command
      return "gnome-open" if command_exist? "gnome-open"
      return "open" if command_exist? "open"
      return "cygstart" if command_exist? "cygstart"
      exit 1
    end

  end
end
