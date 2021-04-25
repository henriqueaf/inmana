# Configure ExMachina to be used on tests
{:ok, _} = Application.ensure_all_started(:ex_machina)

ExUnit.start()
Ecto.Adapters.SQL.Sandbox.mode(Inmana.Repo, :manual)
