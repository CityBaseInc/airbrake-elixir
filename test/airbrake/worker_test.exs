defmodule Airbrake.WorkerTest do
  use ExUnit.Case

  describe "remember/2" do
    test "exception" do
    end

    test "keyword list?" do
    end

    test "timeout" do
      # this is a very crude approximation of the error that causes Airbrake.Worker.remember/2 to crash (and generates its own
      # Airbrake report!)
      exception = {
        :timeout,
        {
          GenServer,
          :call,
          [SomeServer, {:request, "some.topic", %{user: %{fname: "foo", lname: "bar"}}}, 5000]
        }
      }

      # no pattern matching is done on this, so it should be okay to leave empty
      options = []

      assert Airbrake.Worker.remember(exception, options) == :ok
    end
  end
end
