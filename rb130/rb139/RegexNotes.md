**Basic matching**

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

**Character Classes**

Patterns that let you specify a set of characters you want to match. These patterns use a list of characters between square brackets and matches a single occurrence of ANY of the characters between the brackets.

`^ \ - [ ]` are the meta-characters when working inside a character class.

**Range of Characters**

Letter and number ranges can be used inside character classes.
For example `/[0-9a-zA-Z]/` will match numbers 0 through 9, and a through z (upper and lowercase).

**Negated Classes**

Negations look like character classes but have a caret `^` as the first character in the brackets. For example `/[^a-z]/` would match all characters that ARENT lowercase a through z.

<br>

**Character Class Shortcuts**

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
