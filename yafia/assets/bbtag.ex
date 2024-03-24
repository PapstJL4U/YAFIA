defmodule BBTag do
  @moduledoc """
  Describes the mapping for the Buttons A, B, C, D and P
  """
  def inputs() do
  images = %{
    "a"=> {0, 0, 84, 83},
    "b"=> {85, 0, 84, 83},
    "c"=> {168, 0, 84, 83},
    "d"=> {253, 0, 84, 83},
    "p"=> {336, 0, 84, 83}
    }
  ["assets/bbtag.png": images] 

  end
end
