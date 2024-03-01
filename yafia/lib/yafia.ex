defmodule Yafia do
  @moduledoc """
  Documentation for `Yafia`.
  """
  alias Images.MoveImage

  @doc """
  Hello world.

  ## Examples

      iex> Yafia.hello()
      :world

  """
  def hello do
    :world
  end

  def example do
    # import Mogrify
    inp = "2 mp , 4 mp > hp qcb mk srk 2p"
    Parser.split(inp)
    MoveImage.load_move("assets/standard_directionals.png", 0, 0, 55, 56)
    # image = open("assets/standard_directionals.png") |> verbose
    # IO.inspect(image)
  end
end
