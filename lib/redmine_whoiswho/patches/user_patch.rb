module RedmineWhoiswho
  module Patches
    module UserPatch
      def self.included(base)
        base.class_eval do
          unloadable

          has_one :bio

        end
      end
    end
  end
end

unless User.included_modules.include?(RedmineWhoiswho::Patches::UserPatch)
  User.send(:include, RedmineWhoiswho::Patches::UserPatch)
end
