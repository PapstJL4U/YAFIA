defmodule Parser do
  @moduledoc """
  Parses a string to find fighting input
  """

  @doc """
  Returns a pattern (list of dividing symbols) that can be used to divide a strings,
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
  Returns a Command list, that is split along the internal Divider pattern.
  It only contains moves. No Cancels like jc, adc, xx, ...
  """
  @spec split(String.t()) :: list(String.t())
  def split(input) when is_binary(input) do
    String.split(input, divider(), trim: true)
  end

  @doc """
  Returns a Command list split along whitespace.
  """
  @spec split_ws(String.t()) :: list(String.t())
  def split_ws(input) when is_binary(input) do
    String.split(input, " ", trim: true)
  end

  @doc """
  Find the image coordinates and the crop parameters
  for the moves.
  Returns a list with image path and crop coordinates
  """
  @spec find(list(), keyword()) :: list()
  def find(_, []), do: IO.puts("Error, No game selected!")
  def find([], _), do: []

  def find(moves, game) do
    Enum.map(moves, fn x -> map_img(x, game) end)
    |> List.flatten()
  end

  defp map_img(move, game) do
    for {img, parts} <- game,
        Map.has_key?(parts, move),
        do: {img, Map.fetch!(parts, move)}
  end
end
