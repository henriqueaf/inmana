defmodule Inmana.Supplies.ExpirationNotification do
  alias Inmana.Mailer
  alias Inmana.Supplies.{GetByExpiration, ExpirationEmail}

  def send do
    data = GetByExpiration.call()

    Enum.each(data, fn {email, supplies} ->
      email
      |> ExpirationEmail.create(supplies)
      |> Mailer.deliver_later!()
    end)
  end
end
