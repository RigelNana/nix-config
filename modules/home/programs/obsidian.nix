{
  config,
  pkgs,
  lib,
  ...
}:

let
  buildPlugin =
    {
      owner,
      repo,
      version,
      hash,
      zipName ? "${repo}-${version}.zip",
      pname ? repo,
    }:
    pkgs.stdenv.mkDerivation {
      inherit pname version;
      src = pkgs.fetchurl {
        url = "https://github.com/${owner}/${repo}/releases/download/${version}/${zipName}";
        inherit hash;
      };

      nativeBuildInputs = [ pkgs.unzip ];

      unpackPhase = "unzip $src -d plugin-src";
      installPhase = ''
        mkdir -p $out
        find plugin-src -name "main.js" -exec cp {} $out/ \;
        find plugin-src -name "manifest.json" -exec cp {} $out/ \;
        find plugin-src -name "styles.css" -exec cp {} $out/ \;
      '';
    };

  buildPluginFromFiles =
    {
      owner,
      repo,
      version,
      hashes,
      pname ? repo,
    }:
    pkgs.stdenv.mkDerivation {
      inherit pname version;
      phases = [ "installPhase" ];
      installPhase = ''
        mkdir -p $out
        cp ${
          pkgs.fetchurl {
            url = "https://github.com/${owner}/${repo}/releases/download/${version}/main.js";
            hash = hashes.main;
          }
        } $out/main.js

        cp ${
          pkgs.fetchurl {
            url = "https://github.com/${owner}/${repo}/releases/download/${version}/manifest.json";
            hash = hashes.manifest;
          }
        } $out/manifest.json

        ${lib.optionalString (hashes ? css) ''
          cp ${
            pkgs.fetchurl {
              url = "https://github.com/${owner}/${repo}/releases/download/${version}/styles.css";
              hash = hashes.css;
            }
          } $out/styles.css
        ''}
      '';
    };

  plugins = {
    admonition = buildPlugin {
      owner = "javalent";
      repo = "admonitions";
      version = "10.3.2";
      zipName = "obsidian-admonition-10.3.2.zip";
      hash = "sha256-BHh6g7wID5u3EEZDjhn6BjE6AzqIH7PcAS04dGzbFWU=";
    };

    advanced-tables = buildPlugin {
      owner = "tgrosinger";
      repo = "advanced-tables-obsidian";
      version = "0.22.1";
      zipName = "table-editor-obsidian-0.22.1.zip";
      hash = "sha256-W+uyUj4JwPGLWFGbppdrYqF5/640ceqqwCsz9IHNHLw=";
    };
    better-word-count = buildPlugin {
      owner = "lukeleppan";
      repo = "better-word-count";
      zipName = "better-word-count-0.10.1.zip";
      version = "0.10.1";
      hash = "sha256-Lvj6jOZOsXhae92Y0hhlPjuAlDD7ismG0YhlqGbyT5E";
    };

    editing-toolbar = buildPlugin {
      owner = "PKM-er";
      repo = "obsidian-editing-toolbar";
      zipName = "editing-toolbar.zip";
      version = "3.1.18";
      hash = "sha256-4mSDdrxnmLwZnPjiqh+Zss2xroChvFlRTGlrLNTIUfI=";
    };

    git = buildPlugin {
      owner = "Vinzent03";
      repo = "obsidian-git";
      version = "2.35.2";
      hash = "sha256-oe0vUX/MsW3UOyT6GK+WkQKqX/iiEEYG/klQcao9/4Q=";
    };

    omnisearch = buildPlugin {
      owner = "scambier";
      repo = "obsidian-omnisearch";
      zipName = "omnisearch-1.28.0.zip";
      version = "1.28.0";
      hash = "sha256-xIWNd5bk28lhcYx8RaLCyINkbBsxopDLql9iy0TexP8=";
    };
    pdf-plus-plus = buildPluginFromFiles {
      owner = "RyotaUshio";
      repo = "obsidian-pdf-plus";
      version = "0.40.31";
      hashes = {
        main = "sha256-P9OVygFf+BLfikjnXaDsenq1pvWUBtN1RwiYsfcqrJM=";
        manifest = "sha256-3KUBZbdDFs2yt2ySCEN0mXvnlJ0hazHvzswrgv9KCGw=";
        css = "sha256-TZRNbqeqWB/c2DZ8nYqwnzfFqMWU4zZUd5X3ny7eQGY=";
      };
    };
    recent-files = buildPluginFromFiles {
      owner = "tgrosinger";
      repo = "recent-files-obsidian";
      version = "1.7.5";
      hashes = {
        main = "sha256-EbREF77MlQP8hpngoPVtIIlTe9DCaB3p70K/THuFK2o=";
        manifest = "sha256-wy+fpKFkMzuTsuQVE0ncHk34JZRiJ+MZXEvL2cSyMl0=";
        css = "sha256-LuSckqsLuEgiGglib3umdrvoU3LEyAZe53kLCDLLPds=";
      };
    };
    tasks = buildPlugin {
      owner = "obsidian-tasks-group";
      repo = "obsidian-tasks";
      version = "7.22.0";
      hash = "sha256-sXO2ZQCKoXjNkj44AMRUQ8lDsgm7qbwrEW8vIYlsaTc=";
    };
    terminal = buildPluginFromFiles {
      owner = "polyipseity";
      repo = "obsidian-terminal";
      version = "3.20.0";
      hashes = {
        main = "sha256-s1sLCVlzX/2IsLESF/GdFgBbQnJmyYbD25jAdNwN7Zk=";
        manifest = "sha256-IQ5tkBYRw8K3g3EnBnE1fNdSEdpLhAoZSQhbfXgFf5s=";
        css = "sha256-J9U7w2XyKZ6A89N79Uy0XthQPoARavIxfXmmTlnlnHw=";
      };
    };
  };

  minimalTheme = pkgs.stdenv.mkDerivation {
    pname = "obsidian-minimal";
    version = "8.1.2";
    src = pkgs.fetchFromGitHub {
      owner = "kepano";
      repo = "obsidian-minimal";
      rev = "8.1.2";
      hash = "sha256-vm0knDRafNXtrwkwzeyB/y/uuXZ39FVUgOCusIgMS6g=";
    };
    installPhase = "mkdir -p $out; cp theme.css manifest.json $out/";
  };
