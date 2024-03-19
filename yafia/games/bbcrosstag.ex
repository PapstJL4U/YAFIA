defmodule BBCrossTag do
  @moduledoc """
  Defines possible inputs for GuiltyGear
  """

  def inputs() do
    Standards.inputs()
    ++ ArcsysAdditional.inputs()
    ++ BBTag.inputs()
    ++ Extras.inputs()
    ++ Complex.inputs()
  end
end
