defmodule Parser do
  @moduledoc """
  Parses a string to find fighting input
  """

  @doc """
  Returns a pattern that can be used to divide a strings,
  """
  def divider do
    :binary.compile_pattern([
      ">",
      " ",
      ",",
      "->",
      "~",
      "dl.",
      "delay",
      "jc",
      "hjc",
      "sjc",
      "dc",
      "adc",
      "xx"
    ])
  end

  @doc """
  Returns a List, that is split along the divider pattern.
  """
  def split(input) when is_binary(input) do
    String.split(input, divider(), trim: true)
  end

  @doc """
  Returns a List split along whitespace.
  """
  def split_ws(input) when is_binary(input) do
    String.split(input, " ", trim: true)
  end

  def find_old(moves, game) do
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

  def find(_, []), do: IO.puts("Error, No game selected!")
  def find([], _), do: []

  def find(moves, game) do
    with [move | others] = moves do
      for {img, parts} <- game,
          Map.has_key?(parts, move),
          do: [Map.fetch!(parts, move)] ++ find(others, game)
    end
  end
end
