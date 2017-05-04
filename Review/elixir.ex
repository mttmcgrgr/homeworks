
defmodule MyRange do
    def create(a, b) do
    (a..b) |> Enum.to_list
    end
end


defmodule FizzBuzz do
  def fizz_buzz(list) do
    Enum.map(list, fn el -> fizz_buzz(rem(el,3),rem(el,5), el) end)
  end

  def fizz_buzz(0,0,_), do: "Fizzbuzz"
  def fizz_buzz(0,_,_), do: "Fizz"
  def fizz_buzz(_,0,_), do: "Buzz"
  def fizz_buzz(_,_,el), do: el

end

defmodule MyList do
  def sum(list) do
    list |> Enum.reduce(fn (el, accu) -> accu + el end)
  end

  def mySelect(list, fn) do
    list |>

end
