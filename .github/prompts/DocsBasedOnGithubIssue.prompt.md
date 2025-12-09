# ALOps Documentation Generator from GitHub Issues

## Instructions
Analyze the GitHub issue at: **{GITHUB_ISSUE_URL}** and generate comprehensive ALOps documentation based on the content.

## Focus Areas
1. **ALOps Task Parameters**: Identify and document relevant ALOps task parameters mentioned in the issue
2. **Configuration Setup**: Provide clear setup instructions for implementing the solution in ALOps pipelines
3. **Best Practices**: Extract and document best practices, tips, and recommendations
4. **Error Resolution**: If the issue discusses problems, document how to resolve them using ALOps

## Content Guidelines

### What to Include:
- **Task Configuration**: YAML examples showing proper ALOps task setup
- **Parameter Explanations**: Clear descriptions of relevant parameters and their values
- **Step-by-Step Instructions**: Logical sequence for implementing the solution
- **Common Scenarios**: Different use cases and their configurations
- **Troubleshooting Tips**: How to avoid or resolve common issues
- **Security Considerations**: Best practices for handling sensitive data (certificates, passwords, etc.)

### What to Exclude:
- PowerShell scripts or complex code blocks (unless ALOps-specific)
- Generic Azure DevOps configuration not related to ALOps
- Detailed explanations of non-ALOps concepts
- Duplicate information already well-documented elsewhere
- Include a reference to the original GitHub issue for context

## Output Requirements

### Documentation Structure:
Follow the ALOps documentation patterns from `/mkdocs/docs/`:
```markdown
# Title

Brief overview explaining the purpose and context.

## Setup Instructions

### Prerequisites
- List any requirements

### Configuration
```yaml
- task: ALOpsTaskName@1
  displayName: 'Task Description'
  inputs:
    parameter1: value1          # Description. $(parameter1)
    parameter2: value2          # Description. $(parameter2)
```

### Parameters Explained
- **parameter1**: Detailed explanation of the parameter and its usage
- **parameter2**: Detailed explanation of the parameter and its usage

## Examples

### Basic Example
```yaml
# Provide a simple, working example
```

### Advanced Example  
```yaml
# Provide a more complex scenario if applicable
```

## Best Practices
- List key recommendations
- Security considerations
- Common pitfalls to avoid

## Troubleshooting
- Common issues and their solutions
- Error messages and how to resolve them
```

### File Locations:
- **Primary Documentation**: Create or update files in `/mkdocs/docs/ALOpsSteps/` or `/mkdocs/docs/UsefulInfo/`
- **Examples**: Add practical YAML examples to `/Examples/` folder if applicable
- **Navigation**: Update `/mkdocs/mkdocs.yml` if adding new documentation pages

## ALOps Task Context
When documenting ALOps tasks, reference these key areas:

### App Signing (ALOpsAppSign@1):
- **PFX Method**: Traditional certificate file signing
- **HSM Method**: Modern Hardware Security Module signing (Azure Key Vault, Trusted Signing)
- **Parameters**: `signmethod`, `pfx_path`, `pfx_password`, `hsm_*` parameters
- **Security**: Proper handling of certificates and secrets

### Common Tasks:
- **ALOpsAppCompiler@1/2**: App compilation
- **ALOpsAppPublish@1**: App publishing 
- **ALOpsDockerStart@1**: Container management
- **ALOpsExtensionAPI@1**: SaaS extension management
- **ALOpsAppValidation@1**: AppSource validation

## Quality Criteria
- Documentation should be **actionable** and **practical**
- Include **working YAML examples** that users can copy-paste
- Explain **why** certain configurations are recommended, not just **how**
- Follow ALOps documentation conventions with parameter format: `$(parameter)`
- Ensure compatibility with both v1 and v2 tasks where applicable

## Variables and Placeholders
Use these patterns for consistency:
- Pipeline variables: `$(VariableName)`
- Placeholder values: `<YourValue>` or `[YourValue]`
- Environment-specific: `$(azure_tenant_id)`, `$(Build.ArtifactStagingDirectory)`