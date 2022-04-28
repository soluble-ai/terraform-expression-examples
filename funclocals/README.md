Spotty support for string functions.  The variations of the assignment to `env_base` should all fail:

* `env_base = split("-", env)[0]`
* `env_base = regex("^[^-]+", var.env)`
* `env_base = substr(var.env, 0, 3)`
* `env_base = regex("(...)", var.env)`
* `env_base = replace(var.env, "-1000", "")`