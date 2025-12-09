# ALOps Documentation System - AI Agent Instructions

## Project Overview
This is the ALOps documentation repository - a **MkDocs-based documentation system** that generates the official ALOps documentation website at docs.alops.be. ALOps is an Azure DevOps extension providing 50+ build tasks for Microsoft Dynamics 365 Business Central AL extension development.

## Core Architecture - MkDocs Documentation System

### Documentation Structure (`/mkdocs/`)
- **`mkdocs.yml`**: Main configuration with Material theme and navigation structure
- **`docs/`**: All documentation content in Markdown format
- **`azure-pipelines.yml`**: Automated documentation build and deployment pipeline

### Dynamic Content Generation Pattern
The build system uses a unique **`!INCLUDE` preprocessing pattern**:
```markdown
# In Buildstepsv1.md
!INCLUDE "ALOpsAppCompiler_v1.md"
```
- Pipeline script replaces `!INCLUDE` statements with actual task definition content
- Task definitions in `/mkdocs/docs/ALOpsSteps/v1/` and `/v2/` folders
- Enables single-source-of-truth for task parameters while maintaining readable documentation

### Task Documentation Architecture
```
mkdocs/docs/ALOpsSteps/
├── Buildstepsv1.md          # Overview with !INCLUDE references
├── Buildstepsv2.md          # V2 compiler docs
├── v1/                      # Individual task definitions
│   ├── ALOpsAppCompiler_v1.md
│   ├── ALOpsDockerStart_v1.md
│   └── [30+ other tasks]
└── v2/                      # V2 task definitions
    ├── ALOpsAppCompiler_v2.md
    └── ALOpsPackageImport_v2.md
```

## Critical Documentation Patterns

### Task Definition Format
Each task file follows this YAML-in-Markdown pattern:
````markdown
```yaml
    - task: ALOpsAppCompiler@2
      displayName: 'ALOps App Compiler'
      inputs:
        artifacttype: OnPrem                  # Set Artifact Type. $(artifacttype)
        versionselect: Latest                 # Version selection. $(versionselect)
        # ... all parameters with descriptions
```
````

### Navigation Structure (`mkdocs.yml`)
- Material theme with dark/light mode toggle
- Hierarchical navigation: Setup → Build steps → Useful Information → Help
- Auto-generated task references via `!INCLUDE` system
- Search integration with custom separators

### Content Organization
- **Setup**: Getting started guides (`Setup/`)
- **Build Steps**: Task reference documentation (`ALOpsSteps/`)
- **Useful Information**: Advanced topics (`UsefulInfo/`)
- **Help**: Troubleshooting and Q&A (`Help/`)

## Development Workflows

### Adding New Task Documentation
1. Create task definition file in `/mkdocs/docs/ALOpsSteps/v1/` or `/v2/`
2. Add `!INCLUDE "TaskName_v1.md"` reference in appropriate overview file
3. Update navigation in `mkdocs.yml` if needed
4. Task parameters follow format: `parameter: value # Description. $(parameter)`

### Documentation Build Process
```yaml
# azure-pipelines.yml process:
1. Scan all task definition files in ALOpsSteps/v*/
2. Replace !INCLUDE statements with file contents
3. Run mkdocs build --site-dir "$(System.ArtifactsDirectory)"
4. Deploy to docs.alops.be (master) or dev.docs.alops.be (other branches)
```

### Local Development
```bash
cd mkdocs/
mkdocs serve  # Live preview at http://127.0.0.1:8000
```

## Essential File Locations

### Core Documentation Files
- **`/mkdocs/docs/index.md`**: Homepage with getting started links
- **`/mkdocs/docs/ALOpsSteps/Buildstepsv1.md`**: Main task reference (564 lines)
- **`/mkdocs/docs/UsefulInfo/Globals.md`**: Global variables documentation
- **`/mkdocs/mkdocs.yml`**: Site configuration and navigation

### Task Categories (50+ tasks across)
- **v1 tasks**: Legacy Docker-based tasks in `/v1/` folder
- **v2 tasks**: Modern containerless tasks in `/v2/` folder
- **Key tasks**: AppCompiler@2, DockerCreate@1, ExtensionAPI@1, AppSign@1

## Documentation Conventions

### Parameter Documentation Format
- Use `$(parameter)` suffix for variable reference
- Include type hints and examples in descriptions
- Maintain alphabetical ordering within logical groups
- Use `# Description. $(parameter)` comment pattern

### Cross-References
- Use relative paths: `[Build steps v2](Buildstepsv2.md)`
- Reference examples: `Examples/03_UseDocker_Compile.yml`
- Link to external resources for setup guides

### Content Structure Rules
- Start with overview paragraph explaining purpose
- Include "Full Yaml Description" with !INCLUDE reference
- Add practical examples and scenarios
- End with related tasks or next steps

## Common Pitfalls
- Don't edit the generated site files - edit source markdown in `/docs/`
- Remember `!INCLUDE` preprocessing happens during build
- Navigation changes require `mkdocs.yml` updates
- Parameter format must match `$(parameter)` pattern for variable substitution
