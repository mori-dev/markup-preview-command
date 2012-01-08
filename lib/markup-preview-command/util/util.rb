module Markup::Preview::Command
  module Util

    def command_exit? (command)
      system "which #{command} >/dev/null 2>&1"
    end

    def browser_command
      return "gnome-open" if command_exit? "gnome-open"
      return "open" if command_exit? "open"
      exit 1
    end

  end
end
