class Book
  attr_reader :title, :author

  def initialize(author, title)
    @author = author
    @title = title
  end

  def to_s
    %("#{title}", by #{author})
  end
end

book = Book.new("Neil Stephenson", "Snow Crash")
puts %(The author of "#{book.title}" is #{book.author}.)
puts %(book = #{book}.)

=begin
Further exploration:
1) What are the differences between attr_reader, attr_writer, and attr_accessor?

attr_reader, attr_writer, and attr_accessor are all shorthand for getter and
setter methods.  attr_reader is used for retreiving the value of an instance
variable, attr_writer is used for setting the value of an instance variable,
and attr_accessor is used for both getting AND setting values of an instance
variable.

2) Why did we use attr_reader instead of one of the other two?
Would it be okay to use one of the others? Why or why not?

In this case we only use attr_reader because our only goal here is to retrieve
information about this particular instance (author and title). If we needed
to set these values to something else, we would also need to use attr_writer.
Or attr_accessor in place of both. attr_accessor COULD be used here but its
unnecessary as we dont need the addition of the setter method.

3) Instead of attr_reader, suppose you had added the following methods to this class:

def title
  @title
end

def author
  @author
end

Would this change the behavior of the class in any way? If so, how? If not,
why not? Can you think of any advantages of this code?

Using manually created getter methods doesn't change the behavior of the
class in this case (both do the same thing), but it could if we wanted to
add additional functionality or behaviors when invoking them which is the
advantage of writing them this way instead of using attr_reader/writer/accessor.
=end