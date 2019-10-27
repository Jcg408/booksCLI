require_relative "booksCLI/version"
require "bundler/setup"
require "httparty"

require_relative "./booksCLI/cli"
require_relative "./booksCLI/books"
require_relative "./booksCLI/googleApi"

