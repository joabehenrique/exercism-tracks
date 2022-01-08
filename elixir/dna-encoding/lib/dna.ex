defmodule DNA do
  @map_code %{"65" => 0b0001, "67" => 0b0010, "71" => 0b0100, "84" => 0b1000, "32" => 0b0000}
  @map_encoded %{"1" => ?A, "2" => ?C, "4" => ?G, "8" => ?T, "0" => ?\s}

  def encode_nucleotide(code_point), do: Map.get(@map_code, Integer.to_string(code_point))

  def decode_nucleotide(encoded_code), do: Map.get(@map_encoded, Integer.to_string(encoded_code))

  def encode([]), do: <<>>
  def encode([head | tail]), do: <<encode_nucleotide(head)::4, encode(tail)::bitstring>>

  def decode(<<>>), do: []
  def decode(<<head::4, tail::bitstring>>), do: [decode_nucleotide(head) | decode(tail)]
end
