defmodule CollegeList.Repo do
  use Ecto.Repo,
    otp_app: :college_list,
    adapter: Ecto.Adapters.Postgres
end
