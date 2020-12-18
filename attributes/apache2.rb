# frozen_string_literal: true

default['codenamephp']['workstation_php']['apache2']['modules'] = %w(
  headers
  deflate
  env
  filter
  macro
  remoteip
  rewrite
  ssl
)
