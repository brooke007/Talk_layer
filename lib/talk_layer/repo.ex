defmodule TalkLayer.Repo do
  use Ecto.Repo,
    otp_app: :talk_layer,
    adapter: Ecto.Adapters.Postgres
end
