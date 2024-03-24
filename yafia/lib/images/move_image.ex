defmodule Images.MoveImage do
  @moduledoc """
  Loads parts of an image.
  This part, defined by a square, is part of the whole image, but
  represents a single input like DP, HCF, downforward, -> 
  """

  import Mogrify

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
      crop_input(x0, y0, w, h) <> " output/test.png"
    )
    |> create(path: ".")
  end

  @doc """
   x0 = x origin
   y0 = y origin
   xw = width
   yh = heigth
  """
  @spec crop_input(integer(), integer(), integer(), integer()) :: String.t()
  def crop_input(x0, y0, w, h) do
    "#{w}x#{h}" <> "+#{x0}+#{y0}"
  end
end
