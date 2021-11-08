# Render System Architecture Diagrams with GitHub Actions

GitHub Actions for validating, exporting and rendering system architecture diagrams built with [Structurizr DSL](https://structurizr.org/). Find more information on our [ADE Software Project Playbook](https://staticapps.fuse.arup.com/appsgb/07260803_ADESoftwareProjectPlaybook/ade-software-project-playbook/tutorials/system-architecture.html).

## Usage

Create a new GitHub Actions workflow to automatically render system architecture diagrams when changes are pushed to the `architecture.dsl` or `workspace.json` files.

``` yml
name: Render Architecture Diagrams
on:
  push:
    paths:
      - '.architecture/architecture.dsl'
      - '.architecture/workspace.json'
jobs:
  validate:
    name: Validate Structurizr DSL Model
    runs-on: ubuntu-latest
    steps:
      - name: Checkout source code
        uses: actions/checkout@master
      - name: Validate structurizr DSL model
        uses: arup-group/action-architecture-diagrams/validate@v0.1.0
        with:
          workspace: '.architecture/architecture.dsl'
  render:
    name: Render Architecture Diagrams
    needs: validate
    runs-on: ubuntu-latest
    steps:
      - name: Checkout source code
        uses: actions/checkout@master
      - name: Export structurizr DSL model to mermaid diagrams
        uses: arup-group/action-architecture-diagrams/export@v0.1.0
        with:
          workspace: '.architecture/architecture.dsl'
      - name: Render mermaid diagrams to png images
        uses: arup-group/action-architecture-diagrams/render@v0.1.0
      - name: Show changes
        run: |
          git status
      - name: Commit rendered architecture diagrams
        run: |
          git config --local user.email "action@github.com"
          git config --local user.name "GitHub Action"
          git add .architecture/diagrams/*.png
          git commit -m "render architecture diagrams"
      - name: Push rendered architecture diagrams
        uses: ad-m/github-push-action@master
        with:
          github_token: ${{ secrets.GITHUB_TOKEN }}
```

## Keep up-to-date with GitHub Dependabot

Since [Dependabot](https://github.com/dependabot) has native GitHub Actions support, to enable it on your GitHub repo all you need to do is add the `.github/dependabot.yml` file:

``` yml
version: 2
updates:
  - package-ecosystem: "github-actions"
    directory: "/"
    schedule:
      interval: "daily"
```
