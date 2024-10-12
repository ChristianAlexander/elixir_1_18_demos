# Elixir 1.18 Demo

A demonstration of improvements found in the Elixir 1.18 release.
Companion repository to a YouTube video.

## New Enum Methods
Elixir 1.18 includes two new methods in the `Enum` module that make it easier (and more efficient) to add up or multiply numeric values found within maps and structs.
These methods are `Enum.sum_by/2` and `Enum.product_by/2`.

Check out [enum_methods.ex](lib/enum_methods.ex) for usage and [enum_methods_benchmark_test.exs](test/enum_methods_benchmark_test.exs) for a Benchee comparison.

> [!TIP]
> The benchmark takes a while to run, so it's disabled by default. Run `mix test --include benchmark` to include run them yourself!

## ExUnit Parameterized Tests

Sometimes it's important to run the same tests against multiple implementations of methods.
It can also be easier to create a table of inputs and outputs instead of writing several identical test bodies.

For situations like these, ExUnit has been updated to include a `parameterize` option to `ExUnit.Case`!

Check out [enum_methods_test.exs](test/enum_methods_test.exs) for an example of conformance testing, and [enum_methods_parameterized_inputs_test.exs](test/enum_methods_parameterized_inputs_test.exs) for examples!


## `List.ends_with?/2`

Elixir has had a `List.starts_with?/2` method for a while, but the 1.18 release includes a `List.ends_with?/2` method.
As the question mark implies, this method returns a boolean.

To determine if a List ends with the exact contents of another list, try this method out.
For an example, check out [list_ends_with_test.exs](test/list_ends_with_test.exs).

> [!IMPORTANT]
> Remember that the native List type in Elixir is a **linked list**, which means that every element must be traversed in order to get to the end.
> For very long lists, this method can be very expensive—unlike its `Enum.starts_with?/2` counterpart.

## Improved `dbg`

The debug macro was introduced in Elixir 1.14 (2022) as a purpose-built debug logging tool.
Whenever it's called, it prints the value of what was passed in, but it's a bit smarter than that.

It has always been able to show the intermediate values from a long `|>` pipe chain, but the 1.18 release makes it even better.

`dbg` now shows the values from `if` statement predicates, and `with` statement intermediate values.

Try a few demos out in iex (`iex -S mix`):

### `with` Statement
```shell
iex(1)> NewVersionDemo.DbgDemos.demonstrate_with_statement()
just a side effect
[lib/dbg_demos.ex:11: NewVersionDemo.DbgDemos.demonstrate_with_statement/2]
With clauses:
Map.fetch(opts, :width) #=> {:ok, 10}
width * 2 #=> 20
Map.fetch(opts, :height) #=> {:ok, 15}

With expression:
with {:ok, width} <- Map.fetch(opts, :width),
     double_width = width * 2,
     IO.puts("just a side effect"),
     {:ok, height} <- Map.fetch(opts, :height) do
  {:ok, double_width * height}
end #=> {:ok, 300}

{:ok, 300}
```

### `if` Statement

```shell
iex(1)> NewVersionDemo.DbgDemos.demonstrate_if_statement()
[lib/dbg_demos.ex:20: NewVersionDemo.DbgDemos.demonstrate_if_statement/1]
If condition:
value > 5 #=> false

If expression:
if value > 5 do
  "Larger than five"
else
  Integer.to_string(value)
end #=> "5"

"5"
```

## Mix Format Migrate

The `mix format` command has been around for a while, but 1.18 includes a flag that lets it migrate past certain deprecations your existing codebase.

We're saying goodbye to the `unless` keyword in 1.18 (more like good riddance), along with single quoted charlists (we prefer `~c"some_charlist"` now).
Both of these scenarios can be automatically upgraded by running `mix format --migrate`.

To test this out, I left an un-migrated file in [deprecated_style.ex](lib/deprecated_style.ex).
If you're running 1.18, try running the mix format command and observe it yourself!
