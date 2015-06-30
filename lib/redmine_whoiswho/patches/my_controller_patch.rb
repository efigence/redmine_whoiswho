module RedmineWhoiswho
  module Patches
    module MyControllerPatch
      def self.included(base)
        base.class_eval do
          unloadable

          def account
            @user = User.current
            @pref = @user.pref
            @bio = @user.bio
            if request.post?
              @user.safe_attributes = params[:user] if params[:user]
              @user.pref.attributes = params[:pref] if params[:pref]
              @bio.safe_attributes = params[:bio] if params[:bio]
              if @user.save && @bio.save
                @user.pref.save
                set_language_if_valid @user.language
                flash[:notice] = l(:notice_account_updated)
                redirect_to my_account_path
                return
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
