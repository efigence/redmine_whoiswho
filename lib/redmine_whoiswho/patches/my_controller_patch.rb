module RedmineWhoiswho
  module Patches
    module MyControllerPatch
      def self.included(base)
        base.class_eval do
          unloadable

          after_filter :save_bio

          private

          def save_bio
            if request.post?
              if params[:user] && params[:user][:bio].present?
                bio = @user.bio || @user.build_bio
                bio.safe_attributes = params[:user][:bio]
                bio.remove_image = params[:user][:bio][:remove_image]
                unless bio.save
                  flash[:error] = 'Bio cannot be saved.'
                end
              end
            end
          end

        end
      end
    end
  end
end

unless MyController.included_modules.include?(RedmineWhoiswho::Patches::MyControllerPatch)
  MyController.send(:include, RedmineWhoiswho::Patches::MyControllerPatch)
end
