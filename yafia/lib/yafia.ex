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
    inp = "2 mp , 4 mp > hp qcb mk srk 2p"
    Parser.split(inp)
    MoveImage.load_move("assets/standard_directionals.png", 0, 0, 55, 56)
  end

  def ci do
    MoveImage.crop_input(0, 0, 55, 56)
  end

  def inputs do
    StreetFighter.inputs()
  end

  def recurs do
    inp = "2 mp , 4 mp > hp qcb mk srk 2p"

    Parser.split_ws(inp)
    |> Parser.find(StreetFighter.inputs())
    |> List.flatten()

    # |> MoveImage.sys_crop()
  end
end
