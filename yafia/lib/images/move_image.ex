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

  def load_move(path, x0, y0, x1, y1) when is_binary(path) do
    %Mogrify.Image{path: path, ext: "png"}
    |> custom("extract", dim(x0, x1, y0, y1) <> " " <> path <> " test.png")
    |> create(path: ".")
  end
end
