# Basic matching

Letters or numbers between two slashes `/`

Matches are case sensitive. For example `/s/` matches `s` but not `S`.

**Ignoring case**

Appending an `i` after the `/` of a regex will make the entire regex ignore case.

For example: `/s/i` will match `s` and `S`

These are called flags or modifiers.

**Special characters**

`$ ^ * + ? . ( ) [ ] { } | \ /`

To match special (meta) characters, you must *escape* it with a leading backslash `\`

Note: meta characters are different in some variations of regex.

```ruby
# Example:
str = "hello?"
str.match?(/?/) # -> error
str.match?(/\?/) # -> true
```
**Alternation**

A way to construct regex that matches one of several sub patterns. Patterns are separated by the pipe character `|` and wrapped in parentheses.

Example: `/(cat|dog)/` will find matches for `cat` or `dog`.

**Control Character Escapes**

Used to represent characters that don't have a visual representation. For example `\n` represents a new line.

<br>

# Character Classes

Patterns that let you specify a set of characters you want to match. These patterns use a list of characters between square brackets and matches a single occurrence of ANY of the characters between the brackets.

`^ \ - [ ]` are the meta-characters when working inside a character class.

**Range of Characters**

Letter and number ranges can be used inside character classes.
For example `/[0-9a-zA-Z]/` will match numbers 0 through 9, and a through z (upper and lowercase).

**Negated Classes**

Negations look like character classes but have a caret `^` as the first character in the brackets. For example `/[^a-z]/` would match all characters that ARENT lowercase a through z.

<br>

# Character Class Shortcuts

`.` is the *any* meta-character. `/./`represents any character. `[.]` is literal meaning it will only match `.`

Note: use `/m` option when `.` should match newlines.

**Whitespace**

Whitespace characters are space `' '`, tab `\t`, vertical tab `\v`, carriage return `\r`, line feed `\n`, and form feed `\f`.

`\s` matches whitespace characters.

`\S` matches non-white characters.

They can be used inside square brackets too. `[\s]`, `[\S]`.

**Digits and Hex Digits**

The following are character class shortcuts for digits and Hex digits:

`\d` for any decimal 0-9

`\D` for any character besides 0-9

`'h` for any hexadecimal digit (0-9, A-F, a-f)

`\H` for any character besides hexadecimal digits

These shortcuts can be used in or out of square brackets.

**Word Characters**

Word characters includes all alphabetic characters (upper and lowercase), decimal digits 0-9, and underscores.

`\w` matches "word characters"

`\W` matches "non-word characters"

They can also be used in or out of square brackets.

<br>

# Anchors

Anchors are a way to limit how a regex matches a string by telling it where matches can begin and end.

**Start/End of Line**

The meta-characters `^` (begining) and `$` (ending) anchor a regex to the beginning/end of a LINE of a string.
```ruby
# Examples:
'catastrophe'.match?(/^cat/) # -> true
'i love my cat'.match?(/^cat/) # -> false

'catastrophe'.match?(/cat$/) # -> false
'i love my cat'.match?(/cat$/) # -> true

"red\nfish".match?(/^fish/) # -> true
```
**Start/End of String**

`\A` ensures that a regex matches at the beginning of the string.

`\z` always matches at the end of a string

`\Z` ensures that a regex matches up to but not including a newline at the end of the string.
```ruby
# Examples:
"red fish\nblue fish".match?(/\Ared/) # -> true
"red fish\nblue".match?(/blue\z/) # -> true
```
**Word Boundaries**

A word boundary `\b` occurs:

- Between any pair of characters, one of which is a word character and one which is not.

- At the beginning of a string if the first character is a word character.

- At the end of a string if the last character is a word character.

Non-word boundary `\B` occurs:

- Between any pair of characters, both of which are word characters or both are not word characters.
- At the beginning or end of a string if the first/last character is a non-word character.

Note: `\b` and `\B` do not work inside character classes (square brackets). `\b` matches a backspace character in character classes.

<br>

# Quantifiers

**Zero or More**

The `*` quantifier matches zero or more occurrences of the pattern to its left.
```ruby
# Example:
'ct'.match?(/co*t/) # -> true
'coooot'.match?(/co*t/) # -> true
```

**One or More**

The `+` quantifier matches ONE or more occurrences of something.

**Zero or One**

The `?` quantifier checks if something occurs once or not at all.

**Ranges**

The range quantifier is a pair of curly braces `{}` with or or two numbers and an optional comma between the braces.
```ruby
# Examples:
'12345'.match?(/\b\d{5}\b/) # -> true (5 nums)
'123456789'.match?(/\b\d{5,}\b/) # -> true (5 or more nums)
'12345678'.match?(/\b\d{5,7}\b/) # -> false (5 or more, but not more than 7 nums)
```
**Greediness**

The above quantifiers are considered greedy, meaning they always match the longest possible string they can. If you need to match the fewest number of characters possible, a lazy match can be requested by adding `?` after the main quantifier.

