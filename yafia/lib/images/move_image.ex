defmodule Images.MoveImage do
  @moduledoc """
  Loads parts of an image.
  This part defined by a square is part of the whole image, but
  represents a single input like DP, HCF, downforward, -> 
  """

  import Mogrify

  defp dim(x0, x1, y0, y1) do
    "#{x1 - x0}" <> "x" <> "#{y1 - y0}" <> "+" <> to_string(x0) <> "+" <> to_string(y0)
  end

  @doc """
  x0 = x origin
  y0 = y origin
  xw = width
  yh = heigth
  """
  def load_move(path, x0, y0, w, h) when is_binary(path) do
    Mogrify.open(path)
    |> custom(
      "crop",
      crop_input(path, x0, y0, w, h) <> " test.png"
    )
    |> save
  end

  def crop_input(path, x0, y0, w, h) when is_binary(path) do
    "#{w}x#{h}" <> "+#{x0}+#{y0}"
  end
end
