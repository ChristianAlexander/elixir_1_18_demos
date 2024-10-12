defmodule EnumMethodsTest do
  alias NewVersionDemo.EnumMethods
  alias NewVersionDemo.EnumMethods.Item

  # Use parameterize to run tests against all implementations, ensuring they behave consistently.
  use ExUnit.Case,
    parameterize: [
      %{
        sum_method: &EnumMethods.sum_before_this_version/1
      },
      %{
        sum_method: &EnumMethods.sum_with_reduce/1
      },
      %{
        sum_method: &EnumMethods.sum_by/1
      },
      %{
        sum_method: &EnumMethods.sum_by_with_capture/1
      }
    ]

  @items [
    %Item{id: "one", numeric_value: 1},
    %Item{id: "two", numeric_value: 2},
    %Item{id: "three", numeric_value: 3},
    %Item{id: "five", numeric_value: 5}
  ]

  test "Properly adds up basic items", %{sum_method: sum_method} do
    sum = sum_method.(@items)

    assert sum == 11
  end
end
