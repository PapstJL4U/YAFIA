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

  @spec create_im(String.t()) :: any()
  def create_im(input \\ "2 mp , 4 mp > hp qcb mk srk 2p") do
    Parser.split_ws(input)
    |> Parser.find(StreetFighter.inputs())
    |> List.flatten()
    |> Enum.each(fn x -> ImageMagick.sys_crop(x) end)
  end

  @spec combine_im() :: any()
  def combine_im() do
    ImageMagick.combine()
  end
end
