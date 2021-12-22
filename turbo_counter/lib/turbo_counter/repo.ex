defmodule TurboCounter.Repo do
  use Ecto.Repo,
    otp_app: :turbo_counter,
    adapter: Ecto.Adapters.Postgres
end
