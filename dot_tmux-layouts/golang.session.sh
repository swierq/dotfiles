session_root "~/repos/gh/swierq/golang"

if initialize_session "golang"; then

  new_window "nvim"
  run_cmd "nvim"
  split_h 20
  run_cmd "pwd"
  split_v 50
  select_pane 1
fi

finalize_and_go_to_session
