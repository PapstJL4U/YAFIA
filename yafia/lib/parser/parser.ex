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

  def regex_pattern do
    ~r/\d+|[>,]|(->)|~|(dl\.*)|(delayed)|(jc*\.*)|(hjc\.*)|(sjc\.*)|(dc\.*)|(adc\.*)|(xx)|[a-zA-Z]/
  end

  @doc """
  Returns a Command list, that is split either via a regex_pattern() experession, along 
  whitespace or along a pattern defined in via divider().
  The options are: 
  :reg -> regex
  :ws -> whitespace 
  :div -> divider
  """
  @spec split(String.t(), atom()) :: [String.t()]
  def split(input, option \\ :reg) do
    case option do
      :reg -> split_reg(input)
      :ws -> split_ws(input)
      :div -> split_div(input)
      _ -> ["Error"]
    end
  end

  @doc """
  Returns a Command list, that is split along the internal Divider pattern.
  It only contains moves. No Cancels like jc, adc, xx, ...
  """
  @spec split_div(String.t()) :: list(String.t())
  def split_div(input) when is_binary(input) do
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
  Returns a Command list split via regex 
  """
  def split_reg(input) when is_binary(input) do
    Regex.split(regex_pattern(), input, on: :all, trim: true, include_captures: true)
    |> Enum.map(&String.trim(&1))
    |> Enum.filter(fn x -> String.length(x) != 0 end)
    |> Enum.map(&String.trim(&1, "."))
    |> Enum.map(&String.downcase(&1))
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
