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

  def string do
    MoveImage.crop_input(0, 0, 55, 56)
  end

  def inputs do
    StreetFighter.inputs()
  end

  def test do
    inp = "2 mp , 4 mp > hp qcb mk srk 2p"

    Parser.split_ws(inp)
    |> find(StreetFighter.inputs())
  end

  def sys do
    MoveImage.sys_crop("assets/standard_directionals.png", 0, 0, 55, 56, 00)
  end

  defp dim({:ok, result}) do
    {x0, y0, xw, yh} = result
    # MoveImage.crop_input(x0, y0, xw, yh)
  end

  defp dim(:error), do: :error

  defp find(moves, game) do
    for {img, parts} <- game,
        move <- moves,
        into: %{},
        do: dim(Map.fetch(parts, move))
  end
end
