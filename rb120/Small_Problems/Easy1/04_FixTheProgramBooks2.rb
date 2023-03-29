class Book
  attr_accessor :title, :author

  def to_s
    %("#{title}", by #{author})
  end
end

book = Book.new
book.author = "Neil Stephenson"
book.title = "Snow Crash"
puts %(The author of "#{book.title}" is #{book.author}.)
puts %(book = #{book}.)

=begin
Further Exploration:
1) What do you think of this way of creating and initializing Book objects?
(The two steps are separate.)

I think this depends on what kind of functionality you want out of the class.
Separating them is an acceptable option if you don't need these variables set
to something on initialization.

2) Would it be better to create and initialize at the same time like in the previous
exercise? What potential problems, if any, are introduced by separating the steps?

One advantage of setting author and title on initialization is that they
are set when the book object is created and don't have to both be manually set
afterwards.

One potential problem is losing the ability to add additional functionality
on initialization.  Another potential problem is that in some way you may
try to access them before they have been set which will return a value of nil.
=end