defmodule ArcsysAdditional do
  def inputs() do
  images = %{
    "j."=> {0,0,53,43},
    "j"=> {0,0,53,43},
    "jc"=> {54,0,83,43},
    "jc."=> {54,0, 83,43},
    "djc"=> { 136, 0, 120,43},
    "djc."=> { 136, 0, 120,43}
  }
  ["assets/arcsys_additional.png": images] 
  end
end
