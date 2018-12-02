defmodule CollegeListWeb.Router do
  use CollegeListWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", CollegeListWeb do
    pipe_through :browser

    get "/", CollegeController, :index
    resources "/colleges", CollegeController
  end

  # Other scopes may use custom stacks.
  # scope "/api", CollegeListWeb do
  #   pipe_through :api
  # end
end