in
{
  programs.obsidian = {
    enable = true;
    vaults.core = {
      target = "obsidian"; # 建议使用相对路径，Home Manager 会自动处理为 ~/obsidian
      settings = {
        # --- 基础设置 ---
        app = {
          showLineNumber = true;
          useTab = true;
          tabSize = 4;
          readableLineLength = true;
          livePreview = true;
          defaultViewMode = "preview";
          focusNewTab = true;
          strictLineBreaks = false;
          autoPairBrackets = true;
          autoPairMarkdown = true;
          smartIndentList = true;
          autoConvertHtml = true;
          foldHeading = true;
          foldIndent = true;
          newFileLocation = "current";
          newLinkFormat = "shortest";
          useMarkdownLinks = false;
          alwaysUpdateLinks = true;
          spellcheck = true;
          vimMode = false;
          promptDelete = false;
          trashOption = "local";
          showUnsupportedFiles = true;
        };

        appearance = {
          theme = "light";
          baseFontSize = 16;
          textFontFamily = "Source Han Sans SC";
          monospaceFontFamily = "Source Code Pro";
          showViewHeader = true;
          showRibbon = true;
          nativeMenus = false;
          translucency = true;
        };

        # --- 主题 ---
        themes = [
          {
            pkg = minimalTheme;
            enable = true;
          }
        ];

        # --- 核心插件 ---
        corePlugins = [
          { name = "file-explorer"; }
          { name = "global-search"; }
          { name = "graph"; }
          { name = "workspaces"; }
          {
            name = "backlink";
            settings = {
              backlinkInDocument = true;
            };
          }
          { name = "canvas"; }
          {
            name = "daily-notes";
            settings = {
              folder = "01 - Personal/Diario";
            };
          }
          { name = "command-palette"; }
          { name = "file-recovery"; }
          { name = "word-count"; }
          { name = "outline"; }
          { name = "properties"; }
        ];

        # --- 社区插件 ---
        communityPlugins = [
          {
            pkg = plugins.admonition;
            settings = { };
          }
          {
            pkg = plugins.advanced-tables;
            settings = { };
          }
          {
            pkg = plugins.better-word-count;
            settings = { };
          }

          {
            pkg = plugins.editing-toolbar;
            settings = { };
          }

          {
            pkg = plugins.git;
            settings = {
              autoSaveInterval = 5;
            };
          }

          {
            pkg = plugins.omnisearch;
            settings = { };
          }
          {
            pkg = plugins.pdf-plus-plus;
            settings = { };
          }
          {
            pkg = plugins.recent-files;
            settings = { };
          }
          {
            pkg = plugins.tasks;
            settings = { };
          }
          {
            pkg = plugins.terminal;
            settings = { };
          }
        ];

        # --- 快捷键 ---
        hotkeys = {
          "command-palette:open" = [
            {
              modifiers = [
                "Mod"
                "Shift"
              ];
              key = "P";
            }
          ];
          "workspaces:open-modal" = [
            {
              modifiers = [
                "Mod"
                "Shift"
              ];
              key = "L";
            }
          ];
        };
      };
    };
  };
}
