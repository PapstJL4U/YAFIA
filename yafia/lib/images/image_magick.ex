defmodule Images.ImageMagick do
  import Images.MoveImage

  @spec pad(integer()) :: String.t()
  defp pad(i), do: String.pad_leading("#{i}", 4, "0")

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
    output = "output/yafia-#{pad(index)}.png"
    dim = crop_input(x0, y0, w, h)
    System.cmd(cmd, [input, subcmd, dim, output])
  end

  @spec combine() :: any()
  def combine() do
    cmd = "magick"
    subcmd = "+append"
    input = "output/yafia-*.png"
    output = "output/yafia-combine.png"
    options = ["-gravity", "center", "-background", "none"]

    System.cmd(
      cmd,
      List.flatten([
        input,
        options,
        subcmd,
        output
      ])
    )
  end
end
