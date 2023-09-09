defmodule ExHtmx.HTMLTemplate do
  import EEx

  @doc """
  The first argument to render is the view_path where you can pass a path up to lib/templates/

  > This method will wrap your render into lib/templates/application.html.eex to be able to insert the whole HTML.

  ## For example:

    ExHtmx.HTMLTemplate.render_file("repository/show.html.eex") #= This will be used as lib/templates/repository/show.html.eex
  """
  @spec render_file(String.t(), map()) :: String.t()
  def render_file(view_path, assigns \\ []) do
    template_content = eval_file("lib/templates/" <> view_path, assigns: assigns)

    eval_file("lib/templates/application.html.eex", assigns: [content: template_content])
  end

  
  @spec render_string(String.t(), map()) :: String.t()
  def render_string(view_content, assigns \\ []), do: eval_string(view_content, assigns: assigns)
end
