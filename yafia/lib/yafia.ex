defmodule Yafia do
  @moduledoc """
  Documentation for `Yafia`.
  """
  alias Images.MoveImage
  alias Images.ImageMagick

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

  def gg() do
    combo = String.downcase("5 K > 2 S > 5 H > 63214 K ~ H")
    create_im(combo, GuiltyGearXrd.inputs())
  end

  @spec create_im(String.t(), list()) :: :ok
  def create_im(input \\ "2 mp , 4 mp > hp qcb mk srk 2p", game \\ StreetFighter.inputs()) do
    Parser.split_ws(input)
    |> IO.inspect()
    |> Parser.find_flat(game)
    |> Enum.each(fn x -> ImageMagick.sys_crop(x) end)
  end

  @spec combine_im() :: any()
  def combine_im() do
    ImageMagick.combine()
  end
end
