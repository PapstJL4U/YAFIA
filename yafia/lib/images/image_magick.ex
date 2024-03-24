defmodule Images.ImageMagick do
  @moduledoc """
  Functions to to crop a larger File with ImageMagick and combine multiple Images.
  Uses the 'System.cmd()' command.
  """
  import Images.MoveImage

  @spec pad(integer()) :: String.t()
  defp pad(i), do: String.pad_leading("#{i}", 4, "0")

  @doc """
  Crops an image and saves it under
  "output/yafia-'index'.png"
  """
  @spec sys_crop({{atom(), {integer(), integer(), integer(), integer()}}, integer()}) :: any()
  def sys_crop({{_, {}}, _}), do: IO.puts("Error: No valid Input")

  def sys_crop({{path, {x0, y0, xw, yh}}, index}) do
    sys_crop_p(Atom.to_string(path), x0, y0, xw, yh, index)
  end

  @spec sys_crop_p(
          path :: binary,
          x0 :: integer,
          y0 :: integer,
          w :: integer,
          h :: integer,
          index :: integer
        ) :: any()
  defp sys_crop_p(path, x0, y0, w, h, index) do
    cmd = "magick"
    subcmd = "-crop"
    input = path
    output = "output/yafia-#{pad(index)}.png"
    dim = crop_input(x0, y0, w, h)
    System.cmd(cmd, [input, subcmd, dim, output])
  end

  @doc """
  Combines all iages in the directory output
  with the file name yafia-*.png
  """
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
