session_root "~/.config/nvim"
if initialize_session "nvimcfg"; then
  load_window "nvim"
fi
finalize_and_go_to_session
