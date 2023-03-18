class Banner
  def initialize(message, width=0)
    @message = message
    @width = width
  end

  def to_s
    if @width < 3
      "Width must be at least 3 characters"
    else
      [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
    end
  end

  private

  def horizontal_rule
    "+-#{'-' * @message.size}-+"
  end

  def empty_line
    "| #{' ' * @message.size} |"
  end

  def message_line
    "| #{@message} |"
  end
end

banner = Banner.new('To boldly go where no one has gone before.', 3)
puts banner