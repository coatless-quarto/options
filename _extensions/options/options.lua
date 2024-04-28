-- Check if variable missing or an empty string
local function isVariableEmpty(s)
  return s == nil or s == ''
end

-- Check if variable is present
local function isVariablePopulated(s)
  return not isVariableEmpty(s)
end

-- Check whether an argument is present in kwargs
-- If it is, return the value
local function tryOption(options, key)

  -- Protect against an empty options
  if not (options and options[key]) then
      return nil
  end

  -- Retrieve the option
  local option_value = pandoc.utils.stringify(options[key])
  -- Verify the option's value exists, return value otherwise nil.
  if isVariablePopulated(option_value) then
      return option_value
  else
      return nil
  end
end

-- Retrieve the option value or use the default value
local function getOption(options, key, default)
  return tryOption(options, key) or default
end

return {
  ['tryOption'] = tryOption,
  ['getOption'] = getOption
}
