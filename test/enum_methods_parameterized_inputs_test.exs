defmodule EnumMethodsParameterizedInputsTest do
  alias NewVersionDemo.EnumMethods
  alias NewVersionDemo.EnumMethods.Item

  @items [
    %Item{id: "one", numeric_value: 1},
    %Item{id: "two", numeric_value: 2},
    %Item{id: "three", numeric_value: 3},
    %Item{id: "five", numeric_value: 5}
  ]

  # Use parameterize to create a "table test" with expected inputs and outputs.
  use ExUnit.Case,
    parameterize: [
      %{input: Enum.take(@items, 1), result: 1},
      %{input: Enum.take(@items, 2), result: 3},
      %{input: Enum.take(@items, 3), result: 6},
      %{input: Enum.take(@items, 4), result: 11}
    ]

  test "sum_by", %{input: input, result: result} do
    assert EnumMethods.sum_by(input) == result
  end
end
