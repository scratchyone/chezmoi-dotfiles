{{- /* chezmoi:modify-template */ -}}
{{- $input := .chezmoi.stdin}}
{{- if (regexMatch "# === DOTFILE CONFIG START ===\\n[\\s\\S]*# === DOTFILE CONFIG END ===(\\n|$)" $input) }}
{{regexReplaceAll "# === DOTFILE CONFIG START ===\\n[\\s\\S]*# === DOTFILE CONFIG END ===(\\n|$)" $input (printf "# === DOTFILE CONFIG START ===\n%s# === DOTFILE CONFIG END ===\n" (includeTemplate "config.fish.tmpl"))}}
{{- else}}
{{$input}}
{{printf "\n# === DOTFILE CONFIG START ===\n%s# === DOTFILE CONFIG END ===\n" (includeTemplate "./config.fish.tmpl")}}
{{- end}}
