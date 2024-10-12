defmodule NewVersionDemo.EnumMethods do
  defmodule Item do
    defstruct [:id, :numeric_value]
  end

  def sum_before_this_version(items) do
    items
    |> Enum.map(fn item -> item.numeric_value end)
    |> Enum.sum()
  end

  def sum_with_reduce(items) do
    items
    |> Enum.reduce(0, fn item, acc -> acc + item.numeric_value end)
  end

  def sum_by(items) do
    items
    |> Enum.sum_by(fn item -> item.numeric_value end)
  end

  def sum_by_with_capture(items) do
    items
    |> Enum.sum_by(& &1.numeric_value)
  end

  def product_before_this_version(items) do
    items
    |> Enum.map(fn item -> item.numeric_value end)
    |> Enum.product()
  end

  def product_by(items) do
    items
    |> Enum.product_by(fn item -> item.numeric_value end)
  end
end
