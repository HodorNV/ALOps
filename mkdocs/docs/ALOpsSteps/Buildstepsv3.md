# Build Steps Overview

ALOps v3 introduces a new generation of build tasks that are **containerless by design**, relying on NuGet packages (notably `microsoft.dynamics.businesscentral.development.tools`) instead of Docker or BC artifact downloads. This makes pipelines faster and more portable across self-hosted and Microsoft-hosted agents alike.

Related:
[Build steps v1](Buildstepsv1.md)
[Build steps v2](Buildstepsv2.md)

## ALOps Agent Maintenance
Keep your build agents clean and lean. This task removes stale Docker resources, old BC artifact cache folders, orphaned NuGet packages, and temp files — without any dependency on BcContainerHelper.

Full Yaml Description:

!INCLUDE "ALOpsAgentMaintenance_v3.md"

### Parameters

#### dryrun
Set `dryrun: true` to preview everything that *would* be removed, without actually deleting anything. Useful for change-management reviews or first-time setup.

#### daysunused
Threshold (in days) for age-based cleanup operations. Items that have not been accessed within this period are eligible for removal. Applies to `bcartifacts`, `agenttemp`, `windowstemp`, and `packagecache`.

#### erroraction
Controls how cleanup failures affect the overall task result:
- `Error` — fails the task on any cleanup error
- `Warn` — marks the task as *SucceededWithIssues*
- `Ignore` — silently continues past failures

#### dockerimagesbyos
When `true`, removes Docker images whose OS version does not match the current host OS. This check uses direct Docker inspect calls and has **no dependency on BcContainerHelper**.

---

## ALOps App Compiler
Compile Business Central extension(s) from AL source code using the `altool.exe` compiler distributed as a NuGet package — no Docker, no BC artifacts download required.

Full Yaml Description:

!INCLUDE "ALOpsAppCompiler_v3.md"

### Parameters

#### compilation_mode
Choose between two compilation strategies:

- **Serial** — compiles one app at a time via `altool compile`. Gives full control over `alc.exe` flags (`/continuebuildonerror`, `/errorlog`, `/enableexternalrulesets`, analyzers by DLL path).
- **Parallel** — uses a three-step workflow (`altool workspace create` → `altool workspace map` → `altool workspace compile`) to compile all apps concurrently in dependency order. Some parameters only apply in one mode; see individual parameter descriptions.

#### altool_package_version
The exact version of the `microsoft.dynamics.businesscentral.development.tools` NuGet package to use. Pre-release suffixes (e.g. `-beta`) are supported. Pin to a specific version for reproducible builds; use `altool_cache_hours` to avoid re-downloading on every run.

#### auto_resolve_ms_symbols / auto_resolve_appsource_symbols
ALOpsAppCompiler@3 can automatically resolve missing symbol dependencies from public NuGet feeds:

- `auto_resolve_ms_symbols: true` — downloads Microsoft symbols from the **MSSymbols** feed (public, no PAT required by default).
- `auto_resolve_appsource_symbols: true` — downloads third-party ISV symbols from the **AppSourceSymbols** feed (matched by `appId`).

Both feeds can be overridden with `ms_symbols_feed` / `appsource_symbols_feed` and authenticated with `ms_symbols_pat` / `appsource_symbols_pat`.

#### appversiontemplate
Four-part version template applied to `app.json` before compilation. Tokens:
- `*` → current `$(Build.BuildId)`
- `?` → keep the original part
- `A` → use the corresponding part from the `application` field
- Date formats in brackets, e.g. `[YYYYMMDD]`, `[WW]` (zero-padded week)

Leave **empty** to skip version stamping entirely.

#### track_source_build_metadata
When `true`, injects build and source metadata into `app.json` (`build.url`, `build.by`, `source.commit`, `source.repositoryUrl`). **Requires `runtime >= 12.0`** — a warning is emitted and injection is skipped for older runtimes.

#### publishartifact and alc_errorlog
`publishartifact` controls whether compiled `.app` files are uploaded as pipeline artifacts. It does **not** control error log publishing.

When `alc_errorlog: true`, the error log is **always** published regardless of `publishartifact`. Set `alc_errorlog: false` (the default) to prevent error log artifacts.

---

## ALOps App Symbol
Convert compiled `.app` files into symbol-only packages using `altool CreateSymbolPackage`. Symbol packages can be distributed to partners or used as lightweight dependencies without exposing source code.

Full Yaml Description:

!INCLUDE "ALOpsAppSymbol_v3.md"

### Parameters

#### verify_symbol
When `true`, runs `altool IsSymbolOnly` on each generated package to confirm it is a valid symbol-only file. The task fails if verification does not pass.

#### app_file_filter
Glob pattern for selecting which `.app` files under `app_source_path` to process. Defaults to `*.app`.

---

## ALOps BC Replay
Run Business Central UI test recordings using [`@microsoft/bc-replay`](https://www.npmjs.com/package/@microsoft/bc-replay) and Playwright. Recordings are captured outside the pipeline and stored as `.yml` files; this task replays them against a running BC environment and publishes the results.

Full Yaml Description:

!INCLUDE "ALOpsBCReplay_v3.md"

### Parameters

#### authentication
Determines how the task authenticates against the BC web client:
- `Windows` — for on-premises or Docker environments
- `AAD` — for SaaS / cloud environments
- `UserPassword` — for basic username/password auth

#### npm_install
When `true` (default), the task automatically installs `@microsoft/bc-replay` and the required Playwright browsers before running. Set to `false` if you install the package in a prior pipeline step. Requires Node.js ≥ 16.14.0 on the agent.

#### failed_action
Controls the task outcome when one or more recordings fail:
- `Error` — fails the task
- `Warning` — succeeds with issues
- `Ignore` — succeeds silently

---

## ALOps Info
Display environment diagnostics for the current build agent and optionally enforce thresholds for free memory, free disk space, and active Docker containers. Useful as a first step in pipelines to catch resource problems early.

Full Yaml Description:

!INCLUDE "ALOpsInfo_v3.md"

### Parameters

#### freemem_threshold / freedisk_threshold
Set a minimum percentage of free memory or free disk space. Set to `0` (default) to disable the check. When the threshold is not met, the task reacts according to the corresponding `_action` parameter (`Warn` or `Error`).

#### docker_containers_action
Defines what happens when existing Docker containers are found on the agent — useful to detect leftover containers from previous runs:
- `Ignore` — no action
- `Warn` — succeeds with issues
- `Error` — fails the task

---

## ALOps Nuget Download
Download `.app` files from NuGet feeds based on a declarative `nuget.json` spec file. Supports Azure DevOps feeds, public NuGet feeds, and authenticated private feeds. Automatically resolves transitive AppSource dependencies.

Full Yaml Description:

!INCLUDE "ALOpsNugetDownload_v3.md"

### Parameters

#### nuget_spec_file
Path to the `nuget.json` file that lists feeds and package dependencies. This is the primary configuration for the task.

#### nuget_protocol_version
Force `v2` or `v3` NuGet protocol, or leave as `auto` to let the task detect the correct protocol from the feed URL and service index.

#### dependency_publisher_filter
Semicolon-separated list of publisher names to include during dependency resolution. Leave empty to allow all publishers. Set to `NONE` to skip dependency resolution entirely.

#### skip_microsoft_apps
When `true` (default), packages whose ID starts with `microsoft.` are excluded from dependency resolution to avoid redundant downloads of first-party symbols.

    
