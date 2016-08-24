ReturnValue = require 'nanocyte-component-return-value'
TemplateJson = require '../src/template-json'

describe 'TemplateJson', ->
  beforeEach ->
    @sut = new TemplateJson

  it 'should exist', ->
    expect(@sut).to.be.an.instanceOf ReturnValue

  describe '->onEnvelope', ->
    describe 'when called with a valid templateJson', ->
      beforeEach ->
        @response =
          it: 'works!'
        @envelope =
          config:
            templateJson: '{"it":"works!"}'
          message: "somethingElse"

      it 'should return the message with the key assigned', ->
        expect(@sut.onEnvelope(@envelope)).to.deep.equal @response

    describe 'when called with an invalid templateJson', ->
      beforeEach ->
        @response =
          it: 'works!'
        @envelope =
          config:
            templateJson: '{it:"works!"}'
          message: "somethingElse"

      it 'should return the message with the key assigned', ->
        expect(=> @sut.onEnvelope(@envelope)).to.throw
