ReturnValue = require 'nanocyte-component-return-value'

class TemplateJson extends ReturnValue
  onEnvelope: (envelope) =>
    {config} = envelope
    {templateJson} = config
    message = JSON.parse templateJson
    return message

module.exports = TemplateJson
