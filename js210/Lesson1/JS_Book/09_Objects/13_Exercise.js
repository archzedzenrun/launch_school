function foo(bar) {
  console.log(bar());
}

foo(function() { return "Welcome" });
foo(function() { return 3.1415 });
foo(function() { return [1, 2, 3] });