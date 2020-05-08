require 'minecraft/data/version'

module Minecraft

  # Module handling all data-gathering operations
  module Data
    require 'open-uri'
    require 'net/http'
    require 'json'

    USERS_API = 'https://api.ashcon.app/mojang/v1/user'.freeze          # https://github.com/Electroid/mojang-api
    HEADS_API = 'https://crafatar.com/avatars'.freeze                   # https://crafatar.com/
    STEVE_UUID = '8667ba71-b85a-4004-af54-457a9734eed7'.freeze          # Steve <3

    class Error < RuntimeError; end

    class << self
      attr_accessor :logger
      attr_accessor :timeout

      def log(msg)
        logger&.debug(msg)
      end

      # Just gets a URL and wraps errors in Data::Error
      def api_get(url, &block)
        Timeout.timeout(timeout || 0) do
          open(url, &block)
        end
      rescue OpenURI::HTTPError => e
        log "Failed to get url #{url}: #{e}"
        raise Error
      rescue Timeout::Error
        log "Timed out (#{timeout}) getting url #{url}"
        raise Error
      end

      def normalize_uuid(uuid)
        if uuid.is_a? UUIDTools::UUID
          uuid.to_s
        elsif uuid =~ /\A\h{8}-\h{4}-\h{4}-\h{4}-\h{12}\z/
          uuid.downcase
        elsif uuid =~ /\A(\h{8})(\h{4})(\h{4})(\h{4})(\h{12})\z/
          "#{$1}-#{$2}-#{$3}-#{$4}-#{$5}".downcase
        else
          # Validation will catch it
          uuid
        end
      end

      def username_to_uuid(username)
        api_get("#{USERS_API}/#{username}") do |io|
          JSON.parse(io.read)['uuid']
        end
      end

      def uuid_to_username(uuid)
        api_get("#{USERS_API}/#{uuid}") do |io|
          JSON.parse(io.read)['username']
        end
      end

      def name_history_of_username(username)
        api_get("#{USERS_API}/#{username}") do |io|
          JSON.parse(io.read)['username_history']
        end
      end

      def name_history_of_uuid(uuid)
        api_get("#{USERS_API}/#{uuid}") do |io|
          JSON.parse(io.read)['username_history']
        end
      end

      def head_url_of(uuid, overlay, size)
        if overlay
          "#{HEADS_API}/#{uuid}?overlay&size=#{size}"
        else
          "#{HEADS_API}/#{uuid}&size=#{size}"
        end
      end
    end
  end
end
