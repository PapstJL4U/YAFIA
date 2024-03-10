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

  def recurs do
    inp = "2 mp , 4 mp > hp qcb mk srk 2p"

    Parser.split_ws(inp)
    |> Parser.find(StreetFighter.inputs())
  end

  def sys do
    MoveImage.sys_crop("assets/standard_directionals.png", 0, 0, 55, 56, 00)
  end

  defp find(moves, game) do
    for {img, parts} <- game,
        move <- moves,
        Map.has_key?(parts, move),
        do:
          (
            {x0, y0, xw, yh} =
              Map.fetch!(parts, move)

            MoveImage.sys_crop(
              Atom.to_string(img),
              x0,
              y0,
              xw,
              yh,
              MoveImage.crop_input(x0, y0, xw, yh)
            )
          )
  end
end
