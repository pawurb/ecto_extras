# Ecto Extras [![Hex.pm](https://img.shields.io/hexpm/v/ecto_extras.svg)](https://hex.pm/packages/ecto_extras) [![Hex.pm](https://img.shields.io/hexpm/l/ecto_extras.svg)](https://github.com/pawurb/ecto_extras/blob/master/LICENSE) [![CI](https://github.com/pawurb/ecto_extras/workflows/CI/badge.svg)](https://github.com/pawurb/ecto_extras/actions)

A set of helper functions for `Ecto.Repo` and `Ecto.Query`

### `Ecto.Repo` helpers

`first` `first!` `last` `last!` `count` `min` `max` `avg` `sum`

Setup:

```elixir
defmodule YourApp.Repo do
  use EctoExtras.Repo
  # ...
end
```

Example usage:

```elixir

Repo.count(User)

# instead of

Repo.one(from u in User, select: count(u.id))
```

### `Ecto.Query` helpers

`lower` `upper`

Example usage:

```elixir

import EctoExtras.Query

Repo.one(from u in User, where: lower(u.email) == "email@example.com")

# instead of

Repo.one(from u in User, where: fragment("lower(?)", u.email) == "email@example.com")

```
