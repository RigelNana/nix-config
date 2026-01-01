{ config, pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    profiles.default = {
      extensions = with pkgs.nix-vscode-extensions.vscode-marketplace-release; [
        github.copilot
        github.copilot-chat
        ms-ceintl.vscode-language-pack-zh-hans
        catppuccin.catppuccin-vsc
        catppuccin.catppuccin-vsc-icons
        ms-python.python
        llvm-vs-code-extensions.vscode-clangd
        ms-azuretools.vscode-containers
        fill-labs.dependi
        ms-vscode-remote.remote-containers
        ms-azuretools.vscode-docker
        usernamehw.errorlens
        tamasfe.even-better-toml
        mhutchie.git-graph
        donjayamanne.githistory
        github.vscode-github-actions
        golang.go
        ms-kubernetes-tools.vscode-kubernetes-tools
        yzhang.markdown-all-in-one
        shd101wyy.markdown-preview-enhanced
        bierner.markdown-mermaid
        unifiedjs.vscode-mdx
        oxc.oxc-vscode
        yoavbls.pretty-ts-errors
        ms-python.vscode-pylance
        ms-python.debugpy
        ms-vscode-remote.remote-ssh
        ms-vscode-remote.remote-ssh-edit
        ms-vscode.remote-server
        ms-vscode.remote-explorer
        charliermarsh.ruff
        rust-lang.rust-analyzer
        svelte.svelte-vscode
        myriad-dreamin.tinymist
        redhat.vscode-yaml
        jnoortheen.nix-ide
        mkhl.direnv
        christian-kohler.path-intellisense
        ms-toolsai.jupyter
      ];
      userSettings = {
        "workbench.colorTheme" = "Catppuccin Macchiato";
        "workbench.iconTheme" = "Catppuccin-Macchiato";
        "telemetry.enableTelemetry" = false;
        "telemetry.enableCrashReporter" = false;
        "editor.fontFamily" = "Maple Mono NF CN, monospace";
        "terminal.integrated.fontFamily" = "Maple Mono NF CN";
        "editor.fontSize" = 18;
        "editor.lineHeight" = 28;
        "editor.fontLigatures" = true;
        "editor.tabSize" = 4;
        "files.autoSave" = "afterDelay";
        "files.autoSaveDelay" = 1000;
        "clangd.arguments" = [
          "--query-driver=${pkgs.clang}/bin/clang++"
        ];
        "clangd.path" = "${pkgs.clang-tools}/bin/clangd";
        "nix.enableLanguageServer" = true;
        "nix.serverPath" = "nixd";
        "nix.formatterPath" = "nixfmt";
        "github.copilot.nextEditSuggestions.enabled" = true;
      };
    };
  };

  programs.emacs.enable = true;
  programs.neovide.enable = true;

  # programs.obsidian = {
  #   enable = true;
  #   vaults."mydoc" = {
  #     enable = true;
  #     target = "obsidian";
  #   };
  # };
}