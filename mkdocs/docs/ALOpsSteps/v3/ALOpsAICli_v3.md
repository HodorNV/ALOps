```yaml
    - task: ALOpsAICli@3
      displayName: 'ALOps AI CLI'
      inputs:
        ai_tool: claude                       # Which pre-installed AI coding CLI to invoke. $(ai_tool) $(ai_tool) $(ai_tool)
        model:                                # Pass-through model name (--model / -m). Leave empty to use the CLI's built-in default. $(model) $(model) $(model)
        user_prompt:                          # The user turn. Delivered to Claude and Codex via stdin, and to Copilot via the -p argument. Must be non-empty. $(user_prompt) $(user_prompt) $(user_prompt)
        system_prompt:                        # Optional system/instructions layer. Native on Claude (--system-prompt); polyfilled via a fenced three-section wrapper for Codex and Copilot. $(system_prompt) $(system_prompt) $(system_prompt)
        api_key:                              # The credential. Maps to the tool- and mode-appropriate env var (ANTHROPIC_API_KEY / ANTHROPIC_AUTH_TOKEN / OPENAI_API_KEY / GITHUB_TOKEN / ANTHROPIC_FOUNDRY_KEY). $(api_key) $(api_key) $(api_key)
        base_url:                             # OpenAI-compatible endpoint URL. When non-empty (and foundry_resource empty), switches the step into 'openai_compat' auth mode. Must be an http(s) URL. $(base_url) $(base_url) $(base_url)
        foundry_resource:                     # Azure AI Foundry resource name (plain name only, e.g. 'ALOpsAI' — no URL, no slashes). When non-empty, switches the step into 'foundry' auth mode. Not supported for Copilot in MVP. $(foundry_resource) $(foundry_resource) $(foundry_resource)
        working_directory:                    # Directory to run the CLI in. Leave empty to use the platform's workspace directory. The step restores the previous location on exit (try/finally). $(working_directory) $(working_directory) $(working_directory)
        show_raw_output: false                # When enabled, the step prints the full raw CLI stdout inside an "AI Raw Output" log group on success. Defaults to off to keep logs compact — the parsed ai_response is still logged, and the raw transcript is always available via the ai_raw_output_path output. The group is also shown automatically when pipeline debug logging is enabled (System.Debug on Azure DevOps, RUNNER_DEBUG on GitHub Actions). On non-zero exit the raw output is always printed. $(show_raw_output) $(show_raw_output) $(show_raw_output)
        enable_ai_cli_stream: false           # When enabled, the step echoes every CLI stdout line live inside an "AI CLI stream" log group, with each event formatted by the per-tool stream formatter. Defaults to off to keep logs compact — the parsed ai_response is always logged, and the full raw transcript can be shown via show_raw_output or retrieved from ai_raw_output_path. The CLI still runs and stdout is still captured when this is off; only the live echo is suppressed. $(enable_ai_cli_stream) $(enable_ai_cli_stream) $(enable_ai_cli_stream)
```

