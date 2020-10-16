module PcsHelper
    def button_text
        if action_name == "new"
          "登録"
        elsif action_name == "edit"
          "更新"
        end
    end    
end
