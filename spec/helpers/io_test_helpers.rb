require 'stringio'

module IOTestHelpers
  def simulate_stdin(*inputs)
    io = StringIO.new
    inputs.flatten.each { |str| io.puts(str) }
    io.rewind

    actual_stdin = $stdin
    $stdin = io
    yield
  ensure
    $stdin = actual_stdin
  end

  # Redirects stderr and stdout to /dev/null.
  def silence_output
    @orig_stderr = $stderr
    @orig_stdout = $stdout

    $stderr = File.new('/dev/null', 'w')
    $stdout = File.new('/dev/null', 'w')
  end

  # Replace stdout and stderr so anything else is output correctly.
  def enable_output
    $stderr = @orig_stderr
    $stdout = @orig_stdout
    @orig_stderr = nil
    @orig_stdout = nil
  end
end
