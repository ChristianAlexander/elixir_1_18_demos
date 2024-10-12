defmodule EnumMethodsBenchmarkTest do
  use ExUnit.Case

  alias NewVersionDemo.EnumMethods
  alias NewVersionDemo.EnumMethods.Item

  defp create_random_item() do
    %Item{id: :crypto.strong_rand_bytes(10), numeric_value: :rand.uniform(100_000)}
  end

  @tag :benchmark
  @tag timeout: :infinity
  test "benchmark enum sum methods" do
    Benchee.run(
      %{
        "sum_before_this_version" => fn input ->
          EnumMethods.sum_before_this_version(input)
        end,
        "sum_with_reduce" => fn input ->
          EnumMethods.sum_with_reduce(input)
        end,
        "sum_by" => fn input ->
          EnumMethods.sum_by(input)
        end,
        "sum_by_with_capture" => fn input ->
          EnumMethods.sum_by_with_capture(input)
        end
      },
      warmup: 1,
      time: 2,
      inputs: %{
        "case_10_items" => for(_ <- 1..10, into: [], do: create_random_item()),
        "case_100_items" => for(_ <- 1..100, into: [], do: create_random_item()),
        "case_1000_items" => for(_ <- 1..1000, into: [], do: create_random_item())
      }
    )
  end
end
