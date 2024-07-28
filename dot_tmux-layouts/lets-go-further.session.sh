session_root "~/repos/ps/lets-go-further/src/greenlight"

if initialize_session "lets-go-further"; then

  new_window "nvim"
  run_cmd "nvim"
  split_h 20
  run_cmd "GREENLIGHT_DB_DSN='postgres://greenlight:pa55word@localhost/greenlight?sslmode=disable' air --build.cmd \"go build -o bin/greenlight ./cmd/api\" --build.bin \"./bin/greenlight\""
  split_v 50
  select_pane 0
fi

finalize_and_go_to_session
