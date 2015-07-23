module RedmineWhoiswho
  module Patches
    module UsersControllerPatch
      def self.included(base)
        base.class_eval do
          unloadable

          after_filter :save_bio, only:  [:create, :update]

          private

          def save_bio
            if @user.save && params[:user] && params[:user][:bio].present?
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

unless UsersController.included_modules.include?(RedmineWhoiswho::Patches::UsersControllerPatch)
  UsersController.send(:include, RedmineWhoiswho::Patches::UsersControllerPatch)
end
