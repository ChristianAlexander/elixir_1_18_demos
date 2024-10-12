defmodule NewVersionDemo.DbgDemos do
  def demonstrate_with_statement(width \\ 10, height \\ 15) do
    opts = %{width: width, height: height}

    with {:ok, width} <- Map.fetch(opts, :width),
         double_width = width * 2,
         IO.puts("just a side effect"),
         {:ok, height} <- Map.fetch(opts, :height) do
      {:ok, double_width * height}
    end
    |> dbg()
  end

  def demonstrate_if_statement(value \\ 5) do
    if value > 5 do
      "Larger than five"
    else
      Integer.to_string(value)
    end
    |> dbg()
  end
end
