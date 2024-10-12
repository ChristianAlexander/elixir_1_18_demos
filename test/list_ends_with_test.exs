defmodule ListEndsWithTest do
  use ExUnit.Case

  describe "List.ends_with?/2" do
    test "Returns true when lists have a shared suffix" do
      input = [1, 2, 3, 4, 5]

      assert List.ends_with?(input, [3, 4, 5]) == true
    end

    test "Returns true with a single item suffix" do
      input = [1, 2, 3, 4, 5]

      assert List.ends_with?(input, [5]) == true
    end

    test "Returns false when lists don't share a suffix" do
      input = [1, 2, 3, 4, 5]

      assert List.ends_with?(input, [1, 2, 3]) == false
    end
  end
end
