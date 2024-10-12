defmodule NewVersionDemo.DeprecatedStyle do
  @options [
    "Lucky",
    "Unlucky"
  ]

  def this_method_could_have_used_an_if_statement() do
    unless Enum.random(@options) == "Lucky" do
      "The odds are not in your favor"
    else
      "The odds are in your favor"
    end
  end

  def what_do_single_quotes_even_mean() do
    # This Erlang networking method requires an Erlang-style charlist
    :inet.gethostbyname('phx.dev')
  end
end
