module RedmineWhoiswho
  module Patches
    module UserPatch
      def self.included(base)
        base.class_eval do
          unloadable

          has_one :bio

          def has_access?
            !(user_ids & groups_with_access).blank?
          end

          def user_ids
            User.current.groups.select('id').collect{|el| el.id.to_s}
          end

          def groups_with_access
            Setting.plugin_redmine_whoiswho["groups"] || []
          end

        end
      end
    end
  end
end

unless User.included_modules.include?(RedmineWhoiswho::Patches::UserPatch)
  User.send(:include, RedmineWhoiswho::Patches::UserPatch)
end
