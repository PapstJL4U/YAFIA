defmodule DragonballFighterz do
  @moduledoc """
  Defines possible inputs for DragonballFighterz - unfinished. 
  """

  def inputs() do
    Standards.inputs()
    ++ ArcsysAdditional.inputs()
    ++ Extras.inputs()
    ++ Complex.inputs()
  end
end
