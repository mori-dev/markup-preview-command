require "stringio"

RSpec.configure do |config|
  # This method is almost copy of wycats's implementation.
  # I found it at http://d.hatena.ne.jp/POCHI_BLACK/comment?date=20100324 .
  def capture(stream)
    begin
      stream = stream.to_s
      eval "$#{stream} = StringIO.new"
      yield
      result = eval("$#{stream}").string
    ensure
      eval "$#{stream} = #{stream.upcase}"
    end
    result
  end
end
