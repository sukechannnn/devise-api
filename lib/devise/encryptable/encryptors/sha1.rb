require 'digest/sha1'

module Devise
  module Encryptable
    module Encryptors
      class Sha1 < Base
        def self.digest(password, _stretches, _salt, _pepper)
          Digest::SHA1.hexdigest(password)
        end
      end
    end
  end
end
