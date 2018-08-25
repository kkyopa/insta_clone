module TuitaHelper
    def choose_new_or_edit
    if action_name == 'new' || action_name == 'confirm'
      confirm_tuita_path
    elsif action_name == 'edit'
      tuitum_path
    end
    end
end

