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
```

