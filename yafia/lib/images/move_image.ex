defmodule Images.MoveImage do
  @moduledoc """
  Loads parts of an image.
  This part defined by a square is part of the whole image, but
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

  @spec sys_crop({integer(), atom(), {integer(), integer(), integer(), integer()}}) :: any()
  def sys_crop({index, path_as_atom, {x0, y0, xw, yh}}) do
    sys_crop_p(Atom.to_string(path_as_atom), x0, y0, xw, yh, index)
  end

  @spec sys_crop_p(
          path :: binary,
          x0 :: integer,
          y0 :: integer,
          w :: integer,
          h :: integer,
          index :: integer
        ) :: any()
  defp sys_crop_p(path, x0, y0, w, h, index) when is_binary(path) do
    cmd = "magick"
    subcmd = "-crop"
    input = path
    output = "output/#{index}.png"
    dim = crop_input(x0, y0, w, h)
    System.cmd(cmd, [input, subcmd, dim, output])
  end
end
