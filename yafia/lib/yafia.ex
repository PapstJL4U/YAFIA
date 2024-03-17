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

  def ci do
    MoveImage.crop_input(0, 0, 55, 56)
  end

  def test() do
    String.downcase("5 K > 2 S > 5 H > 63214 K ~ H")
    |> Parser.split_ws()
    |> Parser.find(GuiltyGearXrd.inputs())
    |> Enum.with_index(1)
    |> Enum.each(fn x -> ImageMagick.sys_crop(x) end)
  end

  @spec create_im(String.t(), list()) :: :ok
  def create_im(input \\ "2 mp , 4 mp > hp qcb mk srk 2p", game \\ StreetFighter.inputs()) do
    String.downcase(input)
    |> Parser.split_ws()
    |> IO.inspect()
    |> Parser.find(game)
    |> Enum.each(fn x -> ImageMagick.sys_crop(x) end)
  end

  @spec combine_im() :: any()
  def combine_im() do
    ImageMagick.combine()
  end
end
