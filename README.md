# options: A Quarto Developer Extension for Working With Option Data

The `options` Quarto extension allows developers to craft options that incorporate default parameters.

## Usage

The `options` extension does not introduce significant enhancements to your document's content. Instead, it serves as a way for authors to quickly bootstrap their own custom code cell through an [extension embedding](https://quarto.org/docs/journals/formats.html#extension-embedding).

## Installation

To install the `options` extension inside of your own extension, follow these steps:

1. Open your terminal.

2. Navigate to where your own extension's development location is.

3. Execute the following command:

```sh
quarto add coatless-quarto/options --embed <your-extension-name>
```

This command will download and install the extension under the `_extensions` subdirectory of your Quarto extension project. If you are using version control, ensure that you include this directory in your repository.

### File structure

When embedding the extension inside of your own extension, you should see the following folder structure:

```sh
.
└── _extensions
    └── <your-extension-name>
        └── _extensions
            └── coatless-quarto
                └── options

```

### Registering the extension

Inside of the `_extension.yml`, please include the nested extension under `filters` as the first extension to run: 

```
title: My Extension
author: My Name
version: 0.1.1
quarto-required: ">=1.4.549"
contributes:
  format:
    common:
      filters:
        - coatless-quarto/options 
        - <your-extension>.lua
```

## Retrieving Options

Inside of the Lua filter, this extension can be used to setup:

```lua
-- Store function calls in a table value
local options = require("_extensions.coatless-quarto.options.options")

-- Attempt to retrieve option
-- If it fails, we default to return `nil`.
local my_option_attempt = options.tryOption(options, key)

-- Retrieve option if present, otherwise use default
local my_option = options.getOption(options, key, default)
```
